Content-Type: multipart/mixed; boundary="===============4359766344589872352=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [media-tree:master 20/206] drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:163:2: warning: Value stored to 'hw_version' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 24 Feb 2022 21:58:36 +0800
Message-ID: <202202242130.p2WpGd7P-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4359766344589872352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-media(a)vger.kernel.org
TO: Jonathan Marek <jonathan@marek.ca>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Robert Foss <robert.foss@linaro.org>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/media_tree.git master
head:   2b891d3980f6c255459d0e1c29ce2152ec7cf678
commit: dd89115a7c1cf31223cbeab2430d03bf202c8b22 [20/206] media: camss: csi=
phy-3ph: don't print HW version as an error
:::::: branch date: 7 days ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220222 (https://download.01.org/0day-ci/arc=
hive/20220224/202202242130.p2WpGd7P-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add media-tree git://linuxtv.org/media_tree.git
        git fetch --no-tags media-tree master
        git checkout dd89115a7c1cf31223cbeab2430d03bf202c8b22
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/media/platform/imx-pxp.c:316:6: note: Assuming the condition is =
true
           if (pxp_v4l2_pix_fmt_is_yuv(ctx->q_data[V4L2_M2M_SRC].fmt->fourc=
c) &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/media/platform/imx-pxp.c:316:6: note: Left side of '&&' is true
   drivers/media/platform/imx-pxp.c:317:6: note: Assuming the condition is =
true
               !pxp_v4l2_pix_fmt_is_yuv(ctx->q_data[V4L2_M2M_DST].fmt->four=
cc)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/platform/imx-pxp.c:316:2: note: Taking true branch
           if (pxp_v4l2_pix_fmt_is_yuv(ctx->q_data[V4L2_M2M_SRC].fmt->fourc=
c) &&
           ^
   drivers/media/platform/imx-pxp.c:336:4: note: The result of the left shi=
ft is undefined because the left operand is negative
                           BF_PXP_CSC1_COEF0_UV_OFFSET(-128) |
                           ^
   drivers/media/platform/imx-pxp.h:598:8: note: expanded from macro 'BF_PX=
P_CSC1_COEF0_UV_OFFSET'
           (((v) << 9) & BM_PXP_CSC1_COEF0_UV_OFFSET)
             ~~~ ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/media/dvb-frontends/cxd2820r_c.c:14:21: warning: Value stored to=
 'client' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:14:21: note: Value stored to 'c=
lient' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:15:34: warning: Value stored to=
 'c' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:15:34: note: Value stored to 'c=
' during its initialization is never read
           struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:92:21: warning: Value stored to=
 'client' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:92:21: note: Value stored to 'c=
lient' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:145:21: warning: Value stored t=
o 'client' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:145:21: note: Value stored to '=
client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:281:21: warning: Value stored t=
o 'client' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:281:21: note: Value stored to '=
client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:299:21: warning: Value stored t=
o 'client' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:299:21: note: Value stored to '=
client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/media/platform/qcom/camss/camss-csid-170.c:398:3: warning: Value=
 stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                   val =3D 0;
                   ^     ~
   drivers/media/platform/qcom/camss/camss-csid-170.c:398:3: note: Value st=
ored to 'val' is never read
                   val =3D 0;
                   ^     ~
   drivers/media/platform/qcom/camss/camss-csid-170.c:478:2: warning: Value=
 stored to 'hw_gen' is never read [clang-analyzer-deadcode.DeadStores]
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:478:2: note: Value st=
ored to 'hw_gen' is never read
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:479:2: warning: Value=
 stored to 'hw_rev' is never read [clang-analyzer-deadcode.DeadStores]
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:479:2: note: Value st=
ored to 'hw_rev' is never read
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:480:2: warning: Value=
 stored to 'hw_step' is never read [clang-analyzer-deadcode.DeadStores]
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:480:2: note: Value st=
ored to 'hw_step' is never read
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c:32:5: warning: =
Value stored to 'hw_version' during its initialization is never read [clang=
-analyzer-deadcode.DeadStores]
           u8 hw_version =3D readl_relaxed(csiphy->base +
              ^~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c:32:5: note: Val=
ue stored to 'hw_version' during its initialization is never read
           u8 hw_version =3D readl_relaxed(csiphy->base +
              ^~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:163:2: warning:=
 Value stored to 'hw_version' is never read [clang-analyzer-deadcode.DeadSt=
ores]
           hw_version |=3D readl_relaxed(csiphy->base +
           ^
   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:163:2: note: Va=
lue stored to 'hw_version' is never read
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   include/media/v4l2-subdev.h:1000:10: warning: Access to field 'pads' res=
ults in a dereference of a null pointer (loaded from variable 'state') [cla=
ng-analyzer-core.NullDereference]
           return &state->pads[pad].try_fmt;
                   ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:781:8: note: Calling 'c=
siphy_init_formats'
           ret =3D csiphy_init_formats(sd, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:545:12: note: 'fh' is n=
ull
                   .which =3D fh ? V4L2_SUBDEV_FORMAT_TRY :
                            ^~
   drivers/media/platform/qcom/camss/camss-csiphy.c:545:12: note: '?' condi=
tion is false
   drivers/media/platform/qcom/camss/camss-csiphy.c:554:31: note: 'fh' is n=
ull
           return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
                                        ^~
   drivers/media/platform/qcom/camss/camss-csiphy.c:554:31: note: '?' condi=
tion is false
   drivers/media/platform/qcom/camss/camss-csiphy.c:554:31: note: Passing n=
ull pointer value via 2nd parameter 'sd_state'
           return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
                                        ^~
   drivers/media/platform/qcom/camss/camss-csiphy.c:554:9: note: Calling 'c=
siphy_set_format'
           return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:509:6: note: 'format' i=
s not equal to NULL
           if (format =3D=3D NULL)
               ^~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:509:2: note: Taking fal=
se branch
           if (format =3D=3D NULL)
           ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:517:6: note: Assuming f=
ield 'pad' is equal to MSM_CSIPHY_PAD_SINK
           if (fmt->pad =3D=3D MSM_CSIPHY_PAD_SINK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:517:2: note: Taking tru=
e branch
           if (fmt->pad =3D=3D MSM_CSIPHY_PAD_SINK) {
           ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:518:40: note: Passing n=
ull pointer value via 2nd parameter 'sd_state'
                   format =3D __csiphy_get_format(csiphy, sd_state,
                                                        ^~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:518:12: note: Calling '=
__csiphy_get_format'
                   format =3D __csiphy_get_format(csiphy, sd_state,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:345:6: note: Assuming '=
which' is equal to V4L2_SUBDEV_FORMAT_TRY
           if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:345:2: note: Taking tru=
e branch
           if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
           ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:346:54: note: Passing n=
ull pointer value via 2nd parameter 'state'
                   return v4l2_subdev_get_try_format(&csiphy->subdev, sd_st=
ate,
                                                                      ^~~~~=
~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:346:10: note: Calling '=
v4l2_subdev_get_try_format'
                   return v4l2_subdev_get_try_format(&csiphy->subdev, sd_st=
ate,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/media/v4l2-subdev.h:998:14: note: Assuming 'pad' is < field 'num=
_pads'
           if (WARN_ON(pad >=3D sd->entity.num_pads))
                       ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   include/media/v4l2-subdev.h:998:2: note: Taking false branch
           if (WARN_ON(pad >=3D sd->entity.num_pads))
           ^
   include/media/v4l2-subdev.h:1000:10: note: Access to field 'pads' result=
s in a dereference of a null pointer (loaded from variable 'state')
           return &state->pads[pad].try_fmt;
                   ^~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/mmc/host/tmio_mmc_core.c:929:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mmc/host/tmio_mmc_core.c:929:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/mmc/host/uniphier-sd.c:430:8: note: Loop condition is false.  Ex=
iting loop
           tmp =3D readl(host->ctl + (CTL_SD_CARD_CLK_CTL << 1));
                 ^
   arch/riscv/include/asm/mmio.h:140:30: note: expanded from macro 'readl'
   #define readl(c)        ({ u32 __v; __io_br(); __v =3D readl_cpu(c); __i=
o_ar(__v); __v; })

vim +/hw_version +163 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-=
0.c

2f8b67195e4839 Robert Foss    2021-03-16  148  =

4138a88b6093e1 Todor Tomov    2018-07-25  149  static void csiphy_hw_versio=
n_read(struct csiphy_device *csiphy,
4138a88b6093e1 Todor Tomov    2018-07-25  150  				   struct device *dev)
4138a88b6093e1 Todor Tomov    2018-07-25  151  {
4138a88b6093e1 Todor Tomov    2018-07-25  152  	u32 hw_version;
4138a88b6093e1 Todor Tomov    2018-07-25  153  =

4138a88b6093e1 Todor Tomov    2018-07-25  154  	writel(CSIPHY_3PH_CMN_CSI_C=
OMMON_CTRL6_SHOW_REV_ID,
4138a88b6093e1 Todor Tomov    2018-07-25  155  	       csiphy->base + CSIPH=
Y_3PH_CMN_CSI_COMMON_CTRLn(6));
4138a88b6093e1 Todor Tomov    2018-07-25  156  =

4138a88b6093e1 Todor Tomov    2018-07-25  157  	hw_version =3D readl_relaxe=
d(csiphy->base +
4138a88b6093e1 Todor Tomov    2018-07-25  158  				   CSIPHY_3PH_CMN_CSI_CO=
MMON_STATUSn(12));
4138a88b6093e1 Todor Tomov    2018-07-25  159  	hw_version |=3D readl_relax=
ed(csiphy->base +
4138a88b6093e1 Todor Tomov    2018-07-25  160  				   CSIPHY_3PH_CMN_CSI_CO=
MMON_STATUSn(13)) << 8;
4138a88b6093e1 Todor Tomov    2018-07-25  161  	hw_version |=3D readl_relax=
ed(csiphy->base +
4138a88b6093e1 Todor Tomov    2018-07-25  162  				   CSIPHY_3PH_CMN_CSI_CO=
MMON_STATUSn(14)) << 16;
4138a88b6093e1 Todor Tomov    2018-07-25 @163  	hw_version |=3D readl_relax=
ed(csiphy->base +
4138a88b6093e1 Todor Tomov    2018-07-25  164  				   CSIPHY_3PH_CMN_CSI_CO=
MMON_STATUSn(15)) << 24;
4138a88b6093e1 Todor Tomov    2018-07-25  165  =

dd89115a7c1cf3 Jonathan Marek 2021-12-22  166  	dev_dbg(dev, "CSIPHY 3PH HW=
 Version =3D 0x%08x\n", hw_version);
4138a88b6093e1 Todor Tomov    2018-07-25  167  }
4138a88b6093e1 Todor Tomov    2018-07-25  168  =


:::::: The code@line 163 was first introduced by commit
:::::: 4138a88b6093e1f8bf1b8a95c653bec6c854f119 media: camss: csiphy: Add s=
upport for 8x96

:::::: TO: Todor Tomov <todor.tomov@linaro.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4359766344589872352==--

