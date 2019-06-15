FILES		= wire-spool.scad

TARGETS		= $(FILES:.scad=.stl)

all:		$(TARGETS)

%.stl:		%.scad
		openscad -o $@ $<

