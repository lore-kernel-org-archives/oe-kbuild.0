Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F45E199D8
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 10:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766831252; cv=none; b=rIY4Mce8ZwGweE7LYiAnOXhIB85hYtZ7PGBQ8Lo3QLd23Menz/07f9HNYWWmQsw/rVNzOn8KhPEgVnWeMHT4pfYCnCxx+z+WvXvr5GNjqDINhxbcq9dGCatFyoBreM3nlNArFKZU8CACpa9X2BcOj1t/HmvRS9dJwQOofBDfQT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766831252; c=relaxed/simple;
	bh=RFEC9uIMvkI5i2do5haW3Ri6KFWsCk0x4nm2ZC/23I0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VsK7/f474OFFhfnccpZMYEbexGdVE7xIvopYyEbX95QPT2dutpp2ytldFt9BvEaU0csm92+Z7TQO6b09UyPWS9gewWEw9kCoxjWIEV+nvxVBQAPFCjDfT+Hatq58nPNWxK7ZHkpJzS9pNezcOtSbRhkNTL1iyP7irgZiBTZ/jgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPvaBqjy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPvaBqjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766831250; x=1798367250;
  h=date:from:to:cc:subject:message-id;
  bh=RFEC9uIMvkI5i2do5haW3Ri6KFWsCk0x4nm2ZC/23I0=;
  b=bPvaBqjyUgvOxUotXs+ti0USrl/pS9jiXdI08kq3v3jiGVMzCA4X1uqS
   aVB67y1lyZNf1y47k1NY56txcraJfDP32timHVazZYRyr3PbZC7e0/pl6
   isc+xsZbZfI4jXiALOs/GT0KdwqsC+7yNRDLJUoIgOZg2FYGbRdQefeXZ
   byGn457nKMrZn4/N+FX7CuZl/P61y+M2eyN7GuWVxbN9shPycCiBYpDNs
   zt4pnKru6SGgYZS4q2fFOKqWl/LtvgisZQjInGsm/vb03eWI91VxX2Yyk
   Kvven+GcJGFM8VPv3PiL+bCIjl1mnS0NHsuiQdTK+eP1HdzCgAB8djQHb
   Q==;
X-CSE-ConnectionGUID: gW+joSymRsOENjlUexNmPA==
X-CSE-MsgGUID: WP+OJyvkRnWwvbF+cYusHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68430689"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68430689"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 02:27:30 -0800
X-CSE-ConnectionGUID: GPEld8swSEmxVkkr0qkMcA==
X-CSE-MsgGUID: 6nsHjhBtQbemKPT/WobJHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205578630"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Dec 2025 02:27:29 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZRVj-000000005jl-1V9s;
	Sat, 27 Dec 2025 10:27:18 +0000
Date: Sat, 27 Dec 2025 18:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ardb:x86-efi-zboot 14/29]
 arch/x86/boot/compressed/misc.c:323 handle_dynamic() error: uninitialized
 symbol 'place'.
Message-ID: <202512271846.qNnwRAkq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   b6f238d2e8720acf63467aa0d48d7fc4e31c07c2
commit: f74063f20ddfc0a4f136aa4af5b92e1d2bf6be31 [14/29] x86/boot: Implement support for RELA/RELR runtime relocations
:::::: branch date: 18 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-161-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271846.qNnwRAkq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512271846.qNnwRAkq-lkp@intel.com/

New smatch warnings:
arch/x86/boot/compressed/misc.c:323 handle_dynamic() error: uninitialized symbol 'place'.

Old smatch warnings:
arch/x86/boot/compressed/misc.c:444 early_sev_detect() warn: bitwise AND condition is false here

vim +/place +323 arch/x86/boot/compressed/misc.c

a02150610776f6 Kees Cook      2013-07-08  280  
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  281  #ifdef CONFIG_X86_64
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  282  static void handle_dynamic(const Elf64_Dyn *dyn, Elf64_Off p2v_offset,
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  283  			   u64 va_shift)
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  284  {
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  285  	const Elf64_Rela *rela = NULL;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  286  	u64 *relr = NULL;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  287  	int relasize = 0;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  288  	int relrsize = 0;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  289  	u64 *place;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  290  
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  291  	for (auto d = dyn; d->d_tag != DT_NULL; d++) {
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  292  		switch (d->d_tag) {
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  293  		case DT_RELA:
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  294  			rela = (void *)(d->d_un.d_ptr + p2v_offset);
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  295  			break;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  296  		case DT_RELASZ:
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  297  			relasize = d->d_un.d_val;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  298  			break;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  299  		case DT_RELR:
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  300  			relr = (void *)(d->d_un.d_ptr + p2v_offset);
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  301  			break;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  302  		case DT_RELRSZ:
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  303  			relrsize = d->d_un.d_val;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  304  			break;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  305  		}
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  306  	}
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  307  
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  308  	for (int i = 0; i < relasize / sizeof(*rela); i++) {
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  309  		if (ELF64_R_TYPE(rela[i].r_info) != R_X86_64_RELATIVE)
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  310  			continue;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  311  
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  312  		place = (u64 *)(rela[i].r_offset + p2v_offset);
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  313  		*place += va_shift;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  314  	}
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  315  
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  316  	for (int i = 0; i < relrsize / sizeof(u64); i++) {
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  317  		if ((relr[i] & 1) == 0) {
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  318  			place = (u64 *)(relr[i] + p2v_offset);
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  319  			*place++ += va_shift;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  320  			continue;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  321  		}
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  322  
f74063f20ddfc0 Ard Biesheuvel 2025-12-26 @323  		for (u64 *p = place, r = relr[i] >> 1; r; p++, r >>= 1)
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  324  			if (r & 1)
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  325  				*p += va_shift;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  326  		place += 63;
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  327  	}
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  328  }
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  329  #endif
f74063f20ddfc0 Ard Biesheuvel 2025-12-26  330  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
