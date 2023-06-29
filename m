Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC30EDE
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jun 2023 01:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688003586; x=1719539586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GQ0C2S4qmxQxt+EQKfa6wmPaBiSuLL8gifPqSPQYcRE=;
  b=Pf1+qdxTr6SBAbIen6oMVoBiKkJGwIRaskcpBH7bV7EcBMAR8GNtms/G
   w5dUgVSnXYiKLoNbqeAcNfSvnnKhz/l6kYh7B4+g1dz00hRRFARLV+Y4C
   ZBinP3MW37C1Bi6WZ0M3WreS66Z33msWj+T7TJdK+QFnUuAf3pf1I2DQC
   YmZJ8fNwWMDaez17miT/AQOOSJQHMSuxzPx+bgbDN1J4lreWA+v3wKuby
   U/6bDYNUlk2dYU9uduUUVr6dw8HPLpdIt8UsHm1vJuT2f/yMuBdohpX4t
   27g2HYm4wLkzkb10DzUldlnNOhip8FRQwJd23NFNCbpFqAc2cDeaL0vZT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="364550001"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="364550001"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 18:53:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="963827739"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="963827739"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jun 2023 18:53:04 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEgqF-000Dg1-1I;
	Thu, 29 Jun 2023 01:53:03 +0000
Date: Thu, 29 Jun 2023 09:52:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [powerpc:merge 1/5] riscv32-linux-ld: section .data..percpu LMA
 [03536000,0369ecff] overlaps section .rodata LMA [031f4300,03b4eaf9]
Message-ID: <202306290941.tluM2fQK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: riscv32-linux-ld: section .data..percpu LMA [03536000,0369ecff] overlaps section .rodata LMA [031f4300,03b4eaf9]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linuxppc-dev@lists.ozlabs.org
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
head:   034451183057cb1f6d0089f86214a8f8171bcaca
commit: b594ae79b7ebdb1aac22823a4b63bfb9e700ae8c [1/5] Automatic merge of 'master' into merge (2023-06-26 10:21)
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-r092-20230628 (https://download.01.org/0day-ci/archive/20230629/202306290941.tluM2fQK-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306290941.tluM2fQK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306290941.tluM2fQK-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: section .data LMA [01b89000,0221b5cf] overlaps section .text LMA [00120670,031f42f3]
>> riscv32-linux-ld: section .data..percpu LMA [03536000,0369ecff] overlaps section .rodata LMA [031f4300,03b4eaf9]
>> riscv32-linux-ld: section .rodata VMA [c31f4300,c3b4eaf9] overlaps section .bss VMA [c26ed000,c39ac897]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
