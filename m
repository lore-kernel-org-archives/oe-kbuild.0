Content-Type: multipart/mixed; boundary="===============5771700455908182962=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/dvb-frontends/mb86a16.c:1392 mb86a16_set_fe() warn: Function too hairy. No more merges.
Date: Fri, 12 Nov 2021 20:34:38 +0800
Message-ID: <202111122024.BmnruaXM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5771700455908182962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chris Down <chris@chrisdown.name>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5833291ab6de9c3e2374336b51c814e515e8f3a5
commit: 337015573718b161891a3473d25f59273f2e626b printk: Userspace format i=
ndexing support
date:   4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m031-20211027 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/dvb-frontends/mb86a16.c:1392 mb86a16_set_fe() warn: Function =
too hairy.  No more merges.

vim +1392 drivers/media/dvb-frontends/mb86a16.c

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02   995  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02   996  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02   997  static int mb86a16_set_fe(struct mb86a16_state *state)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02   998  {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02   999  	u8 agcval, cnmval;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1000  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1001  	int i, j;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1002  	int fOSC =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1003  	int fOSC_start =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1004  	int wait_t;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1005  	int fcp;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1006  	int swp_ofs;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1007  	int V[60];
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1008  	u8 SIG1MIN;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1009  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1010  	unsigned char CREN, AFCEN, AFCEXEN;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1011  	unsigned char SIG1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1012  	unsigned char TIMINT1, TIMINT2, TIMEXT;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1013  	unsigned char S0T, S1T;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1014  	unsigned char S2T;
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1015  /*	unsigned char S2T, S3T; */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1016  	unsigned char S4T, S5T;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1017  	unsigned char AFCEX_L, AFCEX_H;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1018  	unsigned char R;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1019  	unsigned char VIRM;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1020  	unsigned char ETH, VIA;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1021  	unsigned char junk;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1022  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1023  	int loop;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1024  	int ftemp;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1025  	int v, vmax, vmin;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1026  	int vmax_his, vmin_his;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1027  	int swp_freq, prev_swp_freq[20];
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1028  	int prev_freq_num;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1029  	int signal_dupl;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1030  	int afcex_freq;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1031  	int signal;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1032  	int afcerr;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1033  	int temp_freq, delta_freq;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1034  	int dagcm[4];
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1035  	int smrt_d;
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1036  /*	int freq_err; */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1037  	int n;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1038  	int ret =3D -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1039  	int sync;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1040  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1041  	dprintk(verbose, MB86A16_INFO, 1, "freq=3D%d Mhz, symbrt=
=3D%d Ksps", state->frequency, state->srate);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1042  =

b05c90de08b582 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1043  	fcp =3D 3000;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1044  	swp_ofs =3D state->srate / 4;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1045  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1046  	for (i =3D 0; i < 60; i++)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1047  		V[i] =3D -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1048  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1049  	for (i =3D 0; i < 20; i++)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1050  		prev_swp_freq[i] =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1051  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1052  	SIG1MIN =3D 25;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1053  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1054  	for (n =3D 0; ((n < 3) && (ret =3D=3D -1)); n++) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1055  		SEQ_set(state, 0);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1056  		iq_vt_set(state, 0);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1057  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1058  		CREN =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1059  		AFCEN =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1060  		AFCEXEN =3D 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1061  		TIMINT1 =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1062  		TIMINT2 =3D 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1063  		TIMEXT =3D 2;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1064  		S1T =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1065  		S0T =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1066  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1067  		if (initial_set(state) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1068  			dprintk(verbose, MB86A16_ERROR, 1, "initial set failed"=
);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1069  			return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1070  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1071  		if (DAGC_data_set(state, 3, 2) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1072  			dprintk(verbose, MB86A16_ERROR, 1, "DAGC data set error=
");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1073  			return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1074  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1075  		if (EN_set(state, CREN, AFCEN) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1076  			dprintk(verbose, MB86A16_ERROR, 1, "EN set error");
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1077  			return -1; /* (0, 0) */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1078  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1079  		if (AFCEXEN_set(state, AFCEXEN, state->srate) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1080  			dprintk(verbose, MB86A16_ERROR, 1, "AFCEXEN set error");
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1081  			return -1; /* (1, smrt) =3D (1, symbolrate) */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1082  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1083  		if (CNTM_set(state, TIMINT1, TIMINT2, TIMEXT) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1084  			dprintk(verbose, MB86A16_ERROR, 1, "CNTM set error");
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1085  			return -1; /* (0, 1, 2) */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1086  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1087  		if (S01T_set(state, S1T, S0T) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1088  			dprintk(verbose, MB86A16_ERROR, 1, "S01T set error");
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1089  			return -1; /* (0, 0) */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1090  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1091  		smrt_info_get(state, state->srate);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1092  		if (smrt_set(state, state->srate) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1093  			dprintk(verbose, MB86A16_ERROR, 1, "smrt info get error=
");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1094  			return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1095  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1096  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1097  		R =3D vco_dev_get(state, state->srate);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1098  		if (R =3D=3D 1)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1099  			fOSC_start =3D state->frequency;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1100  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1101  		else if (R =3D=3D 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1102  			if (state->frequency % 2 =3D=3D 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1103  				fOSC_start =3D state->frequency;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1104  			} else {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1105  				fOSC_start =3D state->frequency + 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1106  				if (fOSC_start > 2150)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1107  					fOSC_start =3D state->frequency - 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1108  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1109  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1110  		loop =3D 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1111  		ftemp =3D fOSC_start * 1000;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1112  		vmax =3D 0 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1113  		while (loop =3D=3D 1) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1114  			ftemp =3D ftemp + swp_ofs;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1115  			vmax++;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1116  =

f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1117  			/* Upper bound */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1118  			if (ftemp > 2150000) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1119  				loop =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1120  				vmax--;
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1121  			} else {
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1122  				if ((ftemp =3D=3D 2150000) ||
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1123  				    (ftemp - state->frequency * 1000 >=3D fcp + state-=
>srate / 4))
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1124  					loop =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1125  			}
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1126  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1127  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1128  		loop =3D 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1129  		ftemp =3D fOSC_start * 1000;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1130  		vmin =3D 0 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1131  		while (loop =3D=3D 1) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1132  			ftemp =3D ftemp - swp_ofs;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1133  			vmin--;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1134  =

f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1135  			/* Lower bound */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1136  			if (ftemp < 950000) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1137  				loop =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1138  				vmin++;
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1139  			} else {
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1140  				if ((ftemp =3D=3D 950000) ||
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1141  				    (state->frequency * 1000 - ftemp >=3D fcp + state-=
>srate / 4))
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1142  					loop =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1143  			}
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1144  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1145  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1146  		wait_t =3D (8000 + state->srate / 2) / state->srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1147  		if (wait_t =3D=3D 0)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1148  			wait_t =3D 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1149  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1150  		i =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1151  		j =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1152  		prev_freq_num =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1153  		loop =3D 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1154  		signal =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1155  		vmax_his =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1156  		vmin_his =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1157  		v =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1158  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1159  		while (loop =3D=3D 1) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1160  			swp_info_get(state, fOSC_start, state->srate,
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1161  				     v, R, swp_ofs, &fOSC,
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1162  				     &afcex_freq, &AFCEX_L, &AFCEX_H);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1163  =

a890cce595c860 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1164  			udelay(100);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1165  			if (rf_val_set(state, fOSC, state->srate, R) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1166  				dprintk(verbose, MB86A16_ERROR, 1, "rf val set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1167  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1168  			}
a890cce595c860 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1169  			udelay(100);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1170  			if (afcex_data_set(state, AFCEX_L, AFCEX_H) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1171  				dprintk(verbose, MB86A16_ERROR, 1, "afcex data set err=
or");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1172  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1173  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1174  			if (srst(state) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1175  				dprintk(verbose, MB86A16_ERROR, 1, "srst error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1176  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1177  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1178  			msleep_interruptible(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1179  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1180  			if (mb86a16_read(state, 0x37, &SIG1) !=3D 2) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1181  				dprintk(verbose, MB86A16_ERROR, 1, "I2C transfer error=
");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1182  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1183  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1184  			V[30 + v] =3D SIG1 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1185  			swp_freq =3D swp_freq_calcuation(state, i, v, V, vmax, =
vmin,
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1186  						      SIG1MIN, fOSC, afcex_freq,
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1187  						      swp_ofs, &SIG1);	/* changed */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1188  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1189  			signal_dupl =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1190  			for (j =3D 0; j < prev_freq_num; j++) {
7aa92c4229feff drivers/media/dvb-frontends/mb86a16.c Dan Gopstein         2=
017-12-25  1191  				if ((abs(prev_swp_freq[j] - swp_freq)) < (swp_ofs * 3 =
/ 2)) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1192  					signal_dupl =3D 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1193  					dprintk(verbose, MB86A16_INFO, 1, "Probably Duplicate=
 Signal, j =3D %d", j);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1194  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1195  			}
7aa92c4229feff drivers/media/dvb-frontends/mb86a16.c Dan Gopstein         2=
017-12-25  1196  			if ((signal_dupl =3D=3D 0) && (swp_freq > 0) && (abs(sw=
p_freq - state->frequency * 1000) < fcp + state->srate / 6)) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1197  				dprintk(verbose, MB86A16_DEBUG, 1, "------ Signal dete=
ct ------ [swp_freq=3D[%07d, srate=3D%05d]]", swp_freq, state->srate);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1198  				prev_swp_freq[prev_freq_num] =3D swp_freq;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1199  				prev_freq_num++;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1200  				swp_info_get2(state, state->srate, R, swp_freq,
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1201  					      &afcex_freq, &fOSC,
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1202  					      &AFCEX_L, &AFCEX_H);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1203  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1204  				if (rf_val_set(state, fOSC, state->srate, R) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1205  					dprintk(verbose, MB86A16_ERROR, 1, "rf val set error"=
);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1206  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1207  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1208  				if (afcex_data_set(state, AFCEX_L, AFCEX_H) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1209  					dprintk(verbose, MB86A16_ERROR, 1, "afcex data set er=
ror");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1210  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1211  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1212  				signal =3D signal_det(state, state->srate, &SIG1);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1213  				if (signal =3D=3D 1) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1214  					dprintk(verbose, MB86A16_ERROR, 1, "***** Signal Foun=
d *****");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1215  					loop =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1216  				} else {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1217  					dprintk(verbose, MB86A16_ERROR, 1, "!!!!! No signal !=
!!!!, try again...");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1218  					smrt_info_get(state, state->srate);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1219  					if (smrt_set(state, state->srate) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1220  						dprintk(verbose, MB86A16_ERROR, 1, "smrt set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1221  						return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1222  					}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1223  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1224  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1225  			if (v > vmax)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1226  				vmax_his =3D 1 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1227  			if (v < vmin)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1228  				vmin_his =3D 1 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1229  			i++;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1230  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1231  			if ((i % 2 =3D=3D 1) && (vmax_his =3D=3D 1))
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1232  				i++;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1233  			if ((i % 2 =3D=3D 0) && (vmin_his =3D=3D 1))
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1234  				i++;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1235  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1236  			if (i % 2 =3D=3D 1)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1237  				v =3D (i + 1) / 2;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1238  			else
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1239  				v =3D -i / 2;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1240  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1241  			if ((vmax_his =3D=3D 1) && (vmin_his =3D=3D 1))
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1242  				loop =3D 0 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1243  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1244  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1245  		if (signal =3D=3D 1) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1246  			dprintk(verbose, MB86A16_INFO, 1, " Start Freq Error Ch=
eck");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1247  			S1T =3D 7 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1248  			S0T =3D 1 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1249  			CREN =3D 0 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1250  			AFCEN =3D 1 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1251  			AFCEXEN =3D 0 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1252  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1253  			if (S01T_set(state, S1T, S0T) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1254  				dprintk(verbose, MB86A16_ERROR, 1, "S01T set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1255  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1256  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1257  			smrt_info_get(state, state->srate);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1258  			if (smrt_set(state, state->srate) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1259  				dprintk(verbose, MB86A16_ERROR, 1, "smrt set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1260  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1261  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1262  			if (EN_set(state, CREN, AFCEN) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1263  				dprintk(verbose, MB86A16_ERROR, 1, "EN set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1264  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1265  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1266  			if (AFCEXEN_set(state, AFCEXEN, state->srate) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1267  				dprintk(verbose, MB86A16_ERROR, 1, "AFCEXEN set error"=
);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1268  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1269  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1270  			afcex_info_get(state, afcex_freq, &AFCEX_L, &AFCEX_H);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1271  			if (afcofs_data_set(state, AFCEX_L, AFCEX_H) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1272  				dprintk(verbose, MB86A16_ERROR, 1, "AFCOFS data set er=
ror");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1273  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1274  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1275  			if (srst(state) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1276  				dprintk(verbose, MB86A16_ERROR, 1, "srst error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1277  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1278  			}
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1279  			/* delay 4~200 */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1280  			wait_t =3D 200000 / state->master_clk + 200000 / state-=
>srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1281  			msleep(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1282  			afcerr =3D afcerr_chk(state);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1283  			if (afcerr =3D=3D -1)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1284  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1285  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1286  			swp_freq =3D fOSC * 1000 + afcerr ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1287  			AFCEXEN =3D 1 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1288  			if (state->srate >=3D 1500)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1289  				smrt_d =3D state->srate / 3;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1290  			else
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1291  				smrt_d =3D state->srate / 2;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1292  			smrt_info_get(state, smrt_d);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1293  			if (smrt_set(state, smrt_d) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1294  				dprintk(verbose, MB86A16_ERROR, 1, "smrt set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1295  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1296  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1297  			if (AFCEXEN_set(state, AFCEXEN, smrt_d) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1298  				dprintk(verbose, MB86A16_ERROR, 1, "AFCEXEN set error"=
);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1299  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1300  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1301  			R =3D vco_dev_get(state, smrt_d);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1302  			if (DAGC_data_set(state, 2, 0) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1303  				dprintk(verbose, MB86A16_ERROR, 1, "DAGC data set erro=
r");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1304  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1305  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1306  			for (i =3D 0; i < 3; i++) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1307  				temp_freq =3D swp_freq + (i - 1) * state->srate / 8;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1308  				swp_info_get2(state, smrt_d, R, temp_freq, &afcex_freq=
, &fOSC, &AFCEX_L, &AFCEX_H);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1309  				if (rf_val_set(state, fOSC, smrt_d, R) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1310  					dprintk(verbose, MB86A16_ERROR, 1, "rf val set error"=
);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1311  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1312  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1313  				if (afcex_data_set(state, AFCEX_L, AFCEX_H) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1314  					dprintk(verbose, MB86A16_ERROR, 1, "afcex data set er=
ror");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1315  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1316  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1317  				wait_t =3D 200000 / state->master_clk + 40000 / smrt_d;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1318  				msleep(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1319  				dagcm[i] =3D dagcm_val_get(state);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1320  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1321  			if ((dagcm[0] > dagcm[1]) &&
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1322  			    (dagcm[0] > dagcm[2]) &&
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1323  			    (dagcm[0] - dagcm[1] > 2 * (dagcm[2] - dagcm[1]))) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1324  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1325  				temp_freq =3D swp_freq - 2 * state->srate / 8;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1326  				swp_info_get2(state, smrt_d, R, temp_freq, &afcex_freq=
, &fOSC, &AFCEX_L, &AFCEX_H);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1327  				if (rf_val_set(state, fOSC, smrt_d, R) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1328  					dprintk(verbose, MB86A16_ERROR, 1, "rf val set error"=
);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1329  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1330  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1331  				if (afcex_data_set(state, AFCEX_L, AFCEX_H) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1332  					dprintk(verbose, MB86A16_ERROR, 1, "afcex data set");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1333  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1334  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1335  				wait_t =3D 200000 / state->master_clk + 40000 / smrt_d;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1336  				msleep(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1337  				dagcm[3] =3D dagcm_val_get(state);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1338  				if (dagcm[3] > dagcm[1])
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1339  					delta_freq =3D (dagcm[2] - dagcm[0] + dagcm[1] - dagc=
m[3]) * state->srate / 300;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1340  				else
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1341  					delta_freq =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1342  			} else if ((dagcm[2] > dagcm[1]) &&
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1343  				   (dagcm[2] > dagcm[0]) &&
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1344  				   (dagcm[2] - dagcm[1] > 2 * (dagcm[0] - dagcm[1]))) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1345  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1346  				temp_freq =3D swp_freq + 2 * state->srate / 8;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1347  				swp_info_get2(state, smrt_d, R, temp_freq, &afcex_freq=
, &fOSC, &AFCEX_L, &AFCEX_H);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1348  				if (rf_val_set(state, fOSC, smrt_d, R) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1349  					dprintk(verbose, MB86A16_ERROR, 1, "rf val set");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1350  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1351  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1352  				if (afcex_data_set(state, AFCEX_L, AFCEX_H) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1353  					dprintk(verbose, MB86A16_ERROR, 1, "afcex data set");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1354  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1355  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1356  				wait_t =3D 200000 / state->master_clk + 40000 / smrt_d;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1357  				msleep(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1358  				dagcm[3] =3D dagcm_val_get(state);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1359  				if (dagcm[3] > dagcm[1])
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1360  					delta_freq =3D (dagcm[2] - dagcm[0] + dagcm[3] - dagc=
m[1]) * state->srate / 300;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1361  				else
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1362  					delta_freq =3D 0 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1363  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1364  			} else {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1365  				delta_freq =3D 0 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1366  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1367  			dprintk(verbose, MB86A16_INFO, 1, "SWEEP Frequency =3D =
%d", swp_freq);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1368  			swp_freq +=3D delta_freq;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1369  			dprintk(verbose, MB86A16_INFO, 1, "Adjusting .., DELTA =
Freq =3D %d, SWEEP Freq=3D%d", delta_freq, swp_freq);
7aa92c4229feff drivers/media/dvb-frontends/mb86a16.c Dan Gopstein         2=
017-12-25  1370  			if (abs(state->frequency * 1000 - swp_freq) > 3800) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1371  				dprintk(verbose, MB86A16_INFO, 1, "NO  --  SIGNAL !");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1372  			} else {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1373  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1374  				S1T =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1375  				S0T =3D 3;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1376  				CREN =3D 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1377  				AFCEN =3D 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1378  				AFCEXEN =3D 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1379  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1380  				if (S01T_set(state, S1T, S0T) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1381  					dprintk(verbose, MB86A16_ERROR, 1, "S01T set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1382  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1383  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1384  				if (DAGC_data_set(state, 0, 0) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1385  					dprintk(verbose, MB86A16_ERROR, 1, "DAGC data set err=
or");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1386  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1387  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1388  				R =3D vco_dev_get(state, state->srate);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1389  				smrt_info_get(state, state->srate);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1390  				if (smrt_set(state, state->srate) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1391  					dprintk(verbose, MB86A16_ERROR, 1, "smrt set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02 @1392  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1393  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1394  				if (EN_set(state, CREN, AFCEN) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1395  					dprintk(verbose, MB86A16_ERROR, 1, "EN set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1396  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1397  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1398  				if (AFCEXEN_set(state, AFCEXEN, state->srate) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1399  					dprintk(verbose, MB86A16_ERROR, 1, "AFCEXEN set error=
");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1400  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1401  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1402  				swp_info_get2(state, state->srate, R, swp_freq, &afcex=
_freq, &fOSC, &AFCEX_L, &AFCEX_H);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1403  				if (rf_val_set(state, fOSC, state->srate, R) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1404  					dprintk(verbose, MB86A16_ERROR, 1, "rf val set error"=
);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1405  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1406  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1407  				if (afcex_data_set(state, AFCEX_L, AFCEX_H) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1408  					dprintk(verbose, MB86A16_ERROR, 1, "afcex data set er=
ror");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1409  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1410  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1411  				if (srst(state) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1412  					dprintk(verbose, MB86A16_ERROR, 1, "srst error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1413  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1414  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1415  				wait_t =3D 7 + (10000 + state->srate / 2) / state->sra=
te;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1416  				if (wait_t =3D=3D 0)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1417  					wait_t =3D 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1418  				msleep_interruptible(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1419  				if (mb86a16_read(state, 0x37, &SIG1) !=3D 2) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1420  					dprintk(verbose, MB86A16_ERROR, 1, "I2C transfer erro=
r");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1421  					return -EREMOTEIO;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1422  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1423  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1424  				if (SIG1 > 110) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1425  					S2T =3D 4; S4T =3D 1; S5T =3D 6; ETH =3D 4; VIA =3D 6;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1426  					wait_t =3D 7 + (917504 + state->srate / 2) / state->s=
rate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1427  				} else if (SIG1 > 105) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1428  					S2T =3D 4; S4T =3D 2; S5T =3D 8; ETH =3D 7; VIA =3D 2;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1429  					wait_t =3D 7 + (1048576 + state->srate / 2) / state->=
srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1430  				} else if (SIG1 > 85) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1431  					S2T =3D 5; S4T =3D 2; S5T =3D 8; ETH =3D 7; VIA =3D 2;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1432  					wait_t =3D 7 + (1310720 + state->srate / 2) / state->=
srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1433  				} else if (SIG1 > 65) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1434  					S2T =3D 6; S4T =3D 2; S5T =3D 8; ETH =3D 7; VIA =3D 2;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1435  					wait_t =3D 7 + (1572864 + state->srate / 2) / state->=
srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1436  				} else {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1437  					S2T =3D 7; S4T =3D 2; S5T =3D 8; ETH =3D 7; VIA =3D 2;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1438  					wait_t =3D 7 + (2097152 + state->srate / 2) / state->=
srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1439  				}
e15c7ccd31faa0 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1440  				wait_t *=3D 2; /* FOS */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1441  				S2T_set(state, S2T);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1442  				S45T_set(state, S4T, S5T);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1443  				Vi_set(state, ETH, VIA);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1444  				srst(state);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1445  				msleep_interruptible(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1446  				sync =3D sync_chk(state, &VIRM);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1447  				dprintk(verbose, MB86A16_INFO, 1, "-------- Viterbi=3D=
[%d] SYNC=3D[%d] ---------", VIRM, sync);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1448  				if (VIRM) {
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1449  					if (VIRM =3D=3D 4) {
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1450  						/* 5/6 */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1451  						if (SIG1 > 110)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1452  							wait_t =3D (786432 + state->srate / 2) / state->sra=
te;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1453  						else
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1454  							wait_t =3D (1572864 + state->srate / 2) / state->sr=
ate;
ef4349ebab1d68 drivers/media/dvb-frontends/mb86a16.c Daniel W. S. Almeida 2=
020-08-07  1455  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1456  						msleep_interruptible(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1457  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1458  						if (sync_chk(state, &junk) =3D=3D 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1459  							iq_vt_set(state, 1);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1460  							FEC_srst(state);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1461  						}
77557abef0de3f drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-03  1462  					}
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1463  					/* 1/2, 2/3, 3/4, 7/8 */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1464  					if (SIG1 > 110)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1465  						wait_t =3D (786432 + state->srate / 2) / state->srat=
e;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1466  					else
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1467  						wait_t =3D (1572864 + state->srate / 2) / state->sra=
te;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1468  					msleep_interruptible(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1469  					SEQ_set(state, 1);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1470  				} else {
776c3ebe9678f8 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1471  					dprintk(verbose, MB86A16_INFO, 1, "NO  -- SYNC");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1472  					SEQ_set(state, 1);
5dd83a35bea908 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1473  					ret =3D -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1474  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1475  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1476  		} else {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1477  			dprintk(verbose, MB86A16_INFO, 1, "NO  -- SIGNAL");
5dd83a35bea908 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1478  			ret =3D -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1479  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1480  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1481  		sync =3D sync_chk(state, &junk);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1482  		if (sync) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1483  			dprintk(verbose, MB86A16_INFO, 1, "******* SYNC *******=
");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1484  			freqerr_chk(state, state->frequency, state->srate, 1);
5dd83a35bea908 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-15  1485  			ret =3D 0;
071e3060a5f482 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1486  			break;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1487  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1488  	}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1489  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1490  	mb86a16_read(state, 0x15, &agcval);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1491  	mb86a16_read(state, 0x26, &cnmval);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1492  	dprintk(verbose, MB86A16_INFO, 1, "AGC =3D %02x CNM =3D %=
02x", agcval, cnmval);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1493  =

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1494  	return ret;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1495  }
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2=
009-12-02  1496  =


:::::: The code at line 1392 was first introduced by commit
:::::: 41e840b13e111ba18b138d055ddd250bd5ad5e39 V4L/DVB (13699): [Mantis, M=
B86A16] Initial checkin: Mantis, MB86A16

:::::: TO: Manu Abraham <abraham.manu@gmail.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5771700455908182962==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5771700455908182962==--

