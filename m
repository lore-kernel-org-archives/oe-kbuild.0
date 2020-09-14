Content-Type: multipart/mixed; boundary="===============4473862293945125072=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/i2c/busses/i2c-npcm7xx.c:1151:10: warning: Variable 'status' is reassigned a value before the old one has been used.
Date: Mon, 14 Sep 2020 10:39:41 +0800
Message-ID: <202009141038.XMaM6U3U%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4473862293945125072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tali Perry <tali.perry1@gmail.com>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   856deb866d16e29bd65952e0289066f6078af773
commit: 56a1485b102ed1cd5a4af8e87ed794699fd1cad2 i2c: npcm7xx: Add Nuvoton =
NPCM I2C controller driver
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/i2c/busses/i2c-npcm7xx.c:1151:10: warning: Variable 'status' is =
reassigned a value before the old one has been used. [redundantAssignment]
     status =3D 0;
            ^
   drivers/i2c/busses/i2c-npcm7xx.c:1088:0: note: Variable 'status' is reas=
signed a value before the old one has been used.
    int              status =3D -ENOTRECOVERABLE;
   ^
   drivers/i2c/busses/i2c-npcm7xx.c:1151:10: note: Variable 'status' is rea=
ssigned a value before the old one has been used.
     status =3D 0;
            ^
>> drivers/i2c/busses/i2c-npcm7xx.c:1151:10: warning: Variable 'status' is =
reassigned a value before the old one has been used. [redundantAssignment]
     status =3D 0;
            ^
   drivers/i2c/busses/i2c-npcm7xx.c:1138:10: note: Variable 'status' is rea=
ssigned a value before the old one has been used.
     status =3D readx_poll_timeout(npcm_i2c_get_SCL, _adap, val, !val,
            ^
   drivers/i2c/busses/i2c-npcm7xx.c:1151:10: note: Variable 'status' is rea=
ssigned a value before the old one has been used.
     status =3D 0;
            ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D56a1485b102ed1cd5a4af8e87ed794699fd1cad2
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 56a1485b102ed1cd5a4af8e87ed794699fd1cad2
vim +/status +1151 drivers/i2c/busses/i2c-npcm7xx.c

56a1485b102ed1c Tali Perry 2020-05-27  1081  =

56a1485b102ed1c Tali Perry 2020-05-27  1082  /* recovery using TGCLK functi=
onality of the module */
56a1485b102ed1c Tali Perry 2020-05-27  1083  static int npcm_i2c_recovery_t=
gclk(struct i2c_adapter *_adap)
56a1485b102ed1c Tali Perry 2020-05-27  1084  {
56a1485b102ed1c Tali Perry 2020-05-27  1085  	u8               val;
56a1485b102ed1c Tali Perry 2020-05-27  1086  	u8               fif_cts;
56a1485b102ed1c Tali Perry 2020-05-27  1087  	bool             done =3D fal=
se;
56a1485b102ed1c Tali Perry 2020-05-27  1088  	int              status =3D -=
ENOTRECOVERABLE;
56a1485b102ed1c Tali Perry 2020-05-27  1089  	struct npcm_i2c *bus =3D cont=
ainer_of(_adap, struct npcm_i2c, adap);
56a1485b102ed1c Tali Perry 2020-05-27  1090  	/* Allow 3 bytes (27 toggles)=
 to be read from the slave: */
56a1485b102ed1c Tali Perry 2020-05-27  1091  	int              iter =3D 27;
56a1485b102ed1c Tali Perry 2020-05-27  1092  =

56a1485b102ed1c Tali Perry 2020-05-27  1093  	if ((npcm_i2c_get_SDA(_adap) =
=3D=3D 1) && (npcm_i2c_get_SCL(_adap) =3D=3D 1)) {
56a1485b102ed1c Tali Perry 2020-05-27  1094  		dev_dbg(bus->dev, "bus%d rec=
overy skipped, bus not stuck",
56a1485b102ed1c Tali Perry 2020-05-27  1095  			bus->num);
56a1485b102ed1c Tali Perry 2020-05-27  1096  		npcm_i2c_reset(bus);
56a1485b102ed1c Tali Perry 2020-05-27  1097  		return status;
56a1485b102ed1c Tali Perry 2020-05-27  1098  	}
56a1485b102ed1c Tali Perry 2020-05-27  1099  =

56a1485b102ed1c Tali Perry 2020-05-27  1100  	npcm_i2c_int_enable(bus, fals=
e);
56a1485b102ed1c Tali Perry 2020-05-27  1101  	npcm_i2c_disable(bus);
56a1485b102ed1c Tali Perry 2020-05-27  1102  	npcm_i2c_enable(bus);
56a1485b102ed1c Tali Perry 2020-05-27  1103  	iowrite8(NPCM_I2CCST_BB, bus-=
>reg + NPCM_I2CCST);
56a1485b102ed1c Tali Perry 2020-05-27  1104  	npcm_i2c_clear_tx_fifo(bus);
56a1485b102ed1c Tali Perry 2020-05-27  1105  	npcm_i2c_clear_rx_fifo(bus);
56a1485b102ed1c Tali Perry 2020-05-27  1106  	iowrite8(0, bus->reg + NPCM_I=
2CRXF_CTL);
56a1485b102ed1c Tali Perry 2020-05-27  1107  	iowrite8(0, bus->reg + NPCM_I=
2CTXF_CTL);
56a1485b102ed1c Tali Perry 2020-05-27  1108  	npcm_i2c_stall_after_start(bu=
s, false);
56a1485b102ed1c Tali Perry 2020-05-27  1109  =

56a1485b102ed1c Tali Perry 2020-05-27  1110  	/* select bank 1 for FIFO reg=
s */
56a1485b102ed1c Tali Perry 2020-05-27  1111  	npcm_i2c_select_bank(bus, I2C=
_BANK_1);
56a1485b102ed1c Tali Perry 2020-05-27  1112  =

56a1485b102ed1c Tali Perry 2020-05-27  1113  	/* clear FIFO and relevant st=
atus bits. */
56a1485b102ed1c Tali Perry 2020-05-27  1114  	fif_cts =3D ioread8(bus->reg =
+ NPCM_I2CFIF_CTS);
56a1485b102ed1c Tali Perry 2020-05-27  1115  	fif_cts &=3D ~NPCM_I2CFIF_CTS=
_SLVRSTR;
56a1485b102ed1c Tali Perry 2020-05-27  1116  	fif_cts |=3D NPCM_I2CFIF_CTS_=
CLR_FIFO;
56a1485b102ed1c Tali Perry 2020-05-27  1117  	iowrite8(fif_cts, bus->reg + =
NPCM_I2CFIF_CTS);
56a1485b102ed1c Tali Perry 2020-05-27  1118  	npcm_i2c_set_fifo(bus, -1, 0);
56a1485b102ed1c Tali Perry 2020-05-27  1119  =

56a1485b102ed1c Tali Perry 2020-05-27  1120  	/* Repeat the following seque=
nce until SDA is released */
56a1485b102ed1c Tali Perry 2020-05-27  1121  	do {
56a1485b102ed1c Tali Perry 2020-05-27  1122  		/* Issue a single SCL toggle=
 */
56a1485b102ed1c Tali Perry 2020-05-27  1123  		iowrite8(NPCM_I2CCST_TGSCL, =
bus->reg + NPCM_I2CCST);
56a1485b102ed1c Tali Perry 2020-05-27  1124  		usleep_range(20, 30);
56a1485b102ed1c Tali Perry 2020-05-27  1125  		/* If SDA line is inactive (=
high), stop */
56a1485b102ed1c Tali Perry 2020-05-27  1126  		if (npcm_i2c_get_SDA(_adap))=
 {
56a1485b102ed1c Tali Perry 2020-05-27  1127  			done =3D true;
56a1485b102ed1c Tali Perry 2020-05-27  1128  			status =3D 0;
56a1485b102ed1c Tali Perry 2020-05-27  1129  		}
56a1485b102ed1c Tali Perry 2020-05-27  1130  	} while (!done && iter--);
56a1485b102ed1c Tali Perry 2020-05-27  1131  =

56a1485b102ed1c Tali Perry 2020-05-27  1132  	/* If SDA line is released: s=
end start-addr-stop, to re-sync. */
56a1485b102ed1c Tali Perry 2020-05-27  1133  	if (npcm_i2c_get_SDA(_adap)) {
56a1485b102ed1c Tali Perry 2020-05-27  1134  		/* Send an address byte in w=
rite direction: */
56a1485b102ed1c Tali Perry 2020-05-27  1135  		npcm_i2c_wr_byte(bus, bus->d=
est_addr);
56a1485b102ed1c Tali Perry 2020-05-27  1136  		npcm_i2c_master_start(bus);
56a1485b102ed1c Tali Perry 2020-05-27  1137  		/* Wait until START conditio=
n is sent */
56a1485b102ed1c Tali Perry 2020-05-27  1138  		status =3D readx_poll_timeou=
t(npcm_i2c_get_SCL, _adap, val, !val,
56a1485b102ed1c Tali Perry 2020-05-27  1139  					    20, 200);
56a1485b102ed1c Tali Perry 2020-05-27  1140  		/* If START condition was se=
nt */
56a1485b102ed1c Tali Perry 2020-05-27  1141  		if (npcm_i2c_is_master(bus) =
> 0) {
56a1485b102ed1c Tali Perry 2020-05-27  1142  			usleep_range(20, 30);
56a1485b102ed1c Tali Perry 2020-05-27  1143  			npcm_i2c_master_stop(bus);
56a1485b102ed1c Tali Perry 2020-05-27  1144  			usleep_range(200, 500);
56a1485b102ed1c Tali Perry 2020-05-27  1145  		}
56a1485b102ed1c Tali Perry 2020-05-27  1146  	}
56a1485b102ed1c Tali Perry 2020-05-27  1147  	npcm_i2c_reset(bus);
56a1485b102ed1c Tali Perry 2020-05-27  1148  	npcm_i2c_int_enable(bus, true=
);
56a1485b102ed1c Tali Perry 2020-05-27  1149  =

56a1485b102ed1c Tali Perry 2020-05-27  1150  	if ((npcm_i2c_get_SDA(_adap) =
=3D=3D 1) && (npcm_i2c_get_SCL(_adap) =3D=3D 1))
56a1485b102ed1c Tali Perry 2020-05-27 @1151  		status =3D 0;
56a1485b102ed1c Tali Perry 2020-05-27  1152  	else
56a1485b102ed1c Tali Perry 2020-05-27  1153  		status =3D -ENOTRECOVERABLE;
56a1485b102ed1c Tali Perry 2020-05-27  1154  	if (status) {
56a1485b102ed1c Tali Perry 2020-05-27  1155  		if (bus->rec_fail_cnt < ULLO=
NG_MAX)
56a1485b102ed1c Tali Perry 2020-05-27  1156  			bus->rec_fail_cnt++;
56a1485b102ed1c Tali Perry 2020-05-27  1157  	} else {
56a1485b102ed1c Tali Perry 2020-05-27  1158  		if (bus->rec_succ_cnt < ULLO=
NG_MAX)
56a1485b102ed1c Tali Perry 2020-05-27  1159  			bus->rec_succ_cnt++;
56a1485b102ed1c Tali Perry 2020-05-27  1160  	}
56a1485b102ed1c Tali Perry 2020-05-27  1161  	return status;
56a1485b102ed1c Tali Perry 2020-05-27  1162  }
56a1485b102ed1c Tali Perry 2020-05-27  1163  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4473862293945125072==--

