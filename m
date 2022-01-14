Content-Type: multipart/mixed; boundary="===============7109874612290692251=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10790/12279] drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c:185:3: warning: Value stored to 'r' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 15 Jan 2022 00:11:04 +0800
Message-ID: <202201150000.fVC3jvVk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7109874612290692251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: James Yao <yiqing.yao@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Jingwen Chen <Jingwen.Chen2@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   468c1d50222ce9439c9835e00ab55ae9ced389fb
commit: 216a9873198bdc5c670a9f71d58fafd30227c9c8 [10790/12279] drm/amdgpu: =
add dummy event6 for vega10
:::::: branch date: 11 hours ago
:::::: commit date: 7 days ago
config: riscv-randconfig-c006-20220112 (https://download.01.org/0day-ci/arc=
hive/20220115/202201150000.fVC3jvVk-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D216a9873198bdc5c670a9f71d58fafd30227c9c8
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 216a9873198bdc5c670a9f71d58fafd30227c9c8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/btrfs/zoned.c:1386:6: note: Assuming field 'alloc_offset' is <=3D fie=
ld 'zone_size'
           if (cache->alloc_offset > fs_info->zone_size) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zoned.c:1386:2: note: Taking false branch
           if (cache->alloc_offset > fs_info->zone_size) {
           ^
   fs/btrfs/zoned.c:1393:6: note: Assuming field 'alloc_offset' is <=3D fie=
ld 'zone_capacity'
           if (cache->alloc_offset > cache->zone_capacity) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zoned.c:1393:2: note: Taking false branch
           if (cache->alloc_offset > cache->zone_capacity) {
           ^
   fs/btrfs/zoned.c:1402:6: note: Branch condition evaluates to a garbage v=
alue
           if (!ret && num_conventional && last_alloc > cache->alloc_offset=
) {
               ^~~~
   fs/btrfs/zoned.c:1696:34: warning: The left operand of '-' is a garbage =
value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           wp =3D physical_start + ((zone.wp - zone.start) << SECTOR_SHIFT);
                                   ~~~~~~~ ^
   fs/btrfs/zoned.c:1689:6: note: Assuming the condition is false
           if (!btrfs_dev_is_sequential(tgt_dev, physical_pos))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zoned.c:1689:2: note: Taking false branch
           if (!btrfs_dev_is_sequential(tgt_dev, physical_pos))
           ^
   fs/btrfs/zoned.c:1692:8: note: Calling 'read_zone_info'
           ret =3D read_zone_info(fs_info, logical, &zone);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zoned.c:1646:6: note: Assuming 'ret' is 0, which participates i=
n a condition later
           if (ret || !bioc || mapped_length < PAGE_SIZE) {
               ^~~
   fs/btrfs/zoned.c:1646:6: note: Left side of '||' is false
   fs/btrfs/zoned.c:1646:13: note: Assuming 'bioc' is non-null, which parti=
cipates in a condition later
           if (ret || !bioc || mapped_length < PAGE_SIZE) {
                      ^~~~~
   fs/btrfs/zoned.c:1646:6: note: Left side of '||' is false
           if (ret || !bioc || mapped_length < PAGE_SIZE) {
               ^
   fs/btrfs/zoned.c:1646:22: note: Assuming the condition is false
           if (ret || !bioc || mapped_length < PAGE_SIZE) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zoned.c:1646:2: note: Taking false branch
           if (ret || !bioc || mapped_length < PAGE_SIZE) {
           ^
   fs/btrfs/zoned.c:1651:6: note: Assuming the condition is false
           if (bioc->map_type & BTRFS_BLOCK_GROUP_RAID56_MASK)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zoned.c:1651:2: note: Taking false branch
           if (bioc->map_type & BTRFS_BLOCK_GROUP_RAID56_MASK)
           ^
   fs/btrfs/zoned.c:1656:14: note: Assuming 'i' is >=3D 'nmirrors'
           for (i =3D 0; i < nmirrors; i++) {
                       ^~~~~~~~~~~~
   fs/btrfs/zoned.c:1656:2: note: Loop condition is false. Execution contin=
ues on line 1670
           for (i =3D 0; i < nmirrors; i++) {
           ^
   fs/btrfs/zoned.c:1672:2: note: Returning without writing to 'zone->wp'
           return ret;
           ^
   fs/btrfs/zoned.c:1672:2: note: Returning zero (loaded from 'ret'), which=
 participates in a condition later
           return ret;
           ^~~~~~~~~~
   fs/btrfs/zoned.c:1692:8: note: Returning from 'read_zone_info'
           ret =3D read_zone_info(fs_info, logical, &zone);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zoned.c:1693:6: note: 'ret' is 0
           if (ret)
               ^~~
   fs/btrfs/zoned.c:1693:2: note: Taking false branch
           if (ret)
           ^
   fs/btrfs/zoned.c:1696:34: note: The left operand of '-' is a garbage val=
ue
           wp =3D physical_start + ((zone.wp - zone.start) << SECTOR_SHIFT);
                                   ~~~~~~~ ^
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
   6 warnings generated.
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
   6 warnings generated.
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
>> drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c:185:3: warning: Value stored to 'r=
' is never read [clang-analyzer-deadcode.DeadStores]
                   r =3D xgpu_ai_poll_msg(adev, IDH_REQ_GPU_INIT_DATA_READY=
);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c:185:3: note: Value stored to 'r' i=
s never read
                   r =3D xgpu_ai_poll_msg(adev, IDH_REQ_GPU_INIT_DATA_READY=
);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/input/touchscreen/ad7877.c:142:8: warning: Excessive padding in =
'struct ser_req' (64 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   sample, =

   reset, =

   msg, =

   xfer, =

   ref_on, =

   command, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ser_req {
   ~~~~~~~^~~~~~~~~
   drivers/input/touchscreen/ad7877.c:142:8: note: Excessive padding in 'st=
ruct ser_req' (64 padding bytes, where 0 is optimal). Optimal fields order:=
 sample, reset, msg, xfer, ref_on, command, consider reordering the fields =
or adding explicit padding members
   struct ser_req {
   ~~~~~~~^~~~~~~~~
   drivers/input/touchscreen/ad7877.c:156:8: warning: Excessive padding in =
'struct ad7877' (102 padding bytes, where 38 is optimal). =

   Optimal fields order: =

   conversion_data, =

   model, =

   input, =

   spi, =

   lock, =

   mutex, =

   timer, =

   msg, =

   xfer, =

   vref_delay_usecs, =

   x_plate_ohms, =

   pressure_max, =

   cmd_crtl1, =

   cmd_crtl2, =

   cmd_dummy, =

   dac, =

   stopacq_polarity, =

   first_conversion_delay, =

   acquisition_time, =

   averaging, =

   pen_down_acc_interval, =

   disabled, =

   gpio3, =

   gpio4, =

   phys, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7877 {
   ~~~~~~~^~~~~~~~
   drivers/input/touchscreen/ad7877.c:156:8: note: Excessive padding in 'st=
ruct ad7877' (102 padding bytes, where 38 is optimal). Optimal fields order=
: conversion_data, model, input, spi, lock, mutex, timer, msg, xfer, vref_d=
elay_usecs, x_plate_ohms, pressure_max, cmd_crtl1, cmd_crtl2, cmd_dummy, da=
c, stopacq_polarity, first_conversion_delay, acquisition_time, averaging, p=
en_down_acc_interval, disabled, gpio3, gpio4, phys, consider reordering the=
 fields or adding explicit padding members
   struct ad7877 {
   ~~~~~~~^~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.

vim +/r +185 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c

890419409a3aba2 Gavin Wan     2017-06-23  160  =

890419409a3aba2 Gavin Wan     2017-06-23  161  static int xgpu_ai_send_acce=
ss_requests(struct amdgpu_device *adev,
890419409a3aba2 Gavin Wan     2017-06-23  162  					enum idh_request req)
890419409a3aba2 Gavin Wan     2017-06-23  163  {
890419409a3aba2 Gavin Wan     2017-06-23  164  	int r;
890419409a3aba2 Gavin Wan     2017-06-23  165  =

890419409a3aba2 Gavin Wan     2017-06-23  166  	xgpu_ai_mailbox_trans_msg(a=
dev, req, 0, 0, 0);
c9c9de93a33ccdb Xiangliang Yu 2017-03-10  167  =

c9c9de93a33ccdb Xiangliang Yu 2017-03-10  168  	/* start to check msg if re=
quest is idh_req_gpu_init_access */
c9c9de93a33ccdb Xiangliang Yu 2017-03-10  169  	if (req =3D=3D IDH_REQ_GPU_=
INIT_ACCESS ||
c9c9de93a33ccdb Xiangliang Yu 2017-03-10  170  		req =3D=3D IDH_REQ_GPU_FIN=
I_ACCESS ||
c9c9de93a33ccdb Xiangliang Yu 2017-03-10  171  		req =3D=3D IDH_REQ_GPU_RES=
ET_ACCESS) {
94b4fd725b7d862 Monk Liu      2017-04-05  172  		r =3D xgpu_ai_poll_msg(ade=
v, IDH_READY_TO_ACCESS_GPU);
17b2e332a277bf8 Monk Liu      2017-04-21  173  		if (r) {
17b2e332a277bf8 Monk Liu      2017-04-21  174  			pr_err("Doesn't get READY=
_TO_ACCESS_GPU from pf, give up\n");
c9c9de93a33ccdb Xiangliang Yu 2017-03-10  175  			return r;
c9c9de93a33ccdb Xiangliang Yu 2017-03-10  176  		}
2dc8f81e4f822cf Horace Chen   2017-10-09  177  		/* Retrieve checksum from =
mailbox2 */
d3c117e564bfbfe Emily Deng    2018-12-29  178  		if (req =3D=3D IDH_REQ_GPU=
_INIT_ACCESS || req =3D=3D IDH_REQ_GPU_RESET_ACCESS) {
2dc8f81e4f822cf Horace Chen   2017-10-09  179  			adev->virt.fw_reserve.che=
cksum_key =3D
2dc8f81e4f822cf Horace Chen   2017-10-09  180  				RREG32_NO_KIQ(SOC15_REG_=
OFFSET(NBIO, 0,
2dc8f81e4f822cf Horace Chen   2017-10-09  181  					mmBIF_BX_PF0_MAILBOX_MS=
GBUF_RCV_DW2));
2dc8f81e4f822cf Horace Chen   2017-10-09  182  		}
216a9873198bdc5 James Yao     2021-12-29  183  	} else if (req =3D=3D IDH_R=
EQ_GPU_INIT_DATA){
216a9873198bdc5 James Yao     2021-12-29  184  		/* Dummy REQ_GPU_INIT_DATA=
 handling */
216a9873198bdc5 James Yao     2021-12-29 @185  		r =3D xgpu_ai_poll_msg(ade=
v, IDH_REQ_GPU_INIT_DATA_READY);
216a9873198bdc5 James Yao     2021-12-29  186  		/* version set to 0 since =
dummy */
216a9873198bdc5 James Yao     2021-12-29  187  		adev->virt.req_init_data_v=
er =3D 0;	=

17b2e332a277bf8 Monk Liu      2017-04-21  188  	}
c9c9de93a33ccdb Xiangliang Yu 2017-03-10  189  =

c9c9de93a33ccdb Xiangliang Yu 2017-03-10  190  	return 0;
c9c9de93a33ccdb Xiangliang Yu 2017-03-10  191  }
c9c9de93a33ccdb Xiangliang Yu 2017-03-10  192  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7109874612290692251==--

