import java.util.Random;

public class Person {
    public void shop(Counter counter) {
        Cart cart = new Cart();
        for (int i = 0; i < new Random().nextInt(20); i++) {
            cart.put(counter.takeSomeProduct());
        }
    }
}
