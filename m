Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0201F6FA1;
	Tue, 24 Jan 2023 14:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94CEBC433D2;
	Tue, 24 Jan 2023 14:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674571876;
	bh=+EjtBiphuV/Px+sKr7Vwnqnqrvwx28Wgvt+iOs1FYw0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=eot1+LOQhQ+laF+0f6YX63Lq/95Riu2WuMrTMBEfs4FgpKLajkQNdtdaqoJUElL1+
	 2FwsdOBvvVrhMS08iwS+dmmrVbWT9vbzdeo56BnEGzECkyV9evv9mRWst9pVLRPJC4
	 nS7O4hgj8zbLLa8zU6QjIhhyQYAb1zaJJ1OVZK+0Mim4VwGalq3Q5XYI5wkWArlzbb
	 mBU2O0KNRepUmm+f5jkEXUgzanemEzPNHuF4UU4cqG6ksHapmWlIFUL9FCwcdBdL/D
	 gwVhtDiwqXooftbLTKuS3jyvudHafXvblMdGFhxUarva8QJ740QA1mucO52N0ZVHef
	 AOlFmdn6x4rwA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 407425C0510; Tue, 24 Jan 2023 06:51:16 -0800 (PST)
Date: Tue, 24 Jan 2023 06:51:16 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.01.19a 55/61]
 kernel/rcu/rcutorture.c:3548 rcu_torture_init_srcu_lockdep() warn: for
 statement not indented
Message-ID: <20230124145116.GH2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <202301241716.MgPWF6fU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301241716.MgPWF6fU-lkp@intel.com>

On Tue, Jan 24, 2023 at 12:32:14PM +0300, Dan Carpenter wrote:
> tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2023.01.19a
> head:   e51eadce38349e7edb506a61e325cc562d49409f
> commit: a5ae869a4ab737494a3c5c167d782b8eab3ba724 [55/61] squash! rcutorture: Add SRCU deadlock scenarios
> config: x86_64-randconfig-m001-20230123 (https://download.01.org/0day-ci/archive/20230124/202301241716.MgPWF6fU-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> 
> smatch warnings:
> kernel/rcu/rcutorture.c:3548 rcu_torture_init_srcu_lockdep() warn: for statement not indented
> 
> vim +3548 kernel/rcu/rcutorture.c
> 
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3514  static void rcu_torture_init_srcu_lockdep(void)
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3515  {
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3516  	int cyclelen;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3517  	int cyclelenmax;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3518  	int deadlock;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3519  	bool err = false;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3520  	int i;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3521  	int j;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3522  	int idx;
> a5ae869a4ab737 Paul E. McKenney 2023-01-23  3523  	struct mutex *muts[] = { &mut0, &mut1, &mut2, &mut3, &mut4,
> a5ae869a4ab737 Paul E. McKenney 2023-01-23  3524  				 &mut5, &mut6, &mut7, &mut8, &mut9 };
> a5ae869a4ab737 Paul E. McKenney 2023-01-23  3525  	struct srcu_struct *srcus[] = { &srcu0, &srcu1, &srcu2, &srcu3, &srcu4,
> a5ae869a4ab737 Paul E. McKenney 2023-01-23  3526  					&srcu5, &srcu6, &srcu7, &srcu8, &srcu9 };
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3527  	int testtype;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3528  
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3529  	if (!test_srcu_lockdep)
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3530  		return;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3531  
> a5ae869a4ab737 Paul E. McKenney 2023-01-23  3532  	deadlock = test_srcu_lockdep / 1000;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3533  	testtype = (test_srcu_lockdep / 10) % 100;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3534  	cyclelen = test_srcu_lockdep % 10;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3535  	cyclelenmax = min(ARRAY_SIZE(muts), ARRAY_SIZE(srcus));
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3536  	WARN_ON_ONCE(ARRAY_SIZE(muts) != ARRAY_SIZE(srcus));
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3537  	if (WARN_ONCE(deadlock != !!deadlock,
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3538  		      "%s: test_srcu_lockdep=%d and deadlock digit %d must be zero or one.\n",
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3539  		      __func__, test_srcu_lockdep, deadlock))
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3540  		err = true;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3541  	if (WARN_ONCE(cyclelen <= 0,
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3542  		      "%s: test_srcu_lockdep=%d and cycle-length digit %d must be greater than zero.\n",
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3543  		      __func__, test_srcu_lockdep, cyclelen))
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3544  		err = true;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3545  	if (err)
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3546  		goto err_out;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3547  
> a5ae869a4ab737 Paul E. McKenney 2023-01-23 @3548  	for (i = 0; i < cyclelen; i++)
> 
> This line looks like it should just be deleted.  The real loops are
> later so i == cyclelen by the time it loops back here.  Should probably
> create a static checker warning for nested loops where the inside loop
> resets the outside iterator to zero.

You are quite right, I intended to have deleted that statement.

And the fact that it works is quite coincidental.  Thank you!

							Thanx, Paul

> a5ae869a4ab737 Paul E. McKenney 2023-01-23  3549  
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3550  	if (testtype == 0) {
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3551  		pr_info("%s: test_srcu_lockdep = %05d: SRCU %d-way %sdeadlock.\n",
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3552  			__func__, test_srcu_lockdep, cyclelen, deadlock ? "" : "non-");
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3553  		if (deadlock && cyclelen == 1)
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3554  			pr_info("%s: Expect hang.\n", __func__);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3555  		for (i = 0; i < cyclelen; i++) {
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3556  			j = i + 1;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3557  			if (i >= cyclelen - 1)
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3558  				j = deadlock ? 0 : -1;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3559  
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3560  			if (j >= 0)
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3561  				pr_info("%s: srcu_read_lock(%d), synchronize_srcu(%d), srcu_read_unlock(%d)\n",
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3562  					__func__, i, j, i);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3563  			else
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3564  				pr_info("%s: srcu_read_lock(%d), srcu_read_unlock(%d)\n",
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3565  					__func__, i, i);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3566  			idx = srcu_read_lock(srcus[i]);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3567  			if (j >= 0)
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3568  				synchronize_srcu(srcus[j]);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3569  			srcu_read_unlock(srcus[i], idx);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3570  		}
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3571  		return;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3572  	}
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3573  
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3574  	if (testtype == 1) {
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3575  		pr_info("%s: test_srcu_lockdep = %05d: SRCU/mutex %d-way %sdeadlock.\n",
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3576  			__func__, test_srcu_lockdep, cyclelen, deadlock ? "" : "non-");
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3577  		for (i = 0; i < cyclelen; i++) {
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3578  			j = i + 1;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3579  			if (i >= cyclelen - 1)
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3580  				j = deadlock ? 0 : -1;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3581  
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3582  			pr_info("%s: srcu_read_lock(%d), mutex_lock(%d), mutex_unlock(%d), srcu_read_unlock(%d)\n",
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3583  				__func__, i, i, i, i);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3584  			idx = srcu_read_lock(srcus[i]);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3585  			mutex_lock(muts[i]);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3586  			mutex_unlock(muts[i]);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3587  			srcu_read_unlock(srcus[i], idx);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3588  
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3589  			if (j >= 0) {
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3590  				pr_info("%s: mutex_lock(%d), synchronize_srcu(%d), mutex_unlock(%d)\n",
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3591  					__func__, i, j, i);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3592  				mutex_lock(muts[i]);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3593  				synchronize_srcu(srcus[j]);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3594  				mutex_unlock(muts[i]);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3595  			}
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3596  		}
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3597  		return;
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3598  	}
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3599  
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3600  err_out:
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3601  	pr_info("%s: test_srcu_lockdep = %05d does nothing.\n", __func__, test_srcu_lockdep);
> a5ae869a4ab737 Paul E. McKenney 2023-01-23  3602  	pr_info("%s: test_srcu_lockdep = DTTC.\n", __func__);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3603  	pr_info("%s: D: Deadlock if nonzero.\n", __func__);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3604  	pr_info("%s: TT: Test number, 0=SRCU, 1=SRCU/mutex.\n", __func__);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3605  	pr_info("%s: C: Cycle length.\n", __func__);
> 81fba7e62c82be Paul E. McKenney 2023-01-13  3606  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
> 
