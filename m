Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BC31F416A
	for <oe-kbuild@lists.linux.dev>; Mon, 19 May 2025 06:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747636259; cv=none; b=tYRmcHz3vMDqjHJSQyf4Rc7JNgPXKfgLy2s1jdShv7g8nVBlu4yAjBgj58LYSuq/0TwtBv5ZI4rHjXisxB3BFBqRet24hVm/SWGteZdP1WowHiAXxLPquhkxBrlS5hyj5N2usCg0rEj08Z0sEKeB0zx/0gD3S8Ke7wK2nmGMuyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747636259; c=relaxed/simple;
	bh=xfelyoxieMLugFMXERSIjYusArluDhxI1IFuzhj3SPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QnVAnsn8gnXbaqoSwzt0T2+0MJ/qzPZqzeNL7SsFCQDhlw2DHIhxNKQs55nxfFMRAKoJ2kft0UPQWCOZiKARz/sgvG+ezQJ1TjVbGxBC61dniJINjpn8KElP9N1OyYwWVDm/fGGj3TrzeG9IiE6D8J/55B89Ppy+XsfExUqmd2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mR3Y3kwE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mR3Y3kwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747636258; x=1779172258;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xfelyoxieMLugFMXERSIjYusArluDhxI1IFuzhj3SPA=;
  b=mR3Y3kwECCFUG8avY1WoOTRwCRU1slHVd7Sxd46d4AP0bMw2fFPFj5ww
   +Jn44SgiAxsrfmL1f1NFj3Q/rJgIHwBiUMkntwcEMqMwvPDb0+fkJwpSy
   xmEUmVNblFiHSeXHA2FfvTPgA3QFF5fl+GuAQz+XX88aaLMU/S7DYzjfL
   GWp5FpJTQgvR3ONS65gFu/421kixRYyHmfBMDyheGmdxILhUqYhKZgAAT
   mqX1uQorePuZlLJqrP6F/AuiU5joekeroLx+yj5Ivi2v/+r6ryCLznykF
   HNEyKnUkGKv93PiM3LuJhosthfX+ZfbwyEZ64Az+7USXoLAJI9LArSXZx
   Q==;
X-CSE-ConnectionGUID: a4PRkuhIT9uIz6NrI8egNQ==
X-CSE-MsgGUID: NNHgAcVQSti2DdBDmPcHyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49422511"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49422511"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 23:30:54 -0700
X-CSE-ConnectionGUID: IWEuBmrOTE6VPlN330xzsA==
X-CSE-MsgGUID: xBXslmlyRxSSYt+xHfAK1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139691998"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 May 2025 23:30:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGu1S-000LDF-2p;
	Mon, 19 May 2025 06:30:50 +0000
Date: Mon, 19 May 2025 14:30:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/setup.c:242 reserve_memblock_reserved_regions()
 warn: iterator 'j' not incremented
Message-ID: <202505191430.IuWmMhOt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Björn Töpel" <bjorn@rivosinc.com>
CC: Alexandre Ghiti <alexghiti@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a5806cd506af5a7c19bcd596e4708b5c464bfd21
commit: e94eb7ea6f206e229791761a5fdf9389f8dbd183 riscv: Properly export reserved regions in /proc/iomem
date:   5 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-r071-20250519 (https://download.01.org/0day-ci/archive/20250519/202505191430.IuWmMhOt-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505191430.IuWmMhOt-lkp@intel.com/

smatch warnings:
arch/riscv/kernel/setup.c:242 reserve_memblock_reserved_regions() warn: iterator 'j' not incremented

vim +/j +242 arch/riscv/kernel/setup.c

00ab027a3b82db Nick Kossifidis 2020-10-12  230  
e94eb7ea6f206e Björn Töpel     2025-04-09  231  static int __init reserve_memblock_reserved_regions(void)
e94eb7ea6f206e Björn Töpel     2025-04-09  232  {
e94eb7ea6f206e Björn Töpel     2025-04-09  233  	u64 i, j;
e94eb7ea6f206e Björn Töpel     2025-04-09  234  
e94eb7ea6f206e Björn Töpel     2025-04-09  235  	for (i = 0; i < num_standard_resources; i++) {
e94eb7ea6f206e Björn Töpel     2025-04-09  236  		struct resource *mem = &standard_resources[i];
e94eb7ea6f206e Björn Töpel     2025-04-09  237  		phys_addr_t r_start, r_end, mem_size = resource_size(mem);
e94eb7ea6f206e Björn Töpel     2025-04-09  238  
e94eb7ea6f206e Björn Töpel     2025-04-09  239  		if (!memblock_is_region_reserved(mem->start, mem_size))
e94eb7ea6f206e Björn Töpel     2025-04-09  240  			continue;
e94eb7ea6f206e Björn Töpel     2025-04-09  241  
e94eb7ea6f206e Björn Töpel     2025-04-09 @242  		for_each_reserved_mem_range(j, &r_start, &r_end) {
e94eb7ea6f206e Björn Töpel     2025-04-09  243  			resource_size_t start, end;
e94eb7ea6f206e Björn Töpel     2025-04-09  244  
e94eb7ea6f206e Björn Töpel     2025-04-09  245  			start = max(PFN_PHYS(PFN_DOWN(r_start)), mem->start);
e94eb7ea6f206e Björn Töpel     2025-04-09  246  			end = min(PFN_PHYS(PFN_UP(r_end)) - 1, mem->end);
e94eb7ea6f206e Björn Töpel     2025-04-09  247  
e94eb7ea6f206e Björn Töpel     2025-04-09  248  			if (start > mem->end || end < mem->start)
e94eb7ea6f206e Björn Töpel     2025-04-09  249  				continue;
e94eb7ea6f206e Björn Töpel     2025-04-09  250  
e94eb7ea6f206e Björn Töpel     2025-04-09  251  			reserve_region_with_split(mem, start, end, "Reserved");
e94eb7ea6f206e Björn Töpel     2025-04-09  252  		}
e94eb7ea6f206e Björn Töpel     2025-04-09  253  	}
e94eb7ea6f206e Björn Töpel     2025-04-09  254  
e94eb7ea6f206e Björn Töpel     2025-04-09  255  	return 0;
e94eb7ea6f206e Björn Töpel     2025-04-09  256  }
e94eb7ea6f206e Björn Töpel     2025-04-09  257  arch_initcall(reserve_memblock_reserved_regions);
00ab027a3b82db Nick Kossifidis 2020-10-12  258  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
