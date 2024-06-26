#!/bin/bash
#
#  pocket_trk real-time test
#
L1="-sig L1CA -prn 1-32,193-199"
L1C="-sig L1CD -prn 1-32,193-199 -sig L1CP -prn 1-32,193-199"
L2C="-sig L2CM -prn 1-32,193-199"

../bin/pocket_trk $L1 $L1C $L2C \
-c ../conf/pocket_L1L2_6MHz.conf \
-rtcm :10015 -nmea :10016 -log :10017 $@

