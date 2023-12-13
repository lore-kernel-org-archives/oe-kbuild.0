Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9945B59B46
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 17:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExDxNl/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702490097; x=1734026097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hbkJMJtl2hsuPOnWR1FGPJRc7dV3o0FuFncvtyQT01A=;
  b=ExDxNl/J6xQci+5R+BV6ttd4c0IAaQFkfGQdiyXSQHZ1HUefwcano0ko
   Z/5brOjKiGkAl6+56pQqcXuvj6ndHOLPtqSjbkZ5Zn9iUs127YzEZ0mVf
   5KCfu5pwbkbtkUqHorpJe7m6EBrqaaCm7COV9MA+fZ5pB9QEb1OMXil24
   pq+ceR+1c2cqo5PlgXinNzWvnMyuHi0zWidYT0tHHJoNFHSe4sRexvYLI
   q8pVT2LmdtxC8glZ9OcYLPvrmgRcuwerIpARSDJ2a6LGRA6rsbQ/ZD7yR
   /rBj9q1HLQkavpv1FqLukTPsr5aCs2W5yLIdftV0ZvTrjUABWuf4P4x4F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="459319158"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="459319158"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 09:54:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844403009"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="844403009"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2023 09:54:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDTRa-000KyW-1W;
	Wed, 13 Dec 2023 17:54:50 +0000
Date: Thu, 14 Dec 2023 01:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:netfs-lib 69/80] fs/netfs/direct_read.c:189
 netfs_unbuffered_read_iter_locked() error: uninitialized symbol 'min_bsize'.
Message-ID: <202312140149.21EL6QeG-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   0e2ac5291cc1c3c45e5ee784357b3f51b611195f
commit: 9afdab285a8996a3f87b696670fe80fb531c8ad5 [69/80] netfs: Implement support for unbuffered/DIO read
:::::: branch date: 3 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-161-20231213 (https://download.01.org/0day-ci/archive/20231214/202312140149.21EL6QeG-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312140149.21EL6QeG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312140149.21EL6QeG-lkp@intel.com/

smatch warnings:
fs/netfs/direct_read.c:189 netfs_unbuffered_read_iter_locked() error: uninitialized symbol 'min_bsize'.

vim +/min_bsize +189 fs/netfs/direct_read.c

9afdab285a8996 David Howells 2022-01-14  118  
9afdab285a8996 David Howells 2022-01-14  119  /**
9afdab285a8996 David Howells 2022-01-14  120   * netfs_unbuffered_read_iter_locked - Perform an unbuffered or direct I/O read
9afdab285a8996 David Howells 2022-01-14  121   * @iocb: The I/O control descriptor describing the read
9afdab285a8996 David Howells 2022-01-14  122   * @iter: The output buffer (also specifies read length)
9afdab285a8996 David Howells 2022-01-14  123   *
9afdab285a8996 David Howells 2022-01-14  124   * Perform an unbuffered I/O or direct I/O from the file in @iocb to the
9afdab285a8996 David Howells 2022-01-14  125   * output buffer.  No use is made of the pagecache.
9afdab285a8996 David Howells 2022-01-14  126   *
9afdab285a8996 David Howells 2022-01-14  127   * The caller must hold any appropriate locks.
9afdab285a8996 David Howells 2022-01-14  128   */
9afdab285a8996 David Howells 2022-01-14  129  static ssize_t netfs_unbuffered_read_iter_locked(struct kiocb *iocb, struct iov_iter *iter)
9afdab285a8996 David Howells 2022-01-14  130  {
9afdab285a8996 David Howells 2022-01-14  131  	struct netfs_io_request *rreq;
9afdab285a8996 David Howells 2022-01-14  132  	struct netfs_inode *ctx;
9afdab285a8996 David Howells 2022-01-14  133  	unsigned long long start, end;
9afdab285a8996 David Howells 2022-01-14  134  	unsigned int min_bsize;
9afdab285a8996 David Howells 2022-01-14  135  	pgoff_t first, last;
9afdab285a8996 David Howells 2022-01-14  136  	ssize_t ret;
9afdab285a8996 David Howells 2022-01-14  137  	size_t orig_count = iov_iter_count(iter);
9afdab285a8996 David Howells 2022-01-14  138  	bool async = !is_sync_kiocb(iocb);
9afdab285a8996 David Howells 2022-01-14  139  
9afdab285a8996 David Howells 2022-01-14  140  	_enter("");
9afdab285a8996 David Howells 2022-01-14  141  
9afdab285a8996 David Howells 2022-01-14  142  	if (!orig_count)
9afdab285a8996 David Howells 2022-01-14  143  		return 0; /* Don't update atime */
9afdab285a8996 David Howells 2022-01-14  144  
9afdab285a8996 David Howells 2022-01-14  145  	ret = kiocb_write_and_wait(iocb, orig_count);
9afdab285a8996 David Howells 2022-01-14  146  	if (ret < 0)
9afdab285a8996 David Howells 2022-01-14  147  		return ret;
9afdab285a8996 David Howells 2022-01-14  148  	file_accessed(iocb->ki_filp);
9afdab285a8996 David Howells 2022-01-14  149  
9afdab285a8996 David Howells 2022-01-14  150  	rreq = netfs_alloc_request(iocb->ki_filp->f_mapping, iocb->ki_filp,
9afdab285a8996 David Howells 2022-01-14  151  				   iocb->ki_pos, orig_count,
9afdab285a8996 David Howells 2022-01-14  152  				   NETFS_DIO_READ);
9afdab285a8996 David Howells 2022-01-14  153  	if (IS_ERR(rreq))
9afdab285a8996 David Howells 2022-01-14  154  		return PTR_ERR(rreq);
9afdab285a8996 David Howells 2022-01-14  155  
9afdab285a8996 David Howells 2022-01-14  156  	ctx = netfs_inode(rreq->inode);
9afdab285a8996 David Howells 2022-01-14  157  	netfs_stat(&netfs_n_rh_dio_read);
9afdab285a8996 David Howells 2022-01-14  158  	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_dio_read);
9afdab285a8996 David Howells 2022-01-14  159  
9afdab285a8996 David Howells 2022-01-14  160  	/* If this is an async op, we have to keep track of the destination
9afdab285a8996 David Howells 2022-01-14  161  	 * buffer for ourselves as the caller's iterator will be trashed when
9afdab285a8996 David Howells 2022-01-14  162  	 * we return.
9afdab285a8996 David Howells 2022-01-14  163  	 *
9afdab285a8996 David Howells 2022-01-14  164  	 * In such a case, extract an iterator to represent as much of the the
9afdab285a8996 David Howells 2022-01-14  165  	 * output buffer as we can manage.  Note that the extraction might not
9afdab285a8996 David Howells 2022-01-14  166  	 * be able to allocate a sufficiently large bvec array and may shorten
9afdab285a8996 David Howells 2022-01-14  167  	 * the request.
9afdab285a8996 David Howells 2022-01-14  168  	 */
9afdab285a8996 David Howells 2022-01-14  169  	if (user_backed_iter(iter)) {
9afdab285a8996 David Howells 2022-01-14  170  		ret = netfs_extract_user_iter(iter, rreq->len, &rreq->iter, 0);
9afdab285a8996 David Howells 2022-01-14  171  		if (ret < 0)
9afdab285a8996 David Howells 2022-01-14  172  			goto out;
9afdab285a8996 David Howells 2022-01-14  173  		rreq->direct_bv = (struct bio_vec *)rreq->iter.bvec;
9afdab285a8996 David Howells 2022-01-14  174  		rreq->direct_bv_count = ret;
9afdab285a8996 David Howells 2022-01-14  175  		rreq->direct_bv_unpin = iov_iter_extract_will_pin(iter);
9afdab285a8996 David Howells 2022-01-14  176  		rreq->len = iov_iter_count(&rreq->iter);
9afdab285a8996 David Howells 2022-01-14  177  	} else {
9afdab285a8996 David Howells 2022-01-14  178  		rreq->iter = *iter;
9afdab285a8996 David Howells 2022-01-14  179  		rreq->len = orig_count;
9afdab285a8996 David Howells 2022-01-14  180  		rreq->direct_bv_unpin = false;
9afdab285a8996 David Howells 2022-01-14  181  		iov_iter_advance(iter, orig_count);
9afdab285a8996 David Howells 2022-01-14  182  	}
9afdab285a8996 David Howells 2022-01-14  183  
9afdab285a8996 David Howells 2022-01-14  184  	/* If we're going to use a bounce buffer, we need to set it up.  We
9afdab285a8996 David Howells 2022-01-14  185  	 * will then need to pad the request out to the minimum block size.
9afdab285a8996 David Howells 2022-01-14  186  	 */
9afdab285a8996 David Howells 2022-01-14  187  	if (test_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &rreq->flags)) {
9afdab285a8996 David Howells 2022-01-14  188  		start = rreq->start;
9afdab285a8996 David Howells 2022-01-14 @189  		end = min_t(unsigned long long,
9afdab285a8996 David Howells 2022-01-14  190  			    round_up(rreq->start + rreq->len, min_bsize),
9afdab285a8996 David Howells 2022-01-14  191  			    ctx->remote_i_size);
9afdab285a8996 David Howells 2022-01-14  192  
9afdab285a8996 David Howells 2022-01-14  193  		rreq->start = start;
9afdab285a8996 David Howells 2022-01-14  194  		rreq->len   = end - start;
9afdab285a8996 David Howells 2022-01-14  195  		first = start / PAGE_SIZE;
9afdab285a8996 David Howells 2022-01-14  196  		last  = (end - 1) / PAGE_SIZE;
9afdab285a8996 David Howells 2022-01-14  197  		_debug("bounce %llx-%llx %lx-%lx",
9afdab285a8996 David Howells 2022-01-14  198  		       rreq->start, end, first, last);
9afdab285a8996 David Howells 2022-01-14  199  
9afdab285a8996 David Howells 2022-01-14  200  		ret = netfs_add_folios_to_buffer(&rreq->bounce, rreq->mapping,
9afdab285a8996 David Howells 2022-01-14  201  						 first, last, GFP_KERNEL);
9afdab285a8996 David Howells 2022-01-14  202  		if (ret < 0)
9afdab285a8996 David Howells 2022-01-14  203  			goto out;
9afdab285a8996 David Howells 2022-01-14  204  	}
9afdab285a8996 David Howells 2022-01-14  205  
9afdab285a8996 David Howells 2022-01-14  206  	if (async)
9afdab285a8996 David Howells 2022-01-14  207  		rreq->iocb = iocb;
9afdab285a8996 David Howells 2022-01-14  208  
9afdab285a8996 David Howells 2022-01-14  209  	ret = netfs_begin_read(rreq, is_sync_kiocb(iocb));
9afdab285a8996 David Howells 2022-01-14  210  	if (ret < 0)
9afdab285a8996 David Howells 2022-01-14  211  		goto out; /* May be -EIOCBQUEUED */
9afdab285a8996 David Howells 2022-01-14  212  	if (!async) {
9afdab285a8996 David Howells 2022-01-14  213  		ret = netfs_dio_copy_bounce_to_dest(rreq);
9afdab285a8996 David Howells 2022-01-14  214  		if (ret == 0) {
9afdab285a8996 David Howells 2022-01-14  215  			iocb->ki_pos += rreq->transferred;
9afdab285a8996 David Howells 2022-01-14  216  			ret = rreq->transferred;
9afdab285a8996 David Howells 2022-01-14  217  		}
9afdab285a8996 David Howells 2022-01-14  218  	}
9afdab285a8996 David Howells 2022-01-14  219  
9afdab285a8996 David Howells 2022-01-14  220  out:
9afdab285a8996 David Howells 2022-01-14  221  	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
9afdab285a8996 David Howells 2022-01-14  222  	if (ret > 0)
9afdab285a8996 David Howells 2022-01-14  223  		orig_count -= ret;
9afdab285a8996 David Howells 2022-01-14  224  	if (ret != -EIOCBQUEUED)
9afdab285a8996 David Howells 2022-01-14  225  		iov_iter_revert(iter, orig_count - iov_iter_count(iter));
9afdab285a8996 David Howells 2022-01-14  226  	return ret;
9afdab285a8996 David Howells 2022-01-14  227  }
9afdab285a8996 David Howells 2022-01-14  228  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
