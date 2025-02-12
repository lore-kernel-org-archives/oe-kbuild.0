Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133B91F4299
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Feb 2025 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739358108; cv=none; b=LY8qz11VQnCNxG17JlKEUDFIB4DFRx8EYYkVUZsVgEyo5G+tpbMqgnbwQO7Po7wcbsayqAofbW/6WQW66bFxDPfGjBmX4NMGSsp3be6F7Cdk4iRTv2hqFwP2FX0dotZK03/5LOl+n88mPVTtweE9NFAYym5UQurH/b+iP5lembk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739358108; c=relaxed/simple;
	bh=ZTq4IZ30IoKicm9XLeBBg3Tc5jNkRoDjSdRVoec8cfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CmkcvSNf6crvoMUWQGQ4bt+bnA0HftqFSr/uvYNFypl8eT3TTjKD+RaDOIWtqNE43a62UrnTyspAxxJ5qSOUSb1oW/n8yNq1nzgk/cpayrPNlbFs5aMy7s62EzPrKWu6TKMrmL2vftNDDwtEeNN09iHZcMOhCqQNw8jk9n8yYYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQwP0VAy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQwP0VAy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739358106; x=1770894106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZTq4IZ30IoKicm9XLeBBg3Tc5jNkRoDjSdRVoec8cfw=;
  b=hQwP0VAyyJhl2WUxh0Hg65yU8xuMsMFekWTJPfjUi4jvp9XydtHzPqmg
   mx36wI/D2a3AYoRh0cd1CSDpbL6wr4knTtvsxqJLR8ETZJjm1bNgj/e+1
   Db9+U+OsVY5YP4H8PQEMiEoBsGEvc13EjtfIzYeKOmlbVoAHGHvhHMhx+
   679gKT8/ScgprOJLHCYo7oHStmtMcow94ab8qkWQOk6H5XzpF76iDlZkb
   orXbD5rLqRN/1+OJ6Ls9QOG4JK+q3DLaNyRggANe2sax5FaJ4Z/S7q39L
   bLztklHrJo9DD9yRmN424BAtMDinUaUHzzHj5KNN01K2aGUj3oSgQF1Ts
   w==;
X-CSE-ConnectionGUID: ObXkoFreQBmcQAsATGI64w==
X-CSE-MsgGUID: vRjh142FQOyHBMD5USoB4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43936400"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="43936400"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 03:01:44 -0800
X-CSE-ConnectionGUID: JJXzTjUfTE60ZvEWs0L8xw==
X-CSE-MsgGUID: J1p2TdSlRYGT29g2HPxR4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="112558155"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Feb 2025 03:01:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiAUt-0015XX-2R;
	Wed, 12 Feb 2025 11:01:39 +0000
Date: Wed, 12 Feb 2025 19:01:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] ww_mutex: convert self-test to KUnit
Message-ID: <202502121806.CS6r741y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250210-ww_mutex-kunit-convert-v1-1-972f0201f71e@gmail.com>
References: <20250210-ww_mutex-kunit-convert-v1-1-972f0201f71e@gmail.com>
TO: Tamir Duberstein <tamird@gmail.com>
TO: David Gow <davidgow@google.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Will Deacon <will@kernel.org>
TO: Boqun Feng <boqun.feng@gmail.com>
TO: Waiman Long <longman@redhat.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Nick Desaulniers <ndesaulniers@google.com>
TO: Bill Wendling <morbo@google.com>
TO: Justin Stitt <justinstitt@google.com>
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: llvm@lists.linux.dev
CC: Tamir Duberstein <tamird@gmail.com>

Hi Tamir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a64dcfb451e254085a7daee5fe51bf22959d52d3]

url:    https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/ww_mutex-convert-self-test-to-KUnit/20250211-000245
base:   a64dcfb451e254085a7daee5fe51bf22959d52d3
patch link:    https://lore.kernel.org/r/20250210-ww_mutex-kunit-convert-v1-1-972f0201f71e%40gmail.com
patch subject: [PATCH] ww_mutex: convert self-test to KUnit
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250212 (https://download.01.org/0day-ci/archive/20250212/202502121806.CS6r741y-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502121806.CS6r741y-lkp@intel.com/

smatch warnings:
kernel/locking/ww_mutex_kunit.c:238 test_abba_gen_params() warn: shift has higher precedence than mask
kernel/locking/ww_mutex_kunit.c:249 test_abba() warn: shift has higher precedence than mask

vim +238 kernel/locking/ww_mutex_kunit.c

70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  231  
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  232  static const void *test_abba_gen_params(const void *prev, char *desc)
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  233  {
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  234  	static unsigned int storage;
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  235  	const unsigned int *next = gen_range(&storage, 0b00, 0b11, prev);
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  236  
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  237  	if (next != NULL) {
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10 @238  		const bool trylock = *next & 0b01 >> 0;
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  239  		const bool resolve = *next & 0b10 >> 1;
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  240  
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  241  		snprintf(desc, KUNIT_PARAM_DESC_SIZE, "trylock=%d,resolve=%d", trylock, resolve);
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  242  	}
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  243  	return next;
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  244  }
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  245  
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  246  static void test_abba(struct kunit *test)
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  247  {
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  248  	const unsigned int *param = test->param_value;
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10 @249  	const bool trylock = *param & 0b01 >> 0;
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  250  	const bool resolve = *param & 0b10 >> 1;
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  251  	struct test_abba abba;
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  252  	struct ww_acquire_ctx ctx;
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  253  	int err;
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  254  
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  255  	ww_mutex_init(&abba.a_mutex, &ww_class);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  256  	ww_mutex_init(&abba.b_mutex, &ww_class);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  257  	INIT_WORK_ONSTACK(&abba.work, test_abba_work);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  258  	init_completion(&abba.a_ready);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  259  	init_completion(&abba.b_ready);
12235da8c80a1f kernel/locking/test-ww_mutex.c  Maarten Lankhorst 2021-09-09  260  	abba.trylock = trylock;
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  261  	abba.resolve = resolve;
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  262  
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  263  	schedule_work(&abba.work);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  264  
12235da8c80a1f kernel/locking/test-ww_mutex.c  Maarten Lankhorst 2021-09-09  265  	ww_acquire_init_noinject(&ctx, &ww_class);
12235da8c80a1f kernel/locking/test-ww_mutex.c  Maarten Lankhorst 2021-09-09  266  	if (!trylock)
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  267  		ww_mutex_lock(&abba.a_mutex, &ctx);
12235da8c80a1f kernel/locking/test-ww_mutex.c  Maarten Lankhorst 2021-09-09  268  	else
12235da8c80a1f kernel/locking/test-ww_mutex.c  Maarten Lankhorst 2021-09-09  269  		WARN_ON(!ww_mutex_trylock(&abba.a_mutex, &ctx));
12235da8c80a1f kernel/locking/test-ww_mutex.c  Maarten Lankhorst 2021-09-09  270  
12235da8c80a1f kernel/locking/test-ww_mutex.c  Maarten Lankhorst 2021-09-09  271  	WARN_ON(READ_ONCE(abba.a_mutex.ctx) != &ctx);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  272  
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  273  	complete(&abba.a_ready);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  274  	wait_for_completion(&abba.b_ready);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  275  
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  276  	err = ww_mutex_lock(&abba.b_mutex, &ctx);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  277  	if (resolve && err == -EDEADLK) {
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  278  		ww_mutex_unlock(&abba.a_mutex);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  279  		ww_mutex_lock_slow(&abba.b_mutex, &ctx);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  280  		err = ww_mutex_lock(&abba.a_mutex, &ctx);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  281  	}
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  282  
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  283  	if (!err)
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  284  		ww_mutex_unlock(&abba.b_mutex);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  285  	ww_mutex_unlock(&abba.a_mutex);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  286  	ww_acquire_fini(&ctx);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  287  
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  288  	flush_work(&abba.work);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  289  	destroy_work_on_stack(&abba.work);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  290  
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  291  	if (resolve) {
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  292  		if (err || abba.result) {
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  293  			KUNIT_FAIL(test, "failed to resolve ABBA deadlock, A err=%d, B err=%d",
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  294  				   err, abba.result);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  295  		}
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  296  	} else {
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  297  		if (err != -EDEADLK && abba.result != -EDEADLK) {
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  298  			KUNIT_FAIL(test, "missed ABBA deadlock, A err=%d, B err=%d",
daf92a37bd1117 kernel/locking/ww_mutex_kunit.c Tamir Duberstein  2025-02-10  299  				   err, abba.result);
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  300  		}
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  301  	}
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  302  }
70207686e492fb kernel/locking/test-ww_mutex.c  Chris Wilson      2016-12-01  303  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
