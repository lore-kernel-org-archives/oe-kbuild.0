Content-Type: multipart/mixed; boundary="===============0356352936857557909=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 886/9128] drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:163:2: warning: Value stored to 'hw_version' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 27 Feb 2022 03:14:28 +0800
Message-ID: <202202270117.9ZXr8ZRP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0356352936857557909==
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
head:   06aeb1495c39c86ccfaf1adadc1d2200179f16eb
commit: dd89115a7c1cf31223cbeab2430d03bf202c8b22 [886/9128] media: camss: c=
siphy-3ph: don't print HW version as an error
:::::: branch date: 16 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220222 (https://download.01.org/0day-ci/arc=
hive/20220227/202202270117.9ZXr8ZRP-lkp(a)intel.com/config)
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
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:12:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:80:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:80:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:99:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:99:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:298:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:298:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:313:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:313:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:322:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:322:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:333:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:333:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:347:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:347:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:377:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:377:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:413:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:413:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:445:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:445:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:484:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:484:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:503:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:503:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:525:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:525:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
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
   13 warnings generated.
   fs/gfs2/dir.c:939:2: warning: Value stored to 'x' is never read [clang-a=
nalyzer-deadcode.DeadStores]
           x =3D 0;
           ^   ~
   fs/gfs2/dir.c:939:2: note: Value stored to 'x' is never read
           x =3D 0;
           ^   ~
   fs/gfs2/dir.c:1094:5: warning: Value stored to 'error' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                                   error =3D PTR_ERR(new);
                                   ^       ~~~~~~~~~~~~
   fs/gfs2/dir.c:1094:5: note: Value stored to 'error' is never read
                                   error =3D PTR_ERR(new);
                                   ^       ~~~~~~~~~~~~
   fs/gfs2/dir.c:1277:13: warning: Dereference of null pointer [clang-analy=
zer-core.NullDereference]
           off_next =3D dent_next->de_cookie;
                      ^
   fs/gfs2/dir.c:1579:6: note: Assuming field 'i_entries' is not equal to 0
           if (!dip->i_entries)
               ^~~~~~~~~~~~~~~
   fs/gfs2/dir.c:1579:2: note: Taking false branch
           if (!dip->i_entries)
           ^
   fs/gfs2/dir.c:1582:6: note: Assuming the condition is true
           if (dip->i_diskflags & GFS2_DIF_EXHASH)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/dir.c:1582:2: note: Taking true branch
           if (dip->i_diskflags & GFS2_DIF_EXHASH)
           ^
   fs/gfs2/dir.c:1583:10: note: Calling 'dir_e_read'
                   return dir_e_read(inode, ctx, f_ra);

vim +/hw_version +163 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-=
0.c

2f8b67195e4839c Robert Foss    2021-03-16  148  =

4138a88b6093e1f Todor Tomov    2018-07-25  149  static void csiphy_hw_versi=
on_read(struct csiphy_device *csiphy,
4138a88b6093e1f Todor Tomov    2018-07-25  150  				   struct device *dev)
4138a88b6093e1f Todor Tomov    2018-07-25  151  {
4138a88b6093e1f Todor Tomov    2018-07-25  152  	u32 hw_version;
4138a88b6093e1f Todor Tomov    2018-07-25  153  =

4138a88b6093e1f Todor Tomov    2018-07-25  154  	writel(CSIPHY_3PH_CMN_CSI_=
COMMON_CTRL6_SHOW_REV_ID,
4138a88b6093e1f Todor Tomov    2018-07-25  155  	       csiphy->base + CSIP=
HY_3PH_CMN_CSI_COMMON_CTRLn(6));
4138a88b6093e1f Todor Tomov    2018-07-25  156  =

4138a88b6093e1f Todor Tomov    2018-07-25  157  	hw_version =3D readl_relax=
ed(csiphy->base +
4138a88b6093e1f Todor Tomov    2018-07-25  158  				   CSIPHY_3PH_CMN_CSI_C=
OMMON_STATUSn(12));
4138a88b6093e1f Todor Tomov    2018-07-25  159  	hw_version |=3D readl_rela=
xed(csiphy->base +
4138a88b6093e1f Todor Tomov    2018-07-25  160  				   CSIPHY_3PH_CMN_CSI_C=
OMMON_STATUSn(13)) << 8;
4138a88b6093e1f Todor Tomov    2018-07-25  161  	hw_version |=3D readl_rela=
xed(csiphy->base +
4138a88b6093e1f Todor Tomov    2018-07-25  162  				   CSIPHY_3PH_CMN_CSI_C=
OMMON_STATUSn(14)) << 16;
4138a88b6093e1f Todor Tomov    2018-07-25 @163  	hw_version |=3D readl_rela=
xed(csiphy->base +
4138a88b6093e1f Todor Tomov    2018-07-25  164  				   CSIPHY_3PH_CMN_CSI_C=
OMMON_STATUSn(15)) << 24;
4138a88b6093e1f Todor Tomov    2018-07-25  165  =

dd89115a7c1cf31 Jonathan Marek 2021-12-22  166  	dev_dbg(dev, "CSIPHY 3PH H=
W Version =3D 0x%08x\n", hw_version);
4138a88b6093e1f Todor Tomov    2018-07-25  167  }
4138a88b6093e1f Todor Tomov    2018-07-25  168  =


:::::: The code@line 163 was first introduced by commit
:::::: 4138a88b6093e1f8bf1b8a95c653bec6c854f119 media: camss: csiphy: Add s=
upport for 8x96

:::::: TO: Todor Tomov <todor.tomov@linaro.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0356352936857557909==--

