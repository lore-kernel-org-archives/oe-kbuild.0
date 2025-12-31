Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666082DEA80
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 21:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767215721; cv=none; b=m5VWv7TppYQALqZ+VdM7Vy/iSbHrcfyOCMpMQG5if/xzpb2mrZ5ZWo8hbmJHTnAZTA7k6cHBcxJM4MmzORCAKJzsChk+lMDJvNTsnZ+K0tE56FHXMcwo3y7onbUXXiqTawMqHYgC5MMHpBWWMW66/51WtsvyQ4bhw+kc42JI8qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767215721; c=relaxed/simple;
	bh=SmVv4qKgTb+bWkztOa9zN0HkF/q4HCbJgPkKgyJxMHs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c8jaGxQOqb0RLIuiw++A+v8mF46uSFdiM3mQLTrAJw7tzx4RK0cVdEn6Z6v8FHdyFVs/3Hy6uyIYr9PEoBKX+Oe9xDSVChTsMs7NYeFYlJPKd047TpXN8Z3sQfOS80RuRaLAbTgvABFuN8KasmhO8amM3Fi2kJWtHmzXCTUnOOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4Q7C68G; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4Q7C68G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767215718; x=1798751718;
  h=date:from:to:cc:subject:message-id;
  bh=SmVv4qKgTb+bWkztOa9zN0HkF/q4HCbJgPkKgyJxMHs=;
  b=d4Q7C68GMFeIbepQ7EpCNEtQCuEuncBBqUtJECfhZXxrUYEVHo5qylbH
   LoszVQQKgfims2On+p+ujDxLAXOp18H0+1RsvSiVBRuVKdqv21x67IB6y
   kMsYTrGZw8GP9gpHSWng/R04M9HSz9boeF/C8KiJrYsoGKmuMlFkHsWxf
   d6JIte1YuTVq6Om+MsjdS4UOU1Er5UV5OgxEYLUykErpX+2+esRV8O1GV
   VBr8WthW/cUCi+8amiqhv2UsY2aOgF/roVfNySFc10DmVOqt5eEZnPh1f
   /9+S0jW+dWAvabgvgob6hHIRugU2APhiLrWRny0gtz/U5GPj4+DfkNBkY
   g==;
X-CSE-ConnectionGUID: TF7wutjHQhKmpGE4nYS+/g==
X-CSE-MsgGUID: 1tn4vt7WTUWoyf+dPgz7rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="79408722"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="79408722"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 13:15:17 -0800
X-CSE-ConnectionGUID: AKZV0bATQ3O168wzQ9rkAw==
X-CSE-MsgGUID: tScYwRvJR2K7sy6V7HyGmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="225004597"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Dec 2025 13:15:16 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb3XG-000000001UX-21zp;
	Wed, 31 Dec 2025 21:15:14 +0000
Date: Thu, 01 Jan 2026 05:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [paragon-software-group-ntfs3:master 16/16]
 fs/ntfs3/inode.c:1024 ntfs_writepages() error: uninitialized symbol 'folio'.
Message-ID: <202601010513.axd56bks-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: ntfs3@lists.linux.dev
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git master
head:   099ef9ab9203dff327f2d61e44773f9acbc01f13
commit: 099ef9ab9203dff327f2d61e44773f9acbc01f13 [16/16] fs/ntfs3: implement iomap-based file operations
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: um-randconfig-r072-20260101 (https://download.01.org/0day-ci/archive/20260101/202601010513.axd56bks-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601010513.axd56bks-lkp@intel.com/

smatch warnings:
fs/ntfs3/inode.c:1024 ntfs_writepages() error: uninitialized symbol 'folio'.

vim +/folio +1024 fs/ntfs3/inode.c

82cae269cfa953 Konstantin Komarov 2021-08-13  1001  
099ef9ab9203df Konstantin Komarov 2025-12-26  1002  static int ntfs_writepages(struct address_space *mapping,
099ef9ab9203df Konstantin Komarov 2025-12-26  1003  			   struct writeback_control *wbc)
099ef9ab9203df Konstantin Komarov 2025-12-26  1004  {
099ef9ab9203df Konstantin Komarov 2025-12-26  1005  	int err;
099ef9ab9203df Konstantin Komarov 2025-12-26  1006  	struct inode *inode = mapping->host;
099ef9ab9203df Konstantin Komarov 2025-12-26  1007  	struct ntfs_inode *ni = ntfs_i(inode);
099ef9ab9203df Konstantin Komarov 2025-12-26  1008  	struct iomap_writepage_ctx wpc = {
099ef9ab9203df Konstantin Komarov 2025-12-26  1009  		.inode = mapping->host,
099ef9ab9203df Konstantin Komarov 2025-12-26  1010  		.wbc = wbc,
099ef9ab9203df Konstantin Komarov 2025-12-26  1011  		.ops = &ntfs_writeback_ops,
099ef9ab9203df Konstantin Komarov 2025-12-26  1012  	};
099ef9ab9203df Konstantin Komarov 2025-12-26  1013  
099ef9ab9203df Konstantin Komarov 2025-12-26  1014  	/* Avoid any operation if inode is bad. */
099ef9ab9203df Konstantin Komarov 2025-12-26  1015  	if (unlikely(is_bad_ni(ni)))
099ef9ab9203df Konstantin Komarov 2025-12-26  1016  		return -EINVAL;
099ef9ab9203df Konstantin Komarov 2025-12-26  1017  
099ef9ab9203df Konstantin Komarov 2025-12-26  1018  	if (unlikely(ntfs3_forced_shutdown(inode->i_sb)))
099ef9ab9203df Konstantin Komarov 2025-12-26  1019  		return -EIO;
099ef9ab9203df Konstantin Komarov 2025-12-26  1020  
099ef9ab9203df Konstantin Komarov 2025-12-26  1021  	if (is_resident(ni)) {
099ef9ab9203df Konstantin Komarov 2025-12-26  1022  		struct folio *folio;
099ef9ab9203df Konstantin Komarov 2025-12-26  1023  
099ef9ab9203df Konstantin Komarov 2025-12-26 @1024  		while ((folio = writeback_iter(mapping, wbc, folio, &err)))
099ef9ab9203df Konstantin Komarov 2025-12-26  1025  			err = ntfs_resident_writepage(folio, wbc);
099ef9ab9203df Konstantin Komarov 2025-12-26  1026  
82cae269cfa953 Konstantin Komarov 2021-08-13  1027  		return err;
82cae269cfa953 Konstantin Komarov 2021-08-13  1028  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1029  
099ef9ab9203df Konstantin Komarov 2025-12-26  1030  	return iomap_writepages(&wpc);
099ef9ab9203df Konstantin Komarov 2025-12-26  1031  }
099ef9ab9203df Konstantin Komarov 2025-12-26  1032  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
