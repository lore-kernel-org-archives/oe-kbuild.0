Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524A81E3DF2
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 06:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768719552; cv=none; b=L0Qa+wyC+1RPbKlZgiYkolS3xEjbDIP0fCQymaTKtuzgsjd1PpuBp6Jk/h5dsq8r03K9wZLVR7sk+k49II9FTgvp9eOS5U7n3pkdjhVtni6wbhNMBbyHWxv87mr/kL8hqYsQnVlAfxtQ695+2jVrQgHxozzpN1f+dOEx5nrgMVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768719552; c=relaxed/simple;
	bh=KP69zF10i1zQ0LHmTUsw6NBS3XtcgZpSHcjjqNxkBvI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cUcE/4LCc4P1yAFqTtjfw2Sc7qgHrXPiSLwLwDmxvpw3cOSjmA4UN+oRdZIRRvfTvdOWBVSAJA2hMaspMovfHIIOmKz7ygYoSb9vmjfmwPWgTwKHtrXfsYrg10EDe1vNTSeQwPv+tkddNdx4v20gsVvbL4LDlXwhaq7+GanZX+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVaeq5VZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVaeq5VZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768719550; x=1800255550;
  h=date:from:to:cc:subject:message-id;
  bh=KP69zF10i1zQ0LHmTUsw6NBS3XtcgZpSHcjjqNxkBvI=;
  b=dVaeq5VZYU2vHnOToxiFhjNKIuwUa16MHl40jXNB1oqaW6sFC/MCvEnM
   sfkPF2kell5osoSzlmRYIAdRaYbAbBB6vTZY+V1jFrl9FPgs+Hlo6Oysc
   YuYpcF2+qdKduqgHRI0oWlkuFeeaqjxtRc7Tf/MeQ/pu4Ox9jTspZAntN
   5s096tsNvOVId21SUKFPb788sUZIaggC9gv61ssGDM7W3CKr/AvuEsbFo
   8DGldBYPcBmYZ9eX83RXOs5bhQPyoaMXkygQNJytYzNoYsO2Y4/a+qjyi
   VHov5WmURDHgvAzX+mSd7FwyJs/xWbcNqW4GL1Y3o9zexGcVWw2taECaN
   g==;
X-CSE-ConnectionGUID: NnuLqqzPTjCNYmAQUeNz+A==
X-CSE-MsgGUID: fz9W/x8JRkCJ4ABlmjQQAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="73822640"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="73822640"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 22:59:10 -0800
X-CSE-ConnectionGUID: ebckSO+QRHqNW4M6tdeXeQ==
X-CSE-MsgGUID: oyL0YRptR0ahOCIE76pzPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205865695"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jan 2026 22:59:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhMkc-00000000MkU-3JhZ;
	Sun, 18 Jan 2026 06:59:06 +0000
Date: Sun, 18 Jan 2026 14:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [fustini:b4/ssqosid-cbqri 12/20]
 arch/riscv/kernel/qos/qos_resctrl.c:319:9: error: call to undeclared function
 'ioread64'; ISO C99 and later do not support implicit function declarations
Message-ID: <202601181434.Dj5ABURq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Drew Fustini <fustini@kernel.org>
CC: Adrien Ricciardi <aricciardi@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   b34c2f7cb87d02f5b712e9e35ac9b66d21ce07e9
commit: 2225c01f7a9bf50eac8dc43f7d079968906e9dac [12/20] RISC-V: QoS: add to build when CONFIG_RISCV_ISA_SSQOSID set
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-r073-20260118 (https://download.01.org/0day-ci/archive/20260118/202601181434.Dj5ABURq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181434.Dj5ABURq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601181434.Dj5ABURq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/qos/qos_resctrl.c:319:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     319 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
>> arch/riscv/kernel/qos/qos_resctrl.c:322:3: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     322 |                 iowrite64(reg, ctrl->base + reg_offset);
         |                 ^
   arch/riscv/kernel/qos/qos_resctrl.c:332:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     332 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:336:3: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     336 |                 iowrite64(reg, ctrl->base + reg_offset);
         |                 ^
   arch/riscv/kernel/qos/qos_resctrl.c:346:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     346 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:358:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     358 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:377:8: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     377 |         reg = ioread64(ctrl->base + reg_offset);
         |               ^
   arch/riscv/kernel/qos/qos_resctrl.c:407:2: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     407 |         iowrite64(reg, ctrl->base + reg_offset);
         |         ^
   arch/riscv/kernel/qos/qos_resctrl.c:459:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     459 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:477:8: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     477 |         reg = ioread64(ctrl->base + reg_offset);
         |               ^
   arch/riscv/kernel/qos/qos_resctrl.c:484:2: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     484 |         iowrite64(reg, ctrl->base + reg_offset);
         |         ^
   arch/riscv/kernel/qos/qos_resctrl.c:633:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     633 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:669:8: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     669 |         reg = ioread64(ctrl->base + reg_offset);
         |               ^
   arch/riscv/kernel/qos/qos_resctrl.c:675:2: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     675 |         iowrite64(reg, ctrl->base + reg_offset);
         |         ^
   arch/riscv/kernel/qos/qos_resctrl.c:763:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     763 |                 reg = ioread64(ctrl->base + CBQRI_CC_CAPABILITIES_OFF);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:847:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     847 |                 reg = ioread64(ctrl->base + CBQRI_BC_CAPABILITIES_OFF);
         |                       ^
   16 errors generated.


vim +/ioread64 +319 arch/riscv/kernel/qos/qos_resctrl.c

579653452d289e6 Drew Fustini 2023-04-19  311  
579653452d289e6 Drew Fustini 2023-04-19  312  /* Set capacity block mask (cc_block_mask) */
579653452d289e6 Drew Fustini 2023-04-19  313  static void cbqri_set_cbm(struct cbqri_controller *ctrl, u64 cbm)
579653452d289e6 Drew Fustini 2023-04-19  314  {
579653452d289e6 Drew Fustini 2023-04-19  315  		int reg_offset;
579653452d289e6 Drew Fustini 2023-04-19  316  		u64 reg;
579653452d289e6 Drew Fustini 2023-04-19  317  
579653452d289e6 Drew Fustini 2023-04-19  318  		reg_offset = CBQRI_CC_BLOCK_MASK_OFF;
579653452d289e6 Drew Fustini 2023-04-19 @319  		reg = ioread64(ctrl->base + reg_offset);
579653452d289e6 Drew Fustini 2023-04-19  320  
579653452d289e6 Drew Fustini 2023-04-19  321  		reg = cbm;
579653452d289e6 Drew Fustini 2023-04-19 @322  		iowrite64(reg, ctrl->base + reg_offset);
579653452d289e6 Drew Fustini 2023-04-19  323  }
579653452d289e6 Drew Fustini 2023-04-19  324  

:::::: The code at line 319 was first introduced by commit
:::::: 579653452d289e64ca8a7e2522a058ec2e5f890f RISC-V: QoS: add resctrl interface for CBQRI controllers

:::::: TO: Drew Fustini <fustini@kernel.org>
:::::: CC: Drew Fustini <fustini@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
