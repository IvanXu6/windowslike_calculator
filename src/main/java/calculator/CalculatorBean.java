package calculator;

public class CalculatorBean implements java.io.Serializable {
    private double lastResult = 0;
    
    public double getLastResult() {
        return lastResult;
    }
    
    public void setLastResult(double result) {
        this.lastResult = result;
    }
}