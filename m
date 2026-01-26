Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98263002D1
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 11:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428303; cv=none; b=g9hpSX0zd39VWg1kxdNtB5FFry1KX/LZjDNdwAtAjsxQcoh2mTT69VYpowEoxxshfy09XYeZTI81h9Z3/v6R+fqnyBNK00adNMZYILxaf+8xzPqPiHnOvZ4X/gx5kxsFQfptrQonwa33DUfST5+Hii2PRKvl96CJsU8p9KFvG+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428303; c=relaxed/simple;
	bh=zN6h2x9zbgWCXmRpGBVm3MXIFqfD2bOsocq++C7jYHI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sjuVDZDzAIEh769InLg5jZ/WvpDZcgUGjKJk9qgLxxnpAYyOMxMPmEAs/JmO/e6qoweH6pI1FYU/7DiQJAYxkXPfKr5EwIq1rEsNrFdG47OHITy28QtdP/yw8YcwZ5cyuGXHhl0tN9ENZVbDKb7sLxxv2AuRpY5h1OuFfFVHs4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbW11nAy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbW11nAy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769428301; x=1800964301;
  h=date:from:to:cc:subject:message-id;
  bh=zN6h2x9zbgWCXmRpGBVm3MXIFqfD2bOsocq++C7jYHI=;
  b=RbW11nAy6VDAs4j1ky5x+VDAIGcN9gWvDvX54Coyk38ccsez7NaWH0Wh
   ySOVQz8gItvAzqwC7YtoChOlvBxm9/alQ6t3E5JZ9/xl4vDtQrplgpZeS
   FxjXkNI/6L6qQQOgvshU24bCMob5RupR0A/w8n9wdv5DbcelELx4T96tQ
   0OFPJMAEuuT7s37z5jG2T7uTsHmcfQATSFvOXxxEfS8/+sNxiyprSHEnR
   3a+nvl+jV3j6rAWulZjc/e3V1QMQFhWg6ATVIGtS3jbJWArBDN3tlf5wY
   vwASH8JmNeA6+0fDQoI6oMUpfk4bPIvqrpQ0wo1iNPJobfjoF5QiaLhLU
   A==;
X-CSE-ConnectionGUID: Gf7fg8wGRDKp/aU+4N30hQ==
X-CSE-MsgGUID: ogeRnDWnQ4ueWLAAyiEY8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70762190"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70762190"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 03:51:41 -0800
X-CSE-ConnectionGUID: uMpW+GUTSU+vIKeDcFAPgg==
X-CSE-MsgGUID: X7EsUh1DRr29q99Q+/PVsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="238913068"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jan 2026 03:51:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkL85-00000000XFe-2y4z;
	Mon, 26 Jan 2026 11:51:37 +0000
Date: Mon, 26 Jan 2026 19:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 467/799]
 fs/bcachefs/vfs/buffered.c:688 __bch2_writepage() error: we previously
 assumed 'w->io' could be null (see line 682)
Message-ID: <202601261902.BoPowVPY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 221177ea260493d2314aa23273a9bc7fe93529c5 [467/799] bcachefs: move vfs-specific code to vfs/
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-r073-20260126 (https://download.01.org/0day-ci/archive/20260126/202601261902.BoPowVPY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601261902.BoPowVPY-lkp@intel.com/

smatch warnings:
fs/bcachefs/vfs/buffered.c:688 __bch2_writepage() error: we previously assumed 'w->io' could be null (see line 682)

vim +688 fs/bcachefs/vfs/buffered.c

f95b0056f744f1 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2025-09-06  569  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  570  static int __bch2_writepage(struct folio *folio,
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  571  			    struct writeback_control *wbc,
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  572  			    void *data)
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  573  {
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  574  	struct bch_inode_info *inode = to_bch_ei(folio->mapping->host);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  575  	struct bch_fs *c = inode->v.i_sb->s_fs_info;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  576  	struct bch_writepage_state *w = data;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  577  	struct bch_folio *s;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  578  	unsigned i, offset, f_sectors, nr_replicas_this_write = U32_MAX;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  579  	loff_t i_size = i_size_read(&inode->v);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  580  	int ret;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  581  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  582  	EBUG_ON(!folio_test_uptodate(folio));
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  583  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  584  	/* Is the folio fully inside i_size? */
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  585  	if (folio_end_pos(folio) <= i_size)
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  586  		goto do_io;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  587  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  588  	/* Is the folio fully outside i_size? (truncate in progress) */
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  589  	if (folio_pos(folio) >= i_size) {
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  590  		folio_unlock(folio);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  591  		return 0;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  592  	}
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  593  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  594  	/*
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  595  	 * The folio straddles i_size.  It must be zeroed out on each and every
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  596  	 * writepage invocation because it may be mmapped.  "A file is mapped
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  597  	 * in multiples of the folio size.  For a file that is not a multiple of
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  598  	 * the  folio size, the remaining memory is zeroed when mapped, and
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  599  	 * writes to that region are not written out to the file."
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  600  	 */
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  601  	folio_zero_segment(folio,
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  602  			   i_size - folio_pos(folio),
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  603  			   folio_size(folio));
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  604  do_io:
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  605  	f_sectors = folio_sectors(folio);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  606  	s = bch2_folio(folio);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  607  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  608  	if (f_sectors > w->tmp_sectors) {
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  609  		kfree(w->tmp);
47cdc7b14417a4 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2024-08-17  610  		w->tmp = kcalloc(f_sectors, sizeof(struct bch_folio_sector), GFP_NOFS|__GFP_NOFAIL);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  611  		w->tmp_sectors = f_sectors;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  612  	}
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  613  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  614  	/*
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  615  	 * Things get really hairy with errors during writeback:
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  616  	 */
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  617  	ret = bch2_get_folio_disk_reservation(c, inode, folio, false);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  618  	BUG_ON(ret);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  619  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  620  	/* Before unlocking the page, get copy of reservations: */
8d421eab46649e fs/bcachefs/fs-io-buffered.c Kent Overstreet 2025-07-14  621  	scoped_guard(spinlock, &s->lock) {
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  622  		memcpy(w->tmp, s->s, sizeof(struct bch_folio_sector) * f_sectors);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  623  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  624  		for (i = 0; i < f_sectors; i++) {
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  625  			if (s->s[i].state < SECTOR_dirty)
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  626  				continue;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  627  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  628  			nr_replicas_this_write =
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  629  				min_t(unsigned, nr_replicas_this_write,
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  630  				      s->s[i].nr_replicas +
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  631  				      s->s[i].replicas_reserved);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  632  		}
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  633  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  634  		for (i = 0; i < f_sectors; i++) {
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  635  			if (s->s[i].state < SECTOR_dirty)
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  636  				continue;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  637  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  638  			s->s[i].nr_replicas = w->opts.compression
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  639  				? 0 : nr_replicas_this_write;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  640  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  641  			s->s[i].replicas_reserved = 0;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  642  			bch2_folio_sector_set(folio, s, i, SECTOR_allocated);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  643  		}
8d421eab46649e fs/bcachefs/fs-io-buffered.c Kent Overstreet 2025-07-14  644  	}
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  645  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  646  	BUG_ON(atomic_read(&s->write_count));
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  647  	atomic_set(&s->write_count, 1);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  648  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  649  	BUG_ON(folio_test_writeback(folio));
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  650  	folio_start_writeback(folio);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  651  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  652  	folio_unlock(folio);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  653  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  654  	offset = 0;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  655  	while (1) {
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  656  		unsigned sectors = 0, dirty_sectors = 0, reserved_sectors = 0;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  657  		u64 sector;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  658  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  659  		while (offset < f_sectors &&
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  660  		       w->tmp[offset].state < SECTOR_dirty)
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  661  			offset++;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  662  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  663  		if (offset == f_sectors)
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  664  			break;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  665  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  666  		while (offset + sectors < f_sectors &&
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  667  		       w->tmp[offset + sectors].state >= SECTOR_dirty) {
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  668  			reserved_sectors += w->tmp[offset + sectors].replicas_reserved;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  669  			dirty_sectors += w->tmp[offset + sectors].state == SECTOR_dirty;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  670  			sectors++;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  671  		}
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  672  		BUG_ON(!sectors);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  673  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  674  		sector = folio_sector(folio) + offset;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  675  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  676  		if (w->io &&
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  677  		    (w->io->op.res.nr_replicas != nr_replicas_this_write ||
2a4e7497604b20 fs/bcachefs/fs-io-buffered.c Brian Foster    2023-11-03  678  		     bch_io_full(w->io, sectors << 9) ||
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  679  		     bio_end_sector(&w->io->op.wbio.bio) != sector))
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  680  			bch2_writepage_do_io(w);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  681  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03 @682  		if (!w->io)
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  683  			bch2_writepage_io_alloc(c, wbc, w, inode, sector,
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  684  						nr_replicas_this_write);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  685  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  686  		atomic_inc(&s->write_count);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  687  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03 @688  		BUG_ON(inode != w->io->inode);
8ff282097a7d6c fs/bcachefs/fs-io-buffered.c Youling Tang    2025-06-05  689  		bio_add_folio_nofail(&w->io->op.wbio.bio, folio,
8ff282097a7d6c fs/bcachefs/fs-io-buffered.c Youling Tang    2025-06-05  690  				     sectors << 9, offset << 9);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  691  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  692  		w->io->op.res.sectors += reserved_sectors;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  693  		w->io->op.i_sectors_delta -= dirty_sectors;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  694  		w->io->op.new_i_size = i_size;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  695  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  696  		offset += sectors;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  697  	}
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  698  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  699  	if (atomic_dec_and_test(&s->write_count))
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  700  		folio_end_writeback(folio);
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  701  
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  702  	return 0;
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  703  }
dbbfca9f41e869 fs/bcachefs/fs-io-buffered.c Kent Overstreet 2023-08-03  704  

:::::: The code at line 688 was first introduced by commit
:::::: dbbfca9f41e86903501dded3fd494e1a56f3c310 bcachefs: Split up fs-io.[ch]

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
