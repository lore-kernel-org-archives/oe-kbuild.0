Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E762D2561A7
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Mar 2026 06:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772345570; cv=none; b=R1lP76t6GqVojVVlwExTYn2/OXcV0nfWEFmEJYNw7S5WeRBtmdGcTCdF8j8BImJWCnoxUetlcEvQxjO2UFe8fhPwQQMELlNPeh/p2Ppg165d+uQPL+pjXMCpcZ7ISWI/l2y80kQIDm6rQpUV7/ntb20y+3ZrMhb1lZ2uQXseths=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772345570; c=relaxed/simple;
	bh=ChsNbad5qtlib+xKJg0YZI5x1/XGt5jbOg6fNBpm6Qo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YL1cKiHM2Y9N+tcWQv+KzkdfJFdkeCqwbU3JAs80SKDoZ7jYZGYnykrnYHsQ8bAuYoU5sLXYWl5aG3pceyI6K7djfk9CVesBMqJACy6Zggswu62vP4yJBOB+YVYnnP5vF4bw6+h+ddDTOCDs9R8qnIBYrXMRVtFD9jPFchHGxNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gU9NeSXp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gU9NeSXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772345568; x=1803881568;
  h=date:from:to:cc:subject:message-id;
  bh=ChsNbad5qtlib+xKJg0YZI5x1/XGt5jbOg6fNBpm6Qo=;
  b=gU9NeSXpWtEGkK2YC54D5krAmcumxnZJN5dKUW6KznUjzPDKk5rvgpfP
   biYoBhgRR3En0XUQXfnHs8MA0W6AYb4BAlmO80Fv0P5cKzs11WI6IK5Ap
   xWttPUwrb6/W8FXuAzWwOQgVe3GIEjCnnKbE/uz9U7P5wdN/gYtfX/mrK
   O337+ICDDxadm9Vre6t64UR2RA9kf2b2qXIlyHZ6OQTrIW757PbqRb06T
   j0CJ2tZNgEADf2yutHEXEgzpsgN7egr7bPUk2G4W7nGgq3dUkWKJxN+Dt
   01tau9xUJWMQ5O+yqQajVyHEzVbbLEdNurR9t3+lVOnXW8dA5Iuks/PRu
   Q==;
X-CSE-ConnectionGUID: UH6AmBHmQlyC0Aemu5KvBw==
X-CSE-MsgGUID: zD26MLfvSNGfv8Rgbp9PyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="73291549"
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="73291549"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 22:12:48 -0800
X-CSE-ConnectionGUID: DZyOpJrPTPO1z2yP3N0jyA==
X-CSE-MsgGUID: NU/kn1umTPaCEKR5y72F2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="217211998"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Feb 2026 22:12:46 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwa2l-000000001JF-2Gvl;
	Sun, 01 Mar 2026 06:12:43 +0000
Date: Sun, 01 Mar 2026 14:12:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [dhowells-fs:netfs-next 10/16]
 fs/netfs/write_issue.c:845:1-7: preceding lock on line 787
Message-ID: <202603011433.w3pcwktP-lkp@intel.com>
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
head:   64a2722c2705a6c6f46b7214477a4a0a2106c1b6
commit: a1cee75a302b7af9ddd2449d38863fb935066e80 [10/16] netfs: Switch to using bvecq rather than folio_queue and rolling_buffer
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: openrisc-randconfig-r062-20260301 (https://download.01.org/0day-ci/archive/20260301/202603011433.w3pcwktP-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603011433.w3pcwktP-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/netfs/write_issue.c:845:1-7: preceding lock on line 787

vim +845 fs/netfs/write_issue.c

288ace2f57c9d06 David Howells 2024-03-18  763  
49866ce7ea8d41a David Howells 2024-12-16  764  /**
49866ce7ea8d41a David Howells 2024-12-16  765   * netfs_writeback_single - Write back a monolithic payload
49866ce7ea8d41a David Howells 2024-12-16  766   * @mapping: The mapping to write from
49866ce7ea8d41a David Howells 2024-12-16  767   * @wbc: Hints from the VM
4e45977f1ea9ab4 David Howells 2026-01-07  768   * @iter: Data to write.
49866ce7ea8d41a David Howells 2024-12-16  769   *
49866ce7ea8d41a David Howells 2024-12-16  770   * Write a monolithic, non-pagecache object back to the server and/or
a1cee75a302b7af David Howells 2026-02-28  771   * the cache.  There's a maximum of one subrequest per stream.
49866ce7ea8d41a David Howells 2024-12-16  772   */
49866ce7ea8d41a David Howells 2024-12-16  773  int netfs_writeback_single(struct address_space *mapping,
49866ce7ea8d41a David Howells 2024-12-16  774  			   struct writeback_control *wbc,
49866ce7ea8d41a David Howells 2024-12-16  775  			   struct iov_iter *iter)
49866ce7ea8d41a David Howells 2024-12-16  776  {
49866ce7ea8d41a David Howells 2024-12-16  777  	struct netfs_io_request *wreq;
49866ce7ea8d41a David Howells 2024-12-16  778  	struct netfs_inode *ictx = netfs_inode(mapping->host);
49866ce7ea8d41a David Howells 2024-12-16  779  	int ret;
49866ce7ea8d41a David Howells 2024-12-16  780  
49866ce7ea8d41a David Howells 2024-12-16  781  	if (!mutex_trylock(&ictx->wb_lock)) {
49866ce7ea8d41a David Howells 2024-12-16  782  		if (wbc->sync_mode == WB_SYNC_NONE) {
49866ce7ea8d41a David Howells 2024-12-16  783  			netfs_stat(&netfs_n_wb_lock_skip);
49866ce7ea8d41a David Howells 2024-12-16  784  			return 0;
49866ce7ea8d41a David Howells 2024-12-16  785  		}
49866ce7ea8d41a David Howells 2024-12-16  786  		netfs_stat(&netfs_n_wb_lock_wait);
49866ce7ea8d41a David Howells 2024-12-16 @787  		mutex_lock(&ictx->wb_lock);
49866ce7ea8d41a David Howells 2024-12-16  788  	}
49866ce7ea8d41a David Howells 2024-12-16  789  
49866ce7ea8d41a David Howells 2024-12-16  790  	wreq = netfs_create_write_req(mapping, NULL, 0, NETFS_WRITEBACK_SINGLE);
49866ce7ea8d41a David Howells 2024-12-16  791  	if (IS_ERR(wreq)) {
49866ce7ea8d41a David Howells 2024-12-16  792  		ret = PTR_ERR(wreq);
49866ce7ea8d41a David Howells 2024-12-16  793  		goto couldnt_start;
49866ce7ea8d41a David Howells 2024-12-16  794  	}
4e45977f1ea9ab4 David Howells 2026-01-07  795  	wreq->len = iov_iter_count(iter);
4e45977f1ea9ab4 David Howells 2026-01-07  796  
a1cee75a302b7af David Howells 2026-02-28  797  	ret = netfs_extract_iter(iter, wreq->len, INT_MAX, 0, &wreq->dispatch_cursor.bvecq, 0);
a1cee75a302b7af David Howells 2026-02-28  798  	if (ret < 0)
a1cee75a302b7af David Howells 2026-02-28  799  		goto cleanup_free;
a1cee75a302b7af David Howells 2026-02-28  800  	if (ret < wreq->len) {
a1cee75a302b7af David Howells 2026-02-28  801  		ret = -EIO;
a1cee75a302b7af David Howells 2026-02-28  802  		goto cleanup_free;
a1cee75a302b7af David Howells 2026-02-28  803  	}
a1cee75a302b7af David Howells 2026-02-28  804  
a1cee75a302b7af David Howells 2026-02-28  805  	bvecq_pos_attach(&wreq->collect_cursor, &wreq->dispatch_cursor);
a1cee75a302b7af David Howells 2026-02-28  806  
2b1424cd131cfab David Howells 2025-05-19  807  	__set_bit(NETFS_RREQ_OFFLOAD_COLLECTION, &wreq->flags);
20d72b00ca814d7 David Howells 2025-05-19  808  	trace_netfs_write(wreq, netfs_write_trace_writeback_single);
49866ce7ea8d41a David Howells 2024-12-16  809  	netfs_stat(&netfs_n_wh_writepages);
49866ce7ea8d41a David Howells 2024-12-16  810  
49866ce7ea8d41a David Howells 2024-12-16  811  	if (__test_and_set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags))
49866ce7ea8d41a David Howells 2024-12-16  812  		wreq->netfs_ops->begin_writeback(wreq);
49866ce7ea8d41a David Howells 2024-12-16  813  
4e45977f1ea9ab4 David Howells 2026-01-07  814  	for (int s = 0; s < NR_IO_STREAMS; s++) {
4e45977f1ea9ab4 David Howells 2026-01-07  815  		struct netfs_io_subrequest *subreq;
4e45977f1ea9ab4 David Howells 2026-01-07  816  		struct netfs_io_stream *stream = &wreq->io_streams[s];
49866ce7ea8d41a David Howells 2024-12-16  817  
4e45977f1ea9ab4 David Howells 2026-01-07  818  		if (!stream->avail)
4e45977f1ea9ab4 David Howells 2026-01-07  819  			continue;
49866ce7ea8d41a David Howells 2024-12-16  820  
4e45977f1ea9ab4 David Howells 2026-01-07  821  		netfs_prepare_write(wreq, stream, 0);
4e45977f1ea9ab4 David Howells 2026-01-07  822  
4e45977f1ea9ab4 David Howells 2026-01-07  823  		subreq = stream->construct;
4e45977f1ea9ab4 David Howells 2026-01-07  824  		subreq->len = wreq->len;
4e45977f1ea9ab4 David Howells 2026-01-07  825  		stream->submit_len = subreq->len;
4e45977f1ea9ab4 David Howells 2026-01-07  826  
4e45977f1ea9ab4 David Howells 2026-01-07  827  		netfs_issue_write(wreq, stream);
49866ce7ea8d41a David Howells 2024-12-16  828  	}
49866ce7ea8d41a David Howells 2024-12-16  829  
a1cee75a302b7af David Howells 2026-02-28  830  	wreq->submitted = wreq->len;
49866ce7ea8d41a David Howells 2024-12-16  831  	smp_wmb(); /* Write lists before ALL_QUEUED. */
49866ce7ea8d41a David Howells 2024-12-16  832  	set_bit(NETFS_RREQ_ALL_QUEUED, &wreq->flags);
49866ce7ea8d41a David Howells 2024-12-16  833  
49866ce7ea8d41a David Howells 2024-12-16  834  	mutex_unlock(&ictx->wb_lock);
2b1424cd131cfab David Howells 2025-05-19  835  	netfs_wake_collector(wreq);
49866ce7ea8d41a David Howells 2024-12-16  836  
4e45977f1ea9ab4 David Howells 2026-01-07  837  	/* TODO: Might want to be async here if WB_SYNC_NONE, but then need to
4e45977f1ea9ab4 David Howells 2026-01-07  838  	 * wait before modifying.
4e45977f1ea9ab4 David Howells 2026-01-07  839  	 */
4e45977f1ea9ab4 David Howells 2026-01-07  840  	ret = netfs_wait_for_write(wreq);
4e45977f1ea9ab4 David Howells 2026-01-07  841  
a1cee75a302b7af David Howells 2026-02-28  842  cleanup_free:
20d72b00ca814d7 David Howells 2025-05-19  843  	netfs_put_request(wreq, netfs_rreq_trace_put_return);
49866ce7ea8d41a David Howells 2024-12-16  844  	_leave(" = %d", ret);
49866ce7ea8d41a David Howells 2024-12-16 @845  	return ret;

:::::: The code at line 845 was first introduced by commit
:::::: 49866ce7ea8d41a3dc198f519cc9caa2d6be1891 netfs: Add support for caching single monolithic objects such as AFS dirs

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
