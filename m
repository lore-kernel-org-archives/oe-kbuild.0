Content-Type: multipart/mixed; boundary="===============0078369471657191994=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [atishp04:sbi_pmu_v6 14/17] drivers/perf/riscv_pmu_sbi.c:464 pmu_sbi_get_ctrinfo() warn: potentially one past the end of array 'pmu_ctr_list[i]'
Date: Wed, 23 Feb 2022 01:43:43 +0800
Message-ID: <202202230110.onIE1TGT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0078369471657191994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Atish Patra <Atish.Patra@wdc.com>
CC: linux-kernel(a)vger.kernel.org
TO: Atish Patra <atish.patra@wdc.com>

tree:   https://github.com/atishp04/linux sbi_pmu_v6
head:   876094386d4f915d81ec2ee5b8b412987a10d808
commit: 626af3184b715c86adace38af397cf4223f2cb75 [14/17] RISC-V: Add perf p=
latform driver based on SBI PMU extension
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-m031-20220222 (https://download.01.org/0day-ci/arc=
hive/20220223/202202230110.onIE1TGT-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/perf/riscv_pmu_sbi.c:464 pmu_sbi_get_ctrinfo() warn: potentially on=
e past the end of array 'pmu_ctr_list[i]'
drivers/perf/riscv_pmu_sbi.c:464 pmu_sbi_get_ctrinfo() warn: potentially on=
e past the end of array 'pmu_ctr_list[i]'

vim +464 drivers/perf/riscv_pmu_sbi.c

626af3184b715c Atish Patra 2021-03-17  443  =

626af3184b715c Atish Patra 2021-03-17  444  static int pmu_sbi_get_ctrinfo(=
int nctr)
626af3184b715c Atish Patra 2021-03-17  445  {
626af3184b715c Atish Patra 2021-03-17  446  	struct sbiret ret;
626af3184b715c Atish Patra 2021-03-17  447  	int i, num_hw_ctr =3D 0, num_f=
w_ctr =3D 0;
626af3184b715c Atish Patra 2021-03-17  448  	union sbi_pmu_ctr_info cinfo;
626af3184b715c Atish Patra 2021-03-17  449  =

626af3184b715c Atish Patra 2021-03-17  450  	pmu_ctr_list =3D kcalloc(nctr,=
 sizeof(*pmu_ctr_list), GFP_KERNEL);
626af3184b715c Atish Patra 2021-03-17  451  	if (!pmu_ctr_list)
626af3184b715c Atish Patra 2021-03-17  452  		return -ENOMEM;
626af3184b715c Atish Patra 2021-03-17  453  =

626af3184b715c Atish Patra 2021-03-17  454  	for (i =3D 0; i <=3D nctr; i++=
) {
626af3184b715c Atish Patra 2021-03-17  455  		ret =3D sbi_ecall(SBI_EXT_PMU=
, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
626af3184b715c Atish Patra 2021-03-17  456  		if (ret.error)
626af3184b715c Atish Patra 2021-03-17  457  			/* The logical counter ids a=
re not expected to be contiguous */
626af3184b715c Atish Patra 2021-03-17  458  			continue;
626af3184b715c Atish Patra 2021-03-17  459  		cinfo.value =3D ret.value;
626af3184b715c Atish Patra 2021-03-17  460  		if (cinfo.type =3D=3D SBI_PMU=
_CTR_TYPE_FW)
626af3184b715c Atish Patra 2021-03-17  461  			num_fw_ctr++;
626af3184b715c Atish Patra 2021-03-17  462  		else
626af3184b715c Atish Patra 2021-03-17  463  			num_hw_ctr++;
626af3184b715c Atish Patra 2021-03-17 @464  		pmu_ctr_list[i].value =3D cin=
fo.value;
626af3184b715c Atish Patra 2021-03-17  465  	}
626af3184b715c Atish Patra 2021-03-17  466  =

626af3184b715c Atish Patra 2021-03-17  467  	pr_info("%d firmware and %d ha=
rdware counters\n", num_fw_ctr, num_hw_ctr);
626af3184b715c Atish Patra 2021-03-17  468  =

626af3184b715c Atish Patra 2021-03-17  469  	return 0;
626af3184b715c Atish Patra 2021-03-17  470  }
626af3184b715c Atish Patra 2021-03-17  471  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============0078369471657191994==--

