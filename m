Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BD92AD2D
	for <oe-kbuild@lists.linux.dev>; Fri, 23 May 2025 23:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748041911; cv=none; b=OZkVXWllHOUuv4/02kL87lyG5A8DnT60DRRVpT6QbEOnXAX0jmIxFgD3xFDXLRyFvT2Vt6EvXoKDmm3wzdgApUWorJtPbfmYZqUsGZnFQxEsEIEg/ETV4Jv/YO8UUBNwMjuTj7dnYD0lTXRslnPQ0tfpGcF1eTcbbfG5KZ7/N6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748041911; c=relaxed/simple;
	bh=vr72GQjoLDUYPNpbCJ7zoXK6quz5Vpm4Stfi9oJn7E8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dCwnARgFs6krC60VO8YQY0wIQc2WMMoyblFHefGXUm6eX2FZkxEFqunwqpz0L1hX2h2m5U3g7cFMxIiteLR09Yh+4lAya/icWN8M3BLSgRx2B05ONRLJ4FMYUJkW4lzUZBKr0z7sL7b31+embj9G+xTnP0x5+SOi7ZX9w5a+VY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwtVtrNr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwtVtrNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748041910; x=1779577910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vr72GQjoLDUYPNpbCJ7zoXK6quz5Vpm4Stfi9oJn7E8=;
  b=TwtVtrNrozdtw54YVLWii3UOCFnkzOZT+wwpiJm/fYvzXwJdGBzrb82Y
   zzAZczmYrxLbJaYbQf1fWF8QDdcJh3Vtg8iHik6HGflRgL8SIfL1PGKn1
   1DYCvi9i2KQIJzvGa2Wv84nXnlSJRi0NB/oT4QPB6YQwvsjJsy3InNHqC
   xAiRkNAZ1Qh1M8KH3MQHLZ1zxks1t+ceop01UEPGp5Jj7r5lJxMK+0B/m
   8EC7hUba8AuoEVws9Vhn5C8iClIyoA6Yf9ObUnQoSiQY02E+xSS1LrByJ
   Tg2kQmBeqQBpq0gquf2mRbaei+E7gHratYoAk+kxrJ9ZXTs7TfRdZd4pE
   w==;
X-CSE-ConnectionGUID: OtDXiKENRSCZcAmsuETsnA==
X-CSE-MsgGUID: KzrihQBCQ5u60kdlcTi8IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50160420"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="50160420"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 16:11:49 -0700
X-CSE-ConnectionGUID: Sa8eLf7ISWeojygPBmGlHQ==
X-CSE-MsgGUID: MV45BkRGRxSOjpMi5PDw4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="146204845"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 May 2025 16:11:48 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIbYI-0001Zq-1R;
	Fri, 23 May 2025 23:11:46 +0000
Date: Sat, 24 May 2025 07:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9783/10774] LLVM ERROR: Broken module found,
 compilation aborted!
Message-ID: <202505240723.w2bmqdZw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "clang compiler bug"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

TO: Alexander Potapenko <glider@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   484803582c77061b470ac64a634f25f89715be3f
commit: b4d5e1f39f5000a98cadb70ebf698a40b6602a75 [9783/10774] kmsan: rework kmsan_in_runtime() handling in kmsan_report()
:::::: branch date: 9 days ago
:::::: commit date: 13 days ago
config: x86_64-buildonly-randconfig-2001-20250524 (https://download.01.org/0day-ci/archive/20250524/202505240723.w2bmqdZw-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240723.w2bmqdZw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505240723.w2bmqdZw-lkp@intel.com/

All errors (new ones prefixed by >>):

   inlinable function call in a function with debug info must have a !dbg location
     call void @__msan_warning(i32 %437) #21
   inlinable function call in a function with debug info must have a !dbg location
     call void @__msan_warning(i32 %446) #21
   inlinable function call in a function with debug info must have a !dbg location
     call void @__msan_warning(i32 %243) #17
>> LLVM ERROR: Broken module found, compilation aborted!
>> PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
   Stack dump:
   0.	Running pass "verify" on module "vmlinux.a(nct6775-core.o at 1388754)"
>> LLVM ERROR: Broken module found, compilation aborted!
   /bin/bash: line 1: 2607516 Aborted                 ld.lld -m elf_x86_64 -mllvm -import-instr-limit=5 --lto-basic-block-address-map -z noexecstack -r -o vmlinux.o -T .tmp_initcalls.lds --whole-archive vmlinux.a --no-whole-archive --start-group --end-group

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
