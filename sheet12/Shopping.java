import java.util.ArrayList;
import java.util.List;

public class Shopping {
    private static class ProductStub implements Product {
        // nothing to see here
    }

    private static class DummyCounter implements Counter {
        private List<ProductStub> products;

        public DummyCounter(int numProducts) {
            this.products = new ArrayList<>(numProducts);
            for (int i = 0; i < numProducts; i++) {
                products.add(new ProductStub());
            }
        }

        @Override
        public Product takeSomeProduct() {
            if (products.isEmpty()) {
                return null;
            } else {
                Product product = products.get(0);
                products.remove(0);
                return product;
            }
        }
    }

    private static class CounterStub implements Counter {
        private Product product = new ProductStub();

        @Override
        public Product takeSomeProduct() {
            return product;
        }

    }

    public static void main(String[] args) {
        // Counter counter = new DummyCounter(12);
        Counter counter = new CounterStub();

        Person person = new Person();
        person.shop(counter);
    }
}
