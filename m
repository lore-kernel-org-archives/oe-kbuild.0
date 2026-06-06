Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D8219644B
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jun 2026 01:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780708533; cv=none; b=sYyKx4sUdIsp4OWmwtLzzlQUnwgMkcnETBdTsD6AkMmK8SQM9MBXw5xYbeRwDPiO/BXbDk+1VR9sWlX1Clb2EYqB1gGLqI5obKzanBGtU94ojs0VTM4QHZ7vcgm6RQolA+ZOBkkw0UVSJM51qlInWqdQUTkurReR4LbBqJ6fhzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780708533; c=relaxed/simple;
	bh=O0/Xt138AB1GhuEZ0ugeuEVg7LFAm8ageMKGGEx3puE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iM2C+W2SjFVwqvHqm7c1NaacZHtWipq5bFsBeDOx3f6O/T/pjS1sBuB5QjSAV5egSQcSo3UvDDnyReZkHVxClhcq9ZIRBHR7K+gOAjrCB0lZLHXysS0e3BWsBOXqm33c46LVMZDtgk05YRvKVpcQ+IsrgbLWfleBsTqQ8U8dAO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHx3aovF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHx3aovF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780708532; x=1812244532;
  h=date:from:to:cc:subject:message-id;
  bh=O0/Xt138AB1GhuEZ0ugeuEVg7LFAm8ageMKGGEx3puE=;
  b=lHx3aovFBaxy1WzFslv7YyPb0xMRFSYSsqviTlf3VEY+g1bQ4B2sNVxI
   9+7kxPNldV04YMtS02bG+Ok6aIZlwV1Q/ikm2bf/tOqvrgkV3yDuIZl3X
   8XY5S3CXQJiK/Xuedr1EgA1lwmrQmR4UbJoXt74kCPN1UF6lRjrbMIoC/
   /jJRNepLUGPmKba1+3DIifItABlscOt544LbseKfqSF76VIRk/mqjjy0H
   W2vrKqKUsIa2sZSSgNodjmT/XaTFpE7Bq0DqZZQbhiI3VL0OOpPMBOGe2
   dGJGhkFYnDhKRkJA8+4ikirkjJbO87zpkDep/gTjZDfIF5+tN+TcVys3J
   w==;
X-CSE-ConnectionGUID: EOwxoXllQa2++IukzOKNnw==
X-CSE-MsgGUID: yvHfT5yVQ1COGdJKA6FkdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="106982386"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="106982386"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 18:15:29 -0700
X-CSE-ConnectionGUID: Bub1an8dRAGQbTYcg66beg==
X-CSE-MsgGUID: HAagKjo3QQSCupHbXiO37w==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 05 Jun 2026 18:15:28 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVfdG-000000002ij-29bN;
	Sat, 06 Jun 2026 01:15:26 +0000
Date: Sat, 06 Jun 2026 03:14:28 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 8/8] mremap_test.c:387:45:
 warning: 'dest_preamble_addr' may be used uninitialized
Message-ID: <202606060323.LhmxMFN1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Kevin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   468e09dd6f52610d73a09cbbb28a2e7d4b940431
commit: 54dba9d5ae94c7df8662b6b3a09471beb342aecc [8/8] selftests/mm: build with -O2
:::::: branch date: 5 hours ago
:::::: commit date: 1 year, 3 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260606/202606060323.LhmxMFN1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606060323.LhmxMFN1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606060323.LhmxMFN1-lkp@intel.com/

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
