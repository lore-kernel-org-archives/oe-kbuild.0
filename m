Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CE7279DB6
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 11:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768737527; cv=none; b=Qf9I6yCQ9F9/TiTd9Q8uFE/kvrBBqz3O1JtH+CtiWhR83LB2O4S4qpKU0VcBdiFYqC+kxjyIfxv9mwqAAfM3MOONaive0ZdwQdf4tR3LyJ7KbjwMBWX+V8/nAuHqolDlT9UEB2xtR0FaH3lWDaj3mWspCPs99iCRVXGgDkVSf+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768737527; c=relaxed/simple;
	bh=0CXK8Ge+agSUF9LrDar6SIdZ+KfgieU2aTc/16aCRpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rSzAtjvfIYkQaGvdxCbDUJ22o8xszXj5BswuaMdtuz+wjvXsxgWmHfxEoL6srK3Xx4onaZ8rTExGSFqHqWha5IGnKOdq/9G+pCUGz9cKAoRJAaG4f1umkOHgzyMbncmL5AHUA1GQwLh2K45+6rNE/elWHOeWckGMX3gNx0knId0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aNymWNxi; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aNymWNxi"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so24809915e9.2
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 03:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768737524; x=1769342324; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AUS6KPBiAsk5Gc60fxXkLOLhxKKt9tw936tORAV/B3w=;
        b=aNymWNxidQtnjy97G1iQ1QJhYOEe7GmAxbkEo4VQmplpcHO9UdXwN0NdfGm7DTcwIS
         NeGpvOP4HMcQWg7qSfPLZttCLzWjquwIskJFAUPvNM87Dx/mz4oRTrFrlutY4DoH8qfP
         M8U4wjRbeAWJoBoJceJe61pV1BtMFftVi574SXgF600UfEgu7uPF1xwtomvwzqZs/w1j
         pubCUs2Z1N3r/Gxb1lV6pvgc1lmCr7RvA1S/GCGp9u77oyTQFNWDxsrMO2vGe37IEWfp
         4QGsORWKG3Cxq0TLesXooO8NRFcXrHEM3Pk0M1RnbPFMZx2c9n0uhzkrkDIBbFwYDQqk
         LxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768737524; x=1769342324;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUS6KPBiAsk5Gc60fxXkLOLhxKKt9tw936tORAV/B3w=;
        b=XVXESfPXMalfl/FILx6R/HjlpVj2VPnH0jcVOIkpyBLvwQSpvKwyiDUFcGQVCE9oJU
         uko4Ij4IKzkVHSFOvJRIiiijlQL3qjRaVNVJb/3Wpj7f3dv3kLnshMhqiqMQTasM2lzY
         CZxlJNFfZgV60x729I+2RfoF5pdmATZh3ihq700vq9cACXUwhlRaDS+DUyk2hSEaNl7F
         BbTQQtMT98bseNp2/Brq63y/Q8f4ITGJKWBXNs637dIoSIwP7oI57DO8/sb7C3CNoDq1
         5sppoWmDIVqtbVqJD37AVs9p3hg8vWA5JN9XY1RyXBP/ZyCg1316kDFMRZ5R397Rc4Rc
         v9mQ==
X-Gm-Message-State: AOJu0Yx4KSMNcR7btEhQH3RdZdN4iOUPkmUDQmjSCramjSDUg0hCDn7d
	HDKHRVLQRXTzKKSwmMBbuSm9gCk9ZNRCWIsXL4jLnpJdI9G63erUuTT9RtT/Ct6wOS3KTpO7KtS
	TZPqmkEc=
X-Gm-Gg: AY/fxX60jSJlGsp2IzUqFhQf5slw3W5k2APnOVJoigDLq+zRARpJ9lS5tqOKzfoKFeu
	nVcTpSxhnJSKsReJROVDPp8L2LWS/xRGKg17MfBmODB9IRDZt8j5et2BlLAIHr0aieoDczcaIAo
	FFLIN4UcQqAQyVhFI6nHdry8gzI0Lpbm3RrwjRisVqSKCGkKlv1qUH7Cn+af1xa5ZS68UFkAWrh
	YpQr3Nx3rYstGz2jvI4XgpcRkP076y5pQBb33weMl4U3tV8Fm3YkhoUT3qg1bgnveh+vvk3nf5V
	E0jyLcimN3gLtoQ97Rzf9jWNETZ8bZdMOCs093jeMbtL0ruN5SJ4UTWq1vNLHuo7bdkVsRtHj87
	n5OeFPaDM7UO+99O8+LyXHClH0LXKXn7aWO1sWoE8WSbf5sQ/Jj1Mk0zOWQ9TbdOfr4j7w0mzg9
	AyNX7tYM479jjR9Pdh
X-Received: by 2002:a05:600c:37c8:b0:477:af07:dd21 with SMTP id 5b1f17b1804b1-4801eb0d71cmr83998295e9.25.1768737524204;
        Sun, 18 Jan 2026 03:58:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428ac749sm197059975e9.5.2026.01.18.03.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 03:58:43 -0800 (PST)
Date: Sun, 18 Jan 2026 14:58:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Muchun Song <songmuchun@bytedance.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [akpm-mm:mm-new 331/335] mm/memcontrol-v1.c:685 memcg1_swapout()
 warn: inconsistent returns 'rcu_read'.
Message-ID: <202601151810.ie4EgP4S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260118115841.QphrBJfsnYeErWsE7zjZgMrg-v0oe-ppkAtEVXvyzuQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   78d5565acc4516dfe1fe5a3779a53bc7aaedc2e1
commit: 8e5f42f2bf326f0efb1e565fa57b5ef99b40e646 [331/335] mm: memcontrol: eliminate the problem of dying memory cgroup for LRU folios
config: parisc-randconfig-r072-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151810.ie4EgP4S-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601151810.ie4EgP4S-lkp@intel.com/

smatch warnings:
mm/memcontrol-v1.c:685 memcg1_swapout() warn: inconsistent returns 'rcu_read'.

vim +/rcu_read +685 mm/memcontrol-v1.c

89ce924f0bd447 Johannes Weiner    2025-01-24  613  void memcg1_swapout(struct folio *folio, swp_entry_t entry)
f7d49ba03ae755 Shakeel Butt       2024-08-14  614  {
89ce924f0bd447 Johannes Weiner    2025-01-24  615  	struct mem_cgroup *memcg, *swap_memcg;
8e5f42f2bf326f Muchun Song        2026-01-14  616  	struct obj_cgroup *objcg;
89ce924f0bd447 Johannes Weiner    2025-01-24  617  	unsigned int nr_entries;
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  618  	unsigned short oldid;
89ce924f0bd447 Johannes Weiner    2025-01-24  619  
89ce924f0bd447 Johannes Weiner    2025-01-24  620  	VM_BUG_ON_FOLIO(folio_test_lru(folio), folio);
89ce924f0bd447 Johannes Weiner    2025-01-24  621  	VM_BUG_ON_FOLIO(folio_ref_count(folio), folio);
89ce924f0bd447 Johannes Weiner    2025-01-24  622  
89ce924f0bd447 Johannes Weiner    2025-01-24  623  	if (mem_cgroup_disabled())
89ce924f0bd447 Johannes Weiner    2025-01-24  624  		return;
89ce924f0bd447 Johannes Weiner    2025-01-24  625  
89ce924f0bd447 Johannes Weiner    2025-01-24  626  	if (!do_memsw_account())
89ce924f0bd447 Johannes Weiner    2025-01-24  627  		return;
89ce924f0bd447 Johannes Weiner    2025-01-24  628  
8e5f42f2bf326f Muchun Song        2026-01-14  629  	objcg = folio_objcg(folio);
8e5f42f2bf326f Muchun Song        2026-01-14  630  	VM_WARN_ON_ONCE_FOLIO(!objcg, folio);
8e5f42f2bf326f Muchun Song        2026-01-14  631  	if (!objcg)
89ce924f0bd447 Johannes Weiner    2025-01-24  632  		return;
89ce924f0bd447 Johannes Weiner    2025-01-24  633  
8e5f42f2bf326f Muchun Song        2026-01-14  634  	rcu_read_lock();
8e5f42f2bf326f Muchun Song        2026-01-14  635  	memcg = obj_cgroup_memcg(objcg);
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  636  	/*
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  637  	 * Check if this swap entry is already recorded. This can happen
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  638  	 * when MADV_PAGEOUT is called multiple times on pages that remain
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  639  	 * in swapcache, reusing the same swap entries.
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  640  	 */
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  641  	oldid = lookup_swap_cgroup_id(entry);
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  642  	if (oldid == mem_cgroup_id(memcg))
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  643  		return;


rcu_read_unlock() before returning

8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  644  	VM_WARN_ON_ONCE(oldid != 0);
8cb494d6e92a26 Deepanshu Kartikey 2026-01-10  645  
89ce924f0bd447 Johannes Weiner    2025-01-24  646  	/*
89ce924f0bd447 Johannes Weiner    2025-01-24  647  	 * In case the memcg owning these pages has been offlined and doesn't
89ce924f0bd447 Johannes Weiner    2025-01-24  648  	 * have an ID allocated to it anymore, charge the closest online
89ce924f0bd447 Johannes Weiner    2025-01-24  649  	 * ancestor for the swap instead and transfer the memory+swap charge.
89ce924f0bd447 Johannes Weiner    2025-01-24  650  	 */
1d7634095c770c Shakeel Butt       2025-12-25  651  	swap_memcg = mem_cgroup_private_id_get_online(memcg);
89ce924f0bd447 Johannes Weiner    2025-01-24  652  	nr_entries = folio_nr_pages(folio);
89ce924f0bd447 Johannes Weiner    2025-01-24  653  	/* Get references for the tail pages, too */
89ce924f0bd447 Johannes Weiner    2025-01-24  654  	if (nr_entries > 1)
1d7634095c770c Shakeel Butt       2025-12-25  655  		mem_cgroup_private_id_get_many(swap_memcg, nr_entries - 1);
89ce924f0bd447 Johannes Weiner    2025-01-24  656  	mod_memcg_state(swap_memcg, MEMCG_SWAP, nr_entries);
89ce924f0bd447 Johannes Weiner    2025-01-24  657  
1d7634095c770c Shakeel Butt       2025-12-25  658  	swap_cgroup_record(folio, mem_cgroup_private_id(swap_memcg), entry);
89ce924f0bd447 Johannes Weiner    2025-01-24  659  
89ce924f0bd447 Johannes Weiner    2025-01-24  660  	folio_unqueue_deferred_split(folio);
89ce924f0bd447 Johannes Weiner    2025-01-24  661  	folio->memcg_data = 0;
89ce924f0bd447 Johannes Weiner    2025-01-24  662  
8e5f42f2bf326f Muchun Song        2026-01-14  663  	if (!obj_cgroup_is_root(objcg))
89ce924f0bd447 Johannes Weiner    2025-01-24  664  		page_counter_uncharge(&memcg->memory, nr_entries);
89ce924f0bd447 Johannes Weiner    2025-01-24  665  
89ce924f0bd447 Johannes Weiner    2025-01-24  666  	if (memcg != swap_memcg) {
89ce924f0bd447 Johannes Weiner    2025-01-24  667  		if (!mem_cgroup_is_root(swap_memcg))
89ce924f0bd447 Johannes Weiner    2025-01-24  668  			page_counter_charge(&swap_memcg->memsw, nr_entries);
89ce924f0bd447 Johannes Weiner    2025-01-24  669  		page_counter_uncharge(&memcg->memsw, nr_entries);
89ce924f0bd447 Johannes Weiner    2025-01-24  670  	}
89ce924f0bd447 Johannes Weiner    2025-01-24  671  
f7d49ba03ae755 Shakeel Butt       2024-08-14  672  	/*
f7d49ba03ae755 Shakeel Butt       2024-08-14  673  	 * Interrupts should be disabled here because the caller holds the
f7d49ba03ae755 Shakeel Butt       2024-08-14  674  	 * i_pages lock which is taken with interrupts-off. It is
f7d49ba03ae755 Shakeel Butt       2024-08-14  675  	 * important here to have the interrupts disabled because it is the
f7d49ba03ae755 Shakeel Butt       2024-08-14  676  	 * only synchronisation we have for updating the per-CPU variables.
f7d49ba03ae755 Shakeel Butt       2024-08-14  677  	 */
f7d49ba03ae755 Shakeel Butt       2024-08-14  678  	preempt_disable_nested();
f7d49ba03ae755 Shakeel Butt       2024-08-14  679  	VM_WARN_ON_IRQS_ENABLED();
f7d49ba03ae755 Shakeel Butt       2024-08-14  680  	memcg1_charge_statistics(memcg, -folio_nr_pages(folio));
f7d49ba03ae755 Shakeel Butt       2024-08-14  681  	preempt_enable_nested();
f7d49ba03ae755 Shakeel Butt       2024-08-14  682  	memcg1_check_events(memcg, folio_nid(folio));
89ce924f0bd447 Johannes Weiner    2025-01-24  683  
8e5f42f2bf326f Muchun Song        2026-01-14  684  	rcu_read_unlock();
8e5f42f2bf326f Muchun Song        2026-01-14 @685  	obj_cgroup_put(objcg);
89ce924f0bd447 Johannes Weiner    2025-01-24  686  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

