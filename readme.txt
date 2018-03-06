//Created by: Casey Au, Joshua Iwakiri, Brandon Palomino

Instructions:
1)  Compile .cup file using cup tool i.e.
	$ java -jar java-cup-bin-11b/java-cup-11b.jar -expect 1 toy.cup
	Creates sym.java and parser.java

2)	Compile .jflex file using jflex tool i.e.
	$ jflex toy.jflex
	Creates ToyLexer.java

3)	Compile all Java files using javac
	$ javac -cp .:java-cup-bin-11b/java-cup-11b-runtime.jar *.java

4)	Run main test program with supplied toy program file
	$ java java -cp .:java-cup-bin-11b/java-cup-11b-runtime.jar ToyParserTest sample.toy

5)	Run test Program with other test files
	$ java -cp .:java-cup-bin-11b/java-cup-11b-runtime.jar ToyParserTest testparse.txt


(Optional) Use Scripts provided to do above:
	$ ./clean.sh 			- cleans up directory
	$ ./build.sh 			- does steps 1-3
	$ ./run.sh <file>  - Runs Parse program with provided file
