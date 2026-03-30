Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4919C3D3CE4
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 19:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900780; cv=none; b=MC9ls3+4hnCJMF3NXYKSqfJoAZS1Osb8EtZYiOKow5ULW45aSR4MaiKSf651TbUcPNmxFld+8vX6XbVo/LAESSJQM4pzZPM7wPraX+VT0ObxuEM7uu40S+j/J69ZlHarj3yuBEVnNurqOndoUbsWngyjfja+p95VD5iLXQ53iWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900780; c=relaxed/simple;
	bh=XFGaHwS4s5v4Vx6mQh8Y7xMPGHJYOkC6q76KoTKBTRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=peNRLrOUUHDEKuKE4Zh4tE79DbWau6uSQC8PISdzzsbW/XHSgW2xrWAEUbSXMOLSB6YPZFfX94/bFeWoQN6ODLkJmADleDS3xckj4FDqDLBz6Wv+SJfwds8yo1fA71bImUDbwTLN7hv33S8GwdDy3thEcSa6y4WHcBHliCR2hNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q08ADbXh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q08ADbXh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4873ce69ba9so14341985e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 12:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774900777; x=1775505577; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RwONXlyUjCzfWRVAHRiZMu4AltNc74gkgeIr/kREkOo=;
        b=q08ADbXhw+NV9GPLlhhiylKuNdhr9WxHUL383KarkAp8fIf0GY1lm4YIJ1SEgf57op
         45HEcCs3hlvV16hARMu7scCwk5LsOtBRr2K1pLxtW9V7XbiwprvbZyahD3+hXRwjd3ya
         hxlwaaVDTjJmBLNBCKOXhUDcBheGJ9F9UbBDu4W6/JtpZh6A0xi6hkHWg5iUoOfAm79m
         zygzCZUR/NYwNDTteMClZgGDs66EVEDkqKSGkHNRmXGbEQfHsOpPzQcN2ZXR6G9R+lOK
         Oz6S0fEVvyyjU1KskAL1XhT1woljbI9ELcPzdFzNyzROv3c34u6n6j4+Da2eu9nbl8W7
         0iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774900777; x=1775505577;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RwONXlyUjCzfWRVAHRiZMu4AltNc74gkgeIr/kREkOo=;
        b=ijY2oWhgzgq9g6Y3BBoWEMkKgaaiRir/ebeKKjEAH2HeCR6W0pEF5FCMnr314pA4hf
         Ir63sgKnVbrOo8nIE1BakmrLC9NXZreWU7jZpWiMjL4nXyab3flqjc1AvDUE3Dnzr/HS
         juGbByYOxQyXSy6zT/YQpJGNDjwlRoRdQbrnQjxjo1PiaxUXBScvq7U7t87cLS0+9vqE
         8zQzmba2Gr5IEl6bE2p08MolcgFkIlOt39kZmdTpbvIBPDAJX2NUWM1+4FAKCon+AOp0
         3bMQfjAhO+yhoH2RxOoqZkaTfvYlBy9qGJQLuNmvT358HgBCVKQgd4Dc0VtL6d7gVCUW
         k9eA==
X-Gm-Message-State: AOJu0Ywv+FNG5jTmgnmN1TEO1Sy5O+Q3SZkw6rWG9Wwryo0My7nwGBlh
	nN+Ii65TOZZaOnWdCGrIB1k+G9xHbOZLzBSeG9EOy9yENbQ+AItyJwsj+nU0/A==
X-Gm-Gg: ATEYQzxeFXL0pKFxZgGw7Ac4BPN6twCbkQuy+pFpeCbQNm4w8svvpfKhYvKDKHkbUHW
	mrgwjT0j2HJ1dTzLBkT9CmYcBXDZIge9dkhaHJW2qEgFQ2Z0Xp3lyV5ZqnzEHSzK/FMM2Xyh/jL
	c8Tbv91iye3cm0lzGalriNu3voa2lM+U8/PRcYnxowHO4mgqh+WeWjKqfX58FPmJsm+wxjqkwhk
	RSN5f/FuSMK2CLbxvt1tXR0MJ+IeBFgZKVujpoplJ3OMUe3nDGDw36L2KzAo/radEmraUu3fO6R
	PopRABfISPdamz47LkiwuSis2KaB9Hcm6eEJBIbRchrCTLBRSVUPMxLagV+I9FTGR6vTwA9yehc
	/n1Tdl8HWsdCD3tOHBM70Kbe2UOhSDlj2hZZyoRlaF03LoCkFmdcC7wxxQCOD1bhk++qXiEWj5s
	pjd057iahH2W/+2zaeHDc=
X-Received: by 2002:a05:600c:6287:b0:486:fc3b:3e61 with SMTP id 5b1f17b1804b1-48727ef67edmr242855235e9.18.1774900777071;
        Mon, 30 Mar 2026 12:59:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887ad8d58fsm196745e9.24.2026.03.30.12.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:59:36 -0700 (PDT)
Date: Mon, 30 Mar 2026 22:59:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Steve French <stfrench@microsoft.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:pr/146 1/1] fs/smb/client/link.c:509 cifs_hardlink()
 error: we previously assumed 'old_file' could be null (see line 464)
Message-ID: <202603302356.u8QdlRIM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260330195932.yH6-UpOf3VlugwPadIwlCM9UnKc7y3PcuNfUxcv8L54@z>

tree:   https://github.com/smfrench/smb3-kernel.git pr/146
head:   d290e116f12405d8269c6041cbf68bc924b4cba6
commit: d290e116f12405d8269c6041cbf68bc924b4cba6 [1/1] smb: client: add support for O_TMPFILE (WIP)
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
                                                                                    ^^^^^^^^
If old_file is NULL

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
                                                                                                         ^^^^^^^^
Then we are toasted here.  Unchecked dereference.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

