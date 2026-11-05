#import <standard.fx>;

using standard::io::console;

enum Colors
{
	Red,
	Green,
	Blue
};

main() -> int
{
    println($Colors.RED);
    return 0;
};