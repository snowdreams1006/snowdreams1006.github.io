# 函数式接口

## 接口允许有默认实现
```
@FunctionalInterface
interface TestInterface {
    // 要实现的方法
    int doubleNum(int i);

    // 默认实现方法
    default int add(int x, int y) {
        return x + y;
    }
}

public static void main(String[] args) {
    // lambda 表达式实现doubleNum方法并返回该接口的实例对象
    TestInterface interface1 = i -> i * 2;

    // 调用接口的doubleNum方法和add方法
    System.out.println(interface1.doubleNum(1));
    System.out.println(interface1.add(1,2));
}
```

小结
值得说明的是,默认接口实现应该是对所有的实现类来说有价值的默认实现,接口是对行为的规范,对接口的定义必须相当谨慎.那我们熟悉的 List 来说,查询源码,搜索@since发现,大多 api 是1.2,1.3,1.4...竟然没有,而1.8新增的也是 default 接口,为什么?
因为增加接口就需要实现,所以轻易不会新增接口,但是 jdk8允许有默认接口实现,这就解决了需要重新实现接口方法的问题,这也是为什么我们认为这是 jdk8的重大更新;
这里需要说明下 jdk8新增了默认接口实现方法,我们称之为默认接口实现方法,而 lambda 表达式实现的接口方法,我们称之为默认方法吧;

默认接口实现方法可以认为是内部实现类,也可以使用 this;
```
@FunctionalInterface
interface Interface1 {
    int doubleNum(int i);

    default int add(int x, int y) {
        System.out.println(this.doubleNum(1));
        return x + y;
    }
}

public static void main(String[] args) {
    Interface1 interface1 = i -> i * 2;
    System.out.println(interface1.add(1, 2));
}
```

接口多继承时,需要指明具体覆盖哪一个默认实现方法
```
@FunctionalInterface
interface Interface1 {
    int doubleNum(int i);

    default int add(int x, int y) {
        System.out.println("Interface1 add");
        return x + y;
    }
}

@FunctionalInterface
interface Interface2 {
    int doubleNum(int i);

    default int add(int x, int y) {
        System.out.println("Interface2 add");
        return x + y;
    }
}

@FunctionalInterface
interface Interface3 extends Interface2, Interface1 {

    @Override
    default int add(int x, int y) {
        System.out.println("Interface3 add");
        return Interface1.super.add(x, y);
    }
}

public static void main(String[] args) {
    Interface3 interface3 = i -> i * 2;
    System.out.println(interface3.add(1, 2));
}
```

接口真的需要吗,有没有更简洁的方法
```
public class MyMoneyDemo {

    public static void main(String[] args) {
        MyMoney myMoney = new MyMoney(9999999);
        myMoney.printMoney(i -> new DecimalFormat("#,###").format(i));
    }
}

interface IMoneyFormat {
    String format(int money);
}

class MyMoney {
    private final int money;

    public MyMoney(int money) {
        this.money = money;
    }

    public void printMoney(IMoneyFormat moneyFormat) {
        System.out.println("MyMoney is " + moneyFormat.format(this.money));
    }
}
```

以上例子,定义一个接口,然后 lambda 表达式生成接口的实现类,从而实现接口功能;
其实不难发现,lambda 表达式实现的过程中,我们并不关心接口的参数以及方法名,我们仅仅关心入参和出参,那让我们进一步简化吧;

```
public class MyMoneyDemo {

    public static void main(String[] args) {
        MyMoney myMoney = new MyMoney(9999999);
        myMoney.printMoney(i -> new DecimalFormat("#,###").format(i));
    }
}

class MyMoney {
    private final int money;

    public MyMoney(int money) {
        this.money = money;
    }

    public void printMoney(Function<Integer,String> moneyFormat) {
        System.out.println("MyMoney is " + moneyFormat.apply(this.money));
    }
}
```

这就是函数式编程,不必定义那么多接口,此外函数式接口还支持链式操作;

```
public class MyMoneyDemo {
    
    public static void main(String[] args) {
        MyMoney myMoney = new MyMoney(9999999);

        Function<Integer, String> moneyFormat = i -> new DecimalFormat("#,###").format(i);
        myMoney.printMoney(moneyFormat.andThen(s -> "RMB: " + s));
    }
}

class MyMoney {
    private final int money;

    public MyMoney(int money) {
        this.money = money;
    }

    public void printMoney(Function<Integer, String> moneyFormat) {
        System.out.println("MyMoney is " + moneyFormat.apply(this.money));
    }
}
```

** 小结 **

|接口|输入参数|返回类型|说明|
|-|-|-|
|Predicate<T>|T|boolean|断言|
|Consumer|T|/|消费一个数据|
|Function<T,R>|T|R|输入T输出R的函数|
|Supplier<T>|/|R|提供一个数据|
|UnaryOperator<T>|T|T|一元函数(输出输入类型相同)|
|BiFunction<T,U,R>|<T,U>|R|两个输入的函数|
|BinaryOperator<T>|<T,T>|T|两元函数(输出输入类型相同)|



