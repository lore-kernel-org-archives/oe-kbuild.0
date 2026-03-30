Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692002E7BD3
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774884802; cv=none; b=PhIq5nLqJlhxJXbQ5E6Qa3ZH3ICh7iaEYt9ukTaTF1Qm65fsv7vkS9sDgbvKCj6kROSrEhDzp2/rj26BAhAMEWXrhvO27qxqY2kMsYg0M5aK6JpTJWln48gAycFYPqKhoZeHeSyxIyZyxBzkhSflBnm2cieCRgwHVdiIOBatZfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774884802; c=relaxed/simple;
	bh=LpmH3qHNMpK6IuBIJl24LOV7dWGmBr2d331tXgf1Z3c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rtfRZe/VnxpZAioe//GzN/yv6ZZeZ9aGi7iWmZnZOGDbFZcZ4kdPhngnwv0PCvoEYJZqTr8uBC63lqi4Y+/27rqz1RlneE8fzmghXEeZMUULYFJdAmcaNKRwck/gwo6lg7v+zu4uFa7mAz0rJuX5eJ6VFFHDuCy2k76gQ1gIDcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQhjGeSv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQhjGeSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774884801; x=1806420801;
  h=date:from:to:cc:subject:message-id;
  bh=LpmH3qHNMpK6IuBIJl24LOV7dWGmBr2d331tXgf1Z3c=;
  b=kQhjGeSv2DnpprlO20xyuZyg4CAGZUq4v5v7JTMYUWE/bDM4I+7hKHy1
   ibZ5VK3rKk7g83U+jysfeSnJKI4iaXBrnweG0QEXItdZiQT/JtCZlgtSv
   YaBvvcV+iXvlMmndEuzqcwBIzkCo38Lkx3AXgx/2U5wJVsXjA1Wa/XVzh
   c/nNNUh3k5p1kLO0e1rgrp00HvCL9w830FbUFX95KgySG7JGKs1LD0pgB
   7zca0aFOQbLINfvqu5BAH9SUU0tkVdgt84jNJV3a8m9qRjQXCvOkP5Zhh
   rOfGtihA8U5bZk2jg0OnjBXneGpln7aKF0snVTn4otbeEJM64F2WAmLNM
   g==;
X-CSE-ConnectionGUID: HT9q9CmQT/qmqfyvS54r3w==
X-CSE-MsgGUID: V8XxbdaFSLK3YYmZWMUjHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86573536"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="86573536"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 08:33:20 -0700
X-CSE-ConnectionGUID: P8yICNqeTAChWty28bbAYg==
X-CSE-MsgGUID: SOMZTaitTQKlrQg3zqBNkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="219441982"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Mar 2026 08:33:18 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Ec8-000000001Gb-1oGI;
	Mon, 30 Mar 2026 15:33:16 +0000
Date: Mon, 30 Mar 2026 23:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [smfrench-smb3:pr/146 1/1] fs/smb/client/link.c:509
 cifs_hardlink() error: we previously assumed 'old_file' could be null (see
 line 464)
Message-ID: <202603302356.u8QdlRIM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Steve French <stfrench@microsoft.com>

tree:   https://github.com/smfrench/smb3-kernel.git pr/146
head:   d290e116f12405d8269c6041cbf68bc924b4cba6
commit: d290e116f12405d8269c6041cbf68bc924b4cba6 [1/1] smb: client: add support for O_TMPFILE (WIP)
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: x86_64-randconfig-161-20260330 (https://download.01.org/0day-ci/archive/20260330/202603302356.u8QdlRIM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603302356.u8QdlRIM-lkp@intel.com/

smatch warnings:
fs/smb/client/link.c:509 cifs_hardlink() error: we previously assumed 'old_file' could be null (see line 464)

vim +/old_file +509 fs/smb/client/link.c

5ab97578cbb3bf fs/cifs/link.c       Steve French         2014-09-15  435  
0f8dce1cb7454f fs/cifs/link.c       Sachin Prabhu        2013-11-25  436  /*
0f8dce1cb7454f fs/cifs/link.c       Sachin Prabhu        2013-11-25  437   * M-F Symlink Functions - End
0f8dce1cb7454f fs/cifs/link.c       Sachin Prabhu        2013-11-25  438   */
8bfb50a882ccd9 fs/cifs/link.c       Stefan Metzmacher    2010-07-31  439  
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  440  int
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  441  cifs_hardlink(struct dentry *old_file, struct inode *inode,
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  442  	      struct dentry *direntry)
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  443  {
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  444  	int rc = -EACCES;
6d5786a34d98bf fs/cifs/link.c       Pavel Shilovsky      2012-06-20  445  	unsigned int xid;
f6a9bc336b600e fs/cifs/link.c       Al Viro              2021-03-05  446  	const char *from_name, *to_name;
d290e116f12405 fs/smb/client/link.c Paulo Alcantara      2026-03-27  447  	void *page1 = NULL, *page2 = NULL;
7ffec372458d16 fs/cifs/link.c       Jeff Layton          2010-09-29  448  	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
7ffec372458d16 fs/cifs/link.c       Jeff Layton          2010-09-29  449  	struct tcon_link *tlink;
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  450  	struct cifs_tcon *tcon;
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  451  	struct TCP_Server_Info *server;
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  452  	struct cifsInodeInfo *cifsInode;
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  453  
087f757b012985 fs/cifs/link.c       Steve French         2021-04-29  454  	if (unlikely(cifs_forced_shutdown(cifs_sb)))
f80ac7eda1cf52 fs/smb/client/link.c David Howells        2025-10-24  455  		return smb_EIO(smb_eio_trace_forced_shutdown);
087f757b012985 fs/cifs/link.c       Steve French         2021-04-29  456  
7ffec372458d16 fs/cifs/link.c       Jeff Layton          2010-09-29  457  	tlink = cifs_sb_tlink(cifs_sb);
7ffec372458d16 fs/cifs/link.c       Jeff Layton          2010-09-29  458  	if (IS_ERR(tlink))
7ffec372458d16 fs/cifs/link.c       Jeff Layton          2010-09-29  459  		return PTR_ERR(tlink);
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  460  	tcon = tlink_tcon(tlink);
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  461  
6d5786a34d98bf fs/cifs/link.c       Pavel Shilovsky      2012-06-20  462  	xid = get_xid();
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  463  
d290e116f12405 fs/smb/client/link.c Paulo Alcantara      2026-03-27 @464  	if (old_file && d_really_is_positive(old_file) &&
d290e116f12405 fs/smb/client/link.c Paulo Alcantara      2026-03-27  465  	    test_bit(CIFS_INO_TMPFILE, &CIFS_I(d_inode(old_file))->flags)) {
d290e116f12405 fs/smb/client/link.c Paulo Alcantara      2026-03-27  466  		from_name = NULL;
d290e116f12405 fs/smb/client/link.c Paulo Alcantara      2026-03-27  467  	} else {
d290e116f12405 fs/smb/client/link.c Paulo Alcantara      2026-03-27  468  		page1 = alloc_dentry_path();
f6a9bc336b600e fs/cifs/link.c       Al Viro              2021-03-05  469  		from_name = build_path_from_dentry(old_file, page1);
f6a9bc336b600e fs/cifs/link.c       Al Viro              2021-03-05  470  		if (IS_ERR(from_name)) {
f6a9bc336b600e fs/cifs/link.c       Al Viro              2021-03-05  471  			rc = PTR_ERR(from_name);
f6a9bc336b600e fs/cifs/link.c       Al Viro              2021-03-05  472  			goto cifs_hl_exit;
f6a9bc336b600e fs/cifs/link.c       Al Viro              2021-03-05  473  		}
d290e116f12405 fs/smb/client/link.c Paulo Alcantara      2026-03-27  474  	}
d290e116f12405 fs/smb/client/link.c Paulo Alcantara      2026-03-27  475  
d290e116f12405 fs/smb/client/link.c Paulo Alcantara      2026-03-27  476  	page2 = alloc_dentry_path();
f6a9bc336b600e fs/cifs/link.c       Al Viro              2021-03-05  477  	to_name = build_path_from_dentry(direntry, page2);
f6a9bc336b600e fs/cifs/link.c       Al Viro              2021-03-05  478  	if (IS_ERR(to_name)) {
f6a9bc336b600e fs/cifs/link.c       Al Viro              2021-03-05  479  		rc = PTR_ERR(to_name);
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  480  		goto cifs_hl_exit;
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  481  	}
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  482  
fb157ed226d225 fs/cifs/link.c       Steve French         2022-08-01  483  #ifdef CONFIG_CIFS_ALLOW_INSECURE_LEGACY
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  484  	if (tcon->unix_ext)
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  485  		rc = CIFSUnixCreateHardLink(xid, tcon, from_name, to_name,
7ffec372458d16 fs/cifs/link.c       Jeff Layton          2010-09-29  486  					    cifs_sb->local_nls,
2baa2682531ff0 fs/cifs/link.c       Steve French         2014-09-27  487  					    cifs_remap(cifs_sb));
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  488  	else {
fb157ed226d225 fs/cifs/link.c       Steve French         2022-08-01  489  #else
fb157ed226d225 fs/cifs/link.c       Steve French         2022-08-01  490  	{
fb157ed226d225 fs/cifs/link.c       Steve French         2022-08-01  491  #endif /* CONFIG_CIFS_ALLOW_INSECURE_LEGACY */
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  492  		server = tcon->ses->server;
abf9767c823bf5 fs/cifs/link.c       Christian Engelmayer 2014-01-11  493  		if (!server->ops->create_hardlink) {
abf9767c823bf5 fs/cifs/link.c       Christian Engelmayer 2014-01-11  494  			rc = -ENOSYS;
abf9767c823bf5 fs/cifs/link.c       Christian Engelmayer 2014-01-11  495  			goto cifs_hl_exit;
abf9767c823bf5 fs/cifs/link.c       Christian Engelmayer 2014-01-11  496  		}
5408990aa662bc fs/smb/client/link.c Paulo Alcantara      2023-11-25  497  		rc = server->ops->create_hardlink(xid, tcon, old_file,
5408990aa662bc fs/smb/client/link.c Paulo Alcantara      2023-11-25  498  						  from_name, to_name, cifs_sb);
083d3a2cff514c fs/cifs/link.c       Steve French         2006-03-03  499  		if ((rc == -EIO) || (rc == -EINVAL))
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  500  			rc = -EOPNOTSUPP;
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  501  	}
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  502  
31ec35d6c81175 fs/cifs/link.c       Steve French         2006-11-16  503  	d_drop(direntry);	/* force new lookup from server of target */
31ec35d6c81175 fs/cifs/link.c       Steve French         2006-11-16  504  
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  505  	/*
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  506  	 * if source file is cached (oplocked) revalidate will not go to server
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  507  	 * until the file is closed or oplock broken so update nlinks locally
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  508  	 */
2b0143b5c986be fs/cifs/link.c       David Howells        2015-03-17 @509  	if (d_really_is_positive(old_file)) {
2b0143b5c986be fs/cifs/link.c       David Howells        2015-03-17  510  		cifsInode = CIFS_I(d_inode(old_file));
31ec35d6c81175 fs/cifs/link.c       Steve French         2006-11-16  511  		if (rc == 0) {
d290e116f12405 fs/smb/client/link.c Paulo Alcantara      2026-03-27  512  			clear_bit(CIFS_INO_TMPFILE, &cifsInode->flags);
2b0143b5c986be fs/cifs/link.c       David Howells        2015-03-17  513  			spin_lock(&d_inode(old_file)->i_lock);
2b0143b5c986be fs/cifs/link.c       David Howells        2015-03-17  514  			inc_nlink(d_inode(old_file));
2b0143b5c986be fs/cifs/link.c       David Howells        2015-03-17  515  			spin_unlock(&d_inode(old_file)->i_lock);
ff273cb879fbc6 fs/cifs/link.c       Steve French         2014-10-17  516  
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  517  			/*
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  518  			 * parent dir timestamps will update from srv within a
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  519  			 * second, would it really be worth it to set the parent
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  520  			 * dir cifs inode time to zero to force revalidate
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  521  			 * (faster) for it too?
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  522  			 */
31ec35d6c81175 fs/cifs/link.c       Steve French         2006-11-16  523  		}
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  524  		/*
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  525  		 * if not oplocked will force revalidate to get info on source
ff273cb879fbc6 fs/cifs/link.c       Steve French         2014-10-17  526  		 * file from srv.  Note Samba server prior to 4.2 has bug -
ff273cb879fbc6 fs/cifs/link.c       Steve French         2014-10-17  527  		 * not updating src file ctime on hardlinks but Windows servers
ff273cb879fbc6 fs/cifs/link.c       Steve French         2014-10-17  528  		 * handle it properly
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  529  		 */
31ec35d6c81175 fs/cifs/link.c       Steve French         2006-11-16  530  		cifsInode->time = 0;
31ec35d6c81175 fs/cifs/link.c       Steve French         2006-11-16  531  
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  532  		/*
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  533  		 * Will update parent dir timestamps from srv within a second.
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  534  		 * Would it really be worth it to set the parent dir (cifs
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  535  		 * inode) time field to zero to force revalidate on parent
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  536  		 * directory faster ie
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  537  		 *
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  538  		 * CIFS_I(inode)->time = 0;
d6e906f1b571d1 fs/cifs/link.c       Steve French         2012-09-18  539  		 */
31ec35d6c81175 fs/cifs/link.c       Steve French         2006-11-16  540  	}
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  541  
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  542  cifs_hl_exit:
f6a9bc336b600e fs/cifs/link.c       Al Viro              2021-03-05  543  	free_dentry_path(page1);
f6a9bc336b600e fs/cifs/link.c       Al Viro              2021-03-05  544  	free_dentry_path(page2);
6d5786a34d98bf fs/cifs/link.c       Pavel Shilovsky      2012-06-20  545  	free_xid(xid);
7ffec372458d16 fs/cifs/link.c       Jeff Layton          2010-09-29  546  	cifs_put_tlink(tlink);
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  547  	return rc;
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  548  }
^1da177e4c3f41 fs/cifs/link.c       Linus Torvalds       2005-04-16  549  

:::::: The code at line 509 was first introduced by commit
:::::: 2b0143b5c986be1ce8408b3aadc4709e0a94429d VFS: normal filesystems (and lustre): d_inode() annotations

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
