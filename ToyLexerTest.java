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

        //Create Trie Table and add all Keywords to table
        TriToy t = new TriToy();
        final String[] keywords = {"boolean","break", "class", "double", "else", "extends", "false","for","if","implements","int","interface","newarray","println","readln","return","string","true","void","while"};
        for(String str : keywords){
            t.insertWord(str);
        }

        //Analyze Tokens
        try {
            //ToyLexer reads a supplied file
            ToyLexer lexer = new ToyLexer(new FileReader(args[0]));
            symbol = lexer.next_token();    //symbol holds the current token
            int lineNumber = symbol.left;   //keep track of line number

            //loop through all tokens
            while(symbol.sym != 0){
                //print newline for clean output
                if(lineNumber != symbol.left){
                    System.out.println();
                    lineNumber = symbol.left;
                }

                //add identifiers to trie table
                int symIndex = Integer.parseInt(symbol.toString().substring(1));
                if(symIndex==48) t.insertWord((String) symbol.value);
               
                //print token and get next one
                String token = s.terminalNames[symIndex];
                System.out.print(token.substring(1) + " ");
                symbol = lexer.next_token();
            }
            System.out.println(); //for cleaner output
        }
        catch (Exception e) {
        }

        //Show Trie Table
        t.printTables();
    }
}
