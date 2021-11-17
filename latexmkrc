# use lualatex
$pdf_mode = 4;

# enable shell escape
set_tex_cmds( '--shell-escape %O %S' );

# use batch mode
$interaction = batchmode;

# select correct file to compile
@default_files = ('resume.tex');

# allow asymptote code
sub asy {return system("asy '$_[0]'")};
add_cus_dep("asy","eps",0,"asy");
add_cus_dep("asy","pdf",0,"asy");
add_cus_dep("asy","tex",0,"asy");

# silent mode
# $silent = 1;
