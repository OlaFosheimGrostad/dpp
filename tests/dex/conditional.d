import std.stdio;

void main(string[] args) {
    auto i ⟵ 0;
    while i < 20 {
        if (0 < ++i ≤ 10) {
            writeln("0 < ", i, " ≤ 10");
        }
    }
}
