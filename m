Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CD110EC
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jan 2023 09:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674552120; x=1706088120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I4ix/Xa4LHlF0MvtwEOevcUsM6Mg43jO2q+un2nO4E0=;
  b=GCNJIUu/MT72LCH528k41Xao6NpvwmRwHSu53l/YbX07yaBI23Ov9Ge0
   dRV0oiyVVzqA8PsVjHSqymmrsgEGIwOeuW5TbgTunInFowiNnj8F36qcc
   rcL0ircOzkRv2wbiU4wGfxmbYeJifIYO+l8TKiIBi5eweG0C7wDOAWWg1
   Ez10Em0XROqVMftC/mzCcpxjrhtmz4j8s43h80jPfToOCi22CM6WQRQ8/
   gPMzFBfLjffePtoxO+8IIKHZNyCjKsnwTTGphBqaP5z2pYr0KKlXro4Ed
   K/3lI5UTjRaCGjFJlVZIETHRzeOv0OCyuczBp90JW9lcrqmhV3zkv6tAL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="309831160"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="309831160"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 01:21:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="770240203"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="770240203"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2023 01:21:48 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKFUx-0006Iy-2M;
	Tue, 24 Jan 2023 09:21:47 +0000
Date: Tue, 24 Jan 2023 17:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.01.19a 55/61]
 kernel/rcu/rcutorture.c:3548 rcu_torture_init_srcu_lockdep() warn: for
 statement not indented
Message-ID: <202301241716.MgPWF6fU-lkp@intel.com>
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
CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2023.01.19a
head:   e51eadce38349e7edb506a61e325cc562d49409f
commit: a5ae869a4ab737494a3c5c167d782b8eab3ba724 [55/61] squash! rcutorture: Add SRCU deadlock scenarios
:::::: branch date: 9 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-m001-20230123 (https://download.01.org/0day-ci/archive/20230124/202301241716.MgPWF6fU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
kernel/rcu/rcutorture.c:3548 rcu_torture_init_srcu_lockdep() warn: for statement not indented

vim +3548 kernel/rcu/rcutorture.c

81fba7e62c82be Paul E. McKenney 2023-01-13  3512  
81fba7e62c82be Paul E. McKenney 2023-01-13  3513  // Test lockdep on SRCU-based deadlock scenarios.
81fba7e62c82be Paul E. McKenney 2023-01-13  3514  static void rcu_torture_init_srcu_lockdep(void)
81fba7e62c82be Paul E. McKenney 2023-01-13  3515  {
81fba7e62c82be Paul E. McKenney 2023-01-13  3516  	int cyclelen;
81fba7e62c82be Paul E. McKenney 2023-01-13  3517  	int cyclelenmax;
81fba7e62c82be Paul E. McKenney 2023-01-13  3518  	int deadlock;
81fba7e62c82be Paul E. McKenney 2023-01-13  3519  	bool err = false;
81fba7e62c82be Paul E. McKenney 2023-01-13  3520  	int i;
81fba7e62c82be Paul E. McKenney 2023-01-13  3521  	int j;
81fba7e62c82be Paul E. McKenney 2023-01-13  3522  	int idx;
a5ae869a4ab737 Paul E. McKenney 2023-01-23  3523  	struct mutex *muts[] = { &mut0, &mut1, &mut2, &mut3, &mut4,
a5ae869a4ab737 Paul E. McKenney 2023-01-23  3524  				 &mut5, &mut6, &mut7, &mut8, &mut9 };
a5ae869a4ab737 Paul E. McKenney 2023-01-23  3525  	struct srcu_struct *srcus[] = { &srcu0, &srcu1, &srcu2, &srcu3, &srcu4,
a5ae869a4ab737 Paul E. McKenney 2023-01-23  3526  					&srcu5, &srcu6, &srcu7, &srcu8, &srcu9 };
81fba7e62c82be Paul E. McKenney 2023-01-13  3527  	int testtype;
81fba7e62c82be Paul E. McKenney 2023-01-13  3528  
81fba7e62c82be Paul E. McKenney 2023-01-13  3529  	if (!test_srcu_lockdep)
81fba7e62c82be Paul E. McKenney 2023-01-13  3530  		return;
81fba7e62c82be Paul E. McKenney 2023-01-13  3531  
a5ae869a4ab737 Paul E. McKenney 2023-01-23  3532  	deadlock = test_srcu_lockdep / 1000;
81fba7e62c82be Paul E. McKenney 2023-01-13  3533  	testtype = (test_srcu_lockdep / 10) % 100;
81fba7e62c82be Paul E. McKenney 2023-01-13  3534  	cyclelen = test_srcu_lockdep % 10;
81fba7e62c82be Paul E. McKenney 2023-01-13  3535  	cyclelenmax = min(ARRAY_SIZE(muts), ARRAY_SIZE(srcus));
81fba7e62c82be Paul E. McKenney 2023-01-13  3536  	WARN_ON_ONCE(ARRAY_SIZE(muts) != ARRAY_SIZE(srcus));
81fba7e62c82be Paul E. McKenney 2023-01-13  3537  	if (WARN_ONCE(deadlock != !!deadlock,
81fba7e62c82be Paul E. McKenney 2023-01-13  3538  		      "%s: test_srcu_lockdep=%d and deadlock digit %d must be zero or one.\n",
81fba7e62c82be Paul E. McKenney 2023-01-13  3539  		      __func__, test_srcu_lockdep, deadlock))
81fba7e62c82be Paul E. McKenney 2023-01-13  3540  		err = true;
81fba7e62c82be Paul E. McKenney 2023-01-13  3541  	if (WARN_ONCE(cyclelen <= 0,
81fba7e62c82be Paul E. McKenney 2023-01-13  3542  		      "%s: test_srcu_lockdep=%d and cycle-length digit %d must be greater than zero.\n",
81fba7e62c82be Paul E. McKenney 2023-01-13  3543  		      __func__, test_srcu_lockdep, cyclelen))
81fba7e62c82be Paul E. McKenney 2023-01-13  3544  		err = true;
81fba7e62c82be Paul E. McKenney 2023-01-13  3545  	if (err)
81fba7e62c82be Paul E. McKenney 2023-01-13  3546  		goto err_out;
81fba7e62c82be Paul E. McKenney 2023-01-13  3547  
a5ae869a4ab737 Paul E. McKenney 2023-01-23 @3548  	for (i = 0; i < cyclelen; i++)
a5ae869a4ab737 Paul E. McKenney 2023-01-23  3549  
81fba7e62c82be Paul E. McKenney 2023-01-13  3550  	if (testtype == 0) {
81fba7e62c82be Paul E. McKenney 2023-01-13  3551  		pr_info("%s: test_srcu_lockdep = %05d: SRCU %d-way %sdeadlock.\n",
81fba7e62c82be Paul E. McKenney 2023-01-13  3552  			__func__, test_srcu_lockdep, cyclelen, deadlock ? "" : "non-");
81fba7e62c82be Paul E. McKenney 2023-01-13  3553  		if (deadlock && cyclelen == 1)
81fba7e62c82be Paul E. McKenney 2023-01-13  3554  			pr_info("%s: Expect hang.\n", __func__);
81fba7e62c82be Paul E. McKenney 2023-01-13  3555  		for (i = 0; i < cyclelen; i++) {
81fba7e62c82be Paul E. McKenney 2023-01-13  3556  			j = i + 1;
81fba7e62c82be Paul E. McKenney 2023-01-13  3557  			if (i >= cyclelen - 1)
81fba7e62c82be Paul E. McKenney 2023-01-13  3558  				j = deadlock ? 0 : -1;
81fba7e62c82be Paul E. McKenney 2023-01-13  3559  
81fba7e62c82be Paul E. McKenney 2023-01-13  3560  			if (j >= 0)
81fba7e62c82be Paul E. McKenney 2023-01-13  3561  				pr_info("%s: srcu_read_lock(%d), synchronize_srcu(%d), srcu_read_unlock(%d)\n",
81fba7e62c82be Paul E. McKenney 2023-01-13  3562  					__func__, i, j, i);
81fba7e62c82be Paul E. McKenney 2023-01-13  3563  			else
81fba7e62c82be Paul E. McKenney 2023-01-13  3564  				pr_info("%s: srcu_read_lock(%d), srcu_read_unlock(%d)\n",
81fba7e62c82be Paul E. McKenney 2023-01-13  3565  					__func__, i, i);
81fba7e62c82be Paul E. McKenney 2023-01-13  3566  			idx = srcu_read_lock(srcus[i]);
81fba7e62c82be Paul E. McKenney 2023-01-13  3567  			if (j >= 0)
81fba7e62c82be Paul E. McKenney 2023-01-13  3568  				synchronize_srcu(srcus[j]);
81fba7e62c82be Paul E. McKenney 2023-01-13  3569  			srcu_read_unlock(srcus[i], idx);
81fba7e62c82be Paul E. McKenney 2023-01-13  3570  		}
81fba7e62c82be Paul E. McKenney 2023-01-13  3571  		return;
81fba7e62c82be Paul E. McKenney 2023-01-13  3572  	}
81fba7e62c82be Paul E. McKenney 2023-01-13  3573  
81fba7e62c82be Paul E. McKenney 2023-01-13  3574  	if (testtype == 1) {
81fba7e62c82be Paul E. McKenney 2023-01-13  3575  		pr_info("%s: test_srcu_lockdep = %05d: SRCU/mutex %d-way %sdeadlock.\n",
81fba7e62c82be Paul E. McKenney 2023-01-13  3576  			__func__, test_srcu_lockdep, cyclelen, deadlock ? "" : "non-");
81fba7e62c82be Paul E. McKenney 2023-01-13  3577  		for (i = 0; i < cyclelen; i++) {
81fba7e62c82be Paul E. McKenney 2023-01-13  3578  			j = i + 1;
81fba7e62c82be Paul E. McKenney 2023-01-13  3579  			if (i >= cyclelen - 1)
81fba7e62c82be Paul E. McKenney 2023-01-13  3580  				j = deadlock ? 0 : -1;
81fba7e62c82be Paul E. McKenney 2023-01-13  3581  
81fba7e62c82be Paul E. McKenney 2023-01-13  3582  			pr_info("%s: srcu_read_lock(%d), mutex_lock(%d), mutex_unlock(%d), srcu_read_unlock(%d)\n",
81fba7e62c82be Paul E. McKenney 2023-01-13  3583  				__func__, i, i, i, i);
81fba7e62c82be Paul E. McKenney 2023-01-13  3584  			idx = srcu_read_lock(srcus[i]);
81fba7e62c82be Paul E. McKenney 2023-01-13  3585  			mutex_lock(muts[i]);
81fba7e62c82be Paul E. McKenney 2023-01-13  3586  			mutex_unlock(muts[i]);
81fba7e62c82be Paul E. McKenney 2023-01-13  3587  			srcu_read_unlock(srcus[i], idx);
81fba7e62c82be Paul E. McKenney 2023-01-13  3588  
81fba7e62c82be Paul E. McKenney 2023-01-13  3589  			if (j >= 0) {
81fba7e62c82be Paul E. McKenney 2023-01-13  3590  				pr_info("%s: mutex_lock(%d), synchronize_srcu(%d), mutex_unlock(%d)\n",
81fba7e62c82be Paul E. McKenney 2023-01-13  3591  					__func__, i, j, i);
81fba7e62c82be Paul E. McKenney 2023-01-13  3592  				mutex_lock(muts[i]);
81fba7e62c82be Paul E. McKenney 2023-01-13  3593  				synchronize_srcu(srcus[j]);
81fba7e62c82be Paul E. McKenney 2023-01-13  3594  				mutex_unlock(muts[i]);
81fba7e62c82be Paul E. McKenney 2023-01-13  3595  			}
81fba7e62c82be Paul E. McKenney 2023-01-13  3596  		}
81fba7e62c82be Paul E. McKenney 2023-01-13  3597  		return;
81fba7e62c82be Paul E. McKenney 2023-01-13  3598  	}
81fba7e62c82be Paul E. McKenney 2023-01-13  3599  
81fba7e62c82be Paul E. McKenney 2023-01-13  3600  err_out:
81fba7e62c82be Paul E. McKenney 2023-01-13  3601  	pr_info("%s: test_srcu_lockdep = %05d does nothing.\n", __func__, test_srcu_lockdep);
a5ae869a4ab737 Paul E. McKenney 2023-01-23  3602  	pr_info("%s: test_srcu_lockdep = DTTC.\n", __func__);
81fba7e62c82be Paul E. McKenney 2023-01-13  3603  	pr_info("%s: D: Deadlock if nonzero.\n", __func__);
81fba7e62c82be Paul E. McKenney 2023-01-13  3604  	pr_info("%s: TT: Test number, 0=SRCU, 1=SRCU/mutex.\n", __func__);
81fba7e62c82be Paul E. McKenney 2023-01-13  3605  	pr_info("%s: C: Cycle length.\n", __func__);
81fba7e62c82be Paul E. McKenney 2023-01-13  3606  }
81fba7e62c82be Paul E. McKenney 2023-01-13  3607  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
