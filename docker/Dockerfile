FROM ubuntu
RUN apt update && apt install -y git sudo && \
	git clone http://github.com/kasldfh/dotfiles.git && \
	cd dotfiles/vim &&  bash vimcompile.sh && \
	cd ../setup &&  bash setup.sh 



