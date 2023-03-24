import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class PrimeCounterParallel {
    public static int countPrimesInterval(int fromInclusive, int toExclusive) {
        int count = 0;
        for (int i = fromInclusive; i < toExclusive; i++) {
            if (PrimeTester.isPrime(i)) {
                count++;
            }
        }
        return count;
    }

    public static int countPrimes(int cores, int untilInclusive) throws InterruptedException, ExecutionException {
        int perCore = (int) Math.ceil( (untilInclusive - 2) / cores);
        ExecutorService threadPool = Executors.newFixedThreadPool(cores);
        List<Future<Integer>> futures = new ArrayList<>();
        for (int core = 0; core < cores; core++) {
            int from = 2 + core * perCore;
            int to = (int) Math.min(from + perCore, untilInclusive + 1);
            futures.add(threadPool.submit(() -> countPrimesInterval(from, to)));
        }

        int count = 0;
        for (var future : futures) {
            count += future.get();
        }

        threadPool.shutdown();

        return count;
    }

    public static void main(String[] args) throws InterruptedException, ExecutionException {
        final int target = Integer.parseInt(args[0]);
        final int cores = Integer.parseInt(args[1]);

        final long startTime = System.currentTimeMillis();
        int count = countPrimes(cores, target + 1);
        final long endTime = System.currentTimeMillis();
        final long duration = endTime - startTime;

        System.out.println("Duration for inteval [2, " + target + "] on " + cores + " cores is " + duration + " ms");
        System.out.println(count + " primes");
    }
}
