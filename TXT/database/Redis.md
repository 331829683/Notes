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
	- zadd ��һ��������ֵ�ĳ�Ա��ӵ����򼯺���
	- zrange ����Ԫ�������򼯺��е�λ�ã������򼯺��л�ȡ���Ԫ��
		- zrange name 0 -1 withscores ��ȡ���в���ȡ��ֵ
		- zrange name 2 30 withscores 
	- zrevrange �Ӵ�С����Ļ�ȡ����Ԫ��
	- zrangebyscore ��ȡ���򼯺��ڸ�����Χ�е�����Ԫ��
		- zrangebyscore name 0 200 withscores 
	- zrem
	- zincrby ����
	- zinterstore ���м���֮��Ĳ��������Կ����Ƕ�����ӣ�