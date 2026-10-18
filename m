Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E1C443C31
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 07:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309972; cv=none; b=PphJmkAOWyYqwXIE3SUIcBqC/XoRJ6cDpS33kj6BGsGCq9pwSlFAKqkCCurCVBQ8cGr9oEqKo/NswKa7/PaksjfsGl82O+/njPXk/32HBUWBKD73acnSR17BeP3LNEm+4XrMDecj4iE/9wO8zm70T8zTUcj0Te2Pyz4ZQ6OuZOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309972; c=relaxed/simple;
	bh=JnxqoOOntdUm0CU91Kr3jwagssafEEY1OQLSWGYXyhw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QqJnLZGulJEqNiVENmxHIgABdA8CPDk8Pc3GCGWdLXT6uR2eD9awEF+h6WrvDEoIUTv8puxav5vZfcMJlt3iJHkEpdMefDwfFr8Gn9msESHvk+JqB14viyYxEp3WvQppDKGDvc7/hOW0LBlEC5ijtwA1iPjLjHvF+wpFLJUjYe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSvKfwDj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSvKfwDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309971; x=1823845971;
  h=date:from:to:cc:subject:message-id;
  bh=JnxqoOOntdUm0CU91Kr3jwagssafEEY1OQLSWGYXyhw=;
  b=GSvKfwDj8KR/s7IzyMafYr2PkQlY7lV0s6S6L/6+5Tp0mLJFzd4kj/Tq
   50L1B8Ff0GWtghVn3s8rzoKhD6T0LPtoCRlmkwgPPgsRVuSclG5z8h5Bj
   b5eKjADTfY6kQv4vG9UB+qRdTJEQq7qe251WG68cYFPHbkYd9eXYzRA/+
   i4wrMbZRKrM2ou9sS9XqKYFBlLe84yCeqmZMotfRACYiVVJ9qKuNmwpIS
   M1vrcjPUmVzeeXXGWIkgQbQb8dIEZQARhdIayuIOX1jEBs3L4AKjp1QQF
   b/wE6iETzqReQ+pkPRV4kUtvhJJ/XPBiNapC5h4neEJP8uEfafC/IDmlY
   g==;
X-CSE-ConnectionGUID: fM2uuIZURdCJBXw3b4MR1w==
X-CSE-MsgGUID: BeY4nrf0RQu3XghD4yb7Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916696"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916696"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:39 -0700
X-CSE-ConnectionGUID: dCfocVbfRJeyRpmGec30tw==
X-CSE-MsgGUID: ffGk3vZCR1WPIiX34aJQCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340807"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:35 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004xZ-0kx2;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:46:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mszeredi-fuse:for-next 29/52] make[1]: *** No rule to make
 target 'fuse_symlink_cache_test.c', needed by
 'tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test'.
Message-ID: <202610170822.oEJ1Autq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: fuse-devel@lists.sourceforge.net
TO: Luis Henriques <luis@igalia.com>
CC: Miklos Szeredi <mszeredi@redhat.com>
CC: Amir Goldstein <amir73il@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
head:   4dd8d396740168f5379f332ad2c165d7f0f91953
commit: 3e14f079d7a0af6308072d530dc45795ab437be1 [29/52] selftests/fuse: add fuse symlink caching test
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261017/202610170822.oEJ1Autq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610170822.oEJ1Autq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610170822.oEJ1Autq-lkp@intel.com/

Note: the mszeredi-fuse/for-next HEAD 4dd8d396740168f5379f332ad2c165d7f0f91953 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   make[1]: *** No rule to make target 'tools/testing/selftests/filesystems/fuse/test_syncfs', needed by 'all'.
>> make[1]: *** No rule to make target 'fuse_symlink_cache_test.c', needed by 'tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test'.
   make[1]: *** [../../lib.mk:225: tools/testing/selftests/filesystems/fuse/fuse_mnt] Error 1
   make[1]: *** [../../lib.mk:225: tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test] Error 1
   make[1]: *** [../../lib.mk:225: tools/testing/selftests/filesystems/fuse/fusectl_test] Error 1
   make[1]: *** [../../lib.mk:225: tools/testing/selftests/filesystems/fuse/write_extend_eof_test] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** [Makefile:117: tools/testing/selftests/hid/tools/sbin/bpftool] Error 2
   make[1]: Target 'all' not remade because of errors.
   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets specified and no makefile found.  Stop.
   make[1]: Circular tools/testing/selftests/rseq/param_test <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_compare_twice <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_compare_twice <- tools/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid <- tools/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid <- tools/testing/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid_compare_twice <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid_compare_twice <- tools/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid_compare_twice <- tools/testing/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid_compare_twice <- tools/testing/selftests/rseq/param_test_mm_cid_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/syscall_errors_test <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/syscall_errors_test <- tools/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/syscall_errors_test <- tools/testing/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/syscall_errors_test <- tools/testing/selftests/rseq/param_test_mm_cid_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/syscall_errors_test <- tools/testing/selftests/rseq/syscall_errors_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/testing/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/testing/selftests/rseq/param_test_mm_cid_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/testing/selftests/rseq/syscall_errors_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/testing/selftests/rseq/legacy_check dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testing/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testing/selftests/rseq/param_test_mm_cid_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testing/selftests/rseq/syscall_errors_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testing/selftests/rseq/legacy_check dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testing/selftests/rseq/slice_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/testing/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/testing/selftests/rseq/param_test_mm_cid_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/testing/selftests/rseq/syscall_errors_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/testing/selftests/rseq/legacy_check dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/testing/selftests/rseq/slice_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/testing/selftests/rseq/check_optimized dependency dropped.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
