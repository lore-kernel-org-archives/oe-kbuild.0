Content-Type: multipart/mixed; boundary="===============8389014335756978389=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mediatek/mtk_wed_debugfs.c:73 dump_wed_regs() error: uninitialized symbol 'val'.
Date: Thu, 07 Jul 2022 13:57:52 +0800
Message-ID: <202207071350.4FvYrHKV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8389014335756978389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9f09069cde34dcd86f5ecf3a3139fd752020812f
commit: 804775dfc2885e93a0a4b35db1914c2cc25172b5 net: ethernet: mtk_eth_soc=
: add support for Wireless Ethernet Dispatch (WED)
date:   3 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 months ago
config: openrisc-randconfig-m031-20220706 (https://download.01.org/0day-ci/=
archive/20220707/202207071350.4FvYrHKV-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/mediatek/mtk_wed_debugfs.c:73 dump_wed_regs() error: u=
ninitialized symbol 'val'.

vim +/val +73 drivers/net/ethernet/mediatek/mtk_wed_debugfs.c

804775dfc2885e Felix Fietkau 2022-04-05  45  =

804775dfc2885e Felix Fietkau 2022-04-05  46  static void
804775dfc2885e Felix Fietkau 2022-04-05  47  dump_wed_regs(struct seq_file =
*s, struct mtk_wed_device *dev,
804775dfc2885e Felix Fietkau 2022-04-05  48  	      const struct reg_dump *=
regs, int n_regs)
804775dfc2885e Felix Fietkau 2022-04-05  49  {
804775dfc2885e Felix Fietkau 2022-04-05  50  	const struct reg_dump *cur;
804775dfc2885e Felix Fietkau 2022-04-05  51  	u32 val;
804775dfc2885e Felix Fietkau 2022-04-05  52  =

804775dfc2885e Felix Fietkau 2022-04-05  53  	for (cur =3D regs; cur < &reg=
s[n_regs]; cur++) {
804775dfc2885e Felix Fietkau 2022-04-05  54  		switch (cur->type) {
804775dfc2885e Felix Fietkau 2022-04-05  55  		case DUMP_TYPE_STRING:
804775dfc2885e Felix Fietkau 2022-04-05  56  			seq_printf(s, "%s=3D=3D=3D=
=3D=3D=3D=3D=3D %s:\n",
804775dfc2885e Felix Fietkau 2022-04-05  57  				   cur > regs ? "\n" : "",
804775dfc2885e Felix Fietkau 2022-04-05  58  				   cur->name);
804775dfc2885e Felix Fietkau 2022-04-05  59  			continue;
804775dfc2885e Felix Fietkau 2022-04-05  60  		case DUMP_TYPE_WED:
804775dfc2885e Felix Fietkau 2022-04-05  61  			val =3D wed_r32(dev, cur->o=
ffset);
804775dfc2885e Felix Fietkau 2022-04-05  62  			break;
804775dfc2885e Felix Fietkau 2022-04-05  63  		case DUMP_TYPE_WDMA:
804775dfc2885e Felix Fietkau 2022-04-05  64  			val =3D wdma_r32(dev, cur->=
offset);
804775dfc2885e Felix Fietkau 2022-04-05  65  			break;
804775dfc2885e Felix Fietkau 2022-04-05  66  		case DUMP_TYPE_WPDMA_TX:
804775dfc2885e Felix Fietkau 2022-04-05  67  			val =3D wpdma_tx_r32(dev, c=
ur->base, cur->offset);
804775dfc2885e Felix Fietkau 2022-04-05  68  			break;
804775dfc2885e Felix Fietkau 2022-04-05  69  		case DUMP_TYPE_WPDMA_TXFREE:
804775dfc2885e Felix Fietkau 2022-04-05  70  			val =3D wpdma_txfree_r32(de=
v, cur->offset);
804775dfc2885e Felix Fietkau 2022-04-05  71  			break;
804775dfc2885e Felix Fietkau 2022-04-05  72  		}
804775dfc2885e Felix Fietkau 2022-04-05 @73  		print_reg_val(s, cur->name, =
val);
804775dfc2885e Felix Fietkau 2022-04-05  74  	}
804775dfc2885e Felix Fietkau 2022-04-05  75  }
804775dfc2885e Felix Fietkau 2022-04-05  76  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8389014335756978389==--

