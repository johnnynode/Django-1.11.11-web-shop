from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.core.urlresolvers import reverse
from django.core.paginator import Paginator

from common.models import Users,Types,Goods,Orders,Detail

# 公共信息加载函数
def loadinfo(request):
    lists = Types.objects.filter(pid=0)
    context = {'typelist':lists}
    return context

def  viporders(request):
    '''浏览订单信息'''
    context = loadinfo(request)
    #获取当前登录者的订单信息
    odlist = Orders.objects.filter(uid=request.session['vipuser']['id'])
    #遍历订单信息，查询对应的详情信息
    for od in odlist:
        delist = Detail.objects.filter(orderid=od.id)
        #遍历订单详情，并且获取对应的商品信息（图片）
        for og in delist:
            og.picname = Goods.objects.only("picname").get(id=og.goodsid).picname
        #将dellist订单详情以detaillist名放入到订单中
        od.detaillist = delist

    context['orderslist'] = odlist
    return render(request,"web/viporders.html",context)

def odstate(request):
    ''' 修改订单状态 '''
    try:
        oid = request.GET.get("oid",'0')
        ob = Orders.objects.get(id=oid)
        ob.state = request.GET['state']
        ob.save()
        return redirect(reverse('vip_orders'))
    except Exception as err:
        print(err)
        return HttpResponse("订单处理失败！")

def info(request):
    ''' 个人中心 个人信息 '''
    try:
        uid = request.session['vipuser'].get('id')
        ob = Users.objects.get(id=uid)
        context={"user":ob}
        print('ob')
        print(ob)
        return render(request,"web/vipinfo.html",context)
    except Exception as err:
        print(err)
        return HttpResponse("没有找到要修改的信息！")

def update(request, uid):
    ''' 个人中心 更新信息'''
    try:
        print('uid: ', id);
        ob = Users.objects.get(id=uid)
        ob.save()
        return HttpResponse("修改成功!")
    except Exception as err:
        print(err)
        return HttpResponse("修改失败！")

def resetps(request):
    ''' 个人中心 重置密码'''
    try:
        uid = request.session['vipuser'].get('id')
        ob = Users.objects.get(id=uid)
        context={"user":ob}
        print('ob')
        print(ob)
        return render(request,"web/vipresetpw.html",context)
    except Exception as err:
        print(err)
        return HttpResponse("没有找到要修改的信息！")

def doresetps(request, uid):
    ''' 个人中心 执行重置密码'''
    try:
        print('uid: ', id);
        ob = Users.objects.get(id=uid)
        ob.save()
        return HttpResponse("修改成功!")
    except Exception as err:
        print(err)
        return HttpResponse("修改失败！")
