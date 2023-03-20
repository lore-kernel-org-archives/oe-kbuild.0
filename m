Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E189EA1
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Mar 2023 01:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679276427; x=1710812427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m7uWqVkgBGyhK1/yFHFqIFLitfS19LcHXKjfYDg1hnE=;
  b=Ba8Xg4AUvfqIguHcDrwF1Pud76lWeXEmldIGt9l/sJtyV+aL3mdmbTch
   3Iu2bJpm1UAhFxncEsnnaVoDds7m/FiEKgLU4PumokMJ7FNcbxeh5FPxu
   RRo68yYecgKJSvhLPok//SKetr7pvy3KUKCmp7eWZuNocKd1HQlM5Xcm0
   y7QZkAhROtS42ry5ksjZ0mGwPYa3xLpyxo/BW+plnC33qHbP6fSoSp2R0
   46lhSE3tYLCkmrRXLGWrgXJcan3I4VKCSzGrcjfa9rcIyOtIGcMZ0iths
   r9v2UnMJqoEOWM0XSR3DMWh2hWExfNbgaxG60t8594iOKopPpB2OxeX1y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="340915228"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="340915228"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 18:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="683301313"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="683301313"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Mar 2023 18:40:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pe4Vd-000Ajm-0g;
	Mon, 20 Mar 2023 01:40:25 +0000
Date: Mon, 20 Mar 2023 09:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/perf/riscv_pmu_sbi.c:802 pmu_sbi_device_probe() warn:
 missing unwind goto?
Message-ID: <202303200941.4TSDQb89-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Lin <eric.lin@sifive.com>
CC: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e8d018dd0257f744ca50a729e3d042cf2ec9da65
commit: e9a023f2b73ac35ff5cfbefe8524c64d8173d65f drivers/perf: riscv_pmu: Add riscv pmu pm notifier
date:   9 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 9 months ago
config: riscv-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230320/202303200941.4TSDQb89-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303200941.4TSDQb89-lkp@intel.com/

New smatch warnings:
drivers/perf/riscv_pmu_sbi.c:802 pmu_sbi_device_probe() warn: missing unwind goto?

Old smatch warnings:
drivers/perf/riscv_pmu_sbi.c:471 pmu_sbi_get_ctrinfo() warn: potentially one past the end of array 'pmu_ctr_list[i]'
drivers/perf/riscv_pmu_sbi.c:471 pmu_sbi_get_ctrinfo() warn: potentially one past the end of array 'pmu_ctr_list[i]'

vim +802 drivers/perf/riscv_pmu_sbi.c

e9a023f2b73ac3 Eric Lin    2022-07-05  763  
e9991434596f53 Atish Patra 2022-02-18  764  static int pmu_sbi_device_probe(struct platform_device *pdev)
e9991434596f53 Atish Patra 2022-02-18  765  {
e9991434596f53 Atish Patra 2022-02-18  766  	struct riscv_pmu *pmu = NULL;
e9991434596f53 Atish Patra 2022-02-18  767  	int num_counters;
4905ec2fb7e642 Atish Patra 2022-02-18  768  	int ret = -ENODEV;
e9991434596f53 Atish Patra 2022-02-18  769  
e9991434596f53 Atish Patra 2022-02-18  770  	pr_info("SBI PMU extension is available\n");
e9991434596f53 Atish Patra 2022-02-18  771  	pmu = riscv_pmu_alloc();
e9991434596f53 Atish Patra 2022-02-18  772  	if (!pmu)
e9991434596f53 Atish Patra 2022-02-18  773  		return -ENOMEM;
e9991434596f53 Atish Patra 2022-02-18  774  
e9991434596f53 Atish Patra 2022-02-18  775  	num_counters = pmu_sbi_find_num_ctrs();
e9991434596f53 Atish Patra 2022-02-18  776  	if (num_counters < 0) {
e9991434596f53 Atish Patra 2022-02-18  777  		pr_err("SBI PMU extension doesn't provide any counters\n");
4905ec2fb7e642 Atish Patra 2022-02-18  778  		goto out_free;
e9991434596f53 Atish Patra 2022-02-18  779  	}
e9991434596f53 Atish Patra 2022-02-18  780  
e9991434596f53 Atish Patra 2022-02-18  781  	/* cache all the information about counters now */
e9991434596f53 Atish Patra 2022-02-18  782  	if (pmu_sbi_get_ctrinfo(num_counters))
4905ec2fb7e642 Atish Patra 2022-02-18  783  		goto out_free;
e9991434596f53 Atish Patra 2022-02-18  784  
4905ec2fb7e642 Atish Patra 2022-02-18  785  	ret = pmu_sbi_setup_irqs(pmu, pdev);
4905ec2fb7e642 Atish Patra 2022-02-18  786  	if (ret < 0) {
4905ec2fb7e642 Atish Patra 2022-02-18  787  		pr_info("Perf sampling/filtering is not supported as sscof extension is not available\n");
4905ec2fb7e642 Atish Patra 2022-02-18  788  		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
4905ec2fb7e642 Atish Patra 2022-02-18  789  		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
4905ec2fb7e642 Atish Patra 2022-02-18  790  	}
e9991434596f53 Atish Patra 2022-02-18  791  	pmu->num_counters = num_counters;
e9991434596f53 Atish Patra 2022-02-18  792  	pmu->ctr_start = pmu_sbi_ctr_start;
e9991434596f53 Atish Patra 2022-02-18  793  	pmu->ctr_stop = pmu_sbi_ctr_stop;
e9991434596f53 Atish Patra 2022-02-18  794  	pmu->event_map = pmu_sbi_event_map;
e9991434596f53 Atish Patra 2022-02-18  795  	pmu->ctr_get_idx = pmu_sbi_ctr_get_idx;
e9991434596f53 Atish Patra 2022-02-18  796  	pmu->ctr_get_width = pmu_sbi_ctr_get_width;
e9991434596f53 Atish Patra 2022-02-18  797  	pmu->ctr_clear_idx = pmu_sbi_ctr_clear_idx;
e9991434596f53 Atish Patra 2022-02-18  798  	pmu->ctr_read = pmu_sbi_ctr_read;
e9991434596f53 Atish Patra 2022-02-18  799  
e9991434596f53 Atish Patra 2022-02-18  800  	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
e9991434596f53 Atish Patra 2022-02-18  801  	if (ret)
e9991434596f53 Atish Patra 2022-02-18 @802  		return ret;
e9991434596f53 Atish Patra 2022-02-18  803  
e9a023f2b73ac3 Eric Lin    2022-07-05  804  	ret = riscv_pm_pmu_register(pmu);
e9a023f2b73ac3 Eric Lin    2022-07-05  805  	if (ret)
e9a023f2b73ac3 Eric Lin    2022-07-05  806  		goto out_unregister;
e9a023f2b73ac3 Eric Lin    2022-07-05  807  
e9991434596f53 Atish Patra 2022-02-18  808  	ret = perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
e9a023f2b73ac3 Eric Lin    2022-07-05  809  	if (ret)
e9a023f2b73ac3 Eric Lin    2022-07-05  810  		goto out_unregister;
e9991434596f53 Atish Patra 2022-02-18  811  
e9991434596f53 Atish Patra 2022-02-18  812  	return 0;
4905ec2fb7e642 Atish Patra 2022-02-18  813  
e9a023f2b73ac3 Eric Lin    2022-07-05  814  out_unregister:
e9a023f2b73ac3 Eric Lin    2022-07-05  815  	riscv_pmu_destroy(pmu);
e9a023f2b73ac3 Eric Lin    2022-07-05  816  
4905ec2fb7e642 Atish Patra 2022-02-18  817  out_free:
4905ec2fb7e642 Atish Patra 2022-02-18  818  	kfree(pmu);
4905ec2fb7e642 Atish Patra 2022-02-18  819  	return ret;
e9991434596f53 Atish Patra 2022-02-18  820  }
e9991434596f53 Atish Patra 2022-02-18  821  

:::::: The code at line 802 was first introduced by commit
:::::: e9991434596f5373dfd75857b445eb92a9253c56 RISC-V: Add perf platform driver based on SBI PMU extension

:::::: TO: Atish Patra <atish.patra@wdc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
