Content-Type: multipart/mixed; boundary="===============5457746012177305230=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/qcom/camss/camss-csid-gen2.c:484:2: warning: Value stored to 'hw_gen' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 01 May 2022 22:48:33 +0800
Message-ID: <202205012222.wL0IYpcY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5457746012177305230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jonathan Marek <jonathan@marek.ca>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Julian Grahsl <jgrahsl@snap.com>
CC: Robert Foss <robert.foss@linaro.org>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   57ae8a492116910bad2b3497ffe555b3a4b4180f
commit: b4436a18eedb8d93e148d009b145b4ae142e6f9d media: camss: add support =
for SM8250 camss
date:   3 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220427 (https://download.01.org/0day-ci/archi=
ve/20220501/202205012222.wL0IYpcY-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db4436a18eedb8d93e148d009b145b4ae142e6f9d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b4436a18eedb8d93e148d009b145b4ae142e6f9d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct bcm2835_spidev {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:155:8: note: Excessive padding in 'struct bcm2=
835_spidev' (48 padding bytes, where 16 is optimal). Optimal fields order: =
clear_rx_cs, prepare_cs, clear_rx_desc, clear_rx_addr, consider reordering =
the fields or adding explicit padding members
   struct bcm2835_spidev {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1165:20: warning: Access to field 'device' res=
ults in a dereference of a null pointer (loaded from field 'dma_rx') [clang=
-analyzer-core.NullDereference]
                   dma_unmap_single(ctlr->dma_rx->device->dev,
                                    ^
   drivers/spi/spi-bcm2835.c:1214:27: note: Calling 'spi_controller_get_dev=
data'
           struct bcm2835_spi *bs =3D spi_controller_get_devdata(ctlr);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spi/spi.h:675:2: note: Returning without writing to 'ctlr-=
>dma_rx'
           return dev_get_drvdata(&ctlr->dev);
           ^
   drivers/spi/spi-bcm2835.c:1214:27: note: Returning from 'spi_controller_=
get_devdata'
           struct bcm2835_spi *bs =3D spi_controller_get_devdata(ctlr);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1220:6: note: Assuming 'slv' is non-null
           if (!slv) {
               ^~~~
   drivers/spi/spi-bcm2835.c:1220:2: note: Taking false branch
           if (!slv) {
           ^
   drivers/spi/spi-bcm2835.c:1240:6: note: Assuming the condition is false
           if (spi->mode & SPI_CPOL)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1240:2: note: Taking false branch
           if (spi->mode & SPI_CPOL)
           ^
   drivers/spi/spi-bcm2835.c:1242:6: note: Assuming the condition is false
           if (spi->mode & SPI_CPHA)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1242:2: note: Taking false branch
           if (spi->mode & SPI_CPHA)
           ^
   drivers/spi/spi-bcm2835.c:1250:6: note: Assuming field 'dma_rx' is null
           if (ctlr->dma_rx) {
               ^~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1250:2: note: Taking false branch
           if (ctlr->dma_rx) {
           ^
   drivers/spi/spi-bcm2835.c:1263:6: note: Assuming the condition is false
           if (spi->mode & SPI_NO_CS)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1263:2: note: Taking false branch
           if (spi->mode & SPI_NO_CS)
           ^
   drivers/spi/spi-bcm2835.c:1269:6: note: Assuming field 'cs_gpiod' is null
           if (spi->cs_gpiod)
               ^~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1269:2: note: Taking false branch
           if (spi->cs_gpiod)
           ^
   drivers/spi/spi-bcm2835.c:1271:6: note: Assuming field 'chip_select' is =
<=3D 1
           if (spi->chip_select > 1) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1271:2: note: Taking false branch
           if (spi->chip_select > 1) {
           ^
   drivers/spi/spi-bcm2835.c:1293:6: note: Assuming 'chip' is non-null
           if (!chip)
               ^~~~~
   drivers/spi/spi-bcm2835.c:1293:2: note: Taking false branch
           if (!chip)
           ^
   drivers/spi/spi-bcm2835.c:1300:2: note: Taking true branch
           if (IS_ERR(spi->cs_gpiod)) {
           ^
   drivers/spi/spi-bcm2835.c:1302:3: note: Control jumps to line 1312
                   goto err_cleanup;
                   ^
   drivers/spi/spi-bcm2835.c:1312:2: note: Calling 'bcm2835_spi_cleanup'
           bcm2835_spi_cleanup(spi);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1161:6: note: Assuming field 'clear_rx_desc' i=
s null
           if (slv->clear_rx_desc)
               ^~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1161:2: note: Taking false branch
           if (slv->clear_rx_desc)
           ^
   drivers/spi/spi-bcm2835.c:1164:6: note: Assuming field 'clear_rx_addr' i=
s not equal to 0
           if (slv->clear_rx_addr)
               ^~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1164:2: note: Taking true branch
           if (slv->clear_rx_addr)
           ^
   drivers/spi/spi-bcm2835.c:1165:20: note: Access to field 'device' result=
s in a dereference of a null pointer (loaded from field 'dma_rx')
                   dma_unmap_single(ctlr->dma_rx->device->dev,
                                    ^
   include/linux/dma-mapping.h:407:61: note: expanded from macro 'dma_unmap=
_single'
   #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, =
0)
                                                               ^
   5 warnings generated.
   drivers/media/platform/qcom/camss/camss-csid-gen2.c:407:3: warning: Valu=
e stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                   val =3D 0;
                   ^     ~
   drivers/media/platform/qcom/camss/camss-csid-gen2.c:407:3: note: Value s=
tored to 'val' is never read
                   val =3D 0;
                   ^     ~
>> drivers/media/platform/qcom/camss/camss-csid-gen2.c:484:2: warning: Valu=
e stored to 'hw_gen' is never read [clang-analyzer-deadcode.DeadStores]
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-gen2.c:484:2: note: Value s=
tored to 'hw_gen' is never read
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-csid-gen2.c:485:2: warning: Valu=
e stored to 'hw_rev' is never read [clang-analyzer-deadcode.DeadStores]
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-gen2.c:485:2: note: Value s=
tored to 'hw_rev' is never read
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-csid-gen2.c:486:2: warning: Valu=
e stored to 'hw_step' is never read [clang-analyzer-deadcode.DeadStores]
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-gen2.c:486:2: note: Value s=
tored to 'hw_step' is never read
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c:32:5: warning: =
Value stored to 'hw_version' during its initialization is never read [clang=
-analyzer-deadcode.DeadStores]
           u8 hw_version =3D readl_relaxed(csiphy->base +
              ^~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c:32:5: note: Val=
ue stored to 'hw_version' during its initialization is never read
           u8 hw_version =3D readl_relaxed(csiphy->base +
              ^~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:279:2: warning:=
 Value stored to 'hw_version' is never read [clang-analyzer-deadcode.DeadSt=
ores]
           hw_version |=3D readl_relaxed(csiphy->base +
           ^
   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:279:2: note: Va=
lue stored to 'hw_version' is never read
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   include/media/v4l2-subdev.h:1000:10: warning: Access to field 'pads' res=
ults in a dereference of a null pointer (loaded from variable 'state') [cla=
ng-analyzer-core.NullDereference]
           return &state->pads[pad].try_fmt;
                   ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:786:8: note: Calling 'c=
siphy_init_formats'
           ret =3D csiphy_init_formats(sd, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:546:12: note: 'fh' is n=
ull
                   .which =3D fh ? V4L2_SUBDEV_FORMAT_TRY :
                            ^~
   drivers/media/platform/qcom/camss/camss-csiphy.c:546:12: note: '?' condi=
tion is false
   drivers/media/platform/qcom/camss/camss-csiphy.c:555:31: note: 'fh' is n=
ull
           return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
                                        ^~
   drivers/media/platform/qcom/camss/camss-csiphy.c:555:31: note: '?' condi=
tion is false
   drivers/media/platform/qcom/camss/camss-csiphy.c:555:31: note: Passing n=
ull pointer value via 2nd parameter 'sd_state'
           return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
                                        ^~
   drivers/media/platform/qcom/camss/camss-csiphy.c:555:9: note: Calling 'c=
siphy_set_format'
           return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:510:6: note: 'format' i=
s not equal to NULL
           if (format =3D=3D NULL)
               ^~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:510:2: note: Taking fal=
se branch
           if (format =3D=3D NULL)
           ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:518:6: note: Assuming f=
ield 'pad' is equal to MSM_CSIPHY_PAD_SINK
           if (fmt->pad =3D=3D MSM_CSIPHY_PAD_SINK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:518:2: note: Taking tru=
e branch
           if (fmt->pad =3D=3D MSM_CSIPHY_PAD_SINK) {
           ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:519:40: note: Passing n=
ull pointer value via 2nd parameter 'sd_state'
                   format =3D __csiphy_get_format(csiphy, sd_state,
                                                        ^~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:519:12: note: Calling '=
__csiphy_get_format'
                   format =3D __csiphy_get_format(csiphy, sd_state,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:346:6: note: Assuming '=
which' is equal to V4L2_SUBDEV_FORMAT_TRY
           if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:346:2: note: Taking tru=
e branch
           if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
           ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:347:54: note: Passing n=
ull pointer value via 2nd parameter 'state'
                   return v4l2_subdev_get_try_format(&csiphy->subdev, sd_st=
ate,
                                                                      ^~~~~=
~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:347:10: note: Calling '=
v4l2_subdev_get_try_format'
                   return v4l2_subdev_get_try_format(&csiphy->subdev, sd_st=
ate,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/media/v4l2-subdev.h:998:14: note: Assuming 'pad' is < field 'num=
_pads'
           if (WARN_ON(pad >=3D sd->entity.num_pads))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   include/media/v4l2-subdev.h:998:6: note: Taking false branch
           if (WARN_ON(pad >=3D sd->entity.num_pads))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/media/v4l2-subdev.h:998:2: note: Taking false branch
           if (WARN_ON(pad >=3D sd->entity.num_pads))
           ^
   include/media/v4l2-subdev.h:1000:10: note: Access to field 'pads' result=
s in a dereference of a null pointer (loaded from variable 'state')
           return &state->pads[pad].try_fmt;
                   ^~~~~
   Suppressed 1 warnings (1 with check filters).
   7 warnings generated.
   drivers/media/dvb-frontends/zd1301_demod.c:40:26: warning: Value stored =
to 'pdev' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/zd1301_demod.c:40:26: note: Value stored to =
'pdev' during its initialization is never read
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/dvb-frontends/zd1301_demod.c:148:26: warning: Value stored=
 to 'pdev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~

vim +/hw_gen +484 drivers/media/platform/qcom/camss/camss-csid-gen2.c

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  469  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  470  /*
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  471   * csid_hw_version - CSID hardware version query
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  472   * @csid: CSID device
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  473   *
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  474   * Return HW version or error
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  475   */
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  476  static u32 csid_hw_version(struct csid_device *csid)
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  477  {
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  478  	u32 hw_version;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  479  	u32 hw_gen;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  480  	u32 hw_rev;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  481  	u32 hw_step;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  482  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  483  	hw_version =3D readl_relaxed(csid->base + CSID_HW_VERS=
ION);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16 @484  	hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16 @485  	hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16 @486  	hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFF=
FF;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  487  	dev_dbg(csid->camss->dev, "CSID HW Version =3D %u.%u.%=
u\n",
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  488  		hw_gen, hw_rev, hw_step);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  489  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  490  	return hw_version;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  491  }
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss 2021-03-16  492  =


:::::: The code at line 484 was first introduced by commit
:::::: eebe6d00e9bf1216fb381b64146e1b7e50d90b3f media: camss: Add support f=
or CSID hardware version Titan 170

:::::: TO: Robert Foss <robert.foss@linaro.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5457746012177305230==--

