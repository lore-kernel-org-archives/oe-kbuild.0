Content-Type: multipart/mixed; boundary="===============6958969479654671416=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/pistachio/clk.c:41 pistachio_clk_alloc_provider() warn: 'p->base' from of_iomap() not released on lines: 41.
Date: Fri, 25 Mar 2022 20:40:23 +0800
Message-ID: <202203252039.O2pYwMEr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6958969479654671416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jiaxun Yang <jiaxun.yang@flygoat.com>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Jiaxun,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   34af78c4e616c359ed428d79fe4758a35d2c5473
commit: 90429205c000f4befdc212cfade39e358292584c clk: pistachio: Make it se=
lectable for generic MIPS kernel
date:   8 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 months ago
config: riscv-randconfig-m031-20220324 (https://download.01.org/0day-ci/arc=
hive/20220325/202203252039.O2pYwMEr-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/pistachio/clk.c:41 pistachio_clk_alloc_provider() warn: 'p->bas=
e' from of_iomap() not released on lines: 41.

vim +41 drivers/clk/pistachio/clk.c

8e4b7721f61e703 Andrew Bresticker 2015-02-24  14  =

8e4b7721f61e703 Andrew Bresticker 2015-02-24  15  struct pistachio_clk_prov=
ider *
8e4b7721f61e703 Andrew Bresticker 2015-02-24  16  pistachio_clk_alloc_provi=
der(struct device_node *node, unsigned int num_clks)
8e4b7721f61e703 Andrew Bresticker 2015-02-24  17  {
8e4b7721f61e703 Andrew Bresticker 2015-02-24  18  	struct pistachio_clk_pro=
vider *p;
8e4b7721f61e703 Andrew Bresticker 2015-02-24  19  =

8e4b7721f61e703 Andrew Bresticker 2015-02-24  20  	p =3D kzalloc(sizeof(*p)=
, GFP_KERNEL);
8e4b7721f61e703 Andrew Bresticker 2015-02-24  21  	if (!p)
8e4b7721f61e703 Andrew Bresticker 2015-02-24  22  		return p;
8e4b7721f61e703 Andrew Bresticker 2015-02-24  23  =

8e4b7721f61e703 Andrew Bresticker 2015-02-24  24  	p->clk_data.clks =3D kca=
lloc(num_clks, sizeof(struct clk *), GFP_KERNEL);
8e4b7721f61e703 Andrew Bresticker 2015-02-24  25  	if (!p->clk_data.clks)
8e4b7721f61e703 Andrew Bresticker 2015-02-24  26  		goto free_provider;
8e4b7721f61e703 Andrew Bresticker 2015-02-24  27  	p->clk_data.clk_num =3D =
num_clks;
8e4b7721f61e703 Andrew Bresticker 2015-02-24  28  	p->node =3D node;
8e4b7721f61e703 Andrew Bresticker 2015-02-24  29  	p->base =3D of_iomap(nod=
e, 0);
8e4b7721f61e703 Andrew Bresticker 2015-02-24  30  	if (!p->base) {
8e4b7721f61e703 Andrew Bresticker 2015-02-24  31  		pr_err("Failed to map c=
lock provider registers\n");
8e4b7721f61e703 Andrew Bresticker 2015-02-24  32  		goto free_clks;
8e4b7721f61e703 Andrew Bresticker 2015-02-24  33  	}
8e4b7721f61e703 Andrew Bresticker 2015-02-24  34  =

8e4b7721f61e703 Andrew Bresticker 2015-02-24  35  	return p;
8e4b7721f61e703 Andrew Bresticker 2015-02-24  36  =

8e4b7721f61e703 Andrew Bresticker 2015-02-24  37  free_clks:
8e4b7721f61e703 Andrew Bresticker 2015-02-24  38  	kfree(p->clk_data.clks);
8e4b7721f61e703 Andrew Bresticker 2015-02-24  39  free_provider:
8e4b7721f61e703 Andrew Bresticker 2015-02-24  40  	kfree(p);
8e4b7721f61e703 Andrew Bresticker 2015-02-24 @41  	return NULL;
8e4b7721f61e703 Andrew Bresticker 2015-02-24  42  }
8e4b7721f61e703 Andrew Bresticker 2015-02-24  43  =


:::::: The code at line 41 was first introduced by commit
:::::: 8e4b7721f61e70396ad8ec2d866c91300f2afbd1 CLK: Add basic infrastructu=
re for Pistachio clocks

:::::: TO: Andrew Bresticker <abrestic@chromium.org>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6958969479654671416==--

