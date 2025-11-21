// Ned lexer for OMNeT++ NED files

package com.omnetpp.omnetpp_plugin;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;
import com.intellij.psi.TokenType;

import static com.omnetpp.omnetpp_plugin.psi.NedTypes.*;

%%

%class NedLexer
%implements FlexLexer
%unicode
%function advance
%type IElementType
%eof{
    return;
%eof}


WHITE_SPACE      = [ \t\r\n\f]+
LINE_COMMENT     = "//".*
BLOCK_COMMENT    = "/\\*([^*]|\\*+[^*/])*\\*/"

INTCONSTANT      = [0-9]+
REALCONSTANT     = [0-9]+"."[0-9]+([eE][+-]?[0-9]+)?
STRINGCONSTANT   = ('([^'\\]|\\.)*'|\"([^\"\\]|\\.)*\")
CHAR             = \'([^\'\\]|\\.)\'

NAME             = [A-Za-z_][A-Za-z0-9_]*


%%
<YYINITIAL> {

    {WHITE_SPACE}        { return TokenType.WHITE_SPACE; }
    {LINE_COMMENT}       { return TokenType.WHITE_SPACE; }
    {BLOCK_COMMENT}      { return TokenType.WHITE_SPACE; }

    "package"            { return PACKAGE; }
    "import"             { return KW_IMPORT; }
    "property"           { return PROPERTY; }
    "channel"            { return CHANNEL; }
    "channelinterface"   { return CHANNELINTERFACE; }
    "simple"             { return SIMPLE; }
    "module"             { return MODULE; }
    "network"            { return NETWORK; }
    "moduleinterface"    { return MODULEINTERFACE; }
    "parameters"         { return PARAMETERS; }
    "types"              { return TYPES; }
    "connections"        { return KW_CONNECTIONS; }
    "allowunconnected"   { return ALLOWUNCONNECTED; }
    "for"                { return FOR; }
    "if"                 { return IF; }
    "extends"            { return EXTENDS; }
    "like"               { return LIKE; }
    "true"               { return TRUE; }
    "false"              { return FALSE; }
    "null"               { return NULL; }
    "nullptr"            { return NULLPTR; }
    "undefined"          { return UNDEFINED; }
    "default"            { return DEFAULT; }
    "ask"                { return ASK; }
    "typename"           { return TYPENAME; }
    "exists"             { return EXISTS; }
    "sizeof"             { return SIZEOF; }
    "index"              { return INDEX; }
    "this"               { return THIS; }
    "parent"             { return PARENT; }
    "object"             { return OBJECT; }
    "xmldoc"             { return XMLDOC; }
    "xml"                { return XML; }
    "int"                { return INT; }
    "double"             { return DOUBLE; }
    "bool"               { return BOOL; }
    "string"             { return STRING; }
    "volatile"           { return VOLATILE; }
    "input"              { return INPUT; }
    "output"             { return OUTPUT; }
    "inout"              { return INOUT; }
    "nan"                { return NAN; }
    "inf"                { return INF; }
    "true"               { return TRUE; }
    "false"              { return FALSE; }

    // --- Operators & Symbols ---
    ":"                  { return COLON; }
    ";"                  { return SEMI; }
    ","                  { return COMMA; }
    "."                  { return DOT; }
    "..."                { return DOTDOT; }
    "("                  { return LPAREN; }
    ")"                  { return RPAREN; }
    "{"                  { return LBRACE; }
    "}"                  { return RBRACE; }
    "["                  { return LBRACK; }
    "]"                  { return RBRACK; }
    "@"                  { return DOLLAR; }
    "="                  { return ASSIGN; }
    "=="                 { return EQ; }
    "!="                 { return NE; }
    "<"                  { return LT; }
    ">"                  { return GT; }
    "<="                 { return LE; }
    ">="                 { return GE; }
    "+"                  { return PLUS; }
    "-"                  { return MINUS; }
    "*"                  { return MUL; }
    "/"                  { return DIV; }
    "%"                  { return MOD; }
    "^"                  { return POWER; }
    "&"                  { return AND; }
    "|"                  { return OR; }
    "~"                  { return NOT; }
    "&&"                 { return AND; }
    "||"                 { return OR; }
    ":"                  { return COLON; }
    "-->"                { return ARROW; }


    {INTCONSTANT}        { return INTCONSTANT; }
    {REALCONSTANT}       { return REALCONSTANT; }
    {STRINGCONSTANT}     { return STRINGCONSTANT; }
    {CHAR}               { return CHAR; }

    {NAME}               { return NAME; }

    .                    { return TokenType.BAD_CHARACTER; }
}