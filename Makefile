all:

checksum:
	@echo "Checksumming files..."
	scripts/gen-checksums.sh pkg
