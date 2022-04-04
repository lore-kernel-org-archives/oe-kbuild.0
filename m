Content-Type: multipart/mixed; boundary="===============7721416000040741005=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v9 07/11] ACPI/IORT: Add a helper to retrieve RMR info directly
Date: Tue, 05 Apr 2022 06:32:46 +0800
Message-ID: <202204050605.ws3dZryq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7721416000040741005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220404124209.1086-8-shameerali.kolothum.thodi@huawei.com>
References: <20220404124209.1086-8-shameerali.kolothum.thodi@huawei.com>
TO: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
TO: linux-arm-kernel(a)lists.infradead.org
TO: linux-acpi(a)vger.kernel.org
TO: iommu(a)lists.linux-foundation.org
CC: linuxarm(a)huawei.com
CC: lorenzo.pieralisi(a)arm.com
CC: joro(a)8bytes.org
CC: robin.murphy(a)arm.com
CC: will(a)kernel.org
CC: wanghuiqiang(a)huawei.com
CC: guohanjun(a)huawei.com
CC: steven.price(a)arm.com
CC: Sami.Mujawar(a)arm.com
CC: jon(a)solid-run.com
CC: eric.auger(a)redhat.com
CC: laurentiu.tudor(a)nxp.com
CC: yangyicong(a)huawei.com

Hi Shameer,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on joro-iommu/next]
[also build test WARNING on rafael-pm/linux-next arm/for-next soc/for-next =
arm64/for-next/core linus/master v5.18-rc1 next-20220404]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Shameer-Kolothum/ACP=
I-IORT-Support-for-IORT-RMR-node/20220404-204553
base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpio/gpio-pl061.c:225:3: warning: There is an unknown macro here=
 somewhere. Configuration is required. If for_each_set_bit is a macro then =
please configure it. [unknownMacro]
     for_each_set_bit(offset, &pending, PL061_GPIO_NR)
     ^
--
>> drivers/acpi/arm64/iort.c:1429:2: warning: There is an unknown macro her=
e somewhere. Configuration is required. If list_for_each_entry_safe is a ma=
cro then please configure it. [unknownMacro]
    list_for_each_entry_safe(entry, next, head, list)
    ^

vim +1429 drivers/acpi/arm64/iort.c

6a2c7db7318962 Shameer Kolothum 2022-04-04  1417  =

6a2c7db7318962 Shameer Kolothum 2022-04-04  1418  /**
6a2c7db7318962 Shameer Kolothum 2022-04-04  1419   * iort_put_rmr_sids - Fr=
ee all the memory allocated for RMR reserved regions.
6a2c7db7318962 Shameer Kolothum 2022-04-04  1420   * @iommu_fwnode: fwnode =
associated with IOMMU
6a2c7db7318962 Shameer Kolothum 2022-04-04  1421   * @head: Resereved regio=
n list
6a2c7db7318962 Shameer Kolothum 2022-04-04  1422   */
6a2c7db7318962 Shameer Kolothum 2022-04-04  1423  void iort_put_rmr_sids(st=
ruct fwnode_handle *iommu_fwnode,
6a2c7db7318962 Shameer Kolothum 2022-04-04  1424  		       struct list_head=
 *head)
6a2c7db7318962 Shameer Kolothum 2022-04-04  1425  {
6a2c7db7318962 Shameer Kolothum 2022-04-04  1426  	struct iommu_resv_region=
 *entry, *next;
6a2c7db7318962 Shameer Kolothum 2022-04-04  1427  =

6a2c7db7318962 Shameer Kolothum 2022-04-04  1428  	iort_iommu_put_resv_regi=
ons(NULL, head);
6a2c7db7318962 Shameer Kolothum 2022-04-04 @1429  	list_for_each_entry_safe=
(entry, next, head, list)
6a2c7db7318962 Shameer Kolothum 2022-04-04  1430  		kfree(entry);
6a2c7db7318962 Shameer Kolothum 2022-04-04  1431  }
6a2c7db7318962 Shameer Kolothum 2022-04-04  1432  EXPORT_SYMBOL_GPL(iort_pu=
t_rmr_sids);
6a2c7db7318962 Shameer Kolothum 2022-04-04  1433  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7721416000040741005==--

