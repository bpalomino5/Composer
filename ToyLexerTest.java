//Names: Casey Au, Joshua Iwakiri, Brandon Palomino
//Date: 1/27/18
//Course: CS 411

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
