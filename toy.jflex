/**
 * JFlex file for the Toy language.
 * Check EOL characters if file does not seem to read.
 */

import java_cup.runtime.*;

%%
/**
 * Lexical Functions:
 */

%class ToyLexer
%unicode
%cup
%line
%column


%{
    StringBuffer string = new StringBuffer();

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}


LineTerminator = "\r" | "\n" | "\r\n"
InputCharacter = [^\r\n]
Whitespace     = {LineTerminator} | [ \t\f]

Comment            = {TraditionalComment} | {EndOfLineComment}
TraditionalComment = "/*" ~"*/"
EndOfLineComment   = "//" {InputCharacter}* {LineTerminator}?

Identifier = [A-Za-z][A-Za-z0-9_]*

IntegerConstant    = {DecIntegerConstant} | {HexIntegerConstant}
DecIntegerConstant = [0-9]+
HexIntegerConstant = "0x" [0-9]+

DoubleConstant = [0-9] "." [0-9]* | [0-9] "." [0-9]* "E+" [1-9][0-9]*

StringConstant = \" [^\"\n]* \"

BooleanConstant = "true" | "false"


%%
/**
 * Lexical Rules
 */
"_boolean"          { return newSym(sym._boolean); }
"_break"            { return newSym(sym._break); }
"_class"            { return newSym(sym._class); }
"_double"           { return newSym(sym._double); }
"_else"             { return newSym(sym._else); }
"_extends"          { return newSym(sym._extends); }
"_for"              { return newSym(sym._for); }
"_if"               { return newSym(sym._if); }
"_implements"       { return newSym(sym._implements); }
"_int"              { return newSym(sym._int); }
"_interface"        { return newSym(sym._interface); }
"_newarray"         { return newSym(sym._newarray); }
"_println"          { return newSym(sym._println); }
"_readln"           { return newSym(sym._readln); }
"_return"           { return newSym(sym._return); }
"_string"           { return newSym(sym._string); }
"_void"             { return newSym(sym._void); }
"_while"            { return newSym(sym._while); }
"_plus"             { return newSym(sym._plus); }
"_minus"            { return newSym(sym._minus); }
"_multiplication"   { return newSym(sym._multiplication); }
"_division"         { return newSym(sym._division); }
"_mod"              { return newSym(sym._mod); }
"_less"             { return newSym(sym._less); }
"_lessequal"        { return newSym(sym._lessequal); }
"_greater"          { return newSym(sym._greater); }
"_greaterequal"     { return newSym(sym._greaterequal); }
"_equal"            { return newSym(sym._equal); }
"_notequal"         { return newSym(sym._notequal); }
"_and"              { return newSym(sym._and); }
"_or"               { return newSym(sym._or); }
"_not"              { return newSym(sym._not); }
"_assignop"         { return newSym(sym._assignop); }
"_semicolon"        { return newSym(sym._semicolon); }
"_comma"            { return newSym(sym._comma); }
"_period"           { return newSym(sym._period); }
"_leftparen"        { return newSym(sym._leftparen); }
"_rightparen"       { return newSym(sym._rightparen); }
"_leftbracket"      { return newSym(sym._leftbracket); }
"_rightbracket"     { return newSym(sym._rightbracket); }
"_leftbrace"        { return newSym(sym._leftbrace); }
"_rightbrace"       { return newSym(sym._rightbrace); }
{BooleanConstant}   { return newSym(sym._booleanconstant, new Boolean(yytext())); }
{IntegerConstant}   { return newSym(sym._intconstant, new Integer(yytext())); }
{DoubleConstant}    { return newSym(sym._doubleconstant, new Double(yytext())); }
{StringConstant}    { return newSym(sym._stringconstant, yytext()); }
{Identifier}        { return newSym(sym._id, yytext()); }
{Comment}           { /* Ignore comments */ }
{Whitespace}        { /* Ignore whitespace */ }
.                   { System.out.println("Error in string:  '" + yytext() + "'"); }
