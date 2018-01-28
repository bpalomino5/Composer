//Created by: Casey Au, Joshua Iwakiri, Brandon Palomino

Instructions:
1)	Compile .jflex file using jflex tool i.e.
	$ jflex toy.jflex
	Creates ToyLexer.java

2)	Compile all Java files using javac
	$ javac ToyLexerTest.java ToyLexer.java sym.java TriToy.java

3)	Run main Test program with supplied toy program file
	$ java ToyLexerTest sample.toy

4)	Run Test Program with other test files
	$ java ToyLexerTest more_testcases.toy
