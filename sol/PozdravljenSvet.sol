contract PozdravljenSvet {
  string sporocilo;

  function PozdravljenSvet(string _sporocilo) public {
    sporocilo = _sporocilo;
  }

  function pozdrav() constant returns (string) {
    return sporocilo;
  }

  function nastaviPozdrav(string _sporocilo) {
    sporocilo = _sporocilo;
  }

  function destruct() {
    selfdestruct(msg.sender);
  }
}
