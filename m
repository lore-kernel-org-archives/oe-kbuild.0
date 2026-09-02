Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248EA3D47BF
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Sep 2026 16:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367252; cv=none; b=c7TNhUQe9t4XVF6GfPHCXHiqlxAcb8/PeHDefkGvJL/eDO8L9XrapamIXDqiqUuHe3mlVlwARjoaBR54sv3K7FTA6Hm4iufZ7HFUmERJ6QScLJPj2ZWrgBNo2WcM/EQTGHbbMmQVheYJiYUNPo+3r0rmcjZw21Z7fuOSCQwpQ2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367252; c=relaxed/simple;
	bh=ipWqUKQ2HZ/gCzTC4K8qx6qfw2f08OpO8SS/F8by77c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AQ0+mRw0AzwJkeaXCIqklH4YhYUSTEhwoaIGAeCwpk3CqIAvdyiTPfud8FFD43Qhv8CoeR3j7rnyUlTZFwOwvSi9Shauian2rEriWzPAqKKXI2PwVCws7VLLo6ypU8zT2UJZXpS+l/cG4IqMTlIfPZhitr3n+rIKQjAFvgdLiZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6FXJeV5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6FXJeV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788367250; x=1819903250;
  h=date:from:to:cc:subject:message-id;
  bh=ipWqUKQ2HZ/gCzTC4K8qx6qfw2f08OpO8SS/F8by77c=;
  b=T6FXJeV57UuiK5RAg/w3ND8EtzfkuKglXzXbZtWnnpNW5XmLXyrknNFC
   y0L+KGCMmZ6y4FcBNrTREwz0BQXheLjY4RCdG2Kwtfa463ODT2vR4bFrt
   HPRjLWWt2fqjIra58WxHUJ5a9mNdyvDFZ+gJRkwRWROdpuyHdUHKt8dSj
   m/eRNi6pp1lcox4iGKPhKlhFJyja0JRKlWxsc5c6HgqNTGBAsKqnDk76N
   4jOW170N2VabrxQE5DW5pX6b02570/2ykwceytzm1Mx6wyWcijnXdMid9
   PbLWczRC7C+EjrTva0DXiQvh07ia9kfqanadx4r97apc/rGZHgO2olM8o
   A==;
X-CSE-ConnectionGUID: 2yfxJC3bT/60D5VWKrw+zw==
X-CSE-MsgGUID: alIUXpAfRN+51dtx8vGO8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="114374597"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="114374597"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 09:40:49 -0700
X-CSE-ConnectionGUID: TQL9ED0SR/+FoUMGUalPdg==
X-CSE-MsgGUID: K29Hv0f6REmOPJ5NYMlk2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="294317485"
Received: from igk-lkp-server01.igk.intel.com (HELO 05545efcfdd3) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 02 Sep 2026 09:40:48 -0700
Received: from kbuild by 05545efcfdd3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1o10-000000000EF-2jN1;
	Wed, 02 Sep 2026 16:40:46 +0000
Date: Wed, 02 Sep 2026 18:40:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mszeredi-fuse:for-next 3/7] make[1]: *** No rule to make
 target 'tools/testing/selftests/filesystems/fuse/test_syncfs', needed by
 'all'.
Message-ID: <202609021808.5OxsIter-lkp@intel.com>
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
TO: Jimmy Zuber <jamz@amazon.com>
CC: Miklos Szeredi <mszeredi@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
head:   10bd6b32965265688fa277d166ab224de8e86eb2
commit: a6ca1a573e1fd9474c6226412fb743b4ef7e3472 [3/7] selftests/fuse: add test for FUSE_HAS_SYNCFS privilege gating
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260902/202609021808.5OxsIter-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609021808.5OxsIter-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609021808.5OxsIter-lkp@intel.com/

Note: the mszeredi-fuse/for-next HEAD 10bd6b32965265688fa277d166ab224de8e86eb2 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   make[1]: *** [../../lib.mk:225: tools/testing/selftests/drivers/net/psp_responder] Error 1
   make[1]: Target 'all' not remade because of errors.
>> make[1]: *** No rule to make target 'tools/testing/selftests/filesystems/fuse/test_syncfs', needed by 'all'.
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** [Makefile:117: tools/testing/selftests/hid/host-tools/sbin/bpftool] Error 2
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets.  Stop.
   make[1]: *** [../lib.mk:225: tools/testing/selftests/net/busy_poller] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/net/tun] Error 1
   make[1]: Target 'all' not remade because of errors.
   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/proc-loadavg-001] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/setns-sysvipc] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/setns-dcache] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/thread-self] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/proc-tid0] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/proc-pid-vm] Error 1
   make[1]: Target 'all' not remade because of errors.
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
   make[1]: *** [Makefile:67: tools/testing/selftests/rseq/param_test_mm_cid_compare_twice] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
