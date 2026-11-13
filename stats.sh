set -euo pipefail
BIN=$1; MODE=$2; N=$3; TAG=${4:-run}
mkdir -p results

/usr/bin/time --verbose "$BIN" "$MODE" "$N" 2>&1 | tee "results/time_$TAG.txt"

perf stat -d "$BIN" "$MODE" "$N" 2>&1 | tee "results/perfstat_$TAG.txt"

perf record -o "results/perf_$TAG.data" -g "$BIN" "$MODE" "$N" >/dev/null
perf report -i "results/perf_$TAG.data" --stdio 2>/dev/null | head -60 | tee "results/perfreport_$TAG.txt"
