PATH=D:/SVN/design/TexturePacker/bin;%PATH%


for %%i in (.,*.png) do ( 
png2atf -i %%~ni.png -c d -n 0,0 -r -o %%~ni.atf
) 

pause