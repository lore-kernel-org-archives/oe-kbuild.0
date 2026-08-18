Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F981EB19B
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Aug 2026 04:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787027749; cv=none; b=KNcsmbp/i621VQiJmurKSIOXuyHvxnMntMU3jQ8kBaACMuXlK542UYXvr54tdFo8bSW/OXb2LZ0KZ2bdq0kfuds8goInM8vNWxCTJT6e4ABNMoOszUn5DZnV4MxWFI2iV25X1t9aZacwNBdXlxqewnZqoTtfO8TyWPIcA0aa20M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787027749; c=relaxed/simple;
	bh=2qyE1rOPisf+dCezYveqLULfxWGZkJZWIXT+ASpoWhc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=efq5PuTqDasy3SJ+dr2BThIMIULrW4j8TgkGmREC/GR3ZcqwSq6stcq2xkDMxWY99lNsM42CxbN78DIY3IGcL4Vq/Essv6jbWm8n44ITK24BFGi50iqNamvAqrmfGWa+RekjTtmolYFNkgRToJjC2edC61WdkfBCwWat3KU8jUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BG8plsVx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BG8plsVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787027748; x=1818563748;
  h=date:from:to:cc:subject:message-id;
  bh=2qyE1rOPisf+dCezYveqLULfxWGZkJZWIXT+ASpoWhc=;
  b=BG8plsVxjGAMOJ3A3RCUrXA7vUYRwRp91CsLOrNL4aV0fXZo8ip6RuO9
   pYkuEPczF6f/x0Z67CxNczgqNj7zGlNZGZWrvHFdvkw0yuBL8xT9yARDQ
   j179+NuFnEfOJTKlDldrm3NvcTLAevnUhYszL7upjsi9K3fIbuPhn5+kv
   pKntBd+niM3kE9A3/ZfD/+QEEaGf4XNkqR8IsZYfHaADB5GDmddzciC1a
   O3BMZp6pXwAe21p5B5U/zh9kfx8ZmlI4Qp9LvhmLZySNf7oki4ofjZQC9
   IXIXIhAxqLt7nSV0FRZCcrwfqX1McocxaGwlwrnpq1btZUox0ZomqoHYh
   Q==;
X-CSE-ConnectionGUID: 8zYkK5hVTK+N/ettZjTJ+w==
X-CSE-MsgGUID: LkJQIC9HQIiJ/leO11jw2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87365407"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87365407"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 21:35:48 -0700
X-CSE-ConnectionGUID: joalpjJ4RueeksGpH4Vk0g==
X-CSE-MsgGUID: 8bF0lsmUQTG1XYPw2N3qbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="265728788"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 17 Aug 2026 21:35:47 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwBY7-0000000072f-2P9N;
	Tue, 18 Aug 2026 04:35:43 +0000
Date: Tue, 18 Aug 2026 06:35:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Makefile.kvm:264: ../liveupdate/lib/libliveupdate.mk: No
 such file or directory
Message-ID: <202608180640.DZDS3wCN-lkp@intel.com>
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

tree:   https://github.com/intel-lab-lkp/linux/commits/Tarun-Sahu/liveupdate-Add-LIVEUPDATE_GUEST_MEMFD-config-option/20260813-150657
head:   adff701e1834c266f6e24dc94c144ebb9561c97c
commit: adff701e1834c266f6e24dc94c144ebb9561c97c KVM: selftests: Add guest_memfd_preservation_test
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260818/202608180640.DZDS3wCN-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608180640.DZDS3wCN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608180640.DZDS3wCN-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[1]: *** [../../lib.mk:225: tools/testing/selftests/drivers/net/psp_responder] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** [Makefile:124: tools/testing/selftests/hid/host-tools/sbin/bpftool] Error 2
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets.  Stop.
>> Makefile.kvm:264: ../liveupdate/lib/libliveupdate.mk: No such file or directory
>> make[1]: *** No rule to make target '../liveupdate/lib/libliveupdate.mk'.
   Makefile.kvm:264: Failed to remake makefile '../liveupdate/lib/libliveupdate.mk'.
   make[1]: *** [../lib.mk:225: tools/testing/selftests/net/busy_poller] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/net/tun] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets specified and no makefile found.  Stop.
   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
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
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
