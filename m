Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D49134A7
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Oct 2023 11:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGnaWHtH"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696506533; x=1728042533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cx+GNSylRVgJEDDdyi0cfHbvZz/oHPOSe9tjpORPKto=;
  b=eGnaWHtHZK98j5+6GG2TAHUw/YavKmtT9wdcjNBJ3NL+NFQCP3W7e02W
   d7oD6v720CUCUINMmfyIpTm2IRL56O+N792a+PINrPFmusWzEQZbeyPMW
   2JJGiPa1ZZc4MRAJFm67ljGFWCMFNn/iUKlViSX0yRShPWarHfY4dDyV7
   +uwaq/uvJF9418YOQRv1Q3jet3A1uCAUdjoAs24qkL8xwdx5+LhAXAZTt
   85yacp1KdjE8T661Z4Hb4BthflV+y5e10ROo7yJWejEscVSpyQqhejHBU
   1kGl7HtDlfQT0GhpuENXuKZ51O5xaW0f0kUIC0rpSET1wNlCdXtNnRjs1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="387347178"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="387347178"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 04:48:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="755411961"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="755411961"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 05 Oct 2023 04:48:50 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoMqW-000LMW-19;
	Thu, 05 Oct 2023 11:48:48 +0000
Date: Thu, 5 Oct 2023 19:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [dhowells-fs:cifs-netfs 26/44] fs/netfs/buffered_read.c:328:12-13:
 WARNING opportunity for min()
Message-ID: <202310051919.mvBP69lW-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-netfs
head:   c535f8e2b3fd3f2da2d9e75c71e216c4c9ff72db
commit: 86a123b5b9d2f59763b2de539aeb7e59ce45396e [26/44] netfs: Make netfs_read_folio() handle write-streaming pages
:::::: branch date: 13 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-102-20231005 (https://download.01.org/0day-ci/archive/20231005/202310051919.mvBP69lW-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231005/202310051919.mvBP69lW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310051919.mvBP69lW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/netfs/buffered_read.c:328:12-13: WARNING opportunity for min()

vim +328 fs/netfs/buffered_read.c

16211268fcb366 David Howells           2022-03-01  238  
16211268fcb366 David Howells           2022-03-01  239  /**
6c62371b7fd776 Matthew Wilcox (Oracle  2022-04-29  240)  * netfs_read_folio - Helper to manage a read_folio request
16211268fcb366 David Howells           2022-03-01  241   * @file: The file to read from
6c62371b7fd776 Matthew Wilcox (Oracle  2022-04-29  242)  * @folio: The folio to read
16211268fcb366 David Howells           2022-03-01  243   *
6c62371b7fd776 Matthew Wilcox (Oracle  2022-04-29  244)  * Fulfil a read_folio request by drawing data from the cache if
6c62371b7fd776 Matthew Wilcox (Oracle  2022-04-29  245)  * possible, or the netfs if not.  Space beyond the EOF is zero-filled.
6c62371b7fd776 Matthew Wilcox (Oracle  2022-04-29  246)  * Multiple I/O requests from different sources will get munged together.
16211268fcb366 David Howells           2022-03-01  247   *
16211268fcb366 David Howells           2022-03-01  248   * The calling netfs must initialise a netfs context contiguous to the vfs
16211268fcb366 David Howells           2022-03-01  249   * inode before calling this.
16211268fcb366 David Howells           2022-03-01  250   *
16211268fcb366 David Howells           2022-03-01  251   * This is usable whether or not caching is enabled.
16211268fcb366 David Howells           2022-03-01  252   */
6c62371b7fd776 Matthew Wilcox (Oracle  2022-04-29  253) int netfs_read_folio(struct file *file, struct folio *folio)
16211268fcb366 David Howells           2022-03-01  254  {
16211268fcb366 David Howells           2022-03-01  255  	struct address_space *mapping = folio_file_mapping(folio);
16211268fcb366 David Howells           2022-03-01  256  	struct netfs_io_request *rreq;
874c8ca1e60b2c David Howells           2022-06-09  257  	struct netfs_inode *ctx = netfs_inode(mapping->host);
86a123b5b9d2f5 David Howells           2023-10-02  258  	struct folio *sink = NULL;
16211268fcb366 David Howells           2022-03-01  259  	int ret;
16211268fcb366 David Howells           2022-03-01  260  
16211268fcb366 David Howells           2022-03-01  261  	_enter("%lx", folio_index(folio));
16211268fcb366 David Howells           2022-03-01  262  
16211268fcb366 David Howells           2022-03-01  263  	rreq = netfs_alloc_request(mapping, file,
16211268fcb366 David Howells           2022-03-01  264  				   folio_file_pos(folio), folio_size(folio),
16211268fcb366 David Howells           2022-03-01  265  				   NETFS_READPAGE);
16211268fcb366 David Howells           2022-03-01  266  	if (IS_ERR(rreq)) {
16211268fcb366 David Howells           2022-03-01  267  		ret = PTR_ERR(rreq);
16211268fcb366 David Howells           2022-03-01  268  		goto alloc_error;
16211268fcb366 David Howells           2022-03-01  269  	}
16211268fcb366 David Howells           2022-03-01  270  
fb4c3f9fba61de David Howells           2021-08-10  271  	ret = netfs_begin_cache_operation(rreq, ctx);
16211268fcb366 David Howells           2022-03-01  272  	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
16211268fcb366 David Howells           2022-03-01  273  		goto discard;
16211268fcb366 David Howells           2022-03-01  274  
16211268fcb366 David Howells           2022-03-01  275  	netfs_stat(&netfs_n_rh_readpage);
16211268fcb366 David Howells           2022-03-01  276  	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
272319d0529653 David Howells           2023-09-26  277  
272319d0529653 David Howells           2023-09-26  278  	/* Set up the output buffer */
86a123b5b9d2f5 David Howells           2023-10-02  279  	if (folio_test_dirty(folio)) {
86a123b5b9d2f5 David Howells           2023-10-02  280  		/* Handle someone trying to read from an unflushed streaming
86a123b5b9d2f5 David Howells           2023-10-02  281  		 * write.  We fiddle the buffer so that a gap at the beginning
86a123b5b9d2f5 David Howells           2023-10-02  282  		 * and/or a gap at the end get copied to, but the middle is
86a123b5b9d2f5 David Howells           2023-10-02  283  		 * discarded.
86a123b5b9d2f5 David Howells           2023-10-02  284  		 */
86a123b5b9d2f5 David Howells           2023-10-02  285  		struct netfs_folio *finfo = netfs_folio_info(folio);
86a123b5b9d2f5 David Howells           2023-10-02  286  		struct bio_vec *bvec;
86a123b5b9d2f5 David Howells           2023-10-02  287  		unsigned int from = finfo->dirty_offset;
86a123b5b9d2f5 David Howells           2023-10-02  288  		unsigned int to = from + finfo->dirty_len;
86a123b5b9d2f5 David Howells           2023-10-02  289  		unsigned int off = 0, i = 0;
86a123b5b9d2f5 David Howells           2023-10-02  290  		size_t flen = folio_size(folio);
86a123b5b9d2f5 David Howells           2023-10-02  291  		size_t nr_bvec = flen / PAGE_SIZE + 2;
86a123b5b9d2f5 David Howells           2023-10-02  292  		size_t part;
86a123b5b9d2f5 David Howells           2023-10-02  293  
86a123b5b9d2f5 David Howells           2023-10-02  294  		ret = -ENOMEM;
86a123b5b9d2f5 David Howells           2023-10-02  295  		bvec = kmalloc_array(nr_bvec, sizeof(*bvec), GFP_KERNEL);
86a123b5b9d2f5 David Howells           2023-10-02  296  		if (!bvec)
86a123b5b9d2f5 David Howells           2023-10-02  297  			goto discard;
86a123b5b9d2f5 David Howells           2023-10-02  298  
86a123b5b9d2f5 David Howells           2023-10-02  299  		sink = folio_alloc(GFP_KERNEL, 0);
86a123b5b9d2f5 David Howells           2023-10-02  300  		if (!sink)
86a123b5b9d2f5 David Howells           2023-10-02  301  			goto discard;
86a123b5b9d2f5 David Howells           2023-10-02  302  
86a123b5b9d2f5 David Howells           2023-10-02  303  		trace_netfs_folio(folio, netfs_folio_trace_read_gaps);
86a123b5b9d2f5 David Howells           2023-10-02  304  
86a123b5b9d2f5 David Howells           2023-10-02  305  		rreq->direct_bv = bvec;
86a123b5b9d2f5 David Howells           2023-10-02  306  		rreq->direct_bv_count = nr_bvec;
86a123b5b9d2f5 David Howells           2023-10-02  307  		if (from > 0) {
86a123b5b9d2f5 David Howells           2023-10-02  308  			bvec_set_folio(&bvec[i++], folio, from, 0);
86a123b5b9d2f5 David Howells           2023-10-02  309  			off = from;
86a123b5b9d2f5 David Howells           2023-10-02  310  		}
86a123b5b9d2f5 David Howells           2023-10-02  311  		while (off < to) {
86a123b5b9d2f5 David Howells           2023-10-02  312  			part = min_t(size_t, to - off, PAGE_SIZE);
86a123b5b9d2f5 David Howells           2023-10-02  313  			bvec_set_folio(&bvec[i++], sink, part, 0);
86a123b5b9d2f5 David Howells           2023-10-02  314  			off += part;
86a123b5b9d2f5 David Howells           2023-10-02  315  		}
86a123b5b9d2f5 David Howells           2023-10-02  316  		if (to < flen)
86a123b5b9d2f5 David Howells           2023-10-02  317  			bvec_set_folio(&bvec[i++], folio, flen - to, to);
86a123b5b9d2f5 David Howells           2023-10-02  318  		iov_iter_bvec(&rreq->iter, ITER_DEST, bvec, i, rreq->len);
86a123b5b9d2f5 David Howells           2023-10-02  319  	} else {
272319d0529653 David Howells           2023-09-26  320  		iov_iter_xarray(&rreq->iter, ITER_DEST, &mapping->i_pages,
272319d0529653 David Howells           2023-09-26  321  				rreq->start, rreq->len);
86a123b5b9d2f5 David Howells           2023-10-02  322  	}
272319d0529653 David Howells           2023-09-26  323  
1d933898b0240d David Howells           2023-10-04  324  	ret = netfs_begin_read(rreq, true);
86a123b5b9d2f5 David Howells           2023-10-02  325  	if (sink)
86a123b5b9d2f5 David Howells           2023-10-02  326  		folio_put(sink);
1d933898b0240d David Howells           2023-10-04  327  	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
86a123b5b9d2f5 David Howells           2023-10-02 @328  	return ret < 0 ? ret : 0;
16211268fcb366 David Howells           2022-03-01  329  
16211268fcb366 David Howells           2022-03-01  330  discard:
16211268fcb366 David Howells           2022-03-01  331  	netfs_put_request(rreq, false, netfs_rreq_trace_put_discard);
16211268fcb366 David Howells           2022-03-01  332  alloc_error:
16211268fcb366 David Howells           2022-03-01  333  	folio_unlock(folio);
16211268fcb366 David Howells           2022-03-01  334  	return ret;
16211268fcb366 David Howells           2022-03-01  335  }
6c62371b7fd776 Matthew Wilcox (Oracle  2022-04-29  336) EXPORT_SYMBOL(netfs_read_folio);
16211268fcb366 David Howells           2022-03-01  337  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
