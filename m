Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F151DF27F
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 03:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774843109; cv=none; b=ga1dTM9ugn6G0XmSyMgg1BVEabKX5n9xAyccYWpSl2k3tDsXboYkRmAn2Fel5+A9mfXM7uPYQTSbbRw7VXrj5rmbIcbExVT1AeDQMjXMc0tsR1oXB41LHklDbglIj721jp5AbAlbbViUoSUnfEmiuUwAAk0PnNo9QxfaRBGD/vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774843109; c=relaxed/simple;
	bh=LogL95qoJ9OYQTZ/TJ6D1k34eHcmmvXnqMLAJpDPpRk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XAoEoWBbRhNzbAm/MWwwCtB/dX1yRaxfcq6hmoMBXxjDJAoRz0LNXfddKkTU5suSmW7nJW/XA9Qr6G0W5XGGe/Evfa4y/6WDLisY2Mb0cZgGCDmDZTm91wBm6TidZkpVhc5Led/gZOVk1UuyIDnvBJFoeYyxhY8lrSgQS3H3w+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNmyNBrM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNmyNBrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774843106; x=1806379106;
  h=date:from:to:cc:subject:message-id;
  bh=LogL95qoJ9OYQTZ/TJ6D1k34eHcmmvXnqMLAJpDPpRk=;
  b=eNmyNBrMCAdC/ia4SLa2wHc1ulZ8yZm0zt1jCyGTrNoBf1WjrYGjc0RD
   g+P2AqV67l2cMtTAVriFoji5oJa28LZZl6CfL1q9gfniFnxuh+fX6OygI
   mdHw8ra8z4rhxUBsN+vt36j2MFP1gco5WFe0Ppvu9AbiNWVNEZCfwl6sO
   zunzz9Z7YYY0gbwO2IPVyidYc2H0f+ud038L8BXXHxOkBLaWtXSBgyimq
   QAvwPSFFczB3Xz4Ukt8ln+RnMaGEk4w/yvYYWr4UFoXGRlEkdt3+X819x
   6sdNPuNYddQ2gTkDCKeuICbMC/cdvIT9Qd+WS5DChoD2C8yeUnzs2lu1r
   w==;
X-CSE-ConnectionGUID: gWt3IRFxSXmXIwLt892msA==
X-CSE-MsgGUID: 9GnB3/UjT42wUVdCd8xolQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75715707"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="75715707"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 20:58:25 -0700
X-CSE-ConnectionGUID: EFqJja5BRgOQFU0atJ6WVw==
X-CSE-MsgGUID: VQEggDTYT1Cj58tgMIplHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="221530626"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Mar 2026 20:58:24 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w73ld-000000000dS-3PJt;
	Mon, 30 Mar 2026 03:58:21 +0000
Date: Mon, 30 Mar 2026 11:58:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/nilfs2/namei.c:261 nilfs_mkdir() warn: passing zero to
 'ERR_PTR'
Message-ID: <202603301142.FjsO2qF0-lkp@intel.com>
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
:::::: branch date: 5 hours ago
:::::: commit date: 1 year, 1 month ago
config: arc-randconfig-r071-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301142.FjsO2qF0-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603301142.FjsO2qF0-lkp@intel.com/

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
