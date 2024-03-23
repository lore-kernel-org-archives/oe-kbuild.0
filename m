Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934B31A38F4
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Mar 2024 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711202165; cv=none; b=nOjLkCaAX3GKaaN3vPnlaUnd3z62AecXIk85t+0Hx+j4hn0g4dvhgG4umX4YvATZJzfBjsQF9XG7rA8kFjT0R98/o5Ut5UPEIJ7epbn2SdhWfUEZ9rB8syjBRPfivWljNK/icSdo5JFy515IWfofJP6eXRR6Mw1T4kuzBghWvFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711202165; c=relaxed/simple;
	bh=CIW24s3Rd681j3X5bpnz1X3hOD+N//PXBMKbpx7iJtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tb5uhmOGyoZ6O1zA9ywtK0XbLJ1ptvNooIzoyvNSA2ERViybg0OHL5KN31wTmyfNxdZbHn8vZmG/T3mRyHeqz4Wwzaf42BOIV3T0DyIm1KO0biD6fXWmd5c4v/IZwItIOJVGJl9u69wExqP9bZ5VtgvzpHwgP0FkZRQRWrwhNvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/yVGf5V; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/yVGf5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711202162; x=1742738162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CIW24s3Rd681j3X5bpnz1X3hOD+N//PXBMKbpx7iJtk=;
  b=b/yVGf5V5BFTiBJVKsvLQzE59uNLmF5l8OTnUx90m9vsTH8NnQFOF8iW
   AVKnko4OtKgm/9ZjecnPwIZq9zzoNqvHNpNIhBTYAjL9XJIwR5GqRDn8I
   Xwd+NtYHRQgn8OH0G8FMwKDa7M/0WW6RVFpLH1sShNOXxHbkf0H04v5zj
   hu9Yndf66woHINvDi1nBQukzwPkKlwh50geGpv6tET2kGr1l+8CDlk20X
   1e5vL/aTkNClKzjOQDqBktVBt8fukSgx26Em3bpExe2/pUWoPGEfPbUAD
   KnwzOfGt9ihvIFQQ2ZboXbG19blofqdC30cykeWqXycj43Dmo8b1vtdLM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="16977611"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="16977611"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 06:56:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="15156393"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Mar 2024 06:56:00 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro1qo-000LCh-0R;
	Sat, 23 Mar 2024 13:55:58 +0000
Date: Sat, 23 Mar 2024 21:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:netfs-writeback 17/22] fs/netfs/write_collect.c:110
 netfs_writeback_lookup_folio() error: we previously assumed 'folio' could be
 null (see line 99)
Message-ID: <202403232142.egfToXYX-lkp@intel.com>
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
head:   6d4dafd8301ee8645d4814a7e75a9135acf67613
commit: 52ff5a10870495fafb8bdf0ee2e987d861b1b42c [17/22] netfs, 9p: Implement helpers for new write code
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc64-randconfig-r081-20240323 (https://download.01.org/0day-ci/archive/20240323/202403232142.egfToXYX-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403232142.egfToXYX-lkp@intel.com/

smatch warnings:
fs/netfs/write_collect.c:110 netfs_writeback_lookup_folio() error: we previously assumed 'folio' could be null (see line 99)

vim +/folio +110 fs/netfs/write_collect.c

9a3702e1d161f5 David Howells 2024-03-18   81  
9a3702e1d161f5 David Howells 2024-03-18   82  /*
9a3702e1d161f5 David Howells 2024-03-18   83   * Get hold of a folio we have under writeback.  We don't want to get the
9a3702e1d161f5 David Howells 2024-03-18   84   * refcount on it.
9a3702e1d161f5 David Howells 2024-03-18   85   */
9a3702e1d161f5 David Howells 2024-03-18   86  static struct folio *netfs_writeback_lookup_folio(struct netfs_io_request *wreq, loff_t pos)
9a3702e1d161f5 David Howells 2024-03-18   87  {
9a3702e1d161f5 David Howells 2024-03-18   88  	XA_STATE(xas, &wreq->mapping->i_pages, pos / PAGE_SIZE);
9a3702e1d161f5 David Howells 2024-03-18   89  	struct folio *folio;
9a3702e1d161f5 David Howells 2024-03-18   90  
9a3702e1d161f5 David Howells 2024-03-18   91  	rcu_read_lock();
9a3702e1d161f5 David Howells 2024-03-18   92  
9a3702e1d161f5 David Howells 2024-03-18   93  	for (;;) {
9a3702e1d161f5 David Howells 2024-03-18   94  		xas_reset(&xas);
9a3702e1d161f5 David Howells 2024-03-18   95  		folio = xas_load(&xas);
9a3702e1d161f5 David Howells 2024-03-18   96  		if (xas_retry(&xas, folio))
9a3702e1d161f5 David Howells 2024-03-18   97  			continue;
9a3702e1d161f5 David Howells 2024-03-18   98  
9a3702e1d161f5 David Howells 2024-03-18  @99  		if (!folio || xa_is_value(folio))
9a3702e1d161f5 David Howells 2024-03-18  100  			kdebug("R=%08x: folio %lx (%llx) not present",
9a3702e1d161f5 David Howells 2024-03-18  101  			       wreq->debug_id, xas.xa_index, pos / PAGE_SIZE);
9a3702e1d161f5 David Howells 2024-03-18  102  		BUG_ON(!folio || xa_is_value(folio));
9a3702e1d161f5 David Howells 2024-03-18  103  
9a3702e1d161f5 David Howells 2024-03-18  104  		if (folio == xas_reload(&xas))
9a3702e1d161f5 David Howells 2024-03-18  105  			break;
9a3702e1d161f5 David Howells 2024-03-18  106  	}
9a3702e1d161f5 David Howells 2024-03-18  107  
9a3702e1d161f5 David Howells 2024-03-18  108  	rcu_read_unlock();
9a3702e1d161f5 David Howells 2024-03-18  109  
9a3702e1d161f5 David Howells 2024-03-18 @110  	if (WARN_ONCE(!folio_test_writeback(folio),
9a3702e1d161f5 David Howells 2024-03-18  111  		      "R=%08x: folio %lx is not under writeback\n",
9a3702e1d161f5 David Howells 2024-03-18  112  		      wreq->debug_id, folio->index)) {
9a3702e1d161f5 David Howells 2024-03-18  113  		trace_netfs_folio(folio, netfs_folio_trace_not_under_wback);
9a3702e1d161f5 David Howells 2024-03-18  114  	}
9a3702e1d161f5 David Howells 2024-03-18  115  	return folio;
9a3702e1d161f5 David Howells 2024-03-18  116  }
9a3702e1d161f5 David Howells 2024-03-18  117  

:::::: The code at line 110 was first introduced by commit
:::::: 9a3702e1d161f5b03a7b42122f9f693af1144fc8 netfs: New writeback implementation

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
