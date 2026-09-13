Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEC0253B42
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Sep 2026 01:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789261342; cv=none; b=NvTrK3b9vnPh89w63mNW/7kNaEbHs13U2GThG9uD9+QSXiZ1T/L/JEU2/ZHi7deMPF08aV6pL5Ago+XTChpN81k9kYDoOCXw4IpAQb9n+xYz9W/brvvzmeYGk6LqwfduCx9OVgGc565H4xDzh8raSBk46voQKZbMe1Dy2PCTIcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789261342; c=relaxed/simple;
	bh=2Y+CorP7z5YDWpMlaYndDo6z+8wMwe25YgGi2+4+opc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ypz/uHmTMqcQad2ZcsToAzJqMqz9VyyLs87r9iJHKM7sfAjppOIX9ic0lUhtAMl74/9HoSr9GVpq62SYWHAdKNBFTEvxGAuBpw8OY9VcsBqR3jeILgXjoJdyr2oGb6sH1j0vU8cZkTXDXG/kaBWflo+UIbuLFaM8jtre44wlk4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQ5/RUGE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQ5/RUGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789261340; x=1820797340;
  h=date:from:to:cc:subject:message-id;
  bh=2Y+CorP7z5YDWpMlaYndDo6z+8wMwe25YgGi2+4+opc=;
  b=BQ5/RUGEp5hge/gFHbGyJ6Gmj1mzwNNGiIAXocYUfnMKRL1ROBCgOWfF
   LmRYdzGGIiWRjbh/bq2ASC8gOAm3+LRWoqE1WKh7WfGD+SstRQlPYPTMA
   B4gc2Fvj/KirHIN1i3ZCDjhJ9rcxCQnObzWDiRkZFgjFYtaI7SuoyUmbE
   5BqmT8zwgwF6V86QgsNLK0GBdKr7Rf2YcNQKTHr+mWQgRn+sYhWhEVDiW
   uU8H3fo8+ugomDJbnOxxRUDgtKGmUahTZcI6EwAufhAndHZ2arH9S/MIu
   Dq9MIfaYQFjEowd6gTVtmjrxCPdaapGnGLlZ9rTPFbWpAzUpl95QkRD2o
   g==;
X-CSE-ConnectionGUID: dOXii6kKQoegjlT33iZLOg==
X-CSE-MsgGUID: LVAkRqJmRGOrSwhQIqXltQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="101029317"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="101029317"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 18:02:19 -0700
X-CSE-ConnectionGUID: yFIF7RYeQ/ymo4W4tyVPaQ==
X-CSE-MsgGUID: 5y7gldRWTIq3lvk6nFI46g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="297289577"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 12 Sep 2026 18:02:18 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5Ybn-000000001T9-452d;
	Sun, 13 Sep 2026 01:02:15 +0000
Date: Sun, 13 Sep 2026 03:01:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [martinetd:9p-test 16/18] fs/9p/vfs_addr.c:178
 v9fs_init_request() warn: missing unwind goto?
Message-ID: <202609130252.JawbT9Iy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Deepanshu Kartikey <kartikey406@gmail.com>
CC: Dominique Martinet <asmadeus@codewreck.org>

tree:   https://github.com/martinetd/linux.git 9p-test
head:   24bc54b4ff15c7d02ed6621bb81527f3fea5d5b4
commit: 898e0ba675f92ab07ef4b6ca368d77a89ef922ca [16/18] 9p: don't WARN_ONCE on racy symlink fid lookup failure
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: hexagon-randconfig-r073-20260913 (https://download.01.org/0day-ci/archive/20260913/202609130252.JawbT9Iy-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609130252.JawbT9Iy-lkp@intel.com/

smatch warnings:
fs/9p/vfs_addr.c:178 v9fs_init_request() warn: missing unwind goto?

vim +178 fs/9p/vfs_addr.c

60e78d2c993e58 Abhishek Kulkarni   2009-09-23  142  
eb497943fa2158 David Howells       2021-11-02  143  /**
80105ed2fd2715 David Howells       2023-12-06  144   * v9fs_init_request - Initialise a request
eb497943fa2158 David Howells       2021-11-02  145   * @rreq: The read request
eb497943fa2158 David Howells       2021-11-02  146   * @file: The file being read from
eb497943fa2158 David Howells       2021-11-02  147   */
2de160417315b8 David Howells       2022-01-20  148  static int v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
eb497943fa2158 David Howells       2021-11-02  149  {
80105ed2fd2715 David Howells       2023-12-06  150  	struct p9_fid *fid;
712da38d134b66 Remi Pommarel       2026-05-21  151  	struct dentry *dentry;
80105ed2fd2715 David Howells       2023-12-06  152  	bool writing = (rreq->origin == NETFS_READ_FOR_WRITE ||
80105ed2fd2715 David Howells       2023-12-06  153  			rreq->origin == NETFS_WRITETHROUGH ||
80105ed2fd2715 David Howells       2023-12-06  154  			rreq->origin == NETFS_UNBUFFERED_WRITE ||
80105ed2fd2715 David Howells       2023-12-06  155  			rreq->origin == NETFS_DIO_WRITE);
80105ed2fd2715 David Howells       2023-12-06  156  
5fb70e7275a61d David Howells       2024-03-18  157  	if (rreq->origin == NETFS_WRITEBACK)
5fb70e7275a61d David Howells       2024-03-18  158  		return 0; /* We don't get the write handle until we find we
5fb70e7275a61d David Howells       2024-03-18  159  			   * have actually dirty data and not just
5fb70e7275a61d David Howells       2024-03-18  160  			   * copy-to-cache data.
5fb70e7275a61d David Howells       2024-03-18  161  			   */
5fb70e7275a61d David Howells       2024-03-18  162  
80105ed2fd2715 David Howells       2023-12-06  163  	if (file) {
80105ed2fd2715 David Howells       2023-12-06  164  		fid = file->private_data;
6c2c1e0009e973 David Howells       2024-01-03  165  		if (!fid)
6c2c1e0009e973 David Howells       2024-01-03  166  			goto no_fid;
80105ed2fd2715 David Howells       2023-12-06  167  		p9_fid_get(fid);
712da38d134b66 Remi Pommarel       2026-05-21  168  	} else if (S_ISLNK(rreq->inode->i_mode)) {
898e0ba675f92a Deepanshu Kartikey  2026-07-25  169  		/* racing unlink/rename can make this fail with -ENOENT;
898e0ba675f92a Deepanshu Kartikey  2026-07-25  170  		 * that's expected, not a kernel bug, so don't WARN
898e0ba675f92a Deepanshu Kartikey  2026-07-25  171  		 */
712da38d134b66 Remi Pommarel       2026-05-21  172  		dentry = d_find_any_alias(rreq->inode);
712da38d134b66 Remi Pommarel       2026-05-21  173  		if (!dentry)
712da38d134b66 Remi Pommarel       2026-05-21  174  			goto no_fid;
712da38d134b66 Remi Pommarel       2026-05-21  175  		fid = v9fs_fid_lookup(dentry);
712da38d134b66 Remi Pommarel       2026-05-21  176  		dput(dentry);
712da38d134b66 Remi Pommarel       2026-05-21  177  		if (IS_ERR(fid))
898e0ba675f92a Deepanshu Kartikey  2026-07-25 @178  			return PTR_ERR(fid);
80105ed2fd2715 David Howells       2023-12-06  179  	} else {
80105ed2fd2715 David Howells       2023-12-06  180  		fid = v9fs_fid_find_inode(rreq->inode, writing, INVALID_UID, true);
6c2c1e0009e973 David Howells       2024-01-03  181  		if (!fid)
6c2c1e0009e973 David Howells       2024-01-03  182  			goto no_fid;
80105ed2fd2715 David Howells       2023-12-06  183  	}
b0017602fdf6bd Dominique Martinet  2022-06-14  184  
5fb70e7275a61d David Howells       2024-03-18  185  	rreq->wsize = fid->clnt->msize - P9_IOHDRSZ;
5fb70e7275a61d David Howells       2024-03-18  186  	if (fid->iounit)
5fb70e7275a61d David Howells       2024-03-18  187  		rreq->wsize = min(rreq->wsize, fid->iounit);
5fb70e7275a61d David Howells       2024-03-18  188  
b0017602fdf6bd Dominique Martinet  2022-06-14  189  	/* we might need to read from a fid that was opened write-only
b0017602fdf6bd Dominique Martinet  2022-06-14  190  	 * for read-modify-write of page cache, use the writeback fid
b0017602fdf6bd Dominique Martinet  2022-06-14  191  	 * for that */
80105ed2fd2715 David Howells       2023-12-06  192  	WARN_ON(rreq->origin == NETFS_READ_FOR_WRITE && !(fid->mode & P9_ORDWR));
eb497943fa2158 David Howells       2021-11-02  193  	rreq->netfs_priv = fid;
2de160417315b8 David Howells       2022-01-20  194  	return 0;
6c2c1e0009e973 David Howells       2024-01-03  195  
6c2c1e0009e973 David Howells       2024-01-03  196  no_fid:
0b2600f81cefcd Jeff Layton         2026-03-04  197  	WARN_ONCE(1, "folio expected an open fid inode->i_ino=%llx\n",
6c2c1e0009e973 David Howells       2024-01-03  198  		  rreq->inode->i_ino);
6c2c1e0009e973 David Howells       2024-01-03  199  	return -EINVAL;
eb497943fa2158 David Howells       2021-11-02  200  }
147b31cf09ee49 Eric Van Hensbergen 2006-01-18  201  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
