 # lambda表达式

下面通过对比 `java8` 之前的普通实现和 `java8` 引入`lambda` 表达式的实现,帮助读者快速了解代码差异性,眼见为实,赶紧开始吧!

## 求给定数组最小值
```
public static void main(String[] args) {
    // 方法1: jdk8以前的实现
    int[] nums = {33, 55, -55, 90, -666, 90};
    int min = Integer.MAX_VALUE;
    for (int i : nums) {
        if (i < min) {
            min = i;
        }
    }
    System.out.println(min);

    // 方法2: jdk8使用 lambda 表达式
    int min2 = IntStream.of(nums).parallel().min().getAsInt();
    System.out.println(min2);
}
```

方法1体现的是`命令式编程`的思维,需要明确编程细节,如果细节拿捏不准,那么结果自然不对.
而方法2则是`函数式编程`,只关注目标和结果,忽略过程,思路清晰更容易理解.

** 小结 **
- `命令式编程` 强调过程,注重如何实现的细节,一步错,满盘皆输!
- `函数式编程` 关注结果,不在乎实现细节,分配任务让下属去处理!
- `lambda 表达式` 是`函数式编程` 的重要体现,简洁易于理解.

## 创建线程运行任务
```
public static void main(String[] args) {
    // 方法1: jdk8以前一般写法
    new Thread(new Runnable() {
        @Override
        public void run() {
            System.out.println("ok");
        }
    }).start();

    // 方法2: jdk8采用 lambda 表达式写法
    new Thread(() -> System.out.println("ok")).start();
}
```

从上例可以看出,这里的`lambda 表达式` 返回的是实现了指定接口的对象实例.

** 小结 **
- `lambda 表达式` 实现指定接口方法并返回该接口实例对象
- `lambda 表达式` 由输入和输出以及实现过程三部分组成,不在乎方法名.

## 初体验
```
// 定义只有一个方法的接口
interface TestInterface {
    int doubleNum(int i);
}

public static void main(String[] args) {
    // 方法1: 实现doubleNum方法,实现过程是输入i返回 i*2,最终得到实现了该接口的实例对象
    TestInterface i1 = i -> i * 2;
    System.out.println(i1.doubleNum(1));

    // 方法2: 多个入参时需要用()包围起来,只有一个入参时可省略,见方法1
    TestInterface i2 = (i) -> i * 2;
    System.out.println(i2.doubleNum(1));

    // 方法3: 入参可指定类型,没有明确指定类型时自动推断,如方法1和方法2均未指定入参类型
    TestInterface i3 = (int i) -> i * 2;
    System.out.println(i3.doubleNum(1));

    // 方法4: 实现体不止一句代码时,需要用{}包围起来,并在实现体内部处理出参,当然实际情况中也可能并没有返回值
    TestInterface i4 = (int i) -> {
        System.out.println("regular lambda expression");
        return i * 2;
    };
    System.out.println(i4.doubleNum(1));
}

```

小结
lambda 表达式实现的接口有且仅有一个要实现的接口,体现java 的单一职责原则
这一点也很好理解,如果不止一个接口需要实现,那 lombda 表达式实现的是哪一个接口方法呢?
需要注意的是,这里的接口是指要实现的接口,对于这种情况,jdk8引入注解@FunctionInterface进行校验

在上例中,没有加入@FunctionalInterface声明,lambda 表达式也能正常工作,也佐证了我们的观点,不过建议还是加上该注解;

对我们平时开发的启发
接口尽可能的细并且最好只有一个要实现的接口,既符合java 设计中的单一职责原则,又方面我们使用 lambda 表达式;
接口支持多继承,多个接口的功能可以都实现;

```
@FunctionalInterface
interface Interface1 {
    int doubleNum(int i);
}

public static void main(String[] args) {
    Interface1 i1 = i -> i * 2;
    System.out.println(i1.doubleNum(1));

    Interface1 i2 = (i) -> i * 2;
    System.out.println(i2.doubleNum(1));

    Interface1 i3 = (int i) -> i * 2;
    System.out.println(i3.doubleNum(1));

    Interface1 i4 = (int i) -> {
        System.out.println("regular lambda expression");
        return i * 2;
    };
    System.out.println(i4.doubleNum(1));
}

```








