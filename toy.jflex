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

/*IntegerConstant    = {DecIntegerConstant} | {HexIntegerConstant}*/
DecIntegerConstant = [0-9]+
HexIntegerConstant = "0" [Xx] [0-9A-Fa-f]+

DoubleConstant = [0-9]+ "." [0-9]* ("E" [\+\-]? [0-9]+)? 

StringConstant = \" [^\"\n]* \"

BooleanConstant = "true" | "false"


%%
/**
 * Lexical Rules
 */
"boolean"               { return symbol(sym._boolean); }
"break"                 { return symbol(sym._break); }
"class"                 { return symbol(sym._class); }
"double"                { return symbol(sym._double); }
"else"                  { return symbol(sym._else); }
"extends"               { return symbol(sym._extends); }
"for"                   { return symbol(sym._for); }
"if"                    { return symbol(sym._if); }
"implements"            { return symbol(sym._implements); }
"int"                   { return symbol(sym._int); }
"interface"             { return symbol(sym._interface); }
"newarray"              { return symbol(sym._newarray); }
"println"               { return symbol(sym._println); }
"readln"                { return symbol(sym._readln); }
"return"                { return symbol(sym._return); }
"string"                { return symbol(sym._string); }
"void"                  { return symbol(sym._void); }
"while"                 { return symbol(sym._while); }
"+"                     { return symbol(sym._plus); }
"-"                     { return symbol(sym._minus); }
"*"                     { return symbol(sym._multiplication); }
"/"                     { return symbol(sym._division); }
"%"                     { return symbol(sym._mod); }
"<"                     { return symbol(sym._less); }
"<="                    { return symbol(sym._lessequal); }
">"                     { return symbol(sym._greater); }
">="                    { return symbol(sym._greaterequal); }
"=="                    { return symbol(sym._equal); }
"!="                    { return symbol(sym._notequal); }
"&&"                    { return symbol(sym._and); }
"||"                    { return symbol(sym._or); }
"!"                     { return symbol(sym._not); }
"="                     { return symbol(sym._assignop); }
";"                     { return symbol(sym._semicolon); }
","                     { return symbol(sym._comma); }
"."                     { return symbol(sym._period); }
"("                     { return symbol(sym._leftparen); }
")"                     { return symbol(sym._rightparen); }
"["                     { return symbol(sym._leftbracket); }
"]"                     { return symbol(sym._rightbracket); }
"{"                     { return symbol(sym._leftbrace); }
"}"                     { return symbol(sym._rightbrace); }
{BooleanConstant}       { return symbol(sym._booleanconstant, new Boolean(yytext())); }
{DoubleConstant}        { return symbol(sym._doubleconstant, new Double(yytext())); }
{DecIntegerConstant}    { return symbol(sym._intconstant, new Integer(yytext())); }
{HexIntegerConstant}    { return symbol(sym._intconstant, Integer.valueOf(yytext().substring(2), 16)); }
{StringConstant}        { return symbol(sym._stringconstant, yytext()); }
{Identifier}            { return symbol(sym._id, yytext()); }
{Comment}               { /* Ignore comments */ }
{Whitespace}            { /* Ignore whitespace */ }
.                       { System.out.println("Error in string:  '" + yytext() + "'"); }
