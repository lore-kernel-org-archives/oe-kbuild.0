Content-Type: multipart/mixed; boundary="===============4878991901738294710=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: warning: Value stored to 'gen' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 04 Jan 2022 06:12:01 +0800
Message-ID: <202201040644.UKhAeJ5h-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4878991901738294710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Robert Foss <robert.foss@linaro.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c9e6606c7fe92b50a02ce51dda82586ebdf99b48
commit: 2fa698e3da84edc6b7a2d670f8bd5035891a744e media: camss: vfe: Decreas=
e priority of of VFE HW version to 'dbg'
date:   3 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20211227 (https://download.01.org/0day-ci/arc=
hive/20220104/202201040644.UKhAeJ5h-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726=
c64d3b6cca66f7c54d457d586aa3129f67)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2fa698e3da84edc6b7a2d670f8bd5035891a744e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2fa698e3da84edc6b7a2d670f8bd5035891a744e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3818:2: note: Taking false branch
           if (!this->read_word)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3820:6: note: Assuming field 'wr=
ite_word' is non-null
           if (!this->write_word)
               ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3820:2: note: Taking false branch
           if (!this->write_word)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3823:6: note: Assuming field 'co=
mmand' is non-null
           if (!this->command)
               ^~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3823:2: note: Taking false branch
           if (!this->command)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3825:6: note: Assuming field 'wa=
it' is non-null
           if (!this->wait)
               ^~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3825:2: note: Taking false branch
           if (!this->wait)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3827:6: note: Assuming field 'bb=
t_wait' is non-null
           if (!this->bbt_wait)
               ^~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3827:2: note: Taking false branch
           if (!this->bbt_wait)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3829:6: note: Assuming field 'un=
lock_all' is non-null
           if (!this->unlock_all)
               ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3829:2: note: Taking false branch
           if (!this->unlock_all)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3832:6: note: Assuming field 'ch=
ip_probe' is non-null
           if (!this->chip_probe)
               ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3832:2: note: Taking false branch
           if (!this->chip_probe)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3835:6: note: Assuming field 're=
ad_bufferram' is non-null
           if (!this->read_bufferram)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3835:2: note: Taking false branch
           if (!this->read_bufferram)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3837:6: note: Assuming field 'wr=
ite_bufferram' is non-null
           if (!this->write_bufferram)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3837:2: note: Taking false branch
           if (!this->write_bufferram)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3840:6: note: Assuming field 'bl=
ock_markbad' is non-null
           if (!this->block_markbad)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3840:2: note: Taking false branch
           if (!this->block_markbad)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3842:6: note: Assuming field 'sc=
an_bbt' is non-null
           if (!this->scan_bbt)
               ^~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3842:2: note: Taking false branch
           if (!this->scan_bbt)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3845:6: note: Calling 'onenand_p=
robe'
           if (onenand_probe(mtd))
               ^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3696:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/nand/onenand/onenand_base.c:3696:2: note: Taking false branch
           if (ret)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3713:18: note: Assuming the cond=
ition is false
           if (FLEXONENAND(this)) {
                           ^
   include/linux/mtd/onenand.h:161:3: note: expanded from macro 'FLEXONENAN=
D'
           (this->device_id & DEVICE_IS_FLEXONENAND)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3713:2: note: Taking false branch
           if (FLEXONENAND(this)) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3735:26: note: Assuming the cond=
ition is false
           if (ONENAND_IS_4KB_PAGE(this))
                                   ^
   include/linux/mtd/onenand.h:206:3: note: expanded from macro 'ONENAND_IS=
_4KB_PAGE'
           (this->options & ONENAND_HAS_4KB_PAGE)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3735:2: note: Taking false branch
           if (ONENAND_IS_4KB_PAGE(this))
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3746:2: note: Taking false branch
           if (FLEXONENAND(this))
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3751:23: note: The result of the=
 left shift is undefined due to shifting by '4294967295', which is greater =
or equal to the width of type 'int'
           this->page_mask =3D (1 << (this->erase_shift - this->page_shift)=
) - 1;
                                ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
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
   Suppressed 17 warnings (9 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (9 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   include/media/v4l2-subdev.h:1000:10: warning: Access to field 'pads' res=
ults in a dereference of a null pointer (loaded from variable 'state') [cla=
ng-analyzer-core.NullDereference]
           return &state->pads[pad].try_fmt;
                   ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1531:14: note: Assuming 'i=
' is < field 'line_num'
           for (i =3D 0; i < vfe->line_num; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1531:2: note: Loop conditi=
on is true.  Entering loop body
           for (i =3D 0; i < vfe->line_num; i++) {
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1541:7: note: 'i' is not e=
qual to VFE_LINE_PIX
                   if (i =3D=3D VFE_LINE_PIX)
                       ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1541:3: note: Taking false=
 branch
                   if (i =3D=3D VFE_LINE_PIX)
                   ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1550:9: note: Calling 'vfe=
_init_formats'
                   ret =3D vfe_init_formats(sd, NULL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1256:12: note: 'fh' is null
                   .which =3D fh ? V4L2_SUBDEV_FORMAT_TRY :
                            ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1256:12: note: '?' conditi=
on is false
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:28: note: 'fh' is null
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                                     ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:28: note: '?' conditi=
on is false
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:28: note: Passing nul=
l pointer value via 2nd parameter 'sd_state'
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                                     ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:9: note: Calling 'vfe=
_set_format'
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1074:6: note: 'format' is =
not equal to NULL
           if (format =3D=3D NULL)
               ^~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1074:2: note: Taking false=
 branch
           if (format =3D=3D NULL)
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1080:6: note: Assuming fie=
ld 'pad' is equal to MSM_VFE_PAD_SINK
           if (fmt->pad =3D=3D MSM_VFE_PAD_SINK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1080:2: note: Taking true =
branch
           if (fmt->pad =3D=3D MSM_VFE_PAD_SINK) {
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1085:35: note: Passing nul=
l pointer value via 2nd parameter 'sd_state'
                   format =3D __vfe_get_format(line, sd_state, MSM_VFE_PAD_=
SRC,
                                                   ^~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1085:12: note: Calling '__=
vfe_get_format'
                   format =3D __vfe_get_format(line, sd_state, MSM_VFE_PAD_=
SRC,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/media/platform/qcom/camss/camss-vfe.c:768:6: note: Assuming 'whi=
ch' is equal to V4L2_SUBDEV_FORMAT_TRY
           if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:768:2: note: Taking true b=
ranch
           if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:769:52: note: Passing null=
 pointer value via 2nd parameter 'state'
                   return v4l2_subdev_get_try_format(&line->subdev, sd_stat=
e,
                                                                    ^~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:769:10: note: Calling 'v4l=
2_subdev_get_try_format'
                   return v4l2_subdev_get_try_format(&line->subdev, sd_stat=
e,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
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
   Suppressed 16 warnings (9 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.

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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4878991901738294710==--

