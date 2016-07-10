/**
 * Register ljudi, za spremembo potrebna dva racuna (naivna multisig implementacija)
 * Bolja implementacija na voljo tukaj:
 * https://raw.githubusercontent.com/ethereum/dapp-bin/master/wallet/wallet.sol
 */
contract Ljudje {
	// podatki o osebi
  struct Oseba {
    string ime;
    string priimek;
  }

  // slovar emso => Oseba
  mapping(string=>Oseba) vsiLjudje;

  // podatki o cakajoci multisig operaciji
  struct Operacija {
    mapping(address=>bool) dovolil;
    int stPotrjenih;
  }

  // multisig racuni
  mapping (address=>bool) lastniki;

  // cakajoce multisig operacije
  mapping(bytes32=>Operacija) cakajoce;

  modifier ZgoljLastnik(bytes32 _operacija) {
    if (dovoli(_operacija)) {
      _
    }
  }

  // Dogodki/dnevniki
  event OsebaDodana(
    string ime,
    string priimek,
    string emso
  );

  event SpremembaZavrnjena();

  event OsebaIzbrisana(
    string emso
  );

  event PotrbujeSePodpis(
    bytes32 operacija,
    int seZahtevanih
  );

  /**
   * Kontruktor
   * @param address _lastnik2 multisig racun
   * @param address _lastnik3 multisig racun
   */
  function Ljudje(address _lastnik2, address _lastnik3) {
    lastniki[msg.sender] = true;
    lastniki[_lastnik2] = true;
    lastniki[_lastnik3] = true;
  }

  /**
   * Preveri ce se opracija sme izvesti
   * @param  bytes32 _operacija
   * @return bool
   */
  function dovoli(bytes32 _operacija) internal returns(bool) {
    if (lastniki[msg.sender] == false) {
      SpremembaZavrnjena();
      return false;
    }

    Operacija op = cakajoce[_operacija];

    if (op.dovolil[msg.sender]==false) {
      op.dovolil[msg.sender] = true;
      op.stPotrjenih = op.stPotrjenih + 1;
    }

    if (op.stPotrjenih>=2) {
      delete cakajoce[_operacija];
      return true;
    } else {
      PotrbujeSePodpis(_operacija, 2 - op.stPotrjenih);
    }

    return false;
  }

  /**
   * Dodaj novo osebo
   * @param  string _emso
   * @param  string _ime
   * @param  string _priimek)
   */
  function dodaj(string _emso, string _ime, string _priimek) ZgoljLastnik(sha3(msg.data)) external {
    vsiLjudje[_emso] = Oseba(_ime, _priimek);
    OsebaDodana(_ime, _priimek, _emso);
  }

  /**
   * Vrne podatke o osebi
   * @param  string _emso
   */
  function vrni(string _emso) constant
      returns(string, string) {

    return (vsiLjudje[_emso].ime, vsiLjudje[_emso].priimek);
  }

  /**
   * Izbrise osebo
   * @param  string _emso)
   */
  function izbrisi(string _emso) ZgoljLastnik(sha3(msg.data)) external {
    if (bytes(vsiLjudje[_emso].ime).length>0) {
        delete vsiLjudje[_emso];
        OsebaIzbrisana(_emso);
    }
  }

  /**
   * Ubije pogodbo
   */
  function konec() ZgoljLastnik(sha3(msg.data)) external {
    selfdestruct(msg.sender);
  }
}
