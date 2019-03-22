DOTFILES := $(shell ls -AFd .* | egrep -v '/|@')
CONFIGDIRS := $(shell ls .config)

.PHONY: link
link:
	@$(foreach file, ${DOTFILES}, ln -sfnv $(abspath ${file}) ${HOME}/${file};)
	@$(foreach dir, ${CONFIGDIRS}, mkdir -p ${HOME}/.config/${dir} && ln -sfnv $(abspath .config/${dir}/config) ${HOME}/.config/${dir}/config;)
