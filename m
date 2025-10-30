Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C270363377
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761837932; cv=none; b=EhZZSfdEE5IS8b9K6dSJfYcvKYMzQitmPhrJRbnY7ZD8iEpFQYXeT8auxZPqVLkRy2v33cf8Jh5bfDBeOSfF9hhGkufiRSu7H/+GwzcBYgPnh4fgx0WHf1qMiQN2vr0IlCBFuTtqzTXpziQmDt7SQokpJYK0eMaoQr3c/YRz8HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761837932; c=relaxed/simple;
	bh=RNRY8IlD50y1RUaso4Vh5FuFK/pE+uQofbr9CoCc3Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z+/NKvXiXHJN6ezlto4w6pRaMf4IHe0GNMDZ6sXQ5dc95bDXpjTdogQJuDxUJ7gKGKRcI7PedGDAG18wmxblo8SqTfE2KSDvA6wDotNitEgFs6yCQsZHdnFsbHlBb/hMYtEUp+ibKP53EmayGdd0GzFN5jXtMwIkzDuwxDFFGSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iukt1++n; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iukt1++n"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee130237a8so800844f8f.0
        for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761837926; x=1762442726; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErdOiL5bsHv5RI2ff4nh9YGRnXCfvWiYoGPcJh49vjs=;
        b=iukt1++nRCkcQpBotxxjSbUdgDKMwddpH0/faKYq2HkGu4siwLnu1pdqxv/m8PIntZ
         4VGU6TDWHUa8wWiHpEL6iQ/MEbk8EOQMvulhhZkbfgW2wegIpTn1qFdtfA5dbpeShdlQ
         HzyiKN7ixSEa/V4tJwKCJZYQquRyyMnoY/3j21xoGUsIeeQ+zU4nAsoAKUptiL15TBHQ
         QKQ+AI7hh/T9kk0ObIQbpoUN/yy6zMbDAOgYWYejG63Kzd//3+suCYaV5Uj2NyD8fV7z
         f4dEeWKLay45QgcbRjwT7cwOY32hpjjMmFQOklsHNmQwFqK1HRC2x3pRoLYZhHBe4GcT
         vt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761837926; x=1762442726;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErdOiL5bsHv5RI2ff4nh9YGRnXCfvWiYoGPcJh49vjs=;
        b=B/8YVWSAPbOg9NYsACHUllQuxVeXdzhsOd5yDmukENIHxUelNFN5LwVGVJXJnsJbZ3
         uGFpTKvvpaSHFRAeKPNRFkFKTbo66u9onWTascK1sP5NKA+ecY2Lt24PxEZ1Px7Tqcgz
         uAvqhL4OySEl5vVEDG6LNJAxaEESYDGJRwTRcMNdw/jYaNw3/1webUo8+U3RMHRk1TDF
         JN4l/N1ta5ZP5TCMhU7tt2EDUnWKdUbr9NyD8RmyIjdjmcpLEGdNaIR1Q55jHFxRu+fL
         V8NNVOVbLOQhQ8Eb/3cpuZCfgkvuG3CqqcZ1vDrWUCuf8cVcuKvTjUTppvhl58E46HNQ
         OHGA==
X-Gm-Message-State: AOJu0Ywy3MHnHYiu9ok1uhTJl6lgchghlXOBDwEmR0QxyJ8iu/fqfUTC
	UCOmdHmtkcc87HKwK47kThP5zWQFZvP2NSeQ637LQ5mlv+M+mbrFxBBRQGKUeDvtWZL+U4kMFjs
	pslx5
X-Gm-Gg: ASbGncu3hOTn5tXfUOGNKGVj3N1A4lvYpNtDts91J0nKzPCfd3dJpp3HlLR/GpTrf5K
	qE7S/vCNIF2kW2IKPH2YCmcoIqRLvoWS76niuTZTC5nwwpyB04DCPFcGwS7BZ7bnrhAG+09K77p
	pQekWlUpj783ORYjcIFWosCxavzNiLaenVHGj/kbKsQnkNiTvPt66uoIMlCss10mDqfjNbNdxdD
	VMMTE/W6WrvFzz19FDs6vs62jBBG48jqnnF+Ce//y9q9y49dUduIX4EBZcH6BxJgVIPZH+ZWO3u
	EM71e9Svfa04Rc8wBpsNqBtISEnOR0Fc57jtx5Loluw8Eu63O3RbpR4/zirUFy1W7eePkU1F0BX
	5+18F4bdn73/Q/jffi/iuch2JFfuVGRk8syyZCwb6bV/UTHLFJAL9tNeni39RUQxlyBus37MdHI
	tfGJAwnIc1kSav83cl
X-Google-Smtp-Source: AGHT+IFnIDkPjgbpU2aiqxN01fFWjb0RtFyeUOXZjVeOcjODtGzk6bsXnQoQbKAhzJEPspQXzPwMYw==
X-Received: by 2002:a5d:5d02:0:b0:425:7c1b:9344 with SMTP id ffacd0b85a97d-429aef82f0emr6180297f8f.15.1761837925863;
        Thu, 30 Oct 2025 08:25:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952b79absm32218547f8f.3.2025.10.30.08.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 08:25:25 -0700 (PDT)
Date: Thu, 30 Oct 2025 18:25:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Pu Lehui <pulehui@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3064/3064] kernel/locking/mutex.c:725
 __mutex_lock_common() error: uninitialized symbol 'ifs_clock'.
Message-ID: <202510302214.ngbo9ZAu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20251030152521.4tNSToe6YUm0UOwUrZWCgztpitFThM9LKpgLt0rgyN8@z>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7f38ece6b510adaa28c8e625ff574fe6357a3960
commit: a1ad9b2ed459a3e3a4a2de50e03f53036fc7ec96 [3064/3064] interference: Add mutex interference track support
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251030/202510302214.ngbo9ZAu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510302214.ngbo9ZAu-lkp@intel.com/

smatch warnings:
kernel/locking/mutex.c:725 __mutex_lock_common() error: uninitialized symbol 'ifs_clock'.

vim +/ifs_clock +725 kernel/locking/mutex.c

040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  569  static __always_inline int __sched
2f064a59a11ff9 kernel/locking/mutex.c Peter Zijlstra            2021-06-11  570  __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclass,
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  571  		    struct lockdep_map *nest_lock, unsigned long ip,
b0267507dfd018 kernel/mutex.c         Tetsuo Handa              2013-10-17  572  		    struct ww_acquire_ctx *ww_ctx, const bool use_ww_ctx)
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  573  {
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  574  	struct mutex_waiter waiter;
a40ca56577f628 kernel/locking/mutex.c Waiman Long               2016-08-26  575  	struct ww_mutex *ww;
a1ad9b2ed459a3 kernel/locking/mutex.c Pu Lehui                  2025-07-16  576  	u64 ifs_clock;
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  577  	int ret;
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  578  
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  579  	if (!use_ww_ctx)
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  580  		ww_ctx = NULL;
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  581  
427b18207a87f6 kernel/locking/mutex.c Peter Zijlstra            2016-12-23  582  	might_sleep();
ea9e0fb8fe1bdf kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  583  
e6b4457b05f36b kernel/locking/mutex.c Peter Zijlstra            2021-06-30  584  	MUTEX_WARN_ON(lock->magic != lock);
6c11c6e3d5e9e5 kernel/locking/mutex.c Sebastian Andrzej Siewior 2019-07-03  585  
a40ca56577f628 kernel/locking/mutex.c Waiman Long               2016-08-26  586  	ww = container_of(lock, struct ww_mutex, base);
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  587  	if (ww_ctx) {
0422e83d84ae24 kernel/locking/mutex.c Chris Wilson              2016-05-26  588  		if (unlikely(ww_ctx == READ_ONCE(ww->ctx)))
0422e83d84ae24 kernel/locking/mutex.c Chris Wilson              2016-05-26  589  			return -EALREADY;
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  590  
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  591  		/*
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  592  		 * Reset the wounded flag after a kill. No other process can
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  593  		 * race and wound us here since they can't have a valid owner
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  594  		 * pointer if we don't have any locks held.
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  595  		 */
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  596  		if (ww_ctx->acquired == 0)
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  597  			ww_ctx->wounded = 0;
cf702eddcd03dc kernel/locking/mutex.c Peter Zijlstra            2021-08-15  598  
cf702eddcd03dc kernel/locking/mutex.c Peter Zijlstra            2021-08-15  599  #ifdef CONFIG_DEBUG_LOCK_ALLOC
cf702eddcd03dc kernel/locking/mutex.c Peter Zijlstra            2021-08-15  600  		nest_lock = &ww_ctx->dep_map;
cf702eddcd03dc kernel/locking/mutex.c Peter Zijlstra            2021-08-15  601  #endif
0422e83d84ae24 kernel/locking/mutex.c Chris Wilson              2016-05-26  602  	}
0422e83d84ae24 kernel/locking/mutex.c Chris Wilson              2016-05-26  603  
41719b03091911 kernel/mutex.c         Peter Zijlstra            2009-01-14  604  	preempt_disable();
e4c70a6629f9c7 kernel/mutex.c         Peter Zijlstra            2011-05-24  605  	mutex_acquire_nest(&lock->dep_map, subclass, 0, nest_lock, ip);
c02260277e4720 kernel/mutex.c         Frederic Weisbecker       2009-12-02  606  
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  607  	trace_contention_begin(lock, LCB_F_MUTEX | LCB_F_SPIN);
e274795ea7b7ca kernel/locking/mutex.c Peter Zijlstra            2017-01-11  608  	if (__mutex_trylock(lock) ||
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  609  	    mutex_optimistic_spin(lock, ww_ctx, NULL)) {
76916515d9d84e kernel/locking/mutex.c Davidlohr Bueso           2014-07-30  610  		/* got the lock, yay! */
3ca0ff571b092e kernel/locking/mutex.c Peter Zijlstra            2016-08-23  611  		lock_acquired(&lock->dep_map, ip);
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  612  		if (ww_ctx)
3ca0ff571b092e kernel/locking/mutex.c Peter Zijlstra            2016-08-23  613  			ww_mutex_set_context_fastpath(ww, ww_ctx);
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  614  		trace_contention_end(lock, 0);
ac6e60ee405aa3 kernel/mutex.c         Chris Mason               2009-01-14  615  		preempt_enable();
ac6e60ee405aa3 kernel/mutex.c         Chris Mason               2009-01-14  616  		return 0;
ac6e60ee405aa3 kernel/mutex.c         Chris Mason               2009-01-14  617  	}
ac6e60ee405aa3 kernel/mutex.c         Chris Mason               2009-01-14  618  
ebf4c55c1ddbab kernel/locking/mutex.c Thomas Gleixner           2021-08-15  619  	raw_spin_lock(&lock->wait_lock);
1e820c9608eace kernel/locking/mutex.c Jason Low                 2014-06-11  620  	/*
3ca0ff571b092e kernel/locking/mutex.c Peter Zijlstra            2016-08-23  621  	 * After waiting to acquire the wait_lock, try again.
1e820c9608eace kernel/locking/mutex.c Jason Low                 2014-06-11  622  	 */
659cf9f5824a12 kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  623  	if (__mutex_trylock(lock)) {
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  624  		if (ww_ctx)
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  625  			__ww_mutex_check_waiters(lock, ww_ctx);
659cf9f5824a12 kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  626  
ec83f425dbca47 kernel/mutex.c         Davidlohr Bueso           2013-06-28  627  		goto skip_wait;

goto here.


659cf9f5824a12 kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  628  	}
ec83f425dbca47 kernel/mutex.c         Davidlohr Bueso           2013-06-28  629  
9a11b49a805665 kernel/mutex.c         Ingo Molnar               2006-07-03  630  	debug_mutex_lock_common(lock, &waiter);
c0afb0ffc06e6b kernel/locking/mutex.c Peter Zijlstra            2021-08-15  631  	waiter.task = current;
b857174e68e26f kernel/locking/mutex.c Sebastian Andrzej Siewior 2021-08-19  632  	if (use_ww_ctx)
c0afb0ffc06e6b kernel/locking/mutex.c Peter Zijlstra            2021-08-15  633  		waiter.ww_ctx = ww_ctx;
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  634  
6baa5c60a97d7f kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  635  	lock_contended(&lock->dep_map, ip);
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  636  
6baa5c60a97d7f kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  637  	if (!use_ww_ctx) {
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  638  		/* add waiting tasks to the end of the waitqueue (FIFO): */
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  639  		__mutex_add_waiter(lock, &waiter, &lock->wait_list);
6baa5c60a97d7f kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  640  	} else {
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  641  		/*
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  642  		 * Add in stamp order, waking up waiters that must kill
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  643  		 * themselves.
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  644  		 */
6baa5c60a97d7f kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  645  		ret = __ww_mutex_add_waiter(&waiter, lock, ww_ctx);
6baa5c60a97d7f kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  646  		if (ret)
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  647  			goto err_early_kill;

Goto here.

6baa5c60a97d7f kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  648  	}
6baa5c60a97d7f kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  649  
642fa448ae6b3a kernel/locking/mutex.c Davidlohr Bueso           2017-01-03  650  	set_current_state(state);
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  651  	trace_contention_begin(lock, LCB_F_MUTEX);
a1ad9b2ed459a3 kernel/locking/mutex.c Pu Lehui                  2025-07-16  652  	cgroup_ifs_enter_lock(&ifs_clock);
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  653  	for (;;) {
048661a1f963e9 kernel/locking/mutex.c Peter Zijlstra            2021-06-30  654  		bool first;
048661a1f963e9 kernel/locking/mutex.c Peter Zijlstra            2021-06-30  655  
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  656  		/*
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  657  		 * Once we hold wait_lock, we're serialized against
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  658  		 * mutex_unlock() handing the lock off to us, do a trylock
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  659  		 * before testing the error conditions to make sure we pick up
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  660  		 * the handoff.
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  661  		 */
e274795ea7b7ca kernel/locking/mutex.c Peter Zijlstra            2017-01-11  662  		if (__mutex_trylock(lock))
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  663  			goto acquired;
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  664  
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  665  		/*
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  666  		 * Check for signals and kill conditions while holding
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  667  		 * wait_lock. This ensures the lock cancellation is ordered
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  668  		 * against mutex_unlock() and wake-ups do not go missing.
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  669  		 */
3bb5f4ac55dd91 kernel/locking/mutex.c Davidlohr Bueso           2019-01-03  670  		if (signal_pending_state(state, current)) {
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  671  			ret = -EINTR;
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  672  			goto err;
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  673  		}
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  674  
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  675  		if (ww_ctx) {
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  676  			ret = __ww_mutex_check_kill(lock, &waiter, ww_ctx);
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  677  			if (ret)
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  678  				goto err;
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  679  		}
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  680  
ebf4c55c1ddbab kernel/locking/mutex.c Thomas Gleixner           2021-08-15  681  		raw_spin_unlock(&lock->wait_lock);
bd2f55361f1834 kernel/mutex.c         Thomas Gleixner           2011-03-21  682  		schedule_preempt_disabled();
9d659ae14b545c kernel/locking/mutex.c Peter Zijlstra            2016-08-23  683  
6baa5c60a97d7f kernel/locking/mutex.c Nicolai Hähnle            2016-12-21  684  		first = __mutex_waiter_is_first(lock, &waiter);
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  685  
642fa448ae6b3a kernel/locking/mutex.c Davidlohr Bueso           2017-01-03  686  		set_current_state(state);
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  687  		/*
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  688  		 * Here we order against unlock; we must either see it change
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  689  		 * state back to RUNNING and fall through the next schedule(),
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  690  		 * or we must see its unlock and acquire.
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  691  		 */
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  692  		if (__mutex_trylock_or_handoff(lock, first))
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  693  			break;
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  694  
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  695  		if (first) {
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  696  			trace_contention_begin(lock, LCB_F_MUTEX | LCB_F_SPIN);
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  697  			if (mutex_optimistic_spin(lock, ww_ctx, &waiter))
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  698  				break;
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  699  			trace_contention_begin(lock, LCB_F_MUTEX);
dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  700  		}
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  701  
ebf4c55c1ddbab kernel/locking/mutex.c Thomas Gleixner           2021-08-15  702  		raw_spin_lock(&lock->wait_lock);
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  703  	}
ebf4c55c1ddbab kernel/locking/mutex.c Thomas Gleixner           2021-08-15  704  	raw_spin_lock(&lock->wait_lock);
5bbd7e64437833 kernel/locking/mutex.c Peter Zijlstra            2016-09-02  705  acquired:
642fa448ae6b3a kernel/locking/mutex.c Davidlohr Bueso           2017-01-03  706  	__set_current_state(TASK_RUNNING);
51587bcf31d070 kernel/locking/mutex.c Davidlohr Bueso           2015-01-19  707  
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  708  	if (ww_ctx) {
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  709  		/*
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  710  		 * Wound-Wait; we stole the lock (!first_waiter), check the
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  711  		 * waiters as anyone might want to wound us.
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  712  		 */
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  713  		if (!ww_ctx->is_wait_die &&
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  714  		    !__mutex_waiter_is_first(lock, &waiter))
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  715  			__ww_mutex_check_waiters(lock, ww_ctx);
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  716  	}
08295b3b5beec9 kernel/locking/mutex.c Thomas Hellstrom          2018-06-15  717  
3a010c493271f0 kernel/locking/mutex.c Zqiang                    2021-05-17  718  	__mutex_remove_waiter(lock, &waiter);
3ca0ff571b092e kernel/locking/mutex.c Peter Zijlstra            2016-08-23  719  
ec83f425dbca47 kernel/mutex.c         Davidlohr Bueso           2013-06-28  720  	debug_mutex_free_waiter(&waiter);
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  721  
ec83f425dbca47 kernel/mutex.c         Davidlohr Bueso           2013-06-28  722  skip_wait:
ec83f425dbca47 kernel/mutex.c         Davidlohr Bueso           2013-06-28  723  	/* got the lock - cleanup and rejoice! */
c7e78cff6b7518 kernel/mutex.c         Peter Zijlstra            2008-10-16  724  	lock_acquired(&lock->dep_map, ip);
a1ad9b2ed459a3 kernel/locking/mutex.c Pu Lehui                  2025-07-16 @725  	cgroup_ifs_leave_lock(ifs_clock, IFS_MUTEX);
                                                                                                              ^^^^^^^^^

ee042be16cb455 kernel/locking/mutex.c Namhyung Kim              2022-03-22  726  	trace_contention_end(lock, 0);
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  727  
5de2055d31ea88 kernel/locking/mutex.c Waiman Long               2021-03-16  728  	if (ww_ctx)
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  729  		ww_mutex_lock_acquired(ww, ww_ctx);
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  730  
ebf4c55c1ddbab kernel/locking/mutex.c Thomas Gleixner           2021-08-15  731  	raw_spin_unlock(&lock->wait_lock);
41719b03091911 kernel/mutex.c         Peter Zijlstra            2009-01-14  732  	preempt_enable();
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  733  	return 0;
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  734  
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  735  err:
642fa448ae6b3a kernel/locking/mutex.c Davidlohr Bueso           2017-01-03  736  	__set_current_state(TASK_RUNNING);
3a010c493271f0 kernel/locking/mutex.c Zqiang                    2021-05-17  737  	__mutex_remove_waiter(lock, &waiter);
55f036ca7e74b8 kernel/locking/mutex.c Peter Ziljstra            2018-06-15  738  err_early_kill:
a1ad9b2ed459a3 kernel/locking/mutex.c Pu Lehui                  2025-07-16  739  	cgroup_ifs_leave_lock(ifs_clock, IFS_MUTEX);
                                                                                                              ^^^^^^^^^
Uninitialized?

dc1f7893a70fe4 kernel/locking/mutex.c Peter Zijlstra            2022-03-30  740  	trace_contention_end(lock, ret);
ebf4c55c1ddbab kernel/locking/mutex.c Thomas Gleixner           2021-08-15  741  	raw_spin_unlock(&lock->wait_lock);
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  742  	debug_mutex_free_waiter(&waiter);
5facae4f3549b5 kernel/locking/mutex.c Qian Cai                  2019-09-19  743  	mutex_release(&lock->dep_map, ip);
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  744  	preempt_enable();
040a0a37100563 kernel/mutex.c         Maarten Lankhorst         2013-06-24  745  	return ret;
6053ee3b32e343 kernel/mutex.c         Ingo Molnar               2006-01-09  746  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

