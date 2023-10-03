import pymysql
import time
import pandas as pd
import sys
T1 = time.time()


conn=pymysql.connect(host = '192.168.9.99' # 连接名称，默认127.0.0.1
,user = 'root' # 用户名
,passwd='xiaomaomao' # 密码
,port= 3306 # 端口，默认为3306
,db='tlbbdb' # 数据库名称
,charset='utf8' # 字符编码
)
cur = conn.cursor() # 生成游标对象
sql="select itemtype,pos,p9,p10,p11 from `t_iteminfo` where charguid = \'1010000020\'" # SQL语句
cur.execute(sql) # 执行SQL语句
data = cur.fetchall() # 通过fetchall方法获得数据
cur.close() # 关闭游标
conn.close() # 关闭连接

#读取EquiBase
f = open('./EquipBase.txt',encoding='GBK')
df = pd.read_csv(f,delimiter='\t',header=1,low_memory=False)

#加载ItemSegRate
f2 = open('./ItemSegRate.txt',encoding='GBK')
df2 = pd.read_csv(f2,delimiter='\t',header=1,low_memory=False)


#加载ItemSegValue
f3 = open('./ItemSegValue.txt',encoding='GBK')
df3 = pd.read_csv(f3,delimiter='\t',header=1,low_memory=False)


class Item:
    def getTargetItem(self,id: int,pos,charguid):
        id = int(id)
        for i in data:
            if i[0] == id:
                shuxin = i[3]
                print(shuxin)
            

if __name__ == '__main__':
    itemidlist = sys.argv[1]
    charguid = sys.argv[2]
    #前面是itemid-pos
    itemidlist = itemidlist.split(',')
    Item1 = Item()
    print(data)
    for itemid in itemidlist:
        id = itemid.split('-')
        idx,pos = id[0],id[1]
        Item1.getTargetItem(idx,pos,charguid)

    #print(itemidlist)

T2 = time.time()

print('程序运行时间:%s毫秒' % ((T2 - T1)*1000))