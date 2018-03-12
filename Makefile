DUMMY="some value"

default: build run
	@echo " [+] default task complete"

disk:
	./make_mw_volume.sh
	@echo " [+] make_disk task complete"

rm_disk:
	./erase_mw_volume.sh
	@echo " [+] rm_disk task complete"

build:
	./build_super_mw.sh
	@echo " [+] build task complete"

run:
	./run_super_mw.sh
	@echo " [+] run task complete"

clean:
	./clean.sh
	@echo " [+] clean task complete"

cleanreally: clean rm_disk
	@echo " [+] cleanreally task complete"
