Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C28323CB
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Jan 2025 19:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736018058; cv=none; b=BC8F8rXX+vsahRMhGbQ/T4PB5hGEzRyrXadwzH0oxTTPpwZLxzI7cUDLp4pEi7SKDUZYjmoua4/4w8mEM6ceovwLssExsn/kC/xZOlJqzlr3q5fiz18kEzdToZdAYSv+WPXYyD5V2uFi+SBiwJeV1gTq1//ia5AZnLH9oR6sXDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736018058; c=relaxed/simple;
	bh=gPx+ZFfk0zE0P8/7e4v7U+yRg6OI5+s11lOEB9Rm3KE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RI266hNB7O1zkCiae9IO0Mp7AH9R+hIZd2qvmz8lY3i+kpVVq8uxvkf83XvgQRK1HJIZBeOf1ypDL0UgBl2kgjQ4NjzbCMIeavclmA3lEgE47ug9AbXzsa6ld69qu7rrz/mmgQmVrhIPuR5RMpU8Jd4uVLUds+3qJ2QT0MJiPuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6MlovAr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6MlovAr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736018056; x=1767554056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gPx+ZFfk0zE0P8/7e4v7U+yRg6OI5+s11lOEB9Rm3KE=;
  b=m6MlovArvd7sBj2G12+DsPPS5MaoUH4cr2aFVRqfPiJOes5CzkLDv1ws
   hTM6oB/S5aDAUKRmsWWuN2i+YEIIyiMffRbtTV56o8n0TTb6zAHqaCC12
   AgxVRkPl37ca/WgVkn4kxtHi1ekkLgRt7MJFxTf9JT2QBJBXd0VnMVk16
   RWj2HAy42udQ1BgkcfFtrejhe6/dISN+/3qmg/+D5Qtd0+yDeGtYRA94+
   KFdLyvI5VxEbPvnZPY9ySAI9LEU+w8+cGOKq0CPzEcdrVQkNP0EdfsiF7
   c7KWw9rNdVLbxrI/fpONAnboUCSuQ4Dm3j3SNGcCQ80TqwhdBkan9iq6B
   g==;
X-CSE-ConnectionGUID: 3/+mvAR6RXmDFG9F1G/MLQ==
X-CSE-MsgGUID: tRhCxXN7QOm8tbcOw4beIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="46895360"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="46895360"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 11:14:15 -0800
X-CSE-ConnectionGUID: Rxdvy+NQT6mGPvDknH43dw==
X-CSE-MsgGUID: iJDr3FHdR1K+aJqnYJcGJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="107108818"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Jan 2025 11:14:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU9b9-000B9j-2G;
	Sat, 04 Jan 2025 19:14:11 +0000
Date: Sun, 5 Jan 2025 03:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-vfs:vfs.fixes 13/24] fs/netfs/read_collect.c:260
 netfs_consume_read_data() error: uninitialized symbol 'prev'.
Message-ID: <202501050354.fJ8Uv7sZ-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: David Howells <dhowells@redhat.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.fixes
head:   03f275adb8fbd7b4ebe96a1ad5044d8e602692dc
commit: c8b90d40d5bba8e6fba457b8a7c10d3c0d467e37 [13/24] netfs: Fix non-contiguous donation between completed reads
:::::: branch date: 10 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-141-20250104 (https://download.01.org/0day-ci/archive/20250105/202501050354.fJ8Uv7sZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501050354.fJ8Uv7sZ-lkp@intel.com/

New smatch warnings:
fs/netfs/read_collect.c:260 netfs_consume_read_data() error: uninitialized symbol 'prev'.

Old smatch warnings:
fs/netfs/read_collect.c:221 netfs_consume_read_data() error: we previously assumed 'folioq' could be null (see line 117)

vim +/prev +260 fs/netfs/read_collect.c

ee4cdf7ba857a8 David Howells 2024-07-02   83  
ee4cdf7ba857a8 David Howells 2024-07-02   84  /*
ee4cdf7ba857a8 David Howells 2024-07-02   85   * Unlock any folios that are now completely read.  Returns true if the
ee4cdf7ba857a8 David Howells 2024-07-02   86   * subrequest is removed from the list.
ee4cdf7ba857a8 David Howells 2024-07-02   87   */
ee4cdf7ba857a8 David Howells 2024-07-02   88  static bool netfs_consume_read_data(struct netfs_io_subrequest *subreq, bool was_async)
ee4cdf7ba857a8 David Howells 2024-07-02   89  {
ee4cdf7ba857a8 David Howells 2024-07-02   90  	struct netfs_io_subrequest *prev, *next;
ee4cdf7ba857a8 David Howells 2024-07-02   91  	struct netfs_io_request *rreq = subreq->rreq;
ee4cdf7ba857a8 David Howells 2024-07-02   92  	struct folio_queue *folioq = subreq->curr_folioq;
ee4cdf7ba857a8 David Howells 2024-07-02   93  	size_t avail, prev_donated, next_donated, fsize, part, excess;
ee4cdf7ba857a8 David Howells 2024-07-02   94  	loff_t fpos, start;
ee4cdf7ba857a8 David Howells 2024-07-02   95  	loff_t fend;
ee4cdf7ba857a8 David Howells 2024-07-02   96  	int slot = subreq->curr_folioq_slot;
ee4cdf7ba857a8 David Howells 2024-07-02   97  
ee4cdf7ba857a8 David Howells 2024-07-02   98  	if (WARN(subreq->transferred > subreq->len,
ee4cdf7ba857a8 David Howells 2024-07-02   99  		 "Subreq overread: R%x[%x] %zu > %zu",
ee4cdf7ba857a8 David Howells 2024-07-02  100  		 rreq->debug_id, subreq->debug_index,
ee4cdf7ba857a8 David Howells 2024-07-02  101  		 subreq->transferred, subreq->len))
ee4cdf7ba857a8 David Howells 2024-07-02  102  		subreq->transferred = subreq->len;
ee4cdf7ba857a8 David Howells 2024-07-02  103  
ee4cdf7ba857a8 David Howells 2024-07-02  104  next_folio:
ee4cdf7ba857a8 David Howells 2024-07-02  105  	fsize = PAGE_SIZE << subreq->curr_folio_order;
ee4cdf7ba857a8 David Howells 2024-07-02  106  	fpos = round_down(subreq->start + subreq->consumed, fsize);
ee4cdf7ba857a8 David Howells 2024-07-02  107  	fend = fpos + fsize;
ee4cdf7ba857a8 David Howells 2024-07-02  108  
ee4cdf7ba857a8 David Howells 2024-07-02  109  	if (WARN_ON_ONCE(!folioq) ||
ee4cdf7ba857a8 David Howells 2024-07-02  110  	    WARN_ON_ONCE(!folioq_folio(folioq, slot)) ||
ee4cdf7ba857a8 David Howells 2024-07-02  111  	    WARN_ON_ONCE(folioq_folio(folioq, slot)->index != fpos / PAGE_SIZE)) {
ee4cdf7ba857a8 David Howells 2024-07-02  112  		pr_err("R=%08x[%x] s=%llx-%llx ctl=%zx/%zx/%zx sl=%u\n",
ee4cdf7ba857a8 David Howells 2024-07-02  113  		       rreq->debug_id, subreq->debug_index,
ee4cdf7ba857a8 David Howells 2024-07-02  114  		       subreq->start, subreq->start + subreq->transferred - 1,
ee4cdf7ba857a8 David Howells 2024-07-02  115  		       subreq->consumed, subreq->transferred, subreq->len,
ee4cdf7ba857a8 David Howells 2024-07-02  116  		       slot);
ee4cdf7ba857a8 David Howells 2024-07-02  117  		if (folioq) {
ee4cdf7ba857a8 David Howells 2024-07-02  118  			struct folio *folio = folioq_folio(folioq, slot);
ee4cdf7ba857a8 David Howells 2024-07-02  119  
ee4cdf7ba857a8 David Howells 2024-07-02  120  			pr_err("folioq: orders=%02x%02x%02x%02x\n",
ee4cdf7ba857a8 David Howells 2024-07-02  121  			       folioq->orders[0], folioq->orders[1],
ee4cdf7ba857a8 David Howells 2024-07-02  122  			       folioq->orders[2], folioq->orders[3]);
ee4cdf7ba857a8 David Howells 2024-07-02  123  			if (folio)
ee4cdf7ba857a8 David Howells 2024-07-02  124  				pr_err("folio: %llx-%llx ix=%llx o=%u qo=%u\n",
ee4cdf7ba857a8 David Howells 2024-07-02  125  				       fpos, fend - 1, folio_pos(folio), folio_order(folio),
ee4cdf7ba857a8 David Howells 2024-07-02  126  				       folioq_folio_order(folioq, slot));
ee4cdf7ba857a8 David Howells 2024-07-02  127  		}
ee4cdf7ba857a8 David Howells 2024-07-02  128  	}
ee4cdf7ba857a8 David Howells 2024-07-02  129  
ee4cdf7ba857a8 David Howells 2024-07-02  130  donation_changed:
ee4cdf7ba857a8 David Howells 2024-07-02  131  	/* Try to consume the current folio if we've hit or passed the end of
ee4cdf7ba857a8 David Howells 2024-07-02  132  	 * it.  There's a possibility that this subreq doesn't start at the
ee4cdf7ba857a8 David Howells 2024-07-02  133  	 * beginning of the folio, in which case we need to donate to/from the
ee4cdf7ba857a8 David Howells 2024-07-02  134  	 * preceding subreq.
ee4cdf7ba857a8 David Howells 2024-07-02  135  	 *
ee4cdf7ba857a8 David Howells 2024-07-02  136  	 * We also need to include any potential donation back from the
ee4cdf7ba857a8 David Howells 2024-07-02  137  	 * following subreq.
ee4cdf7ba857a8 David Howells 2024-07-02  138  	 */
ee4cdf7ba857a8 David Howells 2024-07-02  139  	prev_donated = READ_ONCE(subreq->prev_donated);
ee4cdf7ba857a8 David Howells 2024-07-02  140  	next_donated =  READ_ONCE(subreq->next_donated);
ee4cdf7ba857a8 David Howells 2024-07-02  141  	if (prev_donated || next_donated) {
ee4cdf7ba857a8 David Howells 2024-07-02  142  		spin_lock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  143  		prev_donated = subreq->prev_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  144  		next_donated =  subreq->next_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  145  		subreq->start -= prev_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  146  		subreq->len += prev_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  147  		subreq->transferred += prev_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  148  		prev_donated = subreq->prev_donated = 0;
ee4cdf7ba857a8 David Howells 2024-07-02  149  		if (subreq->transferred == subreq->len) {
ee4cdf7ba857a8 David Howells 2024-07-02  150  			subreq->len += next_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  151  			subreq->transferred += next_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  152  			next_donated = subreq->next_donated = 0;
ee4cdf7ba857a8 David Howells 2024-07-02  153  		}
ee4cdf7ba857a8 David Howells 2024-07-02  154  		trace_netfs_sreq(subreq, netfs_sreq_trace_add_donations);
ee4cdf7ba857a8 David Howells 2024-07-02  155  		spin_unlock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  156  	}
ee4cdf7ba857a8 David Howells 2024-07-02  157  
ee4cdf7ba857a8 David Howells 2024-07-02  158  	avail = subreq->transferred;
ee4cdf7ba857a8 David Howells 2024-07-02  159  	if (avail == subreq->len)
ee4cdf7ba857a8 David Howells 2024-07-02  160  		avail += next_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  161  	start = subreq->start;
ee4cdf7ba857a8 David Howells 2024-07-02  162  	if (subreq->consumed == 0) {
ee4cdf7ba857a8 David Howells 2024-07-02  163  		start -= prev_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  164  		avail += prev_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  165  	} else {
ee4cdf7ba857a8 David Howells 2024-07-02  166  		start += subreq->consumed;
ee4cdf7ba857a8 David Howells 2024-07-02  167  		avail -= subreq->consumed;
ee4cdf7ba857a8 David Howells 2024-07-02  168  	}
ee4cdf7ba857a8 David Howells 2024-07-02  169  	part = umin(avail, fsize);
ee4cdf7ba857a8 David Howells 2024-07-02  170  
ee4cdf7ba857a8 David Howells 2024-07-02  171  	trace_netfs_progress(subreq, start, avail, part);
ee4cdf7ba857a8 David Howells 2024-07-02  172  
ee4cdf7ba857a8 David Howells 2024-07-02  173  	if (start + avail >= fend) {
ee4cdf7ba857a8 David Howells 2024-07-02  174  		if (fpos == start) {
ee4cdf7ba857a8 David Howells 2024-07-02  175  			/* Flush, unlock and mark for caching any folio we've just read. */
ee4cdf7ba857a8 David Howells 2024-07-02  176  			subreq->consumed = fend - subreq->start;
ee4cdf7ba857a8 David Howells 2024-07-02  177  			netfs_unlock_read_folio(subreq, rreq, folioq, slot);
ee4cdf7ba857a8 David Howells 2024-07-02  178  			folioq_mark2(folioq, slot);
ee4cdf7ba857a8 David Howells 2024-07-02  179  			if (subreq->consumed >= subreq->len)
ee4cdf7ba857a8 David Howells 2024-07-02  180  				goto remove_subreq;
ee4cdf7ba857a8 David Howells 2024-07-02  181  		} else if (fpos < start) {
ee4cdf7ba857a8 David Howells 2024-07-02  182  			excess = fend - subreq->start;
ee4cdf7ba857a8 David Howells 2024-07-02  183  
ee4cdf7ba857a8 David Howells 2024-07-02  184  			spin_lock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  185  			/* If we complete first on a folio split with the
ee4cdf7ba857a8 David Howells 2024-07-02  186  			 * preceding subreq, donate to that subreq - otherwise
ee4cdf7ba857a8 David Howells 2024-07-02  187  			 * we get the responsibility.
ee4cdf7ba857a8 David Howells 2024-07-02  188  			 */
ee4cdf7ba857a8 David Howells 2024-07-02  189  			if (subreq->prev_donated != prev_donated) {
ee4cdf7ba857a8 David Howells 2024-07-02  190  				spin_unlock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  191  				goto donation_changed;
ee4cdf7ba857a8 David Howells 2024-07-02  192  			}
ee4cdf7ba857a8 David Howells 2024-07-02  193  
ee4cdf7ba857a8 David Howells 2024-07-02  194  			if (list_is_first(&subreq->rreq_link, &rreq->subrequests)) {
ee4cdf7ba857a8 David Howells 2024-07-02  195  				spin_unlock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  196  				pr_err("Can't donate prior to front\n");
ee4cdf7ba857a8 David Howells 2024-07-02  197  				goto bad;
ee4cdf7ba857a8 David Howells 2024-07-02  198  			}
ee4cdf7ba857a8 David Howells 2024-07-02  199  
ee4cdf7ba857a8 David Howells 2024-07-02  200  			prev = list_prev_entry(subreq, rreq_link);
ee4cdf7ba857a8 David Howells 2024-07-02  201  			WRITE_ONCE(prev->next_donated, prev->next_donated + excess);
ee4cdf7ba857a8 David Howells 2024-07-02  202  			subreq->start += excess;
ee4cdf7ba857a8 David Howells 2024-07-02  203  			subreq->len -= excess;
ee4cdf7ba857a8 David Howells 2024-07-02  204  			subreq->transferred -= excess;
ee4cdf7ba857a8 David Howells 2024-07-02  205  			trace_netfs_donate(rreq, subreq, prev, excess,
ee4cdf7ba857a8 David Howells 2024-07-02  206  					   netfs_trace_donate_tail_to_prev);
ee4cdf7ba857a8 David Howells 2024-07-02  207  			trace_netfs_sreq(subreq, netfs_sreq_trace_donate_to_prev);
ee4cdf7ba857a8 David Howells 2024-07-02  208  
ee4cdf7ba857a8 David Howells 2024-07-02  209  			if (subreq->consumed >= subreq->len)
ee4cdf7ba857a8 David Howells 2024-07-02  210  				goto remove_subreq_locked;
ee4cdf7ba857a8 David Howells 2024-07-02  211  			spin_unlock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  212  		} else {
ee4cdf7ba857a8 David Howells 2024-07-02  213  			pr_err("fpos > start\n");
ee4cdf7ba857a8 David Howells 2024-07-02  214  			goto bad;
ee4cdf7ba857a8 David Howells 2024-07-02  215  		}
ee4cdf7ba857a8 David Howells 2024-07-02  216  
ee4cdf7ba857a8 David Howells 2024-07-02  217  		/* Advance the rolling buffer to the next folio. */
ee4cdf7ba857a8 David Howells 2024-07-02  218  		slot++;
ee4cdf7ba857a8 David Howells 2024-07-02  219  		if (slot >= folioq_nr_slots(folioq)) {
ee4cdf7ba857a8 David Howells 2024-07-02  220  			slot = 0;
ee4cdf7ba857a8 David Howells 2024-07-02  221  			folioq = folioq->next;
ee4cdf7ba857a8 David Howells 2024-07-02  222  			subreq->curr_folioq = folioq;
ee4cdf7ba857a8 David Howells 2024-07-02  223  		}
ee4cdf7ba857a8 David Howells 2024-07-02  224  		subreq->curr_folioq_slot = slot;
ee4cdf7ba857a8 David Howells 2024-07-02  225  		if (folioq && folioq_folio(folioq, slot))
ee4cdf7ba857a8 David Howells 2024-07-02  226  			subreq->curr_folio_order = folioq->orders[slot];
ee4cdf7ba857a8 David Howells 2024-07-02  227  		if (!was_async)
ee4cdf7ba857a8 David Howells 2024-07-02  228  			cond_resched();
ee4cdf7ba857a8 David Howells 2024-07-02  229  		goto next_folio;
ee4cdf7ba857a8 David Howells 2024-07-02  230  	}
ee4cdf7ba857a8 David Howells 2024-07-02  231  
ee4cdf7ba857a8 David Howells 2024-07-02  232  	/* Deal with partial progress. */
ee4cdf7ba857a8 David Howells 2024-07-02  233  	if (subreq->transferred < subreq->len)
ee4cdf7ba857a8 David Howells 2024-07-02  234  		return false;
ee4cdf7ba857a8 David Howells 2024-07-02  235  
ee4cdf7ba857a8 David Howells 2024-07-02  236  	/* Donate the remaining downloaded data to one of the neighbouring
ee4cdf7ba857a8 David Howells 2024-07-02  237  	 * subrequests.  Note that we may race with them doing the same thing.
ee4cdf7ba857a8 David Howells 2024-07-02  238  	 */
ee4cdf7ba857a8 David Howells 2024-07-02  239  	spin_lock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  240  
ee4cdf7ba857a8 David Howells 2024-07-02  241  	if (subreq->prev_donated != prev_donated ||
ee4cdf7ba857a8 David Howells 2024-07-02  242  	    subreq->next_donated != next_donated) {
ee4cdf7ba857a8 David Howells 2024-07-02  243  		spin_unlock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  244  		cond_resched();
ee4cdf7ba857a8 David Howells 2024-07-02  245  		goto donation_changed;
ee4cdf7ba857a8 David Howells 2024-07-02  246  	}
ee4cdf7ba857a8 David Howells 2024-07-02  247  
ee4cdf7ba857a8 David Howells 2024-07-02  248  	/* Deal with the trickiest case: that this subreq is in the middle of a
ee4cdf7ba857a8 David Howells 2024-07-02  249  	 * folio, not touching either edge, but finishes first.  In such a
c8b90d40d5bba8 David Howells 2024-12-13  250  	 * case, we donate to the previous subreq, if there is one and if it is
c8b90d40d5bba8 David Howells 2024-12-13  251  	 * contiguous, so that the donation is only handled when that completes
c8b90d40d5bba8 David Howells 2024-12-13  252  	 * - and remove this subreq from the list.
ee4cdf7ba857a8 David Howells 2024-07-02  253  	 *
ee4cdf7ba857a8 David Howells 2024-07-02  254  	 * If the previous subreq finished first, we will have acquired their
ee4cdf7ba857a8 David Howells 2024-07-02  255  	 * donation and should be able to unlock folios and/or donate nextwards.
ee4cdf7ba857a8 David Howells 2024-07-02  256  	 */
ee4cdf7ba857a8 David Howells 2024-07-02  257  	if (!subreq->consumed &&
ee4cdf7ba857a8 David Howells 2024-07-02  258  	    !prev_donated &&
c8b90d40d5bba8 David Howells 2024-12-13  259  	    !list_is_first(&subreq->rreq_link, &rreq->subrequests) &&
c8b90d40d5bba8 David Howells 2024-12-13 @260  	    subreq->start == prev->start + prev->len) {
ee4cdf7ba857a8 David Howells 2024-07-02  261  		prev = list_prev_entry(subreq, rreq_link);
ee4cdf7ba857a8 David Howells 2024-07-02  262  		WRITE_ONCE(prev->next_donated, prev->next_donated + subreq->len);
ee4cdf7ba857a8 David Howells 2024-07-02  263  		subreq->start += subreq->len;
ee4cdf7ba857a8 David Howells 2024-07-02  264  		subreq->len = 0;
ee4cdf7ba857a8 David Howells 2024-07-02  265  		subreq->transferred = 0;
ee4cdf7ba857a8 David Howells 2024-07-02  266  		trace_netfs_donate(rreq, subreq, prev, subreq->len,
ee4cdf7ba857a8 David Howells 2024-07-02  267  				   netfs_trace_donate_to_prev);
ee4cdf7ba857a8 David Howells 2024-07-02  268  		trace_netfs_sreq(subreq, netfs_sreq_trace_donate_to_prev);
ee4cdf7ba857a8 David Howells 2024-07-02  269  		goto remove_subreq_locked;
ee4cdf7ba857a8 David Howells 2024-07-02  270  	}
ee4cdf7ba857a8 David Howells 2024-07-02  271  
ee4cdf7ba857a8 David Howells 2024-07-02  272  	/* If we can't donate down the chain, donate up the chain instead. */
ee4cdf7ba857a8 David Howells 2024-07-02  273  	excess = subreq->len - subreq->consumed + next_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  274  
ee4cdf7ba857a8 David Howells 2024-07-02  275  	if (!subreq->consumed)
ee4cdf7ba857a8 David Howells 2024-07-02  276  		excess += prev_donated;
ee4cdf7ba857a8 David Howells 2024-07-02  277  
ee4cdf7ba857a8 David Howells 2024-07-02  278  	if (list_is_last(&subreq->rreq_link, &rreq->subrequests)) {
ee4cdf7ba857a8 David Howells 2024-07-02  279  		rreq->prev_donated = excess;
ee4cdf7ba857a8 David Howells 2024-07-02  280  		trace_netfs_donate(rreq, subreq, NULL, excess,
ee4cdf7ba857a8 David Howells 2024-07-02  281  				   netfs_trace_donate_to_deferred_next);
ee4cdf7ba857a8 David Howells 2024-07-02  282  	} else {
ee4cdf7ba857a8 David Howells 2024-07-02  283  		next = list_next_entry(subreq, rreq_link);
ee4cdf7ba857a8 David Howells 2024-07-02  284  		WRITE_ONCE(next->prev_donated, excess);
ee4cdf7ba857a8 David Howells 2024-07-02  285  		trace_netfs_donate(rreq, subreq, next, excess,
ee4cdf7ba857a8 David Howells 2024-07-02  286  				   netfs_trace_donate_to_next);
ee4cdf7ba857a8 David Howells 2024-07-02  287  	}
ee4cdf7ba857a8 David Howells 2024-07-02  288  	trace_netfs_sreq(subreq, netfs_sreq_trace_donate_to_next);
ee4cdf7ba857a8 David Howells 2024-07-02  289  	subreq->len = subreq->consumed;
ee4cdf7ba857a8 David Howells 2024-07-02  290  	subreq->transferred = subreq->consumed;
ee4cdf7ba857a8 David Howells 2024-07-02  291  	goto remove_subreq_locked;
ee4cdf7ba857a8 David Howells 2024-07-02  292  
ee4cdf7ba857a8 David Howells 2024-07-02  293  remove_subreq:
ee4cdf7ba857a8 David Howells 2024-07-02  294  	spin_lock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  295  remove_subreq_locked:
ee4cdf7ba857a8 David Howells 2024-07-02  296  	subreq->consumed = subreq->len;
ee4cdf7ba857a8 David Howells 2024-07-02  297  	list_del(&subreq->rreq_link);
ee4cdf7ba857a8 David Howells 2024-07-02  298  	spin_unlock_bh(&rreq->lock);
ee4cdf7ba857a8 David Howells 2024-07-02  299  	netfs_put_subrequest(subreq, false, netfs_sreq_trace_put_consumed);
ee4cdf7ba857a8 David Howells 2024-07-02  300  	return true;
ee4cdf7ba857a8 David Howells 2024-07-02  301  
ee4cdf7ba857a8 David Howells 2024-07-02  302  bad:
ee4cdf7ba857a8 David Howells 2024-07-02  303  	/* Errr... prev and next both donated to us, but insufficient to finish
ee4cdf7ba857a8 David Howells 2024-07-02  304  	 * the folio.
ee4cdf7ba857a8 David Howells 2024-07-02  305  	 */
ee4cdf7ba857a8 David Howells 2024-07-02  306  	printk("R=%08x[%x] s=%llx-%llx %zx/%zx/%zx\n",
ee4cdf7ba857a8 David Howells 2024-07-02  307  	       rreq->debug_id, subreq->debug_index,
ee4cdf7ba857a8 David Howells 2024-07-02  308  	       subreq->start, subreq->start + subreq->transferred - 1,
ee4cdf7ba857a8 David Howells 2024-07-02  309  	       subreq->consumed, subreq->transferred, subreq->len);
ee4cdf7ba857a8 David Howells 2024-07-02  310  	printk("folio: %llx-%llx\n", fpos, fend - 1);
ee4cdf7ba857a8 David Howells 2024-07-02  311  	printk("donated: prev=%zx next=%zx\n", prev_donated, next_donated);
ee4cdf7ba857a8 David Howells 2024-07-02  312  	printk("s=%llx av=%zx part=%zx\n", start, avail, part);
ee4cdf7ba857a8 David Howells 2024-07-02  313  	BUG();
ee4cdf7ba857a8 David Howells 2024-07-02  314  }
ee4cdf7ba857a8 David Howells 2024-07-02  315  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
