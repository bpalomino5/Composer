//Name: Casey Au
//class: cs 411
//date: 1-27-18

import java.io.*;
import java.util.*;
import java.util.StringTokenizer;
import java.util.Arrays;
import java.lang.Character;


public class TriToy{
  private int[] _switch = new int[52];
  private char[] symbol = new char[40];
  private int[] next = new int[40];
  private char holder;// character of word comparing to symbol chart
  private int ptr;// index at switch array
  private int lastEmpty = 0;// index of last empty spot in symbol table
  private String word = "";// word comparing to symbol table
  
  public TriToy(){
    Arrays.fill(_switch,-1);
  }

  public void insertWord(String token){
    word = token;
            
    int letterIndex = 0;
    // @holder = char, individual letter
    holder = word.charAt(letterIndex);
    // @ptr = index at switch array('A' = 0, 'a' = 26)
    ptr = trans(holder);
    //case A: new letter
    if (_switch[ptr] == -1) {
      // @lastEmpty = last open spot on symbol table
      _switch[ptr] = lastEmpty;
      // inserts word in symbol table not inluding first letter
      for (int j = lastEmpty; j < (lastEmpty + word.length() - 1); j++) {
        holder = word.charAt(++letterIndex);
        symbol[j] = holder;
      }
      lastEmpty += word.length();
      symbol[lastEmpty - 1] = '?';
                
      //Case B
    }else{
      letterIndex++;
      holder = word.charAt(letterIndex);
      // @point = starts taking value at switch,pointer comparing
      // in symbol table
      int point = _switch[ptr];
      while (letterIndex <= word.length()) {
      // case 1:letter compared same as letter in symbol
      // table at index
        if ((symbol[point] == holder)) {
          if(letterIndex<word.length()-1){
            letterIndex++;
            holder = word.charAt(letterIndex);
            point++;
          }else{
            letterIndex++;
            point++;
          }

        // case 2: letter being compared =! symbol table and
        // there is already a jump point in next table
        }else if (next[point] != 0) {
          point = next[point];

        // case 3: letter being compared != symbol table and
        // no jump point,rest of word inserted into symbol
        // table at lastEmpty
        } else if (next[point] == 0) {
          next[point] = lastEmpty;
          for (int i = letterIndex; i < word.length(); i++) {
            symbol[lastEmpty] = word.charAt(i);
            lastEmpty++;
          }
          //new identifiers
          symbol[lastEmpty] = '?';
          lastEmpty++;
          //printTables();
          break;
        }
      }
    }
    printTables();
  }


  
  


  // @charNum = number on ascii table
  // @return = index on switch array
  private int trans(int charNum) {
    if ((charNum > 64) && (charNum < 91)) {
      return charNum - 65;
    } else if ((charNum > 96) && (charNum < 123)) {
      return charNum - 71;
    } else if (charNum == 95) {
      return 52;
    }
    return 53;
  }

  // prints out switch, symbol and next arrays formatted
  private void printTables() {
    System.out.print("\t");
    //print char A-T
    for (int i = 65; i < 85; i++) {
      System.out.printf("%5c", (char) i);
    }
    System.out.print("\nswitch: ");
    // print 20 spots from switch array
    for (int i = 0; i < 20; i++) {
      System.out.printf("%5d", _switch[i]);
    }
    System.out.println("\n");

    // print char U-Z and a-n
    System.out.print("\t");
    for (int i = 85; i < 91; i++) {
      System.out.printf("%5c", (char) i);
    }
    for (int i = 97; i < 111; i++) {
      System.out.printf("%5c", (char) i);
    }
    // print 20 spots from switch array
    System.out.print("\nswitch: ");
    for (int i = 20; i < 40; i++) {
      System.out.printf("%5d", _switch[i]);
    }
    System.out.println("\n");

    // print char o-z 
    System.out.print("\t");
    for (int i = 111; i < 123; i++) {
      System.out.printf("%5c", (char) i);
    }
    System.out.print("\nswitch: ");
    // print 14 -1s
    for (int i = 40; i < 52; i++) {
      System.out.printf("%5d", _switch[i]);
    }
    System.out.println("\n");

    // print symbol and next tables
    // @plc = rows of 20
    int plc = 0;
    while (plc < symbol.length) {
      // prints index of symbol and next
      System.out.print("\t");
      for (int i = plc; i < plc + 20; i++) {
        System.out.printf("%5d", i);
      }
      // prints symbol table in 20s
      System.out.print("\nsymbol: ");
      for (int i = plc; i < plc + 20; i++) {
        System.out.printf("%5c", symbol[i]);
      }
      // prints next table in 20 segments if anything is in it
      System.out.print("\nnext:\t");
      for (int i = plc; i < plc + 20; i++) {
        if (next[i] != 0) {
          System.out.printf("%5d", next[i]);
        } else {
          String s = " ";
          System.out.printf("%5s", s);
        }
      }
      plc += 20;
      System.out.println();
    }
    // separates all tables
    System.out.println("\n*****************************");
  }
}
