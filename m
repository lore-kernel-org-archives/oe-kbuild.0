Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44D437C
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Jun 2024 00:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719014551; cv=none; b=gYeCkhvmp7kcbMTXZoRYgCtPe08jO4IE8bzBfuVprsll7Tg+gzz39slvsbIP21CCXsPBmm3FLsKGbmHNgZY7aKu59/584sNBF/bOynQ8fgybF+4l9F6MeNLCvkf8iPuSTGx7PBFfCkUqlCzK+V1p6LQRHBgw+E+jzWUfnND2Za0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719014551; c=relaxed/simple;
	bh=fSSJNBHTSCX+PA0ZIlfDx2M1bKXwVB+3Brx7kZo+1JY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SBV+IoVaGSyxtOwbLX2XSWUOUoSt6Rt2cxFKkwPfgyOdvzTPzZ8l21nK4wPimD3Ok6S/7H/QDWn+MfSRrvCcqQKBcrjidPmj3uiIBlArnNTuWbACShYs0+yf4PUczlPtYY+xa7fvWcIqT5nmRB/7A4XtxjGpahi24/WsWZvMo0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hw/rhy+f; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hw/rhy+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719014548; x=1750550548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fSSJNBHTSCX+PA0ZIlfDx2M1bKXwVB+3Brx7kZo+1JY=;
  b=Hw/rhy+fGLIbYbhrB+Jo9/FUGkU/g8NH5zuEOQ8PNvcf/s520FVFPOIh
   /o39m8QrUceQDd2wZGNu+lZDf4y/Zy8YeRgKsJw/AoH/CW8Sl39UKMfBQ
   MXOY3d1EE6cVvP5j+jgRjvMxEq0JpU+sVLEgeLjKPP8R2TjqqnfmxOFv1
   KffZIG2gM7JpEPecm02rr1SwIGjvGEbzpRIzgd8T7iJWgP9TundTy9X0S
   XgBrqcm6+FTTO7TDSroV5aHqvvKMuRm+724J9vxnORPQLl7uREArVWowd
   uGOjggoJl1Wl/zo5zNdsLUMTTCLy8yZIuET7hxzgxzcEBAcWyq8wPArVh
   A==;
X-CSE-ConnectionGUID: XGlaj1mATumUFHezY7m7ag==
X-CSE-MsgGUID: AQdDQHCcSEi20s94ji1bNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="18974079"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="18974079"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 17:02:28 -0700
X-CSE-ConnectionGUID: DQkpViElTaeJ6mbT1lr2sg==
X-CSE-MsgGUID: 4bky2eCeSJqrEhFUQCss1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="73952336"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Jun 2024 17:02:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKoD2-000994-2H;
	Sat, 22 Jun 2024 00:02:24 +0000
Date: Sat, 22 Jun 2024 08:02:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:netfs-writeback 17/17] fs/netfs/buffered_read.c:280
 netfs_read_to_pagecache() error: uninitialized symbol 'slice'.
Message-ID: <202406220713.ZTEHfOyc-lkp@intel.com>
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
head:   ce62c8542631d1deea2fcedbbba41046c3f95285
commit: d75f8ece3c49fa2ab1299cdabfc879952702a19a [17/17] netfs: Speed up buffered reading
:::::: branch date: 8 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-161-20240622 (https://download.01.org/0day-ci/archive/20240622/202406220713.ZTEHfOyc-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406220713.ZTEHfOyc-lkp@intel.com/

New smatch warnings:
fs/netfs/buffered_read.c:280 netfs_read_to_pagecache() error: uninitialized symbol 'slice'.
fs/smb/client/file.c:166 cifs_issue_read() warn: unsigned 'len' is never less than zero.

Old smatch warnings:
fs/smb/client/file.c:3054 cifs_oplock_break() warn: variable dereferenced before check 'inode' (see line 3025)

vim +/slice +280 fs/netfs/buffered_read.c

d75f8ece3c49fa2 David Howells 2024-06-19  206  
d75f8ece3c49fa2 David Howells 2024-06-19  207  /*
d75f8ece3c49fa2 David Howells 2024-06-19  208   * Perform a read to the pagecache from a series of sources of different types,
d75f8ece3c49fa2 David Howells 2024-06-19  209   * slicing up the region to be read according to available cache blocks and
d75f8ece3c49fa2 David Howells 2024-06-19  210   * network rsize.
d75f8ece3c49fa2 David Howells 2024-06-19  211   */
d75f8ece3c49fa2 David Howells 2024-06-19  212  static int netfs_read_to_pagecache(struct netfs_io_request *rreq)
d75f8ece3c49fa2 David Howells 2024-06-19  213  {
d75f8ece3c49fa2 David Howells 2024-06-19  214  	struct netfs_inode *ictx = netfs_inode(rreq->inode);
d75f8ece3c49fa2 David Howells 2024-06-19  215  	unsigned long long start = rreq->start;
d75f8ece3c49fa2 David Howells 2024-06-19  216  	ssize_t size = rreq->len;
d75f8ece3c49fa2 David Howells 2024-06-19  217  
d75f8ece3c49fa2 David Howells 2024-06-19  218  	/* Chop the readahead request up into subrequests. */
d75f8ece3c49fa2 David Howells 2024-06-19  219  	do {
d75f8ece3c49fa2 David Howells 2024-06-19  220  		struct netfs_io_subrequest *subreq;
d75f8ece3c49fa2 David Howells 2024-06-19  221  		enum netfs_io_source source = NETFS_DOWNLOAD_FROM_SERVER;
d75f8ece3c49fa2 David Howells 2024-06-19  222  		ssize_t slice;
d75f8ece3c49fa2 David Howells 2024-06-19  223  
d75f8ece3c49fa2 David Howells 2024-06-19  224  		subreq = netfs_alloc_subrequest(rreq);
d75f8ece3c49fa2 David Howells 2024-06-19  225  		if (!subreq)
d75f8ece3c49fa2 David Howells 2024-06-19  226  			return -ENOMEM;
d75f8ece3c49fa2 David Howells 2024-06-19  227  
d75f8ece3c49fa2 David Howells 2024-06-19  228  		subreq->source	= NETFS_DOWNLOAD_FROM_SERVER;
d75f8ece3c49fa2 David Howells 2024-06-19  229  		subreq->start	= start;
d75f8ece3c49fa2 David Howells 2024-06-19  230  		subreq->len	= size;
d75f8ece3c49fa2 David Howells 2024-06-19  231  
d75f8ece3c49fa2 David Howells 2024-06-19  232  		spin_lock(&rreq->lock);
d75f8ece3c49fa2 David Howells 2024-06-19  233  		list_add_tail(&subreq->rreq_link, &rreq->subrequests);
d75f8ece3c49fa2 David Howells 2024-06-19  234  		subreq->prev_donated = rreq->prev_donated;
d75f8ece3c49fa2 David Howells 2024-06-19  235  		rreq->prev_donated = 0;
d75f8ece3c49fa2 David Howells 2024-06-19  236  		trace_netfs_sreq(subreq, netfs_sreq_trace_added);
d75f8ece3c49fa2 David Howells 2024-06-19  237  		spin_unlock(&rreq->lock);
d75f8ece3c49fa2 David Howells 2024-06-19  238  
d75f8ece3c49fa2 David Howells 2024-06-19  239  		source = netfs_cache_prepare_read(rreq, subreq, rreq->i_size);
d75f8ece3c49fa2 David Howells 2024-06-19  240  		if (source == NETFS_DOWNLOAD_FROM_SERVER) {
d75f8ece3c49fa2 David Howells 2024-06-19  241  			if (subreq->start >= ictx->zero_point) {
d75f8ece3c49fa2 David Howells 2024-06-19  242  				subreq->source = source = NETFS_FILL_WITH_ZEROES;
d75f8ece3c49fa2 David Howells 2024-06-19  243  				goto fill_with_zeroes;
d75f8ece3c49fa2 David Howells 2024-06-19  244  			}
d75f8ece3c49fa2 David Howells 2024-06-19  245  
d75f8ece3c49fa2 David Howells 2024-06-19  246  			if (subreq->len > ictx->zero_point - subreq->start)
d75f8ece3c49fa2 David Howells 2024-06-19  247  				subreq->len = ictx->zero_point - subreq->start;
d75f8ece3c49fa2 David Howells 2024-06-19  248  			if (subreq->len > rreq->i_size - subreq->start)
d75f8ece3c49fa2 David Howells 2024-06-19  249  				subreq->len = rreq->i_size - subreq->start;
d75f8ece3c49fa2 David Howells 2024-06-19  250  
d75f8ece3c49fa2 David Howells 2024-06-19  251  			netfs_stat(&netfs_n_rh_download);
d75f8ece3c49fa2 David Howells 2024-06-19  252  			slice = rreq->netfs_ops->issue_read(subreq);
d75f8ece3c49fa2 David Howells 2024-06-19  253  			if (slice <= 0)
d75f8ece3c49fa2 David Howells 2024-06-19  254  				return slice;
d75f8ece3c49fa2 David Howells 2024-06-19  255  			goto done;
d75f8ece3c49fa2 David Howells 2024-06-19  256  		}
d75f8ece3c49fa2 David Howells 2024-06-19  257  
d75f8ece3c49fa2 David Howells 2024-06-19  258  	fill_with_zeroes:
d75f8ece3c49fa2 David Howells 2024-06-19  259  		if (source == NETFS_FILL_WITH_ZEROES) {
d75f8ece3c49fa2 David Howells 2024-06-19  260  			subreq->source = NETFS_FILL_WITH_ZEROES;
d75f8ece3c49fa2 David Howells 2024-06-19  261  			trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
d75f8ece3c49fa2 David Howells 2024-06-19  262  			netfs_stat(&netfs_n_rh_zero);
d75f8ece3c49fa2 David Howells 2024-06-19  263  			slice = subreq->len;
d75f8ece3c49fa2 David Howells 2024-06-19  264  			subreq->transferred = slice;
d75f8ece3c49fa2 David Howells 2024-06-19  265  			__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
d75f8ece3c49fa2 David Howells 2024-06-19  266  			netfs_read_subreq_progress(subreq, 0, false);
d75f8ece3c49fa2 David Howells 2024-06-19  267  			goto done;
d75f8ece3c49fa2 David Howells 2024-06-19  268  		}
d75f8ece3c49fa2 David Howells 2024-06-19  269  
d75f8ece3c49fa2 David Howells 2024-06-19  270  		if (source == NETFS_READ_FROM_CACHE) {
d75f8ece3c49fa2 David Howells 2024-06-19  271  			trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
d75f8ece3c49fa2 David Howells 2024-06-19  272  			slice = netfs_read_cache_to_pagecache(rreq, subreq);
d75f8ece3c49fa2 David Howells 2024-06-19  273  			goto done;
d75f8ece3c49fa2 David Howells 2024-06-19  274  		}
d75f8ece3c49fa2 David Howells 2024-06-19  275  
d75f8ece3c49fa2 David Howells 2024-06-19  276  		if (source == NETFS_INVALID_READ)
d75f8ece3c49fa2 David Howells 2024-06-19  277  			break;
d75f8ece3c49fa2 David Howells 2024-06-19  278  
d75f8ece3c49fa2 David Howells 2024-06-19  279  	done:
d75f8ece3c49fa2 David Howells 2024-06-19 @280  		size -= slice;
d75f8ece3c49fa2 David Howells 2024-06-19  281  		start += slice;
d75f8ece3c49fa2 David Howells 2024-06-19  282  		cond_resched();
d75f8ece3c49fa2 David Howells 2024-06-19  283  	} while (size > 0);
d75f8ece3c49fa2 David Howells 2024-06-19  284  
d75f8ece3c49fa2 David Howells 2024-06-19  285  	return 0;
d75f8ece3c49fa2 David Howells 2024-06-19  286  }
d75f8ece3c49fa2 David Howells 2024-06-19  287  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
