@echo off
echo process a Devanagari file:
echo   1. convert to Velthuis notation
patc -p dng.pat %1.dng %1.dn
echo   2. run devnag
devnag %1
