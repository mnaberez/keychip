# Requirements:
#  - ACME 0.97 (https://sourceforge.net/projects/acme-crossass/)

# default build target
all: keychip_ud3.bin diff

# assemble the source to a 2K binary
keychip_ud3.bin: keychip_ud3.asm
	acme -r keychip_ud3.lst -o keychip_ud3.bin keychip_ud3.asm

# show the assembler listing file
list: keychip_ud3.bin
	cat keychip_ud3.lst

# compare the assembled binary against the original binary
# "sp2516.bin" dumped by Chuck Hutchins
diff: keychip_ud3.bin
	echo "5825d25206eb82febc9fb2c8fb669e4301cd1101" > original.sha1
	openssl sha1 keychip_ud3.bin | cut -d ' ' -f 2 > keychip_ud3.sha1

# remove all build artifacts
clean:
	rm -f *.bin *.lst *.sha1
