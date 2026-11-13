set -uo pipefail
N=${1:-1024}
cd "$(dirname "$0")"
mkdir -p results

command -v perf >/dev/null || { echo "perf"; exit 1; }
[ -x /usr/bin/time ] || { echo "time"; exit 1; }
sudo sysctl -q kernel.perf_event_paranoid=-1

make clean >/dev/null && make || exit 1
make asm > results/asm_avx_lines.txt 2>&1

declare -A CFG=( [before]="./matmul_O0 naive" [keys_only]="./matmul_O3 naive" [after]="./matmul_O3 opt" )

for tag in before keys_only after; do
  read -r BIN MODE <<< "${CFG[$tag]}"
   ./stats.sh "$BIN" "$MODE" "$N" "$tag"
  ./flamegraph.sh "$BIN" "$MODE" "$N" "flame_$tag"
  if [ -r /sys/class/powercap/intel-rapl:0/energy_uj ]; then
    ./power.sh "$BIN" "$MODE" "$N" | tee "results/power_$tag.txt"
  else
    echo "error"
  fi
done


for tag in before keys_only after; do
  t=$(grep -E "Elapsed \(wall" results/time_$tag.txt | awk '{print $NF}')
  ipc=$(grep -E "insn per cycle" results/perfstat_$tag.txt | awk '{print $4}')
  echo "  $tag: wall=$t  IPC=$ipc"
done
