Content-Type: multipart/mixed; boundary="===============2711537796290870753=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/perf/arm-cmn.c:1513:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 11 Sep 2022 10:17:57 +0800
Message-ID: <202209111001.MecQsjvO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2711537796290870753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/p=
erf/arm-cmn.c:1513:13: warning: use of uninitialized value '<unknown>' [CWE=
-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Robin Murphy <robin.murphy@arm.com>
CC: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b96fbd602d35739b5cdb49baa02048f2c41fdab1
commit: 82d8ea4b450074e81748830929bbd94eebbaffea perf/arm-cmn: Drop compile=
-test restriction
date:   9 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220906 (https://download.01.org/0day-ci/archi=
ve/20220911/202209111001.MecQsjvO-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D82d8ea4b450074e81748830929bbd94eebbaffea
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 82d8ea4b450074e81748830929bbd94eebbaffea
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/perf/arm-cmn.c: In function 'arm_cmn_pmu_offline_cpu':
   drivers/perf/arm-cmn.c:1181:23: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
    1181 |         if (cpu !=3D cmn->cpu)
         |                    ~~~^~~~~
     'arm_cmn_pmu_offline_cpu': event 1
       |
       |include/linux/list.h:985:57:
       |  985 |            ____ptr ? hlist_entry(____ptr, type, member) : N=
ULL; \
   drivers/perf/arm-cmn.c:1180:15: note: in expansion of macro 'hlist_entry=
_safe'
       | 1180 |         cmn =3D hlist_entry_safe(cpuhp_node, struct arm_cmn=
, cpuhp_node);
       |      |               ^~~~~~~~~~~~~~~~
       |
     'arm_cmn_pmu_offline_cpu': events 2-3
       |
       | 1181 |         if (cpu !=3D cmn->cpu)
       |      |                    ~~~^~~~~
       |      |                       |
       |      |                       (2) ...to here
       |      |                       (3) dereference of NULL '<unknown>'
       |
   drivers/perf/arm-cmn.c: In function 'arm_cmn_of_probe':
>> drivers/perf/arm-cmn.c:1513:13: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1513 |         u32 rootnode;
         |             ^~~~~~~~
     'arm_cmn_of_probe': event 1
       |
       | 1513 |         u32 rootnode;
       |      |             ^~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +1513 drivers/perf/arm-cmn.c

0ba64770a2f2e5a Robin Murphy 2020-09-18  1509  =

0ba64770a2f2e5a Robin Murphy 2020-09-18  1510  static int arm_cmn_of_probe(=
struct platform_device *pdev, struct arm_cmn *cmn)
0ba64770a2f2e5a Robin Murphy 2020-09-18  1511  {
0ba64770a2f2e5a Robin Murphy 2020-09-18  1512  	struct device_node *np =3D =
pdev->dev.of_node;
0ba64770a2f2e5a Robin Murphy 2020-09-18 @1513  	u32 rootnode;
0ba64770a2f2e5a Robin Murphy 2020-09-18  1514  	int ret;
0ba64770a2f2e5a Robin Murphy 2020-09-18  1515  =

0ba64770a2f2e5a Robin Murphy 2020-09-18  1516  	cmn->base =3D devm_platform=
_ioremap_resource(pdev, 0);
0ba64770a2f2e5a Robin Murphy 2020-09-18  1517  	if (IS_ERR(cmn->base))
0ba64770a2f2e5a Robin Murphy 2020-09-18  1518  		return PTR_ERR(cmn->base);
0ba64770a2f2e5a Robin Murphy 2020-09-18  1519  =

0ba64770a2f2e5a Robin Murphy 2020-09-18  1520  	ret =3D of_property_read_u3=
2(np, "arm,root-node", &rootnode);
0ba64770a2f2e5a Robin Murphy 2020-09-18  1521  	if (ret)
0ba64770a2f2e5a Robin Murphy 2020-09-18  1522  		return ret;
0ba64770a2f2e5a Robin Murphy 2020-09-18  1523  =

0ba64770a2f2e5a Robin Murphy 2020-09-18  1524  	return rootnode;
0ba64770a2f2e5a Robin Murphy 2020-09-18  1525  }
0ba64770a2f2e5a Robin Murphy 2020-09-18  1526  =


:::::: The code at line 1513 was first introduced by commit
:::::: 0ba64770a2f2e5a104bf835e133d78d3f82287ad perf: Add Arm CMN-600 PMU d=
river

:::::: TO: Robin Murphy <robin.murphy@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2711537796290870753==--

