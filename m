Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290ADA937
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 22:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765492076; cv=none; b=BgHEz5Khasn5dmM/KtgS01qfbcw0kSpUF2Go0iDEe3Bh1cXzQJJtoOThe3EFZneBFwUkJgwc2SOxCgeH1OabUFPvv3FvC9pVISwzO5t66TnAVdB2YBgO1pIIL+892Lj6obILdTqM2FEESywMsEgzSG0WwwOZAZiAEfo4AEw3qtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765492076; c=relaxed/simple;
	bh=HoENdjGG/2/4rnuHTRe2P79Za0FpwPt3e+ub8LqT9Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YykzXPX2EjFwwU3mJ9FmQt27/HmFW05c9m0xeDZSSylY3VGQ8JhLu5HhepPjHAU3V1PHec9XNyoYhQV0s/FgDCZJz0w3QibZXH1gQhCaDpr3hb4gopy+ggF3OqfZPHMv0zBwYnQAh9AVjAOy9aajc4lStUdGzv3kjr3HJMHGbRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXHp6tXg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXHp6tXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765492074; x=1797028074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HoENdjGG/2/4rnuHTRe2P79Za0FpwPt3e+ub8LqT9Ys=;
  b=fXHp6tXgyf2yMMpPZV2cfrqf2LAhW+cuDTeNvRP+ugPcQKKUY3m3d+Qd
   ko3PHBmR/2bezSs5iHT7pmpML9RAKqhYv3dvyllJK8yd018GNaES2FhYV
   ZjG6mjuBreDykb4rZUjlQ0se9fX773V/hvNiNjR6gE3tpNXk328C4dFlK
   c9WtO7mJd0XKGJQLyoeGmAInff84J/5r6zXzY/xw7Xuxedc/uasEjPpkb
   s0db96KlZ0Kl0tKxwPBjp3TEgROKFppqlMaWTQlLupUOexgsMhCaruTuh
   XNk1qUBI6zZf6gNIlYxZDF0EpfnoAOVhybl0atpll1vvWblU31YrewNvR
   g==;
X-CSE-ConnectionGUID: 4whcw8HSRUmzrNWCVCT64A==
X-CSE-MsgGUID: ocvYTuBiSweGBvMb5DmhQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71330434"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71330434"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 14:27:53 -0800
X-CSE-ConnectionGUID: 8f4uIxwYQkerdMwNUuFMtg==
X-CSE-MsgGUID: LtYTSeSxSAG0R8K+Kr2A9A==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 11 Dec 2025 14:27:53 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTp8Y-000000001D2-286E;
	Thu, 11 Dec 2025 22:27:50 +0000
Date: Thu, 11 Dec 2025 23:26:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.12/emt 9/9] mremap_test.c:387:45: warning:
 'dest_preamble_addr' may be used uninitialized
Message-ID: <202512112330.JWem6s6s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   aac28a88afc1d68448c7e5672fed4da83e10fe8b
commit: 54dba9d5ae94c7df8662b6b3a09471beb342aecc [9/9] selftests/mm: build with -O2
:::::: branch date: 10 days ago
:::::: commit date: 10 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512112330.JWem6s6s-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112330.JWem6s6s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512112330.JWem6s6s-lkp@intel.com/

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
   soft-dirty.c: In function 'test_mprotect':
>> soft-dirty.c:177:17: warning: 'test_fd' may be used uninitialized [-Wmaybe-uninitialized]
     177 |                 close(test_fd);
         |                 ^~~~~~~~~~~~~~
   soft-dirty.c:131:13: note: 'test_fd' was declared here
     131 |         int test_fd;
         |             ^~~~~~~
--
   write_to_hugetlbfs.c: In function 'main':
>> write_to_hugetlbfs.c:92:25: warning: 'strncpy' specified bound 256 equals destination size [-Wstringop-truncation]
      92 |                         strncpy(path, optarg, sizeof(path));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
