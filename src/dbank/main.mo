import Debug "mo:base/Debug";

actor DBank{
  stable var currentValue: Nat = 300;
  // currentValue := 100;

  let id = 0293042834234;
  // Debug.print(debug_show(id));

  public func topUP(amount: Nat){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Nat){
    let tempValue: Int = currentValue - amount;
    if(tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else {
      Debug.print("Insufficient funds");
    }
  };

  public query func checkBalance(): async Nat {
    return currentValue;
  };

  // topUP();
}