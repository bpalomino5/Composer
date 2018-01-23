/**
 * JFlex file for the Toy language.
 * Check EOL characters if file does not seem to read.
 */

import java_cup.runtime.*;

%%
/**
 * Lexical Functions:
 */

%cup
%line
%column
%unicode
%class ToyLexer

%{
    StringBuffer string = new StringBuffer();

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

	private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}
%%

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]

Comment            = {TraditionalComment} | {EndOfLineComment}
TraditionalComment = "/*" ~"*/"
EndOfLineComment   = "//" {InputCharacter}* {LineTerminator}?

Identifier = [A-Za-z][A-Za-z0-9_]*

DecIntegerLiteral = [0-9]*
HexIntegerLiteral = "0x0" | "0x" [1-9][0-9]*

DoubleLiteral = [0-9] "." [0-9]* | [0-9] "." [0-9]* "E+" [1-9][0-9]*

StringLiteral = \" [^\"\n]* \"

BooleanLiteral = "true" | "false"

