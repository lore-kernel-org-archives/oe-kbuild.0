Content-Type: multipart/mixed; boundary="===============7095462016803043337=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/perf/riscv_pmu_sbi.c:464 pmu_sbi_get_ctrinfo() warn: potentially one past the end of array 'pmu_ctr_list[i]'
Date: Sat, 16 Apr 2022 19:47:24 +0800
Message-ID: <202204161940.BrRZvzdD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7095462016803043337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Atish Patra <atish.patra@wdc.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   59250f8a7f3a60a2661b84cbafc1e0eb5d05ec9b
commit: e9991434596f5373dfd75857b445eb92a9253c56 RISC-V: Add perf platform =
driver based on SBI PMU extension
date:   4 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-m031-20220416 (https://download.01.org/0day-ci/arc=
hive/20220416/202204161940.BrRZvzdD-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/perf/riscv_pmu_sbi.c:464 pmu_sbi_get_ctrinfo() warn: potentially on=
e past the end of array 'pmu_ctr_list[i]'
drivers/perf/riscv_pmu_sbi.c:464 pmu_sbi_get_ctrinfo() warn: potentially on=
e past the end of array 'pmu_ctr_list[i]'

vim +464 drivers/perf/riscv_pmu_sbi.c

e9991434596f53 Atish Patra 2022-02-18  443  =

e9991434596f53 Atish Patra 2022-02-18  444  static int pmu_sbi_get_ctrinfo(=
int nctr)
e9991434596f53 Atish Patra 2022-02-18  445  {
e9991434596f53 Atish Patra 2022-02-18  446  	struct sbiret ret;
e9991434596f53 Atish Patra 2022-02-18  447  	int i, num_hw_ctr =3D 0, num_f=
w_ctr =3D 0;
e9991434596f53 Atish Patra 2022-02-18  448  	union sbi_pmu_ctr_info cinfo;
e9991434596f53 Atish Patra 2022-02-18  449  =

e9991434596f53 Atish Patra 2022-02-18  450  	pmu_ctr_list =3D kcalloc(nctr,=
 sizeof(*pmu_ctr_list), GFP_KERNEL);
e9991434596f53 Atish Patra 2022-02-18  451  	if (!pmu_ctr_list)
e9991434596f53 Atish Patra 2022-02-18  452  		return -ENOMEM;
e9991434596f53 Atish Patra 2022-02-18  453  =

e9991434596f53 Atish Patra 2022-02-18  454  	for (i =3D 0; i <=3D nctr; i++=
) {
e9991434596f53 Atish Patra 2022-02-18  455  		ret =3D sbi_ecall(SBI_EXT_PMU=
, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
e9991434596f53 Atish Patra 2022-02-18  456  		if (ret.error)
e9991434596f53 Atish Patra 2022-02-18  457  			/* The logical counter ids a=
re not expected to be contiguous */
e9991434596f53 Atish Patra 2022-02-18  458  			continue;
e9991434596f53 Atish Patra 2022-02-18  459  		cinfo.value =3D ret.value;
e9991434596f53 Atish Patra 2022-02-18  460  		if (cinfo.type =3D=3D SBI_PMU=
_CTR_TYPE_FW)
e9991434596f53 Atish Patra 2022-02-18  461  			num_fw_ctr++;
e9991434596f53 Atish Patra 2022-02-18  462  		else
e9991434596f53 Atish Patra 2022-02-18  463  			num_hw_ctr++;
e9991434596f53 Atish Patra 2022-02-18 @464  		pmu_ctr_list[i].value =3D cin=
fo.value;
e9991434596f53 Atish Patra 2022-02-18  465  	}
e9991434596f53 Atish Patra 2022-02-18  466  =

e9991434596f53 Atish Patra 2022-02-18  467  	pr_info("%d firmware and %d ha=
rdware counters\n", num_fw_ctr, num_hw_ctr);
e9991434596f53 Atish Patra 2022-02-18  468  =

e9991434596f53 Atish Patra 2022-02-18  469  	return 0;
e9991434596f53 Atish Patra 2022-02-18  470  }
e9991434596f53 Atish Patra 2022-02-18  471  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7095462016803043337==--

