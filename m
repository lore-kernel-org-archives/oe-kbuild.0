Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2783FE55
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 23:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727048118; cv=none; b=ORBr0OwMIUuAvFFJq+OoWQ2H4aJs5s//qcsJi6BW+AG2cJTvBUunqC5OfSA5B1vArpt/fnJIt790Z/kisaaMU5Vv2M3pSnxj+of14SarnmWtGkn6+C9wpYMFH039bmu83Eg/MEdoit8MPgGc0xx1oY8X70dACzWVZaQRD1wY4H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727048118; c=relaxed/simple;
	bh=nAkojZgpeycSi2A/fIbyHb8ardruLWxsQcNymKAfo84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gi1Do1Uz88k3+j2vaUIszpMprj+s6Vq26TIIAioqPccpvi8AItG4ZXUI6vp1tfGSP/uAz1vAycpHHoCZrNTkndlmiY+iiUuSvmosHbJ7+lSevSEHw13010fIBotsFe/CmDSWdEIFVOHy2Q1OAKGfIVOnhOUXV/H+X456K1h5YDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X55qPKwV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X55qPKwV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727048117; x=1758584117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nAkojZgpeycSi2A/fIbyHb8ardruLWxsQcNymKAfo84=;
  b=X55qPKwVgHH80f3nGKqgb9PinnndyJBCGzIlhML9T9uvtNmbrNeDQAP4
   5t4brJ0bMfW9hR5jRrNC23lBKEh8RrsAVhdOr8DfW8NIS+4M5SxXMFPJ0
   jz3gjloi7Q2tyl4H2DJcmObpViSiaCAoS9imKpchepKsu1HAWZL0D7NBC
   FbDCcZ6d+hJQzUVUL7qmuvKAse7Wb1pLwiDjpwAJxU+ZkCu16HAuC55Nj
   nqsxuOD+sDaGbPKpPW9VQz7dvTOMMv/1v7vtUMhDlE7TnuufIM1YvgaHO
   MQR1Jtz11PczWHtWqIstP14xmnscqI2BLj+V2/bJU61LHn7MT+08jQaw9
   w==;
X-CSE-ConnectionGUID: GcfkDVB8SgqHET6kM4AEtw==
X-CSE-MsgGUID: XgRnN4Z1Qb2mowNe1zDmDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26139214"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="26139214"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 16:35:16 -0700
X-CSE-ConnectionGUID: VKIb/VxdSiWJttiHIYm7VQ==
X-CSE-MsgGUID: etwOtqhxRhCl+FR3bsFfHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="71168799"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Sep 2024 16:35:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssW6i-000Gk0-2P;
	Sun, 22 Sep 2024 23:35:12 +0000
Date: Mon, 23 Sep 2024 07:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:netfs-writeback 11/13] fs/netfs/write_issue.c:874
 netfs_writeback_single() error: uninitialized symbol 'ret'.
Message-ID: <202409230717.8kiMw2CE-lkp@intel.com>
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
head:   1b8d06c4ea0b6eb74b52b9dadb866a92c0cc5b69
commit: 4a6aa57914e5623bcdcfb6ba8cd766b30f834514 [11/13] netfs: Add support for caching single monolithic objects such as AFS dirs
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240923 (https://download.01.org/0day-ci/archive/20240923/202409230717.8kiMw2CE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409230717.8kiMw2CE-lkp@intel.com/

smatch warnings:
fs/netfs/write_issue.c:874 netfs_writeback_single() error: uninitialized symbol 'ret'.

vim +/ret +874 fs/netfs/write_issue.c

4a6aa57914e562 David Howells 2024-09-20  804  
4a6aa57914e562 David Howells 2024-09-20  805  /**
4a6aa57914e562 David Howells 2024-09-20  806   * netfs_writeback_single - Write back a monolithic payload
4a6aa57914e562 David Howells 2024-09-20  807   * @mapping: The mapping to write from
4a6aa57914e562 David Howells 2024-09-20  808   * @wbc: Hints from the VM
4a6aa57914e562 David Howells 2024-09-20  809   * @iter: Data to write, must be ITER_FOLIOQ.
4a6aa57914e562 David Howells 2024-09-20  810   *
4a6aa57914e562 David Howells 2024-09-20  811   * Write a monolithic, non-pagecache object back to the server and/or
4a6aa57914e562 David Howells 2024-09-20  812   * the cache.
4a6aa57914e562 David Howells 2024-09-20  813   */
4a6aa57914e562 David Howells 2024-09-20  814  int netfs_writeback_single(struct address_space *mapping,
4a6aa57914e562 David Howells 2024-09-20  815  			   struct writeback_control *wbc,
4a6aa57914e562 David Howells 2024-09-20  816  			   struct iov_iter *iter)
4a6aa57914e562 David Howells 2024-09-20  817  {
4a6aa57914e562 David Howells 2024-09-20  818  	struct netfs_io_request *wreq;
4a6aa57914e562 David Howells 2024-09-20  819  	struct netfs_inode *ictx = netfs_inode(mapping->host);
4a6aa57914e562 David Howells 2024-09-20  820  	struct folio_queue *fq;
4a6aa57914e562 David Howells 2024-09-20  821  	size_t size = iov_iter_count(iter);
4a6aa57914e562 David Howells 2024-09-20  822  	int ret;
4a6aa57914e562 David Howells 2024-09-20  823  
4a6aa57914e562 David Howells 2024-09-20  824  	if (WARN_ON_ONCE(!iov_iter_is_folioq(iter)))
4a6aa57914e562 David Howells 2024-09-20  825  		return -EIO;
4a6aa57914e562 David Howells 2024-09-20  826  
4a6aa57914e562 David Howells 2024-09-20  827  	if (!mutex_trylock(&ictx->wb_lock)) {
4a6aa57914e562 David Howells 2024-09-20  828  		if (wbc->sync_mode == WB_SYNC_NONE) {
4a6aa57914e562 David Howells 2024-09-20  829  			netfs_stat(&netfs_n_wb_lock_skip);
4a6aa57914e562 David Howells 2024-09-20  830  			return 0;
4a6aa57914e562 David Howells 2024-09-20  831  		}
4a6aa57914e562 David Howells 2024-09-20  832  		netfs_stat(&netfs_n_wb_lock_wait);
4a6aa57914e562 David Howells 2024-09-20  833  		mutex_lock(&ictx->wb_lock);
4a6aa57914e562 David Howells 2024-09-20  834  	}
4a6aa57914e562 David Howells 2024-09-20  835  
4a6aa57914e562 David Howells 2024-09-20  836  	wreq = netfs_create_write_req(mapping, NULL, 0, NETFS_WRITEBACK_SINGLE);
4a6aa57914e562 David Howells 2024-09-20  837  	if (IS_ERR(wreq)) {
4a6aa57914e562 David Howells 2024-09-20  838  		ret = PTR_ERR(wreq);
4a6aa57914e562 David Howells 2024-09-20  839  		goto couldnt_start;
4a6aa57914e562 David Howells 2024-09-20  840  	}
4a6aa57914e562 David Howells 2024-09-20  841  
4a6aa57914e562 David Howells 2024-09-20  842  	trace_netfs_write(wreq, netfs_write_trace_writeback);
4a6aa57914e562 David Howells 2024-09-20  843  	netfs_stat(&netfs_n_wh_writepages);
4a6aa57914e562 David Howells 2024-09-20  844  
4a6aa57914e562 David Howells 2024-09-20  845  	if (__test_and_set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags))
4a6aa57914e562 David Howells 2024-09-20  846  		wreq->netfs_ops->begin_writeback(wreq);
4a6aa57914e562 David Howells 2024-09-20  847  
4a6aa57914e562 David Howells 2024-09-20  848  	for (fq = (struct folio_queue *)iter->folioq; fq; fq = fq->next) {
4a6aa57914e562 David Howells 2024-09-20  849  		for (int slot = 0; slot < folioq_count(fq); slot++) {
4a6aa57914e562 David Howells 2024-09-20  850  			struct folio *folio = folioq_folio(fq, slot);
4a6aa57914e562 David Howells 2024-09-20  851  			size_t part = umin(folioq_folio_size(fq, slot), size);
4a6aa57914e562 David Howells 2024-09-20  852  
4a6aa57914e562 David Howells 2024-09-20  853  			_debug("wbiter %lx %llx", folio->index, atomic64_read(&wreq->issued_to));
4a6aa57914e562 David Howells 2024-09-20  854  
4a6aa57914e562 David Howells 2024-09-20  855  			ret = netfs_write_folio_single(wreq, folio);
4a6aa57914e562 David Howells 2024-09-20  856  			if (ret < 0)
4a6aa57914e562 David Howells 2024-09-20  857  				goto stop;
4a6aa57914e562 David Howells 2024-09-20  858  			size -= part;
4a6aa57914e562 David Howells 2024-09-20  859  			if (size <= 0)
4a6aa57914e562 David Howells 2024-09-20  860  				goto stop;
4a6aa57914e562 David Howells 2024-09-20  861  		}
4a6aa57914e562 David Howells 2024-09-20  862  	}
4a6aa57914e562 David Howells 2024-09-20  863  
4a6aa57914e562 David Howells 2024-09-20  864  stop:
4a6aa57914e562 David Howells 2024-09-20  865  	for (int s = 0; s < NR_IO_STREAMS; s++)
4a6aa57914e562 David Howells 2024-09-20  866  		netfs_issue_write(wreq, &wreq->io_streams[s]);
4a6aa57914e562 David Howells 2024-09-20  867  	smp_wmb(); /* Write lists before ALL_QUEUED. */
4a6aa57914e562 David Howells 2024-09-20  868  	set_bit(NETFS_RREQ_ALL_QUEUED, &wreq->flags);
4a6aa57914e562 David Howells 2024-09-20  869  
4a6aa57914e562 David Howells 2024-09-20  870  	mutex_unlock(&ictx->wb_lock);
4a6aa57914e562 David Howells 2024-09-20  871  
4a6aa57914e562 David Howells 2024-09-20  872  	netfs_put_request(wreq, false, netfs_rreq_trace_put_return);
4a6aa57914e562 David Howells 2024-09-20  873  	_leave(" = %d", ret);
4a6aa57914e562 David Howells 2024-09-20 @874  	return ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
