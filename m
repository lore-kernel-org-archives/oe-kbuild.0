Content-Type: multipart/mixed; boundary="===============4743671001192975778=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/sh/rz-dmac.c:253:18: warning: Value stored to 'dmac' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 30 Dec 2021 11:08:49 +0800
Message-ID: <202112301019.TuIgtJix-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4743671001192975778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eec4df26e24e978e49ccf9bcf49ca0f2ccdaeffe
commit: 5000d37042a61ca556fde2782ca40dbfa802ea16 dmaengine: sh: Add DMAC dr=
iver for RZ/G2L SoC
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20211229 (https://download.01.org/0day-ci/archi=
ve/20211230/202112301019.TuIgtJix-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project cd284b=
7ac0615afc6e0f1a30da2777e361de27a3)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D5000d37042a61ca556fde2782ca40dbfa802ea16
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5000d37042a61ca556fde2782ca40dbfa802ea16
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   14 warnings generated.
   drivers/scsi/scsi_logging.c:72:3: warning: Value stored to 'off' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   off +=3D vscnprintf(logbuf + off, logbuf_len - off, fmt,=
 args);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/scsi/scsi_logging.c:72:3: note: Value stored to 'off' is never r=
ead
                   off +=3D vscnprintf(logbuf + off, logbuf_len - off, fmt,=
 args);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/scsi/scsi_logging.c:97:3: warning: Value stored to 'off' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   off +=3D vscnprintf(logbuf + off, logbuf_len - off, fmt,=
 args);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/scsi/scsi_logging.c:97:3: note: Value stored to 'off' is never r=
ead
                   off +=3D vscnprintf(logbuf + off, logbuf_len - off, fmt,=
 args);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/scsi/scsi_logging.c:206:3: warning: Value stored to 'off' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   off +=3D scnprintf(logbuf + off, logbuf_len - off, "\n");
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:206:3: note: Value stored to 'off' is never =
read
                   off +=3D scnprintf(logbuf + off, logbuf_len - off, "\n");
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:328:2: warning: Value stored to 'off' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           off +=3D scsi_format_sense_hdr(logbuf + off, logbuf_len - off, s=
shdr);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/scsi_logging.c:328:2: note: Value stored to 'off' is never =
read
           off +=3D scsi_format_sense_hdr(logbuf + off, logbuf_len - off, s=
shdr);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/scsi_logging.c:336:2: warning: Value stored to 'off' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           off +=3D scsi_format_extd_sense(logbuf + off, logbuf_len - off,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:336:2: note: Value stored to 'off' is never =
read
           off +=3D scsi_format_extd_sense(logbuf + off, logbuf_len - off,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:431:2: warning: Value stored to 'off' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           off +=3D scnprintf(logbuf + off, logbuf_len - off,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:431:2: note: Value stored to 'off' is never =
read
           off +=3D scnprintf(logbuf + off, logbuf_len - off,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   10 warnings generated.
   drivers/gpu/drm/panel/panel-elida-kd35t133.c:65:17: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/gpu/drm/panel/panel-elida-kd35t133.c:65:17: note: Value stored t=
o 'dev' during its initialization is never read
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
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
   10 warnings generated.
   drivers/gpu/drm/panel/panel-innolux-p079zca.c:459:3: warning: Value stor=
ed to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D PTR_ERR(innolux->enable_gpio);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-innolux-p079zca.c:459:3: note: Value stored =
to 'err' is never read
                   err =3D PTR_ERR(innolux->enable_gpio);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> drivers/dma/sh/rz-dmac.c:253:18: warning: Value stored to 'dmac' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct rz_dmac *dmac =3D to_rz_dmac(chan->device);
                           ^~~~
   drivers/dma/sh/rz-dmac.c:253:18: note: Value stored to 'dmac' during its=
 initialization is never read
           struct rz_dmac *dmac =3D to_rz_dmac(chan->device);
                           ^~~~
   drivers/dma/sh/rz-dmac.c:284:18: warning: Value stored to 'dmac' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct rz_dmac *dmac =3D to_rz_dmac(chan->device);
                           ^~~~
   drivers/dma/sh/rz-dmac.c:284:18: note: Value stored to 'dmac' during its=
 initialization is never read
           struct rz_dmac *dmac =3D to_rz_dmac(chan->device);
                           ^~~~
   drivers/dma/sh/rz-dmac.c:311:20: warning: Value stored to 'lmdesc' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct rz_lmdesc *lmdesc =3D channel->lmdesc.base;
                             ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sh/rz-dmac.c:311:20: note: Value stored to 'lmdesc' during i=
ts initialization is never read
           struct rz_lmdesc *lmdesc =3D channel->lmdesc.base;
                             ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sh/rz-dmac.c:475:18: warning: Value stored to 'dmac' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct rz_dmac *dmac =3D to_rz_dmac(chan->device);
                           ^~~~
   drivers/dma/sh/rz-dmac.c:475:18: note: Value stored to 'dmac' during its=
 initialization is never read
           struct rz_dmac *dmac =3D to_rz_dmac(chan->device);
                           ^~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/dma/sf-pdma/sf-pdma.c:59:6: warning: Access to field 'desc' resu=
lts in a dereference of a null pointer (loaded from variable 'chan') [clang=
-analyzer-core.NullDereference]
           if (chan->desc && !chan->desc->in_use) {
               ^
   drivers/dma/sf-pdma/sf-pdma.c:95:30: note: Calling 'to_sf_pdma_chan'
           struct sf_pdma_chan *chan =3D to_sf_pdma_chan(dchan);
                                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:44:9: note: Left side of '&&' is false
           return container_of(dchan, struct sf_pdma_chan, vchan.chan);
                  ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/dma/sf-pdma/sf-pdma.c:44:9: note: Taking false branch
           return container_of(dchan, struct sf_pdma_chan, vchan.chan);
                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/dma/sf-pdma/sf-pdma.c:44:9: note: Loop condition is false.  Exit=
ing loop
           return container_of(dchan, struct sf_pdma_chan, vchan.chan);
                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/dma/sf-pdma/sf-pdma.c:44:2: note: Returning pointer, which parti=
cipates in a condition later
           return container_of(dchan, struct sf_pdma_chan, vchan.chan);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:44:2: note: Returning pointer
           return container_of(dchan, struct sf_pdma_chan, vchan.chan);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:95:30: note: Returning from 'to_sf_pdma_ch=
an'
           struct sf_pdma_chan *chan =3D to_sf_pdma_chan(dchan);
                                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:95:2: note: 'chan' initialized here
           struct sf_pdma_chan *chan =3D to_sf_pdma_chan(dchan);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:99:6: note: Assuming 'chan' is null
           if (chan && (!len || !dest || !src)) {
               ^~~~
   drivers/dma/sf-pdma/sf-pdma.c:99:11: note: Left side of '&&' is false
           if (chan && (!len || !dest || !src)) {
                    ^
   drivers/dma/sf-pdma/sf-pdma.c:105:28: note: Passing null pointer value v=
ia 1st parameter 'chan'
           desc =3D sf_pdma_alloc_desc(chan);
                                     ^~~~
   drivers/dma/sf-pdma/sf-pdma.c:105:9: note: Calling 'sf_pdma_alloc_desc'
           desc =3D sf_pdma_alloc_desc(chan);
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:57:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&chan->lock, flags);

vim +/dmac +253 drivers/dma/sh/rz-dmac.c

5000d37042a61ca Biju Das 2021-08-06  249  =

5000d37042a61ca Biju Das 2021-08-06  250  static void rz_dmac_enable_hw(str=
uct rz_dmac_chan *channel)
5000d37042a61ca Biju Das 2021-08-06  251  {
5000d37042a61ca Biju Das 2021-08-06  252  	struct dma_chan *chan =3D &chann=
el->vc.chan;
5000d37042a61ca Biju Das 2021-08-06 @253  	struct rz_dmac *dmac =3D to_rz_d=
mac(chan->device);
5000d37042a61ca Biju Das 2021-08-06  254  	unsigned long flags;
5000d37042a61ca Biju Das 2021-08-06  255  	u32 nxla;
5000d37042a61ca Biju Das 2021-08-06  256  	u32 chctrl;
5000d37042a61ca Biju Das 2021-08-06  257  	u32 chstat;
5000d37042a61ca Biju Das 2021-08-06  258  =

5000d37042a61ca Biju Das 2021-08-06  259  	dev_dbg(dmac->dev, "%s channel %=
d\n", __func__, channel->index);
5000d37042a61ca Biju Das 2021-08-06  260  =

5000d37042a61ca Biju Das 2021-08-06  261  	local_irq_save(flags);
5000d37042a61ca Biju Das 2021-08-06  262  =

5000d37042a61ca Biju Das 2021-08-06  263  	rz_dmac_lmdesc_recycle(channel);
5000d37042a61ca Biju Das 2021-08-06  264  =

5000d37042a61ca Biju Das 2021-08-06  265  	nxla =3D channel->lmdesc.base_dm=
a +
5000d37042a61ca Biju Das 2021-08-06  266  		(sizeof(struct rz_lmdesc) * (ch=
annel->lmdesc.head -
5000d37042a61ca Biju Das 2021-08-06  267  					     channel->lmdesc.base));
5000d37042a61ca Biju Das 2021-08-06  268  =

5000d37042a61ca Biju Das 2021-08-06  269  	chstat =3D rz_dmac_ch_readl(chan=
nel, CHSTAT, 1);
5000d37042a61ca Biju Das 2021-08-06  270  	if (!(chstat & CHSTAT_EN)) {
5000d37042a61ca Biju Das 2021-08-06  271  		chctrl =3D (channel->chctrl | C=
HCTRL_SETEN);
5000d37042a61ca Biju Das 2021-08-06  272  		rz_dmac_ch_writel(channel, nxla=
, NXLA, 1);
5000d37042a61ca Biju Das 2021-08-06  273  		rz_dmac_ch_writel(channel, chan=
nel->chcfg, CHCFG, 1);
5000d37042a61ca Biju Das 2021-08-06  274  		rz_dmac_ch_writel(channel, CHCT=
RL_SWRST, CHCTRL, 1);
5000d37042a61ca Biju Das 2021-08-06  275  		rz_dmac_ch_writel(channel, chct=
rl, CHCTRL, 1);
5000d37042a61ca Biju Das 2021-08-06  276  	}
5000d37042a61ca Biju Das 2021-08-06  277  =

5000d37042a61ca Biju Das 2021-08-06  278  	local_irq_restore(flags);
5000d37042a61ca Biju Das 2021-08-06  279  }
5000d37042a61ca Biju Das 2021-08-06  280  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4743671001192975778==--

