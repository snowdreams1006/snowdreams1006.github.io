# lambda表达式

常规做法和 jdk8的 lambda 表达式比较

MinDemo 无输入有输出
```
public static void main(String[] args) {
    // jdk8-
    int[] nums = {33, 55, -55, 90, -666, 90};
    int min = Integer.MAX_VALUE;
    for (int i : nums) {
        if (i < min) {
            min = i;
        }
    }
    System.out.println(min);

    // jdk8+
    int min2 = IntStream.of(nums).parallel().min().getAsInt();
    System.out.println(min2);
}

```

小结
命令式编程和函数式编程的区别
命令式编程过程化,关注过程,注重细节;
函数式编程结果化,关注需要,注重结果;

lambda 表达式是函数式编程的重要体现,清晰简洁,易于理解;

ThreadDemo 无输入有输出
```
public static void main(String[] args) {
    // jdk8-
    new Thread(new Runnable() {
        @Override
        public void run() {
            System.out.println("ok");
        }
    }).start();

    // jdk8+
    new Thread(() -> System.out.println("ok")).start();
}
```

小结
lambda 表达式返回的是实现了指定接口的对象实例

InterfaceDemo 有输入有输出
```
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








