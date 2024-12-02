Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A575C2194B4
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150021; cv=none; b=OuIVIEQAJyLsJHFd/gjtmMYyJmyzO7RZiwpT83hICsTiYPly/PEpATTHigOyQqkM/GAN/V8+a+R0NJvoNM6scQNGed0RfyJfIVbf6ZWWPaAc47miei7rflytS8E8wnJNb4l+TsJi3sovMeUcOiKnaGUoAk00nVjVFafdbIzN8ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150021; c=relaxed/simple;
	bh=k54BxwMRyKjxKBI6MXQhsysuiB2HRs/RM9nBqKAwKSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aTp5+Nyf1JO3RWDPUkJt33S2wTgKNO14LSxpbTyVBv57vrUWO2/uODJfTjskX093I/dv5r5sCfOcZ20fOpY/pcyid703wAbmXcXdR+D3V6xgNGaKQRzVzDPXgf8FUpQG321h4a71MN5Rt11BE/3eqNe34zEgN+AKRdv2SXcDvkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFshD1dl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFshD1dl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733150018; x=1764686018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k54BxwMRyKjxKBI6MXQhsysuiB2HRs/RM9nBqKAwKSI=;
  b=gFshD1dlUvdlzdm/F9+njUJoK5K0xi8x1NskK7QFlfumBSRLAKcO3kDC
   Cwgj1kHR/NBmfwhkicR//pHlEcYG58cdZl9HBvS5YMUVr1yL7x3dLPU7N
   BHMwIq489MFTYM5dVjxjhZGBN9oL9IgXHmBx4+COsb01KPKJngl/gOox/
   HYYZcyqvqaLrjF9hG+/zuZ26hIj5gv36djkAzniAHZY3Td9BupR969x4v
   uQNeTH3JGkl6Ch+na/XnQeh6uVrCmeV9XWpRlZDDBJ3Y87BYowOs1B3jA
   UEZF0Q11k+ZPIndCOiiUQrztldDmyqAcAEtSTGlp8Sqhwxg7wNhe732iu
   A==;
X-CSE-ConnectionGUID: 1pt14dHdRb+A5J1r/GM7Gg==
X-CSE-MsgGUID: YtZWq74jQLSj5EG/BpUq/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33062925"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="33062925"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 06:33:38 -0800
X-CSE-ConnectionGUID: dmL8SpixQcmgCe7xSCX/bQ==
X-CSE-MsgGUID: L7qLxi8hT+auOchKkb4aIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="97196477"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Dec 2024 06:33:36 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI7UU-0002Ur-2f;
	Mon, 02 Dec 2024 14:33:34 +0000
Date: Mon, 2 Dec 2024 22:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/xfs/xfs_log_recover.c:173:5-23: opportunity for str_write_read(op
 == REQ_OP_WRITE)
Message-ID: <202412030002.mrwonn73-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e70140ba0d2b1a30467d4af6bcfe761327b9ec95
commit: 6ad5b3255b9e3d6d94154738aacd5119bf9c8f6e xfs: use bios directly to read and write the log recovery buffers
date:   5 years ago
:::::: branch date: 18 hours ago
:::::: commit date: 5 years ago
config: x86_64-randconfig-104-20241115 (https://download.01.org/0day-ci/archive/20241203/202412030002.mrwonn73-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412030002.mrwonn73-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_log_recover.c:173:5-23: opportunity for str_write_read(op == REQ_OP_WRITE)

vim +173 fs/xfs/xfs_log_recover.c

076e6acb8f0d95 Christoph Hellwig 2009-03-16  145  
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  146  static int
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  147  xlog_do_io(
9a8d2fdbb47aaa Mark Tinguely     2012-06-14  148  	struct xlog		*log,
^1da177e4c3f41 Linus Torvalds    2005-04-16  149  	xfs_daddr_t		blk_no,
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  150  	unsigned int		nbblks,
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  151  	char			*data,
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  152  	unsigned int		op)
^1da177e4c3f41 Linus Torvalds    2005-04-16  153  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  154  	int			error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  155  
99c265950b55f1 Brian Foster      2017-10-26  156  	if (!xlog_verify_bp(log, blk_no, nbblks)) {
99c265950b55f1 Brian Foster      2017-10-26  157  		xfs_warn(log->l_mp,
99c265950b55f1 Brian Foster      2017-10-26  158  			 "Invalid log block/length (0x%llx, 0x%x) for buffer",
99c265950b55f1 Brian Foster      2017-10-26  159  			 blk_no, nbblks);
ff30a6221d95b6 Alex Elder        2010-04-13  160  		XFS_ERROR_REPORT(__func__, XFS_ERRLEVEL_HIGH, log->l_mp);
2451337dd04390 Dave Chinner      2014-06-25  161  		return -EFSCORRUPTED;
3228149ceb8b04 Dave Chinner      2009-01-22  162  	}
3228149ceb8b04 Dave Chinner      2009-01-22  163  
69ce58f08a3c45 Alex Elder        2010-04-20  164  	blk_no = round_down(blk_no, log->l_sectBBsize);
69ce58f08a3c45 Alex Elder        2010-04-20  165  	nbblks = round_up(nbblks, log->l_sectBBsize);
^1da177e4c3f41 Linus Torvalds    2005-04-16  166  	ASSERT(nbblks > 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  167  
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  168  	error = xfs_rw_bdev(log->l_targ->bt_bdev, log->l_logBBstart + blk_no,
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  169  			BBTOB(nbblks), data, op);
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  170  	if (error && !XFS_FORCED_SHUTDOWN(log->l_mp)) {
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  171  		xfs_alert(log->l_mp,
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  172  			  "log recovery %s I/O error at daddr 0x%llx len %d error %d",
6ad5b3255b9e3d Christoph Hellwig 2019-06-28 @173  			  op == REQ_OP_WRITE ? "write" : "read",
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  174  			  blk_no, nbblks, error);
6ad5b3255b9e3d Christoph Hellwig 2019-06-28  175  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  176  	return error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  177  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  178  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
