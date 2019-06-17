TARGETS		= 2-hole-bar.stl \
		  3-hole-bar.stl \
		  4-hole-bar.stl \
		  5-hole-bar.stl

all:		$(TARGETS)

2-hole-bar.stl:	bar.scad
		openscad -D holes=2 -o $@ $<

3-hole-bar.stl:	bar.scad
		openscad -D holes=3 -o $@ $<

4-hole-bar.stl:	bar.scad
		openscad -D holes=4 -o $@ $<

5-hole-bar.stl:	bar.scad
		openscad -D holes=5 -o $@ $<

