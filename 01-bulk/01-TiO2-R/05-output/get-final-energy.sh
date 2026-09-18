#!/bin/bash

nformula=2
grep ! ../04-vc-relax-with-consistent-param/output | tail -n 1| awk -v nf=$nformula -v ry2ev=13.6056995 '{printf "%18.12f\n", $5*ry2ev/nf}' > etot_ev_per_formula_unit.dat
