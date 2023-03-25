import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

public class Cart {
    private Set<Product> products = new HashSet<>();

    /*@
      @ requires product != null;
      @ ensures getProducts().contains(product);
      @ ensures getProducts().containsAll(\old(getProducts()));
      @ ensures getProducts().size() == \old(getProducts().size()) + 1;
      @*/
    public void put(Product product) {
        products.add(product);
    }

    public /*@ pure @*/ Collection<Product> getProducts() {
        return products;
    }
}
