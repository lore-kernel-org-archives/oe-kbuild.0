Content-Type: multipart/mixed; boundary="===============4127338837747924145=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: warning: Value stored to 'gen' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 30 Apr 2022 14:53:16 +0800
Message-ID: <202204301419.9fO2Gnds-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4127338837747924145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Robert Foss <robert.foss@linaro.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8013d1d3d2e33236dee13a133fba49ad55045e79
commit: 2fa698e3da84edc6b7a2d670f8bd5035891a744e media: camss: vfe: Decreas=
e priority of of VFE HW version to 'dbg'
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220427 (https://download.01.org/0day-ci/archi=
ve/20220430/202204301419.9fO2Gnds-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2fa698e3da84edc6b7a2d670f8bd5035891a744e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2fa698e3da84edc6b7a2d670f8bd5035891a744e
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/btrfs/volumes.c:6702:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   fs/btrfs/volumes.c:6702:2: note: Taking false branch
           if (ret) {
           ^
   fs/btrfs/volumes.c:6714:7: note: Assuming the condition is false
           if ((bbio->map_type & BTRFS_BLOCK_GROUP_RAID56_MASK) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6714:55: note: Left side of '&&' is false
           if ((bbio->map_type & BTRFS_BLOCK_GROUP_RAID56_MASK) &&
                                                                ^
   fs/btrfs/volumes.c:6730:6: note: Assuming 'map_length' is >=3D 'length'
           if (map_length < length) {
               ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6730:2: note: Taking false branch
           if (map_length < length) {
           ^
   fs/btrfs/volumes.c:6737:19: note: Assuming 'dev_nr' is < 'total_devs'
           for (dev_nr =3D 0; dev_nr < total_devs; dev_nr++) {
                            ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6737:2: note: Loop condition is true.  Entering loop =
body
           for (dev_nr =3D 0; dev_nr < total_devs; dev_nr++) {
           ^
   fs/btrfs/volumes.c:6739:7: note: Assuming 'dev' is null
                   if (!dev || !dev->bdev || test_bit(BTRFS_DEV_STATE_MISSI=
NG,
                       ^~~~
   fs/btrfs/volumes.c:6739:12: note: Left side of '||' is true
                   if (!dev || !dev->bdev || test_bit(BTRFS_DEV_STATE_MISSI=
NG,
                            ^
   fs/btrfs/volumes.c:6743:4: note: Calling 'bbio_error'
                           bbio_error(bbio, first_bio, logical);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6669:2: note: Taking true branch
           if (atomic_dec_and_test(&bbio->stripes_pending)) {
           ^
   fs/btrfs/volumes.c:6671:11: note: Assuming 'bio' is equal to field 'orig=
_bio'
                   WARN_ON(bio !=3D bbio->orig_bio);
                           ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   fs/btrfs/volumes.c:6671:3: note: Taking false branch
                   WARN_ON(bio !=3D bbio->orig_bio);
                   ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   fs/btrfs/volumes.c:6675:7: note: Assuming the condition is false
                   if (atomic_read(&bbio->error) > bbio->max_errors)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6675:3: note: Taking false branch
                   if (atomic_read(&bbio->error) > bbio->max_errors)
                   ^
   fs/btrfs/volumes.c:6679:3: note: Calling 'btrfs_end_bbio'
                   btrfs_end_bbio(bbio, bio);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6573:2: note: Calling 'btrfs_put_bbio'
           btrfs_put_bbio(bbio);
           ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:5849:7: note: 'bbio' is non-null
           if (!bbio)
                ^~~~
   fs/btrfs/volumes.c:5849:2: note: Taking false branch
           if (!bbio)
           ^
   fs/btrfs/volumes.c:5851:2: note: Taking true branch
           if (refcount_dec_and_test(&bbio->refs))
           ^
   fs/btrfs/volumes.c:5852:3: note: Memory is released
                   kfree(bbio);
                   ^~~~~~~~~~~
   fs/btrfs/volumes.c:6573:2: note: Returning; memory was released via 1st =
parameter
           btrfs_put_bbio(bbio);
           ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6679:3: note: Returning; memory was released via 1st =
parameter
                   btrfs_end_bbio(bbio, bio);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6743:4: note: Returning; memory was released via 1st =
parameter
                           bbio_error(bbio, first_bio, logical);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6744:4: note:  Execution continues on line 6737
                           continue;
                           ^
   fs/btrfs/volumes.c:6737:19: note: Assuming 'dev_nr' is < 'total_devs'
           for (dev_nr =3D 0; dev_nr < total_devs; dev_nr++) {
                            ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6737:2: note: Loop condition is true.  Entering loop =
body
           for (dev_nr =3D 0; dev_nr < total_devs; dev_nr++) {
           ^
   fs/btrfs/volumes.c:6738:9: note: Use of memory after it is freed
                   dev =3D bbio->stripes[dev_nr].dev;
                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:8130:4: warning: Value stored to 'ret' is never read =
[clang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/btrfs/volumes.c:8130:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   5 warnings generated.
>> drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: warning: Value =
stored to 'gen' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           u32 gen =3D (hw_version >> 28) & 0xF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: note: Value sto=
red to 'gen' during its initialization is never read
           u32 gen =3D (hw_version >> 28) & 0xF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-vfe-170.c:185:6: warning: Value =
stored to 'rev' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           u32 rev =3D (hw_version >> 16) & 0xFFF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:185:6: note: Value sto=
red to 'rev' during its initialization is never read
           u32 rev =3D (hw_version >> 16) & 0xFFF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-vfe-170.c:186:6: warning: Value =
stored to 'step' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           u32 step =3D hw_version & 0xFFFF;
               ^~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:186:6: note: Value sto=
red to 'step' during its initialization is never read
           u32 step =3D hw_version & 0xFFFF;
               ^~~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 with check filters).
   3 warnings generated.
   drivers/w1/slaves/w1_therm.c:1252:5: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D -EIO;
                                   ^     ~~~~
   drivers/w1/slaves/w1_therm.c:1252:5: note: Value stored to 'ret' is neve=
r read
                                   ret =3D -EIO;
                                   ^     ~~~~
   drivers/w1/slaves/w1_therm.c:1799:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(p_args, buf);
           ^~~~~~
   drivers/w1/slaves/w1_therm.c:1799:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(p_args, buf);
           ^~~~~~
   drivers/w1/slaves/w1_therm.c:2090:22: warning: The right operand of '=3D=
=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (sl->reg_num.id =3D=3D reg_num->id)
                                      ^  ~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2067:6: note: Assuming the condition is fal=
se
           if (w1_reset_bus(sl->master))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2067:2: note: Taking false branch
           if (w1_reset_bus(sl->master))
           ^
   drivers/w1/slaves/w1_therm.c:2077:6: note: Assuming 'ack' is equal to W1=
_42_SUCCESS_CONFIRM_BYTE
           if (ack !=3D W1_42_SUCCESS_CONFIRM_BYTE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2077:2: note: Taking false branch
           if (ack !=3D W1_42_SUCCESS_CONFIRM_BYTE)
           ^
   drivers/w1/slaves/w1_therm.c:2081:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i <=3D 64; i++) {
           ^
   drivers/w1/slaves/w1_therm.c:2082:7: note: Assuming the condition is fal=
se
                   if (w1_reset_bus(sl->master))
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2082:3: note: Taking false branch
                   if (w1_reset_bus(sl->master))
                   ^
   drivers/w1/slaves/w1_therm.c:2088:7: note: Assuming field 'family' is no=
t equal to W1_42_FINISHED_BYTE
                   if (reg_num->family =3D=3D W1_42_FINISHED_BYTE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2088:3: note: Taking false branch
                   if (reg_num->family =3D=3D W1_42_FINISHED_BYTE)
                   ^
   drivers/w1/slaves/w1_therm.c:2090:22: note: The right operand of '=3D=3D=
' is a garbage value
                   if (sl->reg_num.id =3D=3D reg_num->id)
                                      ^  ~~~~~~~~~~~
   1 warning generated.
   drivers/w1/slaves/w1_ds2438.c:69:3: warning: Value stored to 'crc' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   crc =3D 0;
                   ^     ~
   drivers/w1/slaves/w1_ds2438.c:69:3: note: Value stored to 'crc' is never=
 read
                   crc =3D 0;
                   ^     ~
   1 warning generated.
   drivers/comedi/drivers/pcmmio.c:578:2: warning: Value stored to 'val' is=
 never read [clang-analyzer-deadcode.DeadStores]
           val |=3D inb(iobase + PCMMIO_AI_MSB_REG) << 8;
           ^
   drivers/comedi/drivers/pcmmio.c:578:2: note: Value stored to 'val' is ne=
ver read
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/test-drivers/vicodec/codec-fwht.c:638:2: warning: Value st=
ored to 'deltablock' is never read [clang-analyzer-deadcode.DeadStores]
           deltablock -=3D 64;
           ^             ~~
   drivers/media/test-drivers/vicodec/codec-fwht.c:638:2: note: Value store=
d to 'deltablock' is never read
           deltablock -=3D 64;
           ^             ~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   4 warnings generated.
   drivers/media/test-drivers/vidtv/vidtv_bridge.c:123:6: warning: Value st=
ored to 'mux_buf_sz' during its initialization is never read [clang-analyze=
r-deadcode.DeadStores]
           u32 mux_buf_sz =3D mux_buf_sz_pkts * TS_PACKET_LEN;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/test-drivers/vidtv/vidtv_bridge.c:123:6: note: Value store=
d to 'mux_buf_sz' during its initialization is never read
           u32 mux_buf_sz =3D mux_buf_sz_pkts * TS_PACKET_LEN;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/test-drivers/vidtv/vidtv_bridge.c:206:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D &dvb->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/media/test-drivers/vidtv/vidtv_bridge.c:206:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D &dvb->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 with check filters).
   1 warning generated.
   drivers/media/test-drivers/vidtv/vidtv_s302m.c:383:3: warning: Value sto=
red to 'nbytes_per_unit' is never read [clang-analyzer-deadcode.DeadStores]
                   nbytes_per_unit =3D 0;
                   ^                 ~
   drivers/media/test-drivers/vidtv/vidtv_s302m.c:383:3: note: Value stored=
 to 'nbytes_per_unit' is never read

vim +/gen +184 drivers/media/platform/qcom/camss/camss-vfe-170.c

7319cdf189bb64 Robert Foss 2021-03-16  179  =

7319cdf189bb64 Robert Foss 2021-03-16  180  static void vfe_hw_version_read=
(struct vfe_device *vfe, struct device *dev)
7319cdf189bb64 Robert Foss 2021-03-16  181  {
7319cdf189bb64 Robert Foss 2021-03-16  182  	u32 hw_version =3D readl_relax=
ed(vfe->base + VFE_HW_VERSION);
7319cdf189bb64 Robert Foss 2021-03-16  183  =

7319cdf189bb64 Robert Foss 2021-03-16 @184  	u32 gen =3D (hw_version >> 28)=
 & 0xF;
7319cdf189bb64 Robert Foss 2021-03-16 @185  	u32 rev =3D (hw_version >> 16)=
 & 0xFFF;
7319cdf189bb64 Robert Foss 2021-03-16 @186  	u32 step =3D hw_version & 0xFF=
FF;
7319cdf189bb64 Robert Foss 2021-03-16  187  =

2fa698e3da84ed Robert Foss 2021-07-26  188  	dev_dbg(dev, "VFE HW Version =
=3D %u.%u.%u\n", gen, rev, step);
7319cdf189bb64 Robert Foss 2021-03-16  189  }
7319cdf189bb64 Robert Foss 2021-03-16  190  =


:::::: The code at line 184 was first introduced by commit
:::::: 7319cdf189bb643c6d56e5898ef89ad7c3ef6c31 media: camss: Add support f=
or VFE hardware version Titan 170

:::::: TO: Robert Foss <robert.foss@linaro.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4127338837747924145==--

