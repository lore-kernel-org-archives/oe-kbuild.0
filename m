Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B328200C2
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 06:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768716251; cv=none; b=QDhGd9vIhiuXfg34YvF9m9+zKCdkv9XK6KvBc2+izC1amB2LM2/LOA1ANnWxb1H6yGYRyGlncDzuHdUi/nNnPZGdeErpkTAT0B9bzsey3VjyxtQ3EDyPjOzC86K1IdS6kNuDV7ls0HdelAhjT/SIjQyUKextG081e42xD60qEA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768716251; c=relaxed/simple;
	bh=0Do6/hfCPQIY+WwWXIGDlm/fm50U1PEEAwjF6caJ78c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sdmnk3r1GYj1XPfckPEBvKp8CD78UvQnWBxk/Oy6uB6giyXp1OEZHW0NLmJImWDkMtn1espAQOsZRwMtQxOXnsdN2W/CPe1pUlu37MreBZ/1f1YwI7FNBIinOFBiBaiZiCCUEC7hIgZXTwqGanjZbR0iTnYP6Dkb9+PgxjafseU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lfr4T7Z7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lfr4T7Z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768716249; x=1800252249;
  h=date:from:to:cc:subject:message-id;
  bh=0Do6/hfCPQIY+WwWXIGDlm/fm50U1PEEAwjF6caJ78c=;
  b=Lfr4T7Z78LWG9iku9GDqjFTw8lAskGyWs95lmfLPfj0sk4Ui4Ni0ild3
   7Jk857DNG9e0enICsjcyShpM99oAvRqg9lgF0aZesuPflNeqImYZSUoLE
   WZk7507lZXbEnYD2vkD19fL08+m3MDhJhNHgQixQazjtA4g6jX361v/yT
   Tcddtt9nWb68Y6d4k4YjcueQUpOu6nAS4Idlluuhg8RiLQJgp464TIZ9E
   x/epNbYX47Nu57a1T7TForkHIBz7IsEGGazrklwLdSC6dDEPw78jo0Tbd
   1fJ1ZZ+vmxoNu0VXn1+we2oeLA+6bRu0k2UTpmv2ErAgczsF9h44o3Uzx
   g==;
X-CSE-ConnectionGUID: 20pdM5PsS5CEH42HlZiB4Q==
X-CSE-MsgGUID: tLfEK2qMTB2wIHzcy146oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="73597531"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="73597531"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 22:04:07 -0800
X-CSE-ConnectionGUID: a//JscXEQmeymJ2IKZhrYw==
X-CSE-MsgGUID: qw21LdU6S7O9flG6niAbmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205860253"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jan 2026 22:04:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhLtL-00000000MhW-3Y4H;
	Sun, 18 Jan 2026 06:04:03 +0000
Date: Sun, 18 Jan 2026 14:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [fustini:b4/ssqosid-cbqri 12/20]
 arch/riscv/kernel/qos/qos_resctrl.c:319:9: error: implicit declaration of
 function 'ioread64'; did you mean 'ioread32'?
Message-ID: <202601181420.0ZMdfG42-lkp@intel.com>
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
config: riscv-randconfig-001-20260118 (https://download.01.org/0day-ci/archive/20260118/202601181420.0ZMdfG42-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181420.0ZMdfG42-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601181420.0ZMdfG42-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_set_cbm':
>> arch/riscv/kernel/qos/qos_resctrl.c:319:9: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Werror=implicit-function-declaration]
     319 |   reg = ioread64(ctrl->base + reg_offset);
         |         ^~~~~~~~
         |         ioread32
>> arch/riscv/kernel/qos/qos_resctrl.c:322:3: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Werror=implicit-function-declaration]
     322 |   iowrite64(reg, ctrl->base + reg_offset);
         |   ^~~~~~~~~
         |   iowrite32
   cc1: some warnings being treated as errors


vim +319 arch/riscv/kernel/qos/qos_resctrl.c

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
