Content-Type: multipart/mixed; boundary="===============5752627858101558982=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/perf/arm_smmuv3_pmu.c:349:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 21 Mar 2022 02:14:24 +0800
Message-ID: <202203210246.W8OFaWHR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5752627858101558982==
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
head:   14702b3b2438e2f2d07ae93b5d695c166e5c83d1
commit: e656972b69864348a747954ea187576808000c5a drivers/perf: Improve buil=
d test coverage
date:   6 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-c006-20220313 (https://download.01.org/0day-ci/arc=
hive/20220321/202203210246.W8OFaWHR-lkp(a)intel.com/config)
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
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:179:2: note: Taking true branch
           if (value & ~XSCOM_DATA_IND_FORM1_DATA)
           ^
   drivers/fsi/fsi-scom.c:180:3: note: Returning without writing to '*statu=
s'
                   return -EINVAL;
                   ^
   drivers/fsi/fsi-scom.c:221:11: note: Returning from 'put_indirect_scom_f=
orm1'
                           return put_indirect_scom_form1(scom, value, addr=
, status);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/fsi/fsi-scom.c:221:4: note: Returning without writing to '*statu=
s'
                           return put_indirect_scom_form1(scom, value, addr=
, status);
                           ^
   drivers/fsi/fsi-scom.c:291:7: note: Returning from 'raw_put_scom'
           rc =3D raw_put_scom(scom, value, addr, &status);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:292:2: note: Taking false branch
           if (rc =3D=3D -ENODEV)
           ^
   drivers/fsi/fsi-scom.c:295:7: note: 2nd function call argument is an uni=
nitialized value
           rc =3D handle_fsi2pib_status(scom, status);
                ^                           ~~~~~~
   drivers/fsi/fsi-scom.c:314:7: warning: 2nd function call argument is an =
uninitialized value [clang-analyzer-core.CallAndMessage]
           rc =3D handle_fsi2pib_status(scom, status);
                ^
   drivers/fsi/fsi-scom.c:331:6: note: Assuming the condition is false
           if (len !=3D sizeof(uint64_t))
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:331:2: note: Taking false branch
           if (len !=3D sizeof(uint64_t))
           ^
   drivers/fsi/fsi-scom.c:335:6: note: Assuming field 'dead' is false
           if (scom->dead)
               ^~~~~~~~~~
   drivers/fsi/fsi-scom.c:335:2: note: Taking false branch
           if (scom->dead)
           ^
   drivers/fsi/fsi-scom.c:338:8: note: Calling 'get_scom'
                   rc =3D get_scom(scom, &val, *offset);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:307:2: note: 'status' declared without an initial=
 value
           uint32_t status;
           ^~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:310:7: note: Calling 'raw_get_scom'
           rc =3D raw_get_scom(scom, value, addr, &status);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:231:6: note: Assuming the condition is true
           if (addr & XSCOM_ADDR_IND_FLAG) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:231:2: note: Taking true branch
           if (addr & XSCOM_ADDR_IND_FLAG) {
           ^
   drivers/fsi/fsi-scom.c:232:7: note: Assuming the condition is true
                   if (addr & XSCOM_ADDR_INF_FORM1)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:232:3: note: Taking true branch
                   if (addr & XSCOM_ADDR_INF_FORM1)
                   ^
   drivers/fsi/fsi-scom.c:233:4: note: Returning without writing to '*statu=
s'
                           return -ENXIO;
                           ^
   drivers/fsi/fsi-scom.c:310:7: note: Returning from 'raw_get_scom'
           rc =3D raw_get_scom(scom, value, addr, &status);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:311:2: note: Taking false branch
           if (rc =3D=3D -ENODEV)
           ^
   drivers/fsi/fsi-scom.c:314:7: note: 2nd function call argument is an uni=
nitialized value
           rc =3D handle_fsi2pib_status(scom, status);
                ^                           ~~~~~~
   drivers/fsi/fsi-scom.c:327:17: warning: Value stored to 'dev' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &scom->fsi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:327:17: note: Value stored to 'dev' during its in=
itialization is never read
           struct device *dev =3D &scom->fsi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:357:17: warning: Value stored to 'dev' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &scom->fsi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:357:17: note: Value stored to 'dev' during its in=
itialization is never read
           struct device *dev =3D &scom->fsi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
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
   28 warnings generated.
   drivers/md/bcache/sysfs.c:204:2: warning: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           sysfs_hprint(writeback_rate,
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:204:2: note: Call to function 'strcat' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcat'. CWE-119
           sysfs_hprint(writeback_rate,
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:255:2: warning: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           sysfs_hprint(dirty_data,
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:255:2: note: Call to function 'strcat' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcat'. CWE-119
           sysfs_hprint(dirty_data,
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:258:2: warning: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           sysfs_hprint(stripe_size,        ((uint64_t)dc->disk.stripe_size=
) << 9);
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:258:2: note: Call to function 'strcat' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcat'. CWE-119
           sysfs_hprint(stripe_size,        ((uint64_t)dc->disk.stripe_size=
) << 9);
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:261:2: warning: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           var_hprint(sequential_cutoff);
           ^
   drivers/md/bcache/sysfs.h:74:26: note: expanded from macro 'var_hprint'
   #define var_hprint(_var)        sysfs_hprint(_var, var(_var))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:261:2: note: Call to function 'strcat' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcat'. CWE-119
           var_hprint(sequential_cutoff);
           ^
   drivers/md/bcache/sysfs.h:74:26: note: expanded from macro 'var_hprint'
   #define var_hprint(_var)        sysfs_hprint(_var, var(_var))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:269:3: warning: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "\n");
                   ^~~~~~
   drivers/md/bcache/sysfs.c:269:3: note: Call to function 'strcat' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcat'. CWE-119
                   strcat(buf, "\n");
                   ^~~~~~
   drivers/md/bcache/sysfs.c:275:3: warning: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]

vim +/dev +349 drivers/perf/arm_smmuv3_pmu.c

3c9347351a6ea1 Robin Murphy 2019-08-01  339  =

7d839b4b9e0064 Neil Leeder  2019-03-26  340  /*
7d839b4b9e0064 Neil Leeder  2019-03-26  341   * Implementation of abstract =
pmu functionality required by
7d839b4b9e0064 Neil Leeder  2019-03-26  342   * the core perf events code.
7d839b4b9e0064 Neil Leeder  2019-03-26  343   */
7d839b4b9e0064 Neil Leeder  2019-03-26  344  =

7d839b4b9e0064 Neil Leeder  2019-03-26  345  static int smmu_pmu_event_init=
(struct perf_event *event)
7d839b4b9e0064 Neil Leeder  2019-03-26  346  {
7d839b4b9e0064 Neil Leeder  2019-03-26  347  	struct hw_perf_event *hwc =3D=
 &event->hw;
7d839b4b9e0064 Neil Leeder  2019-03-26  348  	struct smmu_pmu *smmu_pmu =3D=
 to_smmu_pmu(event->pmu);
7d839b4b9e0064 Neil Leeder  2019-03-26 @349  	struct device *dev =3D smmu_p=
mu->dev;
7d839b4b9e0064 Neil Leeder  2019-03-26  350  	struct perf_event *sibling;
33e84ea4330da8 Robin Murphy 2019-08-01  351  	int group_num_events =3D 1;
7d839b4b9e0064 Neil Leeder  2019-03-26  352  	u16 event_id;
7d839b4b9e0064 Neil Leeder  2019-03-26  353  =

7d839b4b9e0064 Neil Leeder  2019-03-26  354  	if (event->attr.type !=3D eve=
nt->pmu->type)
7d839b4b9e0064 Neil Leeder  2019-03-26  355  		return -ENOENT;
7d839b4b9e0064 Neil Leeder  2019-03-26  356  =

7d839b4b9e0064 Neil Leeder  2019-03-26  357  	if (hwc->sample_period) {
7d839b4b9e0064 Neil Leeder  2019-03-26  358  		dev_dbg(dev, "Sampling not s=
upported\n");
7d839b4b9e0064 Neil Leeder  2019-03-26  359  		return -EOPNOTSUPP;
7d839b4b9e0064 Neil Leeder  2019-03-26  360  	}
7d839b4b9e0064 Neil Leeder  2019-03-26  361  =

7d839b4b9e0064 Neil Leeder  2019-03-26  362  	if (event->cpu < 0) {
7d839b4b9e0064 Neil Leeder  2019-03-26  363  		dev_dbg(dev, "Per-task mode =
not supported\n");
7d839b4b9e0064 Neil Leeder  2019-03-26  364  		return -EOPNOTSUPP;
7d839b4b9e0064 Neil Leeder  2019-03-26  365  	}
7d839b4b9e0064 Neil Leeder  2019-03-26  366  =

7d839b4b9e0064 Neil Leeder  2019-03-26  367  	/* Verify specified event is =
supported on this PMU */
7d839b4b9e0064 Neil Leeder  2019-03-26  368  	event_id =3D get_event(event);
7d839b4b9e0064 Neil Leeder  2019-03-26  369  	if (event_id < SMMU_PMCG_ARCH=
_MAX_EVENTS &&
7d839b4b9e0064 Neil Leeder  2019-03-26  370  	    (!test_bit(event_id, smmu=
_pmu->supported_events))) {
7d839b4b9e0064 Neil Leeder  2019-03-26  371  		dev_dbg(dev, "Invalid event =
%d for this PMU\n", event_id);
7d839b4b9e0064 Neil Leeder  2019-03-26  372  		return -EINVAL;
7d839b4b9e0064 Neil Leeder  2019-03-26  373  	}
7d839b4b9e0064 Neil Leeder  2019-03-26  374  =

7d839b4b9e0064 Neil Leeder  2019-03-26  375  	/* Don't allow groups with mi=
xed PMUs, except for s/w events */
33e84ea4330da8 Robin Murphy 2019-08-01  376  	if (!is_software_event(event-=
>group_leader)) {
3c9347351a6ea1 Robin Murphy 2019-08-01  377  		if (!smmu_pmu_events_compati=
ble(event->group_leader, event))
33e84ea4330da8 Robin Murphy 2019-08-01  378  			return -EINVAL;
33e84ea4330da8 Robin Murphy 2019-08-01  379  =

33e84ea4330da8 Robin Murphy 2019-08-01  380  		if (++group_num_events > smm=
u_pmu->num_counters)
7d839b4b9e0064 Neil Leeder  2019-03-26  381  			return -EINVAL;
7d839b4b9e0064 Neil Leeder  2019-03-26  382  	}
7d839b4b9e0064 Neil Leeder  2019-03-26  383  =

7d839b4b9e0064 Neil Leeder  2019-03-26  384  	for_each_sibling_event(siblin=
g, event->group_leader) {
33e84ea4330da8 Robin Murphy 2019-08-01  385  		if (is_software_event(siblin=
g))
33e84ea4330da8 Robin Murphy 2019-08-01  386  			continue;
33e84ea4330da8 Robin Murphy 2019-08-01  387  =

3c9347351a6ea1 Robin Murphy 2019-08-01  388  		if (!smmu_pmu_events_compati=
ble(sibling, event))
33e84ea4330da8 Robin Murphy 2019-08-01  389  			return -EINVAL;
33e84ea4330da8 Robin Murphy 2019-08-01  390  =

33e84ea4330da8 Robin Murphy 2019-08-01  391  		if (++group_num_events > smm=
u_pmu->num_counters)
7d839b4b9e0064 Neil Leeder  2019-03-26  392  			return -EINVAL;
7d839b4b9e0064 Neil Leeder  2019-03-26  393  	}
7d839b4b9e0064 Neil Leeder  2019-03-26  394  =

7d839b4b9e0064 Neil Leeder  2019-03-26  395  	hwc->idx =3D -1;
7d839b4b9e0064 Neil Leeder  2019-03-26  396  =

7d839b4b9e0064 Neil Leeder  2019-03-26  397  	/*
7d839b4b9e0064 Neil Leeder  2019-03-26  398  	 * Ensure all events are on t=
he same cpu so all events are in the
7d839b4b9e0064 Neil Leeder  2019-03-26  399  	 * same cpu context, to avoid=
 races on pmu_enable etc.
7d839b4b9e0064 Neil Leeder  2019-03-26  400  	 */
7d839b4b9e0064 Neil Leeder  2019-03-26  401  	event->cpu =3D smmu_pmu->on_c=
pu;
7d839b4b9e0064 Neil Leeder  2019-03-26  402  =

7d839b4b9e0064 Neil Leeder  2019-03-26  403  	return 0;
7d839b4b9e0064 Neil Leeder  2019-03-26  404  }
7d839b4b9e0064 Neil Leeder  2019-03-26  405  =


:::::: The code at line 349 was first introduced by commit
:::::: 7d839b4b9e00645e49345d6ce5dfa8edf53c1a21 perf/smmuv3: Add arm64 smmu=
v3 pmu driver

:::::: TO: Neil Leeder <nleeder@codeaurora.org>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5752627858101558982==--

