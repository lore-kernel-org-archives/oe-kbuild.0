Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5154DA04
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jul 2024 06:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719989596; cv=none; b=ej1kJrMFOGZHYYJa3ME2avltD0DWm/34sEALOAUy8/sgY2o3bvfAmpay4rRhYSOUbjbA5/SkE/Oq3ub5DQhaZ9yIwy39ij7awjCItyUJkU5YzQpEswIbYgA6MSa/grzmZmKaZDzhPo7T3dZaUiz3FFtn/EX3u9+3hZ6M0uWmp3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719989596; c=relaxed/simple;
	bh=imoAtZNOm/VG/inEGOcd8D+SR3CnKwqzLVZldp8Pj48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZtsziT49NWY/F0PI/l9N7RvoU2C9Y+ksV9BsL7eKt9t6Z6fQuiUtOCANuLqcImitnh1NpzQyUqeCw70oCA2diwWNAaDXzF8PAA3sq2dj2krP1BIJgqGBFxj5JSammILSs6Dk9w32MO8ho0EHCOu9yHYKRRjiQIds3a3qmacoCKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwSRolzA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwSRolzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719989595; x=1751525595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=imoAtZNOm/VG/inEGOcd8D+SR3CnKwqzLVZldp8Pj48=;
  b=YwSRolzAJzW6hTA2RGdlWJuWFlmwXNIdmVLlCOlQjN6ExvdNuujQiapH
   KooUYVaoKqe/yF+TPAg/BzpzSHEmbkVN7gwYq+v3WiYdig0EZZXYtlz/e
   UYp3Mr+QXsFVbvdF0myfxd3UJ9fwXg+kjDrdNyMNeh0IK/qiM/H24tLDU
   sbX7i4GzI9lzzGFqtJImFlnjifCx7nNz7RpxgwQlhn9M4/2Wpt1F4B/Lj
   oqwbNxu3AEV0L4h2Qc47+SiEh8QkYlAEhMrSQENfEpMV5dVoU2b5Ngubu
   OePFBih1tl4F+ZOgqT2R7eJmuhEwaQ/O8RmgkgfFJzdy22UD5/aDuHzjc
   g==;
X-CSE-ConnectionGUID: pQrV2ndqTbSwQe6JvaTgzg==
X-CSE-MsgGUID: z/f6DHdGSkGbrkRubPHYew==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="21010626"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="21010626"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 23:53:14 -0700
X-CSE-ConnectionGUID: 5xa0TxRYRA+/wNjuei8wDg==
X-CSE-MsgGUID: XEQLwhktTWCXk3QA5tHYeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="46295790"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Jul 2024 23:53:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOtrZ-000POy-2n;
	Wed, 03 Jul 2024 06:53:09 +0000
Date: Wed, 3 Jul 2024 14:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:netfs-writeback 16/17] fs/netfs/read_collect.c:170
 netfs_consume_read_data() error: we previously assumed 'folioq' could be
 null (see line 110)
Message-ID: <202407031405.z0FPKCLr-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   87ff2bfa2eb1cac0a80d376b99b244e96f582721
commit: 5a2bec0ed38eec31673fd7c48b558c29db922e1a [16/17] netfs: Speed up buffered reading
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: i386-randconfig-141-20240703 (https://download.01.org/0day-ci/archive/20240703/202407031405.z0FPKCLr-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407031405.z0FPKCLr-lkp@intel.com/

smatch warnings:
fs/netfs/read_collect.c:170 netfs_consume_read_data() error: we previously assumed 'folioq' could be null (see line 110)

vim +/folioq +170 fs/netfs/read_collect.c

5a2bec0ed38eec David Howells 2024-07-02   76  
5a2bec0ed38eec David Howells 2024-07-02   77  /*
5a2bec0ed38eec David Howells 2024-07-02   78   * Unlock any folios that are now completely read.  Returns true if the
5a2bec0ed38eec David Howells 2024-07-02   79   * subrequest is removed from the list.
5a2bec0ed38eec David Howells 2024-07-02   80   */
5a2bec0ed38eec David Howells 2024-07-02   81  static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq, bool was_async)
5a2bec0ed38eec David Howells 2024-07-02   82  {
5a2bec0ed38eec David Howells 2024-07-02   83  	struct netfs_io_subrequest *prev, *next;
5a2bec0ed38eec David Howells 2024-07-02   84  	struct netfs_io_request *rreq = subreq->rreq;
5a2bec0ed38eec David Howells 2024-07-02   85  	struct folio_queue *folioq = subreq->curr_folioq;
5a2bec0ed38eec David Howells 2024-07-02   86  	size_t avail, prev_donated, next_donated, fsize, part, excess;
5a2bec0ed38eec David Howells 2024-07-02   87  	loff_t fpos, start;
5a2bec0ed38eec David Howells 2024-07-02   88  	loff_t fend;
5a2bec0ed38eec David Howells 2024-07-02   89  	int slot = subreq->curr_folioq_slot;
5a2bec0ed38eec David Howells 2024-07-02   90  
5a2bec0ed38eec David Howells 2024-07-02   91  	if (WARN(subreq->transferred > subreq->len,
5a2bec0ed38eec David Howells 2024-07-02   92  		 "Subreq overread: R%x[%x] %zu > %zu",
5a2bec0ed38eec David Howells 2024-07-02   93  		 rreq->debug_id, subreq->debug_index,
5a2bec0ed38eec David Howells 2024-07-02   94  		 subreq->transferred, subreq->len))
5a2bec0ed38eec David Howells 2024-07-02   95  		subreq->transferred = subreq->len;
5a2bec0ed38eec David Howells 2024-07-02   96  
5a2bec0ed38eec David Howells 2024-07-02   97  next_folio:
5a2bec0ed38eec David Howells 2024-07-02   98  	fsize = PAGE_SIZE << subreq->curr_folio_order;
5a2bec0ed38eec David Howells 2024-07-02   99  	fpos = round_down(subreq->start + subreq->consumed, fsize);
5a2bec0ed38eec David Howells 2024-07-02  100  	fend = fpos + fsize;
5a2bec0ed38eec David Howells 2024-07-02  101  
5a2bec0ed38eec David Howells 2024-07-02  102  	if (WARN_ON_ONCE(!folioq) ||
5a2bec0ed38eec David Howells 2024-07-02  103  	    WARN_ON_ONCE(!folioq_folio(folioq, slot)) ||
5a2bec0ed38eec David Howells 2024-07-02  104  	    WARN_ON_ONCE(folioq_folio(folioq, slot)->index != fpos / PAGE_SIZE)) {
5a2bec0ed38eec David Howells 2024-07-02  105  		pr_err("R=%08x[%x] s=%llx-%llx ctl=%zx/%zx/%zx sl=%u\n",
5a2bec0ed38eec David Howells 2024-07-02  106  		       rreq->debug_id, subreq->debug_index,
5a2bec0ed38eec David Howells 2024-07-02  107  		       subreq->start, subreq->start + subreq->transferred,
5a2bec0ed38eec David Howells 2024-07-02  108  		       subreq->consumed, subreq->transferred, subreq->len,
5a2bec0ed38eec David Howells 2024-07-02  109  		       slot);
5a2bec0ed38eec David Howells 2024-07-02 @110  		if (folioq) {
5a2bec0ed38eec David Howells 2024-07-02  111  			struct folio *folio = folioq_folio(folioq, slot);
5a2bec0ed38eec David Howells 2024-07-02  112  
5a2bec0ed38eec David Howells 2024-07-02  113  			pr_err("folioq: %02x%02x%02x%02x\n",
5a2bec0ed38eec David Howells 2024-07-02  114  			       folioq->orders[0], folioq->orders[1],
5a2bec0ed38eec David Howells 2024-07-02  115  			       folioq->orders[2], folioq->orders[3]);
5a2bec0ed38eec David Howells 2024-07-02  116  			if (folio)
5a2bec0ed38eec David Howells 2024-07-02  117  				pr_err("folio: %llx-%llx ix=%llx o=%u qo=%u\n",
5a2bec0ed38eec David Howells 2024-07-02  118  				       fpos, fend - 1, folio_pos(folio), folio_order(folio),
5a2bec0ed38eec David Howells 2024-07-02  119  				       folioq_folio_order(folioq, slot));
5a2bec0ed38eec David Howells 2024-07-02  120  		}
5a2bec0ed38eec David Howells 2024-07-02  121  	}
5a2bec0ed38eec David Howells 2024-07-02  122  
5a2bec0ed38eec David Howells 2024-07-02  123  donation_changed:
5a2bec0ed38eec David Howells 2024-07-02  124  	/* Try to consume the current folio if we've hit or passed the end of
5a2bec0ed38eec David Howells 2024-07-02  125  	 * it.  There's a possibility that this subreq doesn't start at the
5a2bec0ed38eec David Howells 2024-07-02  126  	 * beginning of the folio, in which case we need to donate to/from the
5a2bec0ed38eec David Howells 2024-07-02  127  	 * preceding subreq.
5a2bec0ed38eec David Howells 2024-07-02  128  	 *
5a2bec0ed38eec David Howells 2024-07-02  129  	 * We also need to include any potential donation back from the
5a2bec0ed38eec David Howells 2024-07-02  130  	 * following subreq.
5a2bec0ed38eec David Howells 2024-07-02  131  	 */
5a2bec0ed38eec David Howells 2024-07-02  132  	prev_donated = READ_ONCE(subreq->prev_donated);
5a2bec0ed38eec David Howells 2024-07-02  133  	next_donated =  READ_ONCE(subreq->next_donated);
5a2bec0ed38eec David Howells 2024-07-02  134  	if (prev_donated || next_donated) {
5a2bec0ed38eec David Howells 2024-07-02  135  		spin_lock(&rreq->lock);
5a2bec0ed38eec David Howells 2024-07-02  136  		prev_donated = subreq->prev_donated;
5a2bec0ed38eec David Howells 2024-07-02  137  		next_donated =  subreq->next_donated;
5a2bec0ed38eec David Howells 2024-07-02  138  		subreq->start -= prev_donated;
5a2bec0ed38eec David Howells 2024-07-02  139  		subreq->len += prev_donated;
5a2bec0ed38eec David Howells 2024-07-02  140  		subreq->transferred += prev_donated;
5a2bec0ed38eec David Howells 2024-07-02  141  		prev_donated = subreq->prev_donated = 0;
5a2bec0ed38eec David Howells 2024-07-02  142  		if (subreq->transferred == subreq->len) {
5a2bec0ed38eec David Howells 2024-07-02  143  			subreq->len += next_donated;
5a2bec0ed38eec David Howells 2024-07-02  144  			subreq->transferred += next_donated;
5a2bec0ed38eec David Howells 2024-07-02  145  			next_donated = subreq->next_donated = 0;
5a2bec0ed38eec David Howells 2024-07-02  146  		}
5a2bec0ed38eec David Howells 2024-07-02  147  		trace_netfs_sreq(subreq, netfs_sreq_trace_add_donations);
5a2bec0ed38eec David Howells 2024-07-02  148  		spin_unlock(&rreq->lock);
5a2bec0ed38eec David Howells 2024-07-02  149  	}
5a2bec0ed38eec David Howells 2024-07-02  150  
5a2bec0ed38eec David Howells 2024-07-02  151  	avail = subreq->transferred;
5a2bec0ed38eec David Howells 2024-07-02  152  	if (avail == subreq->len)
5a2bec0ed38eec David Howells 2024-07-02  153  		avail += next_donated;
5a2bec0ed38eec David Howells 2024-07-02  154  	start = subreq->start;
5a2bec0ed38eec David Howells 2024-07-02  155  	if (subreq->consumed == 0) {
5a2bec0ed38eec David Howells 2024-07-02  156  		start -= prev_donated;
5a2bec0ed38eec David Howells 2024-07-02  157  		avail += prev_donated;
5a2bec0ed38eec David Howells 2024-07-02  158  	} else {
5a2bec0ed38eec David Howells 2024-07-02  159  		start += subreq->consumed;
5a2bec0ed38eec David Howells 2024-07-02  160  		avail -= subreq->consumed;
5a2bec0ed38eec David Howells 2024-07-02  161  	}
5a2bec0ed38eec David Howells 2024-07-02  162  	part = umin(avail, fsize);
5a2bec0ed38eec David Howells 2024-07-02  163  
5a2bec0ed38eec David Howells 2024-07-02  164  	trace_netfs_progress(subreq, start, avail, part);
5a2bec0ed38eec David Howells 2024-07-02  165  
5a2bec0ed38eec David Howells 2024-07-02  166  	if (start + avail >= fend) {
5a2bec0ed38eec David Howells 2024-07-02  167  		if (fpos == start) {
5a2bec0ed38eec David Howells 2024-07-02  168  			/* Flush, unlock and mark for caching any folio we've just read. */
5a2bec0ed38eec David Howells 2024-07-02  169  			subreq->consumed = fend - subreq->start;
5a2bec0ed38eec David Howells 2024-07-02 @170  			netfs_unlock_read_folio(subreq, rreq, folioq_folio(folioq, slot));
5a2bec0ed38eec David Howells 2024-07-02  171  			folioq_mark2(folioq, slot);
5a2bec0ed38eec David Howells 2024-07-02  172  			if (subreq->consumed >= subreq->len)
5a2bec0ed38eec David Howells 2024-07-02  173  				goto remove_subreq;
5a2bec0ed38eec David Howells 2024-07-02  174  		} else if (fpos < start) {
5a2bec0ed38eec David Howells 2024-07-02  175  			excess = fend - subreq->start;
5a2bec0ed38eec David Howells 2024-07-02  176  
5a2bec0ed38eec David Howells 2024-07-02  177  			spin_lock(&rreq->lock);
5a2bec0ed38eec David Howells 2024-07-02  178  			/* If we complete first on a folio split with the
5a2bec0ed38eec David Howells 2024-07-02  179  			 * preceding subreq, donate to that subreq - otherwise
5a2bec0ed38eec David Howells 2024-07-02  180  			 * we get the responsibility.
5a2bec0ed38eec David Howells 2024-07-02  181  			 */
5a2bec0ed38eec David Howells 2024-07-02  182  			if (subreq->prev_donated != prev_donated) {
5a2bec0ed38eec David Howells 2024-07-02  183  				spin_unlock(&rreq->lock);
5a2bec0ed38eec David Howells 2024-07-02  184  				goto donation_changed;
5a2bec0ed38eec David Howells 2024-07-02  185  			}
5a2bec0ed38eec David Howells 2024-07-02  186  
5a2bec0ed38eec David Howells 2024-07-02  187  			if (list_is_first(&subreq->rreq_link, &rreq->subrequests)) {
5a2bec0ed38eec David Howells 2024-07-02  188  				spin_unlock(&rreq->lock);
5a2bec0ed38eec David Howells 2024-07-02  189  				pr_err("Can't donate prior to front\n");
5a2bec0ed38eec David Howells 2024-07-02  190  				goto bad;
5a2bec0ed38eec David Howells 2024-07-02  191  			}
5a2bec0ed38eec David Howells 2024-07-02  192  
5a2bec0ed38eec David Howells 2024-07-02  193  			prev = list_prev_entry(subreq, rreq_link);
5a2bec0ed38eec David Howells 2024-07-02  194  			WRITE_ONCE(prev->next_donated, prev->next_donated + excess);
5a2bec0ed38eec David Howells 2024-07-02  195  			subreq->start += excess;
5a2bec0ed38eec David Howells 2024-07-02  196  			subreq->len -= excess;
5a2bec0ed38eec David Howells 2024-07-02  197  			subreq->transferred -= excess;
5a2bec0ed38eec David Howells 2024-07-02  198  			trace_netfs_donate(rreq, subreq, prev, excess,
5a2bec0ed38eec David Howells 2024-07-02  199  					   netfs_trace_donate_tail_to_prev);
5a2bec0ed38eec David Howells 2024-07-02  200  			trace_netfs_sreq(subreq, netfs_sreq_trace_donate_to_prev);
5a2bec0ed38eec David Howells 2024-07-02  201  
5a2bec0ed38eec David Howells 2024-07-02  202  			if (subreq->consumed >= subreq->len)
5a2bec0ed38eec David Howells 2024-07-02  203  				goto remove_subreq_locked;
5a2bec0ed38eec David Howells 2024-07-02  204  			spin_unlock(&rreq->lock);
5a2bec0ed38eec David Howells 2024-07-02  205  		} else {
5a2bec0ed38eec David Howells 2024-07-02  206  			pr_err("fpos > start\n");
5a2bec0ed38eec David Howells 2024-07-02  207  			goto bad;
5a2bec0ed38eec David Howells 2024-07-02  208  		}
5a2bec0ed38eec David Howells 2024-07-02  209  
5a2bec0ed38eec David Howells 2024-07-02  210  		/* Advance the rolling buffer to the next folio. */
5a2bec0ed38eec David Howells 2024-07-02  211  		slot++;
5a2bec0ed38eec David Howells 2024-07-02  212  		if (slot >= folioq_nr_slots(folioq)) {
5a2bec0ed38eec David Howells 2024-07-02  213  			slot = 0;
5a2bec0ed38eec David Howells 2024-07-02  214  			folioq = folioq->next;
5a2bec0ed38eec David Howells 2024-07-02  215  			subreq->curr_folioq = folioq;
5a2bec0ed38eec David Howells 2024-07-02  216  		}
5a2bec0ed38eec David Howells 2024-07-02  217  		subreq->curr_folioq_slot = slot;
5a2bec0ed38eec David Howells 2024-07-02  218  		if (folioq && folioq_folio(folioq, slot))
5a2bec0ed38eec David Howells 2024-07-02  219  			subreq->curr_folio_order = folioq->orders[slot];
5a2bec0ed38eec David Howells 2024-07-02  220  		cond_resched();
5a2bec0ed38eec David Howells 2024-07-02  221  		goto next_folio;
5a2bec0ed38eec David Howells 2024-07-02  222  	}
5a2bec0ed38eec David Howells 2024-07-02  223  
5a2bec0ed38eec David Howells 2024-07-02  224  	/* Deal with partial progress. */
5a2bec0ed38eec David Howells 2024-07-02  225  	if (subreq->transferred < subreq->len)
5a2bec0ed38eec David Howells 2024-07-02  226  		return false;
5a2bec0ed38eec David Howells 2024-07-02  227  
5a2bec0ed38eec David Howells 2024-07-02  228  	/* Donate the remaining downloaded data to one of the neighbouring
5a2bec0ed38eec David Howells 2024-07-02  229  	 * subrequests.  Note that we may race with them doing the same thing.
5a2bec0ed38eec David Howells 2024-07-02  230  	 */
5a2bec0ed38eec David Howells 2024-07-02  231  	spin_lock(&rreq->lock);
5a2bec0ed38eec David Howells 2024-07-02  232  
5a2bec0ed38eec David Howells 2024-07-02  233  	if (subreq->prev_donated != prev_donated ||
5a2bec0ed38eec David Howells 2024-07-02  234  	    subreq->next_donated != next_donated) {
5a2bec0ed38eec David Howells 2024-07-02  235  		spin_unlock(&rreq->lock);
5a2bec0ed38eec David Howells 2024-07-02  236  		cond_resched();
5a2bec0ed38eec David Howells 2024-07-02  237  		goto donation_changed;
5a2bec0ed38eec David Howells 2024-07-02  238  	}
5a2bec0ed38eec David Howells 2024-07-02  239  
5a2bec0ed38eec David Howells 2024-07-02  240  	/* Deal with the trickiest case: that this subreq is in the middle of a
5a2bec0ed38eec David Howells 2024-07-02  241  	 * folio, not touching either edge, but finishes first.  In such a
5a2bec0ed38eec David Howells 2024-07-02  242  	 * case, we donate to the previous subreq, if there is one, so that the
5a2bec0ed38eec David Howells 2024-07-02  243  	 * donation is only handled when that completes - and remove this
5a2bec0ed38eec David Howells 2024-07-02  244  	 * subreq from the list.
5a2bec0ed38eec David Howells 2024-07-02  245  	 *
5a2bec0ed38eec David Howells 2024-07-02  246  	 * If the previous subreq finished first, we will have acquired their
5a2bec0ed38eec David Howells 2024-07-02  247  	 * donation and should be able to unlock folios and/or donate nextwards.
5a2bec0ed38eec David Howells 2024-07-02  248  	 */
5a2bec0ed38eec David Howells 2024-07-02  249  	if (!subreq->consumed &&
5a2bec0ed38eec David Howells 2024-07-02  250  	    !prev_donated &&
5a2bec0ed38eec David Howells 2024-07-02  251  	    !list_is_first(&subreq->rreq_link, &rreq->subrequests)) {
5a2bec0ed38eec David Howells 2024-07-02  252  		prev = list_prev_entry(subreq, rreq_link);
5a2bec0ed38eec David Howells 2024-07-02  253  		WRITE_ONCE(prev->next_donated, prev->next_donated + subreq->len);
5a2bec0ed38eec David Howells 2024-07-02  254  		subreq->start += subreq->len;
5a2bec0ed38eec David Howells 2024-07-02  255  		subreq->len = 0;
5a2bec0ed38eec David Howells 2024-07-02  256  		subreq->transferred = 0;
5a2bec0ed38eec David Howells 2024-07-02  257  		trace_netfs_donate(rreq, subreq, prev, subreq->len,
5a2bec0ed38eec David Howells 2024-07-02  258  				   netfs_trace_donate_to_prev);
5a2bec0ed38eec David Howells 2024-07-02  259  		trace_netfs_sreq(subreq, netfs_sreq_trace_donate_to_prev);
5a2bec0ed38eec David Howells 2024-07-02  260  		goto remove_subreq_locked;
5a2bec0ed38eec David Howells 2024-07-02  261  	}
5a2bec0ed38eec David Howells 2024-07-02  262  
5a2bec0ed38eec David Howells 2024-07-02  263  	/* If we can't donate down the chain, donate up the chain instead. */
5a2bec0ed38eec David Howells 2024-07-02  264  	excess = subreq->len - subreq->consumed + next_donated;
5a2bec0ed38eec David Howells 2024-07-02  265  
5a2bec0ed38eec David Howells 2024-07-02  266  	if (!subreq->consumed)
5a2bec0ed38eec David Howells 2024-07-02  267  		excess += prev_donated;
5a2bec0ed38eec David Howells 2024-07-02  268  
5a2bec0ed38eec David Howells 2024-07-02  269  	if (list_is_last(&subreq->rreq_link, &rreq->subrequests)) {
5a2bec0ed38eec David Howells 2024-07-02  270  		rreq->prev_donated = excess;
5a2bec0ed38eec David Howells 2024-07-02  271  		trace_netfs_donate(rreq, subreq, NULL, excess,
5a2bec0ed38eec David Howells 2024-07-02  272  				   netfs_trace_donate_to_deferred_next);
5a2bec0ed38eec David Howells 2024-07-02  273  	} else {
5a2bec0ed38eec David Howells 2024-07-02  274  		next = list_next_entry(subreq, rreq_link);
5a2bec0ed38eec David Howells 2024-07-02  275  		WRITE_ONCE(next->prev_donated, excess);
5a2bec0ed38eec David Howells 2024-07-02  276  		trace_netfs_donate(rreq, subreq, next, excess,
5a2bec0ed38eec David Howells 2024-07-02  277  				   netfs_trace_donate_to_next);
5a2bec0ed38eec David Howells 2024-07-02  278  	}
5a2bec0ed38eec David Howells 2024-07-02  279  	trace_netfs_sreq(subreq, netfs_sreq_trace_donate_to_next);
5a2bec0ed38eec David Howells 2024-07-02  280  	subreq->len = subreq->consumed;
5a2bec0ed38eec David Howells 2024-07-02  281  	subreq->transferred = subreq->consumed;
5a2bec0ed38eec David Howells 2024-07-02  282  	goto remove_subreq_locked;
5a2bec0ed38eec David Howells 2024-07-02  283  
5a2bec0ed38eec David Howells 2024-07-02  284  remove_subreq:
5a2bec0ed38eec David Howells 2024-07-02  285  	spin_lock(&rreq->lock);
5a2bec0ed38eec David Howells 2024-07-02  286  remove_subreq_locked:
5a2bec0ed38eec David Howells 2024-07-02  287  	subreq->consumed = subreq->len;
5a2bec0ed38eec David Howells 2024-07-02  288  	list_del(&subreq->rreq_link);
5a2bec0ed38eec David Howells 2024-07-02  289  	spin_unlock(&rreq->lock);
5a2bec0ed38eec David Howells 2024-07-02  290  	netfs_put_subrequest(subreq, false, netfs_sreq_trace_put_consumed);
5a2bec0ed38eec David Howells 2024-07-02  291  	return true;
5a2bec0ed38eec David Howells 2024-07-02  292  
5a2bec0ed38eec David Howells 2024-07-02  293  bad:
5a2bec0ed38eec David Howells 2024-07-02  294  	/* Errr... prev and next both donated to us, but insufficient to finish
5a2bec0ed38eec David Howells 2024-07-02  295  	 * the folio.
5a2bec0ed38eec David Howells 2024-07-02  296  	 */
5a2bec0ed38eec David Howells 2024-07-02  297  	printk("R=%08x[%x] s=%llx-%llx %zx/%zx/%zx\n",
5a2bec0ed38eec David Howells 2024-07-02  298  	       rreq->debug_id, subreq->debug_index,
5a2bec0ed38eec David Howells 2024-07-02  299  	       subreq->start, subreq->start + subreq->transferred - 1,
5a2bec0ed38eec David Howells 2024-07-02  300  	       subreq->consumed, subreq->transferred, subreq->len);
5a2bec0ed38eec David Howells 2024-07-02  301  	printk("folio: %llx-%llx\n", fpos, fend - 1);
5a2bec0ed38eec David Howells 2024-07-02  302  	printk("donated: prev=%zx next=%zx\n", prev_donated, next_donated);
5a2bec0ed38eec David Howells 2024-07-02  303  	printk("s=%llx av=%zx part=%zx\n", start, avail, part);
5a2bec0ed38eec David Howells 2024-07-02  304  	BUG();
5a2bec0ed38eec David Howells 2024-07-02  305  }
5a2bec0ed38eec David Howells 2024-07-02  306  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
