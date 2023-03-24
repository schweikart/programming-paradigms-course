package edu.kit.kastel.sdq.parallelsum;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class MaxOfMax {
    public int calculateMax(Collection<List<Integer>> blocksOfNumbers,
                            int numberThreads) throws ExecutionException, InterruptedException {

        if (blocksOfNumbers.size() == 0) {
            return Integer.MIN_VALUE;
        }

        // Submit maximum calculation tasks for all blocks
        ExecutorService threadPool = Executors.newFixedThreadPool(numberThreads);
        List<Future<Integer>> futures = threadPool.invokeAll(
            blocksOfNumbers.stream().map(block -> ((Callable<Integer>) () -> findMax(block))).toList()
        );
        
        // collect block maximum results
        List<Integer> results = new ArrayList<>();
        for (var future : futures) {
             // this will block until the future is complete
            results.add(future.get());
        }

        return findMax(results);
    }

    private Integer findMax(Collection<Integer> numbers) {
        Integer maxValue = Integer.MIN_VALUE;
        for (Integer number : numbers) {
            if (number > maxValue) {
                maxValue = number;
            }
        }
        return maxValue;
    }

    private Integer findMaxStream(Collection<Integer> numbers) {
        return numbers.parallelStream().max(Comparator.naturalOrder()).get();
    }
}
