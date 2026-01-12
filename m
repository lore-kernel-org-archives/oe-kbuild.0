Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7458433FE2B
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205197; cv=none; b=gcMayiDGeWkd84D9bsDZk9+Zh+ia8mB8EhCcHCV90Fj3hKQPM1rtVIJH/Ffekv900pATEG/JXwv4VamEbm7roEYR0X6tin1l0Dknn1P+NuxpLY9kHMGmbsP3a++eKTP7xol+p2+yuad6nq2Dr7040wgKOQMPdxBz6m63HlEAVOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205197; c=relaxed/simple;
	bh=cVKROEBJ4p0HPjR+QMYQkOmu9I4TwmacJb1B5eCkBAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ArSFTiPYV7WYDyFDNQ3bYJypG3/CHZimFIrrpW0LinT2V/4f4y9mqfS/f3Rl8BE+52G8ud5mPXlsF+gXCKkuhgtuOuP0I3ziGfPxHROza0bVt8QKr/XGytU+al+d/JZV+WAsgQjS8/SJsLRkGTtXn/3vhLxCWQDu/+0TJcu9XEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G6G+vDjK; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G6G+vDjK"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-477632b0621so37670445e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 00:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768205189; x=1768809989; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t8PUPcy9Vx/NIi8mBIxFa8+hlU13NeAgzjfUJ+zZxDg=;
        b=G6G+vDjK1SOuttAxzYdGarosABXQJ5QE3XgjrU8DclI0kuLKCw/gTOEz8Fba+QOx0j
         MXagxrkjeWQ3iY8XaRP9To7N4QKGvmA5bJFpcPmVVEV6BpLWzr2pVYQgeKRCq+6IqZy6
         XLtFn2PnCi7D4aq0PY2ufF8462q+MXmhK8ZEBSz+kG51AywKsObJsaKazDRXOtwtRmme
         pP/0VIDO+hS3/yoKi16CLOhVBy5LljKhcNWhs6SNGbbeD8GZktl7kJAxmclcT+ub1mOi
         V6/shI9MuZ1ssxxFSFhjnhueznWggYG/GFp2EOWIFS7GthCmaiHyHl3mWkQ76SoqjNYD
         zqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205189; x=1768809989;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8PUPcy9Vx/NIi8mBIxFa8+hlU13NeAgzjfUJ+zZxDg=;
        b=hwjMNMKcybZR6KrqOXGk2MezAXx7Gg8Ko59IbVHtGjvirVcM+Rnv2Y67A8cSi5K/t5
         n2fUm2lOYi2/qb4XWQlrfcHHrN5AIT4WTrKCl5of7f65HamuE8uW+DMaihCeQ8D++2j7
         lmksA7vF4QWPpMIcvp5GMQka2hoMgrYD2E8qT1BtopzMaTxaCWhIwbUUNjsYfxxf7lLf
         cuQVJyrOCbW0wOoCE777xCa7DK5BoWF+vP1uSLySCkwcEJgSNPe0R4m54ilj3FEttrvR
         SYgv0VugFc6joc4QX5+J74xuy64QkUyeI88HjSQZq084DRKbMY80Z0f9xAclgk56vLL6
         41lQ==
X-Gm-Message-State: AOJu0YxXVg1GaN1j3SZbrQCnggWfeGaz8P5jLswMK3N3I0Z4m0t/EYec
	mZBeTVQMcGO2bMC78ujzoHBxbeBWpJOObNSTkBvRsqRJTL6TDpeF/2wPDjZjHUjpmQzw4tjr1wG
	LV1baOng=
X-Gm-Gg: AY/fxX4zQJHIjFV2JgUdtDzUz2d9VYb7JPO+aPxhFiu3gWCZRzyG3ho1Qa9kwCsC4Ar
	hVUhMAT9xl43yEWFCrv2pTaYFgzNbldxLBHDz+oZyMhj2PnJcwu4XgtVwKoUxME6InUe56rNIET
	4TyugN2QL6Kg/Ikc5y/J137Y9fD6qQ7vUs+ITLeCr5l2GejAYStGoCAp8Q0qvKgU50ywFiFfSTd
	DxSxpw7gMmuuUNesqkeA44rMWo4C2HTJT3Iv8QLopVP610uTJxGFA+/ArPn6/3JazyiSjMaUoer
	B1cAkFrXfTOiaPiyJC9py/zYpzpstDVAn1kIu6VfwV9eouMpxab6sWrVovDSszo8ZVsNjAi8I1S
	uEYxFVUTvFa33ZoT7FRl0i0Zz8dBVqZK8t/6xkPFZPxrXi+ETYecn0Dy8Elt+DgM5UqZIcCl2E9
	utUU9VNyRVC3OZHa68CsKluAfU+o4=
X-Google-Smtp-Source: AGHT+IGeRnmYl434IC1Vj01KSlKheCmNT2gQvic9wVyQ16EjldEmsOfiFUGIG4TtGQB0W4+/K+PIqg==
X-Received: by 2002:a05:600c:c4a5:b0:477:95a0:fe95 with SMTP id 5b1f17b1804b1-47d84b347ebmr203991545e9.24.1768205188859;
        Mon, 12 Jan 2026 00:06:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dadcfsm36714370f8f.3.2026.01.12.00.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:06:28 -0800 (PST)
Date: Mon, 12 Jan 2026 11:06:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux-foundation.org>,
	Martin Liu <liumartin@google.com>,
	David Rientjes <rientjes@google.com>, christian.koenig@amd.com,
	Shakeel Butt <shakeel.butt@linux.dev>,
	SeongJae Park <sj@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <liam.howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Christian Brauner <brauner@kernel.org>,
	Wei Yang <richard.weiyang@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-trace-kernel@vger.kernel.org, Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH v12 3/3] mm: Implement precise OOM killer task selection
Message-ID: <202601120452.VufCnz2j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111150249.1222944-4-mathieu.desnoyers@efficios.com>
Message-ID: <20260112080625.gjGre-YfMJhWM_bk6ckWd364Uoy_PB-xI1AUE43XGaU@z>

Hi Mathieu,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/lib-Introduce-hierarchical-per-cpu-counters/20260111-231206
base:   next-20260109
patch link:    https://lore.kernel.org/r/20260111150249.1222944-4-mathieu.desnoyers%40efficios.com
patch subject: [PATCH v12 3/3] mm: Implement precise OOM killer task selection
config: s390-randconfig-r071-20260112 (https://download.01.org/0day-ci/archive/20260112/202601120452.VufCnz2j-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601120452.VufCnz2j-lkp@intel.com/

smatch warnings:
mm/oom_kill.c:392 oom_evaluate_task() error: uninitialized symbol 'points_min'.

vim +/points_min +392 mm/oom_kill.c

7c5f64f84483bd1 Vladimir Davydov  2016-10-07  322  static int oom_evaluate_task(struct task_struct *task, void *arg)
462607ecc519b19 David Rientjes    2012-07-31  323  {
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  324  	struct oom_control *oc = arg;
72456781289a6ed Mathieu Desnoyers 2026-01-11  325  	unsigned long accuracy_under = 0, accuracy_over = 0;
72456781289a6ed Mathieu Desnoyers 2026-01-11  326  	long points, points_min, points_max;
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  327  
ac311a14c682dcd Shakeel Butt      2019-07-11  328  	if (oom_unkillable_task(task))
ac311a14c682dcd Shakeel Butt      2019-07-11  329  		goto next;
ac311a14c682dcd Shakeel Butt      2019-07-11  330  
ac311a14c682dcd Shakeel Butt      2019-07-11  331  	/* p may not have freeable memory in nodemask */
ac311a14c682dcd Shakeel Butt      2019-07-11  332  	if (!is_memcg_oom(oc) && !oom_cpuset_eligible(task, oc))
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  333  		goto next;
462607ecc519b19 David Rientjes    2012-07-31  334  
462607ecc519b19 David Rientjes    2012-07-31  335  	/*
462607ecc519b19 David Rientjes    2012-07-31  336  	 * This task already has access to memory reserves and is being killed.
a373966d1f64c04 Michal Hocko      2016-07-28  337  	 * Don't allow any other task to have access to the reserves unless
862e3073b3eed13 Michal Hocko      2016-10-07  338  	 * the task has MMF_OOM_SKIP because chances that it would release
a373966d1f64c04 Michal Hocko      2016-07-28  339  	 * any memory is quite low.
462607ecc519b19 David Rientjes    2012-07-31  340  	 */
862e3073b3eed13 Michal Hocko      2016-10-07  341  	if (!is_sysrq_oom(oc) && tsk_is_oom_victim(task)) {
12e423ba4eaed7b Lorenzo Stoakes   2025-08-12  342  		if (mm_flags_test(MMF_OOM_SKIP, task->signal->oom_mm))
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  343  			goto next;
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  344  		goto abort;
a373966d1f64c04 Michal Hocko      2016-07-28  345  	}
462607ecc519b19 David Rientjes    2012-07-31  346  
e1e12d2f3104be8 David Rientjes    2012-12-11  347  	/*
e1e12d2f3104be8 David Rientjes    2012-12-11  348  	 * If task is allocating a lot of memory and has been marked to be
e1e12d2f3104be8 David Rientjes    2012-12-11  349  	 * killed first if it triggers an oom, then select it.
e1e12d2f3104be8 David Rientjes    2012-12-11  350  	 */
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  351  	if (oom_task_origin(task)) {
9066e5cfb73cdbc Yafang Shao       2020-08-11  352  		points = LONG_MAX;
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  353  		goto select;

points_min is uninitialized.

7c5f64f84483bd1 Vladimir Davydov  2016-10-07  354  	}
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  355  
72456781289a6ed Mathieu Desnoyers 2026-01-11  356  	points = oom_badness(task, oc->totalpages, true, &accuracy_under, &accuracy_over);
72456781289a6ed Mathieu Desnoyers 2026-01-11  357  	if (points != LONG_MIN) {
72456781289a6ed Mathieu Desnoyers 2026-01-11  358  		percpu_counter_tree_approximate_min_max_range(points,
72456781289a6ed Mathieu Desnoyers 2026-01-11  359  				accuracy_under, accuracy_over,
72456781289a6ed Mathieu Desnoyers 2026-01-11  360  				&points_min, &points_max);
72456781289a6ed Mathieu Desnoyers 2026-01-11  361  	}
72456781289a6ed Mathieu Desnoyers 2026-01-11  362  	if (oc->approximate) {
72456781289a6ed Mathieu Desnoyers 2026-01-11  363  		/*
72456781289a6ed Mathieu Desnoyers 2026-01-11  364  		 * Keep the process which has the highest minimum
72456781289a6ed Mathieu Desnoyers 2026-01-11  365  		 * possible points value based on approximation.
72456781289a6ed Mathieu Desnoyers 2026-01-11  366  		 */
72456781289a6ed Mathieu Desnoyers 2026-01-11  367  		if (points == LONG_MIN || points_min < oc->chosen_points)
72456781289a6ed Mathieu Desnoyers 2026-01-11  368  			goto next;
72456781289a6ed Mathieu Desnoyers 2026-01-11  369  	} else {
72456781289a6ed Mathieu Desnoyers 2026-01-11  370  		/*
72456781289a6ed Mathieu Desnoyers 2026-01-11  371  		 * Eliminate processes which are certainly below the
72456781289a6ed Mathieu Desnoyers 2026-01-11  372  		 * chosen points minimum possible value with an
72456781289a6ed Mathieu Desnoyers 2026-01-11  373  		 * approximation.
72456781289a6ed Mathieu Desnoyers 2026-01-11  374  		 */
72456781289a6ed Mathieu Desnoyers 2026-01-11  375  		if (points == LONG_MIN || (long)(points_max - oc->chosen_points) < 0)
72456781289a6ed Mathieu Desnoyers 2026-01-11  376  			goto next;
72456781289a6ed Mathieu Desnoyers 2026-01-11  377  
72456781289a6ed Mathieu Desnoyers 2026-01-11  378  		if (oc->nr_precise < max_precise_badness_sums) {
72456781289a6ed Mathieu Desnoyers 2026-01-11  379  			oc->nr_precise++;
72456781289a6ed Mathieu Desnoyers 2026-01-11  380  			/* Precise evaluation. */
72456781289a6ed Mathieu Desnoyers 2026-01-11  381  			points_min = points_max = points = oom_badness(task, oc->totalpages, false, NULL, NULL);
72456781289a6ed Mathieu Desnoyers 2026-01-11  382  			if (points == LONG_MIN || (long)(points - oc->chosen_points) < 0)
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  383  				goto next;
72456781289a6ed Mathieu Desnoyers 2026-01-11  384  		}
72456781289a6ed Mathieu Desnoyers 2026-01-11  385  	}
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  386  
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  387  select:
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  388  	if (oc->chosen)
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  389  		put_task_struct(oc->chosen);
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  390  	get_task_struct(task);
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  391  	oc->chosen = task;
72456781289a6ed Mathieu Desnoyers 2026-01-11 @392  	oc->chosen_points = points_min;
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  393  next:
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  394  	return 0;
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  395  abort:
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  396  	if (oc->chosen)
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  397  		put_task_struct(oc->chosen);
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  398  	oc->chosen = (void *)-1UL;
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  399  	return 1;
462607ecc519b19 David Rientjes    2012-07-31  400  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

