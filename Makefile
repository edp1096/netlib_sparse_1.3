#  Makefile for Sparse1.3
#
#  Ken Kundert
#  UC Berkeley
#
CFLAGS = -O
LINTFLAGS = -lc -lm
SHELL = /bin/sh
# CC = cc
CC = gcc

HFILES = spconfig.h spdefs.h spmatrix.h
CFILES = spallocate.c spbuild.c spfactor.c spoutput.c spsolve.c sputils.c \
	 spfortran.c
OFILES = spallocate.o spbuild.o spfactor.o spoutput.o spsolve.o sputils.o \
	 spfortran.o
LIBRARY = sparse.a
DESTINATION = sparse
TESTC = sptest.c
TESTO = sptest.o

SOURCE = $(HFILES) $(CFILES)

$(DESTINATION)	: $(LIBRARY) $(TESTO)
	$(CC) $(CFLAGS) -o $(DESTINATION) $(TESTO) $(LIBRARY) -lm

$(LIBRARY)	: $(OFILES)
	ar r   $(LIBRARY) $?
	ranlib $(LIBRARY)

lint		:
	@lint $(LINTFLAGS) $(CFILES) $(TESTC) | grep -v "but never used"

clean		:
	rm -f $(OFILES) $(LIBRARY) $(TESTO) $(DESTINATION) core

touch		:
	touch -c  $(OFILES) $(LIBRARY)
	ranlib $(LIBRARY)

tags		: $(SOURCE) $(TESTC)
	ctags -t -w $(SOURCE) $(TESTC)

$(OFILES)	: $(HFILES)
$(TESTO)	: $(HFILES)
