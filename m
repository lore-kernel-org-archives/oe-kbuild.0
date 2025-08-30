Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1E819D07A
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 14:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756565291; cv=none; b=s6cL6umyISJ+nvJcYtwFr01NVr7WWruAu4z2zv+Z3ojhQs6dXmIiDCKs8GN8Q/+ZmawMJ7kEkwQUG0hCSGFQTOK6EYzaCRMEw47mQWtV97A1vL+rO8DP2K1eRMMuLxETR5cDGoDmdODhItk4eQC4FY4EoVS+IU7J2Q/JSK3oz04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756565291; c=relaxed/simple;
	bh=8Z0A9Yuey4bhb5+mw3rYuv7vqe61E2dPmzS7XJb8HrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gy+AQ+4/WMTzxPj92mE1FE4icu/ur/boQoQoVz59+1Mp17TQhmtPmzjRVwufLhWFnh0Q/T5x9D3+QPRDKQOJ1qGtz2RqpP3wQWRhXhNhASOcPiHDV9BpAyAO7FnEWpnud1nKGWTefLbboBZXir57rt5OFlt51y+KcarECNrkABM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmfCWECs; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmfCWECs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756565289; x=1788101289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Z0A9Yuey4bhb5+mw3rYuv7vqe61E2dPmzS7XJb8HrE=;
  b=mmfCWECsVBpU4oWqpmevBthLZRHqiy8vQivpNyiq/4O70LATxjjbde3V
   5R+qpaxOKicwyDIIZNs7TEdjcDzSGwFcFHgkF+CODr0rIEpMSZy1qzyv4
   rdUKtl8Ujke8hR/UoCjf1TR3Xlvql8hpfjFkddZVqIbZjRAT6FRPS11Qc
   yjViS/NsivVNBVlXrkSNjTDUaAJyj2CWUZP6igQK3b2VGhQb2ZEBtx2qJ
   EOnFok9/fnJF3BIaatR0fpcfql0ImGleN4INQ4d5ta3RqNLS0ycGYgyIU
   aOZO3Ca+i9m2zF85US0UP6laRoYWW8SK01uih3nzMZG70nA2C2YqJ6QV+
   A==;
X-CSE-ConnectionGUID: j43oYSTKSTqy2Z3wP7Oqog==
X-CSE-MsgGUID: WA5i4Zp/QeuUbpW+I6uDAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58894861"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58894861"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 07:48:09 -0700
X-CSE-ConnectionGUID: cDBtLrfpR7GsXt3ntEFbSQ==
X-CSE-MsgGUID: C1fwAq/BTbW/DuoDEKxLOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170169357"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 30 Aug 2025 07:48:08 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usMs9-000VRH-0h;
	Sat, 30 Aug 2025 14:48:05 +0000
Date: Sat, 30 Aug 2025 22:47:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-6.6 2790/2790] drivers/iommu/iommu.o: warning:
 objtool: __iommu_release_dma_ownership+0x90: unreachable instruction
Message-ID: <202508302254.ugHFXL8J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org

Hi Xianglai,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ec3f62599de17b9a87d003e846255a24ed8fd1b4
commit: 72fe4978ee346c10869113410da1b61710dd8d8f [2790/2790] LoongArch: add iommu support
:::::: branch date: 5 hours ago
:::::: commit date: 9 months ago
config: loongarch-randconfig-001-20250829 (https://download.01.org/0day-ci/archive/20250830/202508302254.ugHFXL8J-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ac23f7465eedd0dd565ffb201f573e7a69695fa3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508302254.ugHFXL8J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508302254.ugHFXL8J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/iommu.c:9:
   In file included from include/linux/amba/bus.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> drivers/iommu/iommu.o: warning: objtool: __iommu_release_dma_ownership+0x90: unreachable instruction
>> drivers/iommu/iommu.o: warning: objtool: iommu_free_global_pasid+0x8c: unreachable instruction
--
   In file included from drivers/iommu/dma-iommu.c:11:
   In file included from include/linux/acpi_iort.h:10:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> drivers/iommu/dma-iommu.o: warning: objtool: iommu_dma_compose_msi_msg+0x10c: unreachable instruction
>> drivers/iommu/dma-iommu.o: warning: objtool: iommu_dma_unmap_page+0xe8: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
