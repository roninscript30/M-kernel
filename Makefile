# =====================================
# M-Kernel
# Bootloader
# =====================================

ASM      = nasm
QEMU     = qemu-system-x86_64

BOOT_SRC = boot/boot.asm
BOOT_BIN = build/boot.bin

.PHONY: all build run clean info

all: build

build:
	mkdir -p build
	$(ASM) -f bin $(BOOT_SRC) -o $(BOOT_BIN)

run: build
	$(QEMU) -fda $(BOOT_BIN)

info: build
	@echo ""
	@echo "File information:"
	file $(BOOT_BIN)
	@echo ""
	stat $(BOOT_BIN)
	@echo ""
	xxd $(BOOT_BIN) | tail

clean:
	rm -rf build
