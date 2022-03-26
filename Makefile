PROGNAME = tiv

OBJECTS = tiv.o

CXX      ?= g++
CXXFLAGS ?= -O3 -fpermissive -std=c++17 -fexceptions
INSTALL  ?= install
INSTALL_PROGRAM ?= $(INSTALL) -D

prefix      ?= /usr/local
exec_prefix ?= $(prefix)
bindir      ?= $(exec_prefix)/bin

override LDFLAGS  += -pthread

all: $(PROGNAME)

tiv.o: CImg.h

$(PROGNAME): $(OBJECTS)
	$(CXX) $(LDFLAGS) $^ -o $@ $(LOADLIBES) $(LDLIBS)

install: all
	$(INSTALL_PROGRAM) $(PROGNAME) $(DESTDIR)$(bindir)/$(PROGNAME)

clean:
	$(RM) $(PROGNAME) *.o

.PHONY: all install clean
