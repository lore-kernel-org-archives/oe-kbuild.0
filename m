Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1545934BA2B
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Oct 2025 01:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760320110; cv=none; b=jBcwpp+18Bl4uT9Q2N4DOW6ZaFujRDvunq8yF0wYlZ0cwa1/axW2gYpMRUe6lTYCShco1PDr58xLtOHnqcurfpxZBUOgIeDjFVI5bK7Pwa5C0/v3gaG8Zw/9/9PtxWnSwPkLmxuG2wVH0m9wPcv8n1A0VEne/gwPBbB0iw0g87A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760320110; c=relaxed/simple;
	bh=GOMefqmquDhwaKWDNKcNBhFqtFiCk74W0Oc6lzmgdxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=suVKj+S79j2GmePWTWGpmDfAKuHzTfOyskYR2DN6UPIT5kGOCR2rsnPdVVh+1g0VyMeMjpP3700UAXH0aKBxFnAoj4HOkkETN9DE8jtdWWZVIPULea+iPwEbw0/gMKeChI730nfZj1bSSoDxye2BMu5h62avX2YRT67puSVLRBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=llD+IqkT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llD+IqkT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760320108; x=1791856108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GOMefqmquDhwaKWDNKcNBhFqtFiCk74W0Oc6lzmgdxs=;
  b=llD+IqkT0KVrEv1b69QuoZNDX2XWeyZnPwH3dtriOsYsE90URsclwOMI
   R2niMsATicVQ5PadcWK3FpgM7reHBmh9stYxMVAIf/PakREYm0+F5G09G
   GgZN3ffk9VRZoOkweDZCxlD3skn42AZHT2EqI0of7xPWqXwzmIb+JRZEh
   xFD7wRNDvFl8Z7a5bIZS5rG5HHAJ7iky3t5xe4OalN5dEPyHpYVWZMBPh
   58I60Hx7OrFco40Vd52v2skZQjGxQxFjEBFmOxSyYQt4TSgZfxyVEdiVl
   RdaZEPhXqd6E51h91sCtxrnGT2B0Ct9vIvp2eIKO3jxLVCYP3CjgRSBFr
   w==;
X-CSE-ConnectionGUID: KZoapsyXRMeGa635gIPHOA==
X-CSE-MsgGUID: a2yrgYjwTuiXXRUd3mB8Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62368256"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62368256"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 18:48:27 -0700
X-CSE-ConnectionGUID: tD3vBQDTRrO6nJd7jwvk3A==
X-CSE-MsgGUID: EFzy0SdYRx2rLn1BGZnZ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="212111097"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 12 Oct 2025 18:48:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v87fk-00005z-0A;
	Mon, 13 Oct 2025 01:48:24 +0000
Date: Mon, 13 Oct 2025 09:48:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/nios2/kernel/setup.c:151 adjust_lowmem_bounds() warn: iterator
 'i' not incremented
Message-ID: <202510130947.0djhgiQF-lkp@intel.com>
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
TO: Simon Schuster <schuster.simon@siemens-energy.com>
CC: Dinh Nguyen <dinguyen@kernel.org>
CC: Andreas Oetken <andreas.oetken@siemens-energy.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3a8660878839faadb4f1a6dd72c3179c1df56787
commit: a20b83cf45be2057f3d073506779e52c7fa17f94 nios2: ensure that memblock.current_limit is set when setting pfn limits
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
config: nios2-randconfig-r071-20251013 (https://download.01.org/0day-ci/archive/20251013/202510130947.0djhgiQF-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510130947.0djhgiQF-lkp@intel.com/

smatch warnings:
arch/nios2/kernel/setup.c:151 adjust_lowmem_bounds() warn: iterator 'i' not incremented

vim +/i +151 arch/nios2/kernel/setup.c

7f7bc20bc41a4f Andreas Oetken 2021-02-19  144  
a20b83cf45be20 Simon Schuster 2025-08-21  145  static void __init adjust_lowmem_bounds(void)
a20b83cf45be20 Simon Schuster 2025-08-21  146  {
a20b83cf45be20 Simon Schuster 2025-08-21  147  	phys_addr_t block_start, block_end;
a20b83cf45be20 Simon Schuster 2025-08-21  148  	u64 i;
a20b83cf45be20 Simon Schuster 2025-08-21  149  	phys_addr_t memblock_limit = 0;
a20b83cf45be20 Simon Schuster 2025-08-21  150  
a20b83cf45be20 Simon Schuster 2025-08-21 @151  	for_each_mem_range(i, &block_start, &block_end) {
a20b83cf45be20 Simon Schuster 2025-08-21  152  		if (block_end > memblock_limit)
a20b83cf45be20 Simon Schuster 2025-08-21  153  			memblock_limit = block_end;
a20b83cf45be20 Simon Schuster 2025-08-21  154  	}
a20b83cf45be20 Simon Schuster 2025-08-21  155  
a20b83cf45be20 Simon Schuster 2025-08-21  156  	memblock_set_current_limit(memblock_limit);
a20b83cf45be20 Simon Schuster 2025-08-21  157  }
a20b83cf45be20 Simon Schuster 2025-08-21  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
