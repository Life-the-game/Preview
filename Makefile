## ########################################################################## ##
## Project: Life - the game, Preview Website                                  ##
## Author: db0 (db0company@gmail.com, http://db0.fr/)                         ##
## Latest Version is on GitHub: https://github.com/Life-the-game/Preview      ##
## ########################################################################## ##

NAME		=	preview
SRC_FILE	=	$(NAME).eliom
CONF_FILE	=	$(NAME).conf

PORT		=	2531

all:	conf css compile

css:
	lessc --yui-compress style.less static/style.css

compile:
	eliomc -c -noinfer $(SRC_FILE)
	eliomc -a -o $(NAME).cma _server/$(NAME).cmo

conf:
	@echo -n "Edit configuration file... "
	@cp $(CONF_FILE).template $(CONF_FILE)
	@sed -i".tmp" 's/__PORT/'$(PORT)'/' $(CONF_FILE)
	@sed -i".tmp" 's/__USER/'$(USER)'/' $(CONF_FILE)
	@sed -i".tmp" 's/__PWD/'`pwd | sed 's#\/#\\\/#g'`'/' $(CONF_FILE)
	@rm *.tmp
	@echo "Done."

clean:
	-rm -f *.cm[ioax] *.cmxa *.cmxs *.o *.a *.annot
	-rm -f *.type_mli
	-rm -rf _server
	-rm -vf $(CONF_FILE)
	-rm static/style.css
