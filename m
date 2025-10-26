Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404481A0BD0
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 06:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761460663; cv=none; b=U1x5aqFy4oIm9eeEQk6Zm2OngPmv4SgUROnUvvJd8C9cu9bzCHp8kVLyIVozoOIJmukKX/+N7mGjKCuHvyLwzhqPfE6Q2oQ73L0JTxMAI09Xs0xAYM0NRJJ+N9G7pqCyvb+epkcY/RIfeuHPkizuIJvfWMiQJyem2angp3dkAtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761460663; c=relaxed/simple;
	bh=iASpFHfryDi++twElakVsKBEPt31t/aMA1XjYEqiY2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cgzS1wtnrf4NJLhh7E4GvI82h/FWZSS7wA46L7Yr5yoSfy5LaoBmxIntzBeBOGo9BHSgG6xaWPbpnkTnOkVHOIlYb837fu5RNlBQw5sv2gNy6A+eF2NQDE1DcCVgvOkqI3gGj6Agm47AW85u1kRdyAK40Tsfk2JMuL5429z4xZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RI1Ugv4R; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RI1Ugv4R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761460661; x=1792996661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iASpFHfryDi++twElakVsKBEPt31t/aMA1XjYEqiY2g=;
  b=RI1Ugv4RuyaVRJBgJ2exdde6u8zBDYncar+2nBMMi73mE+XGF/F+bE1W
   Kfmkff67bpiawXTIK8Cm5xvTz58VgMU0TAezuN49KNBryENEeGMWdwscs
   xelBDW/M11Yf/jsHZ1xjGzJIfII43bjwcvkPOLtzdIa4MoWiv53jgjC+D
   qvI6mh9RJbxFl/dppPw4BBfJODlvsGbhZ7DBki7Nouz+39T7JVUPMXdlg
   NB+BQBN7/xs0UiDK8qyujmmujLQYr8GaP/960iGcTxUzzIcTEiNF1biw+
   QbcfogLpc9BXvNtqtTQ4LxyGjSDzGBvkKzDJEEY372y+qhrplsYSqs8as
   Q==;
X-CSE-ConnectionGUID: AWnH60BHSJiEOuQGebyrCg==
X-CSE-MsgGUID: uHxEGSt5TE6ZQBuZjNoylA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89047485"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="89047485"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 23:37:40 -0700
X-CSE-ConnectionGUID: pJDxQI+NRpGvE0qSAQPBnQ==
X-CSE-MsgGUID: GO36Vr+mShu8tsOlhuakuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="183982613"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 Oct 2025 23:37:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCuNl-000Fvt-1U;
	Sun, 26 Oct 2025 06:37:37 +0000
Date: Sun, 26 Oct 2025 14:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-kminext 1/1] mremap_test.c:387:45:
 warning: 'dest_preamble_addr' may be used uninitialized
Message-ID: <202510261419.U7q1YjTa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   8979fee435bfd762771c71f3cf99f6f279038337
commit: 54dba9d5ae94c7df8662b6b3a09471beb342aecc [1/1] selftests/mm: build with -O2
:::::: branch date: 3 days ago
:::::: commit date: 8 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251026/202510261419.U7q1YjTa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261419.U7q1YjTa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510261419.U7q1YjTa-lkp@intel.com/

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
