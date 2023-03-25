package tutorial12;

public class WebserverProxy {
    /*@
      @ spec_public
      @*/
    private boolean loggedIn = false;

    /*@
      @ ensures (\result <==> loggedIn);
      @*/
    public boolean login(String user, String pswd) {
        throw new UnsupportedOperationException("who cares about implementations anyways?");
    }

    /*@
      @ requires loggedIn;
      @*/
    public byte[] getData() {
        throw new UnsupportedOperationException("who cares about implementations anyways?");
    }
}
