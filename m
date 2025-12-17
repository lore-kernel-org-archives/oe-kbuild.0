Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AA01DFFD
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 05:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765949714; cv=none; b=aTIiO7kh+zXKeHzGtzb4TnBnCkZ3qHTNk6JPyyyl28VhWo9lX/S39g3EjzG0VD4P2a1YEda7JE50d/vjRu09U5gNEtzn6lReCV6XPRyUxrfzPRwJZZQOs13Re/ygJRftZzDAI6ohFc95ixPajUvYua1wq6qOuh2Qq+TblWULgYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765949714; c=relaxed/simple;
	bh=mBG5W67eIuL2+hdifp7hACP5xxKkmPEoFQAwpQ2Djjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gAQbCP/D4YbsxzwxY3+wo4f+k6jfxb5oPoE0wFYUxVdwK98RagPhbs8XUc3TGe/KKYVBgyAIUtbw3Jj+h1n/5dLmSPxXfpEz8zNtGkh3p5S7ubcDZ/GI5fUklR1hEsvaXlSkvytJkAsoje739dAmlUBfqU/g3mo/ArJBeMHGSz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kybl4wMl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kybl4wMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765949713; x=1797485713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mBG5W67eIuL2+hdifp7hACP5xxKkmPEoFQAwpQ2Djjc=;
  b=kybl4wMlxKbXEEHWK079mFIQYlTihbu8n1VLgfgXpZuTCIh+iXJqBDb9
   56+bMjs2SPT6w0NqdJknT3R+ImkLMVD3sEvVYM7uhiVvUsy4Odbw0D9RA
   9qoW9xLLUmbX98u8WXlHrdlpESBH5EKbSSbTjZTPSabJFkaocd5O6WnBk
   dOEdcSgIWS+GCXE9N2oepKYDasw4F2PQptuQp8M+6DR3iWk7atoe3bcOr
   8hlf+veEGIQzQmDZngYMg/jV5PBMfyiVeitiO1b84YLWhBZ4S4Pt86ske
   hbpXQAb7ohSSg5bZi0nSXStyRnvjDxm5CLDpqyqeDAvFCAzc8xiO/suQR
   A==;
X-CSE-ConnectionGUID: ub9aOwjLQVOLIZBhSLt10w==
X-CSE-MsgGUID: oIEONcJbT0KwUXgNd6qs5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="68035787"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="68035787"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 21:35:13 -0800
X-CSE-ConnectionGUID: rAmbykYwTdu2sWJbYo+vEg==
X-CSE-MsgGUID: U4O+XW29Sn+nUhSS13hMIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="197960111"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Dec 2025 21:35:11 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVkBo-00000000036-3tgi;
	Wed, 17 Dec 2025 05:35:08 +0000
Date: Wed, 17 Dec 2025 13:34:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/nilfs2/namei.c:261 nilfs_mkdir() warn: passing zero to 'ERR_PTR'
Message-ID: <202512171350.25N5uBgD-lkp@intel.com>
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
TO: NeilBrown <neilb@suse.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
commit: 88d5baf69082e5b410296435008329676b687549 Change inode_operations.mkdir to return struct dentry *
date:   10 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 10 months ago
config: microblaze-randconfig-r071-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171350.25N5uBgD-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512171350.25N5uBgD-lkp@intel.com/

smatch warnings:
fs/nilfs2/namei.c:261 nilfs_mkdir() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +261 fs/nilfs2/namei.c

d25006523d0b9e4 Ryusuke Konishi   2009-04-06  220  
88d5baf69082e5b NeilBrown         2025-02-27  221  static struct dentry *nilfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
549c7297717c32e Christian Brauner 2021-01-21  222  				  struct dentry *dentry, umode_t mode)
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  223  {
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  224  	struct inode *inode;
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  225  	struct nilfs_transaction_info ti;
47420c799830d46 Ryusuke Konishi   2009-04-06  226  	int err;
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  227  
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  228  	err = nilfs_transaction_begin(dir->i_sb, &ti, 1);
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  229  	if (err)
88d5baf69082e5b NeilBrown         2025-02-27  230  		return ERR_PTR(err);
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  231  
565de406e7bfa92 Jiro SEKIBA       2009-11-27  232  	inc_nlink(dir);
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  233  
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  234  	inode = nilfs_new_inode(dir, S_IFDIR | mode);
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  235  	err = PTR_ERR(inode);
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  236  	if (IS_ERR(inode))
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  237  		goto out_dir;
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  238  
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  239  	inode->i_op = &nilfs_dir_inode_operations;
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  240  	inode->i_fop = &nilfs_dir_operations;
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  241  	inode->i_mapping->a_ops = &nilfs_aops;
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  242  
565de406e7bfa92 Jiro SEKIBA       2009-11-27  243  	inc_nlink(inode);
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  244  
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  245  	err = nilfs_make_empty(inode, dir);
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  246  	if (err)
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  247  		goto out_fail;
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  248  
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  249  	err = nilfs_add_link(dentry, inode);
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  250  	if (err)
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  251  		goto out_fail;
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  252  
abdb318b79d387a Jiro SEKIBA       2009-11-27  253  	nilfs_mark_inode_dirty(inode);
1e2e547a93a00eb Al Viro           2018-05-04  254  	d_instantiate_new(dentry, inode);
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  255  out:
47420c799830d46 Ryusuke Konishi   2009-04-06  256  	if (!err)
47420c799830d46 Ryusuke Konishi   2009-04-06  257  		err = nilfs_transaction_commit(dir->i_sb);
47420c799830d46 Ryusuke Konishi   2009-04-06  258  	else
47420c799830d46 Ryusuke Konishi   2009-04-06  259  		nilfs_transaction_abort(dir->i_sb);
47420c799830d46 Ryusuke Konishi   2009-04-06  260  
88d5baf69082e5b NeilBrown         2025-02-27 @261  	return ERR_PTR(err);
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  262  
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  263  out_fail:
565de406e7bfa92 Jiro SEKIBA       2009-11-27  264  	drop_nlink(inode);
565de406e7bfa92 Jiro SEKIBA       2009-11-27  265  	drop_nlink(inode);
abdb318b79d387a Jiro SEKIBA       2009-11-27  266  	nilfs_mark_inode_dirty(inode);
705304a863cc415 Ryusuke Konishi   2014-12-10  267  	unlock_new_inode(inode);
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  268  	iput(inode);
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  269  out_dir:
565de406e7bfa92 Jiro SEKIBA       2009-11-27  270  	drop_nlink(dir);
abdb318b79d387a Jiro SEKIBA       2009-11-27  271  	nilfs_mark_inode_dirty(dir);
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  272  	goto out;
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  273  }
d25006523d0b9e4 Ryusuke Konishi   2009-04-06  274  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
