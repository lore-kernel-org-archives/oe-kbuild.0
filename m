Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2E814D28F
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Aug 2024 08:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725092334; cv=none; b=tdtp3ic258jrfHMU8IdSpq+Oxxa8HbpZHtU+cvG+byCjqRdqjG56DGyvJriq0EbBBhf1EQdAQT1lF8Q5s0lFOe/oUy7jbVj1ppZGyZ+tqAQFfXV209mE0JP+ZMtEjMuczdioTJyUrpEMmE2xQj+dYa8IlGjfThtLq81vw8e+zgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725092334; c=relaxed/simple;
	bh=dLMiOq36JeGMSEUgp7HDKV/Tc9ITSiPcQnpAsDt/WdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kmA529cTLUl6WSBRoySvw56fwLV0yi8Tc7pMhJKEtCVhwI9V2/esU/jfNEqIYyWfGuwsz9STmJ7anR4Zoql/V9oEciRv/5lb7XHuK2rzrpGg3oa4R4+/ZwlpkdwDXupMYyd0joVyxdz1qWM/gqMAwbuY5eRHQzl9M7NrX+OOjbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uq34WS8c; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uq34WS8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725092333; x=1756628333;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dLMiOq36JeGMSEUgp7HDKV/Tc9ITSiPcQnpAsDt/WdQ=;
  b=Uq34WS8cshperUVe4Qe7Up5+KTjVNWzkAn4q/JB49OblUgjW7vjdfB9f
   KCs1ZioJHlmN4yIhJYbtxxfl7gP2c2eYaOQXaNvGoM/GWLk476G1aCgTY
   x0tjo6lUEn8IJLznxL5hRUYN1GmJqF3C4LqUDwCuVpiRytU/WUd794KwY
   SbFCzhZJFCwY6KmIGmzn9Z0etMFxW4V4XJ4TCDzXpprvCWLMy6Uj8OJYL
   Pk7rFgkz4RR6ZJtiFvbMBsnmK3hiYtPHbB2uk+s0JjE/u3O73vT8TyRbu
   KTvwpOJroKVOQ3GrNyb7ZSlu799VRhV86zJbEuf7pdKV5Ifbty9R0Z9Ow
   Q==;
X-CSE-ConnectionGUID: +DQ8B07kT8qdssZb/05QaQ==
X-CSE-MsgGUID: BO4eTwXMQVSBp94let51PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="34899127"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="34899127"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 01:18:52 -0700
X-CSE-ConnectionGUID: uXxnpq3fRv62pfJMDxyXcw==
X-CSE-MsgGUID: pklVmu0RSlW6POwzzSM0iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="87356847"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Aug 2024 01:18:51 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skJJp-0002S7-0R;
	Sat, 31 Aug 2024 08:18:49 +0000
Date: Sat, 31 Aug 2024 16:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] selftests/futex: Create test for robust list
Message-ID: <202408311654.Me6a2xuF-lkp@intel.com>
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
In-Reply-To: <20240829183509.446934-1-andrealmeid@igalia.com>
References: <20240829183509.446934-1-andrealmeid@igalia.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/selftests-futex-Create-test-for-robust-list/20240830-023631
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20240829183509.446934-1-andrealmeid%40igalia.com
patch subject: [PATCH] selftests/futex: Create test for robust list
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408311654.Me6a2xuF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408311654.Me6a2xuF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> robust_list.c:53:17: error: use of undeclared identifier 'SYS_futex_wait'; did you mean 'futex_wait'?
      53 |         return syscall(SYS_futex_wait, futex, val, ~0U, FUTEX2_SIZE_U32, timo, CLOCK_MONOTONIC);
         |                        ^~~~~~~~~~~~~~
         |                        futex_wait
   ../include/futextest.h:78:1: note: 'futex_wait' declared here
      78 | futex_wait(futex_t *uaddr, futex_t val, struct timespec *timeout, int opflags)
         | ^
>> robust_list.c:121:6: error: address argument to atomic operation must be a pointer to _Atomic type ('int *' invalid)
     121 |         if (atomic_compare_exchange_strong(futex, &zero, tid)) {
         |             ^                              ~~~~~
   /opt/cross/clang-617a15a9ea/lib/clang/18/include/stdatomic.h:144:67: note: expanded from macro 'atomic_compare_exchange_strong'
     144 | #define atomic_compare_exchange_strong(object, expected, desired) __c11_atomic_compare_exchange_strong(object, expected, desired, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST)
         |                                                                   ^                                    ~~~~~~
   robust_list.c:147:9: error: address argument to atomic operation must be a pointer to _Atomic type ('int *' invalid)
     147 |                 tid = atomic_load(futex);
         |                       ^           ~~~~~
   /opt/cross/clang-617a15a9ea/lib/clang/18/include/stdatomic.h:138:29: note: expanded from macro 'atomic_load'
     138 | #define atomic_load(object) __c11_atomic_load(object, __ATOMIC_SEQ_CST)
         |                             ^                 ~~~~~~
   robust_list.c:150:3: error: address argument to atomic operation must be a pointer to _Atomic type ('int *' invalid)
     150 |                 atomic_store(futex, tid);
         |                 ^            ~~~~~
   /opt/cross/clang-617a15a9ea/lib/clang/18/include/stdatomic.h:135:39: note: expanded from macro 'atomic_store'
     135 | #define atomic_store(object, desired) __c11_atomic_store(object, desired, __ATOMIC_SEQ_CST)
         |                                       ^                  ~~~~~~
   4 errors generated.


vim +53 tools/testing/selftests/futex/functional/robust_list.c

3306ef10715f1b André Almeida 2024-08-29  50  
3306ef10715f1b André Almeida 2024-08-29  51  int futex2_wait(void *futex, int val, struct timespec *timo)
3306ef10715f1b André Almeida 2024-08-29  52  {
3306ef10715f1b André Almeida 2024-08-29 @53  	return syscall(SYS_futex_wait, futex, val, ~0U, FUTEX2_SIZE_U32, timo, CLOCK_MONOTONIC);
3306ef10715f1b André Almeida 2024-08-29  54  }
3306ef10715f1b André Almeida 2024-08-29  55  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
