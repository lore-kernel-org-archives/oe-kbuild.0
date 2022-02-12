Content-Type: multipart/mixed; boundary="===============8099142726953061072=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] serial: 8250: Add proper clock handling for OxSemi PCIe devices
Date: Sun, 13 Feb 2022 02:17:30 +0800
Message-ID: <202202130027.ZKBCgtm5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8099142726953061072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <alpine.DEB.2.21.2202111127200.34636@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2202111127200.34636@angie.orcam.me.uk>
TO: "Maciej W. Rozycki" <macro@orcam.me.uk>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Mike Skoog <mskoog@endruntechnologies.com>
CC: Mike Korreng <mkorreng@endruntechnologies.com>
CC: info(a)endruntechnologies.com
CC: linux-serial(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi "Maciej,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on usb/usb-testing helgaas-pci/next linus/master v=
5.17-rc3 next-20220211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maciej-W-Rozycki/serial-82=
50-Fixes-for-Oxford-Semiconductor-950-UARTs/20220212-164255
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20213/202202130027.ZKBCgtm5-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

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

5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1049  =

5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1050  /*
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1051   * Determine the oversam=
pling rate, the clock prescaler, and the clock
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1052   * divisor for the reque=
sted baud rate.  The clock rate is 62.5 MHz,
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1053   * which is four times t=
he baud base, and the prescaler increments in
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1054   * steps of 1/8.  Theref=
ore to make calculations on integers we need
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1055   * to use a scaled clock=
 rate, which is the baud base multiplied by 32
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1056   * (or our assumed UART =
clock rate multiplied by 2).
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1057   *
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1058   * The allowed oversampl=
ing rates are from 4 up to 16 inclusive (values
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1059   * from 0 to 3 inclusive=
 map to 16).  Likewise the clock prescaler allows
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1060   * values between 1.000 =
and 63.875 inclusive (operation for values from
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1061   * 0.000 to 0.875 has no=
t been specified).  The clock divisor is the usual
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1062   * unsigned 16-bit integ=
er.
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1063   *
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1064   * For the most accurate=
 baud rate we use a table of predetermined
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1065   * oversampling rates an=
d clock prescalers that records all possible
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1066   * products of the two p=
arameters in the range from 4 up to 255 inclusive,
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1067   * and additionally 335 =
for the 1500000bps rate, with the prescaler scaled
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1068   * by 8.  The table is s=
orted by the decreasing value of the oversampling
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1069   * rate and ties are res=
olved by sorting by the decreasing value of the
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1070   * product.  This way pr=
eference is given to higher oversampling rates.
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1071   *
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1072   * We iterate over the t=
able and choose the product of an oversampling
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1073   * rate and a clock pres=
caler that gives the lowest integer division
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1074   * result deviation, or =
if an exact integer divider is found we stop
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1075   * looking for it right =
away.  We do some fixup if the resulting clock
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1076   * divisor required woul=
d be out of its unsigned 16-bit integer range.
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1077   *
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1078   * Finally we abuse the =
supposed fractional part returned to encode the
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1079   * 4-bit value of the ov=
ersampling rate and the 9-bit value of the clock
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1080   * prescaler which will =
end up in the TCR and CPR/CPR2 registers.
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1081   */
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1082  static unsigned int pci_=
oxsemi_tornado_get_divisor(struct uart_port *port,
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1083  						   unsigned int ba=
ud,
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1084  						   unsigned int *f=
rac)
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1085  {
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1086  	static u8 p[][2] =3D {
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1087  		{ 16, 14, }, { 16, 13,=
 }, { 16, 12, }, { 16, 11, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1088  		{ 16, 10, }, { 16,  9,=
 }, { 16,  8, }, { 15, 17, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1089  		{ 15, 16, }, { 15, 15,=
 }, { 15, 14, }, { 15, 13, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1090  		{ 15, 12, }, { 15, 11,=
 }, { 15, 10, }, { 15,  9, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1091  		{ 15,  8, }, { 14, 18,=
 }, { 14, 17, }, { 14, 14, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1092  		{ 14, 13, }, { 14, 12,=
 }, { 14, 11, }, { 14, 10, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1093  		{ 14,  9, }, { 14,  8,=
 }, { 13, 19, }, { 13, 18, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1094  		{ 13, 17, }, { 13, 13,=
 }, { 13, 12, }, { 13, 11, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1095  		{ 13, 10, }, { 13,  9,=
 }, { 13,  8, }, { 12, 19, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1096  		{ 12, 18, }, { 12, 17,=
 }, { 12, 11, }, { 12,  9, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1097  		{ 12,  8, }, { 11, 23,=
 }, { 11, 22, }, { 11, 21, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1098  		{ 11, 20, }, { 11, 19,=
 }, { 11, 18, }, { 11, 17, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1099  		{ 11, 11, }, { 11, 10,=
 }, { 11,  9, }, { 11,  8, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1100  		{ 10, 25, }, { 10, 23,=
 }, { 10, 20, }, { 10, 19, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1101  		{ 10, 17, }, { 10, 10,=
 }, { 10,  9, }, { 10,  8, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1102  		{  9, 27, }, {  9, 23,=
 }, {  9, 21, }, {  9, 19, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1103  		{  9, 18, }, {  9, 17,=
 }, {  9,  9, }, {  9,  8, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1104  		{  8, 31, }, {  8, 29,=
 }, {  8, 23, }, {  8, 19, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1105  		{  8, 17, }, {  8,  8,=
 }, {  7, 35, }, {  7, 31, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1106  		{  7, 29, }, {  7, 25,=
 }, {  7, 23, }, {  7, 21, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1107  		{  7, 19, }, {  7, 17,=
 }, {  7, 15, }, {  7, 14, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1108  		{  7, 13, }, {  7, 12,=
 }, {  7, 11, }, {  7, 10, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1109  		{  7,  9, }, {  7,  8,=
 }, {  6, 41, }, {  6, 37, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1110  		{  6, 31, }, {  6, 29,=
 }, {  6, 23, }, {  6, 19, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1111  		{  6, 17, }, {  6, 13,=
 }, {  6, 11, }, {  6, 10, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1112  		{  6,  9, }, {  6,  8,=
 }, {  5, 67, }, {  5, 47, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1113  		{  5, 43, }, {  5, 41,=
 }, {  5, 37, }, {  5, 31, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1114  		{  5, 29, }, {  5, 25,=
 }, {  5, 23, }, {  5, 19, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1115  		{  5, 17, }, {  5, 15,=
 }, {  5, 13, }, {  5, 11, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1116  		{  5, 10, }, {  5,  9,=
 }, {  5,  8, }, {  4, 61, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1117  		{  4, 59, }, {  4, 53,=
 }, {  4, 47, }, {  4, 43, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1118  		{  4, 41, }, {  4, 37,=
 }, {  4, 31, }, {  4, 29, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1119  		{  4, 23, }, {  4, 19,=
 }, {  4, 17, }, {  4, 13, },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1120  		{  4,  9, }, {  4,  8,=
 },
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1121  	};
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1122  	/* Scale the quotient f=
or comparison to get the fractional part.  */
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1123  	const unsigned int quot=
_scale =3D 65536;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1124  	unsigned int sclk =3D p=
ort->uartclk * 2;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1125  	unsigned int sdiv =3D (=
sclk + (baud / 2)) / baud;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1126  	unsigned int best_squot;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1127  	unsigned int squot;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1128  	unsigned int quot;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1129  	u16 cpr;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1130  	u8 tcr;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1131  	int i;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1132  =

5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1133  	/* Old custom speed han=
dling.  */
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1134  	if (baud =3D=3D 38400 &=
& (port->flags & UPF_SPD_MASK) =3D=3D UPF_SPD_CUST) {
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1135  		unsigned int cust_div =
=3D port->custom_divisor;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1136  =

5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1137  		quot =3D cust_div & UA=
RT_DIV_MAX;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1138  		tcr =3D (cust_div >> 1=
6) & OXSEMI_TORNADO_TCR_MASK;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1139  		cpr =3D (cust_div >> 2=
0) & OXSEMI_TORNADO_CPR_MASK;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1140  		if (cpr < OXSEMI_TORNA=
DO_CPR_MIN)
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1141  			cpr =3D OXSEMI_TORNAD=
O_CPR_DEF;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1142  	} else {
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1143  		best_squot =3D quot_sc=
ale;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1144  		for (i =3D 0; i < ARRA=
Y_SIZE(p); i++) {
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1145  			unsigned int spre;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1146  			unsigned int srem;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1147  			u8 cp;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1148  			u8 tc;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1149  =

5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1150  			tc =3D p[i][0];
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1151  			cp =3D p[i][1];
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1152  			spre =3D tc * cp;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1153  =

5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1154  			srem =3D sdiv % spre;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1155  			if (srem > spre / 2)
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1156  				srem =3D spre - srem;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1157  			squot =3D (srem * quo=
t_scale + spre / 2) / spre;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1158  =

5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1159  			if (srem =3D=3D 0) {
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1160  				tcr =3D tc;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1161  				cpr =3D cp;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1162  				quot =3D sdiv / spre;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1163  				break;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1164  			} else if (squot < be=
st_squot) {
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1165  				best_squot =3D squot;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1166  				tcr =3D tc;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1167  				cpr =3D cp;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1168  				quot =3D (sdiv + spr=
e / 2) / spre;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1169  			}
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1170  		}
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12 @1171  		while (tcr <=3D (OXSEM=
I_TORNADO_TCR_MASK + 1) >> 1 &&
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12 @1172  		       quot % 2 =3D=3D=
 0) {
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1173  			quot >>=3D 1;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1174  			tcr <<=3D 1;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1175  		}
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1176  		while (quot > UART_DIV=
_MAX) {
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1177  			if (tcr <=3D (OXSEMI_=
TORNADO_TCR_MASK + 1) >> 1) {
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1178  				quot >>=3D 1;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1179  				tcr <<=3D 1;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12 @1180  			} else if (cpr <=3D O=
XSEMI_TORNADO_CPR_MASK >> 1) {
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1181  				quot >>=3D 1;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1182  				cpr <<=3D 1;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1183  			} else {
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1184  				quot =3D quot * cpr =
/ OXSEMI_TORNADO_CPR_MASK;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1185  				cpr =3D OXSEMI_TORNA=
DO_CPR_MASK;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1186  			}
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1187  		}
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1188  	}
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1189  =

5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1190  	*frac =3D (cpr << 8) | =
(tcr & OXSEMI_TORNADO_TCR_MASK);
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1191  	return quot;
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1192  }
5a389fe2b5e750 Maciej W. Rozycki 2022-02-12  1193  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============8099142726953061072==--

