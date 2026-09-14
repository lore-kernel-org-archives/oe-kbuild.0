Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84786224AF2
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 08:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375625; cv=none; b=HOYo8WjEkO0Wwdgoa6IyT9jDAmMCHsa8jV7FFbCi9tM3G99cGxZS+3Ops7lEqjhkRG+ZUWsNGpWZtc5W48SbCUvvRci4fE99SC0B/PPx7cveSnypkDVinLzTsLOHE9qcAg0bEmOoFMU9WbCeGes32Ro5HgWvrMctg6XswlQVISs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375625; c=relaxed/simple;
	bh=FxJcT3RJUKjKxteJq8SVKj9gRJ7WjcHz9G5G9MQU78E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PCKcg6ryeSlz7FmrPtPBvHxba+HvNhfMsxLq+jxLPUSD3RmFDE6pPCG17VbisBgS7OubHcOkqFodQrrPSzcSAuxpqiC7dGm3B1jENNy1GYaHd749If2rOut+Op+nyV+2UI2E81S8IMEGzMXNhhEuoiUO4j2Hbsyrk3WRbCawKdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sIK0zg9H; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sIK0zg9H"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so4140014a12.2
        for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 01:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789375622; x=1789980422; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iFz3fsOX7eGaAeRErgHdDVQqe9JYeQLjMQwZmKraKFo=;
        b=sIK0zg9H7kHvZmvIXqf2Rw+w2MZOvtmiJ1GCyXVzRaHg1V15tNwVeXgSAvVLgNaZIw
         1YHPY/tv7YB261St//IPp9X04ybwOX/k4LHW9/mPBxXna+7AM2Gtm9Zk67kSp/h7RFI2
         KjpgoylWekGjV3k9t4VlwWsjETpnA6P7XcotntunOKrYEs7kClsJkYY5kSuR1OXESTsW
         NVeG3UYvRuNfOV2er6cVNgqkK6gC9YCY6UiNzDDJEvG4o1wpATndfbpFsbyYz/PTUxi/
         V4oSXYk9m9okZf2JPp/yWc/PG69xg8p+SSCwX520Z0Ksmmc2Flc1Km571rrsFK+hVDTU
         3jkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375622; x=1789980422;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iFz3fsOX7eGaAeRErgHdDVQqe9JYeQLjMQwZmKraKFo=;
        b=NRQiD5EKt0jD4sRW5eA9cOZdmu1qmUI4UuvQBvINUE6Myk6gnD2q64VQ0TVIMgH2XG
         VkabKw0WrouwMcHlRoqsKeBE3ArtyJEepM6Haxq9K3lxi6G+1fm5vZafpbdZKFUDeGdu
         SyVEvvmcSXpRxK1aJui4HJg326lALXiZgByWidrSMLgDA8czu3edugp52av3AlyuXQKZ
         yNq2bWoHWwcNrlRepDEGXQtZpf5zXdn/0Q3ZDFViC9RSiFafdR9nKAkM/xE2d3mA2uuP
         FFveLiS2/1n/59aXDy78yBd7XEq4L3aWUaOiZn3OcqYoaw3RMz2PJEFBSGrWNWK517u/
         7/fQ==
X-Gm-Message-State: AFuF++mLyWcDJHe57RPKQFVqHKgKs+rm/ngCeF4nvX7eeplkViDLIBHP
	id7e7hfOdAbo9YPXrtrDAEn1I1YtIXTgKdqyGKhXP+Ew+smfQYaT5fDW3VfbWRfaO/xoLQ==
X-Gm-Gg: AYBFou1nCpwoLK0ozNlXnpD6xHPxdGtzONk/1lzZly5/HmSofCIWMmvOSiOlnWwDI1k
	lIXsz85Y3qcPrmGlbb4kyXzn6rgQRxcqnTUjFs4iJew7n0n4s07B70l1sRNxzqUvpdFKbakQ6G0
	qP66qpy3RFAaXI1rOZt5HKRy/kHA/s7rftICQTlUkcaOh7r3F0zcBh9WWGU+kXrZtC3WNmOgWZl
	iLt+FztRLFtQbskYQR/M5V+6Lqws2QJyJi1dVbRixajxgq9bLJFzsN29XJjvPHJ4bHDHMLou/Xl
	cFeaXiX55ca1hy/cT4tUWV9tdjLGPfZunf0bdtV856WWCRR7rKzKy7KciSPK2CcmORINfYH2Khf
	NOZNX1TQyojpU4VqeIGVHgtDBmZ8xBDv/U5HfHlLOZErmYE+8jsPUOM1uqX5m7U79XO/Cue8t2F
	Gihw9EYjf1QoY9eN8o8wNP1KrY80baBIJoE/Fr6+aOyw8UWFyp/DOBJZCKdVp4L9QLvy4=
X-Received: by 2002:a17:907:7b9b:b0:c26:19de:9ae1 with SMTP id a640c23a62f3a-c29b8731b9cmr95876566b.32.1789375621273;
        Mon, 14 Sep 2026 01:47:01 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966147b46sm387543366b.60.2026.09.14.01.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:47:00 -0700 (PDT)
Date: Mon, 14 Sep 2026 11:46:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [kas:collapse/rfc-wip 41/84] mm/swap_state.c:481
 __swap_cache_alloc() warn: use 'gfp' here instead of GFP_KERNEL?
Message-ID: <aqe0gMZsQSnofm3f@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git collapse/rfc-wip
head:   36226b1e4970c52a3c0d491dcf17800eb800958a
commit: 1e7fc9164723073d7b48f251446ae662becf45e2 [41/84] mm/huge_memory: let the caller pick the gfp for the deferred-split heads
config: mips-randconfig-r072-20260913 (https://download.01.org/0day-ci/archive/20260914/202609140034.5e6tLkPc-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609140034.5e6tLkPc-lkp@intel.com/

smatch warnings:
mm/swap_state.c:481 __swap_cache_alloc() warn: use 'gfp' here instead of GFP_KERNEL?

vim +/gfp +481 mm/swap_state.c

e1e6750df3b473 Kairui Song            2026-05-17  416  static struct folio *__swap_cache_alloc(struct swap_cluster_info *ci,
e1e6750df3b473 Kairui Song            2026-05-17  417  					swp_entry_t targ_entry, gfp_t gfp,
e1e6750df3b473 Kairui Song            2026-05-17  418  					unsigned int order, struct vm_fault *vmf,
e1e6750df3b473 Kairui Song            2026-05-17  419  					struct mempolicy *mpol, pgoff_t ilx)
e1e6750df3b473 Kairui Song            2026-05-17  420  {
e1e6750df3b473 Kairui Song            2026-05-17  421  	int err;
e1e6750df3b473 Kairui Song            2026-05-17  422  	swp_entry_t entry;
e1e6750df3b473 Kairui Song            2026-05-17  423  	struct folio *folio;
e1e6750df3b473 Kairui Song            2026-05-17  424  	void *shadow = NULL;
bc34e87a51d9e5 Kairui Song            2026-05-17  425  	unsigned short memcg_id;
e1e6750df3b473 Kairui Song            2026-05-17  426  	unsigned long address, nr_pages = 1UL << order;
e1e6750df3b473 Kairui Song            2026-05-17  427  	struct vm_area_struct *vma = vmf ? vmf->vma : NULL;
e1e6750df3b473 Kairui Song            2026-05-17  428  
e1e6750df3b473 Kairui Song            2026-05-17  429  	VM_WARN_ON_ONCE(nr_pages > SWAPFILE_CLUSTER);
e1e6750df3b473 Kairui Song            2026-05-17  430  	entry.val = round_down(targ_entry.val, nr_pages);
e1e6750df3b473 Kairui Song            2026-05-17  431  
e1e6750df3b473 Kairui Song            2026-05-17  432  	/* Check if the slot and range are available, skip allocation if not */
e1e6750df3b473 Kairui Song            2026-05-17  433  	spin_lock(&ci->lock);
bc34e87a51d9e5 Kairui Song            2026-05-17  434  	err = __swap_cache_add_check(ci, targ_entry, nr_pages, NULL, NULL);
e1e6750df3b473 Kairui Song            2026-05-17  435  	spin_unlock(&ci->lock);
e1e6750df3b473 Kairui Song            2026-05-17  436  	if (unlikely(err))
e1e6750df3b473 Kairui Song            2026-05-17  437  		return ERR_PTR(err);
e1e6750df3b473 Kairui Song            2026-05-17  438  
e1e6750df3b473 Kairui Song            2026-05-17  439  	/*
e1e6750df3b473 Kairui Song            2026-05-17  440  	 * Limit THP gfp. The limitation is a no-op for typical
e1e6750df3b473 Kairui Song            2026-05-17  441  	 * GFP_HIGHUSER_MOVABLE but matters for shmem.
                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Comment here which mentions gfp but is too advanced for my small
brain.

e1e6750df3b473 Kairui Song            2026-05-17  442  	 */
e1e6750df3b473 Kairui Song            2026-05-17  443  	if (order)
e1e6750df3b473 Kairui Song            2026-05-17  444  		gfp = thp_shmem_limit_gfp_mask(vma_thp_gfp_mask(vma), gfp);
e1e6750df3b473 Kairui Song            2026-05-17  445  
e1e6750df3b473 Kairui Song            2026-05-17  446  	if (mpol || !vmf) {
e1e6750df3b473 Kairui Song            2026-05-17  447  		folio = folio_alloc_mpol(gfp, order, mpol, ilx, numa_node_id());
e1e6750df3b473 Kairui Song            2026-05-17  448  	} else {
e1e6750df3b473 Kairui Song            2026-05-17  449  		address = round_down(vmf->address, PAGE_SIZE << order);
e1e6750df3b473 Kairui Song            2026-05-17  450  		folio = vma_alloc_folio(gfp, order, vmf->vma, address);
e1e6750df3b473 Kairui Song            2026-05-17  451  	}
e1e6750df3b473 Kairui Song            2026-05-17  452  	if (unlikely(!folio))
e1e6750df3b473 Kairui Song            2026-05-17  453  		return ERR_PTR(-ENOMEM);
e1e6750df3b473 Kairui Song            2026-05-17  454  
e1e6750df3b473 Kairui Song            2026-05-17  455  	/* Double check the range is still not in conflict */
e1e6750df3b473 Kairui Song            2026-05-17  456  	spin_lock(&ci->lock);
bc34e87a51d9e5 Kairui Song            2026-05-17  457  	err = __swap_cache_add_check(ci, targ_entry, nr_pages, &shadow, &memcg_id);
e1e6750df3b473 Kairui Song            2026-05-17  458  	if (unlikely(err)) {
e1e6750df3b473 Kairui Song            2026-05-17  459  		spin_unlock(&ci->lock);
e1e6750df3b473 Kairui Song            2026-05-17  460  		folio_put(folio);
e1e6750df3b473 Kairui Song            2026-05-17  461  		return ERR_PTR(err);
e1e6750df3b473 Kairui Song            2026-05-17  462  	}
e1e6750df3b473 Kairui Song            2026-05-17  463  
e1e6750df3b473 Kairui Song            2026-05-17  464  	__folio_set_locked(folio);
e1e6750df3b473 Kairui Song            2026-05-17  465  	__folio_set_swapbacked(folio);
e1e6750df3b473 Kairui Song            2026-05-17  466  	__swap_cache_do_add_folio(ci, folio, entry);
e1e6750df3b473 Kairui Song            2026-05-17  467  	spin_unlock(&ci->lock);
e1e6750df3b473 Kairui Song            2026-05-17  468  
bc34e87a51d9e5 Kairui Song            2026-05-17  469  	if (mem_cgroup_swapin_charge_folio(folio, memcg_id,
bc34e87a51d9e5 Kairui Song            2026-05-17  470  					   vmf ? vmf->vma->vm_mm : NULL, gfp)) {
e1e6750df3b473 Kairui Song            2026-05-17  471  		spin_lock(&ci->lock);
e1e6750df3b473 Kairui Song            2026-05-17  472  		__swap_cache_do_del_folio(ci, folio, entry, shadow);
e1e6750df3b473 Kairui Song            2026-05-17  473  		spin_unlock(&ci->lock);
e1e6750df3b473 Kairui Song            2026-05-17  474  		folio_unlock(folio);
e1e6750df3b473 Kairui Song            2026-05-17  475  		/* nr_pages refs from swap cache, 1 from allocation */
e1e6750df3b473 Kairui Song            2026-05-17  476  		folio_put_refs(folio, nr_pages + 1);
e1e6750df3b473 Kairui Song            2026-05-17  477  		count_mthp_stat(order, MTHP_STAT_SWPIN_FALLBACK_CHARGE);
e1e6750df3b473 Kairui Song            2026-05-17  478  		return ERR_PTR(-ENOMEM);
e1e6750df3b473 Kairui Song            2026-05-17  479  	}
e1e6750df3b473 Kairui Song            2026-05-17  480  
1e7fc916472307 Kiryl Shutsemau (Meta  2026-08-24 @481) 	if (order > 1 && folio_memcg_alloc_deferred(folio, GFP_KERNEL)) {

Should this be gfp instead of GFP_KERNEL?

fafaeceb89a5e2 Johannes Weiner        2026-05-27  482  		spin_lock(&ci->lock);
fafaeceb89a5e2 Johannes Weiner        2026-05-27  483  		__swap_cache_do_del_folio(ci, folio, entry, shadow);
fafaeceb89a5e2 Johannes Weiner        2026-05-27  484  		spin_unlock(&ci->lock);
fafaeceb89a5e2 Johannes Weiner        2026-05-27  485  		folio_unlock(folio);
fafaeceb89a5e2 Johannes Weiner        2026-05-27  486  		/* nr_pages refs from swap cache, 1 from allocation */
fafaeceb89a5e2 Johannes Weiner        2026-05-27  487  		folio_put_refs(folio, nr_pages + 1);
fafaeceb89a5e2 Johannes Weiner        2026-05-27  488  		return ERR_PTR(-ENOMEM);
fafaeceb89a5e2 Johannes Weiner        2026-05-27  489  	}
fafaeceb89a5e2 Johannes Weiner        2026-05-27  490  
945578fee2ec17 Kairui Song            2026-05-17  491  	/* memsw uncharges swap when folio is added to swap cache */
945578fee2ec17 Kairui Song            2026-05-17  492  	memcg1_swapin(folio);
e1e6750df3b473 Kairui Song            2026-05-17  493  	if (shadow)
e1e6750df3b473 Kairui Song            2026-05-17  494  		workingset_refault(folio, shadow);
e1e6750df3b473 Kairui Song            2026-05-17  495  
e1e6750df3b473 Kairui Song            2026-05-17  496  	node_stat_mod_folio(folio, NR_FILE_PAGES, nr_pages);
e1e6750df3b473 Kairui Song            2026-05-17  497  	lruvec_stat_mod_folio(folio, NR_SWAPCACHE, nr_pages);
e1e6750df3b473 Kairui Song            2026-05-17  498  
e1e6750df3b473 Kairui Song            2026-05-17  499  	/* Caller will initiate read into locked new_folio */
e1e6750df3b473 Kairui Song            2026-05-17  500  	folio_add_lru(folio);
e1e6750df3b473 Kairui Song            2026-05-17  501  	return folio;
e1e6750df3b473 Kairui Song            2026-05-17  502  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

