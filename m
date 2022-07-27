Content-Type: multipart/mixed; boundary="===============2321465759976470159=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6934/13276] drivers/iommu/arm/arm-smmu/arm-smmu.c:2099:36: warning: use of uninitialized value '*(struct iommu_iort_rmr_data *)e.num_sids' [CWE-457]
Date: Thu, 28 Jul 2022 03:10:37 +0800
Message-ID: <202207280355.JrmUOolc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2321465759976470159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/i=
ommu/arm/arm-smmu/arm-smmu.c:2099:36: warning: use of uninitialized value '=
*(struct iommu_iort_rmr_data *)e.num_sids' [CWE-457] [-Wanalyzer-use-of-uni=
nitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jon Nettleton <jon@solid-run.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: Steven Price <steven.price@arm.com>
CC: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   9250d2f72dc46a808b6aa23bf50dd670f1f52ddc
commit: 0bec05574d13ed7e8643733fe5dccbd0c86604d2 [6934/13276] iommu/arm-smm=
u: Get associated RMR info and install bypass SMR
:::::: branch date: 7 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220724 (https://download.01.org/0day-ci/archi=
ve/20220728/202207280355.JrmUOolc-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D0bec05574d13ed7e8643733fe5dccbd0c86604d2
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0bec05574d13ed7e8643733fe5dccbd0c86604d2
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
     'arm_smmu_probe_finalize': events 2-3
       |
       |drivers/iommu/arm/arm-smmu/arm-smmu.c:1464:14:
       | 1464 |         smmu =3D cfg->smmu;
       |      |         ~~~~~^~~~~~~~~~~
       |      |              |
       |      |              (2) ...to here
       |      |              (3) dereference of NULL '<unknown>'
       |
   drivers/iommu/arm/arm-smmu/arm-smmu.c: In function 'arm_smmu_device_grou=
p':
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1474:33: warning: dereference of N=
ULL '0' [CWE-476] [-Wanalyzer-null-dereference]
    1474 |         struct arm_smmu_device *smmu =3D cfg->smmu;
         |                                 ^~~~
     'arm_smmu_device_group': events 1-3
       |
       |include/linux/iommu.h:659:12:
       |  645 |         if (dev->iommu)
       |      |            ~
       |      |            |
       |      |            (2) ...to here
       |      |            (3) following 'false' branch...
       |......
       |  659 |         if (dev->iommu)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |
     'arm_smmu_device_group': events 4-5
       |
       |drivers/iommu/arm/arm-smmu/arm-smmu.c:1474:33:
       | 1474 |         struct arm_smmu_device *smmu =3D cfg->smmu;
       |      |                                 ^~~~
       |      |                                 |
       |      |                                 (4) ...to here
       |      |                                 (5) dereference of NULL '<u=
nknown>'
       |
   In file included from drivers/iommu/arm/arm-smmu/arm-smmu.c:43:
   drivers/iommu/arm/arm-smmu/arm-smmu.h:449:17: warning: dereference of NU=
LL '0' [CWE-476] [-Wanalyzer-null-dereference]
     449 |         (i >=3D fw->num_ids ? INVALID_SMENDX : cfg->smendx[i])
   drivers/iommu/arm/arm-smmu/arm-smmu.h:451:27: note: in expansion of macr=
o 'cfg_smendx'
     451 |         for (i =3D 0; idx =3D cfg_smendx(cfg, fw, i), i < fw->nu=
m_ids; ++i)
         |                           ^~~~~~~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1479:9: note: in expansion of macr=
o 'for_each_cfg_sme'
    1479 |         for_each_cfg_sme(cfg, fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
     'arm_smmu_device_group': events 1-3
       |
       |include/linux/iommu.h:659:12:
       |  645 |         if (dev->iommu)
       |      |            ~
       |      |            |
       |      |            (2) ...to here
       |      |            (3) following 'false' branch...
       |......
       |  659 |         if (dev->iommu)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |
     'arm_smmu_device_group': event 4
       |
       |drivers/iommu/arm/arm-smmu/arm-smmu.c:1474:33:
       | 1474 |         struct arm_smmu_device *smmu =3D cfg->smmu;
       |      |                                 ^~~~
       |      |                                 |
       |      |                                 (4) ...to here
       |
     'arm_smmu_device_group': event 5
       |
       |drivers/iommu/arm/arm-smmu/arm-smmu.h:449:17:
       |  449 |         (i >=3D fw->num_ids ? INVALID_SMENDX : cfg->smendx[=
i])
   drivers/iommu/arm/arm-smmu/arm-smmu.h:451:27: note: in expansion of macr=
o 'cfg_smendx'
       |  451 |         for (i =3D 0; idx =3D cfg_smendx(cfg, fw, i), i < f=
w->num_ids; ++i)
       |      |                           ^~~~~~~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1479:9: note: in expansion of macr=
o 'for_each_cfg_sme'
       | 1479 |         for_each_cfg_sme(cfg, fwspec, i, idx) {
       |      |         ^~~~~~~~~~~~~~~~
       |
   drivers/iommu/arm/arm-smmu/arm-smmu.c: In function 'arm_smmu_def_domain_=
type':
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1575:47: warning: dereference of N=
ULL '0' [CWE-476] [-Wanalyzer-null-dereference]
    1575 |         const struct arm_smmu_impl *impl =3D cfg->smmu->impl;
         |                                            ~~~^~~~~~
     'arm_smmu_def_domain_type': event 1
       |
       |include/linux/iommu.h:659:12:
       |  659 |         if (dev->iommu)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |
     'arm_smmu_def_domain_type': events 2-3
       |
       |drivers/iommu/arm/arm-smmu/arm-smmu.c:1575:47:
       | 1575 |         const struct arm_smmu_impl *impl =3D cfg->smmu->imp=
l;
       |      |                                            ~~~^~~~~~
       |      |                                               |
       |      |                                               (2) ...to here
       |      |                                               (3) dereferen=
ce of NULL '<unknown>'
       |
   drivers/iommu/arm/arm-smmu/arm-smmu.c: In function 'arm_smmu_rmr_install=
_bypass_smr':
>> drivers/iommu/arm/arm-smmu/arm-smmu.c:2099:36: warning: use of uninitial=
ized value '*(struct iommu_iort_rmr_data *)e.num_sids' [CWE-457] [-Wanalyze=
r-use-of-uninitialized-value]
    2099 |                 for (i =3D 0; i < rmr->num_sids; i++) {
         |                                 ~~~^~~~~~~~~~
     'arm_smmu_rmr_install_bypass_smr': event 1
       |
       | 2076 |         struct list_head rmr_list;
       |      |                          ^~~~~~~~
       |      |                          |
       |      |                          (1) region created on stack here
       |
     'arm_smmu_rmr_install_bypass_smr': event 2
       |
       |include/linux/list.h:675:14:
       |  675 |              !list_entry_is_head(pos, head, member);       =
             \
       |      |              ^
       |      |              |
       |      |              (2) following 'true' branch...
   drivers/iommu/arm/arm-smmu/arm-smmu.c:2094:9: note: in expansion of macr=
o 'list_for_each_entry'
       | 2094 |         list_for_each_entry(e, &rmr_list, list) {
       |      |         ^~~~~~~~~~~~~~~~~~~
       |
     'arm_smmu_rmr_install_bypass_smr': event 3
       |
       |cc1:
       | (3): ...to here
       |
     'arm_smmu_rmr_install_bypass_smr': event 4
       |
       | 2099 |                 for (i =3D 0; i < rmr->num_sids; i++) {
       |      |                                 ~~~^~~~~~~~~~
       |      |                                    |
       |      |                                    (4) use of uninitialized=
 value '*(struct iommu_iort_rmr_data *)e.num_sids' here
       |
>> drivers/iommu/arm/arm-smmu/arm-smmu.c:2100:58: warning: use of uninitial=
ized value '*(struct iommu_iort_rmr_data *)e.sids' [CWE-457] [-Wanalyzer-us=
e-of-uninitialized-value]
    2100 |                         idx =3D arm_smmu_find_sme(smmu, rmr->sid=
s[i], ~0);
         |                                                       ~~~^~~~~~
     'arm_smmu_rmr_install_bypass_smr': event 1
       |
       | 2076 |         struct list_head rmr_list;
       |      |                          ^~~~~~~~
       |      |                          |
       |      |                          (1) region created on stack here
       |
     'arm_smmu_rmr_install_bypass_smr': event 2
       |
       |include/linux/list.h:675:14:
       |  675 |              !list_entry_is_head(pos, head, member);       =
             \
       |      |              ^
       |      |              |
       |      |              (2) following 'true' branch...
   drivers/iommu/arm/arm-smmu/arm-smmu.c:2094:9: note: in expansion of macr=
o 'list_for_each_entry'
       | 2094 |         list_for_each_entry(e, &rmr_list, list) {
       |      |         ^~~~~~~~~~~~~~~~~~~
       |
     'arm_smmu_rmr_install_bypass_smr': event 3
       |
       |cc1:
       | (3): ...to here
       |
     'arm_smmu_rmr_install_bypass_smr': events 4-6
       |
       | 2099 |                 for (i =3D 0; i < rmr->num_sids; i++) {
       |      |                             ~~^~~~~~~~~~~~~~~
       |      |                               |
       |      |                               (4) following 'true' branch...
       | 2100 |                         idx =3D arm_smmu_find_sme(smmu, rmr=
->sids[i], ~0);
       |      |                                                       ~~~~~=
~~~~
       |      |                                                          |
       |      |                                                          (5=
) ...to here
       |      |                                                          (6=
) use of uninitialized value '*(struct iommu_iort_rmr_data *)e.sids' here
       |
   drivers/iommu/arm/arm-smmu/arm-smmu.c: In function 'arm_smmu_device_prob=
e':
   drivers/iommu/arm/arm-smmu/arm-smmu.c:2124:26: warning: use of uninitial=
ized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    2124 |         struct resource *res;
         |                          ^~~
     'arm_smmu_device_probe': event 1
       |
       | 2124 |         struct resource *res;
       |      |                          ^~~
       |      |                          |
       |      |                          (1) use of uninitialized value '<u=
nknown>' here
       |
   drivers/iommu/arm/arm-smmu/arm-smmu.c:2125:25: warning: use of uninitial=
ized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    2125 |         resource_size_t ioaddr;
         |                         ^~~~~~
     'arm_smmu_device_probe': event 1
       |
       | 2125 |         resource_size_t ioaddr;
       |      |                         ^~~~~~
       |      |                         |
       |      |                         (1) use of uninitialized value '<un=
known>' here
       |
   drivers/iommu/arm/arm-smmu/arm-smmu.c:2162:43: warning: use of uninitial=
ized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    2162 |         smmu->num_context_irqs =3D num_irqs - global_irqs - pmu_=
irqs;
         |                                  ~~~~~~~~~^~~~~~~~~~~~~
     'arm_smmu_device_probe': events 1-11
       |
       | 2000 |                 return dev_err_probe(dev, -ENODEV,
       |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                        |
       |      |                        (4) ...to here
       | 2001 |                                      "missing #global-inter=
rupts property\n");
       |      |                                      ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
       |......
       | 2133 |         if (!smmu) {
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |......
       | 2137 |         smmu->dev =3D dev;
       |      |         ~~~~~~~~~~~~~~~
       |      |                   |
       |      |                   (2) ...to here
       | 2138 | =

       | 2139 |         if (dev->of_node)
       |      |            ~
       |      |            |
       |      |            (3) following 'true' branch...
       |......
       | 2143 |         if (err)
       |      |            ~
       |      |            |
       |      |            (5) following 'false' branch...
       |......
       | 2146 |         smmu->base =3D devm_platform_get_and_ioremap_resour=
ce(pdev, 0, &res);
       |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
       |      |                      |
       |      |                      (6) ...to here
       | 2147 |         if (IS_ERR(smmu->base))
       |      |            ~
       |      |            |
       |      |            (7) following 'false' branch...
       | 2148 |                 return PTR_ERR(smmu->base);
       | 2149 |         ioaddr =3D res->start;

vim +2099 drivers/iommu/arm/arm-smmu/arm-smmu.c

f6810c15cf973fc drivers/iommu/arm-smmu.c              Robin Murphy  2017-04=
-10  2073  =

0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2074  static void arm_smmu_rmr_install_bypass_smr(struct arm_smmu_devi=
ce *smmu)
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2075  {
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2076  	struct list_head rmr_list;
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2077  	struct iommu_resv_region *e;
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2078  	int idx, cnt =3D 0;
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2079  	u32 reg;
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2080  =

0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2081  	INIT_LIST_HEAD(&rmr_list);
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2082  	iort_get_rmr_sids(dev_fwnode(smmu->dev), &rmr_list);
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2083  =

0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2084  	/*
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2085  	 * Rather than trying to look at existing mappings that
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2086  	 * are setup by the firmware and then invalidate the ones
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2087  	 * that do no have matching RMR entries, just disable the
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2088  	 * SMMU until it gets enabled again in the reset routine.
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2089  	 */
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2090  	reg =3D arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sCR0);
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2091  	reg |=3D ARM_SMMU_sCR0_CLIENTPD;
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2092  	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sCR0, reg);
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2093  =

0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2094  	list_for_each_entry(e, &rmr_list, list) {
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2095  		struct iommu_iort_rmr_data *rmr;
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2096  		int i;
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2097  =

0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2098  		rmr =3D container_of(e, struct iommu_iort_rmr_data, rr);
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15 @2099  		for (i =3D 0; i < rmr->num_sids; i++) {
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15 @2100  			idx =3D arm_smmu_find_sme(smmu, rmr->sids[i], ~0);
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2101  			if (idx < 0)
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2102  				continue;
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2103  =

0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2104  			if (smmu->s2crs[idx].count =3D=3D 0) {
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2105  				smmu->smrs[idx].id =3D rmr->sids[i];
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2106  				smmu->smrs[idx].mask =3D 0;
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2107  				smmu->smrs[idx].valid =3D true;
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2108  			}
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2109  			smmu->s2crs[idx].count++;
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2110  			smmu->s2crs[idx].type =3D S2CR_TYPE_BYPASS;
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2111  			smmu->s2crs[idx].privcfg =3D S2CR_PRIVCFG_DEFAULT;
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2112  =

0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2113  			cnt++;
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2114  		}
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2115  	}
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2116  =

0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2117  	dev_notice(smmu->dev, "\tpreserved %d boot mapping%s\n", cnt,
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2118  		   cnt =3D=3D 1 ? "" : "s");
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2119  	iort_put_rmr_sids(dev_fwnode(smmu->dev), &rmr_list);
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2120  }
0bec05574d13ed7 drivers/iommu/arm/arm-smmu/arm-smmu.c Jon Nettleton 2022-06=
-15  2121  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2321465759976470159==--

