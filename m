Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CBD1A7AE3
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 12:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763556233; cv=none; b=tc/R0IHgHfhXTLZwBs8eTcqenWJhsuVyteLYyNOoU/0+v2lj4vjgF/RB4tVPxagqPvS+lDGWNV/uoa/+/MNovNXDX/tADJkpt/tvazK2AKmcVtb3q60QU+8/PE+r0IYGw6+SF7sZxHHNfwuYze6dcj39ktF5qwCGM+oAcgbkkz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763556233; c=relaxed/simple;
	bh=2X5nrygNSf4BsWubQXup2VVbA7X2z3FzeZPjla4j8VM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YVmnvj5r11K3Kc587VdNFek22K5mUBP9SxjjXKfv6hIM/TEVJF7oBuLZO85geGiLV5qS4QgJhMeIAgt8nwZ36ICGNPA6jEmc2KPUV6MxzMT5L+a4tNCEJhA8Y78V2LDFG0d3VnVMYPVfPTM77+rpNYaRzmhEtr5SqyLBpAf4rIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X8ImZ5Ra; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X8ImZ5Ra"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso16948405e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 04:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763556227; x=1764161027; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeXvl/SGNXep+Czh+cODxrl1kSkPMoLzuEu7dTGZO+o=;
        b=X8ImZ5RaZAIsNhGw6uy4RqABnizhF6xOycnYslbEnCjp8vjouIzgqLoHLZoIwyPOC/
         0KvTk28YL70ssgKGFhmDsx52e2nvYbjuNWhFskr0QI42ehUAtftTjaSN/YX98L0YFSQm
         d5vEl6aA9z4SvdBl9gRjEZAUFWVkIDaE2tW+g89l/Gp221EippwCq3/8OoYBGA8V2M3i
         rZB2e3b5GHsRNRXjtGRJXLwgB9CKBUJh++I6/PiZDvzMhWZE1Aq/CspICTkVQJ4xK2/V
         pd3vsux8G2o9LbdvhU878iAglrFWHt84ojgyyN0ga31AfJaa0nho+D6depkdDL93m0ke
         9yEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763556227; x=1764161027;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeXvl/SGNXep+Czh+cODxrl1kSkPMoLzuEu7dTGZO+o=;
        b=i0gUYa2nGSkeRNLcUCBB4MhjiQa89/b4ObZ0Yj2asr4sjks5IWAdKZjmjCas1ReDnH
         rIuYiwT8MxZolOYSFa7j2fJe6vt/JCAyqL6jU1Q6ZFYTio/VC4wUiX3KvRnL892NgzJz
         Y+CsV2DZiidshLJ9a3JZLKcpc8zZ5I1Ln02uTz6LskpRnxOvPRkQDJY+iLZ7RQzrEUda
         OSMwU8D5JTt7rEa0qXGTFu1N1X8rSbX62txf7bMHny2+egs8xSS2KU3TQqvz48qsnj1u
         0Qm+gUV/p+W5g49+1umfzwZVrdKg+ruukMLJKw3YfTPeXmDVfgyd8KGX7mdOD+J5NECE
         ersQ==
X-Gm-Message-State: AOJu0Yxe10UtyyQ7A8PVv9EKiBla5iMwu9Ztu7+/au9GV3VphWleRzWg
	W17EO7lu2YQeNXKvrHxkPh4FkWsawEo544nQ9DHlOWHfo9Vh5AEucPeKAU5BMNqFE/oR+BU4adY
	bujyX
X-Gm-Gg: ASbGncs/P1kRJ7ykpszI8Sr0hR6grOUd6cmVWKE9U5SEoA4HxItmomaP3ubTp2InzuJ
	XEUQowAmkQWAlrSsW/qRlR23mnAy8LSJ2+a5yYlNCoD5DbsepJbLCotqTWlz0mRyLKbtwCKRq4r
	S5ZktCyUjj4TmsqEM+qfU5QpIc2M4TmTU+qNmcuFaqoroe3gxDXCjQSUDRPvwp2dk2yj9hSdJd7
	0Gc/fLp23z+KGatHl97FWc8lDa6u0efDDffvKXHjl0hMy6CmqerFz5McxFwvvYqIT/42BuW2GcR
	ZDbLg8lN5X88VjPsYpqhZw8ABWtkr++pJcqTkaDSWZ2nFDlHuspWMpsfyIlntJxwy7/OSbEEWPJ
	SQfXi6TlqJMZ4yQHhgzGudAJqyumqW/ej8w52AtUWaVC4BqYBvHGo2EJfe8OaJtywesvyH+YESK
	bl1HFCABM2pTfnwY/ls1uRIfrlQpM=
X-Google-Smtp-Source: AGHT+IHgmGvp6BMRxfFCZlRzKEvbl02rgcYBhM/ElWmAs7bH1NOL4MMwnMfIzTNNGzYosZjD5Khu7A==
X-Received: by 2002:a05:600c:4f07:b0:477:63b5:6f3a with SMTP id 5b1f17b1804b1-4778fead9a4mr187656715e9.27.1763556226881;
        Wed, 19 Nov 2025 04:43:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a9d198a0sm41815345e9.1.2025.11.19.04.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:43:46 -0800 (PST)
Date: Wed, 19 Nov 2025 15:43:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Peter Ziljstra <peterz@infradead.org>
Subject: Re: [PATCH] sched/psi: Streamline the flow in psi_group_change
Message-ID: <202511161642.NB7XYtH9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113122254.40445-1-tvrtko.ursulin@igalia.com>
Message-ID: <20251119124343.J0QllxtRTba4sDI_X6IPVXQY7LhFktNONJJ3QqD1nK4@z>

Hi Tvrtko,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/sched-psi-Streamline-the-flow-in-psi_group_change/20251113-203009
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251113122254.40445-1-tvrtko.ursulin%40igalia.com
patch subject: [PATCH] sched/psi: Streamline the flow in psi_group_change
config: sh-randconfig-r071-20251115 (https://download.01.org/0day-ci/archive/20251116/202511161642.NB7XYtH9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511161642.NB7XYtH9-lkp@intel.com/

smatch warnings:
kernel/sched/psi.c:855 psi_group_change() error: uninitialized symbol 'state_mask'.

vim +/state_mask +855 kernel/sched/psi.c

36b238d5717279 Johannes Weiner    2020-03-16  796  static void psi_group_change(struct psi_group *group, int cpu,
3840cbe24cf060 Johannes Weiner    2024-10-03  797  			     unsigned int clear, unsigned int set,
570c8efd5eb79c Peter Zijlstra     2025-05-23  798  			     u64 now, bool wake_clock)
eb414681d5a07d Johannes Weiner    2018-10-26  799  {
eb414681d5a07d Johannes Weiner    2018-10-26  800  	struct psi_group_cpu *groupc;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  801  	unsigned long t, m;
71dbdde7914d32 Johannes Weiner    2022-08-26  802  	u32 state_mask;
eb414681d5a07d Johannes Weiner    2018-10-26  803  
ddae0ca2a8fe12 John Stultz        2024-06-18  804  	lockdep_assert_rq_held(cpu_rq(cpu));
eb414681d5a07d Johannes Weiner    2018-10-26  805  	groupc = per_cpu_ptr(group->pcpu, cpu);
eb414681d5a07d Johannes Weiner    2018-10-26  806  
71dbdde7914d32 Johannes Weiner    2022-08-26  807  	/*
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  808  	 * TSK_ONCPU does not have a corresponding task count - it's just a
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  809  	 * boolean flag directly encoded in the state mask. Clear, set, or carry
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  810  	 * the current state if no changes are requested.
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  811  	 *
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  812  	 * The rest of the state mask is calculated based on the task counts.
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  813  	 * Update those first, then construct the mask.
71dbdde7914d32 Johannes Weiner    2022-08-26  814  	 */
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  815  	m = clear;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  816  	for_each_set_bit(t, &m, ARRAY_SIZE(groupc->tasks)) {
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  817  		if (likely(groupc->tasks[t])) {
9d10a13d1e4c34 Charan Teja Reddy  2021-04-16  818  			groupc->tasks[t]--;
9d10a13d1e4c34 Charan Teja Reddy  2021-04-16  819  		} else if (!psi_bug) {
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  820  			printk_deferred(KERN_ERR "psi: task underflow! cpu=%d t=%lu tasks=[%u %u %u %u] clear=%x set=%x\n",
eb414681d5a07d Johannes Weiner    2018-10-26  821  					cpu, t, groupc->tasks[0],
eb414681d5a07d Johannes Weiner    2018-10-26  822  					groupc->tasks[1], groupc->tasks[2],
71dbdde7914d32 Johannes Weiner    2022-08-26  823  					groupc->tasks[3], clear, set);
eb414681d5a07d Johannes Weiner    2018-10-26  824  			psi_bug = 1;
eb414681d5a07d Johannes Weiner    2018-10-26  825  		}
eb414681d5a07d Johannes Weiner    2018-10-26  826  	}
eb414681d5a07d Johannes Weiner    2018-10-26  827  
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  828  	m = set;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  829  	for_each_set_bit(t, &m, ARRAY_SIZE(groupc->tasks))
eb414681d5a07d Johannes Weiner    2018-10-26  830  		groupc->tasks[t]++;
eb414681d5a07d Johannes Weiner    2018-10-26  831  
34f26a15611afb Chengming Zhou     2022-09-07  832  	if (!group->enabled) {
34f26a15611afb Chengming Zhou     2022-09-07  833  		/*
34f26a15611afb Chengming Zhou     2022-09-07  834  		 * On the first group change after disabling PSI, conclude
34f26a15611afb Chengming Zhou     2022-09-07  835  		 * the current state and flush its time. This is unlikely
34f26a15611afb Chengming Zhou     2022-09-07  836  		 * to matter to the user, but aggregation (get_recent_times)
34f26a15611afb Chengming Zhou     2022-09-07  837  		 * may have already incorporated the live state into times_prev;
34f26a15611afb Chengming Zhou     2022-09-07  838  		 * avoid a delta sample underflow when PSI is later re-enabled.
34f26a15611afb Chengming Zhou     2022-09-07  839  		 */
34f26a15611afb Chengming Zhou     2022-09-07  840  		if (unlikely(groupc->state_mask & (1 << PSI_NONIDLE)))
34f26a15611afb Chengming Zhou     2022-09-07  841  			record_times(groupc, now);
34f26a15611afb Chengming Zhou     2022-09-07  842  
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  843  		if (unlikely(clear & TSK_ONCPU))
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  844  			state_mask = 0;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  845  		else if (unlikely(set & TSK_ONCPU))
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  846  			state_mask = PSI_ONCPU;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  847  		else
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  848  			state_mask = groupc->state_mask & PSI_ONCPU;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  849  
34f26a15611afb Chengming Zhou     2022-09-07  850  		groupc->state_mask = state_mask;
34f26a15611afb Chengming Zhou     2022-09-07  851  
34f26a15611afb Chengming Zhou     2022-09-07  852  		return;

we return on this path where state_mask is set.

34f26a15611afb Chengming Zhou     2022-09-07  853  	}
34f26a15611afb Chengming Zhou     2022-09-07  854  
0ec208ce983492 Tvrtko Ursulin     2024-06-25 @855  	state_mask = test_states(groupc->tasks, state_mask);
                                                                                                ^^^^^^^^^^
state_mask is totally uninitialized here.

7fae6c8171d20a Chengming Zhou     2021-03-03  856  
7fae6c8171d20a Chengming Zhou     2021-03-03  857  	/*
7fae6c8171d20a Chengming Zhou     2021-03-03  858  	 * Since we care about lost potential, a memstall is FULL
7fae6c8171d20a Chengming Zhou     2021-03-03  859  	 * when there are no other working tasks, but also when
7fae6c8171d20a Chengming Zhou     2021-03-03  860  	 * the CPU is actively reclaiming and nothing productive
7fae6c8171d20a Chengming Zhou     2021-03-03  861  	 * could run even if it were runnable. So when the current
7fae6c8171d20a Chengming Zhou     2021-03-03  862  	 * task in a cgroup is in_memstall, the corresponding groupc
7fae6c8171d20a Chengming Zhou     2021-03-03  863  	 * on that cpu is in PSI_MEM_FULL state.
7fae6c8171d20a Chengming Zhou     2021-03-03  864  	 */
71dbdde7914d32 Johannes Weiner    2022-08-26  865  	if (unlikely((state_mask & PSI_ONCPU) && cpu_curr(cpu)->in_memstall))
7fae6c8171d20a Chengming Zhou     2021-03-03  866  		state_mask |= (1 << PSI_MEM_FULL);
7fae6c8171d20a Chengming Zhou     2021-03-03  867  
34f26a15611afb Chengming Zhou     2022-09-07  868  	record_times(groupc, now);
34f26a15611afb Chengming Zhou     2022-09-07  869  
33b2d6302abc4c Suren Baghdasaryan 2019-05-14  870  	groupc->state_mask = state_mask;
33b2d6302abc4c Suren Baghdasaryan 2019-05-14  871  
65457b74aa9437 Domenico Cerasuolo 2023-03-30  872  	if (state_mask & group->rtpoll_states)
65457b74aa9437 Domenico Cerasuolo 2023-03-30  873  		psi_schedule_rtpoll_work(group, 1, false);
36b238d5717279 Johannes Weiner    2020-03-16  874  
36b238d5717279 Johannes Weiner    2020-03-16  875  	if (wake_clock && !delayed_work_pending(&group->avgs_work))
36b238d5717279 Johannes Weiner    2020-03-16  876  		schedule_delayed_work(&group->avgs_work, PSI_FREQ);
eb414681d5a07d Johannes Weiner    2018-10-26  877  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

