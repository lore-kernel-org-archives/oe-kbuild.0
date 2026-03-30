Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5032389477
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 10:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866056; cv=none; b=uyJyChtaYXU+B/7zD5rZD9/9ixykxrrBJjRP8tRtYYBVODMFkT9mb79G94tnOPvSNLKEGJRdOB2eIry6hMh4rek0cZBIBJEyXkqO87rhX6gNuGfLr27bRIv5EHdjv5KINqTUxb2iT7mjxg6Fxnx3j52e62u4Hd7r/9afMuobTSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866056; c=relaxed/simple;
	bh=kDcO5tqhbNzIgOlOL/+r/3iLL8UwbaZFqOd1xOCE4W8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ajM40sf4w8EZ5Sx4xcWQy3MbPWLXatpswyvjXsaA23zysR+355BcCiOSBpMRNzKY6iZGyQKBhmdAEErkFwTG4lHFTGBjo5fwi1BAzJ2b3h2mljtxHzHA7tkmDeBdVMKNRe5yELLQtNovz6OtS+q4t7Zh7nE0UfPHUJAdvx21znI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qtar7nbP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qtar7nbP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774866054; x=1806402054;
  h=date:from:to:cc:subject:message-id;
  bh=kDcO5tqhbNzIgOlOL/+r/3iLL8UwbaZFqOd1xOCE4W8=;
  b=Qtar7nbPicIw4Bwdbc94igXt/83WlSjDvLSdtMZlUP5XW4aIy7IM4m+v
   muYo6D2OtLEHU+r4NnCTH3jbIlxjIvcqk3To0tDaIvu1QSi1XVdW1uZpE
   QXiV4493X5jEFEz4IBoyS1AB1LsEKyIQ6f47U2rDNbE/14709Yw+k4H84
   bJNucIEAfM9hl+G+EL9ZrI+NHI2ooZBVrEQSm1Q/NTij375g2WoPLWAl2
   t+TyuCf+Qw2qpr+KcPRjlAHtdkbeDPLgz8A+Qc2TiXMCdvhnsYINu9A7Z
   xqz8IAZnH44+g11JafyqeILM8aMvarRYFeQFU3d55PqZTenJdcPkSiiET
   Q==;
X-CSE-ConnectionGUID: Pd0GTQTtSUinFtp2b69Xcg==
X-CSE-MsgGUID: xjtLqVkvSqamDD83mBAMeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="63408941"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="63408941"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 03:20:54 -0700
X-CSE-ConnectionGUID: yxVdUU63Tr+z0QYfZw+T3Q==
X-CSE-MsgGUID: pcQpR5G2SaClDotIed0yHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="249062510"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Mar 2026 03:20:52 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w79jm-000000000xb-1cFX;
	Mon, 30 Mar 2026 10:20:50 +0000
Date: Mon, 30 Mar 2026 18:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/nilfs2/namei.c:261 nilfs_mkdir() warn: passing zero to
 'ERR_PTR'
Message-ID: <202603301823.9YkGdk2Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: NeilBrown <neilb@suse.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: 88d5baf69082e5b410296435008329676b687549 Change inode_operations.mkdir to return struct dentry *
date:   1 year, 1 month ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year, 1 month ago
config: arc-randconfig-r071-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301823.9YkGdk2Z-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603301823.9YkGdk2Z-lkp@intel.com/

smatch warnings:
fs/nilfs2/namei.c:261 nilfs_mkdir() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +261 fs/nilfs2/namei.c

d25006523d0b9e Ryusuke Konishi   2009-04-06  220  
88d5baf69082e5 NeilBrown         2025-02-27  221  static struct dentry *nilfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
549c7297717c32 Christian Brauner 2021-01-21  222  				  struct dentry *dentry, umode_t mode)
d25006523d0b9e Ryusuke Konishi   2009-04-06  223  {
d25006523d0b9e Ryusuke Konishi   2009-04-06  224  	struct inode *inode;
d25006523d0b9e Ryusuke Konishi   2009-04-06  225  	struct nilfs_transaction_info ti;
47420c799830d4 Ryusuke Konishi   2009-04-06  226  	int err;
d25006523d0b9e Ryusuke Konishi   2009-04-06  227  
d25006523d0b9e Ryusuke Konishi   2009-04-06  228  	err = nilfs_transaction_begin(dir->i_sb, &ti, 1);
d25006523d0b9e Ryusuke Konishi   2009-04-06  229  	if (err)
88d5baf69082e5 NeilBrown         2025-02-27  230  		return ERR_PTR(err);
d25006523d0b9e Ryusuke Konishi   2009-04-06  231  
565de406e7bfa9 Jiro SEKIBA       2009-11-27  232  	inc_nlink(dir);
d25006523d0b9e Ryusuke Konishi   2009-04-06  233  
d25006523d0b9e Ryusuke Konishi   2009-04-06  234  	inode = nilfs_new_inode(dir, S_IFDIR | mode);
d25006523d0b9e Ryusuke Konishi   2009-04-06  235  	err = PTR_ERR(inode);
d25006523d0b9e Ryusuke Konishi   2009-04-06  236  	if (IS_ERR(inode))
d25006523d0b9e Ryusuke Konishi   2009-04-06  237  		goto out_dir;
d25006523d0b9e Ryusuke Konishi   2009-04-06  238  
d25006523d0b9e Ryusuke Konishi   2009-04-06  239  	inode->i_op = &nilfs_dir_inode_operations;
d25006523d0b9e Ryusuke Konishi   2009-04-06  240  	inode->i_fop = &nilfs_dir_operations;
d25006523d0b9e Ryusuke Konishi   2009-04-06  241  	inode->i_mapping->a_ops = &nilfs_aops;
d25006523d0b9e Ryusuke Konishi   2009-04-06  242  
565de406e7bfa9 Jiro SEKIBA       2009-11-27  243  	inc_nlink(inode);
d25006523d0b9e Ryusuke Konishi   2009-04-06  244  
d25006523d0b9e Ryusuke Konishi   2009-04-06  245  	err = nilfs_make_empty(inode, dir);
d25006523d0b9e Ryusuke Konishi   2009-04-06  246  	if (err)
d25006523d0b9e Ryusuke Konishi   2009-04-06  247  		goto out_fail;
d25006523d0b9e Ryusuke Konishi   2009-04-06  248  
d25006523d0b9e Ryusuke Konishi   2009-04-06  249  	err = nilfs_add_link(dentry, inode);
d25006523d0b9e Ryusuke Konishi   2009-04-06  250  	if (err)
d25006523d0b9e Ryusuke Konishi   2009-04-06  251  		goto out_fail;
d25006523d0b9e Ryusuke Konishi   2009-04-06  252  
abdb318b79d387 Jiro SEKIBA       2009-11-27  253  	nilfs_mark_inode_dirty(inode);
1e2e547a93a00e Al Viro           2018-05-04  254  	d_instantiate_new(dentry, inode);
d25006523d0b9e Ryusuke Konishi   2009-04-06  255  out:
47420c799830d4 Ryusuke Konishi   2009-04-06  256  	if (!err)
47420c799830d4 Ryusuke Konishi   2009-04-06  257  		err = nilfs_transaction_commit(dir->i_sb);
47420c799830d4 Ryusuke Konishi   2009-04-06  258  	else
47420c799830d4 Ryusuke Konishi   2009-04-06  259  		nilfs_transaction_abort(dir->i_sb);
47420c799830d4 Ryusuke Konishi   2009-04-06  260  
88d5baf69082e5 NeilBrown         2025-02-27 @261  	return ERR_PTR(err);
d25006523d0b9e Ryusuke Konishi   2009-04-06  262  
d25006523d0b9e Ryusuke Konishi   2009-04-06  263  out_fail:
565de406e7bfa9 Jiro SEKIBA       2009-11-27  264  	drop_nlink(inode);
565de406e7bfa9 Jiro SEKIBA       2009-11-27  265  	drop_nlink(inode);
abdb318b79d387 Jiro SEKIBA       2009-11-27  266  	nilfs_mark_inode_dirty(inode);
705304a863cc41 Ryusuke Konishi   2014-12-10  267  	unlock_new_inode(inode);
d25006523d0b9e Ryusuke Konishi   2009-04-06  268  	iput(inode);
d25006523d0b9e Ryusuke Konishi   2009-04-06  269  out_dir:
565de406e7bfa9 Jiro SEKIBA       2009-11-27  270  	drop_nlink(dir);
abdb318b79d387 Jiro SEKIBA       2009-11-27  271  	nilfs_mark_inode_dirty(dir);
d25006523d0b9e Ryusuke Konishi   2009-04-06  272  	goto out;
d25006523d0b9e Ryusuke Konishi   2009-04-06  273  }
d25006523d0b9e Ryusuke Konishi   2009-04-06  274  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
