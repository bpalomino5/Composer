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

/**
 * Return a new Symbol with the given token id, and with the current line and
 * column numbers.
 */
Symbol newSym(int tokenId) {
    return new Symbol(tokenId, yyline, yycolumn);
}

/**
 * Return a new Symbol with the given token id, the current line and column
 * numbers, and the given token value.  The value is used for tokens such as
 * identifiers and numbers.
 */
Symbol newSym(int tokenId, Object value) {
    return new Symbol(tokenId, yyline, yycolumn, value);
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
"boolean"          { return newSym(sym._boolean); }
"break"            { return newSym(sym._break); }
"class"            { return newSym(sym._class); }
"double"           { return newSym(sym._double); }
"else"             { return newSym(sym._else); }
"extends"          { return newSym(sym._extends); }
"for"              { return newSym(sym._for); }
"if"               { return newSym(sym._if); }
"implements"       { return newSym(sym._implements); }
"int"              { return newSym(sym._int); }
"interface"        { return newSym(sym._interface); }
"newarray"         { return newSym(sym._newarray); }
"println"          { return newSym(sym._println); }
"readln"           { return newSym(sym._readln); }
"return"           { return newSym(sym._return); }
"string"           { return newSym(sym._string); }
"void"             { return newSym(sym._void); }
"while"            { return newSym(sym._while); }
"+"	                { return newSym(sym._plus); }
"-"		            { return newSym(sym._minus); }
"*"				    { return newSym(sym._multiplication); }
"/"		            { return newSym(sym._division); }
"%"	                { return newSym(sym._mod); }
"<"	                { return newSym(sym._less); }
"<="		        { return newSym(sym._lessequal); }
">"		            { return newSym(sym._greater); }
">="		        { return newSym(sym._greaterequal); }
"=="	            { return newSym(sym._equal); }
"!="	            { return newSym(sym._notequal); }
"&&"                { return newSym(sym._and); }
"||"                { return newSym(sym._or); }
"!"	                { return newSym(sym._not); }
"="		            { return newSym(sym._assignop); }
";"			        { return newSym(sym._semicolon); }
","		            { return newSym(sym._comma); }
"."		            { return newSym(sym._period); }
"("			        { return newSym(sym._leftparen); }
")"			        { return newSym(sym._rightparen); }
"["			        { return newSym(sym._leftbracket); }
"]"			        { return newSym(sym._rightbracket); }
"{"			        { return newSym(sym._leftbrace); }
"}"			        { return newSym(sym._rightbrace); }
{BooleanConstant}   { return newSym(sym._booleanconstant, new Boolean(yytext())); }
{IntegerConstant}   { return newSym(sym._intconstant, new Integer(yytext())); }
{DoubleConstant}    { return newSym(sym._doubleconstant, new Double(yytext())); }
{StringConstant}    { return newSym(sym._stringconstant, yytext()); }
{Identifier}        { return newSym(sym._id, yytext()); }
{Comment}           { /* Ignore comments */ }
{Whitespace}        { /* Ignore whitespace */ }
.                   { System.out.println("Error in string:  '" + yytext() + "'"); }
