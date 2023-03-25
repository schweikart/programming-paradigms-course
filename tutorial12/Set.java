package tutorial12;

import java.util.LinkedList;
import java.util.List;

public class Set implements ISet {
    /*@
      @ public invariant elements != null;
      @ public invariant (\forall int i; 0 <= i && i < elements.size();
            (\forall int j; i != j && 0 <= j && j < elements.size();
                !java.util.Objects.equals(elements.get(i), elements.get(j))
            )
        );
      @*/
    private /*@ spec_public @*/ List<Object> elements = new LinkedList<>();

    /*@
      @ ensures contains(obj);
      @*/
    @Override
    public void add(/*@ nullable @*/ Object obj) {
        if (!contains(obj)) {
            elements.add(obj);
        }
    }

    /*@
      @ ensures (\forall int i; 0 <= i && i < objs.length; contains(objs[i]));
      @*/
    @Override
    public void addAll(/*@ nullable @*/ Object[] objs) {
        for (var obj : objs) {
            this.add(obj);
        }
    }

    /*@
      @ ensures \result == elements.contains(obj);
      @*/
    @Override
    public /*@ pure @*/ boolean contains(/*@ nullable @*/Object obj) {
        return elements.contains(obj);
    }

    /*@
      @ ensures \result == elements.isEmpty();
      @*/
    @Override
    public boolean isEmpty() {
        return elements.isEmpty();
    }

    /*@
      @ ensures !contains(obj);
      @*/
    @Override
    public void remove(/*@ nullable @*/ Object obj) {
        elements.remove(obj);
    }
}
