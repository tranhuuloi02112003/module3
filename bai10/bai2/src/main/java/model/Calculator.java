package model;

public class Calculator {
    public static float calculator(float firstOperand,float secondOperand,char calculation){
        switch (calculation){
            case '+':
                return firstOperand+secondOperand;
            case '-':
                return firstOperand-secondOperand;
            case '*':
                return firstOperand*secondOperand;
            case '/':
                if (secondOperand!=0){
                    return firstOperand/secondOperand;
                }else {
                    // khong the chia cho 0
                    throw new RuntimeException("Can't divide by zero");
                }
            default:
                // hoat dong k hop le
                throw new RuntimeException("Invalid operation");
        }
    }
}
