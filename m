Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AE128C2A8
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 17:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638254; cv=none; b=YUhPgC2BmEiao1UpwcOsU7+9XVedO2lrMeyY5QCCkMOuqCOlFfChyt2bbf0dWJ1p0mIhBvjN/I1GkFhU+XcaaQjNtatxsxRIhISlJ/T2rCkiyA2TvTedzKptuepiulZVhzR3Zf1acSGCILWTfdiffNIyzcLLkcqCkmbz3pUBlW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638254; c=relaxed/simple;
	bh=TPWmRZMbuVA9L5EoEWEPkHhovSSYs2oJRiOhay+k1uU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HG1Ro5pHVN/VaHNTpqzvm+ND0cL1l5BR8FcFSap57gye8eOq8/KoeZejX09nbXIhwDAfSQIISIHfk/ejILJCv9pDNI+c80nkOzPMLhA46zJ8QDEBvv1vD6nifA3+lcqWRGKuWjWiN+GA3lnxcnwIrpT05veK/qV9zfWVmn5yz2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OhgMcnSD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhgMcnSD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746638252; x=1778174252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TPWmRZMbuVA9L5EoEWEPkHhovSSYs2oJRiOhay+k1uU=;
  b=OhgMcnSDJY/9wpMvq0UyNQZCW6volDTSRT95oHBkxU4S36aC0Tj19yU3
   NzvbKb8WpRzogWoU58IlW6OPl7GL36eGMqDgd3FNgJEIx+2/VsF5AO4jn
   0uda0nEgWpBlJNvOiKy8pS2cQ5uVSdLYOXoqUMLhVivzK5n4UBcR1prJ2
   ZKhkj6/kmim3UNsabK/GzlZYo0AO1lSajxEkToErytk7HScsLUUZLrNJV
   /99zDTXe+aFWNKC94TftKC+P90be9/LvqCy89ZO3Dyr78fxY9rlLQagxi
   qAA4dlCy0DR/GD+yITAzgzo40ydNpOg1LdS/KmuEDUO7fYfSZ9jymLCTS
   g==;
X-CSE-ConnectionGUID: wkRgSTkKSDKNm3YGMMo4oA==
X-CSE-MsgGUID: k3LvYmRpRoaMi0AF4PZxgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48288622"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48288622"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 10:17:29 -0700
X-CSE-ConnectionGUID: VYTuSJJoSJGhaqWWJ+KZ3A==
X-CSE-MsgGUID: +3J773xjQXCW8u6nxbw0IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="136428706"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 May 2025 10:17:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCiOW-0008D3-1M;
	Wed, 07 May 2025 17:17:20 +0000
Date: Thu, 8 May 2025 01:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4296/4528] fs/bcachefs/fs.c:347
 bch2_inode_hash_find() warn: inconsistent returns '&inode->v.i_lock'.
Message-ID: <202505080153.eyNgx04l-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 4424dc8529b67d71da844ac26584f9994858f7fa [4296/4528] bcachefs: Use drop_locks_do() in bch2_inode_hash_find()
:::::: branch date: 10 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-141-20250416 (https://download.01.org/0day-ci/archive/20250508/202505080153.eyNgx04l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505080153.eyNgx04l-lkp@intel.com/

smatch warnings:
fs/bcachefs/fs.c:347 bch2_inode_hash_find() warn: inconsistent returns '&inode->v.i_lock'.

vim +347 fs/bcachefs/fs.c

112d21fd1a122f Kent Overstreet 2024-06-08  319  
54f7702466b3a1 Kent Overstreet 2024-08-16  320  static struct bch_inode_info *bch2_inode_hash_find(struct bch_fs *c, struct btree_trans *trans,
54f7702466b3a1 Kent Overstreet 2024-08-16  321  						   subvol_inum inum)
112d21fd1a122f Kent Overstreet 2024-06-08  322  {
112d21fd1a122f Kent Overstreet 2024-06-08  323  	struct bch_inode_info *inode;
112d21fd1a122f Kent Overstreet 2024-06-08  324  repeat:
112d21fd1a122f Kent Overstreet 2024-06-08  325  	inode = __bch2_inode_hash_find(c, inum);
112d21fd1a122f Kent Overstreet 2024-06-08  326  	if (inode) {
112d21fd1a122f Kent Overstreet 2024-06-08  327  		spin_lock(&inode->v.i_lock);
112d21fd1a122f Kent Overstreet 2024-06-08  328  		if (!test_bit(EI_INODE_HASHED, &inode->ei_flags)) {
112d21fd1a122f Kent Overstreet 2024-06-08  329  			spin_unlock(&inode->v.i_lock);
112d21fd1a122f Kent Overstreet 2024-06-08  330  			return NULL;
112d21fd1a122f Kent Overstreet 2024-06-08  331  		}
112d21fd1a122f Kent Overstreet 2024-06-08  332  		if ((inode->v.i_state & (I_FREEING|I_WILL_FREE))) {
54f7702466b3a1 Kent Overstreet 2024-08-16  333  			if (!trans) {
6b63a948a73ba3 Kent Overstreet 2024-10-04  334  				__wait_on_freeing_inode(c, inode, inum);
54f7702466b3a1 Kent Overstreet 2024-08-16  335  			} else {
4424dc8529b67d Kent Overstreet 2025-04-13  336  				int ret = drop_locks_do(trans,
4424dc8529b67d Kent Overstreet 2025-04-13  337  						(__wait_on_freeing_inode(c, inode, inum), 0));
54f7702466b3a1 Kent Overstreet 2024-08-16  338  				if (ret)
54f7702466b3a1 Kent Overstreet 2024-08-16  339  					return ERR_PTR(ret);
54f7702466b3a1 Kent Overstreet 2024-08-16  340  			}
112d21fd1a122f Kent Overstreet 2024-06-08  341  			goto repeat;
112d21fd1a122f Kent Overstreet 2024-06-08  342  		}
112d21fd1a122f Kent Overstreet 2024-06-08  343  		__iget(&inode->v);
112d21fd1a122f Kent Overstreet 2024-06-08  344  		spin_unlock(&inode->v.i_lock);
112d21fd1a122f Kent Overstreet 2024-06-08  345  	}
112d21fd1a122f Kent Overstreet 2024-06-08  346  
112d21fd1a122f Kent Overstreet 2024-06-08 @347  	return inode;
112d21fd1a122f Kent Overstreet 2024-06-08  348  }
112d21fd1a122f Kent Overstreet 2024-06-08  349  

:::::: The code at line 347 was first introduced by commit
:::::: 112d21fd1a122f778c383aa44d5448f4da9518c3 bcachefs: switch to rhashtable for vfs inodes hash

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
