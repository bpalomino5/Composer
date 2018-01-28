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
"_boolean"          { return symbol(sym._boolean); }
"_break"            { return symbol(sym._break); }
"_class"            { return symbol(sym._class); }
"_double"           { return symbol(sym._double); }
"_else"             { return symbol(sym._else); }
"_extends"          { return symbol(sym._extends); }
"_for"              { return symbol(sym._for); }
"_if"               { return symbol(sym._if); }
"_implements"       { return symbol(sym._implements); }
"_int"              { return symbol(sym._int); }
"_interface"        { return symbol(sym._interface); }
"_newarray"         { return symbol(sym._newarray); }
"_println"          { return symbol(sym._println); }
"_readln"           { return symbol(sym._readln); }
"_return"           { return symbol(sym._return); }
"_string"           { return symbol(sym._string); }
"_void"             { return symbol(sym._void); }
"_while"            { return symbol(sym._while); }
"_plus"             { return symbol(sym._plus); }
"_minus"            { return symbol(sym._minus); }
"_multiplication"   { return symbol(sym._multiplication); }
"_division"         { return symbol(sym._division); }
"_mod"              { return symbol(sym._mod); }
"_less"             { return symbol(sym._less); }
"_lessequal"        { return symbol(sym._lessequal); }
"_greater"          { return symbol(sym._greater); }
"_greaterequal"     { return symbol(sym._greaterequal); }
"_equal"            { return symbol(sym._equal); }
"_notequal"         { return symbol(sym._notequal); }
"_and"              { return symbol(sym._and); }
"_or"               { return symbol(sym._or); }
"_not"              { return symbol(sym._not); }
"_assignop"         { return symbol(sym._assignop); }
"_semicolon"        { return symbol(sym._semicolon); }
"_comma"            { return symbol(sym._comma); }
"_period"           { return symbol(sym._period); }
"_leftparen"        { return symbol(sym._leftparen); }
"_rightparen"       { return symbol(sym._rightparen); }
"_leftbracket"      { return symbol(sym._leftbracket); }
"_rightbracket"     { return symbol(sym._rightbracket); }
"_leftbrace"        { return symbol(sym._leftbrace); }
"_rightbrace"       { return symbol(sym._rightbrace); }
{BooleanConstant}   { return symbol(sym._booleanconstant, new Boolean(yytext())); }
{IntegerConstant}   { return symbol(sym._intconstant, new Integer(yytext())); }
{DoubleConstant}    { return symbol(sym._doubleconstant, new Double(yytext())); }
{StringConstant}    { return symbol(sym._stringconstant, yytext()); }
{Identifier}        { return symbol(sym._id, yytext()); }
{Comment}           { /* Ignore comments */ }
{Whitespace}        { /* Ignore whitespace */ }
.                   { System.out.println("Error in string:  '" + yytext() + "'"); }
