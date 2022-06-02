import Debug "mo:base/Debug";

actor DBank{
  var currentValue = 300;
  currentValue := 100;

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