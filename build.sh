java -jar java-cup-bin-11b/java-cup-11b.jar -expect 3 toy.cup
jflex toy.jflex
javac -cp .:java-cup-bin-11b/java-cup-11b-runtime.jar *.java