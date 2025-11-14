Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A32C33B947
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Nov 2025 17:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763141287; cv=none; b=HbiwgxnPRl+fkgdR8DcheNj/xSHOOBq8A3F0gXlhrQlWnCtj0PXWVK6N7ZODJy/b0c6W3qoSZHQBRMJ5ioriiyFHtIwc07HXiKdbXkrcTm2r746TR7J7TxWwwSd9QE9oAkbK/c1G4nl+Da03nN1PorwUzAa+GU8t3zCpuU6qAqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763141287; c=relaxed/simple;
	bh=sJxYabeSBVlg2Xm3dgsJEPts/S45hj9zFa1NahSklWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eLkkKGLNA9EbTYdHf+fDV7UkwgLzVauCN8pM/Y/fHb7gXfWuL5SNB/3w3Wfj9dIr9Cc0OMztVPdi0ZbOtxLR5oPxYq2s5WLIA476cyvP+ZHLhEwve9/n5DyOTojv8R2FR1Ob0VjcF38eCZT3Nf3/Kw2gB1KqVQ6HMNkKK45rsEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5J3Cmtf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5J3Cmtf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763141286; x=1794677286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sJxYabeSBVlg2Xm3dgsJEPts/S45hj9zFa1NahSklWI=;
  b=Q5J3Cmtf7TnxUcu3cIYcr5IJ1AYCCJcMyVnScG2zUpLtUdNEi/zJjmQU
   7xf8yBe/SPECHwauRS/c5PSGWhxmhjMx9Snf/KHv9sKmR9ikzl0TQNr3f
   IssEMnzC75+RHAmqPqtR/w/hlvRbxDTAPRA0r0qSiCccPOYe0e5Jx+XgM
   TAHJ63r/YT241s5dBO8kGhRMLyiPZjek4KiHtx4BeIWMHmpGumRSXneun
   jCf/citNay+1Aiizit+MSDwalLFKcuGiu5xduxvWifVJwsMKnjJxaXWK3
   +FVfqA6tY1OfDfmKSI/RU2Z7Opw6FBlZMfQdjK5SxGMGEeoVbQ3qN6iNr
   Q==;
X-CSE-ConnectionGUID: I6x+72ZRQma8SbURwJqXLA==
X-CSE-MsgGUID: Q6sHepevTD+o07s46IqMFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65171447"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65171447"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:28:05 -0800
X-CSE-ConnectionGUID: QdtRpim8TuesZGhHGcSHrA==
X-CSE-MsgGUID: VzFdTSknQY+uc/TwLyxsDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="190258292"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Nov 2025 09:28:04 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJxab-0006rz-2R;
	Fri, 14 Nov 2025 17:28:01 +0000
Date: Sat, 15 Nov 2025 01:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.ovl.cred.guard.prepare 29/53]
 fs/overlayfs/readdir.c:871 ovl_iterate_merged() error: uninitialized symbol
 'err'.
Message-ID: <202511150158.sb6MRtZf-lkp@intel.com>
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
TO: Amir Goldstein <amir73il@gmail.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.ovl.cred.guard.prepare
head:   6adfde0460758ff27a5d5cfd05c0cfada7070e1a
commit: 723ebc8013726565be4117240fbda90c25d3e4b5 [29/53] ovl: refactor ovl_iterate() and port to cred guard
:::::: branch date: 7 hours ago
:::::: commit date: 8 hours ago
config: mips-randconfig-r072-20251114 (https://download.01.org/0day-ci/archive/20251115/202511150158.sb6MRtZf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511150158.sb6MRtZf-lkp@intel.com/

New smatch warnings:
fs/overlayfs/readdir.c:871 ovl_iterate_merged() error: uninitialized symbol 'err'.

Old smatch warnings:
fs/overlayfs/readdir.c:1022 ovl_dir_fsync() warn: 'realfile' is an error pointer or valid

vim +/err +871 fs/overlayfs/readdir.c

4edb83bb1041e2 Miklos Szeredi    2017-07-27  834  
723ebc80137265 Amir Goldstein    2025-11-13  835  static int ovl_iterate_merged(struct file *file, struct dir_context *ctx)
e9be9d5e76e348 Miklos Szeredi    2014-10-24  836  {
e9be9d5e76e348 Miklos Szeredi    2014-10-24  837  	struct ovl_dir_file *od = file->private_data;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  838  	struct dentry *dentry = file->f_path.dentry;
4330397e4e8a66 hujianyang        2014-12-11  839  	struct ovl_cache_entry *p;
b5efccbe0a12a9 Amir Goldstein    2017-05-11  840  	int err;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  841  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  842  	if (!od->cache) {
e9be9d5e76e348 Miklos Szeredi    2014-10-24  843  		struct ovl_dir_cache *cache;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  844  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  845  		cache = ovl_cache_get(dentry);
48bd024b8a40d7 Miklos Szeredi    2020-06-02  846  		err = PTR_ERR(cache);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  847  		if (IS_ERR(cache))
723ebc80137265 Amir Goldstein    2025-11-13  848  			return err;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  849  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  850  		od->cache = cache;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  851  		ovl_seek_cursor(od, ctx->pos);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  852  	}
e9be9d5e76e348 Miklos Szeredi    2014-10-24  853  
4330397e4e8a66 hujianyang        2014-12-11  854  	while (od->cursor != &od->cache->entries) {
4330397e4e8a66 hujianyang        2014-12-11  855  		p = list_entry(od->cursor, struct ovl_cache_entry, l_node);
b5efccbe0a12a9 Amir Goldstein    2017-05-11  856  		if (!p->is_whiteout) {
bc8df7a3dc0359 Alexander Larsson 2023-08-23  857  			if (!p->ino || p->check_xwhiteout) {
bc8df7a3dc0359 Alexander Larsson 2023-08-23  858  				err = ovl_cache_update(&file->f_path, p, !p->ino);
b5efccbe0a12a9 Amir Goldstein    2017-05-11  859  				if (err)
723ebc80137265 Amir Goldstein    2025-11-13  860  					return err;
b5efccbe0a12a9 Amir Goldstein    2017-05-11  861  			}
9011c2791e63fc Amir Goldstein    2021-04-26  862  		}
bc8df7a3dc0359 Alexander Larsson 2023-08-23  863  		/* ovl_cache_update() sets is_whiteout on stale entry */
9011c2791e63fc Amir Goldstein    2021-04-26  864  		if (!p->is_whiteout) {
e9be9d5e76e348 Miklos Szeredi    2014-10-24  865  			if (!dir_emit(ctx, p->name, p->len, p->ino, p->type))
e9be9d5e76e348 Miklos Szeredi    2014-10-24  866  				break;
b5efccbe0a12a9 Amir Goldstein    2017-05-11  867  		}
4330397e4e8a66 hujianyang        2014-12-11  868  		od->cursor = p->l_node.next;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  869  		ctx->pos++;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  870  	}
48bd024b8a40d7 Miklos Szeredi    2020-06-02 @871  	return err;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  872  }
e9be9d5e76e348 Miklos Szeredi    2014-10-24  873  

:::::: The code at line 871 was first introduced by commit
:::::: 48bd024b8a40d73ad6b086de2615738da0c7004f ovl: switch to mounter creds in readdir

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
