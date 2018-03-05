import java.io.*;
import java_cup.runtime.*;

/****
 *
 * Test program for Toy language parser.
 *
 */
public class ToyParserTest {
    public static void main(String[] args) {
        try {
            parser p = new parser(
                new ToyLexer(new FileReader(args[0])));
            p.parse();
        }
        catch (Exception e) {
            //System.out.println("Exception ");
            //e.printStackTrace();
        }
    }
}
