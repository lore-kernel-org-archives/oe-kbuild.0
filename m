Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0218213CA92
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Jun 2024 17:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718730733; cv=none; b=pLG3TIy2TDiT7o4QplYUfcrP/VjAnqRK1Zuqk4DrjP2xv5ueAdR5QonNGbmViBsRtbdBxJGgkPjzFjlITPwc1/K7wpoH8zK1eaXL+n/5cx8R9HHw3v3vkLpO0zVR/bu7iuwE2L/yiEmWKtuKSBsciQ6s+ZzA2RfCN6f+Tg3m1r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718730733; c=relaxed/simple;
	bh=YHk+6mQp6vWmgBMeg9V3iwVGPp6713gEvxGOvsX+v5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KfU7XAWWbFUJXgyRmGOsR0el4ZdJFoKYe9hd7JLyttrUei802+YtB3D3JGkJmbpEGRy+z/RT6o0/hF5E1bgeo38du6Hghd/9G9u6Ch333zkZ2aInLxYlj0YyKdr4rX1M2bNcq86+8LrZbgTtL9gIoKEhifYrXgI+82nU/y7qdkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FABaJkuQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FABaJkuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718730731; x=1750266731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YHk+6mQp6vWmgBMeg9V3iwVGPp6713gEvxGOvsX+v5k=;
  b=FABaJkuQ/tZvxxzwy7yN7WrsROXSZrRbfUUc12YTUkWmxpZeyxSuZPoq
   /ELkT7PHyf1evUBhTK+r0WsGXRamJAySvuOivLC/2UprSEKWEaSR4nyb5
   +Vfr5LUH45mIOPx5zWmYnlrG+T3t/Zxga4/rDB2xE4fF1SQdHUJIDsDPy
   bncOkMflR0lSSH0D4MAbDGkz8jg8YfOvMvy+olG3sZBBapb6FugimJTRq
   LHnEwaFXG8D6nbyIMrPqG4DG0qoBo19b1ODcB2jq21d32gDSH8UHhkPkI
   y27rbzXso0OEmztru2nDQprNNoEl7uZ2p32kZyBjxBbvwYDA3s1BHSPJC
   g==;
X-CSE-ConnectionGUID: /tIYttK6RCmMaWEoDH8K1g==
X-CSE-MsgGUID: D8z1cAZMR0WSiGEJ9BOR3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27045219"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="27045219"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 10:12:11 -0700
X-CSE-ConnectionGUID: pvE3LGl4RYKj15xvCOhhBw==
X-CSE-MsgGUID: NezI5wp4R3+/b5xSxWZ4aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="64866733"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jun 2024 10:12:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJcNL-0005ks-0U;
	Tue, 18 Jun 2024 17:12:07 +0000
Date: Wed, 19 Jun 2024 01:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-misc:nfs-buffered-write-cleanups 8/8] fs/nfs/write.c:569
 nfs_lock_and_join_requests() error: uninitialized symbol 'subreq'.
Message-ID: <202406190139.SC6Lhg4h-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git nfs-buffered-write-cleanups
head:   724a9166a85d96c9fa6377fe9c042b72da816c90
commit: 724a9166a85d96c9fa6377fe9c042b72da816c90 [8/8] nfs: don't reuse partially completed requests in nfs_lock_and_join_requests
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240618 (https://download.01.org/0day-ci/archive/20240619/202406190139.SC6Lhg4h-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406190139.SC6Lhg4h-lkp@intel.com/

New smatch warnings:
fs/nfs/write.c:569 nfs_lock_and_join_requests() error: uninitialized symbol 'subreq'.

Old smatch warnings:
fs/nfs/write.c:791 nfs_inode_remove_request() warn: variable dereferenced before check 'folio' (see line 788)

vim +/subreq +569 fs/nfs/write.c

7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  519  
e00ed89d7bd59c Trond Myklebust       2020-03-30  520  /*
e00ed89d7bd59c Trond Myklebust       2020-03-30  521   * nfs_lock_and_join_requests - join all subreqs to the head req
0c493b5cf16e28 Trond Myklebust       2023-01-19  522   * @folio: the folio used to lookup the "page group" of nfs_page structures
e00ed89d7bd59c Trond Myklebust       2020-03-30  523   *
e00ed89d7bd59c Trond Myklebust       2020-03-30  524   * This function joins all sub requests to the head request by first
e00ed89d7bd59c Trond Myklebust       2020-03-30  525   * locking all requests in the group, cancelling any pending operations
e00ed89d7bd59c Trond Myklebust       2020-03-30  526   * and finally updating the head request to cover the whole range covered by
e00ed89d7bd59c Trond Myklebust       2020-03-30  527   * the (former) group.  All subrequests are removed from any write or commit
e00ed89d7bd59c Trond Myklebust       2020-03-30  528   * lists, unlinked from the group and destroyed.
e00ed89d7bd59c Trond Myklebust       2020-03-30  529   *
e00ed89d7bd59c Trond Myklebust       2020-03-30  530   * Returns a locked, referenced pointer to the head request - which after
e00ed89d7bd59c Trond Myklebust       2020-03-30  531   * this call is guaranteed to be the only request associated with the page.
0c493b5cf16e28 Trond Myklebust       2023-01-19  532   * Returns NULL if no requests are found for @folio, or a ERR_PTR if an
e00ed89d7bd59c Trond Myklebust       2020-03-30  533   * error was encountered.
e00ed89d7bd59c Trond Myklebust       2020-03-30  534   */
0c493b5cf16e28 Trond Myklebust       2023-01-19  535  static struct nfs_page *nfs_lock_and_join_requests(struct folio *folio)
e00ed89d7bd59c Trond Myklebust       2020-03-30  536  {
15b8fdc56a662f Christoph Hellwig     2024-06-14  537  	struct inode *inode = folio->mapping->host;
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  538  	struct nfs_page *head, *subreq;
b193a78ddb5ee7 Trond Myklebust       2023-09-04  539  	struct nfs_commit_info cinfo;
724a9166a85d96 Christoph Hellwig     2024-06-16  540  	bool removed;
e00ed89d7bd59c Trond Myklebust       2020-03-30  541  	int ret;
d458138353726e Weston Andros Adamson 2014-07-11  542  
e00ed89d7bd59c Trond Myklebust       2020-03-30  543  	/*
e00ed89d7bd59c Trond Myklebust       2020-03-30  544  	 * A reference is taken only on the head request which acts as a
e00ed89d7bd59c Trond Myklebust       2020-03-30  545  	 * reference to the whole page group - the group will not be destroyed
e00ed89d7bd59c Trond Myklebust       2020-03-30  546  	 * until the head reference is released.
e00ed89d7bd59c Trond Myklebust       2020-03-30  547  	 */
fe5ab688ce8408 Christoph Hellwig     2024-06-16  548  retry:
fe5ab688ce8408 Christoph Hellwig     2024-06-16  549  	head = nfs_folio_find_head_request(folio);
fe5ab688ce8408 Christoph Hellwig     2024-06-16  550  	if (!head)
fe5ab688ce8408 Christoph Hellwig     2024-06-16  551  		return NULL;
d458138353726e Weston Andros Adamson 2014-07-11  552  
fe5ab688ce8408 Christoph Hellwig     2024-06-16  553  	while (!nfs_lock_request(head)) {
fe5ab688ce8408 Christoph Hellwig     2024-06-16  554  		ret = nfs_wait_on_request(head);
fe5ab688ce8408 Christoph Hellwig     2024-06-16  555  		if (ret < 0)
e00ed89d7bd59c Trond Myklebust       2020-03-30  556  			return ERR_PTR(ret);
b5bab9bf91324a Trond Myklebust       2017-07-17  557  	}
b5bab9bf91324a Trond Myklebust       2017-07-17  558  
fe5ab688ce8408 Christoph Hellwig     2024-06-16  559  	/* Ensure that nobody removed the request before we locked it */
fe5ab688ce8408 Christoph Hellwig     2024-06-16  560  	if (head != folio->private) {
fe5ab688ce8408 Christoph Hellwig     2024-06-16  561  		nfs_unlock_and_release_request(head);
fe5ab688ce8408 Christoph Hellwig     2024-06-16  562  		goto retry;
fe5ab688ce8408 Christoph Hellwig     2024-06-16  563  	}
fe5ab688ce8408 Christoph Hellwig     2024-06-16  564  
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  565  	ret = nfs_page_group_lock(head);
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  566  	if (ret < 0)
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  567  		goto out_unlock;
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  568  
724a9166a85d96 Christoph Hellwig     2024-06-16 @569  	removed = test_bit(PG_REMOVE, &subreq->wb_flags);
724a9166a85d96 Christoph Hellwig     2024-06-16  570  
fe5ab688ce8408 Christoph Hellwig     2024-06-16  571  	/* lock each request in the page group */
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  572  	for (subreq = head->wb_this_page;
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  573  	     subreq != head;
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  574  	     subreq = subreq->wb_this_page) {
724a9166a85d96 Christoph Hellwig     2024-06-16  575  		if (test_bit(PG_REMOVE, &subreq->wb_flags))
724a9166a85d96 Christoph Hellwig     2024-06-16  576  			removed = true;
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  577  		ret = nfs_page_group_lock_subreq(head, subreq);
fe5ab688ce8408 Christoph Hellwig     2024-06-16  578  		if (ret < 0)
fe5ab688ce8408 Christoph Hellwig     2024-06-16  579  			goto out_unlock;
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  580  	}
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  581  
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  582  	nfs_page_group_unlock(head);
fe5ab688ce8408 Christoph Hellwig     2024-06-16  583  
724a9166a85d96 Christoph Hellwig     2024-06-16  584  	/*
724a9166a85d96 Christoph Hellwig     2024-06-16  585  	 * If PG_REMOVE is set on any request, I/O on that request has
724a9166a85d96 Christoph Hellwig     2024-06-16  586  	 * completed, but some requests were still under I/O at the time
724a9166a85d96 Christoph Hellwig     2024-06-16  587  	 * we locked the head request.
724a9166a85d96 Christoph Hellwig     2024-06-16  588  	 *
724a9166a85d96 Christoph Hellwig     2024-06-16  589  	 * In that case the above wait for all requests means that all I/O
724a9166a85d96 Christoph Hellwig     2024-06-16  590  	 * has now finished, and we can restart from a clean slate.  Let the
724a9166a85d96 Christoph Hellwig     2024-06-16  591  	 * old requests go away and start from scratch instead.
724a9166a85d96 Christoph Hellwig     2024-06-16  592  	 */
724a9166a85d96 Christoph Hellwig     2024-06-16  593  	if (removed) {
724a9166a85d96 Christoph Hellwig     2024-06-16  594  		nfs_unroll_locks(head, head);
724a9166a85d96 Christoph Hellwig     2024-06-16  595  		nfs_unlock_and_release_request(head);
724a9166a85d96 Christoph Hellwig     2024-06-16  596  		goto retry;
724a9166a85d96 Christoph Hellwig     2024-06-16  597  	}
724a9166a85d96 Christoph Hellwig     2024-06-16  598  
fe5ab688ce8408 Christoph Hellwig     2024-06-16  599  	nfs_init_cinfo_from_inode(&cinfo, inode);
fe5ab688ce8408 Christoph Hellwig     2024-06-16  600  	nfs_join_page_group(head, &cinfo, inode);
e00ed89d7bd59c Trond Myklebust       2020-03-30  601  	return head;
fe5ab688ce8408 Christoph Hellwig     2024-06-16  602  
fe5ab688ce8408 Christoph Hellwig     2024-06-16  603  out_unlock:
fe5ab688ce8408 Christoph Hellwig     2024-06-16  604  	nfs_unlock_and_release_request(head);
fe5ab688ce8408 Christoph Hellwig     2024-06-16  605  	return ERR_PTR(ret);
c63c7b05139536 Trond Myklebust       2007-04-02  606  }
074cc1deec5dee Trond Myklebust       2009-08-10  607  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
