Content-Type: multipart/mixed; boundary="===============0948108388955322390=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/perf/arm_smmuv3_pmu.c:349:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 16 Mar 2022 21:44:17 +0800
Message-ID: <202203162129.qyCtDjXt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0948108388955322390==
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
head:   56e337f2cf1326323844927a04e9dbce9a244835
commit: e656972b69864348a747954ea187576808000c5a drivers/perf: Improve buil=
d test coverage
date:   5 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 months ago
config: riscv-randconfig-c006-20220313 (https://download.01.org/0day-ci/arc=
hive/20220316/202203162129.qyCtDjXt-lkp(a)intel.com/config)
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
   fs/xfs/xfs_sysfs.c:633:25: note: Passing value via 1st parameter 'kobj'
           error =3D xfs_sysfs_init(&mp->m_error_kobj, &xfs_error_ktype,
                                  ^~~~~~~~~~~~~~~~~
   fs/xfs/xfs_sysfs.c:633:10: note: Calling 'xfs_sysfs_init'
           error =3D xfs_sysfs_init(&mp->m_error_kobj, &xfs_error_ktype,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_sysfs.h:37:11: note: Assuming 'parent_kobj' is null
           parent =3D parent_kobj ? &parent_kobj->kobject : NULL;
                    ^~~~~~~~~~~
   fs/xfs/xfs_sysfs.h:37:11: note: '?' condition is false
   fs/xfs/xfs_sysfs.h:38:18: note: Passing value via 1st parameter 'x'
           init_completion(&kobj->complete);
                           ^~~~~~~~~~~~~~~
   fs/xfs/xfs_sysfs.h:38:2: note: Calling 'init_completion'
           init_completion(&kobj->complete);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/completion.h:86:10: note: Access to field 'done' results i=
n a dereference of a null pointer (loaded from variable 'x')
           x->done =3D 0;
           ~       ^
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   crypto/pcbc.c:74:10: warning: Although the value stored to 'nbytes' is u=
sed in the enclosing expression, the value is never actually read from 'nby=
tes' [clang-analyzer-deadcode.DeadStores]
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   crypto/pcbc.c:74:10: note: Although the value stored to 'nbytes' is used=
 in the enclosing expression, the value is never actually read from 'nbytes'
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   crypto/pcbc.c:141:10: warning: Although the value stored to 'nbytes' is =
used in the enclosing expression, the value is never actually read from 'nb=
ytes' [clang-analyzer-deadcode.DeadStores]
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   crypto/pcbc.c:141:10: note: Although the value stored to 'nbytes' is use=
d in the enclosing expression, the value is never actually read from 'nbyte=
s'
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   10 warnings generated.
   fs/xfs/xfs_pnfs.c:39:3: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                   error =3D break_layout(inode, true);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_pnfs.c:39:3: note: Value stored to 'error' is never read
                   error =3D break_layout(inode, true);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
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
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/fpga/altera-pr-ip-core.c:188:2: warning: Value stored to 'val' i=
s never read [clang-analyzer-deadcode.DeadStores]
           val =3D readl(priv->reg_base + ALT_PR_CSR_OFST);
           ^
   drivers/fpga/altera-pr-ip-core.c:188:2: note: Value stored to 'val' is n=
ever read
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/staging/rts5208/ms.c:1770:3: warning: Value stored to 'retval' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   retval =3D ms_set_rw_reg_addr(chip, OVERWRITE_FLAG, MS_E=
XTRA_SIZE,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/staging/rts5208/ms.c:1770:3: note: Value stored to 'retval' is n=
ever read
                   retval =3D ms_set_rw_reg_addr(chip, OVERWRITE_FLAG, MS_E=
XTRA_SIZE,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
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
   11 warnings generated.
   drivers/staging/iio/adc/ad7280a.c:130:8: warning: Excessive padding in '=
struct ad7280_state' (110 padding bytes, where 46 is optimal). =

   Optimal fields order: =

   buf, =

   spi, =

   channels, =

   iio_attr, =

   lock, =

   slave_num, =

   scan_cnt, =

   readback_delay_us, =

   ctrl_hb, =

   ctrl_lb, =

   cell_threshhigh, =

   cell_threshlow, =

   aux_threshhigh, =

   aux_threshlow, =

   cb_mask, =

   crc_tab, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7280_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/staging/iio/adc/ad7280a.c:130:8: note: Excessive padding in 'str=
uct ad7280_state' (110 padding bytes, where 46 is optimal). Optimal fields =
order: buf, spi, channels, iio_attr, lock, slave_num, scan_cnt, readback_de=
lay_us, ctrl_hb, ctrl_lb, cell_threshhigh, cell_threshlow, aux_threshhigh, =
aux_threshlow, cb_mask, crc_tab, consider reordering the fields or adding e=
xplicit padding members
   struct ad7280_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/staging/iio/addac/adt7316.c:1888:2: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D chip->bus.write(chip->bus.client, ADT7316_INT_MASK1, mas=
k);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/addac/adt7316.c:1888:2: note: Value stored to 'ret' =
is never read
           ret =3D chip->bus.write(chip->bus.client, ADT7316_INT_MASK1, mas=
k);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.

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
--===============0948108388955322390==--

