Content-Type: multipart/mixed; boundary="===============4739045308905325729=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: warning: Value stored to 'gen' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 03 Feb 2022 02:15:15 +0800
Message-ID: <202202030233.66Zic92f-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4739045308905325729==
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
head:   9f7fb8de5d9bac17b6392a14af40baf555d9129b
commit: 2fa698e3da84edc6b7a2d670f8bd5035891a744e media: camss: vfe: Decreas=
e priority of of VFE HW version to 'dbg'
date:   4 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220130 (https://download.01.org/0day-ci/archi=
ve/20220203/202202030233.66Zic92f-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
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
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/scsi/smartpqi/smartpqi_init.c:1519:3: note: Control jumps to lin=
e 1541
                   goto out;
                   ^
   drivers/scsi/smartpqi/smartpqi_init.c:1543:2: note: Returning value (loa=
ded from 'rc'), which participates in a condition later
           return rc;
           ^~~~~~~~~
   drivers/scsi/smartpqi/smartpqi_init.c:1556:8: note: Returning from 'pqi_=
get_logical_device_info'
                   rc =3D pqi_get_logical_device_info(ctrl_info, device);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/smartpqi/smartpqi_init.c:1560:2: note: Returning value (loa=
ded from 'rc'), which participates in a condition later
           return rc;
           ^~~~~~~~~
   drivers/scsi/smartpqi/smartpqi_init.c:2270:8: note: Returning from 'pqi_=
get_device_info'
                   rc =3D pqi_get_device_info(ctrl_info, device, id_phys);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/smartpqi/smartpqi_init.c:2271:7: note: Assuming the conditi=
on is false
                   if (rc =3D=3D -ENOMEM) {
                       ^~~~~~~~~~~~~
   drivers/scsi/smartpqi/smartpqi_init.c:2271:3: note: Taking false branch
                   if (rc =3D=3D -ENOMEM) {
                   ^
   drivers/scsi/smartpqi/smartpqi_init.c:2276:7: note: 'rc' is not equal to=
 0
                   if (rc) {
                       ^~
   drivers/scsi/smartpqi/smartpqi_init.c:2276:3: note: Taking true branch
                   if (rc) {
                   ^
   drivers/scsi/smartpqi/smartpqi_init.c:2277:8: note: Assuming field 'is_p=
hysical_device' is not equal to 0
                           if (device->is_physical_device)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/smartpqi/smartpqi_init.c:2277:4: note: Taking true branch
                           if (device->is_physical_device)
                           ^
   drivers/scsi/smartpqi/smartpqi_init.c:2278:5: note: Loop condition is fa=
lse.  Exiting loop
                                   dev_warn(&ctrl_info->pci_dev->dev,
                                   ^
   include/linux/dev_printk.h:146:2: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/scsi/smartpqi/smartpqi_init.c:2280:25: note: Passing null pointe=
r value via 1st parameter 'p'
                                           get_unaligned_be64(&phys_lun_ext=
_entry->wwid));
                                                              ^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
                                                                           =
    ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/scsi/smartpqi/smartpqi_init.c:2280:6: note: Calling 'get_unalign=
ed_be64'
                                           get_unaligned_be64(&phys_lun_ext=
_entry->wwid));
                                           ^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
                                                                           =
    ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   include/asm-generic/unaligned.h:67:21: note: '__pptr' initialized to a n=
ull pointer value
           return be64_to_cpu(__get_unaligned_t(__be64, p));
                              ^
   include/asm-generic/unaligned.h:13:37: note: expanded from macro '__get_=
unaligned_t'
           const struct { type x; } __packed *__pptr =3D (typeof(__pptr))(p=
tr);      \
                                              ^~~~~~
   include/uapi/linux/byteorder/little_endian.h:38:59: note: expanded from =
macro '__be64_to_cpu'
   #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
                                                             ^
   include/uapi/linux/swab.h:128:54: note: expanded from macro '__swab64'
   #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
                                                        ^
   include/asm-generic/unaligned.h:67:21: note: Access to field 'x' results=
 in a dereference of a null pointer (loaded from variable '__pptr')
           return be64_to_cpu(__get_unaligned_t(__be64, p));
                              ^
   include/asm-generic/unaligned.h:14:2: note: expanded from macro '__get_u=
naligned_t'
           __pptr->x;                                                      =
        \
           ^~~~~~
   include/uapi/linux/byteorder/little_endian.h:38:59: note: expanded from =
macro '__be64_to_cpu'
   #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
                                                             ^
   include/uapi/linux/swab.h:128:54: note: expanded from macro '__swab64'
   #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
                                                        ^
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
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
   drivers/media/platform/qcom/camss/camss-vfe-170.c:336:6: warning: Value =
stored to 'violation' during its initialization is never read [clang-analyz=
er-deadcode.DeadStores]
           u32 violation =3D readl_relaxed(vfe->base + VFE_VIOLATION_STATUS=
);
               ^~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:336:6: note: Value sto=
red to 'violation' during its initialization is never read
           u32 violation =3D readl_relaxed(vfe->base + VFE_VIOLATION_STATUS=
);
               ^~~~~~~~~
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
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
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.

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
--===============4739045308905325729==--

