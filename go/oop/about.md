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
