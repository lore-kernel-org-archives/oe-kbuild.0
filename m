Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27DF16C698
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Aug 2024 09:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723196172; cv=none; b=USXESX5W0lTFqBdwgN4JPSn+GDQxrwddbLl/E1iNiMfnyVxWvAck3dEyLQpyvtHyOH2KFzA/zenDyl4p2Hc0DBt9AxOW0frIiobUMDA2axWv1SkF+CzchaJejeoLNaFWcWdr9A3PPwV7Log7zU7LWo91sNoltZsWtUVNKnyJWt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723196172; c=relaxed/simple;
	bh=1P6zQDhJLRhnxOwh/p0n8CisGaceHVG81Qdf3OCh4PU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oSjyzfaVubJ3xRvi0HJsOSZFZsYepCVoNMAFWWnyrR+zfsb7d2ogOZLcdMsM9kxePeOxfDcWTvNLIyNJ2rZ0o30EF7TK8Y32UMDH4tofG+z1/yrMDPns81Pr+HCqL3S2cXEApC6qSWgC2sYlyOcgw/K3uaDRyTmgpCKjpA9XihU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6GfDfyk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6GfDfyk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723196171; x=1754732171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1P6zQDhJLRhnxOwh/p0n8CisGaceHVG81Qdf3OCh4PU=;
  b=U6GfDfykdBEhSLndS1NHkljuL+HAOFFHsgbj44Ue9574JpvEIBN864bF
   Cc5FpoA/2iP2u8nYi2iqoEjx1wKlVDqpOo6qwyeqyq53LcjEuQYyQS9Ez
   gEDYLm8jDRlkRh04uuRk4F5JxtQcbX8LZDpaIrZDggfg5KYROt2TtN8ai
   k6fGvI04yJLFF+NVgP2z3kvAGep9cAdQA+g9sXgs/eKMxGD0cdc2fJp2z
   aj/T81XGvBxXQp4welxnMAlg1TEaZuWxzurSKT603QJY2C2J5lNRKD3IA
   V2WwpxAlX6z8hKhrDreyJ79pRP+yfYShCsa3MSY3sZq3I+4UFHlqoaZOb
   g==;
X-CSE-ConnectionGUID: pYsL2C/mQrOwIArDrPZtSQ==
X-CSE-MsgGUID: LTmVE+vwQv+uEOwv8Lxl6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31988618"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="31988618"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 02:36:11 -0700
X-CSE-ConnectionGUID: Tvp6PI2jQomBAuhEp4OLFw==
X-CSE-MsgGUID: QYWzmmF+T/6pGl2jUL6xXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="57487490"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 09 Aug 2024 02:36:09 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scM2Z-0007lq-0V;
	Fri, 09 Aug 2024 09:36:07 +0000
Date: Fri, 9 Aug 2024 17:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:netfs-fixes 2/2] fs/netfs/buffered_read.c:56
 netfs_rreq_unlock_folios_pgpriv2() warn: can 'subreq' even be NULL?
Message-ID: <202408091706.FJybq3UD-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-fixes
head:   c5845b09875e53a9eb871d348593286ea5a69322
commit: b8a80b5ec3422a4c5ff5ca20f8eef24816fad840 [2/2] netfs: Fix handling of USE_PGPRIV2 and WRITE_TO_CACHE flags
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240808 (https://download.01.org/0day-ci/archive/20240809/202408091706.FJybq3UD-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408091706.FJybq3UD-lkp@intel.com/

New smatch warnings:
fs/netfs/buffered_read.c:56 netfs_rreq_unlock_folios_pgpriv2() warn: can 'subreq' even be NULL?

Old smatch warnings:
fs/netfs/buffered_read.c:161 netfs_rreq_unlock_folios() warn: can 'subreq' even be NULL?

vim +/subreq +56 fs/netfs/buffered_read.c

16211268fcb366 David Howells 2022-03-01   11  
b8a80b5ec3422a David Howells 2024-08-07   12  /*
b8a80b5ec3422a David Howells 2024-08-07   13   * [DEPRECATED] Unlock the folios in a read operation for when the filesystem
b8a80b5ec3422a David Howells 2024-08-07   14   * is using PG_private_2 and direct writing to the cache from here rather than
b8a80b5ec3422a David Howells 2024-08-07   15   * marking the page for writeback.
b8a80b5ec3422a David Howells 2024-08-07   16   *
b8a80b5ec3422a David Howells 2024-08-07   17   * Note that we don't touch folio->private in this code.
b8a80b5ec3422a David Howells 2024-08-07   18   */
b8a80b5ec3422a David Howells 2024-08-07   19  static void netfs_rreq_unlock_folios_pgpriv2(struct netfs_io_request *rreq)
b8a80b5ec3422a David Howells 2024-08-07   20  {
b8a80b5ec3422a David Howells 2024-08-07   21  	struct netfs_io_subrequest *subreq;
b8a80b5ec3422a David Howells 2024-08-07   22  	struct folio *folio;
b8a80b5ec3422a David Howells 2024-08-07   23  	pgoff_t start_page = rreq->start / PAGE_SIZE;
b8a80b5ec3422a David Howells 2024-08-07   24  	pgoff_t last_page = ((rreq->start + rreq->len) / PAGE_SIZE) - 1;
b8a80b5ec3422a David Howells 2024-08-07   25  	size_t account = 0;
b8a80b5ec3422a David Howells 2024-08-07   26  	bool subreq_failed = false;
b8a80b5ec3422a David Howells 2024-08-07   27  
b8a80b5ec3422a David Howells 2024-08-07   28  	XA_STATE(xas, &rreq->mapping->i_pages, start_page);
b8a80b5ec3422a David Howells 2024-08-07   29  
b8a80b5ec3422a David Howells 2024-08-07   30  	/* Walk through the pagecache and the I/O request lists simultaneously.
b8a80b5ec3422a David Howells 2024-08-07   31  	 * We may have a mixture of cached and uncached sections and we only
b8a80b5ec3422a David Howells 2024-08-07   32  	 * really want to write out the uncached sections.  This is slightly
b8a80b5ec3422a David Howells 2024-08-07   33  	 * complicated by the possibility that we might have huge pages with a
b8a80b5ec3422a David Howells 2024-08-07   34  	 * mixture inside.
b8a80b5ec3422a David Howells 2024-08-07   35  	 */
b8a80b5ec3422a David Howells 2024-08-07   36  	subreq = list_first_entry(&rreq->subrequests,
b8a80b5ec3422a David Howells 2024-08-07   37  				  struct netfs_io_subrequest, rreq_link);
b8a80b5ec3422a David Howells 2024-08-07   38  	subreq_failed = (subreq->error < 0);
b8a80b5ec3422a David Howells 2024-08-07   39  
b8a80b5ec3422a David Howells 2024-08-07   40  	trace_netfs_rreq(rreq, netfs_rreq_trace_unlock_pgpriv2);
b8a80b5ec3422a David Howells 2024-08-07   41  
b8a80b5ec3422a David Howells 2024-08-07   42  	rcu_read_lock();
b8a80b5ec3422a David Howells 2024-08-07   43  	xas_for_each(&xas, folio, last_page) {
b8a80b5ec3422a David Howells 2024-08-07   44  		loff_t pg_end;
b8a80b5ec3422a David Howells 2024-08-07   45  		bool pg_failed = false;
b8a80b5ec3422a David Howells 2024-08-07   46  		bool folio_started = false;
b8a80b5ec3422a David Howells 2024-08-07   47  
b8a80b5ec3422a David Howells 2024-08-07   48  		if (xas_retry(&xas, folio))
b8a80b5ec3422a David Howells 2024-08-07   49  			continue;
b8a80b5ec3422a David Howells 2024-08-07   50  
b8a80b5ec3422a David Howells 2024-08-07   51  		pg_end = folio_pos(folio) + folio_size(folio) - 1;
b8a80b5ec3422a David Howells 2024-08-07   52  
b8a80b5ec3422a David Howells 2024-08-07   53  		for (;;) {
b8a80b5ec3422a David Howells 2024-08-07   54  			loff_t sreq_end;
b8a80b5ec3422a David Howells 2024-08-07   55  
b8a80b5ec3422a David Howells 2024-08-07  @56  			if (!subreq) {
b8a80b5ec3422a David Howells 2024-08-07   57  				pg_failed = true;
b8a80b5ec3422a David Howells 2024-08-07   58  				break;
b8a80b5ec3422a David Howells 2024-08-07   59  			}
b8a80b5ec3422a David Howells 2024-08-07   60  
b8a80b5ec3422a David Howells 2024-08-07   61  			if (!folio_started &&
b8a80b5ec3422a David Howells 2024-08-07   62  			    test_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags) &&
b8a80b5ec3422a David Howells 2024-08-07   63  			    fscache_operation_valid(&rreq->cache_resources)) {
b8a80b5ec3422a David Howells 2024-08-07   64  				trace_netfs_folio(folio, netfs_folio_trace_copy_to_cache);
b8a80b5ec3422a David Howells 2024-08-07   65  				folio_start_private_2(folio);
b8a80b5ec3422a David Howells 2024-08-07   66  				folio_started = true;
b8a80b5ec3422a David Howells 2024-08-07   67  			}
b8a80b5ec3422a David Howells 2024-08-07   68  
b8a80b5ec3422a David Howells 2024-08-07   69  			pg_failed |= subreq_failed;
b8a80b5ec3422a David Howells 2024-08-07   70  			sreq_end = subreq->start + subreq->len - 1;
b8a80b5ec3422a David Howells 2024-08-07   71  			if (pg_end < sreq_end)
b8a80b5ec3422a David Howells 2024-08-07   72  				break;
b8a80b5ec3422a David Howells 2024-08-07   73  
b8a80b5ec3422a David Howells 2024-08-07   74  			account += subreq->transferred;
b8a80b5ec3422a David Howells 2024-08-07   75  			if (!list_is_last(&subreq->rreq_link, &rreq->subrequests)) {
b8a80b5ec3422a David Howells 2024-08-07   76  				subreq = list_next_entry(subreq, rreq_link);
b8a80b5ec3422a David Howells 2024-08-07   77  				subreq_failed = (subreq->error < 0);
b8a80b5ec3422a David Howells 2024-08-07   78  			} else {
b8a80b5ec3422a David Howells 2024-08-07   79  				subreq = NULL;
b8a80b5ec3422a David Howells 2024-08-07   80  				subreq_failed = false;
b8a80b5ec3422a David Howells 2024-08-07   81  			}
b8a80b5ec3422a David Howells 2024-08-07   82  
b8a80b5ec3422a David Howells 2024-08-07   83  			if (pg_end == sreq_end)
b8a80b5ec3422a David Howells 2024-08-07   84  				break;
b8a80b5ec3422a David Howells 2024-08-07   85  		}
b8a80b5ec3422a David Howells 2024-08-07   86  
b8a80b5ec3422a David Howells 2024-08-07   87  		if (!pg_failed) {
b8a80b5ec3422a David Howells 2024-08-07   88  			flush_dcache_folio(folio);
b8a80b5ec3422a David Howells 2024-08-07   89  			folio_mark_uptodate(folio);
b8a80b5ec3422a David Howells 2024-08-07   90  		}
b8a80b5ec3422a David Howells 2024-08-07   91  
b8a80b5ec3422a David Howells 2024-08-07   92  		if (!test_bit(NETFS_RREQ_DONT_UNLOCK_FOLIOS, &rreq->flags)) {
b8a80b5ec3422a David Howells 2024-08-07   93  			if (folio->index == rreq->no_unlock_folio &&
b8a80b5ec3422a David Howells 2024-08-07   94  			    test_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags))
b8a80b5ec3422a David Howells 2024-08-07   95  				_debug("no unlock");
b8a80b5ec3422a David Howells 2024-08-07   96  			else
b8a80b5ec3422a David Howells 2024-08-07   97  				folio_unlock(folio);
b8a80b5ec3422a David Howells 2024-08-07   98  		}
b8a80b5ec3422a David Howells 2024-08-07   99  	}
b8a80b5ec3422a David Howells 2024-08-07  100  	rcu_read_unlock();
b8a80b5ec3422a David Howells 2024-08-07  101  }
b8a80b5ec3422a David Howells 2024-08-07  102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
