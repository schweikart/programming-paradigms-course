public class PrimeTester {
    /**
     * Checks if the given number is a prime (the only two natural numbers
     * dividing this number without remainder are 1 and the number itself).
     * @param n the number to check.
     * @return true if the number is a prime, false otherwise.
     */
    public static boolean isPrime(int n) {
        if (n < 2) {
            return false;
        } else {
            for (int i = 2; i < Math.sqrt(n); i++) {
                if (n % i == 0) {
                    return false;
                }
            }

            return true;
        }
    }
}
