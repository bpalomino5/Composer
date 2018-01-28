/****
 *
 * This is a simple stand-alone testing program for the Pascal lexer defined in
 * PascalLexer.JFLex.  The main method accepts an input file as its first
 * command-line argument.  It then calls the lexer's next_token method with an
 * input reader for that file.  The value of each Symbol returned by next_token
 * is printed to stanard output.
 *                                                                      <p> 
 * The following command-line invocation will read in the test program in the
 * file "lexer-test.p" and print out each token found in that file:
 *
 *
 */

import java.io.*;
import java_cup.runtime.*;

public class ToyLexerTest {
    public static void main(String[] args) {
        Symbol symbol;
        sym s = new sym();
        try {
            ToyLexer lexer = new ToyLexer(new FileReader(args[0]));
            // for (symbol = lexer.next_token(); symbol.sym != 0; symbol = lexer.next_token()) {
            //     System.out.println("Token " + symbol + ", with value = " + symbol.value + "; at line " + symbol.left + ", column " + symbol.right);
            // }

            // for(symbol = lexer.next_token(); symbol.sym != 0; symbol = lexer.next_token()) {
            //     String token = s.terminalNames[Integer.parseInt(symbol.toString().substring(1))];
            //     System.out.println(token.substring(1));
            // }

            symbol = lexer.next_token();
            int lineNumber = symbol.left;
            while(symbol.sym != 0){
                if(lineNumber != symbol.left){
                    System.out.println();
                    lineNumber = symbol.left;
                }
                String token = s.terminalNames[Integer.parseInt(symbol.toString().substring(1))];
                System.out.print(token.substring(1) + " ");
                symbol = lexer.next_token();
            }
        }
        catch (Exception e) {
        }
    }
}
