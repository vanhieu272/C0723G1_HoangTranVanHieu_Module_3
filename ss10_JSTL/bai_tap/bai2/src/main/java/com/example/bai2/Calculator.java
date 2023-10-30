package com.example.bai2;

import java.io.IOException;

public class Calculator {
    public static double calc(String operator, int num1, int num2){
            double result = 0;
            switch (operator){
                case "+":
                    result = num1 + num2;
                    break;
                case "-":
                    result = num1 - num2;
                    break;
                case "*":
                    result = num1 * num2;
                    break;
                case "/":
                    result = num1 / num2;
                    break;
            }
            return result;
    }
}
