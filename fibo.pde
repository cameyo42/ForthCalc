/* 
 * Fast Fibonacci algorithms (Java)
 * 
 * Copyright (c) 2017 Project Nayuki
 * All rights reserved. Contact Nayuki for licensing.
 * https://www.nayuki.io/page/fast-fibonacci-algorithms
 * adapted by cameyo for ForthCalc.pde (processing)
 */
  private static BigInteger fastFibonacciDoubling(int n) 
  {
		BigInteger a = BigInteger.ZERO;
		BigInteger b = BigInteger.ONE;
		int m = 0;
		for (int bit = Integer.highestOneBit(n); bit != 0; bit >>>= 1) 
    {
			// Loop invariant: a = F(m), b = F(m+1)
			// Double it
			BigInteger d = multiply(a, b.shiftLeft(1).subtract(a));
			BigInteger e = multiply(a, a).add(multiply(b, b));
			a = d;
			b = e;
			m *= 2;
			// Advance by one conditionally
			if ((n & bit) != 0) 
      {
				BigInteger c = a.add(b);
				a = b;
				b = c;
				m++;
			}
		}
		return a;
	}

  // Multiplies two BigIntegers. 
  // This function makes it easy to swap in a faster algorithm like Karatsuba multiplication.
	private static BigInteger multiply(BigInteger x, BigInteger y) 
  {
		return x.multiply(y);
	}  