Content-Type: multipart/mixed; boundary="===============3386896486539226662=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/qcom/camss/camss-csid-170.c:478:2: warning: Value stored to 'hw_gen' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 30 Jan 2022 13:33:13 +0800
Message-ID: <202201301313.JbVipOuS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3386896486539226662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Robert Foss <robert.foss@linaro.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Andrey Konovalov <andrey.konovalov@linaro.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f8c7e4ede46fe63ff10000669652648aab09d112
commit: eebe6d00e9bf1216fb381b64146e1b7e50d90b3f media: camss: Add support =
for CSID hardware version Titan 170
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220130 (https://download.01.org/0day-ci/archi=
ve/20220130/202201301313.JbVipOuS-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Deebe6d00e9bf1216fb381b64146e1b7e50d90b3f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout eebe6d00e9bf1216fb381b64146e1b7e50d90b3f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                              ^~~~~~   ~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   13 warnings generated.
   drivers/media/tuners/si2157.c:558:4: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           std =3D "palGH";
                           ^     ~~~~~~~
   drivers/media/tuners/si2157.c:558:4: note: Value stored to 'std' is neve=
r read
                           std =3D "palGH";
                           ^     ~~~~~~~
   drivers/media/tuners/si2157.c:564:5: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   std =3D "secamGH";
                                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:564:5: note: Value stored to 'std' is neve=
r read
                                   std =3D "secamGH";
                                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:568:4: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           std =3D "palB";
                           ^     ~~~~~~
   drivers/media/tuners/si2157.c:568:4: note: Value stored to 'std' is neve=
r read
                           std =3D "palB";
                           ^     ~~~~~~
   drivers/media/tuners/si2157.c:573:5: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   std =3D "secamB";
                                   ^     ~~~~~~~~
   drivers/media/tuners/si2157.c:573:5: note: Value stored to 'std' is neve=
r read
                                   std =3D "secamB";
                                   ^     ~~~~~~~~
   drivers/media/tuners/si2157.c:578:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "MN";
                   ^     ~~~~
   drivers/media/tuners/si2157.c:578:3: note: Value stored to 'std' is neve=
r read
                   std =3D "MN";
                   ^     ~~~~
   drivers/media/tuners/si2157.c:583:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "palI";
                   ^     ~~~~~~
   drivers/media/tuners/si2157.c:583:3: note: Value stored to 'std' is neve=
r read
                   std =3D "palI";
                   ^     ~~~~~~
   drivers/media/tuners/si2157.c:588:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "palDK";
                   ^     ~~~~~~~
   drivers/media/tuners/si2157.c:588:3: note: Value stored to 'std' is neve=
r read
                   std =3D "palDK";
                   ^     ~~~~~~~
   drivers/media/tuners/si2157.c:593:4: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           std =3D "secamDK";
                           ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:593:4: note: Value stored to 'std' is neve=
r read
                           std =3D "secamDK";
                           ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:597:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "secamL";
                   ^     ~~~~~~~~
   drivers/media/tuners/si2157.c:597:3: note: Value stored to 'std' is neve=
r read
                   std =3D "secamL";
                   ^     ~~~~~~~~
   drivers/media/tuners/si2157.c:603:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "secamL'";
                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:603:3: note: Value stored to 'std' is neve=
r read
                   std =3D "secamL'";
                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:609:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "unknown";
                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:609:3: note: Value stored to 'std' is neve=
r read
                   std =3D "unknown";
                   ^     ~~~~~~~~~
   Suppressed 2 warnings (2 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/input/serio/apbps2.c:114:3: warning: Value stored to 'tmp' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D ioread32be(&priv->regs->data);
                   ^
   drivers/input/serio/apbps2.c:114:3: note: Value stored to 'tmp' is never=
 read
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   5 warnings generated.
   drivers/media/platform/qcom/camss/camss-csid-170.c:398:3: warning: Value=
 stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                   val =3D 0;
                   ^     ~
   drivers/media/platform/qcom/camss/camss-csid-170.c:398:3: note: Value st=
ored to 'val' is never read
                   val =3D 0;
                   ^     ~
>> drivers/media/platform/qcom/camss/camss-csid-170.c:478:2: warning: Value=
 stored to 'hw_gen' is never read [clang-analyzer-deadcode.DeadStores]
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:478:2: note: Value st=
ored to 'hw_gen' is never read
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-csid-170.c:479:2: warning: Value=
 stored to 'hw_rev' is never read [clang-analyzer-deadcode.DeadStores]
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:479:2: note: Value st=
ored to 'hw_rev' is never read
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-csid-170.c:480:2: warning: Value=
 stored to 'hw_step' is never read [clang-analyzer-deadcode.DeadStores]
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:480:2: note: Value st=
ored to 'hw_step' is never read
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/scsi/mvsas/mv_64xx.c:262:3: warning: Value stored to 'cctl' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   cctl &=3D ~CCTL_RST;
                   ^       ~~~~~~~~~
   drivers/scsi/mvsas/mv_64xx.c:262:3: note: Value stored to 'cctl' is neve=
r read
                   cctl &=3D ~CCTL_RST;
                   ^       ~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/scsi/mvsas/mv_94xx.c:382:3: warning: Value stored to 'cctl' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   cctl &=3D ~CCTL_RST;
                   ^       ~~~~~~~~~
   drivers/scsi/mvsas/mv_94xx.c:382:3: note: Value stored to 'cctl' is neve=
r read
                   cctl &=3D ~CCTL_RST;
                   ^       ~~~~~~~~~
   drivers/scsi/mvsas/mv_94xx.c:517:2: warning: Value stored to 'tmp' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           tmp =3D 0;
           ^     ~
   drivers/scsi/mvsas/mv_94xx.c:517:2: note: Value stored to 'tmp' is never=
 read
           tmp =3D 0;
           ^     ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/scsi/be2iscsi/be_iscsi.c:949:8: warning: Access to field 'cid_ar=
ray' results in a dereference of a null pointer (loaded from variable 'cid_=
info') [clang-analyzer-core.NullDereference]
           cid =3D cid_info->cid_array[cid_info->cid_alloc];
                 ^
   drivers/scsi/be2iscsi/be_iscsi.c:1144:6: note: Assuming 'shost' is non-n=
ull
           if (!shost) {
               ^~~~~~
   drivers/scsi/be2iscsi/be_iscsi.c:1144:2: note: Taking false branch
           if (!shost) {
           ^
   drivers/scsi/be2iscsi/be_iscsi.c:1151:7: note: Assuming the condition is=
 true
           if (!beiscsi_hba_is_online(phba)) {
                ^
   drivers/scsi/be2iscsi/be_main.h:397:3: note: expanded from macro 'beiscs=
i_hba_is_online'
           (!beiscsi_hba_in_error((phba)) && \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/be2iscsi/be_iscsi.c:1151:7: note: Left side of '&&' is true
           if (!beiscsi_hba_is_online(phba)) {
                ^
   drivers/scsi/be2iscsi/be_main.h:397:3: note: expanded from macro 'beiscs=
i_hba_is_online'
           (!beiscsi_hba_in_error((phba)) && \
            ^
   drivers/scsi/be2iscsi/be_iscsi.c:1151:6: note: Assuming the condition is=
 false
           if (!beiscsi_hba_is_online(phba)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/be2iscsi/be_iscsi.c:1151:2: note: Taking false branch

vim +/hw_gen +478 drivers/media/platform/qcom/camss/camss-csid-170.c

eebe6d00e9bf12 Robert Foss 2021-03-16  463  =

eebe6d00e9bf12 Robert Foss 2021-03-16  464  /*
eebe6d00e9bf12 Robert Foss 2021-03-16  465   * csid_hw_version - CSID hardw=
are version query
eebe6d00e9bf12 Robert Foss 2021-03-16  466   * @csid: CSID device
eebe6d00e9bf12 Robert Foss 2021-03-16  467   *
eebe6d00e9bf12 Robert Foss 2021-03-16  468   * Return HW version or error
eebe6d00e9bf12 Robert Foss 2021-03-16  469   */
eebe6d00e9bf12 Robert Foss 2021-03-16  470  static u32 csid_hw_version(stru=
ct csid_device *csid)
eebe6d00e9bf12 Robert Foss 2021-03-16  471  {
eebe6d00e9bf12 Robert Foss 2021-03-16  472  	u32 hw_version;
eebe6d00e9bf12 Robert Foss 2021-03-16  473  	u32 hw_gen;
eebe6d00e9bf12 Robert Foss 2021-03-16  474  	u32 hw_rev;
eebe6d00e9bf12 Robert Foss 2021-03-16  475  	u32 hw_step;
eebe6d00e9bf12 Robert Foss 2021-03-16  476  =

eebe6d00e9bf12 Robert Foss 2021-03-16  477  	hw_version =3D readl_relaxed(c=
sid->base + CSID_HW_VERSION);
eebe6d00e9bf12 Robert Foss 2021-03-16 @478  	hw_gen =3D (hw_version >> HW_V=
ERSION_GENERATION) & 0xF;
eebe6d00e9bf12 Robert Foss 2021-03-16 @479  	hw_rev =3D (hw_version >> HW_V=
ERSION_REVISION) & 0xFFF;
eebe6d00e9bf12 Robert Foss 2021-03-16 @480  	hw_step =3D (hw_version >> HW_=
VERSION_STEPPING) & 0xFFFF;
eebe6d00e9bf12 Robert Foss 2021-03-16  481  	dev_dbg(csid->camss->dev, "CSI=
D HW Version =3D %u.%u.%u\n",
eebe6d00e9bf12 Robert Foss 2021-03-16  482  		hw_gen, hw_rev, hw_step);
eebe6d00e9bf12 Robert Foss 2021-03-16  483  =

eebe6d00e9bf12 Robert Foss 2021-03-16  484  	return hw_version;
eebe6d00e9bf12 Robert Foss 2021-03-16  485  }
eebe6d00e9bf12 Robert Foss 2021-03-16  486  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3386896486539226662==--

