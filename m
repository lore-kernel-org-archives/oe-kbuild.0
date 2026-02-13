Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1BD27FD45
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Feb 2026 22:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771021495; cv=none; b=btWlfH3LLl60osPzzVFPIA0yv9yqRdCCRh7BFPlpi+NrAwBq89A2+IgmiRAel4veOPxCaiAkrC0xOB7G5tnB/AnlyGENYll3FtmLVbEqFhSgIhrFE5OWJShxjlp+ldIq68GYrpi1xMcNW3N0cFfPUJdW/iHaUpD+Xe7sGPpgaz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771021495; c=relaxed/simple;
	bh=XGqFlp4z7t34bI+nwuWgztRMq0qt+ljqITTu0f3jKGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k/XOg6YCPd0fMVE+IIF1qIN4uoo9fCY84IgpHWQndPkyv7iiGBpqadRlPDhdu0UXMyikgc4iCdyGIDkXCIpeVzQnbPBM8nAIfr0PJcy3PLOtLBCgbdrQ4aBAl5BJjTAcBemFSN8Op0C5dpBcAh5z06nB4caPfwRpo8fi0mW3t/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F02Z8uxp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F02Z8uxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771021493; x=1802557493;
  h=date:from:to:cc:subject:message-id;
  bh=XGqFlp4z7t34bI+nwuWgztRMq0qt+ljqITTu0f3jKGk=;
  b=F02Z8uxpKvLgvHGlBqumcCYFWZF7jDzzy7CkZYcOC4FYxUzZG7JDGtr3
   iMgYly9ddMlZ+PQpG3a4Xq8IHNPHx3pzd2cE6YyXGzQXLqdSC8C24CxFC
   V2rTnmbirlDvA+HblBLIlWLtQxc3wr0mmIOzWbn44KFU3uonA2XXhrGvE
   9cBvRntR7R8s8WIqa5tr0yFaOUzFfy0A+X40wXuL5WrEBulhPiNz+XwVe
   0ogdfDxwyyGNIm92hFJoxmziWmuyl1GlK23FKCS5YtMjGLGdQ0XiatbcQ
   /97Qm0Y08B77/nFbh9kgP/nCGC1U4uNyxRp7ApNAg2BRdut82vQDGawtO
   A==;
X-CSE-ConnectionGUID: 3y2MVBiXTta47y9/yKn4pA==
X-CSE-MsgGUID: Mz2frqVUSCmtyKdB5QjPzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83653893"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="83653893"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 14:24:53 -0800
X-CSE-ConnectionGUID: tGfp1T7RSK6Kp1txMgirZQ==
X-CSE-MsgGUID: ZAvIiUZtQuuY326I3rmPpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212287943"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 13 Feb 2026 14:24:52 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr1aj-000000001hV-425Y;
	Fri, 13 Feb 2026 22:24:49 +0000
Date: Fri, 13 Feb 2026 23:24:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:mirror-poly-aosp-pixel-mbu 1/1]
 mremap_test.c:387:45: warning: 'dest_preamble_addr' may be used uninitialized
Message-ID: <202602132342.xqFI7oan-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Kevin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-mbu
head:   6edf3ba07207a117cb90e8ac84c475191d0d227d
commit: 54dba9d5ae94c7df8662b6b3a09471beb342aecc [1/1] selftests/mm: build with -O2
:::::: branch date: 9 days ago
:::::: commit date: 12 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260213/202602132342.xqFI7oan-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602132342.xqFI7oan-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602132342.xqFI7oan-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   mremap_test.c: In function 'run_mremap_test_case.isra':
>> mremap_test.c:387:45: warning: 'dest_preamble_addr' may be used uninitialized [-Wmaybe-uninitialized]
     387 |         void *addr, *src_addr, *dest_addr, *dest_preamble_addr;
         |                                             ^~~~~~~~~~~~~~~~~~
--
   uffd-unit-tests.c: In function 'uffd_move_test_common.isra':
>> uffd-unit-tests.c:1194:26: warning: 'orig_area_src' may be used uninitialized [-Wmaybe-uninitialized]
    1194 |                 area_src = orig_area_src;
         |                 ~~~~~~~~~^~~~~~~~~~~~~~~
   uffd-unit-tests.c:1125:15: note: 'orig_area_src' was declared here
    1125 |         char *orig_area_src, *orig_area_dst;
         |               ^~~~~~~~~~~~~
>> uffd-unit-tests.c:1195:26: warning: 'orig_area_dst' may be used uninitialized [-Wmaybe-uninitialized]
    1195 |                 area_dst = orig_area_dst;
         |                 ~~~~~~~~~^~~~~~~~~~~~~~~
   uffd-unit-tests.c:1125:31: note: 'orig_area_dst' was declared here
    1125 |         char *orig_area_src, *orig_area_dst;
         |                               ^~~~~~~~~~~~~
--
   ksm_tests.c: In function 'main':
>> ksm_tests.c:947:16: warning: 'ret' may be used uninitialized [-Wmaybe-uninitialized]
     947 |         return ret;
         |                ^~~
   ksm_tests.c:779:13: note: 'ret' was declared here
     779 |         int ret, opt;
         |             ^~~
--
   soft-dirty.c: In function 'test_mprotect':
>> soft-dirty.c:177:17: warning: 'test_fd' may be used uninitialized [-Wmaybe-uninitialized]
     177 |                 close(test_fd);
         |                 ^~~~~~~~~~~~~~
   soft-dirty.c:131:13: note: 'test_fd' was declared here
     131 |         int test_fd;
         |             ^~~~~~~
--
   pkey_sighandler_tests.c: In function 'thread_segv_with_pkey0_disabled':
>> pkey_sighandler_tests.c:119:9: warning: array subscript 0 is outside array bounds of 'int[0]' [-Warray-bounds=]
     119 |         *(int *) (0x1) = 1;
         |         ^~~~~~~~~~~~~~
   cc1: note: source object is likely at address zero
   In function 'thread_segv_maperr_ptr',
       inlined from 'test_sigsegv_handler_with_different_pkey_for_stack' at pkey_sighandler_tests.c:288:3:
   pkey_sighandler_tests.c:148:14: warning: array subscript 0 is outside array bounds of 'int[0]' [-Warray-bounds=]
     148 |         *bad = 1;
         |         ~~~~~^~~
   In function 'test_sigsegv_handler_with_different_pkey_for_stack':
   cc1: note: source object is likely at address zero
--
   write_to_hugetlbfs.c: In function 'main':
>> write_to_hugetlbfs.c:92:25: warning: 'strncpy' specified bound 256 equals destination size [-Wstringop-truncation]
      92 |                         strncpy(path, optarg, sizeof(path));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
