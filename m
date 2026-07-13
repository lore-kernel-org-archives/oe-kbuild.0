Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E22241C8C
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Jul 2026 22:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783980342; cv=none; b=MNusip/0CJDoxrebR9t6wzdJ7UDawAErggx2sXcqq0cTfpHn0dRcoxkkaw2R3RqnoqFNiX2nS0oe6aK2YiKTdqw2eP1byVUczrdQip+UKekcYcGl/EQjv8c2wYdqUIJnehyedsubU2wPqOz4SqpytcR9sjVkoZEe4e93VYe+Jaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783980342; c=relaxed/simple;
	bh=t+wEmYLtomCmer3Rd246d/y2A2vAc59zxSGuS0lbilw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jUEW6Qz/+X6G569FyHRW5Qh8qbGnh2qYFxJg7qZqAbhrLbWMv/OyOcGuiUyOqn3cmYbmZgWwf1Ir77f/tJt84PuYlnAawfAGtl90rjf/LcBb2gHQvRnzGqerzt7ffytkQ+dawJTC/W316ZeSqySo9dYMdRnoO5TWqNr6ahoh76g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lG83xnsi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lG83xnsi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783980341; x=1815516341;
  h=date:from:to:cc:subject:message-id;
  bh=t+wEmYLtomCmer3Rd246d/y2A2vAc59zxSGuS0lbilw=;
  b=lG83xnsivpzZpkKcWXurt2yQU+VxrVqs/zj/1LZgLHGYujKzCd1+lIUR
   +cFDuzSGj0vRu1yObqfylQSGe8bVhTcIUweeE06PEr5S8eZrM7qhxJIRJ
   Azpe4crvUWGR5oqcDCfkbSGALp9fnL4X2q47L1jeYcPeCgUQmz2BuyRL7
   K6mJDeI4LP+E1K/Lxwwe/ORTA0tFZlPsbQJCqv2sSI4IO9eABFUICN9mR
   s1xYPK3cSj/WCCFrE41UVdkw/wqFAVjBMBqDdD909EToPUWON52wI//jf
   g2iZxCZ+tNIUQvUY1hyR287Cm1vNoGXQxXMOWiRtwwF9rB3vaozmZ+t5D
   w==;
X-CSE-ConnectionGUID: daa8d6EQQa+Lz0Y7KG3b1A==
X-CSE-MsgGUID: w8STt9kCSkaXUVDem1nMeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96108051"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96108051"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 15:05:41 -0700
X-CSE-ConnectionGUID: zNP/rYu2QoWIIJwDTOQ0Gg==
X-CSE-MsgGUID: iooNCO0EQ3OUC6h3uDvNpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255724279"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 13 Jul 2026 15:05:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjOm8-00000000M6X-2vFS;
	Mon, 13 Jul 2026 22:05:23 +0000
Date: Tue, 14 Jul 2026 06:05:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [amir73il:ovl_copy_file_range 3/6] fs/read_write.c:1499
 copy_file_fs_cmp() error: we previously assumed 'f_out->f_op' could be null
 (see line 1496)
Message-ID: <202607140512.I7Hcmuea-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux ovl_copy_file_range
head:   4421f88f42bb20b8a6f9fd56c5c877a1088d0e00
commit: b86e287575a3f81b04ef92b5bb46f87329fc314f [3/6] fs: add support for copy file range from another fs
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-141-20260714 (https://download.01.org/0day-ci/archive/20260714/202607140512.I7Hcmuea-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607140512.I7Hcmuea-lkp@intel.com/

New smatch warnings:
fs/read_write.c:1499 copy_file_fs_cmp() error: we previously assumed 'f_out->f_op' could be null (see line 1496)

Old smatch warnings:
fs/read_write.c:1631 vfs_copy_file_range() error: we previously assumed 'file_out->f_op->copy_file_range' could be null (see line 1614)

vim +1499 fs/read_write.c

cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1482  
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1483  /*
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1484   * Check if src and dst file are on the same filesystem.
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1485   * nfs and cifs define several different file_system_type structures
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1486   * and several different sets of file_operations, but they all end up
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1487   * using the same ->copy_file_range() function pointer.
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1488   * COPY_FILE_SPLICE is an opt-in flag for cross-fs copy (e.g. from nfsd),
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1489   * so do not compare src<->dst filesystems in this case.
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1490   */
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1491  static int copy_file_fs_cmp(struct file *f_in, struct file *f_out,
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1492  			    unsigned int flags)
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1493  {
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1494  	if (flags & COPY_FILE_SPLICE)
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1495  		return FS_COPY_SPLICE;
cd6e8d0dbe33ef Amir Goldstein 2026-07-13 @1496  	else if (f_out->f_op && f_out->f_op->copy_file_range &&
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1497  		 f_out->f_op->copy_file_range == f_in->f_op->copy_file_range)
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1498  		return FS_COPY_SAME_FS;
b86e287575a3f8 Amir Goldstein 2026-07-13 @1499  	else if (f_out->f_op->fop_flags & FOP_CROSS_FS_COPY)
b86e287575a3f8 Amir Goldstein 2026-07-13  1500  		return FS_COPY_FROM_OTHER_FS;
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1501  	else if (file_inode(f_in)->i_sb == file_inode(f_out)->i_sb)
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1502  		return FS_COPY_SAME_SB;
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1503  	else
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1504  		return FS_COPY_CROSS_FS;
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1505  }
cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1506  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
