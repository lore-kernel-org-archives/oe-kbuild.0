Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4FF7492
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 07:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3ohxa2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701849542; x=1733385542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GA2iZa0fdIb3Sgwo9R83KcfL1NnhNAgsU413ssQl6Nc=;
  b=a3ohxa2AOg2EGlUa1vOd6abzLDDdgwDqBf3fn8+/7dZBDHbv4nMTS9az
   aPW2Ufd4Mt1ObyWVU/lqiuudmK4VwLv11cHCRY7FCJBjYHWB7HkoHNYhM
   b0Ag1K5gaB1DT34rbDlVS0b+xZI+b1SYuk5ZilMlPQNWXud2y9dNaFJSG
   aIyrobHLMSOZK+1gwNkBy6rQuglzMT+9JNeVI+1z0xUrWvvLT5bSkipLd
   trgxNuORSyiMKXeoqIWmyO2DIXat52whhUFOQre0QDGOQzYR93wD3Y6l0
   at3PziNteA+FMX+lw3H+v8mF/gB5Z1iqa6zjnzm4H6GMgpPz7s8otIT1q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="15572728"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="15572728"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 23:59:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018482298"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1018482298"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 23:59:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAmo5-000AUu-2i;
	Wed, 06 Dec 2023 07:58:57 +0000
Date: Wed, 6 Dec 2023 15:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [dhowells-fs:netfs-lib 28/61] fs/netfs/buffered_read.c:322:12-13:
 WARNING opportunity for min()
Message-ID: <202312061503.OqonlTIy-lkp@intel.com>
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
head:   ed72c33e807046e9a09965dba2d3524f5bc90ae9
commit: 7dcb5e94e38179a1eca755b4e67222c4c553c34d [28/61] netfs: Make netfs_read_folio() handle streaming-write pages
:::::: branch date: 6 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-104-20231201 (https://download.01.org/0day-ci/archive/20231206/202312061503.OqonlTIy-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312061503.OqonlTIy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312061503.OqonlTIy-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/netfs/buffered_read.c:322:12-13: WARNING opportunity for min()

vim +322 fs/netfs/buffered_read.c

16211268fcb366 David Howells           2022-03-01  232  
16211268fcb366 David Howells           2022-03-01  233  /**
6c62371b7fd776 Matthew Wilcox (Oracle  2022-04-29  234)  * netfs_read_folio - Helper to manage a read_folio request
16211268fcb366 David Howells           2022-03-01  235   * @file: The file to read from
6c62371b7fd776 Matthew Wilcox (Oracle  2022-04-29  236)  * @folio: The folio to read
16211268fcb366 David Howells           2022-03-01  237   *
6c62371b7fd776 Matthew Wilcox (Oracle  2022-04-29  238)  * Fulfil a read_folio request by drawing data from the cache if
6c62371b7fd776 Matthew Wilcox (Oracle  2022-04-29  239)  * possible, or the netfs if not.  Space beyond the EOF is zero-filled.
6c62371b7fd776 Matthew Wilcox (Oracle  2022-04-29  240)  * Multiple I/O requests from different sources will get munged together.
16211268fcb366 David Howells           2022-03-01  241   *
16211268fcb366 David Howells           2022-03-01  242   * The calling netfs must initialise a netfs context contiguous to the vfs
16211268fcb366 David Howells           2022-03-01  243   * inode before calling this.
16211268fcb366 David Howells           2022-03-01  244   *
16211268fcb366 David Howells           2022-03-01  245   * This is usable whether or not caching is enabled.
16211268fcb366 David Howells           2022-03-01  246   */
6c62371b7fd776 Matthew Wilcox (Oracle  2022-04-29  247) int netfs_read_folio(struct file *file, struct folio *folio)
16211268fcb366 David Howells           2022-03-01  248  {
16211268fcb366 David Howells           2022-03-01  249  	struct address_space *mapping = folio_file_mapping(folio);
16211268fcb366 David Howells           2022-03-01  250  	struct netfs_io_request *rreq;
874c8ca1e60b2c David Howells           2022-06-09  251  	struct netfs_inode *ctx = netfs_inode(mapping->host);
7dcb5e94e38179 David Howells           2023-10-02  252  	struct folio *sink = NULL;
16211268fcb366 David Howells           2022-03-01  253  	int ret;
16211268fcb366 David Howells           2022-03-01  254  
16211268fcb366 David Howells           2022-03-01  255  	_enter("%lx", folio_index(folio));
16211268fcb366 David Howells           2022-03-01  256  
16211268fcb366 David Howells           2022-03-01  257  	rreq = netfs_alloc_request(mapping, file,
16211268fcb366 David Howells           2022-03-01  258  				   folio_file_pos(folio), folio_size(folio),
16211268fcb366 David Howells           2022-03-01  259  				   NETFS_READPAGE);
16211268fcb366 David Howells           2022-03-01  260  	if (IS_ERR(rreq)) {
16211268fcb366 David Howells           2022-03-01  261  		ret = PTR_ERR(rreq);
16211268fcb366 David Howells           2022-03-01  262  		goto alloc_error;
16211268fcb366 David Howells           2022-03-01  263  	}
16211268fcb366 David Howells           2022-03-01  264  
52a4d0d95f6ac4 David Howells           2023-11-20  265  	ret = netfs_begin_cache_read(rreq, ctx);
16211268fcb366 David Howells           2022-03-01  266  	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
16211268fcb366 David Howells           2022-03-01  267  		goto discard;
16211268fcb366 David Howells           2022-03-01  268  
16211268fcb366 David Howells           2022-03-01  269  	netfs_stat(&netfs_n_rh_readpage);
16211268fcb366 David Howells           2022-03-01  270  	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
79da688afcb03d David Howells           2023-09-26  271  
79da688afcb03d David Howells           2023-09-26  272  	/* Set up the output buffer */
7dcb5e94e38179 David Howells           2023-10-02  273  	if (folio_test_dirty(folio)) {
7dcb5e94e38179 David Howells           2023-10-02  274  		/* Handle someone trying to read from an unflushed streaming
7dcb5e94e38179 David Howells           2023-10-02  275  		 * write.  We fiddle the buffer so that a gap at the beginning
7dcb5e94e38179 David Howells           2023-10-02  276  		 * and/or a gap at the end get copied to, but the middle is
7dcb5e94e38179 David Howells           2023-10-02  277  		 * discarded.
7dcb5e94e38179 David Howells           2023-10-02  278  		 */
7dcb5e94e38179 David Howells           2023-10-02  279  		struct netfs_folio *finfo = netfs_folio_info(folio);
7dcb5e94e38179 David Howells           2023-10-02  280  		struct bio_vec *bvec;
7dcb5e94e38179 David Howells           2023-10-02  281  		unsigned int from = finfo->dirty_offset;
7dcb5e94e38179 David Howells           2023-10-02  282  		unsigned int to = from + finfo->dirty_len;
7dcb5e94e38179 David Howells           2023-10-02  283  		unsigned int off = 0, i = 0;
7dcb5e94e38179 David Howells           2023-10-02  284  		size_t flen = folio_size(folio);
7dcb5e94e38179 David Howells           2023-10-02  285  		size_t nr_bvec = flen / PAGE_SIZE + 2;
7dcb5e94e38179 David Howells           2023-10-02  286  		size_t part;
7dcb5e94e38179 David Howells           2023-10-02  287  
7dcb5e94e38179 David Howells           2023-10-02  288  		ret = -ENOMEM;
7dcb5e94e38179 David Howells           2023-10-02  289  		bvec = kmalloc_array(nr_bvec, sizeof(*bvec), GFP_KERNEL);
7dcb5e94e38179 David Howells           2023-10-02  290  		if (!bvec)
7dcb5e94e38179 David Howells           2023-10-02  291  			goto discard;
7dcb5e94e38179 David Howells           2023-10-02  292  
7dcb5e94e38179 David Howells           2023-10-02  293  		sink = folio_alloc(GFP_KERNEL, 0);
7dcb5e94e38179 David Howells           2023-10-02  294  		if (!sink)
7dcb5e94e38179 David Howells           2023-10-02  295  			goto discard;
7dcb5e94e38179 David Howells           2023-10-02  296  
7dcb5e94e38179 David Howells           2023-10-02  297  		trace_netfs_folio(folio, netfs_folio_trace_read_gaps);
7dcb5e94e38179 David Howells           2023-10-02  298  
7dcb5e94e38179 David Howells           2023-10-02  299  		rreq->direct_bv = bvec;
7dcb5e94e38179 David Howells           2023-10-02  300  		rreq->direct_bv_count = nr_bvec;
7dcb5e94e38179 David Howells           2023-10-02  301  		if (from > 0) {
7dcb5e94e38179 David Howells           2023-10-02  302  			bvec_set_folio(&bvec[i++], folio, from, 0);
7dcb5e94e38179 David Howells           2023-10-02  303  			off = from;
7dcb5e94e38179 David Howells           2023-10-02  304  		}
7dcb5e94e38179 David Howells           2023-10-02  305  		while (off < to) {
7dcb5e94e38179 David Howells           2023-10-02  306  			part = min_t(size_t, to - off, PAGE_SIZE);
7dcb5e94e38179 David Howells           2023-10-02  307  			bvec_set_folio(&bvec[i++], sink, part, 0);
7dcb5e94e38179 David Howells           2023-10-02  308  			off += part;
7dcb5e94e38179 David Howells           2023-10-02  309  		}
7dcb5e94e38179 David Howells           2023-10-02  310  		if (to < flen)
7dcb5e94e38179 David Howells           2023-10-02  311  			bvec_set_folio(&bvec[i++], folio, flen - to, to);
7dcb5e94e38179 David Howells           2023-10-02  312  		iov_iter_bvec(&rreq->iter, ITER_DEST, bvec, i, rreq->len);
7dcb5e94e38179 David Howells           2023-10-02  313  	} else {
79da688afcb03d David Howells           2023-09-26  314  		iov_iter_xarray(&rreq->iter, ITER_DEST, &mapping->i_pages,
79da688afcb03d David Howells           2023-09-26  315  				rreq->start, rreq->len);
7dcb5e94e38179 David Howells           2023-10-02  316  	}
79da688afcb03d David Howells           2023-09-26  317  
0c292ff33a017a David Howells           2023-10-04  318  	ret = netfs_begin_read(rreq, true);
7dcb5e94e38179 David Howells           2023-10-02  319  	if (sink)
7dcb5e94e38179 David Howells           2023-10-02  320  		folio_put(sink);
0c292ff33a017a David Howells           2023-10-04  321  	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
7dcb5e94e38179 David Howells           2023-10-02 @322  	return ret < 0 ? ret : 0;
16211268fcb366 David Howells           2022-03-01  323  
16211268fcb366 David Howells           2022-03-01  324  discard:
16211268fcb366 David Howells           2022-03-01  325  	netfs_put_request(rreq, false, netfs_rreq_trace_put_discard);
16211268fcb366 David Howells           2022-03-01  326  alloc_error:
16211268fcb366 David Howells           2022-03-01  327  	folio_unlock(folio);
16211268fcb366 David Howells           2022-03-01  328  	return ret;
16211268fcb366 David Howells           2022-03-01  329  }
6c62371b7fd776 Matthew Wilcox (Oracle  2022-04-29  330) EXPORT_SYMBOL(netfs_read_folio);
16211268fcb366 David Howells           2022-03-01  331  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
