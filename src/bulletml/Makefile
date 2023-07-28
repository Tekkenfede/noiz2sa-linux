CC ?= gcc
CXX ?= g++
INCLUDES = -I.
LIBS = tinyxml/tinyxml.o tinyxml/tinyxmlparser.o tinyxml/tinyxmlerror.o
#CXXFLAGS = -g -W -Wall -ansi -pedantic
#CXXFLAGS = -pg -g -W -Wall -ansi -pedantic
CXXFLAGS = -O2 -W -Wall -ansi -pedantic -fpermissive
CFLAGS = -O2
OBJS = bulletmlparser-tinyxml.o bulletmlparser.o bulletmltree.o calc.o formula-variables.o bulletmlrunner.o bulletmlrunnerimpl.o

all: libbulletml.a

libbulletml.a: $(OBJS)
	$(MAKE) CC=$(CC) CXX=$(CXX) LD=$(CXX) -C tinyxml
	$(AR) -r libbulletml.a *.o tinyxml/tiny*.o

clean:
	rm -f *.o *.a
	$(MAKE) -C tinyxml clean

calc.cpp: calc.yy
	bison -y   calc.yy && mv y.tab.c calc.cpp

$(OBJS): %.o: %.cpp
	$(CXX) -c $(CXXFLAGS) $(INCLUDES) $<

doxy:
	doxygen

distdir:
