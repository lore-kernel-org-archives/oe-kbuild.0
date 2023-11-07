Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4778879F2
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 04:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BA/Pm1U9"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9db6cf8309cso752429266b.0
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Nov 2023 20:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699330379; x=1699935179; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BeE66KaENA4L5aP9jLk1oNB7zVNeskbpx3MnAnk/aFQ=;
        b=BA/Pm1U9MOYihJrpd9OjwIW6XCn59PeKjpoR28X5vLhcJOXIZl844OTZLv2TP+WbGZ
         TAgl3qCBlncuz2GcN1M1R7/jVBGCP4gjAEN2YCtHr+IUy4MnPTFxzCb4g7KMpBV4EpD7
         Gi1gHwLYAqdOOfwcb9j8B/iAdj+m4U3vTEfQiBUNA9Drx3du5hCcQ/EDiQYjf1UBcbJx
         R5w5EvspuK1pm9P0Ii1ANgy1nz18Wq2LGq+CMW77e4EqHyBbTXvOoqYA5tjILyRkaJgR
         Ad7xLUPdzLpVAwW/PrO4dKVEWH016UxrDppO07mLJdnAhpgjcmwcMaHX7uxHSHE0D6yp
         SZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699330379; x=1699935179;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BeE66KaENA4L5aP9jLk1oNB7zVNeskbpx3MnAnk/aFQ=;
        b=KpvpVwwNeM8WB6huerE5c7Fhvb96gMAy2U8FC7ZvziIToYL5qje8U3ikyCiBvfEXC+
         oJCcJJvwgj1NygDqRSUJ51ojklQjMAnbI7Yd/hcehkywR9hWwinydshcKBwXXGhwiC71
         k1yRv2cT/QOKHTKoU8GC6rSKkAIVU+VS2T1r+Ay4yLvcZXs6a4Wx2dAToxU/rCfTlWWW
         z7QEFjVBxDXuXSybBh10T2zq/w8LzkypMMXuA9+mPqrTiTx0+kwZNC+zbhYGNS7fCLeU
         wkS0zEWR722F48A0I3FT8pNw1veoM56CXSC4kWfkdaKiGsJYO46UppLWNretg+Ked3yr
         WvEw==
X-Gm-Message-State: AOJu0YxYWD+R1T7WXvuD35yE64X7u+BJJLF+TgB7vhJC8wDkgBFh8ncV
	t6gRVJqSgPys/R3tM3B7QHk8IcUQxu216IARTl8=
X-Google-Smtp-Source: AGHT+IHz/cQgmYb+/jcOoaJNIHYKNiETegjHqBZhBvzCYxqsvvt9qI6Qn9IXF/o3RTjqUvGLuczBhw==
X-Received: by 2002:a17:907:36c5:b0:9d2:bf19:88aa with SMTP id bj5-20020a17090736c500b009d2bf1988aamr15395586ejc.59.1699330378771;
        Mon, 06 Nov 2023 20:12:58 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ox11-20020a170907100b00b009dd949b75c7sm551938ejb.151.2023.11.06.20.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 20:12:58 -0800 (PST)
Date: Tue, 7 Nov 2023 07:12:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: fs/bcachefs/six.c:283 __do_six_trylock() error: uninitialized symbol
 'old'.
Message-ID: <6dda193d-53e3-44e3-8d3c-734ab8b50869@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: b60c8e9e7b082abac290ebdb9166b806e7d83fb7 six locks: lock->state.seq no longer used for write lock held
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231106/202311062227.0GUulHgD-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311062227.0GUulHgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202311062227.0GUulHgD-lkp@intel.com/

New smatch warnings:
fs/bcachefs/six.c:283 __do_six_trylock() error: uninitialized symbol 'old'.

vim +/old +283 fs/bcachefs/six.c

91d16f16d0fd4b Kent Overstreet 2023-05-21  199  static int __do_six_trylock(struct six_lock *lock, enum six_lock_type type,
91d16f16d0fd4b Kent Overstreet 2023-05-21  200  			    struct task_struct *task, bool try)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  201  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  202  	const struct six_lock_vals l[] = LOCK_VALS;
84a37cbf62e044 Kent Overstreet 2022-08-26  203  	int ret;
1fb4fe63178881 Kent Overstreet 2023-05-20  204  	u64 old, new, v;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  205  
84a37cbf62e044 Kent Overstreet 2022-08-26  206  	EBUG_ON(type == SIX_LOCK_write && lock->owner != task);
1fb4fe63178881 Kent Overstreet 2023-05-20  207  	EBUG_ON(type == SIX_LOCK_write &&
b60c8e9e7b082a Kent Overstreet 2023-06-16  208  		(try != !(atomic64_read(&lock->state) & SIX_LOCK_HELD_write)));
1fb4fe63178881 Kent Overstreet 2023-05-20  209  	EBUG_ON(type == SIX_LOCK_write &&
b60c8e9e7b082a Kent Overstreet 2023-06-16  210  		(try != !(atomic64_read(&lock->state) & SIX_STATE_WRITE_LOCK)));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  211  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  212  	/*
1c6fdbd8f2465d Kent Overstreet 2017-03-16  213  	 * Percpu reader mode:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  214  	 *
1c6fdbd8f2465d Kent Overstreet 2017-03-16  215  	 * The basic idea behind this algorithm is that you can implement a lock
1c6fdbd8f2465d Kent Overstreet 2017-03-16  216  	 * between two threads without any atomics, just memory barriers:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  217  	 *
1c6fdbd8f2465d Kent Overstreet 2017-03-16  218  	 * For two threads you'll need two variables, one variable for "thread a
1c6fdbd8f2465d Kent Overstreet 2017-03-16  219  	 * has the lock" and another for "thread b has the lock".
1c6fdbd8f2465d Kent Overstreet 2017-03-16  220  	 *
1c6fdbd8f2465d Kent Overstreet 2017-03-16  221  	 * To take the lock, a thread sets its variable indicating that it holds
1c6fdbd8f2465d Kent Overstreet 2017-03-16  222  	 * the lock, then issues a full memory barrier, then reads from the
1c6fdbd8f2465d Kent Overstreet 2017-03-16  223  	 * other thread's variable to check if the other thread thinks it has
1c6fdbd8f2465d Kent Overstreet 2017-03-16  224  	 * the lock. If we raced, we backoff and retry/sleep.
37f612bea5bd92 Kent Overstreet 2023-05-21  225  	 *
37f612bea5bd92 Kent Overstreet 2023-05-21  226  	 * Failure to take the lock may cause a spurious trylock failure in
37f612bea5bd92 Kent Overstreet 2023-05-21  227  	 * another thread, because we temporarily set the lock to indicate that
37f612bea5bd92 Kent Overstreet 2023-05-21  228  	 * we held it. This would be a problem for a thread in six_lock(), when
37f612bea5bd92 Kent Overstreet 2023-05-21  229  	 * they are calling trylock after adding themself to the waitlist and
37f612bea5bd92 Kent Overstreet 2023-05-21  230  	 * prior to sleeping.
37f612bea5bd92 Kent Overstreet 2023-05-21  231  	 *
37f612bea5bd92 Kent Overstreet 2023-05-21  232  	 * Therefore, if we fail to get the lock, and there were waiters of the
37f612bea5bd92 Kent Overstreet 2023-05-21  233  	 * type we conflict with, we will have to issue a wakeup.
37f612bea5bd92 Kent Overstreet 2023-05-21  234  	 *
37f612bea5bd92 Kent Overstreet 2023-05-21  235  	 * Since we may be called under wait_lock (and by the wakeup code
37f612bea5bd92 Kent Overstreet 2023-05-21  236  	 * itself), we return that the wakeup has to be done instead of doing it
37f612bea5bd92 Kent Overstreet 2023-05-21  237  	 * here.
1c6fdbd8f2465d Kent Overstreet 2017-03-16  238  	 */
1c6fdbd8f2465d Kent Overstreet 2017-03-16  239  	if (type == SIX_LOCK_read && lock->readers) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  240  		preempt_disable();
1c6fdbd8f2465d Kent Overstreet 2017-03-16  241  		this_cpu_inc(*lock->readers); /* signal that we own lock */
1c6fdbd8f2465d Kent Overstreet 2017-03-16  242  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  243  		smp_mb();
1c6fdbd8f2465d Kent Overstreet 2017-03-16  244  
1fb4fe63178881 Kent Overstreet 2023-05-20  245  		old = atomic64_read(&lock->state);
1fb4fe63178881 Kent Overstreet 2023-05-20  246  		ret = !(old & l[type].lock_fail);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  247  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  248  		this_cpu_sub(*lock->readers, !ret);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  249  		preempt_enable();
1c6fdbd8f2465d Kent Overstreet 2017-03-16  250  
37f612bea5bd92 Kent Overstreet 2023-05-21  251  		if (!ret && (old & SIX_STATE_WAITING_WRITE))
84a37cbf62e044 Kent Overstreet 2022-08-26  252  			ret = -1 - SIX_LOCK_write;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  253  	} else if (type == SIX_LOCK_write && lock->readers) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  254  		if (try) {
b60c8e9e7b082a Kent Overstreet 2023-06-16  255  			atomic64_add(SIX_STATE_WRITE_LOCK, &lock->state);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  256  			smp_mb__after_atomic();
1c6fdbd8f2465d Kent Overstreet 2017-03-16  257  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  258  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  259  		ret = !pcpu_read_count(lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  260  
b60c8e9e7b082a Kent Overstreet 2023-06-16  261  		if (try && !ret) {
b60c8e9e7b082a Kent Overstreet 2023-06-16  262  			old = atomic64_sub_return(SIX_STATE_WRITE_LOCK, &lock->state);

old only set when ret is zero

b60c8e9e7b082a Kent Overstreet 2023-06-16  263  			if (old & SIX_STATE_WAITING_READ)
84a37cbf62e044 Kent Overstreet 2022-08-26  264  				ret = -1 - SIX_LOCK_read;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  265  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  266  	} else {
1fb4fe63178881 Kent Overstreet 2023-05-20  267  		v = atomic64_read(&lock->state);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  268  		do {
1fb4fe63178881 Kent Overstreet 2023-05-20  269  			new = old = v;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  270  
b60c8e9e7b082a Kent Overstreet 2023-06-16  271  			ret = !(old & l[type].lock_fail);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  272  
b60c8e9e7b082a Kent Overstreet 2023-06-16  273  			if (!ret || (type == SIX_LOCK_write && !try))
d2c86b77de5894 Kent Overstreet 2023-05-20  274  				break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  275  
b60c8e9e7b082a Kent Overstreet 2023-06-16  276  			new += l[type].lock_val;
b60c8e9e7b082a Kent Overstreet 2023-06-16  277  		} while ((v = atomic64_cmpxchg_acquire(&lock->state, old, new)) != old);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  278  
1fb4fe63178881 Kent Overstreet 2023-05-20  279  		EBUG_ON(ret && !(atomic64_read(&lock->state) & l[type].held_mask));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  280  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  281  
84a37cbf62e044 Kent Overstreet 2022-08-26  282  	if (ret > 0)
84a37cbf62e044 Kent Overstreet 2022-08-26 @283  		six_set_owner(lock, type, old, task);
                                                                                          ^^^
We're allowed to pass uninitialized data here because it's not used and
it's an inline function.  But the compiler is going to zero it anyway.
Just zero it and make the checker happy.

1c6fdbd8f2465d Kent Overstreet 2017-03-16  284  
b60c8e9e7b082a Kent Overstreet 2023-06-16  285  	EBUG_ON(type == SIX_LOCK_write && try && ret <= 0 &&
b60c8e9e7b082a Kent Overstreet 2023-06-16  286  		(atomic64_read(&lock->state) & SIX_STATE_WRITE_LOCK));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  287  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  288  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  289  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

