Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F5544375
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Oct 2024 09:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730020628; cv=none; b=l6LvuwbqxX6shq+XrC2AxlaSH0u9liausYGQB108s5MTtuExiEiYzcRubIRKAeKBalEoUs2iDIBr6izHPCb+slOKVKkxQ8IZDtGeVNAd9xojOXO7dyZDuIKzNA7tYcQwBM8RTM31dFGn65n9y13SJ3YV25Mkj/9g/nzuY5Qxy7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730020628; c=relaxed/simple;
	bh=74j6s7VP2Ik4d1rLW/RjVUgmEOVtTt8nVpqtug9nuFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PIQGdAxcqsB8/vqtjcpgc7bVao4AlT85aZ3nduuvgBDDIm1alO+iyoMw3UODeKHb8b1Pgb4xuxIwwnVucES1YULT3Af2+eNl1TaDaWipPhA+qLuY6BqJ0A/x/uMvbvpmCKWfJbhb3Gleb9FTcyQCZ+8e/tTQ82ca/XliIXlk7yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVpctPB0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVpctPB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730020625; x=1761556625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=74j6s7VP2Ik4d1rLW/RjVUgmEOVtTt8nVpqtug9nuFk=;
  b=CVpctPB0xKKKBbqWOGFPI5WwJFaA2RdybLgSsAOMvkTUYdNXo4zreK7m
   vbe3LOK+ouCeB0AD+l/2oQF5shucnqJkuo26UBq0WzRq87b/2NGmehzxJ
   fteMQX9AqUTvPwkD/KU1j3e52fSkfRAEJNX5TLC7gjl69e2Sw9TqmlIQO
   Jg7ZgQseVfuPAKqEyu7wPxPpbWMcNOV2nPSmKrOJcfcwlqpqUBIH1LRxj
   DVRQZUR4EqZguXNm/7q86UUtd8ZwjO1+qt1di6mdtrKSBfwFzIggdPkXr
   zasFQ8nbx4sDFpqHxwjSS7erJX+QrqReP2rkBERqjGWEult9WbhBgRgvv
   g==;
X-CSE-ConnectionGUID: 3/KXRBugSd+b43WSetsg5Q==
X-CSE-MsgGUID: TRXI057iQKOsYnQCtsigMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29501899"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29501899"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 02:17:02 -0700
X-CSE-ConnectionGUID: F/iD4UclTJuWoHS2axaQxA==
X-CSE-MsgGUID: zO9TpshASDOcWPiBEzdTEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="82159463"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Oct 2024 02:17:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4zOM-000aaC-27;
	Sun, 27 Oct 2024 09:16:58 +0000
Date: Sun, 27 Oct 2024 17:16:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] rcuscale: Do a proper cleanup if kfree_scale_init()
 fails
Message-ID: <202410271601.WIHqAStZ-lkp@intel.com>
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
In-Reply-To: <20241024164558.715296-1-urezki@gmail.com>
References: <20241024164558.715296-1-urezki@gmail.com>
TO: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
TO: "Paul E . McKenney" <paulmck@kernel.org>
CC: Frederic Weisbecker <frederic@kernel.org>
CC: RCU <rcu@vger.kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>
CC: Neeraj upadhyay <Neeraj.Upadhyay@amd.com>
CC: Boqun Feng <boqun.feng@gmail.com>
CC: Joel Fernandes <joel@joelfernandes.org>
CC: Uladzislau Rezki <urezki@gmail.com>
CC: Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
CC: Dan Carpenter <error27@gmail.com>

Hi Uladzislau,

kernel test robot noticed the following build warnings:

[auto build test WARNING on paulmck-rcu/dev]
[also build test WARNING on linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uladzislau-Rezki-Sony/rcuscale-Remove-redundant-WARN_ON_ONCE-splat/20241025-004751
base:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
patch link:    https://lore.kernel.org/r/20241024164558.715296-1-urezki%40gmail.com
patch subject: [PATCH 1/2] rcuscale: Do a proper cleanup if kfree_scale_init() fails
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20241026 (https://download.01.org/0day-ci/archive/20241027/202410271601.WIHqAStZ-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410271601.WIHqAStZ-lkp@intel.com/

smatch warnings:
kernel/rcu/rcuscale.c:893 kfree_scale_init() warn: missing error code 'firsterr'

vim +/firsterr +893 kernel/rcu/rcuscale.c

084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  855) 
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  856) static int __init
4e88ec4a9eb175 kernel/rcu/rcuscale.c Paul E. McKenney        2020-08-11  857  kfree_scale_init(void)
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  858) {
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  859) 	int firsterr = 0;
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  860) 	long i;
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  861) 	unsigned long jif_start;
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  862) 	unsigned long orig_jif;
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  863) 
bb7bad3dae42b6 kernel/rcu/rcuscale.c Paul E. McKenney        2023-05-16  864  	pr_alert("%s" SCALE_FLAG
bb7bad3dae42b6 kernel/rcu/rcuscale.c Paul E. McKenney        2023-05-16  865  		 "--- kfree_rcu_test: kfree_mult=%d kfree_by_call_rcu=%d kfree_nthreads=%d kfree_alloc_num=%d kfree_loops=%d kfree_rcu_test_double=%d kfree_rcu_test_single=%d\n",
bb7bad3dae42b6 kernel/rcu/rcuscale.c Paul E. McKenney        2023-05-16  866  		 scale_type, kfree_mult, kfree_by_call_rcu, kfree_nthreads, kfree_alloc_num, kfree_loops, kfree_rcu_test_double, kfree_rcu_test_single);
bb7bad3dae42b6 kernel/rcu/rcuscale.c Paul E. McKenney        2023-05-16  867  
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  868) 	// Also, do a quick self-test to ensure laziness is as much as
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  869) 	// expected.
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  870) 	if (kfree_by_call_rcu && !IS_ENABLED(CONFIG_RCU_LAZY)) {
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  871) 		pr_alert("CONFIG_RCU_LAZY is disabled, falling back to kfree_rcu() for delayed RCU kfree'ing\n");
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  872) 		kfree_by_call_rcu = 0;
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  873) 	}
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  874) 
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  875) 	if (kfree_by_call_rcu) {
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  876) 		/* do a test to check the timeout. */
499d7e7e83d25f kernel/rcu/rcuscale.c Frederic Weisbecker     2023-11-15  877  		orig_jif = rcu_get_jiffies_lazy_flush();
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  878) 
499d7e7e83d25f kernel/rcu/rcuscale.c Frederic Weisbecker     2023-11-15  879  		rcu_set_jiffies_lazy_flush(2 * HZ);
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  880) 		rcu_barrier();
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  881) 
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  882) 		jif_start = jiffies;
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  883) 		jiffies_at_lazy_cb = 0;
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  884) 		call_rcu(&lazy_test1_rh, call_rcu_lazy_test1);
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  885) 
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  886) 		smp_cond_load_relaxed(&rcu_lazy_test1_cb_called, VAL == 1);
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  887) 
499d7e7e83d25f kernel/rcu/rcuscale.c Frederic Weisbecker     2023-11-15  888  		rcu_set_jiffies_lazy_flush(orig_jif);
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  889) 
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  890) 		if (WARN_ON_ONCE(jiffies_at_lazy_cb - jif_start < 2 * HZ)) {
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  891) 			pr_alert("ERROR: call_rcu() CBs are not being lazy as expected!\n");
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  892) 			WARN_ON_ONCE(1);
c17a39e335231a kernel/rcu/rcuscale.c Uladzislau Rezki (Sony  2024-10-24 @893) 			goto unwind;
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  894) 		}
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  895) 
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  896) 		if (WARN_ON_ONCE(jiffies_at_lazy_cb - jif_start > 3 * HZ)) {
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  897) 			pr_alert("ERROR: call_rcu() CBs are being too lazy!\n");
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  898) 			WARN_ON_ONCE(1);
c17a39e335231a kernel/rcu/rcuscale.c Uladzislau Rezki (Sony  2024-10-24  899) 			goto unwind;
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  900) 		}
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  901) 	}
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  902) 
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  903) 	kfree_nrealthreads = compute_real(kfree_nthreads);
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  904) 	/* Start up the kthreads. */
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  905) 	if (shutdown) {
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  906) 		init_waitqueue_head(&shutdown_wq);
4e88ec4a9eb175 kernel/rcu/rcuscale.c Paul E. McKenney        2020-08-11  907  		firsterr = torture_create_kthread(kfree_scale_shutdown, NULL,
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  908) 						  shutdown_task);
eb77abfdeed29d kernel/rcu/rcuscale.c Paul E. McKenney        2021-08-05  909  		if (torture_init_error(firsterr))
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  910) 			goto unwind;
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  911) 		schedule_timeout_uninterruptible(1);
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  912) 	}
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  913) 
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  914) 	pr_alert("kfree object size=%zu, kfree_by_call_rcu=%d\n",
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  915) 			kfree_mult * sizeof(struct kfree_obj),
084e04fff16017 kernel/rcu/rcuscale.c Joel Fernandes (Google  2022-10-16  916) 			kfree_by_call_rcu);
f87dc808009ac8 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2020-03-16  917) 
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  918) 	kfree_reader_tasks = kcalloc(kfree_nrealthreads, sizeof(kfree_reader_tasks[0]),
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  919) 			       GFP_KERNEL);
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  920) 	if (kfree_reader_tasks == NULL) {
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  921) 		firsterr = -ENOMEM;
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  922) 		goto unwind;
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  923) 	}
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  924) 
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  925) 	for (i = 0; i < kfree_nrealthreads; i++) {
4e88ec4a9eb175 kernel/rcu/rcuscale.c Paul E. McKenney        2020-08-11  926  		firsterr = torture_create_kthread(kfree_scale_thread, (void *)i,
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  927) 						  kfree_reader_tasks[i]);
eb77abfdeed29d kernel/rcu/rcuscale.c Paul E. McKenney        2021-08-05  928  		if (torture_init_error(firsterr))
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  929) 			goto unwind;
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  930) 	}
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  931) 
4e88ec4a9eb175 kernel/rcu/rcuscale.c Paul E. McKenney        2020-08-11  932  	while (atomic_read(&n_kfree_scale_thread_started) < kfree_nrealthreads)
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  933) 		schedule_timeout_uninterruptible(1);
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  934) 
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  935) 	torture_init_end();
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  936) 	return 0;
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  937) 
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  938) unwind:
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  939) 	torture_init_end();
4e88ec4a9eb175 kernel/rcu/rcuscale.c Paul E. McKenney        2020-08-11  940  	kfree_scale_cleanup();
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  941) 	return firsterr;
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  942) }
e6e78b004fa7e0 kernel/rcu/rcuperf.c  Joel Fernandes (Google  2019-08-30  943) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
