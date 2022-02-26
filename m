Content-Type: multipart/mixed; boundary="===============3649651531669367032=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 886/8646] drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:163:2: warning: Value stored to 'hw_version' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 26 Feb 2022 09:21:27 +0800
Message-ID: <202202260914.aRT25hh0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3649651531669367032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jonathan Marek <jonathan@marek.ca>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Robert Foss <robert.foss@linaro.org>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   44948bd49d878dad6c9707e34f4a06df73c3a800
commit: dd89115a7c1cf31223cbeab2430d03bf202c8b22 [886/8646] media: camss: c=
siphy-3ph: don't print HW version as an error
:::::: branch date: 23 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220223 (https://download.01.org/0day-ci/arc=
hive/20220226/202202260914.aRT25hh0-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Ddd89115a7c1cf31223cbeab2430d03bf202c8b22
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout dd89115a7c1cf31223cbeab2430d03bf202c8b22
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/hwtracing/intel_th/core.c:317:7: note: 'val' is 0
                   if (val)
                       ^~~
   drivers/hwtracing/intel_th/core.c:317:3: note: Taking false branch
                   if (val)
                   ^
   drivers/hwtracing/intel_th/core.c:320:4: note: Calling 'intel_th_output_=
deactivate'
                           intel_th_output_deactivate(thdev);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/intel_th/core.c:279:3: note: Assuming field 'driver' i=
s non-null
                   to_intel_th_driver_or_null(thdev->dev.driver);
                   ^
   drivers/hwtracing/intel_th/intel_th.h:195:3: note: expanded from macro '=
to_intel_th_driver_or_null'
           ((_d) ? to_intel_th_driver(_d) : NULL)
            ^~~~
   drivers/hwtracing/intel_th/core.c:279:3: note: '?' condition is true
                   to_intel_th_driver_or_null(thdev->dev.driver);
                   ^
   drivers/hwtracing/intel_th/intel_th.h:195:3: note: expanded from macro '=
to_intel_th_driver_or_null'
           ((_d) ? to_intel_th_driver(_d) : NULL)
            ^
   drivers/hwtracing/intel_th/core.c:282:7: note: 'thdrv' is non-null
           if (!thdrv)
                ^~~~~
   drivers/hwtracing/intel_th/core.c:282:2: note: Taking false branch
           if (!thdrv)
           ^
   drivers/hwtracing/intel_th/core.c:285:6: note: Assuming field 'deactivat=
e' is null
           if (thdrv->deactivate)
               ^~~~~~~~~~~~~~~~~
   drivers/hwtracing/intel_th/core.c:285:2: note: Taking false branch
           if (thdrv->deactivate)
           ^
   drivers/hwtracing/intel_th/core.c:288:3: note: Calling 'intel_th_trace_d=
isable'
                   intel_th_trace_disable(thdev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/intel_th/core.c:1022:2: note: 'hub' initialized to a n=
ull pointer value
           struct intel_th_device *hub =3D to_intel_th_device(thdev->dev.pa=
rent);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/intel_th/core.c:1023:35: note: Dereference of null poi=
nter
           struct intel_th_driver *hubdrv =3D to_intel_th_driver(hub->dev.d=
river);
                                            ^
   drivers/hwtracing/intel_th/intel_th.h:192:2: note: expanded from macro '=
to_intel_th_driver'
           container_of((_d), struct intel_th_driver, driver)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   drivers/hwtracing/intel_th/core.c:1040:26: warning: Value stored to 'hub=
drv' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct intel_th_driver *hubdrv =3D to_intel_th_driver(hub->dev.d=
river);
                                   ^~~~~~
   drivers/hwtracing/intel_th/core.c:1040:26: note: Value stored to 'hubdrv=
' during its initialization is never read
           struct intel_th_driver *hubdrv =3D to_intel_th_driver(hub->dev.d=
river);
                                   ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c:32:5: warning: =
Value stored to 'hw_version' during its initialization is never read [clang=
-analyzer-deadcode.DeadStores]
           u8 hw_version =3D readl_relaxed(csiphy->base +
              ^~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c:32:5: note: Val=
ue stored to 'hw_version' during its initialization is never read
           u8 hw_version =3D readl_relaxed(csiphy->base +
              ^~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:163:2: warning:=
 Value stored to 'hw_version' is never read [clang-analyzer-deadcode.DeadSt=
ores]
           hw_version |=3D readl_relaxed(csiphy->base +
           ^
   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:163:2: note: Va=
lue stored to 'hw_version' is never read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   net/caif/cfrfml.c:223:14: warning: Access to field 'transmit' results in=
 a dereference of a null pointer (loaded from field 'dn') [clang-analyzer-c=
ore.NullDereference]
           caif_assert(layr->dn->transmit !=3D NULL);
                       ^
   include/net/caif/caif_layer.h:29:8: note: expanded from macro 'caif_asse=
rt'
           if (!(assert)) {                                        \

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
--===============3649651531669367032==--

