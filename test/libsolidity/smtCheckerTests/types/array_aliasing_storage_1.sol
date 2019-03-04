pragma experimental SMTChecker;

contract C
{
	uint[] array;
	function f(uint[] storage a, uint[] storage b) internal {
		require(a[0] == 2);
		require(array[0] == 42);
		b[0] = 1;
		// Fails because b == a is possible.
		assert(a[0] == 2);
		// Fails because b == array is possible.
		assert(array[0] == 42);
		assert(b[0] == 1);
	}
}
// ----
// Warning: (222-239): Assertion violation happens here
// Warning: (286-308): Assertion violation happens here
