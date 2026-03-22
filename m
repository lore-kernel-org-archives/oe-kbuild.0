Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B008175A9A
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 22:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774218212; cv=none; b=JYhHlRgmK8TFQTIRoG24gjMgynkkprEZkRyzCxliK//W65RUjJqEgURU2FNTPe7GwoX4+4XtrEQAcXnA7L+ofugD+vrMxtp/80nikiZV5DgRIo58TFrdTJI4C1zmO5Hi/EaLXdFW2yIOIt2HFLKYwckzFW6ipFo1/LhBPBspMho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774218212; c=relaxed/simple;
	bh=jqXDrfH+zOTitlG/PmDUpqOLvM8r2K+Ifs5w37z7qFw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TVBNiJd8Njdha/r3C214WTLZ0fXgBvQFPd0qByH+vGJtrSyc7gcJum0r0fPZHy/MArH2YeRJV9lplB5XTEidBWhlLiObXGQ5tlB6cMP9NvsECgjtTVRVSJ/M3D+XllxRD1wpGNx+fB83p6fzRJVHuw1xgGchP6ALZHFMA8uDXmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCxKk2VD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCxKk2VD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774218209; x=1805754209;
  h=date:from:to:cc:subject:message-id;
  bh=jqXDrfH+zOTitlG/PmDUpqOLvM8r2K+Ifs5w37z7qFw=;
  b=UCxKk2VDra5DWUg3T9BzOXByAyS0Gpv4grKnUQ1SpEW8n6HJ5/5MHxHQ
   9Ep42CuQ69+l406/CVAJUkQ1keA2l9Ol86VazErmPz3+AJOKKAd5fzdqI
   LJCd8VssZbnnvjNeosV+6ospnZk1euSMIsjMQ1PrA/ZdlyhMUh0xqCG05
   Elcfwrv0P8pwAZ9Q9ap/VpQYOkD5VQVwbo7bXdo00QUyHJbMx6O6yIMGc
   2VUG/6Opi7zKqsmORxiS7Wy4XNghbKoaYAAvph3EDASap/TL4PoyvJNLW
   HRD2zGyQaZlRKqKcZ66RZZlypddSM00bZLbl6TP0BAQ2QYsJd/+NAkFGH
   w==;
X-CSE-ConnectionGUID: pubEp1y6Ss2sxG8Xb88LMQ==
X-CSE-MsgGUID: WXqRL2+8QW6lYEAo/fGd3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="97842452"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="97842452"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 15:23:29 -0700
X-CSE-ConnectionGUID: tuqfv4obREinmBXEdDLJew==
X-CSE-MsgGUID: dHpAggzTQuSdMNvlcHc5QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="219527538"
Received: from lkp-server02.sh.intel.com (HELO 391eea459618) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Mar 2026 15:23:27 -0700
Received: from kbuild by 391eea459618 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4RCN-0000000004L-1UN6;
	Sun, 22 Mar 2026 22:23:20 +0000
Date: Mon, 23 Mar 2026 06:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/jfs/namei.c:311 jfs_mkdir() warn: passing zero to
 'ERR_PTR'
Message-ID: <202603230639.7DPVYNEM-lkp@intel.com>
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
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-141-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230639.7DPVYNEM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603230639.7DPVYNEM-lkp@intel.com/

smatch warnings:
fs/jfs/namei.c:311 jfs_mkdir() warn: passing zero to 'ERR_PTR'
fs/orangefs/namei.c:369 orangefs_mkdir() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +311 fs/jfs/namei.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  178  
^1da177e4c3f41 Linus Torvalds    2005-04-16  179  
^1da177e4c3f41 Linus Torvalds    2005-04-16  180  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  181   * NAME:	jfs_mkdir(dip, dentry, mode)
^1da177e4c3f41 Linus Torvalds    2005-04-16  182   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  183   * FUNCTION:	create a child directory in the parent directory <dip>
^1da177e4c3f41 Linus Torvalds    2005-04-16  184   *		with name = <from dentry> and mode = <mode>
^1da177e4c3f41 Linus Torvalds    2005-04-16  185   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  186   * PARAMETER:	dip	- parent directory vnode
^1da177e4c3f41 Linus Torvalds    2005-04-16  187   *		dentry	- dentry of child directory
^1da177e4c3f41 Linus Torvalds    2005-04-16  188   *		mode	- create mode (rwxrwxrwx).
^1da177e4c3f41 Linus Torvalds    2005-04-16  189   *
88d5baf69082e5 NeilBrown         2025-02-27  190   * RETURN:	ERR_PTR() of errors from subroutines.
^1da177e4c3f41 Linus Torvalds    2005-04-16  191   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  192   * note:
a83722f45c5baa Colin Ian King    2018-10-26  193   * EACCES: user needs search+write permission on the parent directory
^1da177e4c3f41 Linus Torvalds    2005-04-16  194   */
88d5baf69082e5 NeilBrown         2025-02-27  195  static struct dentry *jfs_mkdir(struct mnt_idmap *idmap, struct inode *dip,
549c7297717c32 Christian Brauner 2021-01-21  196  				struct dentry *dentry, umode_t mode)
^1da177e4c3f41 Linus Torvalds    2005-04-16  197  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  198  	int rc = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  199  	tid_t tid;		/* transaction id */
^1da177e4c3f41 Linus Torvalds    2005-04-16  200  	struct inode *ip = NULL;	/* child directory inode */
^1da177e4c3f41 Linus Torvalds    2005-04-16  201  	ino_t ino;
^1da177e4c3f41 Linus Torvalds    2005-04-16  202  	struct component_name dname;	/* child directory name */
^1da177e4c3f41 Linus Torvalds    2005-04-16  203  	struct btstack btstack;
^1da177e4c3f41 Linus Torvalds    2005-04-16  204  	struct inode *iplist[2];
^1da177e4c3f41 Linus Torvalds    2005-04-16  205  	struct tblock *tblk;
^1da177e4c3f41 Linus Torvalds    2005-04-16  206  
a455589f181e60 Al Viro           2014-10-21  207  	jfs_info("jfs_mkdir: dip:0x%p name:%pd", dip, dentry);
^1da177e4c3f41 Linus Torvalds    2005-04-16  208  
acc84b05b1f463 Dave Kleikamp     2015-07-15  209  	rc = dquot_initialize(dip);
acc84b05b1f463 Dave Kleikamp     2015-07-15  210  	if (rc)
acc84b05b1f463 Dave Kleikamp     2015-07-15  211  		goto out1;
907f4554e2521c Christoph Hellwig 2010-03-03  212  
^1da177e4c3f41 Linus Torvalds    2005-04-16  213  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  214  	 * search parent directory for entry/freespace
^1da177e4c3f41 Linus Torvalds    2005-04-16  215  	 * (dtSearch() returns parent directory page pinned)
^1da177e4c3f41 Linus Torvalds    2005-04-16  216  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  217  	if ((rc = get_UCSname(&dname, dentry)))
^1da177e4c3f41 Linus Torvalds    2005-04-16  218  		goto out1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  219  
^1da177e4c3f41 Linus Torvalds    2005-04-16  220  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  221  	 * Either iAlloc() or txBegin() may block.  Deadlock can occur if we
^1da177e4c3f41 Linus Torvalds    2005-04-16  222  	 * block there while holding dtree page, so we allocate the inode &
^1da177e4c3f41 Linus Torvalds    2005-04-16  223  	 * begin the transaction before we search the directory.
^1da177e4c3f41 Linus Torvalds    2005-04-16  224  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  225  	ip = ialloc(dip, S_IFDIR | mode);
087387f90f577f Akinobu Mita      2006-09-14  226  	if (IS_ERR(ip)) {
087387f90f577f Akinobu Mita      2006-09-14  227  		rc = PTR_ERR(ip);
^1da177e4c3f41 Linus Torvalds    2005-04-16  228  		goto out2;
^1da177e4c3f41 Linus Torvalds    2005-04-16  229  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  230  
^1da177e4c3f41 Linus Torvalds    2005-04-16  231  	tid = txBegin(dip->i_sb, 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  232  
82d5b9a7c63054 Dave Kleikamp     2007-01-09  233  	mutex_lock_nested(&JFS_IP(dip)->commit_mutex, COMMIT_MUTEX_PARENT);
82d5b9a7c63054 Dave Kleikamp     2007-01-09  234  	mutex_lock_nested(&JFS_IP(ip)->commit_mutex, COMMIT_MUTEX_CHILD);
^1da177e4c3f41 Linus Torvalds    2005-04-16  235  
4f4b401bfaa97e Dave Kleikamp     2005-09-01  236  	rc = jfs_init_acl(tid, ip, dip);
4f4b401bfaa97e Dave Kleikamp     2005-09-01  237  	if (rc)
4f4b401bfaa97e Dave Kleikamp     2005-09-01  238  		goto out3;
4f4b401bfaa97e Dave Kleikamp     2005-09-01  239  
2a7dba391e5628 Eric Paris        2011-02-01  240  	rc = jfs_init_security(tid, ip, dip, &dentry->d_name);
1d15b10f95d4c4 Dave Kleikamp     2005-09-01  241  	if (rc) {
1d15b10f95d4c4 Dave Kleikamp     2005-09-01  242  		txAbort(tid, 0);
1d15b10f95d4c4 Dave Kleikamp     2005-09-01  243  		goto out3;
1d15b10f95d4c4 Dave Kleikamp     2005-09-01  244  	}
1d15b10f95d4c4 Dave Kleikamp     2005-09-01  245  
^1da177e4c3f41 Linus Torvalds    2005-04-16  246  	if ((rc = dtSearch(dip, &dname, &ino, &btstack, JFS_CREATE))) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  247  		jfs_err("jfs_mkdir: dtSearch returned %d", rc);
4f4b401bfaa97e Dave Kleikamp     2005-09-01  248  		txAbort(tid, 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  249  		goto out3;
^1da177e4c3f41 Linus Torvalds    2005-04-16  250  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  251  
^1da177e4c3f41 Linus Torvalds    2005-04-16  252  	tblk = tid_to_tblock(tid);
^1da177e4c3f41 Linus Torvalds    2005-04-16  253  	tblk->xflag |= COMMIT_CREATE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  254  	tblk->ino = ip->i_ino;
^1da177e4c3f41 Linus Torvalds    2005-04-16  255  	tblk->u.ixpxd = JFS_IP(ip)->ixpxd;
^1da177e4c3f41 Linus Torvalds    2005-04-16  256  
^1da177e4c3f41 Linus Torvalds    2005-04-16  257  	iplist[0] = dip;
^1da177e4c3f41 Linus Torvalds    2005-04-16  258  	iplist[1] = ip;
^1da177e4c3f41 Linus Torvalds    2005-04-16  259  
^1da177e4c3f41 Linus Torvalds    2005-04-16  260  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  261  	 * initialize the child directory in-line in inode
^1da177e4c3f41 Linus Torvalds    2005-04-16  262  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  263  	dtInitRoot(tid, ip, dip->i_ino);
^1da177e4c3f41 Linus Torvalds    2005-04-16  264  
^1da177e4c3f41 Linus Torvalds    2005-04-16  265  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  266  	 * create entry in parent directory for child directory
^1da177e4c3f41 Linus Torvalds    2005-04-16  267  	 * (dtInsert() releases parent directory page)
^1da177e4c3f41 Linus Torvalds    2005-04-16  268  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  269  	ino = ip->i_ino;
^1da177e4c3f41 Linus Torvalds    2005-04-16  270  	if ((rc = dtInsert(tid, dip, &dname, &ino, &btstack))) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  271  		if (rc == -EIO) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  272  			jfs_err("jfs_mkdir: dtInsert returned -EIO");
^1da177e4c3f41 Linus Torvalds    2005-04-16  273  			txAbort(tid, 1);	/* Marks Filesystem dirty */
^1da177e4c3f41 Linus Torvalds    2005-04-16  274  		} else
^1da177e4c3f41 Linus Torvalds    2005-04-16  275  			txAbort(tid, 0);	/* Filesystem full */
^1da177e4c3f41 Linus Torvalds    2005-04-16  276  		goto out3;
^1da177e4c3f41 Linus Torvalds    2005-04-16  277  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  278  
bfe8684869601d Miklos Szeredi    2011-10-28  279  	set_nlink(ip, 2);	/* for '.' */
^1da177e4c3f41 Linus Torvalds    2005-04-16  280  	ip->i_op = &jfs_dir_inode_operations;
^1da177e4c3f41 Linus Torvalds    2005-04-16  281  	ip->i_fop = &jfs_dir_operations;
^1da177e4c3f41 Linus Torvalds    2005-04-16  282  
^1da177e4c3f41 Linus Torvalds    2005-04-16  283  	mark_inode_dirty(ip);
^1da177e4c3f41 Linus Torvalds    2005-04-16  284  
^1da177e4c3f41 Linus Torvalds    2005-04-16  285  	/* update parent directory inode */
d8c76e6f45c111 Dave Hansen       2006-09-30  286  	inc_nlink(dip);		/* for '..' from child directory */
dc34d1330c2c08 Jeff Layton       2023-10-04  287  	inode_set_mtime_to_ts(dip, inode_set_ctime_current(dip));
^1da177e4c3f41 Linus Torvalds    2005-04-16  288  	mark_inode_dirty(dip);
^1da177e4c3f41 Linus Torvalds    2005-04-16  289  
^1da177e4c3f41 Linus Torvalds    2005-04-16  290  	rc = txCommit(tid, 2, &iplist[0], 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  291  
^1da177e4c3f41 Linus Torvalds    2005-04-16  292        out3:
^1da177e4c3f41 Linus Torvalds    2005-04-16  293  	txEnd(tid);
1de87444f8f910 Ingo Molnar       2006-01-24  294  	mutex_unlock(&JFS_IP(ip)->commit_mutex);
48ce8b056c8892 Evgeniy Dushistov 2006-06-05  295  	mutex_unlock(&JFS_IP(dip)->commit_mutex);
^1da177e4c3f41 Linus Torvalds    2005-04-16  296  	if (rc) {
4f4b401bfaa97e Dave Kleikamp     2005-09-01  297  		free_ea_wmap(ip);
6d6b77f163c7ea Miklos Szeredi    2011-10-28  298  		clear_nlink(ip);
a6cbedfa8783b4 Al Viro           2018-06-29  299  		discard_new_inode(ip);
1f3403fa640f9f Dave Kleikamp     2008-12-30  300  	} else {
1e2e547a93a00e Al Viro           2018-05-04  301  		d_instantiate_new(dentry, ip);
1f3403fa640f9f Dave Kleikamp     2008-12-30  302  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  303  
^1da177e4c3f41 Linus Torvalds    2005-04-16  304        out2:
^1da177e4c3f41 Linus Torvalds    2005-04-16  305  	free_UCSname(&dname);
^1da177e4c3f41 Linus Torvalds    2005-04-16  306  
^1da177e4c3f41 Linus Torvalds    2005-04-16  307  
^1da177e4c3f41 Linus Torvalds    2005-04-16  308        out1:
^1da177e4c3f41 Linus Torvalds    2005-04-16  309  
^1da177e4c3f41 Linus Torvalds    2005-04-16  310  	jfs_info("jfs_mkdir: rc:%d", rc);
88d5baf69082e5 NeilBrown         2025-02-27 @311  	return ERR_PTR(rc);
^1da177e4c3f41 Linus Torvalds    2005-04-16  312  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  313  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
