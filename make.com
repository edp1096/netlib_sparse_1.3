$ def lnk$library sys$library:vaxcrtl.olb
$ cc spallocate.c
$ cc spbuild.c
$ cc spfactor.c
$ cc spfortran.c
$ cc spoutput.c
$ cc spsolve.c
$ cc sptest.c
$ cc sputils.c
$ library/create/object sparse.olb -
spallocate, -
spbuild, -
spfactor, -
spfortran, -
spoutput, -
spsolve, -
sputils
$ link/exe=sparse sptest.obj, sparse.olb/library
$ sparse :== $$disk2:[kundert.sparse]sparse.exe
