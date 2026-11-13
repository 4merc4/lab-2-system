CXXFLAGS_COMMON = -g -fno-omit-frame-pointer -Wall

all: matmul_O0 matmul_O3

matmul_O0: matmul.cpp
	g++ $(CXXFLAGS_COMMON) -O0 -o $@ $<

matmul_O3: matmul.cpp
	g++ $(CXXFLAGS_COMMON) -O3 -march=native -o $@ $<

asm: matmul.cpp
	g++ -O0 -S -masm=intel -o asm_O0.s $<
	g++ -O3 -march=native -S -masm=intel -o asm_O3.s $<

clean:
	rm -f matmul_O0 matmul_O3 asm_*.s perf.data* out.perf *.svg
