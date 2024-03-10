Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170C5111A1
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Mar 2024 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710065110; cv=none; b=Er48f9UgfgK/ezYrdTnD9OlLtc3KDPrTqH3idd2MyoiHPMGSzQJyhuk4HQ9pUoXvUl7NEMjnW6gVER4iPWPNzhWZsCcRrrREWlvzL23LrB7GdUev0hYU/7lgoZGvUnRH/uGBWW2quiYaiOPMJOVTclAuCm6dKiKzi7ctX3fVrXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710065110; c=relaxed/simple;
	bh=PJFoXEufT80uZmnrskhFdxSimpOPiCgv5pW/lI3M0VM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B7EDGvRBMkrky/x4IEi++ffaC7PzQmak/0DJh4ShY+XSa6yyfxPdz49Hz6QMSXQMkUliX34yPOHpPefcTJHwUlKa4yxaaDy7YIkTI+aXcdDCZLGWIE+gCUm88FtiPlCBG9FI4SJNnATJyj9yRl28cxRxUW2asOQeeoqhDw1lB7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atkNDJS1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atkNDJS1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710065107; x=1741601107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PJFoXEufT80uZmnrskhFdxSimpOPiCgv5pW/lI3M0VM=;
  b=atkNDJS1uGupDGThd3RAxjASGJPTSrW3hQuFO7gREgAsv0OJ9LvAMGkK
   LcvTEdyGoWiKwRT1DOS3X5fBHfmXHdJ6iWs+uch0tRvYmYfrXr+dd1ggu
   5s1wEhDK6Kus/x8kImOHQYFBAXD1/KKjOFAZw/9D3cr4RAtORjqwPdcv6
   Z0z65RNA1co/zWmd4nB5sYZeOYFklh1IiRhCsf0bMC8QcS256pq85KHdy
   qLmGXdRGAHcaCMvQ1fyMLs4D0lgGwljpAOxHWPOmwVug3YBGc+/GyXwVn
   C6OWqSzHr0CSD13G+h+FepGlv2PJCGfdj1jGSdryIzKsi5USI1u6WNqjT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="22196142"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="22196142"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 03:05:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="15454106"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Mar 2024 03:05:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjG3C-00089z-2Q;
	Sun, 10 Mar 2024 10:05:02 +0000
Date: Sun, 10 Mar 2024 18:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH 2/3] x86/mm: make sure LAM is up-to-date during
 context switching
Message-ID: <202403101713.eM4pyFpc-lkp@intel.com>
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
In-Reply-To: <20240307133916.3782068-3-yosryahmed@google.com>
References: <20240307133916.3782068-3-yosryahmed@google.com>
TO: Yosry Ahmed <yosryahmed@google.com>

Hi Yosry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on tip/master linus/master tip/auto-latest v6.8-rc7 next-20240308]
[cannot apply to tip/x86/core tip/x86/mm]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/x86-mm-fix-LAM-cr3-mask-inconsistency-during-context-switch/20240307-214052
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240307133916.3782068-3-yosryahmed%40google.com
patch subject: [RFC PATCH 2/3] x86/mm: make sure LAM is up-to-date during context switching
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240310 (https://download.01.org/0day-ci/archive/20240310/202403101713.eM4pyFpc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403101713.eM4pyFpc-lkp@intel.com/

smatch warnings:
arch/x86/mm/tlb.c:655 switch_mm_irqs_off() error: uninitialized symbol 'new_asid'.

vim +/new_asid +655 arch/x86/mm/tlb.c

cb2a02355b042e Thomas Gleixner    2020-04-21  494  
3cfd6625a6cf83 Yosry Ahmed        2024-01-26  495  /*
cd87d9f58439a1 Yosry Ahmed        2024-02-22  496   * This optimizes when not actually switching mm's.  Some architectures use the
cd87d9f58439a1 Yosry Ahmed        2024-02-22  497   * 'unused' argument for this optimization, but x86 must use
cd87d9f58439a1 Yosry Ahmed        2024-02-22  498   * 'cpu_tlbstate.loaded_mm' instead because it does not always keep
cd87d9f58439a1 Yosry Ahmed        2024-02-22  499   * 'current->active_mm' up to date.
3cfd6625a6cf83 Yosry Ahmed        2024-01-26  500   */
3cfd6625a6cf83 Yosry Ahmed        2024-01-26  501  void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
078194f8e9fe3c Andy Lutomirski    2016-04-26  502  			struct task_struct *tsk)
69c0319aabba45 Andy Lutomirski    2016-04-26  503  {
3cfd6625a6cf83 Yosry Ahmed        2024-01-26  504  	struct mm_struct *prev = this_cpu_read(cpu_tlbstate.loaded_mm);
10af6235e0d327 Andy Lutomirski    2017-07-24  505  	u16 prev_asid = this_cpu_read(cpu_tlbstate.loaded_mm_asid);
c2bc96a91dc26e Yosry Ahmed        2024-03-07  506  	u64 cpu_tlb_gen = this_cpu_read(cpu_tlbstate.ctxs[prev_asid].tlb_gen);
2f4305b19fe6a2 Nadav Amit         2021-02-20  507  	bool was_lazy = this_cpu_read(cpu_tlbstate_shared.is_lazy);
c2bc96a91dc26e Yosry Ahmed        2024-03-07  508  	bool need_flush = false, need_lam_update = false;
94b1b03b519b81 Andy Lutomirski    2017-06-29  509  	unsigned cpu = smp_processor_id();
897738e46e29e1 Yosry Ahmed        2024-03-07  510  	unsigned long new_lam;
94b1b03b519b81 Andy Lutomirski    2017-06-29  511  	u64 next_tlb_gen;
12c4d978fd170c Rik van Riel       2018-09-25  512  	u16 new_asid;
3d28ebceaffab4 Andy Lutomirski    2017-05-28  513  
4c1ba3923e6c8a Nadav Amit         2021-02-20  514  	/* We don't want flush_tlb_func() to run concurrently with us. */
94b1b03b519b81 Andy Lutomirski    2017-06-29  515  	if (IS_ENABLED(CONFIG_PROVE_LOCKING))
94b1b03b519b81 Andy Lutomirski    2017-06-29  516  		WARN_ON_ONCE(!irqs_disabled());
94b1b03b519b81 Andy Lutomirski    2017-06-29  517  
94b1b03b519b81 Andy Lutomirski    2017-06-29  518  	/*
94b1b03b519b81 Andy Lutomirski    2017-06-29  519  	 * Verify that CR3 is what we think it is.  This will catch
94b1b03b519b81 Andy Lutomirski    2017-06-29  520  	 * hypothetical buggy code that directly switches to swapper_pg_dir
10af6235e0d327 Andy Lutomirski    2017-07-24  521  	 * without going through leave_mm() / switch_mm_irqs_off() or that
10af6235e0d327 Andy Lutomirski    2017-07-24  522  	 * does something like write_cr3(read_cr3_pa()).
a376e7f99be7c1 Andy Lutomirski    2017-09-07  523  	 *
a376e7f99be7c1 Andy Lutomirski    2017-09-07  524  	 * Only do this check if CONFIG_DEBUG_VM=y because __read_cr3()
a376e7f99be7c1 Andy Lutomirski    2017-09-07  525  	 * isn't free.
94b1b03b519b81 Andy Lutomirski    2017-06-29  526  	 */
a376e7f99be7c1 Andy Lutomirski    2017-09-07  527  #ifdef CONFIG_DEBUG_VM
3cfd6625a6cf83 Yosry Ahmed        2024-01-26  528  	if (WARN_ON_ONCE(__read_cr3() != build_cr3(prev->pgd, prev_asid,
82721d8b25d76c Kirill A. Shutemov 2023-03-12  529  						   tlbstate_lam_cr3_mask()))) {
a376e7f99be7c1 Andy Lutomirski    2017-09-07  530  		/*
a376e7f99be7c1 Andy Lutomirski    2017-09-07  531  		 * If we were to BUG here, we'd be very likely to kill
a376e7f99be7c1 Andy Lutomirski    2017-09-07  532  		 * the system so hard that we don't see the call trace.
a376e7f99be7c1 Andy Lutomirski    2017-09-07  533  		 * Try to recover instead by ignoring the error and doing
a376e7f99be7c1 Andy Lutomirski    2017-09-07  534  		 * a global flush to minimize the chance of corruption.
a376e7f99be7c1 Andy Lutomirski    2017-09-07  535  		 *
a376e7f99be7c1 Andy Lutomirski    2017-09-07  536  		 * (This is far from being a fully correct recovery.
a376e7f99be7c1 Andy Lutomirski    2017-09-07  537  		 *  Architecturally, the CPU could prefetch something
a376e7f99be7c1 Andy Lutomirski    2017-09-07  538  		 *  back into an incorrect ASID slot and leave it there
a376e7f99be7c1 Andy Lutomirski    2017-09-07  539  		 *  to cause trouble down the road.  It's better than
a376e7f99be7c1 Andy Lutomirski    2017-09-07  540  		 *  nothing, though.)
a376e7f99be7c1 Andy Lutomirski    2017-09-07  541  		 */
a376e7f99be7c1 Andy Lutomirski    2017-09-07  542  		__flush_tlb_all();
a376e7f99be7c1 Andy Lutomirski    2017-09-07  543  	}
a376e7f99be7c1 Andy Lutomirski    2017-09-07  544  #endif
09c5272e48614a Nadav Amit         2021-02-20  545  	if (was_lazy)
2f4305b19fe6a2 Nadav Amit         2021-02-20  546  		this_cpu_write(cpu_tlbstate_shared.is_lazy, false);
3d28ebceaffab4 Andy Lutomirski    2017-05-28  547  
306e060435d7a3 Mathieu Desnoyers  2018-01-29  548  	/*
10bcc80e9dbced Mathieu Desnoyers  2018-01-29  549  	 * The membarrier system call requires a full memory barrier and
10bcc80e9dbced Mathieu Desnoyers  2018-01-29  550  	 * core serialization before returning to user-space, after
a493d1ca1a03b5 Andy Lutomirski    2020-12-03  551  	 * storing to rq->curr, when changing mm.  This is because
a493d1ca1a03b5 Andy Lutomirski    2020-12-03  552  	 * membarrier() sends IPIs to all CPUs that are in the target mm
a493d1ca1a03b5 Andy Lutomirski    2020-12-03  553  	 * to make them issue memory barriers.  However, if another CPU
a493d1ca1a03b5 Andy Lutomirski    2020-12-03  554  	 * switches to/from the target mm concurrently with
a493d1ca1a03b5 Andy Lutomirski    2020-12-03  555  	 * membarrier(), it can cause that CPU not to receive an IPI
a493d1ca1a03b5 Andy Lutomirski    2020-12-03  556  	 * when it really should issue a memory barrier.  Writing to CR3
a493d1ca1a03b5 Andy Lutomirski    2020-12-03  557  	 * provides that full memory barrier and core serializing
a493d1ca1a03b5 Andy Lutomirski    2020-12-03  558  	 * instruction.
306e060435d7a3 Mathieu Desnoyers  2018-01-29  559  	 */
3cfd6625a6cf83 Yosry Ahmed        2024-01-26  560  	if (prev == next) {
82721d8b25d76c Kirill A. Shutemov 2023-03-12  561  		/* Not actually switching mm's */
e8b9b0cc8269c8 Andy Lutomirski    2017-10-14  562  		VM_WARN_ON(this_cpu_read(cpu_tlbstate.ctxs[prev_asid].ctx_id) !=
94b1b03b519b81 Andy Lutomirski    2017-06-29  563  			   next->context.ctx_id);
94b1b03b519b81 Andy Lutomirski    2017-06-29  564  
3d28ebceaffab4 Andy Lutomirski    2017-05-28  565  		/*
145f573b89a62b Rik van Riel       2018-09-25  566  		 * Even in lazy TLB mode, the CPU should stay set in the
145f573b89a62b Rik van Riel       2018-09-25  567  		 * mm_cpumask. The TLB shootdown code can figure out from
2f4305b19fe6a2 Nadav Amit         2021-02-20  568  		 * cpu_tlbstate_shared.is_lazy whether or not to send an IPI.
3d28ebceaffab4 Andy Lutomirski    2017-05-28  569  		 */
3cfd6625a6cf83 Yosry Ahmed        2024-01-26  570  		if (WARN_ON_ONCE(prev != &init_mm &&
b956575bed91ec Andy Lutomirski    2017-10-09  571  				 !cpumask_test_cpu(cpu, mm_cpumask(next))))
94b1b03b519b81 Andy Lutomirski    2017-06-29  572  			cpumask_set_cpu(cpu, mm_cpumask(next));
94b1b03b519b81 Andy Lutomirski    2017-06-29  573  
c2bc96a91dc26e Yosry Ahmed        2024-03-07  574  		/*
c2bc96a91dc26e Yosry Ahmed        2024-03-07  575  		 * tlbstate_lam_cr3_mask() may be outdated if a different thread
c2bc96a91dc26e Yosry Ahmed        2024-03-07  576  		 * has enabled LAM while we were borrowing its mm on this CPU.
c2bc96a91dc26e Yosry Ahmed        2024-03-07  577  		 * Make sure we update CR3 in case we are switching to another
c2bc96a91dc26e Yosry Ahmed        2024-03-07  578  		 * thread in that process.
c2bc96a91dc26e Yosry Ahmed        2024-03-07  579  		 */
c2bc96a91dc26e Yosry Ahmed        2024-03-07  580  		if (tlbstate_lam_cr3_mask() != mm_lam_cr3_mask(next))
c2bc96a91dc26e Yosry Ahmed        2024-03-07  581  			need_lam_update = true;
c2bc96a91dc26e Yosry Ahmed        2024-03-07  582  
145f573b89a62b Rik van Riel       2018-09-25  583  		/*
145f573b89a62b Rik van Riel       2018-09-25  584  		 * If the CPU is not in lazy TLB mode, we are just switching
145f573b89a62b Rik van Riel       2018-09-25  585  		 * from one thread in a process to another thread in the same
145f573b89a62b Rik van Riel       2018-09-25  586  		 * process. No TLB flush required.
145f573b89a62b Rik van Riel       2018-09-25  587  		 */
c2bc96a91dc26e Yosry Ahmed        2024-03-07  588  		if (was_lazy) {
145f573b89a62b Rik van Riel       2018-09-25  589  			/*
145f573b89a62b Rik van Riel       2018-09-25  590  			 * Read the tlb_gen to check whether a flush is needed.
c2bc96a91dc26e Yosry Ahmed        2024-03-07  591  			 * If the TLB is up to date, just use it.  The barrier
c2bc96a91dc26e Yosry Ahmed        2024-03-07  592  			 * synchronizes with the tlb_gen increment in the TLB
c2bc96a91dc26e Yosry Ahmed        2024-03-07  593  			 * shootdown code.
145f573b89a62b Rik van Riel       2018-09-25  594  			 */
145f573b89a62b Rik van Riel       2018-09-25  595  			smp_mb();
145f573b89a62b Rik van Riel       2018-09-25  596  			next_tlb_gen = atomic64_read(&next->context.tlb_gen);
c2bc96a91dc26e Yosry Ahmed        2024-03-07  597  			if (cpu_tlb_gen < next_tlb_gen) {
145f573b89a62b Rik van Riel       2018-09-25  598  				/*
c2bc96a91dc26e Yosry Ahmed        2024-03-07  599  				 * TLB contents went out of date while we were
c2bc96a91dc26e Yosry Ahmed        2024-03-07  600  				 * in lazy mode.
145f573b89a62b Rik van Riel       2018-09-25  601  				 */
145f573b89a62b Rik van Riel       2018-09-25  602  				new_asid = prev_asid;
145f573b89a62b Rik van Riel       2018-09-25  603  				need_flush = true;
c2bc96a91dc26e Yosry Ahmed        2024-03-07  604  			}
c2bc96a91dc26e Yosry Ahmed        2024-03-07  605  		}
c2bc96a91dc26e Yosry Ahmed        2024-03-07  606  
c2bc96a91dc26e Yosry Ahmed        2024-03-07  607  		if (!need_flush && !need_lam_update)
c2bc96a91dc26e Yosry Ahmed        2024-03-07  608  			return;
94b1b03b519b81 Andy Lutomirski    2017-06-29  609  	} else {
18bf3c3ea8ece8 Tim Chen           2018-01-29  610  		/*
371b09c6fdc436 Balbir Singh       2021-01-08  611  		 * Apply process to process speculation vulnerability
371b09c6fdc436 Balbir Singh       2021-01-08  612  		 * mitigations if applicable.
18bf3c3ea8ece8 Tim Chen           2018-01-29  613  		 */
371b09c6fdc436 Balbir Singh       2021-01-08  614  		cond_mitigation(tsk);
94b1b03b519b81 Andy Lutomirski    2017-06-29  615  
e9d8c61557687b Rik van Riel       2018-07-16  616  		/*
e9d8c61557687b Rik van Riel       2018-07-16  617  		 * Stop remote flushes for the previous mm.
e9d8c61557687b Rik van Riel       2018-07-16  618  		 * Skip kernel threads; we never send init_mm TLB flushing IPIs,
e9d8c61557687b Rik van Riel       2018-07-16  619  		 * but the bitmap manipulation can cause cache line contention.
e9d8c61557687b Rik van Riel       2018-07-16  620  		 */
3cfd6625a6cf83 Yosry Ahmed        2024-01-26  621  		if (prev != &init_mm) {
e9d8c61557687b Rik van Riel       2018-07-16  622  			VM_WARN_ON_ONCE(!cpumask_test_cpu(cpu,
3cfd6625a6cf83 Yosry Ahmed        2024-01-26  623  						mm_cpumask(prev)));
3cfd6625a6cf83 Yosry Ahmed        2024-01-26  624  			cpumask_clear_cpu(cpu, mm_cpumask(prev));
e9d8c61557687b Rik van Riel       2018-07-16  625  		}
e37e43a497d5a8 Andy Lutomirski    2016-08-11  626  
69c0319aabba45 Andy Lutomirski    2016-04-26  627  		/*
94b1b03b519b81 Andy Lutomirski    2017-06-29  628  		 * Start remote flushes and then read tlb_gen.
69c0319aabba45 Andy Lutomirski    2016-04-26  629  		 */
e9d8c61557687b Rik van Riel       2018-07-16  630  		if (next != &init_mm)
94b1b03b519b81 Andy Lutomirski    2017-06-29  631  			cpumask_set_cpu(cpu, mm_cpumask(next));
94b1b03b519b81 Andy Lutomirski    2017-06-29  632  		next_tlb_gen = atomic64_read(&next->context.tlb_gen);
94b1b03b519b81 Andy Lutomirski    2017-06-29  633  
10af6235e0d327 Andy Lutomirski    2017-07-24  634  		choose_new_asid(next, next_tlb_gen, &new_asid, &need_flush);
69c0319aabba45 Andy Lutomirski    2016-04-26  635  
4012e77a903d11 Andy Lutomirski    2018-08-29  636  		/* Let nmi_uaccess_okay() know that we're changing CR3. */
4012e77a903d11 Andy Lutomirski    2018-08-29  637  		this_cpu_write(cpu_tlbstate.loaded_mm, LOADED_MM_SWITCHING);
4012e77a903d11 Andy Lutomirski    2018-08-29  638  		barrier();
12c4d978fd170c Rik van Riel       2018-09-25  639  	}
4012e77a903d11 Andy Lutomirski    2018-08-29  640  
897738e46e29e1 Yosry Ahmed        2024-03-07  641  	/*
897738e46e29e1 Yosry Ahmed        2024-03-07  642  	 * Even if we are not actually switching mm's, another thread could have
897738e46e29e1 Yosry Ahmed        2024-03-07  643  	 * updated mm->context.lam_cr3_mask. Make sure tlbstate_lam_cr3_mask()
897738e46e29e1 Yosry Ahmed        2024-03-07  644  	 * and the loaded CR3 use the up-to-date mask.
897738e46e29e1 Yosry Ahmed        2024-03-07  645  	 */
897738e46e29e1 Yosry Ahmed        2024-03-07  646  	new_lam = set_tlbstate_lam_mode(next);
10af6235e0d327 Andy Lutomirski    2017-07-24  647  	if (need_flush) {
10af6235e0d327 Andy Lutomirski    2017-07-24  648  		this_cpu_write(cpu_tlbstate.ctxs[new_asid].ctx_id, next->context.ctx_id);
10af6235e0d327 Andy Lutomirski    2017-07-24  649  		this_cpu_write(cpu_tlbstate.ctxs[new_asid].tlb_gen, next_tlb_gen);
82721d8b25d76c Kirill A. Shutemov 2023-03-12  650  		load_new_mm_cr3(next->pgd, new_asid, new_lam, true);
675357362aeba1 Andy Lutomirski    2017-11-04  651  
bf9282dc26e7fe Peter Zijlstra     2020-08-12  652  		trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
10af6235e0d327 Andy Lutomirski    2017-07-24  653  	} else {
10af6235e0d327 Andy Lutomirski    2017-07-24  654  		/* The new ASID is already up to date. */
82721d8b25d76c Kirill A. Shutemov 2023-03-12 @655  		load_new_mm_cr3(next->pgd, new_asid, new_lam, false);
675357362aeba1 Andy Lutomirski    2017-11-04  656  
bf9282dc26e7fe Peter Zijlstra     2020-08-12  657  		trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, 0);
10af6235e0d327 Andy Lutomirski    2017-07-24  658  	}
10af6235e0d327 Andy Lutomirski    2017-07-24  659  
4012e77a903d11 Andy Lutomirski    2018-08-29  660  	/* Make sure we write CR3 before loaded_mm. */
4012e77a903d11 Andy Lutomirski    2018-08-29  661  	barrier();
4012e77a903d11 Andy Lutomirski    2018-08-29  662  
10af6235e0d327 Andy Lutomirski    2017-07-24  663  	this_cpu_write(cpu_tlbstate.loaded_mm, next);
10af6235e0d327 Andy Lutomirski    2017-07-24  664  	this_cpu_write(cpu_tlbstate.loaded_mm_asid, new_asid);
69c0319aabba45 Andy Lutomirski    2016-04-26  665  
3cfd6625a6cf83 Yosry Ahmed        2024-01-26  666  	if (next != prev) {
cb2a02355b042e Thomas Gleixner    2020-04-21  667  		cr4_update_pce_mm(next);
3cfd6625a6cf83 Yosry Ahmed        2024-01-26  668  		switch_ldt(prev, next);
69c0319aabba45 Andy Lutomirski    2016-04-26  669  	}
145f573b89a62b Rik van Riel       2018-09-25  670  }
69c0319aabba45 Andy Lutomirski    2016-04-26  671  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
