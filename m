Content-Type: multipart/mixed; boundary="===============2410773907404193303=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RESEND][PATCH v3 2/2] serial: 8250: Add proper clock handling for OxSemi PCIe devices
Date: Thu, 31 Mar 2022 22:42:46 +0800
Message-ID: <202203312211.ZJqjArhw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2410773907404193303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <alpine.DEB.2.21.2203310123450.44113@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2203310123450.44113@angie.orcam.me.uk>
TO: "Maciej W. Rozycki" <macro@orcam.me.uk>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: linux-serial(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi "Maciej,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on usb/usb-testing helgaas-pci/next v5.17 next-202=
20331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-W-Rozycki/ser=
ial-8250-Fixes-for-Oxford-Semiconductor-950-UARTs/20220331-151612
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20331/202203312211.ZJqjArhw-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/tty/serial/8250/8250_pci.c:1171 pci_oxsemi_tornado_get_divisor() er=
ror: uninitialized symbol 'tcr'.
drivers/tty/serial/8250/8250_pci.c:1172 pci_oxsemi_tornado_get_divisor() er=
ror: uninitialized symbol 'quot'.
drivers/tty/serial/8250/8250_pci.c:1180 pci_oxsemi_tornado_get_divisor() er=
ror: uninitialized symbol 'cpr'.

Old smatch warnings:
drivers/tty/serial/8250/8250_pci.c:1176 pci_oxsemi_tornado_get_divisor() er=
ror: uninitialized symbol 'quot'.
drivers/tty/serial/8250/8250_pci.c:1190 pci_oxsemi_tornado_get_divisor() er=
ror: uninitialized symbol 'cpr'.

vim +/tcr +1171 drivers/tty/serial/8250/8250_pci.c

b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1049  =

b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1050  /*
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1051   * Determine the oversam=
pling rate, the clock prescaler, and the clock
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1052   * divisor for the reque=
sted baud rate.  The clock rate is 62.5 MHz,
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1053   * which is four times t=
he baud base, and the prescaler increments in
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1054   * steps of 1/8.  Theref=
ore to make calculations on integers we need
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1055   * to use a scaled clock=
 rate, which is the baud base multiplied by 32
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1056   * (or our assumed UART =
clock rate multiplied by 2).
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1057   *
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1058   * The allowed oversampl=
ing rates are from 4 up to 16 inclusive (values
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1059   * from 0 to 3 inclusive=
 map to 16).  Likewise the clock prescaler allows
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1060   * values between 1.000 =
and 63.875 inclusive (operation for values from
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1061   * 0.000 to 0.875 has no=
t been specified).  The clock divisor is the usual
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1062   * unsigned 16-bit integ=
er.
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1063   *
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1064   * For the most accurate=
 baud rate we use a table of predetermined
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1065   * oversampling rates an=
d clock prescalers that records all possible
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1066   * products of the two p=
arameters in the range from 4 up to 255 inclusive,
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1067   * and additionally 335 =
for the 1500000bps rate, with the prescaler scaled
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1068   * by 8.  The table is s=
orted by the decreasing value of the oversampling
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1069   * rate and ties are res=
olved by sorting by the decreasing value of the
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1070   * product.  This way pr=
eference is given to higher oversampling rates.
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1071   *
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1072   * We iterate over the t=
able and choose the product of an oversampling
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1073   * rate and a clock pres=
caler that gives the lowest integer division
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1074   * result deviation, or =
if an exact integer divider is found we stop
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1075   * looking for it right =
away.  We do some fixup if the resulting clock
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1076   * divisor required woul=
d be out of its unsigned 16-bit integer range.
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1077   *
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1078   * Finally we abuse the =
supposed fractional part returned to encode the
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1079   * 4-bit value of the ov=
ersampling rate and the 9-bit value of the clock
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1080   * prescaler which will =
end up in the TCR and CPR/CPR2 registers.
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1081   */
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1082  static unsigned int pci_=
oxsemi_tornado_get_divisor(struct uart_port *port,
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1083  						   unsigned int ba=
ud,
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1084  						   unsigned int *f=
rac)
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1085  {
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1086  	static u8 p[][2] =3D {
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1087  		{ 16, 14, }, { 16, 13,=
 }, { 16, 12, }, { 16, 11, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1088  		{ 16, 10, }, { 16,  9,=
 }, { 16,  8, }, { 15, 17, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1089  		{ 15, 16, }, { 15, 15,=
 }, { 15, 14, }, { 15, 13, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1090  		{ 15, 12, }, { 15, 11,=
 }, { 15, 10, }, { 15,  9, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1091  		{ 15,  8, }, { 14, 18,=
 }, { 14, 17, }, { 14, 14, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1092  		{ 14, 13, }, { 14, 12,=
 }, { 14, 11, }, { 14, 10, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1093  		{ 14,  9, }, { 14,  8,=
 }, { 13, 19, }, { 13, 18, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1094  		{ 13, 17, }, { 13, 13,=
 }, { 13, 12, }, { 13, 11, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1095  		{ 13, 10, }, { 13,  9,=
 }, { 13,  8, }, { 12, 19, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1096  		{ 12, 18, }, { 12, 17,=
 }, { 12, 11, }, { 12,  9, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1097  		{ 12,  8, }, { 11, 23,=
 }, { 11, 22, }, { 11, 21, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1098  		{ 11, 20, }, { 11, 19,=
 }, { 11, 18, }, { 11, 17, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1099  		{ 11, 11, }, { 11, 10,=
 }, { 11,  9, }, { 11,  8, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1100  		{ 10, 25, }, { 10, 23,=
 }, { 10, 20, }, { 10, 19, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1101  		{ 10, 17, }, { 10, 10,=
 }, { 10,  9, }, { 10,  8, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1102  		{  9, 27, }, {  9, 23,=
 }, {  9, 21, }, {  9, 19, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1103  		{  9, 18, }, {  9, 17,=
 }, {  9,  9, }, {  9,  8, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1104  		{  8, 31, }, {  8, 29,=
 }, {  8, 23, }, {  8, 19, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1105  		{  8, 17, }, {  8,  8,=
 }, {  7, 35, }, {  7, 31, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1106  		{  7, 29, }, {  7, 25,=
 }, {  7, 23, }, {  7, 21, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1107  		{  7, 19, }, {  7, 17,=
 }, {  7, 15, }, {  7, 14, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1108  		{  7, 13, }, {  7, 12,=
 }, {  7, 11, }, {  7, 10, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1109  		{  7,  9, }, {  7,  8,=
 }, {  6, 41, }, {  6, 37, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1110  		{  6, 31, }, {  6, 29,=
 }, {  6, 23, }, {  6, 19, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1111  		{  6, 17, }, {  6, 13,=
 }, {  6, 11, }, {  6, 10, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1112  		{  6,  9, }, {  6,  8,=
 }, {  5, 67, }, {  5, 47, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1113  		{  5, 43, }, {  5, 41,=
 }, {  5, 37, }, {  5, 31, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1114  		{  5, 29, }, {  5, 25,=
 }, {  5, 23, }, {  5, 19, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1115  		{  5, 17, }, {  5, 15,=
 }, {  5, 13, }, {  5, 11, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1116  		{  5, 10, }, {  5,  9,=
 }, {  5,  8, }, {  4, 61, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1117  		{  4, 59, }, {  4, 53,=
 }, {  4, 47, }, {  4, 43, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1118  		{  4, 41, }, {  4, 37,=
 }, {  4, 31, }, {  4, 29, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1119  		{  4, 23, }, {  4, 19,=
 }, {  4, 17, }, {  4, 13, },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1120  		{  4,  9, }, {  4,  8,=
 },
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1121  	};
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1122  	/* Scale the quotient f=
or comparison to get the fractional part.  */
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1123  	const unsigned int quot=
_scale =3D 65536;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1124  	unsigned int sclk =3D p=
ort->uartclk * 2;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1125  	unsigned int sdiv =3D (=
sclk + (baud / 2)) / baud;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1126  	unsigned int best_squot;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1127  	unsigned int squot;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1128  	unsigned int quot;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1129  	u16 cpr;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1130  	u8 tcr;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1131  	int i;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1132  =

b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1133  	/* Old custom speed han=
dling.  */
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1134  	if (baud =3D=3D 38400 &=
& (port->flags & UPF_SPD_MASK) =3D=3D UPF_SPD_CUST) {
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1135  		unsigned int cust_div =
=3D port->custom_divisor;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1136  =

b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1137  		quot =3D cust_div & UA=
RT_DIV_MAX;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1138  		tcr =3D (cust_div >> 1=
6) & OXSEMI_TORNADO_TCR_MASK;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1139  		cpr =3D (cust_div >> 2=
0) & OXSEMI_TORNADO_CPR_MASK;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1140  		if (cpr < OXSEMI_TORNA=
DO_CPR_MIN)
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1141  			cpr =3D OXSEMI_TORNAD=
O_CPR_DEF;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1142  	} else {
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1143  		best_squot =3D quot_sc=
ale;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1144  		for (i =3D 0; i < ARRA=
Y_SIZE(p); i++) {
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1145  			unsigned int spre;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1146  			unsigned int srem;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1147  			u8 cp;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1148  			u8 tc;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1149  =

b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1150  			tc =3D p[i][0];
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1151  			cp =3D p[i][1];
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1152  			spre =3D tc * cp;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1153  =

b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1154  			srem =3D sdiv % spre;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1155  			if (srem > spre / 2)
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1156  				srem =3D spre - srem;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1157  			squot =3D (srem * quo=
t_scale + spre / 2) / spre;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1158  =

b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1159  			if (srem =3D=3D 0) {
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1160  				tcr =3D tc;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1161  				cpr =3D cp;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1162  				quot =3D sdiv / spre;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1163  				break;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1164  			} else if (squot < be=
st_squot) {
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1165  				best_squot =3D squot;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1166  				tcr =3D tc;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1167  				cpr =3D cp;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1168  				quot =3D (sdiv + spr=
e / 2) / spre;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1169  			}
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1170  		}
b3a554d50d82ad Maciej W. Rozycki 2022-03-31 @1171  		while (tcr <=3D (OXSEM=
I_TORNADO_TCR_MASK + 1) >> 1 &&
b3a554d50d82ad Maciej W. Rozycki 2022-03-31 @1172  		       quot % 2 =3D=3D=
 0) {
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1173  			quot >>=3D 1;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1174  			tcr <<=3D 1;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1175  		}
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1176  		while (quot > UART_DIV=
_MAX) {
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1177  			if (tcr <=3D (OXSEMI_=
TORNADO_TCR_MASK + 1) >> 1) {
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1178  				quot >>=3D 1;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1179  				tcr <<=3D 1;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31 @1180  			} else if (cpr <=3D O=
XSEMI_TORNADO_CPR_MASK >> 1) {
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1181  				quot >>=3D 1;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1182  				cpr <<=3D 1;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1183  			} else {
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1184  				quot =3D quot * cpr =
/ OXSEMI_TORNADO_CPR_MASK;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1185  				cpr =3D OXSEMI_TORNA=
DO_CPR_MASK;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1186  			}
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1187  		}
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1188  	}
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1189  =

b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1190  	*frac =3D (cpr << 8) | =
(tcr & OXSEMI_TORNADO_TCR_MASK);
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1191  	return quot;
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1192  }
b3a554d50d82ad Maciej W. Rozycki 2022-03-31  1193  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2410773907404193303==--

