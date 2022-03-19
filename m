Content-Type: multipart/mixed; boundary="===============0947638501107168233=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/perf/arm_smmuv3_pmu.c:349:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 19 Mar 2022 09:04:34 +0800
Message-ID: <202203190951.JIEz5n06-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0947638501107168233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: John Garry <john.garry@huawei.com>
CC: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   34e047aa16c0123bbae8e2f6df33e5ecc1f56601
commit: e656972b69864348a747954ea187576808000c5a drivers/perf: Improve buil=
d test coverage
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-c006-20220313 (https://download.01.org/0day-ci/arc=
hive/20220319/202203190951.JIEz5n06-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 43f668=
b98e8d87290fc6bbf5ed13c3ab542e3497)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De656972b69864348a747954ea187576808000c5a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e656972b69864348a747954ea187576808000c5a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:2: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
           ^
   fs/xfs/libxfs/xfs_dir2_node.c:824:2: note: Loop condition is true.  Ente=
ring loop body
           for (lep =3D &leafhdr.ents[index];
           ^
   fs/xfs/libxfs/xfs_dir2_node.c:830:7: note: '?' condition is false
                   if (be32_to_cpu(lep->address) =3D=3D XFS_DIR2_NULL_DATAP=
TR)
                       ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   fs/xfs/libxfs/xfs_dir2_node.c:830:7: note: Assuming the condition is fal=
se
                   if (be32_to_cpu(lep->address) =3D=3D XFS_DIR2_NULL_DATAP=
TR)
                       ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:2: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
           ^
   fs/xfs/libxfs/xfs_dir2_node.c:830:3: note: Taking false branch
                   if (be32_to_cpu(lep->address) =3D=3D XFS_DIR2_NULL_DATAP=
TR)
                   ^
   fs/xfs/libxfs/xfs_dir2_node.c:836:13: note: '?' condition is false
                                                  be32_to_cpu(lep->address)=
);
                                                  ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   fs/xfs/libxfs/xfs_dir2_node.c:843:7: note: Assuming 'newdb' is equal to =
'curdb'
                   if (newdb !=3D curdb) {
                       ^~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:843:3: note: Taking false branch
                   if (newdb !=3D curdb) {
                   ^
   fs/xfs/libxfs/xfs_dir2_node.c:873:43: note: Access to field 'b_addr' res=
ults in a dereference of a null pointer (loaded from variable 'curbp')
                   dep =3D (xfs_dir2_data_entry_t *)((char *)curbp->b_addr +
                                                           ^~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:1510:2: warning: Value stored to 'ents' is=
 never read [clang-analyzer-deadcode.DeadStores]
           ents =3D leafhdr.ents;
           ^      ~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:1510:2: note: Value stored to 'ents' is ne=
ver read
           ents =3D leafhdr.ents;
           ^      ~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:1572:3: warning: Value stored to 'ents' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   ents =3D hdr2.ents;
                   ^      ~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:1572:3: note: Value stored to 'ents' is ne=
ver read
                   ents =3D hdr2.ents;
                   ^      ~~~~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/perf/arm_smmuv3_pmu.c:349:17: warning: Value stored to 'dev' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D smmu_pmu->dev;
                          ^~~   ~~~~~~~~~~~~~
   drivers/perf/arm_smmuv3_pmu.c:349:17: note: Value stored to 'dev' during=
 its initialization is never read
           struct device *dev =3D smmu_pmu->dev;
                          ^~~   ~~~~~~~~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/hwtracing/intel_th/msu.c:860:2: warning: Value stored to 'reg' i=
s never read [clang-analyzer-deadcode.DeadStores]
           reg =3D ioread32(msc->reg_base + REG_MSU_MSC0STS);
           ^
   drivers/hwtracing/intel_th/msu.c:860:2: note: Value stored to 'reg' is n=
ever read
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   include/linux/hid.h:1007:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-chicony.c:63:6: note: Assuming the condition is false
           if ((usage->hid & HID_USAGE_PAGE) !=3D HID_UP_MSVENDOR)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-chicony.c:63:2: note: Taking false branch
           if ((usage->hid & HID_USAGE_PAGE) !=3D HID_UP_MSVENDOR)
           ^
   drivers/hid/hid-chicony.c:67:2: note: Control jumps to 'case 65291:'  at=
 line 78
           switch (usage->hid & HID_USAGE) {
           ^
   drivers/hid/hid-chicony.c:78:15: note: Calling 'hid_map_usage_clear'
           case 0xff0b: ch_map_key_clear(BTN_B);   break;
                        ^
   drivers/hid/hid-chicony.c:57:29: note: expanded from macro 'ch_map_key_c=
lear'
   #define ch_map_key_clear(c)     hid_map_usage_clear(hi, usage, bit, max,=
 \
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/hid.h:1035:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:982:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:986:2: note: Control jumps to 'case 1:'  at line 995
           switch (type) {
           ^
   include/linux/hid.h:998:3: note:  Execution continues on line 1005
                   break;
                   ^
   include/linux/hid.h:1005:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1005:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:1006:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:639:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1006:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:639:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:1006:3: note: Loop condition is false.  Exiting loop

vim +/dev +349 drivers/perf/arm_smmuv3_pmu.c

3c9347351a6ea12 Robin Murphy 2019-08-01  339  =

7d839b4b9e00645 Neil Leeder  2019-03-26  340  /*
7d839b4b9e00645 Neil Leeder  2019-03-26  341   * Implementation of abstract=
 pmu functionality required by
7d839b4b9e00645 Neil Leeder  2019-03-26  342   * the core perf events code.
7d839b4b9e00645 Neil Leeder  2019-03-26  343   */
7d839b4b9e00645 Neil Leeder  2019-03-26  344  =

7d839b4b9e00645 Neil Leeder  2019-03-26  345  static int smmu_pmu_event_ini=
t(struct perf_event *event)
7d839b4b9e00645 Neil Leeder  2019-03-26  346  {
7d839b4b9e00645 Neil Leeder  2019-03-26  347  	struct hw_perf_event *hwc =
=3D &event->hw;
7d839b4b9e00645 Neil Leeder  2019-03-26  348  	struct smmu_pmu *smmu_pmu =
=3D to_smmu_pmu(event->pmu);
7d839b4b9e00645 Neil Leeder  2019-03-26 @349  	struct device *dev =3D smmu_=
pmu->dev;
7d839b4b9e00645 Neil Leeder  2019-03-26  350  	struct perf_event *sibling;
33e84ea4330da8a Robin Murphy 2019-08-01  351  	int group_num_events =3D 1;
7d839b4b9e00645 Neil Leeder  2019-03-26  352  	u16 event_id;
7d839b4b9e00645 Neil Leeder  2019-03-26  353  =

7d839b4b9e00645 Neil Leeder  2019-03-26  354  	if (event->attr.type !=3D ev=
ent->pmu->type)
7d839b4b9e00645 Neil Leeder  2019-03-26  355  		return -ENOENT;
7d839b4b9e00645 Neil Leeder  2019-03-26  356  =

7d839b4b9e00645 Neil Leeder  2019-03-26  357  	if (hwc->sample_period) {
7d839b4b9e00645 Neil Leeder  2019-03-26  358  		dev_dbg(dev, "Sampling not =
supported\n");
7d839b4b9e00645 Neil Leeder  2019-03-26  359  		return -EOPNOTSUPP;
7d839b4b9e00645 Neil Leeder  2019-03-26  360  	}
7d839b4b9e00645 Neil Leeder  2019-03-26  361  =

7d839b4b9e00645 Neil Leeder  2019-03-26  362  	if (event->cpu < 0) {
7d839b4b9e00645 Neil Leeder  2019-03-26  363  		dev_dbg(dev, "Per-task mode=
 not supported\n");
7d839b4b9e00645 Neil Leeder  2019-03-26  364  		return -EOPNOTSUPP;
7d839b4b9e00645 Neil Leeder  2019-03-26  365  	}
7d839b4b9e00645 Neil Leeder  2019-03-26  366  =

7d839b4b9e00645 Neil Leeder  2019-03-26  367  	/* Verify specified event is=
 supported on this PMU */
7d839b4b9e00645 Neil Leeder  2019-03-26  368  	event_id =3D get_event(event=
);
7d839b4b9e00645 Neil Leeder  2019-03-26  369  	if (event_id < SMMU_PMCG_ARC=
H_MAX_EVENTS &&
7d839b4b9e00645 Neil Leeder  2019-03-26  370  	    (!test_bit(event_id, smm=
u_pmu->supported_events))) {
7d839b4b9e00645 Neil Leeder  2019-03-26  371  		dev_dbg(dev, "Invalid event=
 %d for this PMU\n", event_id);
7d839b4b9e00645 Neil Leeder  2019-03-26  372  		return -EINVAL;
7d839b4b9e00645 Neil Leeder  2019-03-26  373  	}
7d839b4b9e00645 Neil Leeder  2019-03-26  374  =

7d839b4b9e00645 Neil Leeder  2019-03-26  375  	/* Don't allow groups with m=
ixed PMUs, except for s/w events */
33e84ea4330da8a Robin Murphy 2019-08-01  376  	if (!is_software_event(event=
->group_leader)) {
3c9347351a6ea12 Robin Murphy 2019-08-01  377  		if (!smmu_pmu_events_compat=
ible(event->group_leader, event))
33e84ea4330da8a Robin Murphy 2019-08-01  378  			return -EINVAL;
33e84ea4330da8a Robin Murphy 2019-08-01  379  =

33e84ea4330da8a Robin Murphy 2019-08-01  380  		if (++group_num_events > sm=
mu_pmu->num_counters)
7d839b4b9e00645 Neil Leeder  2019-03-26  381  			return -EINVAL;
7d839b4b9e00645 Neil Leeder  2019-03-26  382  	}
7d839b4b9e00645 Neil Leeder  2019-03-26  383  =

7d839b4b9e00645 Neil Leeder  2019-03-26  384  	for_each_sibling_event(sibli=
ng, event->group_leader) {
33e84ea4330da8a Robin Murphy 2019-08-01  385  		if (is_software_event(sibli=
ng))
33e84ea4330da8a Robin Murphy 2019-08-01  386  			continue;
33e84ea4330da8a Robin Murphy 2019-08-01  387  =

3c9347351a6ea12 Robin Murphy 2019-08-01  388  		if (!smmu_pmu_events_compat=
ible(sibling, event))
33e84ea4330da8a Robin Murphy 2019-08-01  389  			return -EINVAL;
33e84ea4330da8a Robin Murphy 2019-08-01  390  =

33e84ea4330da8a Robin Murphy 2019-08-01  391  		if (++group_num_events > sm=
mu_pmu->num_counters)
7d839b4b9e00645 Neil Leeder  2019-03-26  392  			return -EINVAL;
7d839b4b9e00645 Neil Leeder  2019-03-26  393  	}
7d839b4b9e00645 Neil Leeder  2019-03-26  394  =

7d839b4b9e00645 Neil Leeder  2019-03-26  395  	hwc->idx =3D -1;
7d839b4b9e00645 Neil Leeder  2019-03-26  396  =

7d839b4b9e00645 Neil Leeder  2019-03-26  397  	/*
7d839b4b9e00645 Neil Leeder  2019-03-26  398  	 * Ensure all events are on =
the same cpu so all events are in the
7d839b4b9e00645 Neil Leeder  2019-03-26  399  	 * same cpu context, to avoi=
d races on pmu_enable etc.
7d839b4b9e00645 Neil Leeder  2019-03-26  400  	 */
7d839b4b9e00645 Neil Leeder  2019-03-26  401  	event->cpu =3D smmu_pmu->on_=
cpu;
7d839b4b9e00645 Neil Leeder  2019-03-26  402  =

7d839b4b9e00645 Neil Leeder  2019-03-26  403  	return 0;
7d839b4b9e00645 Neil Leeder  2019-03-26  404  }
7d839b4b9e00645 Neil Leeder  2019-03-26  405  =


:::::: The code at line 349 was first introduced by commit
:::::: 7d839b4b9e00645e49345d6ce5dfa8edf53c1a21 perf/smmuv3: Add arm64 smmu=
v3 pmu driver

:::::: TO: Neil Leeder <nleeder@codeaurora.org>
:::::: CC: Will Deacon <will.deacon@arm.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0947638501107168233==--

