Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52757393DEF
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Aug 2025 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755853174; cv=none; b=Wa/i8P8QT2tTmU70beXE5B7K6BYKa/KNIdjE8sc4YfVRh28bnb2RMAeuyWS3kD10N1QHHIJ3FpWlvli8Y8GOG/2fGq8Zqx3/8oxRh3OUAJRFNk+gX3fY3k+paqTWMUTmyNQjYggXSC3M3Z54NmSaDCdsWQ/zsV9e453LmUpanaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755853174; c=relaxed/simple;
	bh=ui2fHPdm6ODURZudyuo+4cm506h7eU9ny13PHxbiHWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gAzc9+8OTP1SXBRpPvHgU7skeLgcttCxR/OLLopuorYfmx8+XzCS9aGNZtCPBIaYwSWaGh5/Hc/g/U1Jv45lFkBpX6FjGmuMLQjIBEkztVwVga9WA4fJnV9L3d6U3HaSHkMEqWNwm3Q74JnGHr914BxOCkaUY3jLed7wpa/Mjmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eW8ut3FT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eW8ut3FT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755853172; x=1787389172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ui2fHPdm6ODURZudyuo+4cm506h7eU9ny13PHxbiHWc=;
  b=eW8ut3FTurJQdfbdrZMj21HckQx4QcMA1+TvUET5ns9icXWQL6yvYFzG
   ZPcVPX2BECy4hrEZH4dGo2k5d+42253ZaHLIT10PzG7WujEIJOFkQ4NEl
   ZHDGQ6rA8iOp/3Dj4aQKhUTW7pVen/4lV5X3q33otZkU65koASuKHcBCj
   2H8t9SVKXXjupPoRuoQk4LPwOPHIY1nYJ0vIxQODzYPc1XUEWexuJg/P8
   UcEkBg/UFSBGkkrEv26RhW7IwgOKQ1FcZmxy+qxKjgiof9R0R1Mogzoys
   yiK1AIpIPUKlqx9RK5r+9md3Jab6Y6y/a9fVmSvYoVzrth9jNT3iaHT/J
   g==;
X-CSE-ConnectionGUID: Q19T4VtLRgi61RW2NgtYeA==
X-CSE-MsgGUID: thm2mUcTRuqd9rpR6rBm9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58082257"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="58082257"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 01:59:31 -0700
X-CSE-ConnectionGUID: 72+0GBNrSP6RYfraByu1OA==
X-CSE-MsgGUID: heZfx7kMQ6ukqlNC9oBYTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="172924083"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Aug 2025 01:59:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upNcN-000L5z-2a;
	Fri, 22 Aug 2025 08:59:27 +0000
Date: Fri, 22 Aug 2025 16:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cel:direct-io 41/42] fs/nfsd/vfs.c:1604 nfsd_vfs_write() error:
 uninitialized symbol 'host_err'.
Message-ID: <202508221657.KquEut7v-lkp@intel.com>
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
TO: Mike Snitzer <snitzer@kernel.org>
CC: Chuck Lever <chuck.lever@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux direct-io
head:   92412856552702194ad36dfc9da5fc649fab1b63
commit: 98603b4ed8dc8cdf39f778b65c5f3d641cca5d73 [41/42] NFSD: issue WRITEs using O_DIRECT even if IO is misaligned
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250822 (https://download.01.org/0day-ci/archive/20250822/202508221657.KquEut7v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508221657.KquEut7v-lkp@intel.com/

smatch warnings:
fs/nfsd/vfs.c:1604 nfsd_vfs_write() error: uninitialized symbol 'host_err'.

vim +/host_err +1604 fs/nfsd/vfs.c

98603b4ed8dc8c Mike Snitzer      2025-08-15  1521  
f2e597353d50f0 Chuck Lever       2025-05-09  1522  /**
f2e597353d50f0 Chuck Lever       2025-05-09  1523   * nfsd_vfs_write - write data to an already-open file
f2e597353d50f0 Chuck Lever       2025-05-09  1524   * @rqstp: RPC execution context
f2e597353d50f0 Chuck Lever       2025-05-09  1525   * @fhp: File handle of file to write into
f2e597353d50f0 Chuck Lever       2025-05-09  1526   * @nf: An open file matching @fhp
f2e597353d50f0 Chuck Lever       2025-05-09  1527   * @offset: Byte offset of start
f2e597353d50f0 Chuck Lever       2025-05-09  1528   * @payload: xdr_buf containing the write payload
f2e597353d50f0 Chuck Lever       2025-05-09  1529   * @cnt: IN: number of bytes to write, OUT: number of bytes actually written
f2e597353d50f0 Chuck Lever       2025-05-09  1530   * @stable: An NFS stable_how value
f2e597353d50f0 Chuck Lever       2025-05-09  1531   * @verf: NFS WRITE verifier
f2e597353d50f0 Chuck Lever       2025-05-09  1532   *
f2e597353d50f0 Chuck Lever       2025-05-09  1533   * Upon return, caller must invoke fh_put on @fhp.
f2e597353d50f0 Chuck Lever       2025-05-09  1534   *
f2e597353d50f0 Chuck Lever       2025-05-09  1535   * Return values:
f2e597353d50f0 Chuck Lever       2025-05-09  1536   *   An nfsstat value in network byte order.
f2e597353d50f0 Chuck Lever       2025-05-09  1537   */
af90f707fa6d54 Christoph Hellwig 2015-06-18  1538  __be32
f2e597353d50f0 Chuck Lever       2025-05-09  1539  nfsd_vfs_write(struct svc_rqst *rqstp, struct svc_fh *fhp,
f2e597353d50f0 Chuck Lever       2025-05-09  1540  	       struct nfsd_file *nf, loff_t offset,
f2e597353d50f0 Chuck Lever       2025-05-09  1541  	       const struct xdr_buf *payload, unsigned long *cnt,
f2e597353d50f0 Chuck Lever       2025-05-09  1542  	       int stable, __be32 *verf)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1543  {
fb7622c2dbd1aa Chuck Lever       2021-12-28  1544  	struct nfsd_net		*nn = net_generic(SVC_NET(rqstp), nfsd_net_id);
16f8f894108270 Trond Myklebust   2020-01-06  1545  	struct file		*file = nf->nf_file;
01cbf3853959fe Trond Myklebust   2020-11-30  1546  	struct super_block	*sb = file_inode(file)->i_sb;
3f3503adb3328e Chuck Lever       2025-06-13  1547  	struct kiocb		kiocb;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1548  	struct svc_export	*exp;
555dbf1a9aac6d Trond Myklebust   2021-12-18  1549  	errseq_t		since;
d890be159a7139 Chuck Lever       2018-03-27  1550  	__be32			nfserr;
6264d69d7df654 Al Viro           2006-10-19  1551  	int			host_err;
01cbf3853959fe Trond Myklebust   2020-11-30  1552  	unsigned long		exp_op_flags = 0;
8658452e4a588d NeilBrown         2014-05-12  1553  	unsigned int		pflags = current->flags;
01cbf3853959fe Trond Myklebust   2020-11-30  1554  	bool			restore_flags = false;
f2e597353d50f0 Chuck Lever       2025-05-09  1555  	unsigned int		nvecs;
8658452e4a588d NeilBrown         2014-05-12  1556  
d890be159a7139 Chuck Lever       2018-03-27  1557  	trace_nfsd_write_opened(rqstp, fhp, offset, *cnt);
d890be159a7139 Chuck Lever       2018-03-27  1558  
01cbf3853959fe Trond Myklebust   2020-11-30  1559  	if (sb->s_export_op)
01cbf3853959fe Trond Myklebust   2020-11-30  1560  		exp_op_flags = sb->s_export_op->flags;
01cbf3853959fe Trond Myklebust   2020-11-30  1561  
01cbf3853959fe Trond Myklebust   2020-11-30  1562  	if (test_bit(RQ_LOCAL, &rqstp->rq_flags) &&
01cbf3853959fe Trond Myklebust   2020-11-30  1563  	    !(exp_op_flags & EXPORT_OP_REMOTE_FS)) {
8658452e4a588d NeilBrown         2014-05-12  1564  		/*
a37b0715ddf300 NeilBrown         2020-06-01  1565  		 * We want throttling in balance_dirty_pages()
a37b0715ddf300 NeilBrown         2020-06-01  1566  		 * and shrink_inactive_list() to only consider
a37b0715ddf300 NeilBrown         2020-06-01  1567  		 * the backingdev we are writing to, so that nfs to
8658452e4a588d NeilBrown         2014-05-12  1568  		 * localhost doesn't cause nfsd to lock up due to all
8658452e4a588d NeilBrown         2014-05-12  1569  		 * the client's dirty pages or its congested queue.
8658452e4a588d NeilBrown         2014-05-12  1570  		 */
a37b0715ddf300 NeilBrown         2020-06-01  1571  		current->flags |= PF_LOCAL_THROTTLE;
01cbf3853959fe Trond Myklebust   2020-11-30  1572  		restore_flags = true;
01cbf3853959fe Trond Myklebust   2020-11-30  1573  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1574  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1575  	exp = fhp->fh_export;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1576  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1577  	if (!EX_ISSYNC(exp))
54bbb7d206db78 Kinglong Mee      2016-12-31  1578  		stable = NFS_UNSTABLE;
3f3503adb3328e Chuck Lever       2025-06-13  1579  	init_sync_kiocb(&kiocb, file);
3f3503adb3328e Chuck Lever       2025-06-13  1580  	kiocb.ki_pos = offset;
c689bdd3bffad8 NeilBrown         2024-07-26  1581  	if (stable && !fhp->fh_use_wgather)
3f3503adb3328e Chuck Lever       2025-06-13  1582  		kiocb.ki_flags |= IOCB_DSYNC;
24368aad47dc65 Christoph Hellwig 2016-04-07  1583  
1969823caf1635 Chuck Lever       2025-05-06  1584  	nvecs = xdr_buf_to_bvec(rqstp->rq_bvec, rqstp->rq_maxpages, payload);
98603b4ed8dc8c Mike Snitzer      2025-08-15  1585  
555dbf1a9aac6d Trond Myklebust   2021-12-18  1586  	since = READ_ONCE(file->f_wb_err);
f11ad7aa653130 Chuck Lever       2021-12-28  1587  	if (verf)
3988a57885eeac Chuck Lever       2021-12-30  1588  		nfsd_copy_write_verifier(verf, nn);
629c1dcc1e94e0 Mike Snitzer      2025-08-15  1589  
629c1dcc1e94e0 Mike Snitzer      2025-08-15  1590  	switch (nfsd_io_cache_write) {
629c1dcc1e94e0 Mike Snitzer      2025-08-15  1591  	case NFSD_IO_DIRECT:
98603b4ed8dc8c Mike Snitzer      2025-08-15  1592  		host_err = nfsd_issue_write_dio(rqstp, fhp, nf, offset,
98603b4ed8dc8c Mike Snitzer      2025-08-15  1593  						nvecs, cnt, &kiocb);
629c1dcc1e94e0 Mike Snitzer      2025-08-15  1594  		break;
629c1dcc1e94e0 Mike Snitzer      2025-08-15  1595  	case NFSD_IO_DONTCACHE:
629c1dcc1e94e0 Mike Snitzer      2025-08-15  1596  		kiocb.ki_flags |= IOCB_DONTCACHE;
629c1dcc1e94e0 Mike Snitzer      2025-08-15  1597  		fallthrough;
629c1dcc1e94e0 Mike Snitzer      2025-08-15  1598  	case NFSD_IO_UNSPECIFIED:
629c1dcc1e94e0 Mike Snitzer      2025-08-15  1599  	case NFSD_IO_BUFFERED:
98603b4ed8dc8c Mike Snitzer      2025-08-15  1600  		host_err = nfsd_issue_write_buffered(rqstp, file,
98603b4ed8dc8c Mike Snitzer      2025-08-15  1601  						nvecs, cnt, &kiocb);
629c1dcc1e94e0 Mike Snitzer      2025-08-15  1602  		break;
629c1dcc1e94e0 Mike Snitzer      2025-08-15  1603  	}
7bf94c6ba9fb29 Trond Myklebust   2020-01-06 @1604  	if (host_err < 0) {
1b2021bdeeca12 Trond Myklebust   2023-09-11  1605  		commit_reset_write_verifier(nn, rqstp, host_err);
e4636d535e3276 J. Bruce Fields   2009-06-15  1606  		goto out_nfserr;
7bf94c6ba9fb29 Trond Myklebust   2020-01-06  1607  	}
4b14885411f74b Josef Bacik       2024-01-26  1608  	nfsd_stats_io_write_add(nn, exp, *cnt);
2a12a9d7814631 Eric Paris        2009-12-17  1609  	fsnotify_modify(file);
555dbf1a9aac6d Trond Myklebust   2021-12-18  1610  	host_err = filemap_check_wb_err(file->f_mapping, since);
555dbf1a9aac6d Trond Myklebust   2021-12-18  1611  	if (host_err < 0)
555dbf1a9aac6d Trond Myklebust   2021-12-18  1612  		goto out_nfserr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1613  
c689bdd3bffad8 NeilBrown         2024-07-26  1614  	if (stable && fhp->fh_use_wgather) {
d911df7b8d44de J. Bruce Fields   2009-06-15  1615  		host_err = wait_for_concurrent_writes(file);
1b2021bdeeca12 Trond Myklebust   2023-09-11  1616  		if (host_err < 0)
1b2021bdeeca12 Trond Myklebust   2023-09-11  1617  			commit_reset_write_verifier(nn, rqstp, host_err);
bbf2f098838aa8 Trond Myklebust   2019-09-02  1618  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1619  
e4636d535e3276 J. Bruce Fields   2009-06-15  1620  out_nfserr:
d890be159a7139 Chuck Lever       2018-03-27  1621  	if (host_err >= 0) {
d890be159a7139 Chuck Lever       2018-03-27  1622  		trace_nfsd_write_io_done(rqstp, fhp, offset, *cnt);
d890be159a7139 Chuck Lever       2018-03-27  1623  		nfserr = nfs_ok;
d890be159a7139 Chuck Lever       2018-03-27  1624  	} else {
d890be159a7139 Chuck Lever       2018-03-27  1625  		trace_nfsd_write_err(rqstp, fhp, offset, host_err);
d890be159a7139 Chuck Lever       2018-03-27  1626  		nfserr = nfserrno(host_err);
d890be159a7139 Chuck Lever       2018-03-27  1627  	}
01cbf3853959fe Trond Myklebust   2020-11-30  1628  	if (restore_flags)
a37b0715ddf300 NeilBrown         2020-06-01  1629  		current_restore_flags(pflags, PF_LOCAL_THROTTLE);
d890be159a7139 Chuck Lever       2018-03-27  1630  	return nfserr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1631  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1632  

:::::: The code at line 1604 was first introduced by commit
:::::: 7bf94c6ba9fb291bd28fac3228553cb305bfc92a nfsd: Update the boot verifier on stable writes too.

:::::: TO: Trond Myklebust <trondmy@gmail.com>
:::::: CC: J. Bruce Fields <bfields@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
