Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6102F3C28
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Nov 2025 06:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102824; cv=none; b=i0VaKOYgnJ6/YhgKrJ6SZ9dQjf3904YZnGS8p9wAEMnzwXXdUgtbtZrz3hXAXQI5BazLQnBV19i6Tq9+0yqGAaPwbjgYC/+Za1J4RdBClT3N4RhmV2l11L3H5E5OsSdqiwIoLA4UXJ+GBxe0Zm4eW5AqhERfaskroWrmqgRd8Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102824; c=relaxed/simple;
	bh=RCqYjyCJep84owVyY54cb14A6wGCB1agMAdqAZyXXuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k/7IfPdRw1bUfGfaVEkxHLBFkPyAA+r1O78wqCz5b+K1w0AV4WcujpMs0MAO6CaWAC9/yQU2g97yMTzkRDzW8AJBId0E0oWXvDz2s2QBSruttwaAwsukYm1o+aeMtPBC/BlL+MHJ0wGKEE5KcWw5JKKOdxQbookQvgMerjik0lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJ7qQ84B; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJ7qQ84B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763102823; x=1794638823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RCqYjyCJep84owVyY54cb14A6wGCB1agMAdqAZyXXuI=;
  b=PJ7qQ84BKBoV14uTxpVJAqUAansmGtiyCA8BYmAt5qfJ3cZXGcPYAvSB
   uTRSthP0x9Vrw6yTHZ2clZ3Q/chhwouqz73i4t8/eSUfuXjA1NhqKyYcJ
   LsT/9hcYuk+dMeil0J/jiCKQrMBUTbjZ1iwjTtJMCyVrQva9tXzpAO3xH
   DVzFWsb3sc9QjuzKynQE+dvI7jwKjeiKXrl7pMyTbOixbG22eA6QH/hH+
   UlAMUJ4jryGgMQqZ2/uks95s2hMwj4X6apK0aLGXuJvkFMc1UWjyIw5kr
   ZZDn4QlRsJQW1v52KxZfCTtng72snp7GBZpgsDZbKa/oIWgmT2uInk5qS
   g==;
X-CSE-ConnectionGUID: ZqsxgxTcTgeenmYccxzj5g==
X-CSE-MsgGUID: /YLH/IuUR16EAVTSn8xDow==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64400131"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="64400131"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:47:01 -0800
X-CSE-ConnectionGUID: Ihs5eHs4T4Wax8CcbDX+DA==
X-CSE-MsgGUID: /SZh1YBvTtGEHjaY+s6GYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="220359556"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Nov 2025 22:46:59 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnaD-0006FH-0u;
	Fri, 14 Nov 2025 06:46:57 +0000
Date: Fri, 14 Nov 2025 14:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.ovl.cred.guard 12/46] fs/overlayfs/file.c:282
 ovl_llseek() error: uninitialized symbol 'ret'.
Message-ID: <202511141133.B0xtzqRK-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.ovl.cred.guard
head:   74fa97e66e24a79a77ee469a7e8305f2013edd1f
commit: f7c5ded79c222e217bdc60e65bf59edec69c79e7 [12/46] ovl: port ovl_llseek() to cred guard
:::::: branch date: 7 hours ago
:::::: commit date: 16 hours ago
config: parisc-randconfig-r072-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141133.B0xtzqRK-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511141133.B0xtzqRK-lkp@intel.com/

New smatch warnings:
fs/overlayfs/file.c:282 ovl_llseek() error: uninitialized symbol 'ret'.

Old smatch warnings:
fs/overlayfs/file.c:61 ovl_open_realfile() error: uninitialized symbol 'realfile'.

vim +/ret +282 fs/overlayfs/file.c

d1d04ef8572bc8 Miklos Szeredi    2018-07-18  243  
d1d04ef8572bc8 Miklos Szeredi    2018-07-18  244  static loff_t ovl_llseek(struct file *file, loff_t offset, int whence)
d1d04ef8572bc8 Miklos Szeredi    2018-07-18  245  {
9e46b840c7053b Amir Goldstein    2019-02-27  246  	struct inode *inode = file_inode(file);
d66907b51ba074 Amir Goldstein    2024-11-05  247  	struct file *realfile;
a4ac9d45c0cd14 Miklos Szeredi    2020-02-03  248  	loff_t ret;
9e46b840c7053b Amir Goldstein    2019-02-27  249  
9e46b840c7053b Amir Goldstein    2019-02-27  250  	/*
9e46b840c7053b Amir Goldstein    2019-02-27  251  	 * The two special cases below do not need to involve real fs,
9e46b840c7053b Amir Goldstein    2019-02-27  252  	 * so we can optimizing concurrent callers.
9e46b840c7053b Amir Goldstein    2019-02-27  253  	 */
9e46b840c7053b Amir Goldstein    2019-02-27  254  	if (offset == 0) {
9e46b840c7053b Amir Goldstein    2019-02-27  255  		if (whence == SEEK_CUR)
9e46b840c7053b Amir Goldstein    2019-02-27  256  			return file->f_pos;
9e46b840c7053b Amir Goldstein    2019-02-27  257  
9e46b840c7053b Amir Goldstein    2019-02-27  258  		if (whence == SEEK_SET)
9e46b840c7053b Amir Goldstein    2019-02-27  259  			return vfs_setpos(file, 0, 0);
9e46b840c7053b Amir Goldstein    2019-02-27  260  	}
9e46b840c7053b Amir Goldstein    2019-02-27  261  
d66907b51ba074 Amir Goldstein    2024-11-05  262  	realfile = ovl_real_file(file);
d66907b51ba074 Amir Goldstein    2024-11-05  263  	if (IS_ERR(realfile))
d66907b51ba074 Amir Goldstein    2024-11-05  264  		return PTR_ERR(realfile);
9e46b840c7053b Amir Goldstein    2019-02-27  265  
9e46b840c7053b Amir Goldstein    2019-02-27  266  	/*
9e46b840c7053b Amir Goldstein    2019-02-27  267  	 * Overlay file f_pos is the master copy that is preserved
9e46b840c7053b Amir Goldstein    2019-02-27  268  	 * through copy up and modified on read/write, but only real
9e46b840c7053b Amir Goldstein    2019-02-27  269  	 * fs knows how to SEEK_HOLE/SEEK_DATA and real fs may impose
9e46b840c7053b Amir Goldstein    2019-02-27  270  	 * limitations that are more strict than ->s_maxbytes for specific
9e46b840c7053b Amir Goldstein    2019-02-27  271  	 * files, so we use the real file to perform seeks.
9e46b840c7053b Amir Goldstein    2019-02-27  272  	 */
b1f9d3858f724e Amir Goldstein    2019-12-21  273  	ovl_inode_lock(inode);
d66907b51ba074 Amir Goldstein    2024-11-05  274  	realfile->f_pos = file->f_pos;
9e46b840c7053b Amir Goldstein    2019-02-27  275  
f7c5ded79c222e Christian Brauner 2025-11-12  276  	with_ovl_creds(inode->i_sb)
d66907b51ba074 Amir Goldstein    2024-11-05  277  		ret = vfs_llseek(realfile, offset, whence);
9e46b840c7053b Amir Goldstein    2019-02-27  278  
d66907b51ba074 Amir Goldstein    2024-11-05  279  	file->f_pos = realfile->f_pos;
b1f9d3858f724e Amir Goldstein    2019-12-21  280  	ovl_inode_unlock(inode);
9e46b840c7053b Amir Goldstein    2019-02-27  281  
9e46b840c7053b Amir Goldstein    2019-02-27 @282  	return ret;
d1d04ef8572bc8 Miklos Szeredi    2018-07-18  283  }
d1d04ef8572bc8 Miklos Szeredi    2018-07-18  284  

:::::: The code at line 282 was first introduced by commit
:::::: 9e46b840c7053b5f7a245e98cd239b60d189a96c ovl: support stacked SEEK_HOLE/SEEK_DATA

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
