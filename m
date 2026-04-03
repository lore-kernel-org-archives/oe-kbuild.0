Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62C437CD4A
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205902; cv=none; b=VRUFs0lLd01I/nujmzNdU6WqK7RSCUj0ZMDHsOX0w+IQm8iimtt88PX/FmC5EFMxyzMBPl9Awz2yzW3+LXUrzT1gLN7LHrTFIl/ZosaLlxrBQRu0VhdtV0OHTZ8GfLcPBkKJJVc8pSZtuEKm1Mh+mInglyjdgg3mWm5NTOQFaF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205902; c=relaxed/simple;
	bh=hX/xxNdrg3aYrxSeBsEccrSWxovwto+s+cXfkqnvpPM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GQAIxchMv8wsZmO4RHP4zezK/UtUfL6n7xXMVSgQoIksURr6HFgDicZHSAdctsl0k6CbEz+C2eL25BFB8qTbb29bj1hjzqIA0HtWS2gkvwvILqo9D3z/1LU/Znlega5nGlqzYx6oMdDd7Rp/AuAa0FoCrjPzp+/Y8/bvL2vh93k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YrL5sAjm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YrL5sAjm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205901; x=1806741901;
  h=date:from:to:cc:subject:message-id;
  bh=hX/xxNdrg3aYrxSeBsEccrSWxovwto+s+cXfkqnvpPM=;
  b=YrL5sAjm5/OMpGegqH0enNX675CUdaoxW6tE+M33wCMISuyRJYS+XKUq
   OuUZuoD+bDIWcgkXxJ6OTHUO+4F9Ynh76++YmrTLeGhmtx2LP580w+jIL
   mqb1Ni7y9W08nII2SIKAnNlGApFPdEfbf63dotnMyxifz4O6d4oVQMByX
   JTa3aYL2yIvIooxRzBivM9oWfP1UXh5jaXkRIb9S3AKdJH+GQ/Zkc36By
   f44l1amZb8uEWZmiMpZb6TWo8W1fGUJlzWzcMckOAczAzYLingQtwZkmO
   11VBFGZLByp840/EdkHw96onk3sY/PmfertFcpg7T8GMdOEx4girQTRtE
   w==;
X-CSE-ConnectionGUID: hUEQzO9BT4GOqDM4Djr+Dw==
X-CSE-MsgGUID: L7EnJDwJRNeipWxrlxFEFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86888898"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86888898"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:45:00 -0700
X-CSE-ConnectionGUID: WpZ3DAxpQzm1cI5vC+YwaQ==
X-CSE-MsgGUID: RIJAf97BTRKXZL3G+/kNPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226368665"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:44:58 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a9A-0000000015T-1Pqz;
	Fri, 03 Apr 2026 08:44:56 +0000
Date: Fri, 03 Apr 2026 16:44:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:mirror-poly-aosp-pixel-malibu 4/4]
 fs/netfs/read_collect.c:219 netfs_consume_read_data() error: we previously
 assumed 'folioq' could be null (see line 115)
Message-ID: <202604030726.xueFUFJu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu
head:   aa00e9e9abd8b1848b806e405774c2145acdf1f3
commit: ee4cdf7ba857a894ad1650d6ab77669cbbfa329e [4/4] netfs: Speed up buffered reading
:::::: branch date: 21 hours ago
:::::: commit date: 1 year, 7 months ago
config: x86_64-randconfig-161-20260331 (https://download.01.org/0day-ci/archive/20260403/202604030726.xueFUFJu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ee4cdf7ba857 ("netfs: Speed up buffered reading")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604030726.xueFUFJu-lkp@intel.com/

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
