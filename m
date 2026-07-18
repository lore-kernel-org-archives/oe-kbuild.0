Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82C623BF9F
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jul 2026 14:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784385394; cv=none; b=NAgQzkqCqMX70xfHxbc6lqe1lT1TBOO5x8V2/Ha2DNjzGrFzRsGIgoIL8zADryz660qbH0lTXQ3rnI6YcGz03XV4fPW1CMDEw2kWi8yFrDqWyLnmNO4ZYSF1m6QWa+zfwXEcOxrohC9hOdDJKIFjUQS7d32sXDUVyFTuOtdlFcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784385394; c=relaxed/simple;
	bh=uWDHtWVpUgDma0H2ppJoVZav/40IG7MXuCqiCvWve9A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nIzKncz9OMLce/HiUSGs79zLaUk2Zr2EGqrrlskgyW4xzjb2ytpMr5qYYjwALioHGurtpyjV//8rsJ5bGe1s4VeGyolOmaVqGlKUPL0kGGFzn+5F5fZIkErFlDx9xLc8jR4mxIO+scaumpGE2g5B5j9FqsLXzs94WGXYqq0YCCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nduUc6qV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nduUc6qV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784385392; x=1815921392;
  h=date:from:to:cc:subject:message-id;
  bh=uWDHtWVpUgDma0H2ppJoVZav/40IG7MXuCqiCvWve9A=;
  b=nduUc6qV/FfinRkyZkKLo1/YCf06FFmYY8C0QQuJnhuaAnEiFA+taT5K
   7K+qgPHUPhQCxhDeVgi4sUvdqwILxoIqzEt0Mdb+IF/Ah6qGrGt9xGaZQ
   C/MB++h6Tf/TKEy62gzZXvaWLJEIVJ0SDMiEkrpHPLQuu4MWyPsJGx+Iw
   Y/lVSd5i+ezJIgTPfLt5VLRB1BKBfZs5HzyDUzKbxUgYcAY3KRRsABF2/
   elREO05y7kI4AlLPmzVMm3UFo5CiRAXtv2NgoLP/HuGg7TJ3SOOFVzywM
   bgQlgTjl2/oaG1Fxs/tD/1a09UujWBUFJUMA4VkyAES0yjSp2zsbVii1z
   Q==;
X-CSE-ConnectionGUID: rc/DzcUhRHK7T23yczhvng==
X-CSE-MsgGUID: i1y0Xye7TIiHNeWuw5JW/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="85056420"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="85056420"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 07:36:31 -0700
X-CSE-ConnectionGUID: Og7JycwnTG21X/VzD1nyuQ==
X-CSE-MsgGUID: +T3zQBtoRKGaZ2rUj4ZEYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="280317996"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jul 2026 07:36:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl69T-00000000UpO-38v3;
	Sat, 18 Jul 2026 14:36:27 +0000
Date: Sat, 18 Jul 2026 22:36:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-kminext 1/1]
 fs/netfs/read_collect.c:219 netfs_consume_read_data() error: we previously
 assumed 'folioq' could be null (see line 115)
Message-ID: <202607182144.OsRTYRad-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   2bfc8fe4015fcf2e39fc5989b95d20d6b5f7b566
commit: ee4cdf7ba857a894ad1650d6ab77669cbbfa329e [1/1] netfs: Speed up buffered reading
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 10 months ago
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260718/202607182144.OsRTYRad-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ee4cdf7ba857 ("netfs: Speed up buffered reading")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607182144.OsRTYRad-lkp@intel.com/

smatch warnings:
fs/netfs/read_collect.c:219 netfs_consume_read_data() error: we previously assumed 'folioq' could be null (see line 115)

vim +/folioq +219 fs/netfs/read_collect.c

ee4cdf7ba857a8 David Howells 2024-07-02   81  
ee4cdf7ba857a8 David Howells 2024-07-02   82  /*
ee4cdf7ba857a8 David Howells 2024-07-02   83   * Unlock any folios that are now completely read.  Returns true if the
ee4cdf7ba857a8 David Howells 2024-07-02   84   * subrequest is removed from the list.
ee4cdf7ba857a8 David Howells 2024-07-02   85   */
ee4cdf7ba857a8 David Howells 2024-07-02   86  static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq, bool was_async)
ee4cdf7ba857a8 David Howells 2024-07-02   87  {
ee4cdf7ba857a8 David Howells 2024-07-02   88  	struct netfs_io_subrequest *prev, *next;
ee4cdf7ba857a8 David Howells 2024-07-02   89  	struct netfs_io_request *rreq = subreq->rreq;
ee4cdf7ba857a8 David Howells 2024-07-02   90  	struct folio_queue *folioq = subreq->curr_folioq;
ee4cdf7ba857a8 David Howells 2024-07-02   91  	size_t avail, prev_donated, next_donated, fsize, part, excess;
ee4cdf7ba857a8 David Howells 2024-07-02   92  	loff_t fpos, start;
ee4cdf7ba857a8 David Howells 2024-07-02   93  	loff_t fend;
ee4cdf7ba857a8 David Howells 2024-07-02   94  	int slot = subreq->curr_folioq_slot;
ee4cdf7ba857a8 David Howells 2024-07-02   95  
ee4cdf7ba857a8 David Howells 2024-07-02   96  	if (WARN(subreq->transferred > subreq->len,
ee4cdf7ba857a8 David Howells 2024-07-02   97  		 "Subreq overread: R%x[%x] %zu > %zu",
ee4cdf7ba857a8 David Howells 2024-07-02   98  		 rreq->debug_id, subreq->debug_index,
ee4cdf7ba857a8 David Howells 2024-07-02   99  		 subreq->transferred, subreq->len))
ee4cdf7ba857a8 David Howells 2024-07-02  100  		subreq->transferred = subreq->len;
ee4cdf7ba857a8 David Howells 2024-07-02  101  
ee4cdf7ba857a8 David Howells 2024-07-02  102  next_folio:
ee4cdf7ba857a8 David Howells 2024-07-02  103  	fsize = PAGE_SIZE << subreq->curr_folio_order;
ee4cdf7ba857a8 David Howells 2024-07-02  104  	fpos = round_down(subreq->start + subreq->consumed, fsize);
ee4cdf7ba857a8 David Howells 2024-07-02  105  	fend = fpos + fsize;
ee4cdf7ba857a8 David Howells 2024-07-02  106  
ee4cdf7ba857a8 David Howells 2024-07-02  107  	if (WARN_ON_ONCE(!folioq) ||
ee4cdf7ba857a8 David Howells 2024-07-02  108  	    WARN_ON_ONCE(!folioq_folio(folioq, slot)) ||
ee4cdf7ba857a8 David Howells 2024-07-02  109  	    WARN_ON_ONCE(folioq_folio(folioq, slot)->index != fpos / PAGE_SIZE)) {
ee4cdf7ba857a8 David Howells 2024-07-02  110  		pr_err("R=%08x[%x] s=%llx-%llx ctl=%zx/%zx/%zx sl=%u\n",
ee4cdf7ba857a8 David Howells 2024-07-02  111  		       rreq->debug_id, subreq->debug_index,
ee4cdf7ba857a8 David Howells 2024-07-02  112  		       subreq->start, subreq->start + subreq->transferred - 1,
ee4cdf7ba857a8 David Howells 2024-07-02  113  		       subreq->consumed, subreq->transferred, subreq->len,
ee4cdf7ba857a8 David Howells 2024-07-02  114  		       slot);
ee4cdf7ba857a8 David Howells 2024-07-02 @115  		if (folioq) {
ee4cdf7ba857a8 David Howells 2024-07-02  116  			struct folio *folio = folioq_folio(folioq, slot);
ee4cdf7ba857a8 David Howells 2024-07-02  117  
ee4cdf7ba857a8 David Howells 2024-07-02  118  			pr_err("folioq: orders=%02x%02x%02x%02x\n",
ee4cdf7ba857a8 David Howells 2024-07-02  119  			       folioq->orders[0], folioq->orders[1],
ee4cdf7ba857a8 David Howells 2024-07-02  120  			       folioq->orders[2], folioq->orders[3]);
ee4cdf7ba857a8 David Howells 2024-07-02  121  			if (folio)
ee4cdf7ba857a8 David Howells 2024-07-02  122  				pr_err("folio: %llx-%llx ix=%llx o=%u qo=%u\n",
ee4cdf7ba857a8 David Howells 2024-07-02  123  				       fpos, fend - 1, folio_pos(folio), folio_order(folio),
ee4cdf7ba857a8 David Howells 2024-07-02  124  				       folioq_folio_order(folioq, slot));
ee4cdf7ba857a8 David Howells 2024-07-02  125  		}
ee4cdf7ba857a8 David Howells 2024-07-02  126  	}
ee4cdf7ba857a8 David Howells 2024-07-02  127  
ee4cdf7ba857a8 David Howells 2024-07-02  128  donation_changed:
ee4cdf7ba857a8 David Howells 2024-07-02  129  	/* Try to consume the current folio if we've hit or passed the end of
ee4cdf7ba857a8 David Howells 2024-07-02  130  	 * it.  There's a possibility that this subreq doesn't start at the
ee4cdf7ba857a8 David Howells 2024-07-02  131  	 * beginning of the folio, in which case we need to donate to/from the
ee4cdf7ba857a8 David Howells 2024-07-02  132  	 * preceding subreq.
ee4cdf7ba857a8 David Howells 2024-07-02  133  	 *
ee4cdf7ba857a8 David Howells 2024-07-02  134  	 * We also need to include any potential donation back from the
ee4cdf7ba857a8 David Howells 2024-07-02  135  	 * following subreq.
ee4cdf7ba857a8 David Howells 2024-07-02  136  	 */
ee4cdf7ba857a8 David Howells 2024-07-02  137  	prev_donated = READ_ONCE(subreq->prev_donated);
ee4cdf7ba857a8 David Howells 2024-07-02  138  	next_donated =  READ_ONCE(subreq->next_donated);
ee4cdf7ba857a8 David Howells 2024-07-02  139  	if (prev_donated || next_donated) {
ee4cdf7ba857a8 David Howells 2024-07-02  140  		spin_lock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  141  		prev_donated = subreq->prev_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  142  		next_donated =  subreq->next_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  143  		subreq->start -= prev_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  144  		subreq->len += prev_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  145  		subreq->transferred += prev_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  146  		prev_donated = subreq->prev_donated = 0;
ee4cdf7ba857a8 David Howells 2024-07-02  147  		if (subreq->transferred == subreq->len) {
ee4cdf7ba857a8 David Howells 2024-07-02  148  			subreq->len += next_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  149  			subreq->transferred += next_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  150  			next_donated = subreq->next_donated = 0;
ee4cdf7ba857a8 David Howells 2024-07-02  151  		}
ee4cdf7ba857a8 David Howells 2024-07-02  152  		trace_netfs_sreq(subreq, netfs_sreq_trace_add_donations);
ee4cdf7ba857a8 David Howells 2024-07-02  153  		spin_unlock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  154  	}
ee4cdf7ba857a8 David Howells 2024-07-02  155  
ee4cdf7ba857a8 David Howells 2024-07-02  156  	avail = subreq->transferred;
ee4cdf7ba857a8 David Howells 2024-07-02  157  	if (avail == subreq->len)
ee4cdf7ba857a8 David Howells 2024-07-02  158  		avail += next_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  159  	start = subreq->start;
ee4cdf7ba857a8 David Howells 2024-07-02  160  	if (subreq->consumed == 0) {
ee4cdf7ba857a8 David Howells 2024-07-02  161  		start -= prev_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  162  		avail += prev_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  163  	} else {
ee4cdf7ba857a8 David Howells 2024-07-02  164  		start += subreq->consumed;
ee4cdf7ba857a8 David Howells 2024-07-02  165  		avail -= subreq->consumed;
ee4cdf7ba857a8 David Howells 2024-07-02  166  	}
ee4cdf7ba857a8 David Howells 2024-07-02  167  	part = umin(avail, fsize);
ee4cdf7ba857a8 David Howells 2024-07-02  168  
ee4cdf7ba857a8 David Howells 2024-07-02  169  	trace_netfs_progress(subreq, start, avail, part);
ee4cdf7ba857a8 David Howells 2024-07-02  170  
ee4cdf7ba857a8 David Howells 2024-07-02  171  	if (start + avail >= fend) {
ee4cdf7ba857a8 David Howells 2024-07-02  172  		if (fpos == start) {
ee4cdf7ba857a8 David Howells 2024-07-02  173  			/* Flush, unlock and mark for caching any folio we've just read. */
ee4cdf7ba857a8 David Howells 2024-07-02  174  			subreq->consumed = fend - subreq->start;
ee4cdf7ba857a8 David Howells 2024-07-02  175  			netfs_unlock_read_folio(subreq, rreq, folioq, slot);
ee4cdf7ba857a8 David Howells 2024-07-02  176  			folioq_mark2(folioq, slot);
ee4cdf7ba857a8 David Howells 2024-07-02  177  			if (subreq->consumed >= subreq->len)
ee4cdf7ba857a8 David Howells 2024-07-02  178  				goto remove_subreq;
ee4cdf7ba857a8 David Howells 2024-07-02  179  		} else if (fpos < start) {
ee4cdf7ba857a8 David Howells 2024-07-02  180  			excess = fend - subreq->start;
ee4cdf7ba857a8 David Howells 2024-07-02  181  
ee4cdf7ba857a8 David Howells 2024-07-02  182  			spin_lock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  183  			/* If we complete first on a folio split with the
ee4cdf7ba857a8 David Howells 2024-07-02  184  			 * preceding subreq, donate to that subreq - otherwise
ee4cdf7ba857a8 David Howells 2024-07-02  185  			 * we get the responsibility.
ee4cdf7ba857a8 David Howells 2024-07-02  186  			 */
ee4cdf7ba857a8 David Howells 2024-07-02  187  			if (subreq->prev_donated != prev_donated) {
ee4cdf7ba857a8 David Howells 2024-07-02  188  				spin_unlock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  189  				goto donation_changed;
ee4cdf7ba857a8 David Howells 2024-07-02  190  			}
ee4cdf7ba857a8 David Howells 2024-07-02  191  
ee4cdf7ba857a8 David Howells 2024-07-02  192  			if (list_is_first(&subreq->rreq_link, &rreq->subrequests)) {
ee4cdf7ba857a8 David Howells 2024-07-02  193  				spin_unlock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  194  				pr_err("Can't donate prior to front\n");
ee4cdf7ba857a8 David Howells 2024-07-02  195  				goto bad;
ee4cdf7ba857a8 David Howells 2024-07-02  196  			}
ee4cdf7ba857a8 David Howells 2024-07-02  197  
ee4cdf7ba857a8 David Howells 2024-07-02  198  			prev = list_prev_entry(subreq, rreq_link);
ee4cdf7ba857a8 David Howells 2024-07-02  199  			WRITE_ONCE(prev->next_donated, prev->next_donated + excess);
ee4cdf7ba857a8 David Howells 2024-07-02  200  			subreq->start += excess;
ee4cdf7ba857a8 David Howells 2024-07-02  201  			subreq->len -= excess;
ee4cdf7ba857a8 David Howells 2024-07-02  202  			subreq->transferred -= excess;
ee4cdf7ba857a8 David Howells 2024-07-02  203  			trace_netfs_donate(rreq, subreq, prev, excess,
ee4cdf7ba857a8 David Howells 2024-07-02  204  					   netfs_trace_donate_tail_to_prev);
ee4cdf7ba857a8 David Howells 2024-07-02  205  			trace_netfs_sreq(subreq, netfs_sreq_trace_donate_to_prev);
ee4cdf7ba857a8 David Howells 2024-07-02  206  
ee4cdf7ba857a8 David Howells 2024-07-02  207  			if (subreq->consumed >= subreq->len)
ee4cdf7ba857a8 David Howells 2024-07-02  208  				goto remove_subreq_locked;
ee4cdf7ba857a8 David Howells 2024-07-02  209  			spin_unlock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  210  		} else {
ee4cdf7ba857a8 David Howells 2024-07-02  211  			pr_err("fpos > start\n");
ee4cdf7ba857a8 David Howells 2024-07-02  212  			goto bad;
ee4cdf7ba857a8 David Howells 2024-07-02  213  		}
ee4cdf7ba857a8 David Howells 2024-07-02  214  
ee4cdf7ba857a8 David Howells 2024-07-02  215  		/* Advance the rolling buffer to the next folio. */
ee4cdf7ba857a8 David Howells 2024-07-02  216  		slot++;
ee4cdf7ba857a8 David Howells 2024-07-02  217  		if (slot >= folioq_nr_slots(folioq)) {
ee4cdf7ba857a8 David Howells 2024-07-02  218  			slot = 0;
ee4cdf7ba857a8 David Howells 2024-07-02 @219  			folioq = folioq->next;
ee4cdf7ba857a8 David Howells 2024-07-02  220  			subreq->curr_folioq = folioq;
ee4cdf7ba857a8 David Howells 2024-07-02  221  		}
ee4cdf7ba857a8 David Howells 2024-07-02  222  		subreq->curr_folioq_slot = slot;
ee4cdf7ba857a8 David Howells 2024-07-02  223  		if (folioq && folioq_folio(folioq, slot))
ee4cdf7ba857a8 David Howells 2024-07-02  224  			subreq->curr_folio_order = folioq->orders[slot];
ee4cdf7ba857a8 David Howells 2024-07-02  225  		if (!was_async)
ee4cdf7ba857a8 David Howells 2024-07-02  226  			cond_resched();
ee4cdf7ba857a8 David Howells 2024-07-02  227  		goto next_folio;
ee4cdf7ba857a8 David Howells 2024-07-02  228  	}
ee4cdf7ba857a8 David Howells 2024-07-02  229  
ee4cdf7ba857a8 David Howells 2024-07-02  230  	/* Deal with partial progress. */
ee4cdf7ba857a8 David Howells 2024-07-02  231  	if (subreq->transferred < subreq->len)
ee4cdf7ba857a8 David Howells 2024-07-02  232  		return false;
ee4cdf7ba857a8 David Howells 2024-07-02  233  
ee4cdf7ba857a8 David Howells 2024-07-02  234  	/* Donate the remaining downloaded data to one of the neighbouring
ee4cdf7ba857a8 David Howells 2024-07-02  235  	 * subrequests.  Note that we may race with them doing the same thing.
ee4cdf7ba857a8 David Howells 2024-07-02  236  	 */
ee4cdf7ba857a8 David Howells 2024-07-02  237  	spin_lock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  238  
ee4cdf7ba857a8 David Howells 2024-07-02  239  	if (subreq->prev_donated != prev_donated ||
ee4cdf7ba857a8 David Howells 2024-07-02  240  	    subreq->next_donated != next_donated) {
ee4cdf7ba857a8 David Howells 2024-07-02  241  		spin_unlock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  242  		cond_resched();
ee4cdf7ba857a8 David Howells 2024-07-02  243  		goto donation_changed;
ee4cdf7ba857a8 David Howells 2024-07-02  244  	}
ee4cdf7ba857a8 David Howells 2024-07-02  245  
ee4cdf7ba857a8 David Howells 2024-07-02  246  	/* Deal with the trickiest case: that this subreq is in the middle of a
ee4cdf7ba857a8 David Howells 2024-07-02  247  	 * folio, not touching either edge, but finishes first.  In such a
ee4cdf7ba857a8 David Howells 2024-07-02  248  	 * case, we donate to the previous subreq, if there is one, so that the
ee4cdf7ba857a8 David Howells 2024-07-02  249  	 * donation is only handled when that completes - and remove this
ee4cdf7ba857a8 David Howells 2024-07-02  250  	 * subreq from the list.
ee4cdf7ba857a8 David Howells 2024-07-02  251  	 *
ee4cdf7ba857a8 David Howells 2024-07-02  252  	 * If the previous subreq finished first, we will have acquired their
ee4cdf7ba857a8 David Howells 2024-07-02  253  	 * donation and should be able to unlock folios and/or donate nextwards.
ee4cdf7ba857a8 David Howells 2024-07-02  254  	 */
ee4cdf7ba857a8 David Howells 2024-07-02  255  	if (!subreq->consumed &&
ee4cdf7ba857a8 David Howells 2024-07-02  256  	    !prev_donated &&
ee4cdf7ba857a8 David Howells 2024-07-02  257  	    !list_is_first(&subreq->rreq_link, &rreq->subrequests)) {
ee4cdf7ba857a8 David Howells 2024-07-02  258  		prev = list_prev_entry(subreq, rreq_link);
ee4cdf7ba857a8 David Howells 2024-07-02  259  		WRITE_ONCE(prev->next_donated, prev->next_donated + subreq->len);
ee4cdf7ba857a8 David Howells 2024-07-02  260  		subreq->start += subreq->len;
ee4cdf7ba857a8 David Howells 2024-07-02  261  		subreq->len = 0;
ee4cdf7ba857a8 David Howells 2024-07-02  262  		subreq->transferred = 0;
ee4cdf7ba857a8 David Howells 2024-07-02  263  		trace_netfs_donate(rreq, subreq, prev, subreq->len,
ee4cdf7ba857a8 David Howells 2024-07-02  264  				   netfs_trace_donate_to_prev);
ee4cdf7ba857a8 David Howells 2024-07-02  265  		trace_netfs_sreq(subreq, netfs_sreq_trace_donate_to_prev);
ee4cdf7ba857a8 David Howells 2024-07-02  266  		goto remove_subreq_locked;
ee4cdf7ba857a8 David Howells 2024-07-02  267  	}
ee4cdf7ba857a8 David Howells 2024-07-02  268  
ee4cdf7ba857a8 David Howells 2024-07-02  269  	/* If we can't donate down the chain, donate up the chain instead. */
ee4cdf7ba857a8 David Howells 2024-07-02  270  	excess = subreq->len - subreq->consumed + next_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  271  
ee4cdf7ba857a8 David Howells 2024-07-02  272  	if (!subreq->consumed)
ee4cdf7ba857a8 David Howells 2024-07-02  273  		excess += prev_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  274  
ee4cdf7ba857a8 David Howells 2024-07-02  275  	if (list_is_last(&subreq->rreq_link, &rreq->subrequests)) {
ee4cdf7ba857a8 David Howells 2024-07-02  276  		rreq->prev_donated = excess;
ee4cdf7ba857a8 David Howells 2024-07-02  277  		trace_netfs_donate(rreq, subreq, NULL, excess,
ee4cdf7ba857a8 David Howells 2024-07-02  278  				   netfs_trace_donate_to_deferred_next);
ee4cdf7ba857a8 David Howells 2024-07-02  279  	} else {
ee4cdf7ba857a8 David Howells 2024-07-02  280  		next = list_next_entry(subreq, rreq_link);
ee4cdf7ba857a8 David Howells 2024-07-02  281  		WRITE_ONCE(next->prev_donated, excess);
ee4cdf7ba857a8 David Howells 2024-07-02  282  		trace_netfs_donate(rreq, subreq, next, excess,
ee4cdf7ba857a8 David Howells 2024-07-02  283  				   netfs_trace_donate_to_next);
ee4cdf7ba857a8 David Howells 2024-07-02  284  	}
ee4cdf7ba857a8 David Howells 2024-07-02  285  	trace_netfs_sreq(subreq, netfs_sreq_trace_donate_to_next);
ee4cdf7ba857a8 David Howells 2024-07-02  286  	subreq->len = subreq->consumed;
ee4cdf7ba857a8 David Howells 2024-07-02  287  	subreq->transferred = subreq->consumed;
ee4cdf7ba857a8 David Howells 2024-07-02  288  	goto remove_subreq_locked;
ee4cdf7ba857a8 David Howells 2024-07-02  289  
ee4cdf7ba857a8 David Howells 2024-07-02  290  remove_subreq:
ee4cdf7ba857a8 David Howells 2024-07-02  291  	spin_lock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  292  remove_subreq_locked:
ee4cdf7ba857a8 David Howells 2024-07-02  293  	subreq->consumed = subreq->len;
ee4cdf7ba857a8 David Howells 2024-07-02  294  	list_del(&subreq->rreq_link);
ee4cdf7ba857a8 David Howells 2024-07-02  295  	spin_unlock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  296  	netfs_put_subrequest(subreq, false, netfs_sreq_trace_put_consumed);
ee4cdf7ba857a8 David Howells 2024-07-02  297  	return true;
ee4cdf7ba857a8 David Howells 2024-07-02  298  
ee4cdf7ba857a8 David Howells 2024-07-02  299  bad:
ee4cdf7ba857a8 David Howells 2024-07-02  300  	/* Errr... prev and next both donated to us, but insufficient to finish
ee4cdf7ba857a8 David Howells 2024-07-02  301  	 * the folio.
ee4cdf7ba857a8 David Howells 2024-07-02  302  	 */
ee4cdf7ba857a8 David Howells 2024-07-02  303  	printk("R=%08x[%x] s=%llx-%llx %zx/%zx/%zx\n",
ee4cdf7ba857a8 David Howells 2024-07-02  304  	       rreq->debug_id, subreq->debug_index,
ee4cdf7ba857a8 David Howells 2024-07-02  305  	       subreq->start, subreq->start + subreq->transferred - 1,
ee4cdf7ba857a8 David Howells 2024-07-02  306  	       subreq->consumed, subreq->transferred, subreq->len);
ee4cdf7ba857a8 David Howells 2024-07-02  307  	printk("folio: %llx-%llx\n", fpos, fend - 1);
ee4cdf7ba857a8 David Howells 2024-07-02  308  	printk("donated: prev=%zx next=%zx\n", prev_donated, next_donated);
ee4cdf7ba857a8 David Howells 2024-07-02  309  	printk("s=%llx av=%zx part=%zx\n", start, avail, part);
ee4cdf7ba857a8 David Howells 2024-07-02  310  	BUG();
ee4cdf7ba857a8 David Howells 2024-07-02  311  }
ee4cdf7ba857a8 David Howells 2024-07-02  312  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
