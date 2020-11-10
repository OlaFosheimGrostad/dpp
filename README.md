# Dex - an experimental compiler with D extensions

Version 0.0.1 gamma. Work in progress.

The Dex compiler currently accepts [D](http://dlang.org/) source files (`sourcefile.d`) with language extensions.  It will later accept a [stricter syntax](STRICTMODE.md) that allows the use of `=`for equality comparisons (`sourcefile.dex`).

Dex is based on [LDC](https://wiki.dlang.org/LDC).

## Building

Requires CMake, Clang, LLVM 11 and a D compiler.

## Extended-D Code Example

```
import std.stdio, std.conv;
print ≡ writeln;

void main(){
   for int i⟵0; i ≤ 100; i++ {
      if i ≤ 10 {
        string s⟵to‹string›(i);
        print(s);
      }
   }
}
```

## Added Syntactical Sugar

New Syntax | Regular D
-------------|----------
`for … {…}`  | `for (…) {…}`
`foreach … {…}`  | `foreach (…) {…}`
`while … {…}`  | `while (…) {…}`
`if … {…}`  | `if (…) {…}`
`symbol‹…›` | `symbol!(…)`
`x ⟵ expr` | `x = expr`
`symbol ≡ type` | `alias symbol = type`
`x ≤ y` | `x <= y`
`x ≥ y` | `x >= y`
`x ≠ y` | `x != y`
`a < b < c`   | `a < b && b < c`
`a < b ≤ c`   | `a < b && b <= c`
`a ≤ b < c`   | `a <= b && b < c`
`a ≤ b ≤ c`   | `a <= b && b <= c`

*Known bug*: in expressions like `a < ++b < c` the middle `++b` is evaluated twice so it will increment with 2 and not 1. Fix: avoid expressions with side effects for now.
