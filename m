Content-Type: multipart/mixed; boundary="===============3130055631240263173=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/perf/arm-cmn.c:1708:29: warning: dereference of NULL 'xp' [CWE-476]
Date: Tue, 14 Jun 2022 13:27:03 +0800
Message-ID: <202206141307.gwH2zJa4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3130055631240263173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/p=
erf/arm-cmn.c:1708:29: warning: dereference of NULL 'xp' [CWE-476] [-Wanaly=
zer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Robin Murphy <robin.murphy@arm.com>
CC: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: 8e504d93acb647c0db31ba13ba11b510bbab4174 perf/arm-cmn: Add CMN-650 =
support
date:   6 weeks ago
:::::: branch date: 30 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20220613 (https://download.01.org/0day-ci/archi=
ve/20220614/202206141307.gwH2zJa4-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8e504d93acb647c0db31ba13ba11b510bbab4174
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8e504d93acb647c0db31ba13ba11b510bbab4174
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/perf/arm-cmn.c: In function 'arm_cmn_pmu_offline_cpu':
   drivers/perf/arm-cmn.c:1569:23: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
    1569 |         if (cpu !=3D cmn->cpu)
         |                    ~~~^~~~~
     'arm_cmn_pmu_offline_cpu': event 1
       |
       |include/linux/list.h:993:57:
       |  993 |            ____ptr ? hlist_entry(____ptr, type, member) : N=
ULL; \
   drivers/perf/arm-cmn.c:1568:15: note: in expansion of macro 'hlist_entry=
_safe'
       | 1568 |         cmn =3D hlist_entry_safe(cpuhp_node, struct arm_cmn=
, cpuhp_node);
       |      |               ^~~~~~~~~~~~~~~~
       |
     'arm_cmn_pmu_offline_cpu': events 2-3
       |
       | 1569 |         if (cpu !=3D cmn->cpu)
       |      |                    ~~~^~~~~
       |      |                       |
       |      |                       (2) ...to here
       |      |                       (3) dereference of NULL '<unknown>'
       |
   drivers/perf/arm-cmn.c: In function 'arm_cmn_init_dtcs':
>> drivers/perf/arm-cmn.c:1708:29: warning: dereference of NULL 'xp' [CWE-4=
76] [-Wanalyzer-null-dereference]
    1708 |                 dn->dtm =3D xp->dtm;
         |                           ~~^~~~~
     'arm_cmn_init_dtcs': event 1
       |
       | 1687 | static int arm_cmn_init_dtcs(struct arm_cmn *cmn)
       |      |            ^~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'arm_cmn_init_dtcs'
       |
     'arm_cmn_init_dtcs': events 2-3
       |
       |include/linux/device.h:216:12:
       |  216 |         if (unlikely(check_mul_overflow(n, size, &bytes)))
       |      |            ^
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       |  219 |         return devm_kmalloc(dev, bytes, flags);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (3) ...to here
       |
     'arm_cmn_init_dtcs': events 4-11
       |
       |drivers/perf/arm-cmn.c:1694:12:
       | 1694 |         if (!cmn->dtc)
       |      |            ^
       |      |            |
       |      |            (4) following 'false' branch...
       |......
       | 1697 |         sort(cmn->dns, cmn->num_dns, sizeof(cmn->dns[0]), a=
rm_cmn_node_cmp, NULL);
       |      |              ~~~~~~~~
       |      |                 |
       |      |                 (5) ...to here
       | 1698 | =

       | 1699 |         cmn->xps =3D arm_cmn_node(cmn, CMN_TYPE_XP);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (6) '*cmn.xps' is NULL
       | 1700 | =

       | 1701 |         for (dn =3D cmn->dns; dn->type; dn++) {
       |      |                             ~~
       |      |                             |
       |      |                             (7) following 'true' branch...
       | 1702 |                 if (dn->type =3D=3D CMN_TYPE_XP) {
       |      |                    ~
       |      |                    |
       |      |                    (8) ...to here
       |      |                    (9) following 'false' branch...
       |......
       | 1707 |                 xp =3D arm_cmn_node_to_xp(cmn, dn);
       |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                      |
       |      |                      (10) ...to here
       |      |                      (11) calling 'arm_cmn_node_to_xp' from=
 'arm_cmn_init_dtcs'
       |
       +--> 'arm_cmn_node_to_xp': events 12-13
              |
              |  349 | static struct arm_cmn_node *arm_cmn_node_to_xp(const=
 struct arm_cmn *cmn,
              |      |                             ^~~~~~~~~~~~~~~~~~
              |      |                             |
              |      |                             (12) entry to 'arm_cmn_n=
ode_to_xp'
              |......
              |  352 |         struct arm_cmn_nodeid nid =3D arm_cmn_nid(cm=
n, dn->id);
              |      |                                     ~~~~~~~~~~~~~~~~=
~~~~~~~~
              |      |                                     |
              |      |                                     (13) calling 'ar=
m_cmn_nid' from 'arm_cmn_node_to_xp'
              |
              +--> 'arm_cmn_nid': events 14-15
                     |
                     |  324 | static struct arm_cmn_nodeid arm_cmn_nid(cons=
t struct arm_cmn *cmn, u16 id)
                     |      |                              ^~~~~~~~~~~
                     |      |                              |
                     |      |                              (14) entry to 'a=
rm_cmn_nid'
                     |......
                     |  328 |         if (cmn->num_xps =3D=3D 1) {
                     |      |            ~                  =

                     |      |            |
                     |      |            (15) following 'true' branch...
                     |
                   'arm_cmn_nid': event 16
                     |
                     |   31 | #define CMN_NODEID_1x1_PID(reg)         (((re=
g) >> 2) & 7)
                     |      |                                         ~~~~~=
~~~~~~~~~^~~~
                     |      |                                              =
         |
                     |      |                                              =
         (16) ...to here
   drivers/perf/arm-cmn.c:331:28: note: in expansion of macro 'CMN_NODEID_1=
x1_PID'
                     |  331 |                 nid.port =3D CMN_NODEID_1x1_P=
ID(id);
                     |      |                            ^~~~~~~~~~~~~~~~~~
                     |
              <------+
              |
            'arm_cmn_node_to_xp': events 17-19
              |
              |  352 |         struct arm_cmn_nodeid nid =3D arm_cmn_nid(cm=
n, dn->id);
              |      |                                     ^~~~~~~~~~~~~~~~=
~~~~~~~~
              |      |                                     |
              |      |                                     (17) returning t=
o 'arm_cmn_node_to_xp' from 'arm_cmn_nid'
              |......
              |  355 |         return cmn->xps + xp_idx;

vim +/xp +1708 drivers/perf/arm-cmn.c

0ba64770a2f2e5a Robin Murphy 2020-09-18  1686  =

0ba64770a2f2e5a Robin Murphy 2020-09-18  1687  static int arm_cmn_init_dtcs=
(struct arm_cmn *cmn)
0ba64770a2f2e5a Robin Murphy 2020-09-18  1688  {
0947c80aba23972 Robin Murphy 2021-12-03  1689  	struct arm_cmn_node *dn, *x=
p;
0ba64770a2f2e5a Robin Murphy 2020-09-18  1690  	int dtc_idx =3D 0;
4f2c3872dde5509 Robin Murphy 2021-12-03  1691  	u8 dtcs_present =3D (1 << c=
mn->num_dtcs) - 1;
0ba64770a2f2e5a Robin Murphy 2020-09-18  1692  =

0ba64770a2f2e5a Robin Murphy 2020-09-18  1693  	cmn->dtc =3D devm_kcalloc(c=
mn->dev, cmn->num_dtcs, sizeof(cmn->dtc[0]), GFP_KERNEL);
0ba64770a2f2e5a Robin Murphy 2020-09-18  1694  	if (!cmn->dtc)
0ba64770a2f2e5a Robin Murphy 2020-09-18  1695  		return -ENOMEM;
0ba64770a2f2e5a Robin Murphy 2020-09-18  1696  =

0ba64770a2f2e5a Robin Murphy 2020-09-18  1697  	sort(cmn->dns, cmn->num_dns=
, sizeof(cmn->dns[0]), arm_cmn_node_cmp, NULL);
0ba64770a2f2e5a Robin Murphy 2020-09-18  1698  =

0ba64770a2f2e5a Robin Murphy 2020-09-18  1699  	cmn->xps =3D arm_cmn_node(c=
mn, CMN_TYPE_XP);
0ba64770a2f2e5a Robin Murphy 2020-09-18  1700  =

da5f7d2c8019c9d Robin Murphy 2021-12-03  1701  	for (dn =3D cmn->dns; dn->t=
ype; dn++) {
0947c80aba23972 Robin Murphy 2021-12-03  1702  		if (dn->type =3D=3D CMN_TY=
PE_XP) {
4f2c3872dde5509 Robin Murphy 2021-12-03  1703  			dn->dtc &=3D dtcs_present;
0947c80aba23972 Robin Murphy 2021-12-03  1704  			continue;
0947c80aba23972 Robin Murphy 2021-12-03  1705  		}
0ba64770a2f2e5a Robin Murphy 2020-09-18  1706  =

0947c80aba23972 Robin Murphy 2021-12-03  1707  		xp =3D arm_cmn_node_to_xp(=
cmn, dn);
0947c80aba23972 Robin Murphy 2021-12-03 @1708  		dn->dtm =3D xp->dtm;
60d1504070c22c0 Robin Murphy 2021-12-03  1709  		if (cmn->multi_dtm)
60d1504070c22c0 Robin Murphy 2021-12-03  1710  			dn->dtm +=3D arm_cmn_nid(=
cmn, dn->id).port / 2;
0947c80aba23972 Robin Murphy 2021-12-03  1711  =

0947c80aba23972 Robin Murphy 2021-12-03  1712  		if (dn->type =3D=3D CMN_TY=
PE_DTC) {
0947c80aba23972 Robin Murphy 2021-12-03  1713  			int err;
0947c80aba23972 Robin Murphy 2021-12-03  1714  			/* We do at least know th=
at a DTC's XP must be in that DTC's domain */
4f2c3872dde5509 Robin Murphy 2021-12-03  1715  			if (xp->dtc =3D=3D 0xf)
4f2c3872dde5509 Robin Murphy 2021-12-03  1716  				xp->dtc =3D 1 << dtc_idx;
0947c80aba23972 Robin Murphy 2021-12-03  1717  			err =3D arm_cmn_init_dtc(=
cmn, dn, dtc_idx++);
0947c80aba23972 Robin Murphy 2021-12-03  1718  			if (err)
0947c80aba23972 Robin Murphy 2021-12-03  1719  				return err;
0947c80aba23972 Robin Murphy 2021-12-03  1720  		}
0ba64770a2f2e5a Robin Murphy 2020-09-18  1721  =

0ba64770a2f2e5a Robin Murphy 2020-09-18  1722  		/* To the PMU, RN-Ds don't=
 add anything over RN-Is, so smoosh them together */
0ba64770a2f2e5a Robin Murphy 2020-09-18  1723  		if (dn->type =3D=3D CMN_TY=
PE_RND)
0ba64770a2f2e5a Robin Murphy 2020-09-18  1724  			dn->type =3D CMN_TYPE_RNI;
0ba64770a2f2e5a Robin Murphy 2020-09-18  1725  	}
0ba64770a2f2e5a Robin Murphy 2020-09-18  1726  =

0ba64770a2f2e5a Robin Murphy 2020-09-18  1727  	writel_relaxed(CMN_DT_DTC_C=
TL_DT_EN, cmn->dtc[0].base + CMN_DT_DTC_CTL);
0ba64770a2f2e5a Robin Murphy 2020-09-18  1728  =

0ba64770a2f2e5a Robin Murphy 2020-09-18  1729  	return 0;
0ba64770a2f2e5a Robin Murphy 2020-09-18  1730  }
0ba64770a2f2e5a Robin Murphy 2020-09-18  1731  =


:::::: The code at line 1708 was first introduced by commit
:::::: 0947c80aba23972987a88e620812d17a7af27297 perf/arm-cmn: Refactor DTM =
handling

:::::: TO: Robin Murphy <robin.murphy@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3130055631240263173==--

