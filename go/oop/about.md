# 内建容器

> Why are there braces but no semicolons? And why can't I put the opening brace on the next line?

```
Go uses brace brackets for statement grouping, a syntax familiar to programmers who have worked with any language in the C family. Semicolons, however, are for parsers, not for people, and we wanted to eliminate them as much as possible. To achieve this goal, Go borrows a trick from BCPL: the semicolons that separate statements are in the formal grammar but are injected automatically, without lookahead, by the lexer at the end of any line that could be the end of a statement. This works very well in practice but has the effect that it forces a brace style. For instance, the opening brace of a function cannot appear on a line by itself.

Some have argued that the lexer should do lookahead to permit the brace to live on the next line. We disagree. Since Go code is meant to be formatted automatically by gofmt, some style must be chosen. That style may differ from what you've used in C or Java, but Go is a different language and gofmt's style is as good as any other. More important—much more important—the advantages of a single, programmatically mandated format for all Go programs greatly outweigh any perceived disadvantages of the particular style. Note too that Go's style means that an interactive implementation of Go can use the standard syntax one line at a time without special rules.
```

> Why are ++ and -- statements and not expressions? And why postfix, not prefix?

```
Without pointer arithmetic, the convenience value of pre- and postfix increment operators drops. By removing them from the expression hierarchy altogether, expression syntax is simplified and the messy issues around order of evaluation of ++ and -- (consider f(i++) and p[i] = q[++i]) are eliminated as well. The simplification is significant. As for postfix vs. prefix, either would work fine but the postfix version is more traditional; insistence on prefix arose with the STL, a library for a language whose name contains, ironically, a postfix increment.
```

> Why is there no pointer arithmetic?

```
Safety. Without pointer arithmetic it's possible to create a language that can never derive an illegal address that succeeds incorrectly. Compiler and hardware technology have advanced to the point where a loop using array indices can be as efficient as a loop using pointer arithmetic. Also, the lack of pointer arithmetic can simplify the implementation of the garbage collector.
```

> Why are declarations backwards?

```
They're only backwards if you're used to C. In C, the notion is that a variable is declared like an expression denoting its type, which is a nice idea, but the type and expression grammars don't mix very well and the results can be confusing; consider function pointers. Go mostly separates expression and type syntax and that simplifies things (using prefix * for pointers is an exception that proves the rule). In C, the declaration

    int* a, b;
declares a to be a pointer but not b; in Go

    var a, b *int
declares both to be pointers. This is clearer and more regular. Also, the := short declaration form argues that a full variable declaration should present the same order as := so

    var a uint64 = 1
has the same effect as

    a := uint64(1)
Parsing is also simplified by having a distinct grammar for types that is not just the expression grammar; keywords such as func and chan keep things clear.

See the article about Go's Declaration Syntax for more details.
```

> Can I stop these complaints about my unused variable/import?

```
The presence of an unused variable may indicate a bug, while unused imports just slow down compilation, an effect that can become substantial as a program accumulates code and programmers over time. For these reasons, Go refuses to compile programs with unused variables or imports, trading short-term convenience for long-term build speed and program clarity.

Still, when developing code, it's common to create these situations temporarily and it can be annoying to have to edit them out before the program will compile.

Some have asked for a compiler option to turn those checks off or at least reduce them to warnings. Such an option has not been added, though, because compiler options should not affect the semantics of the language and because the Go compiler does not report warnings, only errors that prevent compilation.

There are two reasons for having no warnings. First, if it's worth complaining about, it's worth fixing in the code. (And if it's not worth fixing, it's not worth mentioning.) Second, having the compiler generate warnings encourages the implementation to warn about weak cases that can make compilation noisy, masking real errors that should be fixed.

It's easy to address the situation, though. Use the blank identifier to let unused things persist while you're developing.

import "unused"

// This declaration marks the import as used by referencing an
// item from the package.
var _ = unused.Item  // TODO: Delete before committing!

func main() {
    debugData := debug.Profile()
    _ = debugData // Used only during debugging.
    ....
}
Nowadays, most Go programmers use a tool, goimports, which automatically rewrites a Go source file to have the correct imports, eliminating the unused imports issue in practice. This program is easily connected to most editors to run automatically when a Go source file is written.
```

> Why does Go not have the ?: operator?

```
There is no ternary testing operation in Go. You may use the following to achieve the same result:

if expr {
    n = trueVal
} else {
    n = falseVal
}
The reason ?: is absent from Go is that the language's designers had seen the operation used too often to create impenetrably complex expressions. The if-else form, although longer, is unquestionably clearer. A language needs only one conditional control flow construct.
```

>Why do T and *T have different method sets?

```
As the Go specification says, the method set of a type T consists of all methods with receiver type T, while that of the corresponding pointer type *T consists of all methods with receiver *T or T. That means the method set of *T includes that of T, but not the reverse.

This distinction arises because if an interface value contains a pointer *T, a method call can obtain a value by dereferencing the pointer, but if an interface value contains a value T, there is no safe way for a method call to obtain a pointer. (Doing so would allow a method to modify the contents of the value inside the interface, which is not permitted by the language specification.)

Even in cases where the compiler could take the address of a value to pass to the method, if the method modifies the value the changes will be lost in the caller. As an example, if the Write method of bytes.Buffer used a value receiver rather than a pointer, this code:

var buf bytes.Buffer
io.Copy(buf, os.Stdin)
would copy standard input into a copy of buf, not into buf itself. This is almost never the desired behavior.
```

> How do I know whether a variable is allocated on the heap or the stack?

```
From a correctness standpoint, you don't need to know. Each variable in Go exists as long as there are references to it. The storage location chosen by the implementation is irrelevant to the semantics of the language.

The storage location does have an effect on writing efficient programs. When possible, the Go compilers will allocate variables that are local to a function in that function's stack frame. However, if the compiler cannot prove that the variable is not referenced after the function returns, then the compiler must allocate the variable on the garbage-collected heap to avoid dangling pointer errors. Also, if a local variable is very large, it might make more sense to store it on the heap rather than the stack.

In the current compilers, if a variable has its address taken, that variable is a candidate for allocation on the heap. However, a basic escape analysis recognizes some cases when such variables will not live past the return from the function and can reside on the stack.
```

> What is the size of an int on a 64 bit machine?

```
The sizes of int and uint are implementation-specific but the same as each other on a given platform. For portability, code that relies on a particular size of value should use an explicitly sized type, like int64. On 32-bit machines the compilers use 32-bit integers by default, while on 64-bit machines integers have 64 bits. (Historically, this was not always true.)

On the other hand, floating-point scalars and complex types are always sized (there are no float or complex basic types), because programmers should be aware of precision when using floating-point numbers. The default type used for an (untyped) floating-point constant is float64. Thus foo := 3.0 declares a variable foo of type float64. For a float32 variable initialized by an (untyped) constant, the variable type must be specified explicitly in the variable declaration:

var foo float32 = 3.0
Alternatively, the constant must be given a type with a conversion as in foo := float32(3.0).
```

> What's the difference between new and make?

```
In short: new allocates memory, while make initializes the slice, map, and channel types.

See the relevant section of Effective Go for more details.
```

> Should I define methods on values or pointers?

```
func (s *MyStruct) pointerMethod() { } // method on pointer
func (s MyStruct)  valueMethod()   { } // method on value
For programmers unaccustomed to pointers, the distinction between these two examples can be confusing, but the situation is actually very simple. When defining a method on a type, the receiver (s in the above examples) behaves exactly as if it were an argument to the method. Whether to define the receiver as a value or as a pointer is the same question, then, as whether a function argument should be a value or a pointer. There are several considerations.

First, and most important, does the method need to modify the receiver? If it does, the receiver must be a pointer. (Slices and maps act as references, so their story is a little more subtle, but for instance to change the length of a slice in a method the receiver must still be a pointer.) In the examples above, if pointerMethod modifies the fields of s, the caller will see those changes, but valueMethod is called with a copy of the caller's argument (that's the definition of passing a value), so changes it makes will be invisible to the caller.

By the way, in Java method receivers are always pointers, although their pointer nature is somewhat disguised (and there is a proposal to add value receivers to the language). It is the value receivers in Go that are unusual.

Second is the consideration of efficiency. If the receiver is large, a big struct for instance, it will be much cheaper to use a pointer receiver.

Next is consistency. If some of the methods of the type must have pointer receivers, the rest should too, so the method set is consistent regardless of how the type is used. See the section on method sets for details.

For types such as basic types, slices, and small structs, a value receiver is very cheap so unless the semantics of the method requires a pointer, a value receiver is efficient and clear.
```

> When should I use a pointer to an interface?

```
Almost never. Pointers to interface values arise only in rare, tricky situations involving disguising an interface value's type for delayed evaluation.

It is a common mistake to pass a pointer to an interface value to a function expecting an interface. The compiler will complain about this error but the situation can still be confusing, because sometimes a pointer is necessary to satisfy an interface. The insight is that although a pointer to a concrete type can satisfy an interface, with one exception a pointer to an interface can never satisfy an interface.

Consider the variable declaration,

var w io.Writer
The printing function fmt.Fprintf takes as its first argument a value that satisfies io.Writer—something that implements the canonical Write method. Thus we can write

fmt.Fprintf(w, "hello, world\n")
If however we pass the address of w, the program will not compile.

fmt.Fprintf(&w, "hello, world\n") // Compile-time error.
The one exception is that any value, even a pointer to an interface, can be assigned to a variable of empty interface type (interface{}). Even so, it's almost certainly a mistake if the value is a pointer to an interface; the result can be confusing.
```

> When are function parameters passed by value?

```
As in all languages in the C family, everything in Go is passed by value. That is, a function always gets a copy of the thing being passed, as if there were an assignment statement assigning the value to the parameter. For instance, passing an int value to a function makes a copy of the int, and passing a pointer value makes a copy of the pointer, but not the data it points to. (See a later section for a discussion of how this affects method receivers.)

Map and slice values behave like pointers: they are descriptors that contain pointers to the underlying map or slice data. Copying a map or slice value doesn't copy the data it points to. Copying an interface value makes a copy of the thing stored in the interface value. If the interface value holds a struct, copying the interface value makes a copy of the struct. If the interface value holds a pointer, copying the interface value makes a copy of the pointer, but again not the data it points to.

Note that this discussion is about the semantics of the operations. Actual implementations may apply optimizations to avoid copying as long as the optimizations do not change the semantics.
```


> Why are maps, slices, and channels references while arrays are values?

```go
There's a lot of history on that topic. Early on, maps and channels were syntactically pointers and it was impossible to declare or use a non-pointer instance. Also, we struggled with how arrays should work. Eventually we decided that the strict separation of pointers and values made the language harder to use. Changing these types to act as references to the associated, shared data structures resolved these issues. This change added some regrettable complexity to the language but had a large effect on usability: Go became a more productive, comfortable language when it was introduced.
```

> Why don't maps allow slices as keys?

```
Map lookup requires an equality operator, which slices do not implement. They don't implement equality because equality is not well defined on such types; there are multiple considerations involving shallow vs. deep comparison, pointer vs. value comparison, how to deal with recursive types, and so on. We may revisit this issue—and implementing equality for slices will not invalidate any existing programs—but without a clear idea of what equality of slices should mean, it was simpler to leave it out for now.

In Go 1, unlike prior releases, equality is defined for structs and arrays, so such types can be used as map keys. Slices still do not have a definition of equality, though.
```

> Why are maps built in?

```
The same reason strings are: they are such a powerful and important data structure that providing one excellent implementation with syntactic support makes programming more pleasant. We believe that Go's implementation of maps is strong enough that it will serve for the vast majority of uses. If a specific application can benefit from a custom implementation, it's possible to write one but it will not be as convenient syntactically; this seems a reasonable tradeoff.
```

> How do constants work in Go?

```
Although Go is strict about conversion between variables of different numeric types, constants in the language are much more flexible. Literal constants such as 23, 3.14159 and math.Pi occupy a sort of ideal number space, with arbitrary precision and no overflow or underflow. For instance, the value of math.Pi is specified to 63 places in the source code, and constant expressions involving the value keep precision beyond what a float64 could hold. Only when the constant or constant expression is assigned to a variable—a memory location in the program—does it become a "computer" number with the usual floating-point properties and precision.

Also, because they are just numbers, not typed values, constants in Go can be used more freely than variables, thereby softening some of the awkwardness around the strict conversion rules. One can write expressions such as

sqrt2 := math.Sqrt(2)
without complaint from the compiler because the ideal number 2 can be converted safely and accurately to a float64 for the call to math.Sqrt.

A blog post titled Constants explores this topic in more detail.
```

> Why does Go not provide implicit numeric conversions?

```
The convenience of automatic conversion between numeric types in C is outweighed by the confusion it causes. When is an expression unsigned? How big is the value? Does it overflow? Is the result portable, independent of the machine on which it executes? It also complicates the compiler; “the usual arithmetic conversions” are not easy to implement and inconsistent across architectures. For reasons of portability, we decided to make things clear and straightforward at the cost of some explicit conversions in the code. The definition of constants in Go—arbitrary precision values free of signedness and size annotations—ameliorates matters considerably, though.

A related detail is that, unlike in C, int and int64 are distinct types even if int is a 64-bit type. The int type is generic; if you care about how many bits an integer holds, Go encourages you to be explicit.
```

> Why does Go not have covariant result types?

```
Covariant result types would mean that an interface like

type Copyable interface {
    Copy() interface{}
}
would be satisfied by the method

func (v Value) Copy() Value
because Value implements the empty interface. In Go method types must match exactly, so Value does not implement Copyable. Go separates the notion of what a type does—its methods—from the type's implementation. If two methods return different types, they are not doing the same thing. Programmers who want covariant result types are often trying to express a type hierarchy through interfaces. In Go it's more natural to have a clean separation between interface and implementation.
```

> Why is my nil error value not equal to nil?

```
Under the covers, interfaces are implemented as two elements, a type T and a value V. V is a concrete value such as an int, struct or pointer, never an interface itself, and has type T. For instance, if we store the int value 3 in an interface, the resulting interface value has, schematically, (T=int, V=3). The value V is also known as the interface's dynamic value, since a given interface variable might hold different values V (and corresponding types T) during the execution of the program.

An interface value is nil only if the V and T are both unset, (T=nil, V is not set), In particular, a nil interface will always hold a nil type. If we store a nil pointer of type *int inside an interface value, the inner type will be *int regardless of the value of the pointer: (T=*int, V=nil). Such an interface value will therefore be non-nil even when the pointer value V inside is nil.

This situation can be confusing, and arises when a nil value is stored inside an interface value such as an error return:

func returnsError() error {
    var p *MyError = nil
    if bad() {
        p = ErrBad
    }
    return p // Will always return a non-nil error.
}
If all goes well, the function returns a nil p, so the return value is an error interface value holding (T=*MyError, V=nil). This means that if the caller compares the returned error to nil, it will always look as if there was an error even if nothing bad happened. To return a proper nil error to the caller, the function must return an explicit nil:

func returnsError() error {
    if bad() {
        return ErrBad
    }
    return nil
}
It's a good idea for functions that return errors always to use the error type in their signature (as we did above) rather than a concrete type such as *MyError, to help guarantee the error is created correctly. As an example, os.Open returns an error even though, if not nil, it's always of concrete type *os.PathError.

Similar situations to those described here can arise whenever interfaces are used. Just keep in mind that if any concrete value has been stored in the interface, the interface will not be nil. For more information, see The Laws of Reflection.
```

> Can I convert []T1 to []T2 if T1 and T2 have the same underlying type?

```
This last line of this code sample does not compile.
type T1 int
type T2 int
var t1 T1
var x = T2(t1) // OK
var st1 []T1
var sx = ([]T2)(st1) // NOT OK
In Go, types are closely tied to methods, in that every named type has a (possibly empty) method set. The general rule is that you can change the name of the type being converted (and thus possibly change its method set) but you can't change the name (and method set) of elements of a composite type. Go requires you to be explicit about type conversions.
```

> Can I convert a []T to an []interface{}?

```
Not directly. It is disallowed by the language specification because the two types do not have the same representation in memory. It is necessary to copy the elements individually to the destination slice. This example converts a slice of int to a slice of interface{}:

t := []int{1, 2, 3, 4}
s := make([]interface{}, len(t))
for i, v := range t {
    s[i] = v
}
```

> Why doesn't type T satisfy the Equal interface?

```
Consider this simple interface to represent an object that can compare itself with another value:

type Equaler interface {
    Equal(Equaler) bool
}
and this type, T:

type T int
func (t T) Equal(u T) bool { return t == u } // does not satisfy Equaler
Unlike the analogous situation in some polymorphic type systems, T does not implement Equaler. The argument type of T.Equal is T, not literally the required type Equaler.

In Go, the type system does not promote the argument of Equal; that is the programmer's responsibility, as illustrated by the type T2, which does implement Equaler:

type T2 int
func (t T2) Equal(u Equaler) bool { return t == u.(T2) }  // satisfies Equaler
Even this isn't like other type systems, though, because in Go any type that satisfies Equaler could be passed as the argument to T2.Equal, and at run time we must check that the argument is of type T2. Some languages arrange to make that guarantee at compile time.

A related example goes the other way:

type Opener interface {
   Open() Reader
}

func (t T3) Open() *os.File
In Go, T3 does not satisfy Opener, although it might in another language.

While it is true that Go's type system does less for the programmer in such cases, the lack of subtyping makes the rules about interface satisfaction very easy to state: are the function's names and signatures exactly those of the interface? Go's rule is also easy to implement efficiently. We feel these benefits offset the lack of automatic type promotion. Should Go one day adopt some form of polymorphic typing, we expect there would be a way to express the idea of these examples and also have them be statically checked.
```

> How can I guarantee my type satisfies an interface?

```
You can ask the compiler to check that the type T implements the interface I by attempting an assignment using the zero value for T or pointer to T, as appropriate:

type T struct{}
var _ I = T{}       // Verify that T implements I.
var _ I = (*T)(nil) // Verify that *T implements I.
If T (or *T, accordingly) doesn't implement I, the mistake will be caught at compile time.

If you wish the users of an interface to explicitly declare that they implement it, you can add a method with a descriptive name to the interface's method set. For example:

type Fooer interface {
    Foo()
    ImplementsFooer()
}
A type must then implement the ImplementsFooer method to be a Fooer, clearly documenting the fact and announcing it in go doc's output.

type Bar struct{}
func (b Bar) ImplementsFooer() {}
func (b Bar) Foo() {}
Most code doesn't make use of such constraints, since they limit the utility of the interface idea. Sometimes, though, they're necessary to resolve ambiguities among similar interfaces.
```