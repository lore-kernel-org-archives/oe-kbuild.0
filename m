Content-Type: multipart/mixed; boundary="===============5958766120396389514=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/lgm/lgm-dma.c:854:2: warning: Value stored to 'reg' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 03 Jan 2022 20:04:46 +0800
Message-ID: <202201032047.XtD4rqfX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5958766120396389514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c9e6606c7fe92b50a02ce51dda82586ebdf99b48
commit: 32d31c79a1a4fbc48aab594a4dc9ffa087ab59a3 dmaengine: Add Intel LGM S=
oC DMA support.
date:   12 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20211229 (https://download.01.org/0day-ci/archi=
ve/20220103/202201032047.XtD4rqfX-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project cd284b=
7ac0615afc6e0f1a30da2777e361de27a3)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D32d31c79a1a4fbc48aab594a4dc9ffa087ab59a3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 32d31c79a1a4fbc48aab594a4dc9ffa087ab59a3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_rd.c:95:2: note: Value stored to 'page_count'=
 is never read
           page_count =3D rd_release_sgl_table(rd_dev, rd_dev->sg_table_arr=
ay,
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_rd.c:221:2: warning: Value stored to 'page_co=
unt' is never read [clang-analyzer-deadcode.DeadStores]
           page_count =3D rd_release_sgl_table(rd_dev, rd_dev->sg_prot_arra=
y,
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_rd.c:221:2: note: Value stored to 'page_count=
' is never read
           page_count =3D rd_release_sgl_table(rd_dev, rd_dev->sg_prot_arra=
y,
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/target/target_core_stat.c:229:5: warning: Null pointer passed as=
 1st argument to string length function [clang-analyzer-unix.cstring.NullAr=
g]
                           (strlen(dev->t10_wwn.unit_serial)) ?
                            ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_stat.c:229:5: note: Null pointer passed as 1s=
t argument to string length function
                           (strlen(dev->t10_wwn.unit_serial)) ?
                            ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/host1x/cdma.c:563:15: warning: Value stored to 'space' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int space =3D cdma->slots_free;
                        ^~~~~   ~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/cdma.c:563:15: note: Value stored to 'space' during i=
ts initialization is never read
           unsigned int space =3D cdma->slots_free;
                        ^~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/input/touchscreen/atmel_mxt_ts.c:712:17: warning: Value stored t=
o 'dev' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct device *dev =3D &data->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/atmel_mxt_ts.c:712:17: note: Value stored to '=
dev' during its initialization is never read
           struct device *dev =3D &data->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/atmel_mxt_ts.c:781:17: warning: Value stored t=
o 'dev' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct device *dev =3D &data->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/atmel_mxt_ts.c:781:17: note: Value stored to '=
dev' during its initialization is never read
           struct device *dev =3D &data->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/atmel_mxt_ts.c:850:17: warning: Value stored t=
o 'dev' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct device *dev =3D &data->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/atmel_mxt_ts.c:850:17: note: Value stored to '=
dev' during its initialization is never read
           struct device *dev =3D &data->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/atmel_mxt_ts.c:2205:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D &data->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/atmel_mxt_ts.c:2205:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D &data->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/atmel_mxt_ts.c:2228:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D &data->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/atmel_mxt_ts.c:2228:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D &data->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/dma/uniphier-xdmac.c:208:2: warning: Value stored to 'val' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           val &=3D ~XDMAC_TSS_REQ;
           ^      ~~~~~~~~~~~~~~
   drivers/dma/uniphier-xdmac.c:208:2: note: Value stored to 'val' is never=
 read
           val &=3D ~XDMAC_TSS_REQ;
           ^      ~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/dma/lgm/lgm-dma.c:854:2: warning: Value stored to 'reg' is never=
 read [clang-analyzer-deadcode.DeadStores]
           reg =3D readl(d->base + DMA_PCTRL); /* read back */
           ^
   drivers/dma/lgm/lgm-dma.c:854:2: note: Value stored to 'reg' is never re=
ad
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/media/dvb-frontends/mxl5xx.c:190:28: warning: The right operand =
of '&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResul=
t]
                   if (DMA_INTR_PROT_WR_CMP & val)
                                            ^
   drivers/media/dvb-frontends/mxl5xx.c:665:6: note: Assuming 're_tune' is =
true
           if (re_tune) {
               ^~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:665:2: note: Taking true branch
           if (re_tune) {
           ^
   drivers/media/dvb-frontends/mxl5xx.c:666:7: note: Calling 'set_parameter=
s'
                   r =3D set_parameters(fe);
                       ^~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:445:6: note: Assuming field 'freque=
ncy' is >=3D 950000
           if (p->frequency < 950000 || p->frequency > 2150000)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:445:6: note: Left side of '||' is f=
alse
   drivers/media/dvb-frontends/mxl5xx.c:445:31: note: Assuming field 'frequ=
ency' is <=3D 2150000
           if (p->frequency < 950000 || p->frequency > 2150000)
                                        ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:445:2: note: Taking false branch
           if (p->frequency < 950000 || p->frequency > 2150000)
           ^
   drivers/media/dvb-frontends/mxl5xx.c:447:6: note: Assuming field 'symbol=
_rate' is >=3D 1000000
           if (p->symbol_rate < 1000000 || p->symbol_rate > 45000000)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:447:6: note: Left side of '||' is f=
alse
   drivers/media/dvb-frontends/mxl5xx.c:447:34: note: Assuming field 'symbo=
l_rate' is <=3D 45000000
           if (p->symbol_rate < 1000000 || p->symbol_rate > 45000000)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:447:2: note: Taking false branch
           if (p->symbol_rate < 1000000 || p->symbol_rate > 45000000)
           ^
   drivers/media/dvb-frontends/mxl5xx.c:452:2: note: Control jumps to 'case=
 SYS_DVBS2:'  at line 466
           switch (p->delivery_system) {
           ^
   drivers/media/dvb-frontends/mxl5xx.c:471:3: note: Calling 'cfg_scrambler'
                   cfg_scrambler(state, p->scrambling_sequence_index);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:411:9: note: Calling 'send_command'
           return send_command(state, sizeof(buf), buf);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:185:6: note: 'val' declared without=
 an initial value
           u32 val, count =3D 10;
               ^~~
   drivers/media/dvb-frontends/mxl5xx.c:188:6: note: Assuming field 'fwvers=
ion' is > 33620233
           if (state->base->fwversion > 0x02010109)  {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:188:2: note: Taking true branch
           if (state->base->fwversion > 0x02010109)  {
           ^
   drivers/media/dvb-frontends/mxl5xx.c:189:3: note: Calling 'read_register=
_unlocked'
                   read_register_unlocked(state, DMA_I2C_INTERRUPT_ADDR, &v=
al);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/dvb-frontends/mxl5xx.c:168:6: note: 'stat' is -1
           if (stat)
               ^~~~
   drivers/media/dvb-frontends/mxl5xx.c:168:2: note: Taking true branch
           if (stat)
           ^
   drivers/media/dvb-frontends/mxl5xx.c:170:7: note: 'stat' is -1
           if (!stat)
                ^~~~
   drivers/media/dvb-frontends/mxl5xx.c:170:2: note: Taking false branch
           if (!stat)
           ^
   drivers/media/dvb-frontends/mxl5xx.c:173:2: note: Loop condition is fals=
e.  Exiting loop
           le32_to_cpus(val);
           ^
   include/linux/byteorder/generic.h:113:22: note: expanded from macro 'le3=
2_to_cpus'
   #define le32_to_cpus __le32_to_cpus

vim +/reg +854 drivers/dma/lgm/lgm-dma.c

32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  817  =

32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  818  static int ldma=
_port_cfg(struct ldma_port *p)
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  819  {
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  820  	unsigned long =
flags;
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  821  	struct ldma_de=
v *d;
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  822  	u32 reg;
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  823  =

32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  824  	d =3D p->ldev;
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  825  	reg =3D FIELD_=
PREP(DMA_PCTRL_TXENDI, p->txendi);
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  826  	reg |=3D FIELD=
_PREP(DMA_PCTRL_RXENDI, p->rxendi);
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  827  =

32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  828  	if (d->ver =3D=
=3D DMA_VER22) {
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  829  		reg |=3D FIEL=
D_PREP(DMA_PCTRL_TXBL, p->txbl);
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  830  		reg |=3D FIEL=
D_PREP(DMA_PCTRL_RXBL, p->rxbl);
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  831  	} else {
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  832  		reg |=3D FIEL=
D_PREP(DMA_PCTRL_PDEN, p->pkt_drop);
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  833  =

32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  834  		if (p->txbl =
=3D=3D DMA_BURSTL_32DW)
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  835  			reg |=3D DMA=
_PCTRL_TXBL32;
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  836  		else if (p->t=
xbl =3D=3D DMA_BURSTL_16DW)
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  837  			reg |=3D DMA=
_PCTRL_TXBL16;
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  838  		else
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  839  			reg |=3D FIE=
LD_PREP(DMA_PCTRL_TXBL, DMA_PCTRL_TXBL_8);
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  840  =

32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  841  		if (p->rxbl =
=3D=3D DMA_BURSTL_32DW)
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  842  			reg |=3D DMA=
_PCTRL_RXBL32;
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  843  		else if (p->r=
xbl =3D=3D DMA_BURSTL_16DW)
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  844  			reg |=3D DMA=
_PCTRL_RXBL16;
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  845  		else
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  846  			reg |=3D FIE=
LD_PREP(DMA_PCTRL_RXBL, DMA_PCTRL_RXBL_8);
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  847  	}
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  848  =

32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  849  	spin_lock_irqs=
ave(&d->dev_lock, flags);
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  850  	writel(p->port=
id, d->base + DMA_PS);
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  851  	writel(reg, d-=
>base + DMA_PCTRL);
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  852  	spin_unlock_ir=
qrestore(&d->dev_lock, flags);
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  853  =

32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03 @854  	reg =3D readl(=
d->base + DMA_PCTRL); /* read back */
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  855  	dev_dbg(d->dev=
, "Port Control 0x%08x configuration done\n", reg);
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  856  =

32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  857  	return 0;
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  858  }
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  859  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5958766120396389514==--

