Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD200225A34
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Nov 2025 18:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762022549; cv=none; b=dX1dgfe3ccqCADdtY9jYcYZih6+DkLep6U/n6t+6WqkSATafOTphB+nlZAW78lrhNUq3QQNrbWJED7saI4mE89F93gfXTu0RY3NvqdsqRD76xOUwd8BdGP2hW5HLaRVVfM1bkUSppndIMaMe1Yl+sVncQLs68NgneBIKlP2BXtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762022549; c=relaxed/simple;
	bh=hPRJ+ezxETbXDBjIfg7C8fIuN/JcTY9pkCD/aywoS08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QlgJDrBMqIItBq5hW17MBIA0Oi093kqEf6yJ94ITikN5ttEYYbIbKa1Dg3yc3qsuSpDtQacDOLsTpTFFZtZUvwG3/9XIOcj5RYYNzORkTz4BzKSG65g57pPEPdMYzbmMD63aeQDQ/giOPjhAvjQS0Kqald3VQsjovDom/slgnUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NljhANso; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NljhANso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762022547; x=1793558547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hPRJ+ezxETbXDBjIfg7C8fIuN/JcTY9pkCD/aywoS08=;
  b=NljhANsoId6wf0y8j9X8JJGCrNDZ2aC8V0qUo44x7K7r4kTCdmHZ9SE6
   iVSWEjfC+o6+mXs2ppED4eZDTbJpNtj/vXV9M1tzQ8ZC+izjGXV60Is9J
   JMEWQBcgHSPH0aQguWOV57DQYzcmR0PEiY4bfsfr7G3Qp28QsMCY+PeT7
   YzgzkxPTVsFkbT/EQdDXFwo1WzwSrYmlRPS9fMEcb+OlVd1uGJxvA+WQI
   aUMX9nWB6Z5qMCvd9KMxhtrb5ShiU9K3XluEwVDyP/g1YzymqHw+S5EvZ
   63ABTNdl45qy58STrRpb6xqWQuR55CdPj1kwadrp+tTMja1bJWmsETaa7
   w==;
X-CSE-ConnectionGUID: oqr/BHcBRF63wN676UAF/g==
X-CSE-MsgGUID: VjYS2XloRmyJUIT5E1vAkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="74450686"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="74450686"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 11:42:26 -0700
X-CSE-ConnectionGUID: o40avshbTleF+iZjVu+ZfQ==
X-CSE-MsgGUID: rypPUicXRiaEbK/S5TbpIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="187238877"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Nov 2025 11:42:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFGYR-000Oam-02;
	Sat, 01 Nov 2025 18:42:23 +0000
Date: Sun, 2 Nov 2025 02:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:vfs-6.19.iomap 6/7] fs/iomap/buffered-io.c:549
 iomap_readahead() error: uninitialized symbol 'cur_bytes_submitted'.
Message-ID: <202511020240.7BaHzzXG-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Joanne Koong <joannelkoong@gmail.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Christoph Hellwig <hch@lst.de>
CC: "Darrick J. Wong" <djwong@kernel.org>

Hi Joanne,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/brauner/linux.git vfs-6.19.iomap
head:   af1d9344fd42cc630d61158ec73b92525e581c5a
commit: edc460cf2d01698890488c7ea72290782b66b794 [6/7] iomap: rename bytes_pending/bytes_accounted to bytes_submitted/bytes_not_submitted
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: s390-randconfig-r072-20251101 (https://download.01.org/0day-ci/archive/20251102/202511020240.7BaHzzXG-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511020240.7BaHzzXG-lkp@intel.com/

smatch warnings:
fs/iomap/buffered-io.c:549 iomap_readahead() error: uninitialized symbol 'cur_bytes_submitted'.

vim +/cur_bytes_submitted +549 fs/iomap/buffered-io.c

afc51aaa22f26c Darrick J. Wong         2019-07-15  512  
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  513) /**
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  514)  * iomap_readahead - Attempt to read pages from a file.
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  515)  * @ops: The operations vector for the filesystem.
5c0691f94069e5 Joanne Koong            2025-09-25  516   * @ctx: The ctx used for issuing readahead.
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  517)  *
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  518)  * This function is for filesystems to call to implement their readahead
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  519)  * address_space operation.
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  520)  *
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  521)  * Context: The @ops callbacks may submit I/O (eg to read the addresses of
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  522)  * blocks from disc), and may wait for it.  The caller may be trying to
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  523)  * access a different page, and so sleeping excessively should be avoided.
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  524)  * It may allocate memory, but should avoid costly allocations.  This
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  525)  * function is called with memalloc_nofs set, so allocations will not cause
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  526)  * the filesystem to be reentered.
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  527)  */
5c0691f94069e5 Joanne Koong            2025-09-25  528  void iomap_readahead(const struct iomap_ops *ops,
5c0691f94069e5 Joanne Koong            2025-09-25  529  		struct iomap_read_folio_ctx *ctx)
afc51aaa22f26c Darrick J. Wong         2019-07-15  530  {
5c0691f94069e5 Joanne Koong            2025-09-25  531  	struct readahead_control *rac = ctx->rac;
f6d480006cea3f Christoph Hellwig       2021-08-10  532  	struct iomap_iter iter = {
f6d480006cea3f Christoph Hellwig       2021-08-10  533  		.inode	= rac->mapping->host,
f6d480006cea3f Christoph Hellwig       2021-08-10  534  		.pos	= readahead_pos(rac),
f6d480006cea3f Christoph Hellwig       2021-08-10  535  		.len	= readahead_length(rac),
f6d480006cea3f Christoph Hellwig       2021-08-10  536  	};
edc460cf2d0169 Joanne Koong            2025-10-28  537  	size_t cur_bytes_submitted;
afc51aaa22f26c Darrick J. Wong         2019-07-15  538  
f6d480006cea3f Christoph Hellwig       2021-08-10  539  	trace_iomap_readahead(rac->mapping->host, readahead_count(rac));
9e91c5728cab3d Christoph Hellwig       2019-10-17  540  
f6d480006cea3f Christoph Hellwig       2021-08-10  541  	while (iomap_iter(&iter, ops) > 0)
5c0691f94069e5 Joanne Koong            2025-09-25  542  		iter.status = iomap_readahead_iter(&iter, ctx,
edc460cf2d0169 Joanne Koong            2025-10-28  543  					&cur_bytes_submitted);
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  544) 
5c0691f94069e5 Joanne Koong            2025-09-25  545  	if (ctx->ops->submit_read)
5c0691f94069e5 Joanne Koong            2025-09-25  546  		ctx->ops->submit_read(ctx);
7588469b5ea4b6 Joanne Koong            2025-09-25  547  
5c0691f94069e5 Joanne Koong            2025-09-25  548  	if (ctx->cur_folio)
edc460cf2d0169 Joanne Koong            2025-10-28 @549  		iomap_read_end(ctx->cur_folio, cur_bytes_submitted);
afc51aaa22f26c Darrick J. Wong         2019-07-15  550  }
9d24a13a93d995 Matthew Wilcox (Oracle  2020-06-01  551) EXPORT_SYMBOL_GPL(iomap_readahead);
afc51aaa22f26c Darrick J. Wong         2019-07-15  552  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
