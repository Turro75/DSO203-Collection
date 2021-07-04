SYS_B164	 = Stock SYS file

ALTERBIOS 0.5 	 = ALTERBIOS patched to run on 8Mb devices and placed within SYS slot, no extra memory required

LIC_SKIP 	 = Modified Alterbios to skip License check in case You can't retrieve Your license code from minidso.
		   In case the license error at boot is still there (this check is within DFU?), then it run the app.
		     


ALT_F164 = SYS_B164 + ALTERBIOS 0.5

ALT_L164 = SYS_B164 + ALTERBIOS 0.5 + LIC_SKIP


If You use quadpawn update it to release 0.12 that uses the new alterbios 0.5.
