@echo off
rem mmtest.bat -- test the Malayalam metafonts

rem mf &plain "\mode:=proof; mag:=1; input mm10"
mf &plain "\mode:=proof; mag:=1; input mmc10"

rem mf &plain "\mode:=proof; mag:=1; input mmbig"
rem mf &plain "\mode:=proof; mag:=1; input mmbigo"
rem mf &plain "\mode:=proof; mag:=1; input mmexpa12"
rem mf &plain "\mode:=proof; mag:=1; input mmexpb12"
rem mf &plain "\mode:=proof; mag:=1; input mmexpc12"

gftodvi mmc10.260
call view mmc10.dvi

