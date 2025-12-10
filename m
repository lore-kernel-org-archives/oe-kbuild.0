Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6388826ED45
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Dec 2025 22:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765405864; cv=none; b=KO6KCcPdz1B5+nl4dUKS6/FbcB/aAEIodbjIAM2BCSzEJONsCCyRTc1jpO2r7YPj5LCg96l/G7Q73Pbgwd3z3eIiPaUp4so/KbhrSaMZpR9MO5sQEysrNW8zf9BkH1wMrUaAvBY8exnsgFnXVCg0YcCtkyWlWguvMuj/GcaSL4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765405864; c=relaxed/simple;
	bh=YPF1YAfvleSaqWWmkO7RxJj6DsXeqThO+Flzyxy5n4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fNBNvS1c55rfEPZmcGM4dxyKmvdtP1WdfQQYQV/+wkpXJiwmZt3SapHerHSjTeCDZGFK/jm61rG2/erPA7hjIwrZKGG9WsZ/URuD92AQQC6vxZ6gCo/V6njrIU0oHtR2tA/dl4p5a2ioSWkGZ02cTx7gjJWq6OKFqUmdVDUuKnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjyOM/QY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjyOM/QY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765405862; x=1796941862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YPF1YAfvleSaqWWmkO7RxJj6DsXeqThO+Flzyxy5n4g=;
  b=bjyOM/QYFy36FvJIK7LlYg1U3MHKCSeOzWn71+R28NjvCuE89AJuhGwB
   XK0yQV04yiHRUBBmimjdLqJ+V558JAHPYutm9n7zVZ6hmhYReIMBV0N+V
   SuT2EFm1Y5Q2QiiimYowiXMh3BVlCEHSOQKJPEX0keavXGksCa8e/yDiL
   1zPBZAUInVKFbSK1/ZE9Q1/iKcj6Y3JDdbOJauCTRTS1AS97TsQKiGgXg
   P7sX2xrNKDEMkwb5T6XLxzRrK6X6zj+U3nbLPLqzPvQE8xUosPTe4V/rI
   F5eTXDCB3vBS93VUyoPRkOK6+es4j1kMnsuYDmEvDyyVKo9Yq/QGwckB1
   Q==;
X-CSE-ConnectionGUID: CwHgTuN/S2+ocqYVUQ0qEQ==
X-CSE-MsgGUID: +ZEP7vvaT7ieDQPVuDVKDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78748762"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78748762"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 14:31:01 -0800
X-CSE-ConnectionGUID: V5NNsrOvQWazLkYEHCXbgA==
X-CSE-MsgGUID: 3EIaR5BhQfqRg0p5An9kPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="227290429"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Dec 2025 14:31:00 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTSi1-000000003pp-1v9Y;
	Wed, 10 Dec 2025 22:30:57 +0000
Date: Thu, 11 Dec 2025 06:30:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [fustini:b4/ssqosid-cbqri 12/24]
 arch/riscv/kernel/qos/qos_resctrl.c:296:9: error: call to undeclared
 function 'ioread64'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202512110615.SGIChFQT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Drew Fustini <fustini@kernel.org>
CC: Adrien Ricciardi <aricciardi@baylibre.com>

Hi Drew,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   9cef75501dd0366444c60c3ca47bf75270f2160a
commit: b3bca12466ffbbabc21d40cf1713b1e88dcfef64 [12/24] RISC-V: QoS: add to build when CONFIG_RISCV_ISA_SSQOSID set
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-001-20251211 (https://download.01.org/0day-ci/archive/20251211/202512110615.SGIChFQT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110615.SGIChFQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512110615.SGIChFQT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/qos/qos_resctrl.c:296:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     296 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
>> arch/riscv/kernel/qos/qos_resctrl.c:299:3: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     299 |                 iowrite64(reg, ctrl->base + reg_offset);
         |                 ^
   arch/riscv/kernel/qos/qos_resctrl.c:311:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     311 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:313:3: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     313 |                 iowrite64(reg, ctrl->base + reg_offset);
         |                 ^
   arch/riscv/kernel/qos/qos_resctrl.c:323:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     323 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:337:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     337 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:356:8: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     356 |         reg = ioread64(ctrl->base + reg_offset);
         |               ^
   arch/riscv/kernel/qos/qos_resctrl.c:386:2: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     386 |         iowrite64(reg, ctrl->base + reg_offset);
         |         ^
   arch/riscv/kernel/qos/qos_resctrl.c:411:8: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     411 |         reg = ioread64(ctrl->base + reg_offset);
         |               ^
   arch/riscv/kernel/qos/qos_resctrl.c:418:2: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     418 |         iowrite64(reg, ctrl->base + reg_offset);
         |         ^
   arch/riscv/kernel/qos/qos_resctrl.c:522:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     522 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:612:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     612 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:648:8: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     648 |         reg = ioread64(ctrl->base + reg_offset);
         |               ^
   arch/riscv/kernel/qos/qos_resctrl.c:654:2: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     654 |         iowrite64(reg, ctrl->base + reg_offset);
         |         ^
   arch/riscv/kernel/qos/qos_resctrl.c:742:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     742 |                 reg = ioread64(ctrl->base + CBQRI_CC_CAPABILITIES_OFF);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:826:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     826 |                 reg = ioread64(ctrl->base + CBQRI_BC_CAPABILITIES_OFF);
         |                       ^
   16 errors generated.


vim +/ioread64 +296 arch/riscv/kernel/qos/qos_resctrl.c

291c1b985f85fd Drew Fustini 2023-04-19  288  
291c1b985f85fd Drew Fustini 2023-04-19  289  /* Set capacity block mask (cc_block_mask) */
291c1b985f85fd Drew Fustini 2023-04-19  290  static void cbqri_set_cbm(struct cbqri_controller *ctrl, u64 cbm)
291c1b985f85fd Drew Fustini 2023-04-19  291  {
291c1b985f85fd Drew Fustini 2023-04-19  292  		int reg_offset;
291c1b985f85fd Drew Fustini 2023-04-19  293  		u64 reg;
291c1b985f85fd Drew Fustini 2023-04-19  294  
291c1b985f85fd Drew Fustini 2023-04-19  295  		reg_offset = CBQRI_CC_BLOCK_MASK_OFF;
291c1b985f85fd Drew Fustini 2023-04-19 @296  		reg = ioread64(ctrl->base + reg_offset);
291c1b985f85fd Drew Fustini 2023-04-19  297  
291c1b985f85fd Drew Fustini 2023-04-19  298  		reg = cbm;
291c1b985f85fd Drew Fustini 2023-04-19 @299  		iowrite64(reg, ctrl->base + reg_offset);
291c1b985f85fd Drew Fustini 2023-04-19  300  
291c1b985f85fd Drew Fustini 2023-04-19  301  		reg = ioread64(ctrl->base + reg_offset);
291c1b985f85fd Drew Fustini 2023-04-19  302  }
291c1b985f85fd Drew Fustini 2023-04-19  303  

:::::: The code at line 296 was first introduced by commit
:::::: 291c1b985f85fdb7d7ec4b8ef3996b518145db12 RISC-V: QoS: add resctrl interface for CBQRI controllers

:::::: TO: Drew Fustini <fustini@kernel.org>
:::::: CC: Drew Fustini <fustini@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
