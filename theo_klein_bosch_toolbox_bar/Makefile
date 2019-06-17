TARGETS			= bar-2-holes.stl \
			  bar-3-holes.stl \
			  bar-4-holes.stl \
			  bar-5-holes.stl

all:			$(TARGETS)

bar-2-holes.stl:	bar.scad
			openscad -D holes=2 -o $@ $<

bar-3-holes.stl:	bar.scad
			openscad -D holes=3 -o $@ $<

bar-4-holes.stl:	bar.scad
			openscad -D holes=4 -o $@ $<

bar-5-holes.stl:	bar.scad
			openscad -D holes=5 -o $@ $<

