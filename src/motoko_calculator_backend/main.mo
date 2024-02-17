import Float "mo:base/Float";
import Text "mo:base/Text";

actor Calculator {

  type Calc = {
    numberOne : Float;
    numberTwo : Float;
    processType : ProcessType;
    numberResult : Float;
  };

  type ProcessType = {
    #ADD;
    #SUB;
    #MUL;
    #DIV;
  };

  var resCalc : Calc = {
    numberOne = 0;
    numberTwo = 0;
    processType = ProcessType.ADD;
    numberResult = 0;
  };

  public func add(numberOne : Float, numberTwo : Float) : async Float {
    return numberOne + numberTwo;
  };

  public func sub(numberOne : Float, numberTwo : Float) : async Float {
    return numberOne - numberTwo;
  };

  public func mul(numberOne : Float, numberTwo : Float) : async Float {
    return numberOne * numberTwo;
  };

  public func div(numberOne : Float, numberTwo : Float) : async Float {
    return numberOne / numberTwo;
  };

  public func process(calc : Calc) : async () {
    let res : Float = 0.0;
    if (calc.processType == ProcessType.ADD) {
      res = add(calc.numberOne, calc.numberTwo);
    };

    if (calc.processType == ProcessType.SUB) {
      res = sub(calc.numberOne, calc.numberTwo);
    };

    if (calc.processType == ProcessType.MUL) {
      res = mul(calc.numberOne, calc.numberTwo);
    };

    if (calc.processType == ProcessType.DIV) {
      res = div(calc.numberOne, calc.numberTwo);
    };

    resCalc.numberOne = calc.numberOne;
    resCalc.numberTwo = calc.numberTwo;
    resCalc.processType = calc.processType;

    resCalc.numberResult = res;

  };

  public query func show() : async Text {
    let output1 = "Your transaction result: ";
    let output2 = output1 # " " # result.numberResult;
  };
};
