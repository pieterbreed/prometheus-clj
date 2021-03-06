.PHONY: all clean test deploy deps

LEIN := ./lein

all: clean test

clean:
	${LEIN} clean
	rm -f deps.txt
	rm -f pom.xml*

test:
	${LEIN} test

deploy: test
	${LEIN} deploy clojars

deps:
	${LEIN} with-profile production deps :tree &> deps.txt
