Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E7219B3FF
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jul 2024 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721142193; cv=none; b=jOhfc87GYa5kXhDj4BvgEuOEFlU1aobAlVUXK3wxSfEbQSPZH+GCo1sDPyjmMphLQ6CRTHGQ4RfJHuF7PrA7kggUhsN4WxrcIU6wefAXZeY46cdVtXhqVWnHe7Ryf3rClFu9bz3Bl8QVOOlJN7lpVfErdDhkb+PqnfQAWseXx4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721142193; c=relaxed/simple;
	bh=hjs5DlZOuMWXjqzAEX8Rv2D5HhP4Qr7cLbqzD1j1+GE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p6x9I260mq8X25DwkJP8KqKn5vKznszayeSk4F2NOlEVwZyk7AH7nXu07GmfpdmwCC8OARM4l+XGVsBKnB6CI8dTqvIFKJI9QjRETLQdKseNWDMsXRyX1MTiKzM/08YZDyb5tA80Daqip5uSuItd9NmBnQLfbEjpwMa1lepVfwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=An3okVAX; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="An3okVAX"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3dab349467dso1894302b6e.1
        for <oe-kbuild@lists.linux.dev>; Tue, 16 Jul 2024 08:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721142190; x=1721746990; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1irt/rbB3dp4bUsxkLZ96fcuhTyn85RtkSKyZxDsom8=;
        b=An3okVAXPvpioou1Ab2jJJvDwB4u9aLukQa2H1ZP1VG7tkkxUNkJhbskcT0Wq3UVIO
         /R0N1xSWzBdYzIuahcqqIvFPXNUe4XZF1rGaPYNcHZaU0WbDt+zHNxh0aM33T/qYdRla
         VVUjLPA4qDn91Q3RJnqNrDkPWzkL50fZz/y5+P/m8BepAlmzepG6jgeVQF9iU/jex1ew
         yTbl06Cf+Zi52TVsjsRXvwFcYZ+Zp/u57gbAOLJ6i1ona2EZkBNDY0CSEe2gseUwcjLX
         JuOFzn4OGCd4Uu4KPPk8cduzlvxWANu9bef7+mjPBu6748dHBNa9iM2Y9R81AyhoYIbv
         4Cgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721142190; x=1721746990;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1irt/rbB3dp4bUsxkLZ96fcuhTyn85RtkSKyZxDsom8=;
        b=bmKDhnXoJ27K+L5K4Am5SBPdBRNkanFyEHuTqXQJt3x1fR0mfRJNqlhZdNuTWyspgj
         Y6coesZuohnyKfY1EUTGZM29pLbFn2gGjgRH1/Cp5+oUJiCG4F2A792eSHoqorjfTbtp
         TFpxR6Pkk0VUuyH9PPlPmgEKniD79xpXRGm8uRIP+eST7HfeZEerm8FRojVyfTRMTP/i
         +aiQnTdUIrrQ0tym0jXtepB8e8uI/WPGpLsMJpWCYdI55N7hH/5lHeWeyl4rT9bgRVES
         ud1VPqP/fQCSGyNvgizl/qsJ6zhICRFDzZVLy8y44Nej2NSZ9/TEpm8NEOwfggYRak8T
         OQxg==
X-Gm-Message-State: AOJu0Yy0TSvLc+s1PywwmPNwDRq0xoPUAEIc33SA9UiL3aRMqSRzg97z
	2T1bgXglhXGsEQT3YURfDvTibc9LJ1yPLZMKNOW4w+SO9HQdyE/f0mZjWc5TY7GimKY8pmjIuLK
	d
X-Google-Smtp-Source: AGHT+IG+sdxMoIzChxlyzhJJPfAiEksj8xMcZPNaKaeh/fyQKu/DCGOcDerYPjdYSOhF5KmGTuLdHw==
X-Received: by 2002:a05:6870:9686:b0:25a:6d14:f84a with SMTP id 586e51a60fabf-260bdf8a16fmr1872610fac.42.1721142189410;
        Tue, 16 Jul 2024 08:03:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:b5d2:9b28:de1e:aebb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2607530c9a0sm1358188fac.58.2024.07.16.08.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 08:03:09 -0700 (PDT)
Date: Tue, 16 Jul 2024 08:48:36 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Roman Gushchin <roman.gushchin@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.2 3/5] mm/memcontrol.c:2283
 try_charge_memcg() error: uninitialized symbol 'mem_over_limit'.
Message-ID: <dea21c54-aa10-44f6-928d-ea77466e6d6f@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.2
head:   27b1393eb022422f09a7d759fb6af8ab906e00c8
commit: 807efdc7b6f795d3bb233527f2c659fecc6cc2cc [3/5] mm: memcg: merge multiple page_counters into a single structure
config: x86_64-randconfig-161-20240716 (https://download.01.org/0day-ci/archive/20240716/202407162033.CfEAK9iq-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407162033.CfEAK9iq-lkp@intel.com/

smatch warnings:
mm/memcontrol.c:2283 try_charge_memcg() error: uninitialized symbol 'mem_over_limit'.

vim +/mem_over_limit +2283 mm/memcontrol.c

e548ad4a7cbf76 Roman Gushchin    2024-06-24  2161  int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
0029e19ebf84dc Michal Hocko      2014-08-06  2162  		     unsigned int nr_pages)
8a9f3ccd24741b Balbir Singh      2008-02-07  2163  {
a983b5ebee5720 Johannes Weiner   2018-01-31  2164  	unsigned int batch = max(MEMCG_CHARGE_BATCH, nr_pages);
d977aa939fcaff Chris Down        2020-08-06  2165  	int nr_retries = MAX_RECLAIM_RETRIES;
6539cc053869bd Johannes Weiner   2014-08-06  2166  	struct mem_cgroup *mem_over_limit;
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  2167  	struct page_counter *counter;
6539cc053869bd Johannes Weiner   2014-08-06  2168  	unsigned long nr_reclaimed;
a4ebf1b6ca1e01 Vasily Averin     2021-11-05  2169  	bool passed_oom = false;
73b73bac90d974 Yosry Ahmed       2022-07-14  2170  	unsigned int reclaim_options = MEMCG_RECLAIM_MAY_SWAP;
b70a2a21dc9d4a Johannes Weiner   2014-10-09  2171  	bool drained = false;
d6e103a757fa78 Roman Gushchin    2022-07-01  2172  	bool raised_max_event = false;
e22c6ed90aa91a Johannes Weiner   2020-08-06  2173  	unsigned long pflags;
a636b327f73114 KAMEZAWA Hiroyuki 2009-01-07  2174  
6539cc053869bd Johannes Weiner   2014-08-06  2175  retry:
b6b6cc72bc404c Michal Hocko      2014-04-07  2176  	if (consume_stock(memcg, nr_pages))
10d53c748bc953 Tejun Heo         2015-11-05  2177  		return 0;
8a9f3ccd24741b Balbir Singh      2008-02-07  2178  
7941d2145abc4d Johannes Weiner   2016-01-14  2179  	if (!do_memsw_account() ||
807efdc7b6f795 Roman Gushchin    2024-07-16  2180  	    page_counter_try_charge(&memcg->memory, MCT_MEMSW, batch, &counter)) {
807efdc7b6f795 Roman Gushchin    2024-07-16  2181  		if (page_counter_try_charge(&memcg->memory, MCT_MEM, batch, &counter))
6539cc053869bd Johannes Weiner   2014-08-06  2182  			goto done_restock;
7941d2145abc4d Johannes Weiner   2016-01-14  2183  		if (do_memsw_account())
807efdc7b6f795 Roman Gushchin    2024-07-16  2184  			page_counter_uncharge(&memcg->memory, MCT_MEMSW, batch);
3fbe724424fb10 Johannes Weiner   2014-10-09  2185  	} else {
73b73bac90d974 Yosry Ahmed       2022-07-14  2186  		reclaim_options &= ~MEMCG_RECLAIM_MAY_SWAP;
3fbe724424fb10 Johannes Weiner   2014-10-09  2187  	}
6539cc053869bd Johannes Weiner   2014-08-06  2188  
6539cc053869bd Johannes Weiner   2014-08-06  2189  	if (batch > nr_pages) {
6539cc053869bd Johannes Weiner   2014-08-06  2190  		batch = nr_pages;
6539cc053869bd Johannes Weiner   2014-08-06  2191  		goto retry;
6539cc053869bd Johannes Weiner   2014-08-06  2192  	}
6539cc053869bd Johannes Weiner   2014-08-06  2193  
89a2848381b5fc Johannes Weiner   2016-10-27  2194  	/*
89a2848381b5fc Johannes Weiner   2016-10-27  2195  	 * Prevent unbounded recursion when reclaim operations need to
89a2848381b5fc Johannes Weiner   2016-10-27  2196  	 * allocate memory. This might exceed the limits temporarily,
89a2848381b5fc Johannes Weiner   2016-10-27  2197  	 * but we prefer facilitating memory reclaim and getting back
89a2848381b5fc Johannes Weiner   2016-10-27  2198  	 * under the limit over triggering OOM kills in these cases.
89a2848381b5fc Johannes Weiner   2016-10-27  2199  	 */
89a2848381b5fc Johannes Weiner   2016-10-27  2200  	if (unlikely(current->flags & PF_MEMALLOC))
89a2848381b5fc Johannes Weiner   2016-10-27  2201  		goto force;

mem_over_limit is uninitialized.  raised_max_event is false.  Perhaps
PF_MEMALLOC can't be set on the first iteration?

89a2848381b5fc Johannes Weiner   2016-10-27  2202  
06b078fc065fe1 Johannes Weiner   2014-08-06  2203  	if (unlikely(task_in_memcg_oom(current)))
06b078fc065fe1 Johannes Weiner   2014-08-06  2204  		goto nomem;
06b078fc065fe1 Johannes Weiner   2014-08-06  2205  
d0164adc89f6bb Mel Gorman        2015-11-06  2206  	if (!gfpflags_allow_blocking(gfp_mask))
6539cc053869bd Johannes Weiner   2014-08-06  2207  		goto nomem;
6539cc053869bd Johannes Weiner   2014-08-06  2208  
807efdc7b6f795 Roman Gushchin    2024-07-16  2209  	mem_over_limit = mem_cgroup_from_counter(counter);
e27be240df53f1 Johannes Weiner   2018-04-10  2210  	memcg_memory_event(mem_over_limit, MEMCG_MAX);
d6e103a757fa78 Roman Gushchin    2022-07-01  2211  	raised_max_event = true;
241994ed8649f7 Johannes Weiner   2015-02-11  2212  
e22c6ed90aa91a Johannes Weiner   2020-08-06  2213  	psi_memstall_enter(&pflags);
b70a2a21dc9d4a Johannes Weiner   2014-10-09  2214  	nr_reclaimed = try_to_free_mem_cgroup_pages(mem_over_limit, nr_pages,
68cd9050d871e4 Dan Schatzberg    2024-01-03  2215  						    gfp_mask, reclaim_options, NULL);
e22c6ed90aa91a Johannes Weiner   2020-08-06  2216  	psi_memstall_leave(&pflags);
6539cc053869bd Johannes Weiner   2014-08-06  2217  
61e02c745721a3 Johannes Weiner   2014-08-06  2218  	if (mem_cgroup_margin(mem_over_limit) >= nr_pages)
6539cc053869bd Johannes Weiner   2014-08-06  2219  		goto retry;
28c34c291e746a Johannes Weiner   2014-08-06  2220  
b70a2a21dc9d4a Johannes Weiner   2014-10-09  2221  	if (!drained) {
6d3d6aa22af305 Johannes Weiner   2014-12-10  2222  		drain_all_stock(mem_over_limit);
b70a2a21dc9d4a Johannes Weiner   2014-10-09  2223  		drained = true;
b70a2a21dc9d4a Johannes Weiner   2014-10-09  2224  		goto retry;
b70a2a21dc9d4a Johannes Weiner   2014-10-09  2225  	}
b70a2a21dc9d4a Johannes Weiner   2014-10-09  2226  
28c34c291e746a Johannes Weiner   2014-08-06  2227  	if (gfp_mask & __GFP_NORETRY)
28c34c291e746a Johannes Weiner   2014-08-06  2228  		goto nomem;
6539cc053869bd Johannes Weiner   2014-08-06  2229  	/*
6539cc053869bd Johannes Weiner   2014-08-06  2230  	 * Even though the limit is exceeded at this point, reclaim
6539cc053869bd Johannes Weiner   2014-08-06  2231  	 * may have been able to free some pages.  Retry the charge
6539cc053869bd Johannes Weiner   2014-08-06  2232  	 * before killing the task.
6539cc053869bd Johannes Weiner   2014-08-06  2233  	 *
6539cc053869bd Johannes Weiner   2014-08-06  2234  	 * Only for regular pages, though: huge pages are rather
6539cc053869bd Johannes Weiner   2014-08-06  2235  	 * unlikely to succeed so close to the limit, and we fall back
6539cc053869bd Johannes Weiner   2014-08-06  2236  	 * to regular pages anyway in case of failure.
6539cc053869bd Johannes Weiner   2014-08-06  2237  	 */
61e02c745721a3 Johannes Weiner   2014-08-06  2238  	if (nr_reclaimed && nr_pages <= (1 << PAGE_ALLOC_COSTLY_ORDER))
6539cc053869bd Johannes Weiner   2014-08-06  2239  		goto retry;
6539cc053869bd Johannes Weiner   2014-08-06  2240  	/*
6539cc053869bd Johannes Weiner   2014-08-06  2241  	 * At task move, charge accounts can be doubly counted. So, it's
6539cc053869bd Johannes Weiner   2014-08-06  2242  	 * better to wait until the end of task_move if something is going on.
6539cc053869bd Johannes Weiner   2014-08-06  2243  	 */
b9eaacb1db2b88 Roman Gushchin    2024-06-24  2244  	if (memcg1_wait_acct_move(mem_over_limit))
6539cc053869bd Johannes Weiner   2014-08-06  2245  		goto retry;
7a81b88cb53e33 KAMEZAWA Hiroyuki 2009-01-07  2246  
9b1306192d3357 Johannes Weiner   2014-08-06  2247  	if (nr_retries--)
9b1306192d3357 Johannes Weiner   2014-08-06  2248  		goto retry;
9b1306192d3357 Johannes Weiner   2014-08-06  2249  
38d384932ed1b5 Shakeel Butt      2019-07-11  2250  	if (gfp_mask & __GFP_RETRY_MAYFAIL)
29ef680ae7c211 Michal Hocko      2018-08-17  2251  		goto nomem;
29ef680ae7c211 Michal Hocko      2018-08-17  2252  
a4ebf1b6ca1e01 Vasily Averin     2021-11-05  2253  	/* Avoid endless loop for tasks bypassed by the oom killer */
a4ebf1b6ca1e01 Vasily Averin     2021-11-05  2254  	if (passed_oom && task_is_dying())
a4ebf1b6ca1e01 Vasily Averin     2021-11-05  2255  		goto nomem;
6d61ef409d6ba1 Balbir Singh      2009-01-07  2256  
29ef680ae7c211 Michal Hocko      2018-08-17  2257  	/*
29ef680ae7c211 Michal Hocko      2018-08-17  2258  	 * keep retrying as long as the memcg oom killer is able to make
29ef680ae7c211 Michal Hocko      2018-08-17  2259  	 * a forward progress or bypass the charge if the oom killer
29ef680ae7c211 Michal Hocko      2018-08-17  2260  	 * couldn't make any progress.
29ef680ae7c211 Michal Hocko      2018-08-17  2261  	 */
becdf89d776c8f Shakeel Butt      2022-03-22  2262  	if (mem_cgroup_oom(mem_over_limit, gfp_mask,
becdf89d776c8f Shakeel Butt      2022-03-22  2263  			   get_order(nr_pages * PAGE_SIZE))) {
a4ebf1b6ca1e01 Vasily Averin     2021-11-05  2264  		passed_oom = true;
d977aa939fcaff Chris Down        2020-08-06  2265  		nr_retries = MAX_RECLAIM_RETRIES;
29ef680ae7c211 Michal Hocko      2018-08-17  2266  		goto retry;
29ef680ae7c211 Michal Hocko      2018-08-17  2267  	}
7a81b88cb53e33 KAMEZAWA Hiroyuki 2009-01-07  2268  nomem:
1461e8c2b6af89 Shakeel Butt      2022-03-22  2269  	/*
1461e8c2b6af89 Shakeel Butt      2022-03-22  2270  	 * Memcg doesn't have a dedicated reserve for atomic
1461e8c2b6af89 Shakeel Butt      2022-03-22  2271  	 * allocations. But like the global atomic pool, we need to
1461e8c2b6af89 Shakeel Butt      2022-03-22  2272  	 * put the burden of reclaim on regular allocation requests
1461e8c2b6af89 Shakeel Butt      2022-03-22  2273  	 * and let these go through as privileged allocations.
1461e8c2b6af89 Shakeel Butt      2022-03-22  2274  	 */
1461e8c2b6af89 Shakeel Butt      2022-03-22  2275  	if (!(gfp_mask & (__GFP_NOFAIL | __GFP_HIGH)))
7a81b88cb53e33 KAMEZAWA Hiroyuki 2009-01-07  2276  		return -ENOMEM;
10d53c748bc953 Tejun Heo         2015-11-05  2277  force:
d6e103a757fa78 Roman Gushchin    2022-07-01  2278  	/*
d6e103a757fa78 Roman Gushchin    2022-07-01  2279  	 * If the allocation has to be enforced, don't forget to raise
d6e103a757fa78 Roman Gushchin    2022-07-01  2280  	 * a MEMCG_MAX event.
d6e103a757fa78 Roman Gushchin    2022-07-01  2281  	 */
d6e103a757fa78 Roman Gushchin    2022-07-01  2282  	if (!raised_max_event)
d6e103a757fa78 Roman Gushchin    2022-07-01 @2283  		memcg_memory_event(mem_over_limit, MEMCG_MAX);
                                                                                   ^^^^^^^^^^^^^^
Uninitialized

d6e103a757fa78 Roman Gushchin    2022-07-01  2284  
10d53c748bc953 Tejun Heo         2015-11-05  2285  	/*
10d53c748bc953 Tejun Heo         2015-11-05  2286  	 * The allocation either can't fail or will lead to more memory
10d53c748bc953 Tejun Heo         2015-11-05  2287  	 * being freed very soon.  Allow memory usage go over the limit
10d53c748bc953 Tejun Heo         2015-11-05  2288  	 * temporarily by force charging it.
10d53c748bc953 Tejun Heo         2015-11-05  2289  	 */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

