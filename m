Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0275A42A99
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Sep 2024 05:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725687937; cv=none; b=QVn3PTKtamZS/eSfPpc7T1ZT7COylXWCrpbTB3yvDHTWucOO3tAAZVVOFT1mkvjhBQJdl/0WJIbG9B5iaUAxgQfvZJuixTL0cKUiPSdl5rj/RtzOOpnsqZCZI1kUAquPOnlRgyW7Q+CpQp4eqCfBO4r+vNuW9D+go4NoIjYrg40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725687937; c=relaxed/simple;
	bh=7D+5ETPPAECQGBFaRn4Ag48SasvpuY/HnMP+5I6GPzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmEz1PpkEfYdZtEo4PpjZ5NFygfTmLIOmcfTRSPBMS2NAUqyMP9Jz2kpKgtcinHenUWKAs4k2l2uYbRjvLcPLrHGm5clAxsszo/yR7OibERR8r7SqduVQFr/QsyDnsZ0YQkPO+U0DfeM+Y2lWBz0WUEaSQOztgWjGKz+LYjfE7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lm+dOS2y; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lm+dOS2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725687935; x=1757223935;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7D+5ETPPAECQGBFaRn4Ag48SasvpuY/HnMP+5I6GPzU=;
  b=Lm+dOS2y4O2SmBlgJfjrojE1tyKIFlTX5I/didnph8WWRkQm7Oga5Tz7
   vyWDOCvTiN+8LM+ik7k2JsFwD/WxgdZW/ThHiNdYkt5eXiangH6thR2oK
   Dd9ThzZiLgcs35rW92O3pZ47jY1EUSnO6HJHvgdDup79cVRP1mNxIF1yc
   m7c3PGj4ReXpccJwLjg5lrM1VmCSl+JH7KWc0Z9tfu0O9HuUbV1VZLCqG
   vxoS2Rsd1KyR6exUvs5pAl+od93ItwFamISrAx5YP6o/k4kQShAvpF2+5
   +b1gPFjswOovaAL9QOdHSoia3aZ3rcvNPSWuRr1wut0PpyvRX8aQKcrSj
   g==;
X-CSE-ConnectionGUID: r1vdQfZTT7mc2VTESXdAVQ==
X-CSE-MsgGUID: 8k++MXwHRq6AHNrQSzg5WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23956106"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="23956106"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 22:45:30 -0700
X-CSE-ConnectionGUID: 1Ws2HNo1T9mLbKJ3uwCxJA==
X-CSE-MsgGUID: WUMw06byTiy3mRMUtz+AUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="96859851"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Sep 2024 22:45:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smoGF-000C9Z-0V;
	Sat, 07 Sep 2024 05:45:27 +0000
Date: Sat, 7 Sep 2024 13:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] selftests/futex: Create test for robust list
Message-ID: <202409071354.clW9RcwR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240903134033.816500-1-andrealmeid@igalia.com>
References: <20240903134033.816500-1-andrealmeid@igalia.com>
TO: "André Almeida" <andrealmeid@igalia.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Ingo Molnar <mingo@redhat.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Darren Hart <dvhart@infradead.org>
TO: Davidlohr Bueso <dave@stgolabs.net>
TO: Shuah Khan <skhan@linuxfoundation.org>
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: kernel-dev@igalia.com
CC: "André Almeida" <andrealmeid@igalia.com>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[also build test WARNING on linus/master v6.11-rc6 next-20240906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/selftests-futex-Create-test-for-robust-list/20240903-214428
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20240903134033.816500-1-andrealmeid%40igalia.com
patch subject: [PATCH v2] selftests/futex: Create test for robust list
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071354.clW9RcwR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409071354.clW9RcwR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> robust_list.c:117:44: warning: passing 'int *' to parameter of type 'unsigned int *' converts between pointers to integer types with different sign [-Wpointer-sign]
     117 |         if (atomic_compare_exchange_strong(futex, &zero, tid)) {
         |                                                   ^~~~~
   /opt/cross/clang-617a15a9ea/lib/clang/18/include/stdatomic.h:144:112: note: expanded from macro 'atomic_compare_exchange_strong'
     144 | #define atomic_compare_exchange_strong(object, expected, desired) __c11_atomic_compare_exchange_strong(object, expected, desired, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST)
         |                                                                                                                ^~~~~~~~
   1 warning generated.


vim +117 tools/testing/selftests/futex/functional/robust_list.c

32807b4449f353 André Almeida 2024-09-03  101  
32807b4449f353 André Almeida 2024-09-03  102  /*
32807b4449f353 André Almeida 2024-09-03  103   * A basic (and incomplete) mutex lock function with robustness
32807b4449f353 André Almeida 2024-09-03  104   */
32807b4449f353 André Almeida 2024-09-03  105  static int mutex_lock(struct lock_struct *lock, struct robust_list_head *head, bool error_inject)
32807b4449f353 André Almeida 2024-09-03  106  {
32807b4449f353 André Almeida 2024-09-03  107  	_Atomic(unsigned int) *futex = &lock->futex;
32807b4449f353 André Almeida 2024-09-03  108  	int zero = 0, ret = -1;
32807b4449f353 André Almeida 2024-09-03  109  	pid_t tid = gettid();
32807b4449f353 André Almeida 2024-09-03  110  
32807b4449f353 André Almeida 2024-09-03  111  	/*
32807b4449f353 André Almeida 2024-09-03  112  	 * Set list_op_pending before starting the lock, so the kernel can catch
32807b4449f353 André Almeida 2024-09-03  113  	 * the case where the thread died during the lock operation
32807b4449f353 André Almeida 2024-09-03  114  	 */
32807b4449f353 André Almeida 2024-09-03  115  	head->list_op_pending = &lock->list;
32807b4449f353 André Almeida 2024-09-03  116  
32807b4449f353 André Almeida 2024-09-03 @117  	if (atomic_compare_exchange_strong(futex, &zero, tid)) {
32807b4449f353 André Almeida 2024-09-03  118  		/*
32807b4449f353 André Almeida 2024-09-03  119  		 * We took the lock, insert it in the robust list
32807b4449f353 André Almeida 2024-09-03  120  		 */
32807b4449f353 André Almeida 2024-09-03  121  		struct robust_list *list = &head->list;
32807b4449f353 André Almeida 2024-09-03  122  
32807b4449f353 André Almeida 2024-09-03  123  		/* Error injection to test list_op_pending */
32807b4449f353 André Almeida 2024-09-03  124  		if (error_inject)
32807b4449f353 André Almeida 2024-09-03  125  			return 0;
32807b4449f353 André Almeida 2024-09-03  126  
32807b4449f353 André Almeida 2024-09-03  127  		while (list->next != &head->list)
32807b4449f353 André Almeida 2024-09-03  128  			list = list->next;
32807b4449f353 André Almeida 2024-09-03  129  
32807b4449f353 André Almeida 2024-09-03  130  		list->next = &lock->list;
32807b4449f353 André Almeida 2024-09-03  131  		lock->list.next = &head->list;
32807b4449f353 André Almeida 2024-09-03  132  
32807b4449f353 André Almeida 2024-09-03  133  		ret = 0;
32807b4449f353 André Almeida 2024-09-03  134  	} else {
32807b4449f353 André Almeida 2024-09-03  135  		/*
32807b4449f353 André Almeida 2024-09-03  136  		 * We didn't take the lock, wait until the owner wakes (or dies)
32807b4449f353 André Almeida 2024-09-03  137  		 */
32807b4449f353 André Almeida 2024-09-03  138  		struct timespec to;
32807b4449f353 André Almeida 2024-09-03  139  
32807b4449f353 André Almeida 2024-09-03  140  		clock_gettime(CLOCK_MONOTONIC, &to);
32807b4449f353 André Almeida 2024-09-03  141  		to.tv_sec = to.tv_sec + FUTEX_TIMEOUT;
32807b4449f353 André Almeida 2024-09-03  142  
32807b4449f353 André Almeida 2024-09-03  143  		tid = atomic_load(futex);
32807b4449f353 André Almeida 2024-09-03  144  		/* Kernel ignores futexes without the waiters flag */
32807b4449f353 André Almeida 2024-09-03  145  		tid |= FUTEX_WAITERS;
32807b4449f353 André Almeida 2024-09-03  146  		atomic_store(futex, tid);
32807b4449f353 André Almeida 2024-09-03  147  
32807b4449f353 André Almeida 2024-09-03  148  		ret = futex_wait((futex_t *) futex, tid, &to, 0);
32807b4449f353 André Almeida 2024-09-03  149  
32807b4449f353 André Almeida 2024-09-03  150  		/*
32807b4449f353 André Almeida 2024-09-03  151  		 * A real mutex_lock() implementation would loop here to finally
32807b4449f353 André Almeida 2024-09-03  152  		 * take the lock. We don't care about that, so we stop here.
32807b4449f353 André Almeida 2024-09-03  153  		 */
32807b4449f353 André Almeida 2024-09-03  154  	}
32807b4449f353 André Almeida 2024-09-03  155  
32807b4449f353 André Almeida 2024-09-03  156  	head->list_op_pending = NULL;
32807b4449f353 André Almeida 2024-09-03  157  
32807b4449f353 André Almeida 2024-09-03  158  	return ret;
32807b4449f353 André Almeida 2024-09-03  159  }
32807b4449f353 André Almeida 2024-09-03  160  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
