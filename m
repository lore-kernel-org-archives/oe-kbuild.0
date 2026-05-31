Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D7F3815E3
	for <oe-kbuild@lists.linux.dev>; Sun, 31 May 2026 08:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780215860; cv=none; b=ojOccUHLHXzHDTLBUmFXTmSqji4Hme9l4RxOmp+IKXr/y13BeM4z+SThtZyMTRCHojbjqnHRRNnH1qn9CKCHC+oKqAgkF6lkXEvEFJDXRybKFinnhZvwl47L2sbGxWwKy5xV++CbOygcBYDcCCgpnEP4GMAG7DhNnjOmihWCAZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780215860; c=relaxed/simple;
	bh=UuTtP/+KIjdREOMkNWJqur3dt9HqxkXLtigs43Pw/7g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=enTK6at+6Fv14xd0z3eBuosPsmsopVpxXb08FvHvZKn2CBCL52eCmMY0/AcdN65PgepVxJyXAA7Bo2slnf3slHThh0AoLYD3cWdD4n7LyIlOUKN8LJmg4nsocau8k+eYq38TSIa6+xI8YnN/zSJYu4Tw+FYc/OrkPtxOrSrImno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0bsDPfi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0bsDPfi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780215858; x=1811751858;
  h=date:from:to:cc:subject:message-id;
  bh=UuTtP/+KIjdREOMkNWJqur3dt9HqxkXLtigs43Pw/7g=;
  b=a0bsDPfioV4gI87+5Gp1iEbQrAXACDXuGk30g+fnCnKpnGLhc+/5NnCI
   vfU29G2CQiBfb2JhOXf8essWDxUR9t3VNG9LXcG4F6Q+NJwS6zZgJojaF
   mkw/xl1QIUfMDCTAT+e/Uq3G072ZType3mseV1S3eHBYqX2Fb4ZewrFzS
   kDW3dfUJjaBFowBN8hNdfSeaGRh54Y6RcuknxiZhwPoBnxojnLU6F5trs
   rkBJlr4b3Y0cvbiuijtYwJmLrZLE211Y1vgFrtGzEOU7nnyvw5jfsf2Sy
   XPrrrlo5lVfu4Pji+YSXvfWMiJYbmuNxbgIbRekj0QPxDk2VvAqlQq51t
   g==;
X-CSE-ConnectionGUID: bTZD16qpR8S7q37RWjheYQ==
X-CSE-MsgGUID: FcsDD6/sRgW3kdLnIo2fCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="98419214"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="98419214"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 01:24:17 -0700
X-CSE-ConnectionGUID: aldBZE20QB+yE7wRFLVOqg==
X-CSE-MsgGUID: UsNoIiEiRquYdye4i/kkGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="243363476"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 May 2026 01:24:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTbSv-000000009GI-3lVf;
	Sun, 31 May 2026 08:24:13 +0000
Date: Sun, 31 May 2026 16:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [agd5f:amd-staging-drm-next 2317/2811] ERROR: modpost:
 __ex_table+0x1bf4 references non-executable section '.init.data'
Message-ID: <202605311634.DCVKkzBy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
CC: Chengjun Yao <Chengjun.Yao@amd.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   82518fffe31281e2527a3b43f62652ce0d04dc01
commit: 755e8f73caff5b34025ee5733e1f4a23f5c5ff3a [2317/2811] drm/ttm: Fix bo resource use-after-free
:::::: branch date: 3 days ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-001-20260531 (https://download.01.org/0day-ci/archive/20260531/202605311634.DCVKkzBy-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605311634.DCVKkzBy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605311634.DCVKkzBy-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: wm8753_mic_sel+0x8 (section: .data) -> .Lpcrel_hi71 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_dai_mode+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_dai_mode+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_dai_mode+0x8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_dai_mode+0xc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_dat_sel+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_dat_sel+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_dat_sel+0x8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_dat_sel+0xc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_rout2_phase+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_rout2_phase+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_dai+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_dai+0x34 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_dai+0x40 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_dai+0x70 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_dai+0xa8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_dai+0xdc (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_dai+0xe8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_dai+0x118 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_spi_driver+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_spi_driver+0x10 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_spi_driver+0x28 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_i2c_driver+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_i2c_driver+0x18 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_i2c_driver+0x30 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8753_i2c_driver+0x68 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsl_sai_driver+0x14 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsl_sai_driver+0x54 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsl_sai_regmap_config+0x80 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1aa0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1aa4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1aac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ab0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ab8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1abc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1abc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ac4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ac8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ad0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ad4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1adc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1adc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ae0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ae8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1aec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1af4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1af8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b00 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b04 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b0c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b10 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b18 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b1c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b24 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b28 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b30 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b34 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b3c (section: __ex_table) -> .L.str.18 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1b3c references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b58 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b88 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1b88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bb8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bb8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bc4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bd0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bd0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bdc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1bdc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1be8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1be8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bf4 (section: __ex_table) -> root_fs_names (section: .init.data)
>> ERROR: modpost: __ex_table+0x1bf4 references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c14 (section: __ex_table) -> .L.str.1 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1c14 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c38 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c3c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c78 (section: __ex_table) -> .L.str.6 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1c78 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c80 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c84 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c8c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c90 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c98 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c9c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1c9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ca4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ca4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ca8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ca8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1cec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cf0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1cf0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cf8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1cf8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cfc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1cfc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d04 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d08 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d10 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d14 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d1c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d20 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d28 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d2c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d34 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d38 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d40 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d44 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d4c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d50 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d58 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d5c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d64 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d68 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d70 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d74 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d7c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d80 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d88 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d8c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d94 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d98 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1da0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1da0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1da4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1da4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1dac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1db0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1db8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dbc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1dbc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1dc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1dc8 references non-executable section '.debug_str'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
