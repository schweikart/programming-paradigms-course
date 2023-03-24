public class PrimeCounterSequential {
    public static int countPrimes(final int inclusiveUntil) {
        int count = 0;
        for (int i = 2; i <= inclusiveUntil; i++) {
            if (PrimeTester.isPrime(i)) {
                count++;
            }
        }
        return count;
    }

    public static void main(String[] args) {
        final int target = Integer.parseInt(args[0]);

        final long startTime = System.currentTimeMillis();
        int count = countPrimes(target);
        final long endTime = System.currentTimeMillis();
        final long duration = endTime - startTime;

        System.out.println("Duration for interval [0, " + target + "] is " + duration + " ms");
        System.out.println(count + " primes");
    }
}
