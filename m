Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E627286D70
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 22:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768256965; cv=none; b=irWbF567bXw7I6hAI30QbjyP5EjTbSRjFW94OnDkfQXs1zcig7fWiZHQjh9aOLg9P5+y4Pt8juThEHcpGld3eCZ9MGKt2TMEVYHu1pmKDQWjOC7OrUxc6ORO5RvGHMozndT/QWrDwYhZnZUFsQtqJaddYQMY2zVelgZjSl/YD48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768256965; c=relaxed/simple;
	bh=chdvisEsXTkpmzs2MdKkn03jVB25xtJS/tZTZtxrGwo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cWY/zH0F8D9Al5R38ExTJ28q9BBysxHvjbjVxLIKbdrNty+ruGVQrU2A/jz8McemNx7c6pdogwij4Jz2Rn6gksOhwLWiGwDIYepKX35MFL1JKfbyhlbSa5oL8yy3/lE9YghjirJbQnHDWAe8GTmvys+o2cbzjFdiDvA19Fc+YyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qom7QLLg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qom7QLLg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768256964; x=1799792964;
  h=date:from:to:cc:subject:message-id;
  bh=chdvisEsXTkpmzs2MdKkn03jVB25xtJS/tZTZtxrGwo=;
  b=Qom7QLLgmv83RGnKuOkkxi+JcyqqQIP5XC9YZdKbgvCPS2QiiSa+thOk
   q+lu0mHDxKz7TRGBMGgLnS2OQcTznlJYxuUkSoVd+HFyp4sFiAF++H66a
   +OtLfEZTP3/ChjCuzEoLXTsilrNhqOF9FVQEFg1ivHoAD5kPkcU+trjQu
   1RJfo/YHx/EyemfnlXEijZEhJN8+BPrX+sxGmy5owUbFerl2heAy0bflz
   pyGjTJbgSXz0Ec19FZIYeMvOTvVEY6Qsy5WWtLPdEE22z5yqfTAKm6XOo
   +PSwIRUCdNScHdefyvS1nQquPpSsJNjsGUUZcAD1J6ktAVsAx0YcgLF4a
   A==;
X-CSE-ConnectionGUID: LUtx55aLQGyXY2/mfvD2sQ==
X-CSE-MsgGUID: pEstBRpBRyGbKdT6b3dQYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="72121099"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="72121099"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 14:29:22 -0800
X-CSE-ConnectionGUID: BHGoOLLeQbakSV0aNSc6vQ==
X-CSE-MsgGUID: kLpJxelLTzq4Cb8wQC9Eaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204865581"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jan 2026 14:29:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfQPW-00000000DwS-22Xp;
	Mon, 12 Jan 2026 22:29:18 +0000
Date: Tue, 13 Jan 2026 06:28:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:netfs-next 15/17] fs/netfs/rxqueue.c:383
 netfs_rxqueue_decant() error: uninitialized symbol 'pbq'.
Message-ID: <202601130644.aT4ngBqZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   8dc07632381d372883f12b9ca6da7438ce683a33
commit: 8a18d8ea965502452510e9bd13addd1058370329 [15/17] netfs: Add some TCP receive queue helpers
:::::: branch date: 8 hours ago
:::::: commit date: 5 days ago
config: powerpc-randconfig-r073-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130644.aT4ngBqZ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130644.aT4ngBqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601130644.aT4ngBqZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: fs/netfs/tcp_splice.o: in function `linear_to_page':
>> fs/netfs/tcp_splice.c:22:(.text.bvecq_splice_segment+0x120): undefined reference to `sk_page_frag_refill'
   powerpc-linux-ld: fs/netfs/tcp_splice.o: in function `lock_sock':
>> include/net/sock.h:1700:(.text.netfs_tcp_splice_to_bvecq+0x9c): undefined reference to `lock_sock_nested'
   powerpc-linux-ld: fs/netfs/tcp_splice.o: in function `netfs_tcp_splice_to_bvecq':
>> fs/netfs/tcp_splice.c:210:(.text.netfs_tcp_splice_to_bvecq+0xf0): undefined reference to `tcp_read_sock'
>> powerpc-linux-ld: fs/netfs/tcp_splice.c:242:(.text.netfs_tcp_splice_to_bvecq+0x1e4): undefined reference to `sk_wait_data'
>> powerpc-linux-ld: fs/netfs/tcp_splice.c:256:(.text.netfs_tcp_splice_to_bvecq+0x274): undefined reference to `release_sock'
   powerpc-linux-ld: fs/netfs/tcp_splice.o: in function `lock_sock':
   include/net/sock.h:1700:(.text.netfs_tcp_splice_to_bvecq+0x280): undefined reference to `lock_sock_nested'
   powerpc-linux-ld: fs/netfs/tcp_splice.o: in function `netfs_tcp_splice_to_bvecq':
>> fs/netfs/tcp_splice.c:265:(.text.netfs_tcp_splice_to_bvecq+0x2e8): undefined reference to `release_sock'

smatch warnings:
fs/netfs/rxqueue.c:383 netfs_rxqueue_decant() error: uninitialized symbol 'pbq'.

vim +/pbq +383 fs/netfs/rxqueue.c

8a18d8ea965502 David Howells 2025-10-20  343  
8a18d8ea965502 David Howells 2025-10-20  344  /**
8a18d8ea965502 David Howells 2025-10-20  345   * netfs_rxqueue_decant - Decant data segs to a private queue
8a18d8ea965502 David Howells 2025-10-20  346   * @rxq: The receive queue to decant from
8a18d8ea965502 David Howells 2025-10-20  347   * @amount: The amount of data received
8a18d8ea965502 David Howells 2025-10-20  348   *
8a18d8ea965502 David Howells 2025-10-20  349   * Decant data from the receive queue to a private queue.  This prevents the
8a18d8ea965502 David Howells 2025-10-20  350   * receive queue keeping the buffers pinned.
8a18d8ea965502 David Howells 2025-10-20  351   *
8a18d8ea965502 David Howells 2025-10-20  352   * Return: A bvecq chain, with ref, holding the decanted data or NULL if out of
8a18d8ea965502 David Howells 2025-10-20  353   * memory.
8a18d8ea965502 David Howells 2025-10-20  354   */
8a18d8ea965502 David Howells 2025-10-20  355  struct bvecq *netfs_rxqueue_decant(struct netfs_rxqueue *rxq, size_t amount)
8a18d8ea965502 David Howells 2025-10-20  356  {
8a18d8ea965502 David Howells 2025-10-20  357  	struct bvecq *head_bq = NULL, *pbq, *destq;
8a18d8ea965502 David Howells 2025-10-20  358  	struct bvecq *from = rxq->take_from;
8a18d8ea965502 David Howells 2025-10-20  359  	unsigned int need_segs;
8a18d8ea965502 David Howells 2025-10-20  360  	unsigned int offset = rxq->take_offset;
8a18d8ea965502 David Howells 2025-10-20  361  	unsigned int slot = rxq->take_slot;
8a18d8ea965502 David Howells 2025-10-20  362  	size_t qsize = rxq->qsize;
8a18d8ea965502 David Howells 2025-10-20  363  
8a18d8ea965502 David Howells 2025-10-20  364  	if (amount > rxq->pdu_remain) {
8a18d8ea965502 David Howells 2025-10-20  365  		pr_warn("Rx over decant %zx > %x\n",
8a18d8ea965502 David Howells 2025-10-20  366  			amount, rxq->pdu_remain);
8a18d8ea965502 David Howells 2025-10-20  367  		amount = rxq->pdu_remain;
8a18d8ea965502 David Howells 2025-10-20  368  	}
8a18d8ea965502 David Howells 2025-10-20  369  
8a18d8ea965502 David Howells 2025-10-20  370  	/* Count the number of segments in the queue for this PDU and then
8a18d8ea965502 David Howells 2025-10-20  371  	 * allocate sufficient bvecq capacity to hold the whole PDU.
8a18d8ea965502 David Howells 2025-10-20  372  	 */
8a18d8ea965502 David Howells 2025-10-20  373  	need_segs = netfs_rxqueue_count(rxq, amount);
8a18d8ea965502 David Howells 2025-10-20  374  	while (need_segs > 0) {
8a18d8ea965502 David Howells 2025-10-20  375  		struct bvecq *b;
8a18d8ea965502 David Howells 2025-10-20  376  		unsigned int max_bv = (PAGE_SIZE - sizeof(*b)) / sizeof(b->bv[0]);
8a18d8ea965502 David Howells 2025-10-20  377  		unsigned int nr_bv = umin(need_segs, max_bv);
8a18d8ea965502 David Howells 2025-10-20  378  
8a18d8ea965502 David Howells 2025-10-20  379  		need_segs -= nr_bv;
8a18d8ea965502 David Howells 2025-10-20  380  		b = netfs_alloc_rx_bvecq(nr_bv);
8a18d8ea965502 David Howells 2025-10-20  381  		if (!b)
8a18d8ea965502 David Howells 2025-10-20  382  			goto nomem;
8a18d8ea965502 David Howells 2025-10-20 @383  		b->prev = pbq;
8a18d8ea965502 David Howells 2025-10-20  384  		if (head_bq)
8a18d8ea965502 David Howells 2025-10-20  385  			pbq->next = b;
8a18d8ea965502 David Howells 2025-10-20  386  		else
8a18d8ea965502 David Howells 2025-10-20  387  			head_bq = b;
8a18d8ea965502 David Howells 2025-10-20  388  		pbq = b;
8a18d8ea965502 David Howells 2025-10-20  389  	}
8a18d8ea965502 David Howells 2025-10-20  390  
8a18d8ea965502 David Howells 2025-10-20  391  	rxq->pdu_remain -= amount;
8a18d8ea965502 David Howells 2025-10-20  392  	destq = head_bq;
8a18d8ea965502 David Howells 2025-10-20  393  	for (;;) {
8a18d8ea965502 David Howells 2025-10-20  394  		if (slot >= from->nr_segs) {
8a18d8ea965502 David Howells 2025-10-20  395  			struct bvecq *dead;
8a18d8ea965502 David Howells 2025-10-20  396  
8a18d8ea965502 David Howells 2025-10-20  397  			slot = 0;
8a18d8ea965502 David Howells 2025-10-20  398  			offset = 0;
8a18d8ea965502 David Howells 2025-10-20  399  			if (!from->next) {
8a18d8ea965502 David Howells 2025-10-20  400  				/* Refurbish the final bvecq. */
8a18d8ea965502 David Howells 2025-10-20  401  				WARN_ON_ONCE(from != rxq->add_to);
8a18d8ea965502 David Howells 2025-10-20  402  				from->nr_segs = 0;
8a18d8ea965502 David Howells 2025-10-20  403  				rxq->add_to = from;
8a18d8ea965502 David Howells 2025-10-20  404  				break;
8a18d8ea965502 David Howells 2025-10-20  405  			}
8a18d8ea965502 David Howells 2025-10-20  406  			dead = from;
8a18d8ea965502 David Howells 2025-10-20  407  			from = dead->next;
8a18d8ea965502 David Howells 2025-10-20  408  			from->prev = NULL;
8a18d8ea965502 David Howells 2025-10-20  409  			dead->next = NULL;
8a18d8ea965502 David Howells 2025-10-20  410  			netfs_put_rx_bvecq(dead);
8a18d8ea965502 David Howells 2025-10-20  411  		}
8a18d8ea965502 David Howells 2025-10-20  412  
8a18d8ea965502 David Howells 2025-10-20  413  		if (!amount)
8a18d8ea965502 David Howells 2025-10-20  414  			break;
8a18d8ea965502 David Howells 2025-10-20  415  
8a18d8ea965502 David Howells 2025-10-20  416  		struct bio_vec *bv = &from->bv[slot];
8a18d8ea965502 David Howells 2025-10-20  417  
8a18d8ea965502 David Howells 2025-10-20  418  		if (offset < bv->bv_len) {
8a18d8ea965502 David Howells 2025-10-20  419  			size_t part = umin(umin(bv->bv_len - offset, amount), qsize);
8a18d8ea965502 David Howells 2025-10-20  420  			netfs_bvecq_append_seg(&destq, bv, offset, part);
8a18d8ea965502 David Howells 2025-10-20  421  			offset += part;
8a18d8ea965502 David Howells 2025-10-20  422  			amount -= part;
8a18d8ea965502 David Howells 2025-10-20  423  			qsize -= part;
8a18d8ea965502 David Howells 2025-10-20  424  			if (offset < bv->bv_len)
8a18d8ea965502 David Howells 2025-10-20  425  				break;
8a18d8ea965502 David Howells 2025-10-20  426  		}
8a18d8ea965502 David Howells 2025-10-20  427  
8a18d8ea965502 David Howells 2025-10-20  428  		if (WARN_ON_ONCE(bv->bv_page)) {
8a18d8ea965502 David Howells 2025-10-20  429  			netfs_put_rx_page(bv);
8a18d8ea965502 David Howells 2025-10-20  430  			bv->bv_page = NULL;
8a18d8ea965502 David Howells 2025-10-20  431  			bv->bv_offset = 0;
8a18d8ea965502 David Howells 2025-10-20  432  			bv->bv_len = 0;
8a18d8ea965502 David Howells 2025-10-20  433  		}
8a18d8ea965502 David Howells 2025-10-20  434  		slot++;
8a18d8ea965502 David Howells 2025-10-20  435  		offset = 0;
8a18d8ea965502 David Howells 2025-10-20  436  	}
8a18d8ea965502 David Howells 2025-10-20  437  
8a18d8ea965502 David Howells 2025-10-20  438  	rxq->take_from = from;
8a18d8ea965502 David Howells 2025-10-20  439  	rxq->take_slot = slot;
8a18d8ea965502 David Howells 2025-10-20  440  	rxq->take_offset = offset;
8a18d8ea965502 David Howells 2025-10-20  441  	rxq->qsize = qsize;
8a18d8ea965502 David Howells 2025-10-20  442  	return head_bq;
8a18d8ea965502 David Howells 2025-10-20  443  
8a18d8ea965502 David Howells 2025-10-20  444  nomem:
8a18d8ea965502 David Howells 2025-10-20  445  	netfs_put_rx_bvecq(head_bq);
8a18d8ea965502 David Howells 2025-10-20  446  	return NULL;
8a18d8ea965502 David Howells 2025-10-20  447  }
8a18d8ea965502 David Howells 2025-10-20  448  EXPORT_SYMBOL(netfs_rxqueue_decant);
8a18d8ea965502 David Howells 2025-10-20  449  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
