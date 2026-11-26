#!/bin/bash
# SPDX-FileCopyrightText: 2026 Kaito Kondo
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo "${1}行目のテスト失敗"
	res=1
}

res=0

### NORMAL INPUT ###
out=$(printf '2026-11-01\n2026-11-02\n2026-11-03\n' | ./grow)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "2026-11-01 1 1.0 10 10 seed
2026-11-02 2 1.1 11 21 seed
2026-11-03 3 1.2 12 33 sprout" ] || ng "$LINENO"

out=$(echo あ | ./grow)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./grow)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res