/* The "SafeLog" Password Validator
Business Case: A cybersecurity firm needs a tool for their "Employee Portal" that forces employees to create strong passwords. Standard "if-else" isn't enough; they need a modular approach.
Problem Statement
Build a Password Strength Checker that validates a string against corporate security policies and provides specific feedback on why a password failed.


Student Tasks:
1.	The Policy: The password must be:
○	At least 8 characters long.
○	Contain at least one Uppercase letter.
○	Contain at least one Digit (0-9).
2.	Looping Logic: Use a for loop to iterate through the string and Character.isUpperCase() / Character.isDigit() to check requirements.
3.	Feedback System: Instead of just saying "Invalid," the program should print specifically: "Missing a digit" or "Too short."
4.	Retry Mechanism: Use a while loop to keep asking the user for a password until they enter a valid one.
Deliverable: A single PasswordValidator.java file that demonstrates string manipulation and loop control. */


package Java;
import java.util.Scanner;
public class Password_Validator {

    public static boolean checkPass(String pass) {
        boolean hasUpper = false;
        boolean hasDig = false;

        if (pass.length() < 8) {
            System.out.println("Too short. Minimum 8 characters needed");
            return false;
        }
        for (int i = 0; i < pass.length(); i++) {
            char ch = pass.charAt(i);

            if (Character.isUpperCase(ch)) {
                hasUpper = true;
            }

            if (Character.isDigit(ch)) {
                hasDig = true;
            }
        }

        if (!hasUpper) {
            System.out.println("Missing uppercase letter");
            return false;
        }

        if (!hasDig) {
            System.out.println("Missing digit");
            return false;
        }
        return true;
    }

    public static void main(String[] args) {
        
        Scanner sc = new Scanner(System.in);
        String pass;


        while (true) {
            System.out.print("Enter password: ");
            pass = sc.nextLine();

            boolean ok = checkPass(pass);

            if (ok) {
                System.out.println("Password accepted!");
                break;
            } else {
                System.out.println("Try again");
            }
        }
        sc.close();
    }
}