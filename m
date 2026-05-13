Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E7A47A0B2
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 15:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684979; cv=none; b=Ug1CXsm508ToYMRmZcNiOYTSuLKiII0KARipDwcg9pNaBedLAFZG7n3HQKDr469GgfjH1DV2K55pCT92nrb3jwrvuuMcABaLeJXOC7SlAnGa9gNfAr4z9iGxmv7V+Bguz3QDheNYpzOE70hVjTWKyhFeKgfiNaDUGkJWBGDZvb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684979; c=relaxed/simple;
	bh=7QEfi4HUPzf9yRmEzgwneGfxmBKzyLltpVMLhu72Zu4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pg1nMSa3aFtTCsDEfkAWC9FDieriKpt7fmipTABRC7gCtSFbydcxFvT4WjLTQ9WkQauy6pk0uQKYECoUZZ0XVdDkrY3iy8XoZSWMFN+vypKklKhv/xNlbp/+FzGdX8JARCqeZtO15yFssdY37YNyw9GGiXcPdFsmgPVkP+pUvrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDj1Y24f; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDj1Y24f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778684977; x=1810220977;
  h=date:from:to:cc:subject:message-id;
  bh=7QEfi4HUPzf9yRmEzgwneGfxmBKzyLltpVMLhu72Zu4=;
  b=iDj1Y24fPP7mbo/vF5+RgAwSspJy2ZqpMr/hVH0gj4D2alDo8BKh5NOm
   N/vxulEXnYyx77WaFBOr07Dv2KED9ISN2y1YOGjpSJcZXPeziKMR1SsQJ
   tPFL7uxoIJOVdtXc3Bxu+TqCZaQzSedBrSOCzQEPkjdGXwNWmcD1rivzQ
   XPpGrSurkPFskxixELV5l3XYJ93yOgL8jgUdYKoeo4MQ1uOh3e7UT8Ddy
   Y7b4XbIdup1KWbSZVy/13+Ndmy7Uf57N6OH/TuUtHj50u3MWicOBpWffw
   n+SF7ZArgJcBHW1S562kzmMh+KNTtoqxuvFd0WqWvUrljdHTaNiCxuwBU
   Q==;
X-CSE-ConnectionGUID: spVyK8UXR4yV0pYITOzZqQ==
X-CSE-MsgGUID: toD0bvXASGm9SHcdDWM6oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79510747"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79510747"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 08:09:37 -0700
X-CSE-ConnectionGUID: LR6+zl0xR7SdaRFVZCtMGQ==
X-CSE-MsgGUID: GdgmKA7AQfOHw30P6e4KvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="243062433"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 May 2026 08:09:35 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNBDI-000000004IZ-3KIi;
	Wed, 13 May 2026 15:09:32 +0000
Date: Wed, 13 May 2026 23:09:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-testing 35/95]
 fs/bcachefs/alloc/foreground.c:560 bch2_bucket_alloc_trans() warn: statement
 has no effect 'u32'
Message-ID: <202605132231.YGqccrTW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   19de36973d2a42162d7f80cc9ddfbdf2a8d24e65
commit: ca284ad06b139fe4dc8f053ada179473c1b71bb1 [35/95] bcachefs: alloc: filter spurious freelist_wait wakes on the waiter side
:::::: branch date: 12 hours ago
:::::: commit date: 3 weeks ago
config: parisc-randconfig-r072-20260513 (https://download.01.org/0day-ci/archive/20260513/202605132231.YGqccrTW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605132231.YGqccrTW-lkp@intel.com/

New smatch warnings:
fs/bcachefs/alloc/foreground.c:560 bch2_bucket_alloc_trans() warn: statement has no effect 'u32'

Old smatch warnings:
fs/bcachefs/alloc/foreground.c:538 bucket_alloc_to_text() warn: passing zero to 'PTR_ERR'
arch/parisc/include/asm/hash.h:44 __hash_32() warn: inconsistent indenting
fs/bcachefs/alloc/foreground.c:1781 bch2_print_allocator_stuck() error: we previously assumed 'req' could be null (see line 1719)

vim +/u32 +560 fs/bcachefs/alloc/foreground.c

40574946b8a517 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-04  540  
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  541  /**
96dea3d599dbc3 fs/bcachefs/alloc_foreground.c Kent Overstreet 2023-09-12  542   * bch2_bucket_alloc_trans - allocate a single bucket from a specific device
96dea3d599dbc3 fs/bcachefs/alloc_foreground.c Kent Overstreet 2023-09-12  543   * @trans:	transaction object
7100344301d80f fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  544   * @req:	state for the entire allocation
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  545   *
96dea3d599dbc3 fs/bcachefs/alloc_foreground.c Kent Overstreet 2023-09-12  546   * Returns:	an open_bucket on success, or an ERR_PTR() on failure.
3e3e02e6bce627 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-10-19  547   */
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  548  static struct open_bucket *bch2_bucket_alloc_trans(struct btree_trans *trans,
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  549  						   struct alloc_request *req)
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  550  {
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  551  	struct bch_fs *c = trans->c;
e038213658f09b fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  552  	struct bch_dev *ca = req->ca;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  553  	struct open_bucket *ob = NULL;
f2b542ba42a8b3 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-12-11  554  	bool freespace = READ_ONCE(ca->mi.freespace_initialized);
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  555  	bool waiting = false;
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  556  
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  557  	req->btree_bitmap = req->data_type == BCH_DATA_btree;
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  558  	memset(&req->counters, 0, sizeof(req->counters));
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  559  again:
ca284ad06b139f fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-04-23 @560  	u32 wake_counter_snapshot = atomic_read(&ca->alloc_wake_counter);
4d00e88d21d636 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  561  	bch2_dev_usage_read_fast(ca, &req->usage);
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  562  	u64 avail = __dev_buckets_free(ca, req->usage, req->watermark);
822835ffeae411 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-04-01  563  
6a1c4323defd18 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-12  564  	if (req->usage.buckets[BCH_DATA_need_discard] >
6a1c4323defd18 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-12  565  	    min(avail, ca->mi.nbuckets >> 7))
d3722a860d3f79 fs/bcachefs/alloc/foreground.c ProofOfConcept  2026-03-19  566  		bch2_do_discards_async(c);
822835ffeae411 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-04-01  567  
4d00e88d21d636 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  568  	if (req->usage.buckets[BCH_DATA_need_gc_gens] > avail)
103304021e54bf fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-19  569  		bch2_gc_gens_async(c);
822835ffeae411 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-04-01  570  
4d00e88d21d636 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  571  	if (should_invalidate_buckets(ca, req->usage))
64ee1431cc7d11 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-06-23  572  		bch2_dev_do_invalidates(ca);
822835ffeae411 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-04-01  573  
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  574  	if (!avail) {
9259883b79e14a fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-21  575  		if (req->watermark > BCH_WATERMARK_normal &&
7ed4c14e20be2b fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-05-13  576  		    c->recovery.pass_done < BCH_RECOVERY_PASS_check_allocations)
828552ca74a458 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-11-24  577  			goto alloc;
828552ca74a458 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-11-24  578  
a2b2aa2abe1cfa fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-04-16  579  		if (bch2_copygc_can_make_progress(ca)) {
a2b2aa2abe1cfa fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-04-16  580  			req->copygc_can_make_progress = true;
a2b2aa2abe1cfa fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-04-16  581  			bch2_copygc_wakeup(c);
a2b2aa2abe1cfa fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-04-16  582  		}
a2b2aa2abe1cfa fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-04-16  583  
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  584  		track_event_change(&c->times[BCH_TIME_blocked_allocate], true);
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  585  
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  586  		if (req->cl &&
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  587  		    !(req->flags & BCH_WRITE_alloc_nowait) &&
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  588  		    !req->will_retry_target_devices &&
9cf25e68eaf43f fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-03-03  589  		    !req->will_retry_all_devices &&
9cf25e68eaf43f fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-03-03  590  		    !req->will_retry_set_devices) {
cef11441c19462 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-04-18  591  			if ((!req->copygc_can_make_progress ||
cef11441c19462 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-04-18  592  			     req->watermark == BCH_WATERMARK_copygc) &&
a2b2aa2abe1cfa fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-04-16  593  			    (req->nr_effective || (req->devs_have && req->devs_have->nr))) {
a2b2aa2abe1cfa fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-04-16  594  				ob = ERR_PTR(bch_err_throw(c, bucket_alloc_no_progress));
a2b2aa2abe1cfa fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-04-16  595  			} else if (!waiting) {
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  596  				closure_wait(&c->allocator.freelist_wait, req->cl);
822835ffeae411 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-04-01  597  				waiting = true;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  598  				goto again;
a2b2aa2abe1cfa fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-04-16  599  			} else {
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  600  				ob = ERR_PTR(bch_err_throw(c, bucket_alloc_blocked));
a2b2aa2abe1cfa fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-04-16  601  			}
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  602  		} else {
09b9c72bd4b77a fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-05-28  603  			ob = ERR_PTR(bch_err_throw(c, freelist_empty));
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  604  		}
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  605  
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  606  		goto err;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  607  	}
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  608  
822835ffeae411 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-04-01  609  	if (waiting)
429bcf057654e3 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-04-23  610  		bch2_alloc_wake_dev(ca);
f2b542ba42a8b3 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-12-11  611  alloc:
f2b542ba42a8b3 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-12-11  612  	ob = likely(freespace)
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  613  		? bch2_bucket_alloc_freelist(trans, req)
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  614  		: bch2_bucket_alloc_early(trans, req);
ae10fe017bf546 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-11-04  615  
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  616  	if (!ob && req->btree_bitmap != BTREE_BITMAP_ANY) {
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  617  		req->btree_bitmap = BTREE_BITMAP_ANY;
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  618  		goto alloc;
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  619  	}
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  620  
7ed4c14e20be2b fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-05-13  621  	if (!ob && freespace && c->recovery.pass_done < BCH_RECOVERY_PASS_check_alloc_info) {
f2b542ba42a8b3 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-12-11  622  		freespace = false;
f2b542ba42a8b3 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-12-11  623  		goto alloc;
f2b542ba42a8b3 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-12-11  624  	}
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  625  err:
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  626  	if (!ob)
09b9c72bd4b77a fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-05-28  627  		ob = ERR_PTR(bch_err_throw(c, no_buckets_found));
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  628  
7941ab67173f71 fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-09-06  629  	int ret = PTR_ERR_OR_ZERO(ob);
e7f63c67fcb4a4 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  630  
7941ab67173f71 fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-09-06  631  	if (!ret) {
7941ab67173f71 fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-09-06  632  		ob->data_type = req->data_type;
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  633  
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  634  		event_inc_trace(c, bucket_alloc, buf,
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  635  			bucket_alloc_to_text(&buf, c, req, ob));
c4d9372fac816d fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-03-31  636  	} else if (bch2_err_matches(ret, BCH_ERR_open_buckets_empty) ||
c4d9372fac816d fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-03-31  637  		   bch2_err_matches(ret, BCH_ERR_open_bucket_alloc_blocked)) {
7941ab67173f71 fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-09-06  638  		event_inc_trace(c, open_bucket_alloc_fail, buf,
7941ab67173f71 fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-09-06  639  			bch2_fs_open_buckets_to_text(&buf, c));
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  640  	} else if (!bch2_err_matches(ret, BCH_ERR_transaction_restart) &&
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  641  		   !req->will_retry_target_devices &&
9cf25e68eaf43f fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-03-03  642  		   !req->will_retry_all_devices &&
9cf25e68eaf43f fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-03-03  643  		   !req->will_retry_set_devices)
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  644  		event_inc_trace(c, bucket_alloc_fail, buf,
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  645  			bucket_alloc_to_text(&buf, c, req, ob));
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  646  
ca284ad06b139f fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-04-23  647  	alloc_trace_add(req, ca->dev_idx, ret, wake_counter_snapshot);
30b080917e7f00 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-02-13  648  
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  649  	return ob;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  650  }
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  651  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
