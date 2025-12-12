Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACED3B8D45
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765536470; cv=none; b=uo2CHcP2Bv9UEVFu0EGw+cnSjLViODBCd0a/YywLn1TXAQE2NQECaxKKDkPE4zTqRQGg0IsKTMqwBqRwgcFlztFATza5GNM6EFK1CvLEBbO236sD2q6nt57c3Qr3hVLwMu8udz+4AIpIM60+Ja3ccCd6zUEBq8FCiU7XtXJqIQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765536470; c=relaxed/simple;
	bh=raKws7oifM7/T8/1fxXwfkZ5rRUhXRSylq82xYFKObY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jkZcsiNVGYu88Dzwf7soNnc9Zmwx0LSw+QiUNYX+Owo+Gf0xDN1wfYRFoe7bUysQA1sz+/kiscsbxJ25bqr6+41yay4pT8ikZYVLWqNCWikdwQhzAVwCpLywCD2EPfs5wIQR66ZCilR/9CCpNax2VVOYyBVeM5ZRao9B1vFNDxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjU/C+Rm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjU/C+Rm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765536469; x=1797072469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=raKws7oifM7/T8/1fxXwfkZ5rRUhXRSylq82xYFKObY=;
  b=UjU/C+RmsIYVDA45qr0CMc+agAp4kvV5WA5/kxA0fZgsQ3255pNfAo7U
   QkvX4rR4UY/2buHyNqxlbgGDLsFTHilu18uuNz8fzDItIZu59JaxS9K1n
   9pPMUsVOiCZ2xYlPAnqXLW0FK9PfJQwjX+YyKeuOHe12Ziy/WREJfOMiN
   pHCJ45DaL7EXXB0GibSLOOsJ0lEGcu5h5yOqJx5FqSjUVMcd3+BXsRsFz
   DsWS5TQy7Oc4pnuavl/ye8IbcMdI2k1nV9x2nsJR7/b/YAioJUMYJ7WEi
   DaIHX+2ZDETkXEOYDZ0YGmxq0qESs+HFr+AmDfcmBMqfT9UUvoQhFQ7Q8
   Q==;
X-CSE-ConnectionGUID: N3fYl7ozSfmdkIt7Iqtccg==
X-CSE-MsgGUID: 6K/UgCH2ReSxT/iHCTzYhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67467898"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67467898"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:47:48 -0800
X-CSE-ConnectionGUID: /XVfvwXbSe2GDTdYeKU6dQ==
X-CSE-MsgGUID: X34tZqv5Qiar68k3FDJNrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197545087"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2025 02:47:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU0gb-000000005x0-145W;
	Fri, 12 Dec 2025 10:47:45 +0000
Date: Fri, 12 Dec 2025 18:47:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool: fixup_sst39vf_rev_b+0x130:
 cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <202512121845.LfUxaWV8-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: acae6b5bfffedc0440837c52584696dadb2fa334 objtool: Improve __noreturn annotation warning
date:   9 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121845.LfUxaWV8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121845.LfUxaWV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512121845.LfUxaWV8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: fixup_sst39vf_rev_b+0x130: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_resume+0x19b: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_check_err_status+0x175: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: chip_ready+0x15e: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_panic_write_oneword+0x114: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_write_oneword_once+0x114: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: fixup_sst38vf640x_sectorsize+0x13d: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: put_chip.constprop.0+0x2ce: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: get_chip+0x4e1: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_write_oneword+0x2e5: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_atmel_unlock+0x17b: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_atmel_lock+0x184: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: fwh_xxlock_oneblock+0x16d: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_otp_lock+0x1a1: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_erase_chip+0x32b: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_write_buffer+0x19b: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_erase_oneblock+0x32b: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_ppb_xxlock+0x166: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_read+0x330: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_otp_walk+0x267: cfi_qry_mode_on() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_reset.isra.0+0x188: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_secsi_read+0x3ba: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_otp_write+0x14b: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_read_secsi_onechip+0x285: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_getlockstatus_oneblock+0xc7: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: inval_cache_and_wait_for_operation+0xac: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_suspend+0x255: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: put_chip.constprop.0+0x1e4: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: chip_ready+0xde: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_erase_oneblock+0xeb: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_write_oneword.constprop.0+0x135: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_write_buffer+0x1b2: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_reset.isra.0+0x188: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: fixup_LH28F640BF+0x116: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_resume+0x1e7: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_point+0x3e1: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_read+0x34f: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: fwh_xxlock_oneblock+0x174: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_xxlock_oneblock+0x101: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: jedec_reset+0x95: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_jedec_setup+0x3c2: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: jedec_probe_chip+0x2ec: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_write_buffer.cold+0x0: unreachable instruction
   vmlinux.o: warning: objtool: jedec_probe_chip.cold+0x0: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
