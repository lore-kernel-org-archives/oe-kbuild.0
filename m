Content-Type: multipart/mixed; boundary="===============0200649689717062363=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v9 3/3] media: i2c: isl7998x: Add driver for Intersil ISL7998x
Date: Thu, 02 Dec 2021 02:49:48 +0800
Message-ID: <202112020202.xy1qDFOU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0200649689717062363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211129112708.3219754-4-m.tretter@pengutronix.de>
References: <20211129112708.3219754-4-m.tretter@pengutronix.de>
TO: Michael Tretter <m.tretter@pengutronix.de>
TO: linux-media(a)vger.kernel.org
TO: devicetree(a)vger.kernel.org
TO: Marek Vasut <marex@denx.de>
CC: Rob Herring <robh+dt@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: p.zabel(a)pengutronix.de
CC: Ian Arkver <ian.arkver.dev@gmail.com>
CC: kernel(a)pengutronix.de
CC: Michael Tretter <m.tretter@pengutronix.de>

Hi Michael,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on robh/for-next linus/master v5.16-rc3 next-20211=
201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Tretter/media-i2c-=
isl7998x-Add-driver-for-Intersil-ISL7998x/20211129-204304
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001-20211130 (https://download.01.org/0day-ci/arch=
ive/20211202/202112020202.xy1qDFOU-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7f=
a01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0cd375b25d1d515c40b89e8aa=
ffd0456a19ecffb
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Tretter/media-i2c-isl7998x=
-Add-driver-for-Intersil-ISL7998x/20211129-204304
        git checkout 0cd375b25d1d515c40b89e8aaffd0456a19ecffb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   include/linux/spinlock.h:333:2: note: expanded from macro 'spin_lock_ini=
t'
           __raw_spin_lock_init(spinlock_check(lock),              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wan/pc300too.c:435:3: note: Loop condition is false.  Exitin=
g loop
                   spin_lock_init(&port->lock);
                   ^
   include/linux/spinlock.h:329:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/net/wan/pc300too.c:445:7: note: Assuming field 'type' is not equ=
al to PC300_X21
                   if (card->type =3D=3D PC300_X21)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wan/pc300too.c:445:3: note: Taking false branch
                   if (card->type =3D=3D PC300_X21)
                   ^
   drivers/net/wan/pc300too.c:450:3: note: Calling 'sca_init_port'
                   sca_init_port(port);
                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/wan/hd64572.c:123:16: note: Assuming field 'chan' is 0
           u16 dmac_rx =3D get_dmac_rx(port), dmac_tx =3D get_dmac_tx(port);
                         ^
   drivers/net/wan/hd64572.c:45:28: note: expanded from macro 'get_dmac_rx'
   #define get_dmac_rx(port) ((port)->chan ? DMAC1RX_OFFSET : DMAC0RX_OFFSE=
T)
                              ^~~~~~~~~~~~
   drivers/net/wan/hd64572.c:123:16: note: '?' condition is false
           u16 dmac_rx =3D get_dmac_rx(port), dmac_tx =3D get_dmac_tx(port);
                         ^
   drivers/net/wan/hd64572.c:45:28: note: expanded from macro 'get_dmac_rx'
   #define get_dmac_rx(port) ((port)->chan ? DMAC1RX_OFFSET : DMAC0RX_OFFSE=
T)
                              ^
   drivers/net/wan/hd64572.c:123:45: note: Field 'chan' is 0
           u16 dmac_rx =3D get_dmac_rx(port), dmac_tx =3D get_dmac_tx(port);
                                                      ^
   drivers/net/wan/hd64572.c:46:36: note: expanded from macro 'get_dmac_tx'
   #define get_dmac_tx(port) ((port)->chan ? DMAC1TX_OFFSET : DMAC0TX_OFFSE=
T)
                                      ^
   drivers/net/wan/hd64572.c:123:45: note: '?' condition is false
           u16 dmac_rx =3D get_dmac_rx(port), dmac_tx =3D get_dmac_tx(port);
                                                      ^
   drivers/net/wan/hd64572.c:46:28: note: expanded from macro 'get_dmac_tx'
   #define get_dmac_tx(port) ((port)->chan ? DMAC1TX_OFFSET : DMAC0TX_OFFSE=
T)
                              ^
   drivers/net/wan/hd64572.c:130:2: note: Loop condition is true.  Entering=
 loop body
           for (transmit =3D 0; transmit < 2; transmit++) {
           ^
   drivers/net/wan/hd64572.c:131:15: note: 'transmit' is 0
                   u16 buffs =3D transmit ? card->tx_ring_buffers
                               ^~~~~~~~
   drivers/net/wan/hd64572.c:131:15: note: '?' condition is false
   drivers/net/wan/hd64572.c:134:15: note: Assuming 'i' is >=3D 'buffs'
                   for (i =3D 0; i < buffs; i++) {
                               ^~~~~~~~~
   drivers/net/wan/hd64572.c:134:3: note: Loop condition is false. Executio=
n continues on line 130
                   for (i =3D 0; i < buffs; i++) {
                   ^
   drivers/net/wan/hd64572.c:130:2: note: Loop condition is true.  Entering=
 loop body
           for (transmit =3D 0; transmit < 2; transmit++) {
           ^
   drivers/net/wan/hd64572.c:131:15: note: 'transmit' is 1
                   u16 buffs =3D transmit ? card->tx_ring_buffers
                               ^~~~~~~~
   drivers/net/wan/hd64572.c:131:15: note: '?' condition is true
   drivers/net/wan/hd64572.c:134:15: note: Assuming 'i' is >=3D 'buffs'
                   for (i =3D 0; i < buffs; i++) {
                               ^~~~~~~~~
   drivers/net/wan/hd64572.c:134:3: note: Loop condition is false. Executio=
n continues on line 130
                   for (i =3D 0; i < buffs; i++) {
                   ^
   drivers/net/wan/hd64572.c:130:2: note: Loop condition is false. Executio=
n continues on line 147
           for (transmit =3D 0; transmit < 2; transmit++) {
           ^
   drivers/net/wan/hd64572.c:155:11: note: Calling 'desc_offset'
           sca_outl(desc_offset(port, 0, 0), dmac_rx + CDAL, card);
                    ^
   drivers/net/wan/hd64572.c:53:45: note: expanded from macro 'sca_outl'
   #define sca_outl(value, reg, card)   writel(value, (card)->scabase + (re=
g))
                                               ^~~~~
   drivers/net/wan/hd64572.c:87:9: note: Calling 'desc_abs_number'
           return desc_abs_number(port, desc, transmit) * sizeof(pkt_desc);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wan/hd64572.c:77:2: note: 'rx_buffs' initialized to 0
           u16 rx_buffs =3D port->card->rx_ring_buffers;
           ^~~~~~~~~~~~
   drivers/net/wan/hd64572.c:80:11: note: 'transmit' is 0
           desc %=3D (transmit ? tx_buffs : rx_buffs); // called with "X + =
1" etc.
                    ^~~~~~~~
   drivers/net/wan/hd64572.c:80:11: note: '?' condition is false
   drivers/net/wan/hd64572.c:80:7: note: Division by zero
           desc %=3D (transmit ? tx_buffs : rx_buffs); // called with "X + =
1" etc.
           ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/media/i2c/isl7998x.c:642:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D isl7998x->subdev.dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/isl7998x.c:642:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D isl7998x->subdev.dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/isl7998x.c:863:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &client->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/media/i2c/isl7998x.c:863:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D &client->dev;
                          ^~~   ~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/media/i2c/rdacm21.c:373:11: warning: The left operand of '=3D=3D=
' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (val =3D=3D OV10640_ID_HIGH)
                           ^
   drivers/media/i2c/rdacm21.c:550:6: note: Assuming 'dev' is non-null
           if (!dev)
               ^~~~
   drivers/media/i2c/rdacm21.c:550:2: note: Taking false branch
           if (!dev)
           ^
   drivers/media/i2c/rdacm21.c:557:6: note: 'ret' is >=3D 0
           if (ret < 0) {
               ^~~
   drivers/media/i2c/rdacm21.c:557:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/media/i2c/rdacm21.c:564:2: note: Taking false branch
           if (IS_ERR(dev->isp))
           ^
   drivers/media/i2c/rdacm21.c:567:8: note: Calling 'rdacm21_initialize'
           ret =3D rdacm21_initialize(dev);
                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/rdacm21.c:481:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:481:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:489:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:489:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:493:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:493:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:501:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:501:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:505:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:505:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:510:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:510:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:514:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:514:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:520:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:520:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:526:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:526:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/rdacm21.c:530:8: note: Calling 'ov490_initialize'
           ret =3D ov490_initialize(dev);
                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/rdacm21.c:399:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0; i < OV490_PID_TIMEOUT; ++i) {

vim +/dev +642 drivers/media/i2c/isl7998x.c

0cd375b25d1d51 Marek Vasut 2021-11-29  629  =

0cd375b25d1d51 Marek Vasut 2021-11-29  630  static int isl7998x_init(struct=
 isl7998x *isl7998x)
0cd375b25d1d51 Marek Vasut 2021-11-29  631  {
0cd375b25d1d51 Marek Vasut 2021-11-29  632  	const unsigned int lanes =3D i=
sl7998x->nr_mipi_lanes;
0cd375b25d1d51 Marek Vasut 2021-11-29  633  	const u32 isl7998x_video_in_ch=
an_map[] =3D { 0x00, 0x11, 0x02, 0x02 };
0cd375b25d1d51 Marek Vasut 2021-11-29  634  	const struct reg_sequence isl7=
998x_init_seq_custom[] =3D {
0cd375b25d1d51 Marek Vasut 2021-11-29  635  		{ ISL7998x_REG_P0_VIDEO_IN_CH=
AN_CTL,
0cd375b25d1d51 Marek Vasut 2021-11-29  636  		  isl7998x_video_in_chan_map[=
isl7998x->nr_inputs - 1] },
0cd375b25d1d51 Marek Vasut 2021-11-29  637  		{ ISL7998x_REG_P0_CLK_CTL_4,
0cd375b25d1d51 Marek Vasut 2021-11-29  638  		  (lanes =3D=3D 1) ? 0x40 : 0=
x41 },
0cd375b25d1d51 Marek Vasut 2021-11-29  639  		{ ISL7998x_REG_P5_LI_ENGINE_C=
TL,
0cd375b25d1d51 Marek Vasut 2021-11-29  640  		  (lanes =3D=3D 1) ? 0x01 : 0=
x02 },
0cd375b25d1d51 Marek Vasut 2021-11-29  641  	};
0cd375b25d1d51 Marek Vasut 2021-11-29 @642  	struct device *dev =3D isl7998=
x->subdev.dev;
0cd375b25d1d51 Marek Vasut 2021-11-29  643  	struct regmap *regmap =3D isl7=
998x->regmap;
0cd375b25d1d51 Marek Vasut 2021-11-29  644  	int ret;
0cd375b25d1d51 Marek Vasut 2021-11-29  645  =

0cd375b25d1d51 Marek Vasut 2021-11-29  646  	dev_dbg(dev, "configuring %d l=
anes for %d inputs (norm 0x%llx)\n",
0cd375b25d1d51 Marek Vasut 2021-11-29  647  		isl7998x->nr_mipi_lanes, isl7=
998x->nr_inputs,
0cd375b25d1d51 Marek Vasut 2021-11-29  648  		isl7998x->norm);
0cd375b25d1d51 Marek Vasut 2021-11-29  649  =

0cd375b25d1d51 Marek Vasut 2021-11-29  650  	ret =3D regmap_register_patch(=
regmap, isl7998x_init_seq_1,
0cd375b25d1d51 Marek Vasut 2021-11-29  651  				    ARRAY_SIZE(isl7998x_ini=
t_seq_1));
0cd375b25d1d51 Marek Vasut 2021-11-29  652  	if (ret)
0cd375b25d1d51 Marek Vasut 2021-11-29  653  		return ret;
0cd375b25d1d51 Marek Vasut 2021-11-29  654  =

0cd375b25d1d51 Marek Vasut 2021-11-29  655  	ret =3D isl7998x_set_standard(=
isl7998x, isl7998x->norm);
0cd375b25d1d51 Marek Vasut 2021-11-29  656  	if (ret)
0cd375b25d1d51 Marek Vasut 2021-11-29  657  		return ret;
0cd375b25d1d51 Marek Vasut 2021-11-29  658  =

0cd375b25d1d51 Marek Vasut 2021-11-29  659  	ret =3D regmap_register_patch(=
regmap, isl7998x_init_seq_custom,
0cd375b25d1d51 Marek Vasut 2021-11-29  660  				    ARRAY_SIZE(isl7998x_ini=
t_seq_custom));
0cd375b25d1d51 Marek Vasut 2021-11-29  661  	if (ret)
0cd375b25d1d51 Marek Vasut 2021-11-29  662  		return ret;
0cd375b25d1d51 Marek Vasut 2021-11-29  663  =

0cd375b25d1d51 Marek Vasut 2021-11-29  664  	return regmap_register_patch(r=
egmap, isl7998x_init_seq_2,
0cd375b25d1d51 Marek Vasut 2021-11-29  665  				     ARRAY_SIZE(isl7998x_in=
it_seq_2));
0cd375b25d1d51 Marek Vasut 2021-11-29  666  }
0cd375b25d1d51 Marek Vasut 2021-11-29  667  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0200649689717062363==--

