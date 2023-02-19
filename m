Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B4A7FA
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 04:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676782468; x=1708318468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C2IU2Sa3d+eb8C4ScLF16xLxZ2xFq3w+zAaKhc6VL2w=;
  b=koNufcjeZHalhaFPAJYzLEh9fTMvjXtNHTtgFN0rinjbFBR79RmHOn/6
   O9XREw7lvErqhD52/1nQGVZSRBR/n2sXDV0AbWzLnU2F3Appd/7KktbO2
   S2Orh/vLS9fGkSNgiz3c5Dx+Yr6y+aIp8FjOJNPKjpw+kaFp3+v4NljzB
   LdcBHTxLZ1dHrQfSzEq5mTp/+fQAcIa+9Z+6FP4QUF6JlHBIAAPyK3ONU
   yOL0yzZagiBQgKEqznXEwKhVkqTBSg0vBycWF/RDoNEyeFRXqOdqCHugT
   KZ30guuLyJADJN+ZdTz538lMJi/w2dJ5x5jkRFISG+OYOVgqHSFxR4mMa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="334424867"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="334424867"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 20:54:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="794840539"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="794840539"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Feb 2023 20:54:26 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTbiT-000D33-2C;
	Sun, 19 Feb 2023 04:54:25 +0000
Date: Sun, 19 Feb 2023 12:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/perf/arm_cspmu/arm_cspmu.c:1075
 arm_cspmu_find_cpu_container() warn: variable dereferenced before check
 'cpu_dev' (see line 1073)
Message-ID: <202302191227.kc0V8fM7-lkp@intel.com>
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
TO: Besar Wicaksono <bwicaksono@nvidia.com>
CC: Will Deacon <will@kernel.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: e37dfd65731dc4f001fa7dfa7f705e6840017d5a perf: arm_cspmu: Add support for ARM CoreSight PMU driver
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-m031-20230219 (https://download.01.org/0day-ci/archive/20230219/202302191227.kc0V8fM7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302191227.kc0V8fM7-lkp@intel.com/

smatch warnings:
drivers/perf/arm_cspmu/arm_cspmu.c:1075 arm_cspmu_find_cpu_container() warn: variable dereferenced before check 'cpu_dev' (see line 1073)

vim +/cpu_dev +1075 drivers/perf/arm_cspmu/arm_cspmu.c

e37dfd65731dc4 Besar Wicaksono 2022-11-11  1068  
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1069  static inline int arm_cspmu_find_cpu_container(int cpu, u32 container_uid)
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1070  {
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1071  	u32 acpi_uid;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1072  	struct device *cpu_dev = get_cpu_device(cpu);
e37dfd65731dc4 Besar Wicaksono 2022-11-11 @1073  	struct acpi_device *acpi_dev = ACPI_COMPANION(cpu_dev);
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1074  
e37dfd65731dc4 Besar Wicaksono 2022-11-11 @1075  	if (!cpu_dev)
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1076  		return -ENODEV;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1077  
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1078  	while (acpi_dev) {
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1079  		if (!strcmp(acpi_device_hid(acpi_dev),
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1080  			    ACPI_PROCESSOR_CONTAINER_HID) &&
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1081  		    !kstrtouint(acpi_device_uid(acpi_dev), 0, &acpi_uid) &&
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1082  		    acpi_uid == container_uid)
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1083  			return 0;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1084  
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1085  		acpi_dev = acpi_dev_parent(acpi_dev);
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1086  	}
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1087  
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1088  	return -ENODEV;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1089  }
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1090  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
