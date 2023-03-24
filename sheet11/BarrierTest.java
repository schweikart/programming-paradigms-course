import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class BarrierTest {
    public static void main(String[] args) {
        int numSpawnedThreads = Integer.parseInt(args[0]);
        var barrier = new Barrier(8);
    
        var threads = new Thread[numSpawnedThreads];
        for (int i = 0; i < numSpawnedThreads; i++) {
            threads[i] = new Awaiter(barrier, i);
        }

        for (int i = 0; i < numSpawnedThreads; i++) {
            threads[i].start();
        }
    }

    private static class Awaiter extends Thread {
        private final Barrier barrier;
        private final int id;
    
        public Awaiter(Barrier barrier, int id) {
            this.barrier = barrier;
            this.id = id;
        }

        @Override
        public void run() {
            try {
                barrier.await();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
