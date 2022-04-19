Content-Type: multipart/mixed; boundary="===============7353814461361225341=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 5/5] serial: 8250: Add proper clock handling for OxSemi PCIe devices
Date: Tue, 19 Apr 2022 12:30:14 +0800
Message-ID: <202204191204.VBY8ilTt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7353814461361225341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <alpine.DEB.2.21.2204181519450.9383@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2204181519450.9383@angie.orcam.me.uk>
TO: "Maciej W. Rozycki" <macro@orcam.me.uk>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: linux-serial(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi "Maciej,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on usb/usb-testing linus/master v5.18-rc3 next-202=
20414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-W-Rozycki/ser=
ial-8250-Fixes-for-Oxford-Semiconductor-950-UARTs/20220418-234958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-m021-20220418 (https://download.01.org/0day-ci/arch=
ive/20220419/202204191204.VBY8ilTt-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/tty/serial/8250/8250_pci.c:1175 pci_oxsemi_tornado_get_divisor() er=
ror: uninitialized symbol 'tcr'.
drivers/tty/serial/8250/8250_pci.c:1176 pci_oxsemi_tornado_get_divisor() er=
ror: uninitialized symbol 'quot'.
drivers/tty/serial/8250/8250_pci.c:1184 pci_oxsemi_tornado_get_divisor() er=
ror: uninitialized symbol 'cpr'.

Old smatch warnings:
drivers/tty/serial/8250/8250_pci.c:1180 pci_oxsemi_tornado_get_divisor() er=
ror: uninitialized symbol 'quot'.
drivers/tty/serial/8250/8250_pci.c:1194 pci_oxsemi_tornado_get_divisor() er=
ror: uninitialized symbol 'cpr'.

vim +/tcr +1175 drivers/tty/serial/8250/8250_pci.c

42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1053  =

42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1054  /*
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1055   * Determine the oversam=
pling rate, the clock prescaler, and the clock
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1056   * divisor for the reque=
sted baud rate.  The clock rate is 62.5 MHz,
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1057   * which is four times t=
he baud base, and the prescaler increments in
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1058   * steps of 1/8.  Theref=
ore to make calculations on integers we need
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1059   * to use a scaled clock=
 rate, which is the baud base multiplied by 32
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1060   * (or our assumed UART =
clock rate multiplied by 2).
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1061   *
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1062   * The allowed oversampl=
ing rates are from 4 up to 16 inclusive (values
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1063   * from 0 to 3 inclusive=
 map to 16).  Likewise the clock prescaler allows
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1064   * values between 1.000 =
and 63.875 inclusive (operation for values from
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1065   * 0.000 to 0.875 has no=
t been specified).  The clock divisor is the usual
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1066   * unsigned 16-bit integ=
er.
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1067   *
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1068   * For the most accurate=
 baud rate we use a table of predetermined
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1069   * oversampling rates an=
d clock prescalers that records all possible
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1070   * products of the two p=
arameters in the range from 4 up to 255 inclusive,
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1071   * and additionally 335 =
for the 1500000bps rate, with the prescaler scaled
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1072   * by 8.  The table is s=
orted by the decreasing value of the oversampling
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1073   * rate and ties are res=
olved by sorting by the decreasing value of the
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1074   * product.  This way pr=
eference is given to higher oversampling rates.
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1075   *
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1076   * We iterate over the t=
able and choose the product of an oversampling
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1077   * rate and a clock pres=
caler that gives the lowest integer division
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1078   * result deviation, or =
if an exact integer divider is found we stop
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1079   * looking for it right =
away.  We do some fixup if the resulting clock
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1080   * divisor required woul=
d be out of its unsigned 16-bit integer range.
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1081   *
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1082   * Finally we abuse the =
supposed fractional part returned to encode the
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1083   * 4-bit value of the ov=
ersampling rate and the 9-bit value of the clock
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1084   * prescaler which will =
end up in the TCR and CPR/CPR2 registers.
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1085   */
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1086  static unsigned int pci_=
oxsemi_tornado_get_divisor(struct uart_port *port,
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1087  						   unsigned int ba=
ud,
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1088  						   unsigned int *f=
rac)
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1089  {
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1090  	static u8 p[][2] =3D {
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1091  		{ 16, 14, }, { 16, 13,=
 }, { 16, 12, }, { 16, 11, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1092  		{ 16, 10, }, { 16,  9,=
 }, { 16,  8, }, { 15, 17, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1093  		{ 15, 16, }, { 15, 15,=
 }, { 15, 14, }, { 15, 13, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1094  		{ 15, 12, }, { 15, 11,=
 }, { 15, 10, }, { 15,  9, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1095  		{ 15,  8, }, { 14, 18,=
 }, { 14, 17, }, { 14, 14, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1096  		{ 14, 13, }, { 14, 12,=
 }, { 14, 11, }, { 14, 10, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1097  		{ 14,  9, }, { 14,  8,=
 }, { 13, 19, }, { 13, 18, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1098  		{ 13, 17, }, { 13, 13,=
 }, { 13, 12, }, { 13, 11, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1099  		{ 13, 10, }, { 13,  9,=
 }, { 13,  8, }, { 12, 19, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1100  		{ 12, 18, }, { 12, 17,=
 }, { 12, 11, }, { 12,  9, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1101  		{ 12,  8, }, { 11, 23,=
 }, { 11, 22, }, { 11, 21, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1102  		{ 11, 20, }, { 11, 19,=
 }, { 11, 18, }, { 11, 17, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1103  		{ 11, 11, }, { 11, 10,=
 }, { 11,  9, }, { 11,  8, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1104  		{ 10, 25, }, { 10, 23,=
 }, { 10, 20, }, { 10, 19, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1105  		{ 10, 17, }, { 10, 10,=
 }, { 10,  9, }, { 10,  8, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1106  		{  9, 27, }, {  9, 23,=
 }, {  9, 21, }, {  9, 19, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1107  		{  9, 18, }, {  9, 17,=
 }, {  9,  9, }, {  9,  8, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1108  		{  8, 31, }, {  8, 29,=
 }, {  8, 23, }, {  8, 19, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1109  		{  8, 17, }, {  8,  8,=
 }, {  7, 35, }, {  7, 31, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1110  		{  7, 29, }, {  7, 25,=
 }, {  7, 23, }, {  7, 21, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1111  		{  7, 19, }, {  7, 17,=
 }, {  7, 15, }, {  7, 14, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1112  		{  7, 13, }, {  7, 12,=
 }, {  7, 11, }, {  7, 10, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1113  		{  7,  9, }, {  7,  8,=
 }, {  6, 41, }, {  6, 37, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1114  		{  6, 31, }, {  6, 29,=
 }, {  6, 23, }, {  6, 19, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1115  		{  6, 17, }, {  6, 13,=
 }, {  6, 11, }, {  6, 10, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1116  		{  6,  9, }, {  6,  8,=
 }, {  5, 67, }, {  5, 47, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1117  		{  5, 43, }, {  5, 41,=
 }, {  5, 37, }, {  5, 31, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1118  		{  5, 29, }, {  5, 25,=
 }, {  5, 23, }, {  5, 19, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1119  		{  5, 17, }, {  5, 15,=
 }, {  5, 13, }, {  5, 11, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1120  		{  5, 10, }, {  5,  9,=
 }, {  5,  8, }, {  4, 61, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1121  		{  4, 59, }, {  4, 53,=
 }, {  4, 47, }, {  4, 43, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1122  		{  4, 41, }, {  4, 37,=
 }, {  4, 31, }, {  4, 29, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1123  		{  4, 23, }, {  4, 19,=
 }, {  4, 17, }, {  4, 13, },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1124  		{  4,  9, }, {  4,  8,=
 },
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1125  	};
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1126  	/* Scale the quotient f=
or comparison to get the fractional part.  */
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1127  	const unsigned int quot=
_scale =3D 65536;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1128  	unsigned int sclk =3D p=
ort->uartclk * 2;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1129  	unsigned int sdiv =3D D=
IV_ROUND_CLOSEST(sclk, baud);
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1130  	unsigned int best_squot;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1131  	unsigned int squot;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1132  	unsigned int quot;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1133  	u16 cpr;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1134  	u8 tcr;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1135  	int i;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1136  =

42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1137  	/* Old custom speed han=
dling.  */
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1138  	if (baud =3D=3D 38400 &=
& (port->flags & UPF_SPD_MASK) =3D=3D UPF_SPD_CUST) {
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1139  		unsigned int cust_div =
=3D port->custom_divisor;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1140  =

42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1141  		quot =3D cust_div & UA=
RT_DIV_MAX;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1142  		tcr =3D (cust_div >> 1=
6) & OXSEMI_TORNADO_TCR_MASK;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1143  		cpr =3D (cust_div >> 2=
0) & OXSEMI_TORNADO_CPR_MASK;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1144  		if (cpr < OXSEMI_TORNA=
DO_CPR_MIN)
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1145  			cpr =3D OXSEMI_TORNAD=
O_CPR_DEF;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1146  	} else {
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1147  		best_squot =3D quot_sc=
ale;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1148  		for (i =3D 0; i < ARRA=
Y_SIZE(p); i++) {
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1149  			unsigned int spre;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1150  			unsigned int srem;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1151  			u8 cp;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1152  			u8 tc;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1153  =

42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1154  			tc =3D p[i][0];
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1155  			cp =3D p[i][1];
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1156  			spre =3D tc * cp;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1157  =

42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1158  			srem =3D sdiv % spre;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1159  			if (srem > spre / 2)
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1160  				srem =3D spre - srem;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1161  			squot =3D DIV_ROUND_C=
LOSEST(srem * quot_scale, spre);
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1162  =

42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1163  			if (srem =3D=3D 0) {
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1164  				tcr =3D tc;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1165  				cpr =3D cp;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1166  				quot =3D sdiv / spre;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1167  				break;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1168  			} else if (squot < be=
st_squot) {
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1169  				best_squot =3D squot;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1170  				tcr =3D tc;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1171  				cpr =3D cp;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1172  				quot =3D DIV_ROUND_C=
LOSEST(sdiv, spre);
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1173  			}
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1174  		}
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18 @1175  		while (tcr <=3D (OXSEM=
I_TORNADO_TCR_MASK + 1) >> 1 &&
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18 @1176  		       quot % 2 =3D=3D=
 0) {
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1177  			quot >>=3D 1;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1178  			tcr <<=3D 1;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1179  		}
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1180  		while (quot > UART_DIV=
_MAX) {
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1181  			if (tcr <=3D (OXSEMI_=
TORNADO_TCR_MASK + 1) >> 1) {
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1182  				quot >>=3D 1;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1183  				tcr <<=3D 1;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18 @1184  			} else if (cpr <=3D O=
XSEMI_TORNADO_CPR_MASK >> 1) {
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1185  				quot >>=3D 1;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1186  				cpr <<=3D 1;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1187  			} else {
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1188  				quot =3D quot * cpr =
/ OXSEMI_TORNADO_CPR_MASK;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1189  				cpr =3D OXSEMI_TORNA=
DO_CPR_MASK;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1190  			}
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1191  		}
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1192  	}
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1193  =

42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1194  	*frac =3D (cpr << 8) | =
(tcr & OXSEMI_TORNADO_TCR_MASK);
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1195  	return quot;
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1196  }
42c36d19c0b2a9 Maciej W. Rozycki 2022-04-18  1197  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7353814461361225341==--

