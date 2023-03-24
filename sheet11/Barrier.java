import java.util.concurrent.atomic.AtomicInteger;

public class Barrier implements IBarrier {
    private int numThreads;
    private AtomicInteger waiting;

    public Barrier(int numThreads) {
        this.numThreads = numThreads;
        this.waiting = new AtomicInteger(0);
    }

    @Override
    public synchronized void await() throws InterruptedException {
        int nowWaiting = waiting.incrementAndGet();

        if (nowWaiting == numThreads) {
            this.freeAll();
        } else {
            while (waiting.get() != 0) {
                this.wait();
            }
        }
    }

    @Override
    public synchronized void freeAll() {
        this.waiting.set(0);
        this.notifyAll();
    }
}
