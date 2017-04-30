# ��Redis��ʹ�á�

##��Java ʹ�� redis ���á�
- maven����(Spring 4.1.7)��
```xml
    <dependency>
        <groupId>org.springframework.data</groupId>
        <artifactId>spring-data-redis</artifactId>
        <version>1.6.0.RELEASE</version>
    </dependency>

    <dependency>
        <groupId>redis.clients</groupId>
        <artifactId>jedis</artifactId>
        <version>2.9.0</version>
        <type>jar</type>
    <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>org.apache.commons</groupId>
        <artifactId>commons-lang3</artifactId>
        <version>3.3.2</version>
    </dependency>
```
- Spring�����ļ� 
```xml
    <!--
        ����redis�����ļ� 
        ����Ѿ�������һ���ļ�����ô��һ����Ҫд��������
        <property name="ignoreUnresolvablePlaceholders" value="true"/>
        �ڶ���Ҫ�� ��������� 
        ��Ȼ��ֻ�����ǰ���Ǹ��ļ�
    -->
    <context:property-placeholder location="classpath:redis.properties" ignore-unresolvable="true"/>
    <!-- redis���ӳص����� -->
      <bean id="jedisPoolConfig" class="redis.clients.jedis.JedisPoolConfig">
          <property name="maxActive" value="${redis.pool.maxActive}"/>
          <property name="maxIdle" value="${redis.pool.maxIdle}"/>
          <property name="minIdle" value="${redis.pool.minIdle}"/>
          <property name="maxWait" value="${redis.pool.maxWait}"/>
          <property name="testOnBorrow" value="${redis.pool.testOnBorrow}"/>
          <property name="testOnReturn" value="${redis.pool.testOnReturn}"/>
      </bean>
      
      <!-- redis�����ӳ�pool�����Ǳ�ѡ�timeout/password  -->
      <bean id = "jedisPool" class="redis.clients.jedis.JedisPool">
          <constructor-arg index="0" ref="jedisPoolConfig"/>
          <constructor-arg index="1" value="${redis.host}"/>
          <constructor-arg index="2" value="${redis.port}" type="int"/>
          <constructor-arg index="3" value="${redis.timeout}" type="int"/>
          <constructor-arg index="4" value="${redis.password}"/>
      </bean>
```

- java ʵ�ʲ���
- [JedisUtilsTest.java](https://github.com/Kuangcp/Maven_SSM/blob/master/src/test/java/redis/JedisUtilTest.java)
-  redis ʹ�ú�Ҫʹ��close�ر�
-  redis ���� exec�ͷ�����

### jedis�������쳣
- Invocation of init method failed; nested exception is java.lang.NoSuchMethodError: org.springframework.core.serializer.support.DeserializingConverter
- �汾�Բ��ϣ�ҪSpring��Spring-data-redis �� redis��commons-lang3��Ӧ
- Ŀǰ�� 4.1.7 + 1.6.0 + 2.9.0 + 3.3.2 ����ͨ����

****************************
## redis����

```
daemonize       #�Ƿ��Ժ�̨daemon��ʽ����
pidfile         #pid�ļ�λ��
port            #�����Ķ˿ں�
timeout         #����ʱʱ�� Ĭ��Ϊ300(��)
loglevel        #log��Ϣ����  ��4����ѡֵ��debug��verbose��Ĭ��ֵ����notice��warning
logfile         #log�ļ�λ��
databases       #�������ݿ������
save * *        #������յ�Ƶ�ʣ���һ��*��ʾ�೤ʱ�䣬������*��ʾִ�ж��ٴ�д��������һ��ʱ����ִ��һ��������д����ʱ���Զ�������ա������ö��������
rdbcompression  #�Ƿ�ʹ��ѹ��
dbfilename      #���ݿ����ļ�����ֻ���ļ�����������Ŀ¼��
dir             #���ݿ��յı���Ŀ¼�������Ŀ¼��
appendonly      #�Ƿ���appendonlylog�������Ļ�ÿ��д�������һ��log�����������ݿ�������������Ӱ��Ч�ʡ�
appendfsync     #appendonlylog���ͬ�������̣�����ѡ��ֱ���ÿ��д��ǿ�Ƶ���fsync��ÿ������һ��fsync��������fsync�ȴ�ϵͳ�Լ�ͬ����
vm-enabled      #�Ƿ�ʹ�������ڴ棬Ĭ��ֵΪno
vm-swap-file    #�����ڴ��ļ�·����Ĭ��ֵΪ/tmp/redis.swap�����ɶ��Redisʵ������
vm-max-memory   #�����д���vm-max-memory�����ݴ��������ڴ�,����vm-max-memory���ö�С,�����������ݶ����ڴ�洢��(Redis���������ݾ���keys),Ҳ����˵,��vm-max-memory����Ϊ0��ʱ��,��ʵ������value�������ڴ��̡�Ĭ��ֵΪ0
vm-page-size    #���������ڴ��ҳ��С��������valueֵ�Ƚϴ󣬱���˵��Ҫ��value�з��ò��͡�����֮��������������ݣ������һ�㣬���Ҫ���õĶ��Ǻ�С�����ݣ��Ǿ���Сһ��
vm-pages        #���ý����ļ����ܵ�page��������Ҫע����ǣ�page table��Ϣ����������ڴ��У�ÿ8��page�ͻ�ռ��RAM�е�1��byte���ܵ������ڴ��С �� vm-page-size * vm-pages
vm-max-threads  #����VM IOͬʱʹ�õ��߳���������Ϊ�ڽ����ڴ潻��ʱ���������б���ͽ���Ĺ��̣����Ծ���IO�豸��Ӳ���ϱ��ϲ���֧�ֺܶ�Ĳ�����д�����ǻ���������������vlaueֵ�Ƚϴ󣬽���ֵ���һЩ�������ܹ��������ܵ�
glueoutputbuf   #��С������������һ���Ա��ܹ���һ��TCP packet��Ϊ�ͻ��˷��Ͷ����Ӧ������ԭ������ʵЧ���Ҳ��Ǻ���������Ը���ע�ͣ��㲻�Ǻ�ȷ����ʱ������ó�yes
hash-max-zipmap-entries #��redis 2.0��������hash���ݽṹ����hash�а�������ָ��Ԫ�ظ�����������Ԫ��û�г����ٽ�ʱ��hash����һ������ı��뷽ʽ���������ڴ�ʹ�ã����洢��������������������ٽ�ֵ
hash-max-zipmap-value   #hash��һ��Ԫ�ص����ֵ
activerehashing         #����֮��redis����ÿ100����ʱʹ��1�����CPUʱ������redis��hash����������hash�����Խ����ڴ��ʹ�á���ʹ�ó����У��зǳ��ϸ��ʵʱ����Ҫ�����ܹ�����Redisʱ��ʱ�Ķ�������2������ӳٵĻ�������������Ϊno�����û����ô�ϸ��ʵʱ��Ҫ�󣬿�������Ϊyes���Ա��ܹ������ܿ���ͷ��ڴ�
slaveof <masterip> <masterport> #������Ϊ�ӷ���ʱ�������������IP���˿ڣ�ע�ͣ�
masterauth <master-password>    #������Ϊ�ӷ���ʱ��������������������루ע�ͣ�
requirepass foobared            #�������루ע�ͣ�
maxclients                      #���ͻ�����������Ĭ�ϲ����ƣ�ע�ͣ�
maxmemory                       #��������ڴ棬�ﵽ����ڴ����ú�Redis���ȳ�������ѵ��ڻ򼴽����ڵ�Key�����˷����������ε�������ڴ����ã����޷��ٽ���д���������ע�ͣ�
```
�����������ļ�
```
daemonize yes
pidfile /var/run/redis.pid
port 6379
timeout 315360000
loglevel notice
logfile /data/redis_logs/redis.log
databases 16
save 3600 10000
save 86400 1
rdbcompression yes
dbfilename dump.rdb
dir /data/redis/
appendonly no
appendfsync everysec
vm-enabled no
vm-swap-file /tmp/redis.swap
vm-max-memory 0
vm-page-size 32
vm-pages 134217728
vm-max-threads 4
glueoutputbuf yes
hash-max-zipmap-entries 64
hash-max-zipmap-value 512
activerehashing yes
```
## redis�����г���ʹ��
### ���õ����ݽṹ
- �ַ���
	- get 
	- set
	- del 
	
- �б� (���ƶ���)
	- rpush ������У�ĩ��
	- lpush ��
	- lrange ��ȡ��Χ 0��-1 ��ʾ��ȡȫ��
	- lindex ��ȡָ��index��Ԫ��
	- lpop �������
	- rpop
	
- ���� (���������Set)
	- sadd 
	- smembers ��ȡĳSet����Ԫ��
	- sismember ��ѯĳSet�Ƿ�ĳԪ�أ����������� 0 1
	- srem ɾ��ָ��Set��ָ��Ԫ��
	
- ɢ�� ( ����Map Ƕ�ף�һ�����õ�΢��redis)
	- hget
	- hset
	- hgetall ��ȡĳɢ������k-v
	- hdel ɾ��ɢ����ָ��k
	- hincrby ����
	
- ���򼯺�(����member��Ա��ֵ��score��ֵ�����Ǹ�����)
	- zadd ��һ��������ֵ�ĳ�Ա���ӵ����򼯺���
	- zrange ����Ԫ�������򼯺��е�λ�ã������򼯺��л�ȡ���Ԫ��
		- zrange name 0 -1 withscores ��ȡ���в���ȡ��ֵ
		- zrange name 2 30 withscores 
	- zrevrange �Ӵ�С����Ļ�ȡ����Ԫ��
	- zrangebyscore ��ȡ���򼯺��ڸ�����Χ�е�����Ԫ��
		- zrangebyscore name 0 200 withscores 
	- zrem
	- zincrby ����
	- zinterstore ���м���֮��Ĳ��������Կ����Ƕ�����ӣ�
	
	
### Run Configuration	
- *slaveof*
    - `redis-server --port 9999 --slaveof 127.0.0.1 6379` ����һ��9999�˿���Ϊ6379�Ĵӷ���������ͬ��
    - ���߷���������ִ�� `slaveof host port`������Ѿ��Ǵӷ��������Ͷ�ȥ�ɷ����������ݼ���ת�����µ�������������ͬ����
    - �ӷ����������� `slaveof no one` (ͬ�������ݼ����ᶪʧ��Ѹ���滻��������)
- *loglevel*
    - `./redis-server /etc/redis/6379.conf --loglevel debug	`
	
	
	
	
	