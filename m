Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D4A37BE75
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 20:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774210417; cv=none; b=CpSLwvM5RM6p6Sw4vxEPQxcMgW4EbNZbCiwho5y3K7tarcCKFe/NHJwY3srr1EPmMcuQcL0Fh41rl2UoBC6gjYroq1/KOe9M2mcHBbO4zZwcZ+DvkAmKLKdFkxps1ZcRMI/hJgDi+pje4uIUBUIUvJo+f83ZnnGKGWqR7qhIlbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774210417; c=relaxed/simple;
	bh=LvMkexJ8pVbXB5FMyqpY0gFu7iPAW6FhjpROX6O7ciI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MZVPLLQ4X3sww3/0MF0Gz0Tl6jtnHA3tJaLfKNCnd7XLZgwkUh0AR2cZl4tJ0f23lzSGTCTdcrVrFvmYTvrZ0dewxnO8pEhE9wksFhYhyentBiPTGEyWlpQRzepokY/8n0NsycQSlAWt3SekuT/RKpNRoxyj51vr3UHzoF0CSnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OqtoDaq7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OqtoDaq7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774210416; x=1805746416;
  h=date:from:to:cc:subject:message-id;
  bh=LvMkexJ8pVbXB5FMyqpY0gFu7iPAW6FhjpROX6O7ciI=;
  b=OqtoDaq7D0DnEHBAuwJNyzfwQ/WaTbYz72llk8/lKg7bZXEunLKPM4aE
   BbWuEcf23DeGk3+WwInj3Zbkq8LcRJM2fBmprgELwahJ1VROtbnuBJuef
   Y21vcOH5apj5maEHIMn6l2oNh/jOAVwB13NEA1wjpFEhowPM8oJEW41TF
   TYWWBym8kUlw/trHqVsnXbbDnQW+zKkOhX8oW5JviKkLxfkyw6ccZsJrT
   hn7EZsIjS796ZE8aoVtLuZPIAhruydDZsyvsV7LwdZAka0cSll2qTQzgk
   3TwM3tf4Ogma+tWb37lQLhMl8E2qKUhYZcqvWQjHrIrAe1VyjQ0rVTiBs
   w==;
X-CSE-ConnectionGUID: TyhySqWsTRi7s2qAsDTwLA==
X-CSE-MsgGUID: OVshQ6s/TVuPpGZBexWKbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75101783"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="75101783"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 13:13:36 -0700
X-CSE-ConnectionGUID: VhQ6AiQZTaKIihzw32KyRA==
X-CSE-MsgGUID: GzJlQrvjSM2ujs+hJVqfiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="222909460"
Received: from lkp-server02.sh.intel.com (HELO c2cbc2b066eb) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Mar 2026 13:13:34 -0700
Received: from kbuild by c2cbc2b066eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4PAq-0000000003g-34EI;
	Sun, 22 Mar 2026 20:13:26 +0000
Date: Mon, 23 Mar 2026 04:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/9p/vfs_inode_dotl.c:420 v9fs_vfs_mkdir_dotl() warn:
 passing zero to 'ERR_PTR'
Message-ID: <202603230405.g5k5W0cK-lkp@intel.com>
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
head:   ec69c9e88315c4be70c283f18c2ff130da6320b5
commit: 88d5baf69082e5b410296435008329676b687549 Change inode_operations.mkdir to return struct dentry *
date:   1 year, 1 month ago
:::::: branch date: 89 minutes ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230405.g5k5W0cK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603230405.g5k5W0cK-lkp@intel.com/

New smatch warnings:
fs/9p/vfs_inode_dotl.c:420 v9fs_vfs_mkdir_dotl() warn: passing zero to 'ERR_PTR'
fs/9p/vfs_inode.c:695 v9fs_vfs_mkdir() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/9p/vfs_inode.c:1289 v9fs_vfs_link() warn: 'oldfid' can also be NULL

vim +/ERR_PTR +420 fs/9p/vfs_inode_dotl.c

53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  343  
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  344  /**
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  345   * v9fs_vfs_mkdir_dotl - VFS mkdir hook to create a directory
c54bd91e9eaba4 Christian Brauner  2023-01-13  346   * @idmap: The idmap of the mount
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  347   * @dir:  inode that is being unlinked
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  348   * @dentry: dentry that is being unlinked
fd2916bd77109b Fabian Frederick   2014-06-04  349   * @omode: mode for new directory
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  350   *
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  351   */
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  352  
88d5baf69082e5 NeilBrown          2025-02-27  353  static struct dentry *v9fs_vfs_mkdir_dotl(struct mnt_idmap *idmap,
549c7297717c32 Christian Brauner  2021-01-21  354  					  struct inode *dir, struct dentry *dentry,
549c7297717c32 Christian Brauner  2021-01-21  355  					  umode_t omode)
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  356  {
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  357  	int err;
fedd06210b14fe Dominique Martinet 2024-10-24  358  	struct v9fs_session_info *v9ses;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  359  	struct p9_fid *fid = NULL, *dfid = NULL;
d4ef4e35810448 Eric W. Biederman  2013-01-30  360  	kgid_t gid;
7880b43bdfc958 Al Viro            2017-01-12  361  	const unsigned char *name;
d3fb612076eebe Al Viro            2011-07-23  362  	umode_t mode;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  363  	struct inode *inode;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  364  	struct p9_qid qid;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  365  	struct posix_acl *dacl = NULL, *pacl = NULL;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  366  
4b8e992392a246 Al Viro            2014-08-19  367  	p9_debug(P9_DEBUG_VFS, "name %pd\n", dentry);
fedd06210b14fe Dominique Martinet 2024-10-24  368  	v9ses = v9fs_inode2v9ses(dir);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  369  
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  370  	omode |= S_IFDIR;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  371  	if (dir->i_mode & S_ISGID)
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  372  		omode |= S_ISGID;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  373  
77d5a6b7d9924e Al Viro            2016-05-29  374  	dfid = v9fs_parent_fid(dentry);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  375  	if (IS_ERR(dfid)) {
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  376  		err = PTR_ERR(dfid);
5d3851530d6d68 Joe Perches        2011-11-28  377  		p9_debug(P9_DEBUG_VFS, "fid lookup failed %d\n", err);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  378  		goto error;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  379  	}
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  380  
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  381  	gid = v9fs_get_fsgid_for_create(dir);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  382  	mode = omode;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  383  	/* Update mode based on ACL value */
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  384  	err = v9fs_acl_mode(dir, &mode, &dacl, &pacl);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  385  	if (err) {
5d3851530d6d68 Joe Perches        2011-11-28  386  		p9_debug(P9_DEBUG_VFS, "Failed to get acl values in mkdir %d\n",
5d3851530d6d68 Joe Perches        2011-11-28  387  			 err);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  388  		goto error;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  389  	}
7880b43bdfc958 Al Viro            2017-01-12  390  	name = dentry->d_name.name;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  391  	err = p9_client_mkdir_dotl(dfid, name, mode, gid, &qid);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  392  	if (err < 0)
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  393  		goto error;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  394  	fid = p9_client_walk(dfid, 1, &name, 1);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  395  	if (IS_ERR(fid)) {
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  396  		err = PTR_ERR(fid);
5d3851530d6d68 Joe Perches        2011-11-28  397  		p9_debug(P9_DEBUG_VFS, "p9_client_walk failed %d\n",
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  398  			 err);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  399  		goto error;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  400  	}
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  401  
3592ac44401799 Al Viro            2013-01-31  402  	/* instantiate inode and assign the unopened fid to the dentry */
be2ca382537208 Dominique Martinet 2024-10-24  403  	inode = v9fs_get_new_inode_from_fid(v9ses, fid, dir->i_sb);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  404  	if (IS_ERR(inode)) {
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  405  		err = PTR_ERR(inode);
5d3851530d6d68 Joe Perches        2011-11-28  406  		p9_debug(P9_DEBUG_VFS, "inode creation failed %d\n",
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  407  			 err);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  408  		goto error;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  409  	}
dafbe689736f62 Dominique Martinet 2022-06-12  410  	v9fs_fid_add(dentry, &fid);
3592ac44401799 Al Viro            2013-01-31  411  	v9fs_set_create_acl(inode, fid, dacl, pacl);
5441ae5eb3614d Aneesh Kumar K.V   2011-07-25  412  	d_instantiate(dentry, inode);
2ea03e1d62d56c Al Viro            2013-02-28  413  	err = 0;
b271ec47bc11de Aneesh Kumar K.V   2011-02-28  414  	inc_nlink(dir);
d28c61f0e08aab Aneesh Kumar K.V   2011-02-28  415  	v9fs_invalidate_inode_attr(dir);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  416  error:
b48dbb998d70b7 Dominique Martinet 2022-06-12  417  	p9_fid_put(fid);
5fa6300ae0ccf7 Al Viro            2013-01-31  418  	v9fs_put_acl(dacl, pacl);
b48dbb998d70b7 Dominique Martinet 2022-06-12  419  	p9_fid_put(dfid);
88d5baf69082e5 NeilBrown          2025-02-27 @420  	return ERR_PTR(err);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  421  }
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  422  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
