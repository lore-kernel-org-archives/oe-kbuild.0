Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F183F23F36B
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 11:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740913750; cv=none; b=bIFwO/r1w0vLTSxZ0Gap8si+TRaLQ/jjFdql7I6VPoy+3TEDoxCG4w5x8Pq+Aitpkha0fk+5BQpiTphv2LS5XfEU5ceqypebTxLo2i5UOD787KuK7YmEusuVYBthxwrLfUA/YPURfJHmJopT0szYGtS+jQn9zPSndMPdzoXDM9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740913750; c=relaxed/simple;
	bh=U0RmQ3s0hf/wd7FxnQbWqcbSBKWdXKmqNrgrhjo09L4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AkIHQq9uHaPsbzEutTqZses1n/TfEpFVqWsVY9K/LSnRsH45KCXQrVH326SDpI2aCdX8PtJvV8fuItzlv+S1LA5oE30Kju/Nl8646xCel+aQcpXbgIVVHqVYdmcmrNTUjnLsdBoa1lsHAYSKAkoGIO9mfTlwNAyKnn3i8vXchvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nA+06VaZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nA+06VaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740913748; x=1772449748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U0RmQ3s0hf/wd7FxnQbWqcbSBKWdXKmqNrgrhjo09L4=;
  b=nA+06VaZnWGBx76zjzRpO2dZxQVqjj9kTr6XrpK28BWZtoZ2NbK6MggP
   OeSCaIIBEzghsoMLzv7i0DQp8NvX0OBBZ0Z/1Wq+n+onfAotNt8fPoP+m
   oeL0wSqUkGFjUHyWNvxJU+X3yRPAJhXR9cL4WBnpL4eHveNIqq6PGi8ce
   wx7nD1eFiwF5KnnIs0zfk9cICjrEZVLIADU04TTBNqizDCXInTS3GWbIa
   vrY8YO1ENafWREMrVkcAUzbp58w0T+C/LtpQVLxO1UXJc+fyCuUOyi1z3
   Ij4wdWto6SRsq+EElbI4jfIp2+NJFPPn4zaRiK8hBrNn5fPUf9uVfSAW3
   g==;
X-CSE-ConnectionGUID: /yXVIua+Tr6smHMcnERlGA==
X-CSE-MsgGUID: ILV9LjSdTqeGKeDsoowwBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41496002"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="41496002"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 03:09:08 -0800
X-CSE-ConnectionGUID: tYpCUGfaRdWZ+7CCshcKJA==
X-CSE-MsgGUID: jGiKSGciRqCxXPrG/4a01Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="148552254"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 02 Mar 2025 03:09:07 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tohBk-000HGu-13;
	Sun, 02 Mar 2025 11:08:56 +0000
Date: Sun, 2 Mar 2025 19:07:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-vfs:vfs-6.15.async.dir 4/11] fs/minix/namei.c:131
 minix_mkdir() warn: passing zero to 'ERR_PTR'
Message-ID: <202503021836.HPrVZKzT-lkp@intel.com>
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
TO: NeilBrown <neilb@suse.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.15.async.dir
head:   ddf2b1bdf725c7b06d42133519c360e3afc2f3d4
commit: 88d5baf69082e5b410296435008329676b687549 [4/11] Change inode_operations.mkdir to return struct dentry *
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021836.HPrVZKzT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503021836.HPrVZKzT-lkp@intel.com/

New smatch warnings:
fs/minix/namei.c:131 minix_mkdir() warn: passing zero to 'ERR_PTR'
fs/ext4/namei.c:3069 ext4_mkdir() warn: passing zero to 'ERR_PTR'
fs/ext2/namei.c:262 ext2_mkdir() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/ext4/namei.c:1802 ext4_lookup() error: uninitialized symbol 'de'.
fs/ext4/namei.c:1855 ext4_get_parent() error: uninitialized symbol 'de'.
fs/ext4/namei.c:3176 ext4_rmdir() error: uninitialized symbol 'de'.
fs/ext4/namei.c:3256 __ext4_unlink() error: uninitialized symbol 'de'.
fs/ext4/namei.c:3708 ext4_find_delete_entry() error: uninitialized symbol 'de'.

vim +/ERR_PTR +131 fs/minix/namei.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  106  
88d5baf69082e5 NeilBrown         2025-02-27  107  static struct dentry *minix_mkdir(struct mnt_idmap *idmap, struct inode *dir,
549c7297717c32 Christian Brauner 2021-01-21  108  				  struct dentry *dentry, umode_t mode)
^1da177e4c3f41 Linus Torvalds    2005-04-16  109  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  110  	struct inode * inode;
8de52778798fe3 Al Viro           2012-02-06  111  	int err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  112  
4a29a1262a47ac Al Viro           2022-12-14  113  	inode = minix_new_inode(dir, S_IFDIR | mode);
4a29a1262a47ac Al Viro           2022-12-14  114  	if (IS_ERR(inode))
88d5baf69082e5 NeilBrown         2025-02-27  115  		return ERR_CAST(inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  116  
4a29a1262a47ac Al Viro           2022-12-14  117  	inode_inc_link_count(dir);
^1da177e4c3f41 Linus Torvalds    2005-04-16  118  	minix_set_inode(inode, 0);
78ec7b6917a938 Alexey Dobriyan   2006-03-23  119  	inode_inc_link_count(inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  120  
^1da177e4c3f41 Linus Torvalds    2005-04-16  121  	err = minix_make_empty(inode, dir);
^1da177e4c3f41 Linus Torvalds    2005-04-16  122  	if (err)
^1da177e4c3f41 Linus Torvalds    2005-04-16  123  		goto out_fail;
^1da177e4c3f41 Linus Torvalds    2005-04-16  124  
^1da177e4c3f41 Linus Torvalds    2005-04-16  125  	err = minix_add_link(dentry, inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  126  	if (err)
^1da177e4c3f41 Linus Torvalds    2005-04-16  127  		goto out_fail;
^1da177e4c3f41 Linus Torvalds    2005-04-16  128  
^1da177e4c3f41 Linus Torvalds    2005-04-16  129  	d_instantiate(dentry, inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  130  out:
88d5baf69082e5 NeilBrown         2025-02-27 @131  	return ERR_PTR(err);
^1da177e4c3f41 Linus Torvalds    2005-04-16  132  
^1da177e4c3f41 Linus Torvalds    2005-04-16  133  out_fail:
78ec7b6917a938 Alexey Dobriyan   2006-03-23  134  	inode_dec_link_count(inode);
78ec7b6917a938 Alexey Dobriyan   2006-03-23  135  	inode_dec_link_count(inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  136  	iput(inode);
78ec7b6917a938 Alexey Dobriyan   2006-03-23  137  	inode_dec_link_count(dir);
^1da177e4c3f41 Linus Torvalds    2005-04-16  138  	goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  139  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  140  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
