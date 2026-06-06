Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D65D2264D6
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jun 2026 05:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780723715; cv=none; b=s8LDDfVAgy1zXNOnpFG9lH5VZGYVzoQ8eh0Q48tjshrrQLGhg3bGbe9dQ1akCFRzwyGxfxwvzVvtutbIEVU+FmA+wW1qJFfNcifpztAYCRXkNGEyRGitjCNqqZMt6uILgAHHi0SLKOczAA5qRPnghEze+xm60hW8xr9bC9U3BM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780723715; c=relaxed/simple;
	bh=kOEIapIfgnMoD3GxTazhKI2OB/5YGahtt+F3OT3kq98=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uOKpuop+XhMfTgMRp87MRr1r91n9VElRNj7BgGRHqXvTEZ4l+SOILafkl0/Q4WCLnP9oG7lk0p1Udn+Dc/6knRNWLwsgW3wrqHW9Pza991DRFAF7mvdE0qlzGpTJY8aVqpyZBwrLb+yCzfU3ZwCOWMoHA5IwNgx88OY1A0knIVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNn6MrjR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNn6MrjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780723713; x=1812259713;
  h=date:from:to:cc:subject:message-id;
  bh=kOEIapIfgnMoD3GxTazhKI2OB/5YGahtt+F3OT3kq98=;
  b=LNn6MrjRBXWJJ3/kGoU0wQPe6vFVgi7fsNrlJcpIXo34UvSR4NDgIGjV
   H744dZjO/m49VLQ8DUSxY/21BzO/yXGXWJQKb9pmA+0so5/BmDw61gp8G
   UmeGqyXP/6CfJivJXKqSxQolvsBYm1U6k49U3fWaICHqU6u4C618lNLkB
   I3yhuNkta4QyXdv4u9lKvPPwvazdN54AHulhdNorUi7p7MrmGcHMbO8ei
   YatbNZvSwbnp4beyc3wDPVf4jjZVgUOjg3zerRj1ZEDX1ZnnOy5tboO2G
   wA1tnhqsyHooeN2dLsEtafS1wcrPn5cDVNVFP0qTokO1ik4rzliZh0dSs
   Q==;
X-CSE-ConnectionGUID: 2JCF+8i4QMinuTYhRMTFow==
X-CSE-MsgGUID: RUKBV58sRTWkh8BXDW3e2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81459513"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="81459513"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 22:28:32 -0700
X-CSE-ConnectionGUID: VfdG92xRTBCwS6Slu2Fkhg==
X-CSE-MsgGUID: tVGb2X6TRXWP7aXSarjBaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="242039776"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jun 2026 22:28:31 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVja9-000000002lh-1XAG;
	Sat, 06 Jun 2026 05:28:29 +0000
Date: Sat, 06 Jun 2026 07:28:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Makefile.kvm:259: ../liveupdate/lib/libliveupdate.mk: No
 such file or directory
Message-ID: <202606060753.Uvds64Tt-lkp@intel.com>
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
TO: Tarun Sahu <tarunsahu@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tarun-Sahu/liveupdate-Add-LIVEUPDATE_GUEST_MEMFD-config-option/20260606-020940
head:   8037e26f294cd22869061fc9205155edd51082d8
commit: 8037e26f294cd22869061fc9205155edd51082d8 selftests: kvm: Add guest_memfd_preservation_test
date:   11 hours ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260606/202606060753.Uvds64Tt-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606060753.Uvds64Tt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606060753.Uvds64Tt-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[1]: *** [../../lib.mk:225: tools/testing/selftests/drivers/net/psp_responder] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** [Makefile:124: tools/testing/selftests/hid/host-tools/sbin/bpftool] Error 2
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets.  Stop.
>> Makefile.kvm:259: ../liveupdate/lib/libliveupdate.mk: No such file or directory
   make[1]: *** No rule to make target '../liveupdate/lib/libliveupdate.mk'.
   Makefile.kvm:259: Failed to remake makefile '../liveupdate/lib/libliveupdate.mk'.
   make[1]: *** [../lib.mk:225: tools/testing/selftests/net/busy_poller] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/net/tun] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets specified and no makefile found.  Stop.
   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/proc-loadavg-001] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/proc-pid-vm] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/proc-tid0] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/setns-dcache] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/setns-sysvipc] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/thread-self] Error 1
   make[1]: Target 'all' not remade because of errors.
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
   make[1]: *** [Makefile:63: tools/testing/selftests/rseq/param_test_mm_cid_compare_twice] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
