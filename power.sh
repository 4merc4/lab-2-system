set -euo pipefail
BIN=$1; MODE=$2; N=$3
IDLE_SECS=${IDLE_SECS:-10}

RAPL=/sys/class/powercap/intel-rapl:0/energy_uj   
if [ ! -r "$RAPL" ]; then
  exit 1
fi

read_e() { cat "$RAPL"; }


e0=$(read_e); sleep "$IDLE_SECS"; e1=$(read_e)
p_idle=$(echo "scale=3; ($e1-$e0)/1000000/$IDLE_SECS" | bc)
echo "Idle: ${p_idle} Вт"


e0=$(read_e); t0=$(date +%s.%N)
"$BIN" "$MODE" "$N"
t1=$(date +%s.%N); e1=$(read_e)
dur=$(echo "$t1-$t0" | bc)
e_sys=$(echo "scale=3; ($e1-$e0)/1000000" | bc)


e_prog=$(echo "scale=3; $e_sys - $p_idle*$dur" | bc)

