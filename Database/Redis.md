# ��Redis��ʹ�á�
## ��windows�ϵĻ������á�
- ע��Ϊ����
	- `redis-server --service-install redis.windows.conf --loglevel verbose`
- ʹ��cmder
	- cmd ������ `E:/redis/redis-server.exe E:/redis/redis.windows.conf`
- ��������
	- `requirepass redis1104`
	- �ͻ��˵�¼ `auth redis1104`
##��Javaʹ��redis���á�
[Javaʹ��Redis������˴�ĩβ](https://github.com/Kuangcp/Notes/blob/master/TXT/Java/EE.md)
****************************
## redis����

```
    `daemonize `      #�Ƿ��Ժ�̨daemon��ʽ����
    `pidfile   `      #pid�ļ�λ��
    `port      `      #�����Ķ˿ں�
    `timeout   `      #����ʱʱ�� Ĭ��Ϊ300(��)
    `loglevel   `     #log��Ϣ����  ��4����ѡֵ��debug��verbose��Ĭ��ֵ����notice��warning
    `logfile    `     #log�ļ�λ��
    `databases `      #�������ݿ������
    `save * *   `     #������յ�Ƶ�ʣ���һ��*��ʾ�೤ʱ�䣬������*��ʾִ�ж��ٴ�д��������һ��ʱ����ִ��һ��������д����ʱ���Զ�������ա������ö��������
    `rdbcompression`  #�Ƿ�ʹ��ѹ��
    `dbfilename `     #���ݿ����ļ�����ֻ���ļ�����������Ŀ¼��
    `dir   `          #���ݿ��յı���Ŀ¼�������Ŀ¼��
    `appendonly `     #�Ƿ���appendonlylog�������Ļ�ÿ��д�������һ��log�����������ݿ�������������Ӱ��Ч�ʡ�
    `appendfsync `    #appendonlylog���ͬ�������̣�����ѡ��ֱ���ÿ��д��ǿ�Ƶ���fsync��ÿ������һ��fsync��������fsync�ȴ�ϵͳ�Լ�ͬ����
   ` vm-enabled   `   #�Ƿ�ʹ�������ڴ棬Ĭ��ֵΪno
    `vm-swap-file  `  #�����ڴ��ļ�·����Ĭ��ֵΪ/tmp/redis.swap�����ɶ��Redisʵ������
    `vm-max-memory  ` #�����д���vm-max-memory�����ݴ��������ڴ�,����vm-max-memory���ö�С,�����������ݶ����ڴ�洢��(Redis���������ݾ���keys),Ҳ����˵,��vm-max-memory����Ϊ0��ʱ��,��ʵ������value�������ڴ��̡�Ĭ��ֵΪ0
   ` vm-page-size`    #���������ڴ��ҳ��С��������valueֵ�Ƚϴ󣬱���˵��Ҫ��value�з��ò��͡�����֮��������������ݣ������һ�㣬���Ҫ���õĶ��Ǻ�С�����ݣ��Ǿ���Сһ��
    `vm-pages  `      #���ý����ļ����ܵ�page��������Ҫע����ǣ�page table��Ϣ����������ڴ��У�ÿ8��page�ͻ�ռ��RAM�е�1��byte���ܵ������ڴ��С �� vm-page-size * vm-pages
    `vm-max-threads`  #����VM IOͬʱʹ�õ��߳���������Ϊ�ڽ����ڴ潻��ʱ���������б���ͽ���Ĺ��̣����Ծ���IO�豸��Ӳ���ϱ��ϲ���֧�ֺܶ�Ĳ�����д�����ǻ���������������vlaueֵ�Ƚϴ󣬽���ֵ���һЩ�������ܹ��������ܵ�
    `glueoutputbuf`   #��С������������һ���Ա��ܹ���һ��TCP packet��Ϊ�ͻ��˷��Ͷ����Ӧ������ԭ�����ʵЧ���Ҳ��Ǻ���������Ը���ע�ͣ��㲻�Ǻ�ȷ����ʱ������ó�yes
    `hash-max-zipmap-entries` #��redis 2.0��������hash���ݽṹ����hash�а�������ָ��Ԫ�ظ�����������Ԫ��û�г����ٽ�ʱ��hash����һ������ı��뷽ʽ���������ڴ�ʹ�ã����洢��������������������ٽ�ֵ
    `hash-max-zipmap-value`   #hash��һ��Ԫ�ص����ֵ
    `activerehashing`         #����֮��redis����ÿ100����ʱʹ��1�����CPUʱ������redis��hash���������hash�����Խ����ڴ��ʹ�á���ʹ�ó����У��зǳ��ϸ��ʵʱ����Ҫ�����ܹ�����Redisʱ��ʱ�Ķ�������2������ӳٵĻ�������������Ϊno�����û����ô�ϸ��ʵʱ��Ҫ�󣬿�������Ϊyes���Ա��ܹ������ܿ���ͷ��ڴ�
    `slaveof <masterip> <masterport>` #������Ϊ�ӷ���ʱ�������������IP���˿ڣ�ע�ͣ�
    `masterauth <master-password>`    #������Ϊ�ӷ���ʱ��������������������루ע�ͣ�
    `requirepass foobared `           #�������루ע�ͣ�
   ` maxclients `                     #���ͻ�����������Ĭ�ϲ����ƣ�ע�ͣ�
   ` maxmemory `                      #��������ڴ棬�ﵽ����ڴ����ú�Redis���ȳ�������ѵ��ڻ򼴽����ڵ�Key�����˷���������ε�������ڴ����ã����޷��ٽ���д���������ע�ͣ�
```
`����������ļ�`
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
### ���õ��������Ͳ���
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
	- sadd ���һ������`asdd key member`
	- smembers ��ȡĳSet����Ԫ�� `smembers key`
	- sismember ��ѯĳSet�Ƿ�ĳԪ�أ����������� 0 1 `sismember key member`
	- srem ɾ��ָ��Set��ָ��Ԫ�� `srem key member`
	
- ɢ�� (����Map Ƕ�ף�һ�����õ�΢��redis)
	- hget
	- hset
	- hgetall ��ȡĳɢ������k-v
	- hdel ɾ��ɢ����ָ��k
	- hincrby ����
	
- ���򼯺�(����member��Ա��ֵ��score��ֵ�����Ǹ�����)
	- zadd ��һ��������ֵ�ĳ�Ա��ӵ����򼯺���
	- zrange ����Ԫ�������򼯺��е�λ�ã������򼯺��л�ȡ���Ԫ��
		- zrange name 0 -1 withscores ��ȡ���в���ȡ��ֵ
		- zrange name 2 30 wi thscores 
	- zrevrange �Ӵ�С����Ļ�ȡ����Ԫ��
	- zrangebyscore ��ȡ���򼯺��ڸ�����Χ�е�����Ԫ��
		- zrangebyscore name 0 200 withscores 
	- zrem
	- zincrby ����
	- zinterstore ���м���֮��Ĳ��������Կ����Ƕ�����ӣ�
	 	
##### ���ڲ���
- `expire key seconds` ���ü��Ĺ���ʱ��
- `TTL key ` �鿴��ʣ�����ʱ�䣨����ʱ�䣩
- 

*******************
### ���������͵ĸ߼�����
##### �ַ��� ����
- �ַ��������ֽ���ɵ����� ���Է��ֽڴ���������������
- `set key newval nx `������setʧ��
- `set key newval xx `��������setʧ��
- �����String�ܱ�����Ϊ��ֵ ����ʹ�� incr incrby decr decrby 
- `incr` ��ԭ�Ӳ���������������²��������(�������������ɲ���)
- `getset key val`  set��ֵ��get��ֵ
- `mset mget `
	- `mset key val key val` 
	- `mget key key key` ����ֵ��ɵ�����
- `exists key` �и�ֵ�ͷ���1����0
- `del key` ����1��ɾ����0 key������
- `type key` ����ֵ������
- `expire key secondes` ���û�ı䳬ʱʱ�䣬������������
	- `set key val ex secondes` setʱ���ó�ʱʱ��
- `persist key` ȥ����ʱʱ��
- `ttl key` �鿴ʣ����ʱ�� -1��ʾ���� -2��ʾû�и�key

##### �б� ����
- `rpush key val val val `��/β���Ԫ�� lpush����/ͷ
- `rpop key` ��list��/β����ɾ��Ԫ�ط���Ԫ��ֵ û���˾ͷ���null
- ����ʽ���б�������(block) ���к�����
    - blpop
    - brpop
    - bpoplpush
    - brpoplpush
- `lrange key 0 -1` ȡָ�����ȵ�list -1��ʾȫ��
-  `ltrim key 0 2` ��ȡ��ǰ��list
- `lindex key offset`   ����ƫ����Ϊoffset��Ԫ��

##### ����
##### ɢ��	

**********************
	
### Run Configuration	
- *slaveof*
    - `redis-server --port 9999 --slaveof 127.0.0.1 6379` ����һ��9999�˿���Ϊ6379�Ĵӷ���������ͬ��
    - ���߷���������ִ�� `slaveof host port`������Ѿ��Ǵӷ��������Ͷ�ȥ�ɷ����������ݼ���ת�����µ�������������ͬ����
    - �ӷ����������� `slaveof no one` (ͬ�������ݼ����ᶪʧ��Ѹ���滻��������)
- *loglevel*
    - `./redis-server /etc/redis/6379.conf --loglevel debug	`
### ���ݰ�ȫ������
#### �־û�����
#### ����
#### ����	
	
	
## ��Redis��ʹ�á�
### ��Ϊ��־��¼
### ��Ϊ��վͳ������
### �洢������Ϣ
### �Զ���ȫ
- ��������
### ������
### �������
- �����ʼ�
### ���ķ��ͽṹ
### ��Java ʹ�� redis ���á�
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

#### redis ʹ�ú�Ҫdisconnect�ͷ�����
#### redis ���� exec�ͷ�����

### jedis�������쳣
- Invocation of init method failed; nested exception is java.lang.NoSuchMethodError: org.springframework.core.serializer.support.DeserializingConverter
- �汾�Բ��ϣ�ҪSpring��Spring-data-redis �� redis��commons-lang3��Ӧ
- Ŀǰ��4.1.7 + 1.6.0 + 2.9.0 + 3.3.2 ����ͨ����	

### SpringBootʹ��Redis
[SpringBoot����Redis](https://github.com/Kuangcp/Notes/blob/master/TXT/Java/Spring/SpringBootDatabase.md)	
	
