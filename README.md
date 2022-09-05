
# emacs config

load emacs-setup.el from ~/.emacs.d/init.el

also straight needs ~/.emacs.d/load-first.el ? or thing comes before init.el

in any case , 

## after-save.el 

C-x C-q toggle read only mode

when file is visited the buffer is set to read only mode 

if file is not visited , probably sets current buffer to read only mode

when buffer saved it reverts back to read only mode

for example , when happy with changes , save file , run jest . 

all tests pass.

move onto next file , visit those .

all the time , other buffers should be read only.

this was because i damaged a file somehow on a git repository on my local

machine and did not know how it happened.

so more cautious now with editor.



