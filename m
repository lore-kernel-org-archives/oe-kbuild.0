Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664083ACA48
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 23:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774911956; cv=none; b=fPP2l2m0SjoJgepcBpRWXOkCEbfhlygVLG+cXuoVcrLDP/YNYNCHWayNMCjsAlqM4OKk8zdK2gjO2yA6Dhw0gI25PV3dg3ULp1A6YV99kuaDalDji/TW8n+2gPz73ghwV8MEbzPGuvavZ8MET5mlwDk+FzSmnpVHzwwbiY+mNS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774911956; c=relaxed/simple;
	bh=uJ6oJUb0SLNwI30vCvLYbPObE7Zf3ETkT/cdK2HwhHs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I5l6NLSYZ7yvc85qTE3m522K5fKAezocN+WjYkz3qRrss/Dgi+HG7gqjQWI9YgsxerKTaSP9o/dAOrG5ZSgrng/zIRneCttigdxAVCQBKl7EjMkRnT0A7uNhCxurokXqUctzfCzbKcOjC45Jr9AyRklaGYnTFyF0/xZygqw8vyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N6OImovo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6OImovo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774911955; x=1806447955;
  h=date:from:to:cc:subject:message-id;
  bh=uJ6oJUb0SLNwI30vCvLYbPObE7Zf3ETkT/cdK2HwhHs=;
  b=N6OImovoftARwaZFZVpLpefQqJ/rsYmK8hAjbSWdRzk8fm9ZJGblJJSE
   xT83zFV7yIBUR4VUhl0uxWxaR2mP4AsXAhuuZGhzbtPoYCNTS6GDZzT2T
   UICfKyiPJbnyv2PD8pFpkD5JA/xIGjKn10cjKqw8PJEJlgIPzk6nLq0zo
   iSEc99LX5aVQGD/c2v04WSAEeyfJ7rNpUcuXSosbxjCH/oandFCn0QlIB
   YUjlL76C5oZ8czhQvpf5HN2SGu4/oSEXAq04FRlXDC73fGbIeHKIb8H43
   jCHicHSkFAYjY1EF6FL05hRD+j2syi1oRBemucEGAkxonPZtBfIuIguiG
   A==;
X-CSE-ConnectionGUID: Vu8r2tNQT2mY8wkFQw2rYg==
X-CSE-MsgGUID: cmif/LgGQcuNYDVn8CFOvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="93297874"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="93297874"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 16:05:53 -0700
X-CSE-ConnectionGUID: qZZyebBkTxmYdJeamsPA2w==
X-CSE-MsgGUID: YxpzpdpyQuK0IkYa9ufViw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="256688176"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Mar 2026 16:05:52 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Lg5-000000001pg-31Ry;
	Mon, 30 Mar 2026 23:05:49 +0000
Date: Tue, 31 Mar 2026 07:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ocfs2/namei.c:660 ocfs2_mkdir() warn: passing positive
 error code '(-512),(-122),(-28),(-4),524289' to 'ERR_PTR'
Message-ID: <202603310634.kLmyMrue-lkp@intel.com>
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
:::::: branch date: 24 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-141-20260330 (https://download.01.org/0day-ci/archive/20260331/202603310634.kLmyMrue-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603310634.kLmyMrue-lkp@intel.com/

New smatch warnings:
fs/ocfs2/namei.c:660 ocfs2_mkdir() warn: passing positive error code '(-512),(-122),(-28),(-4),524289' to 'ERR_PTR'

Old smatch warnings:
fs/ocfs2/namei.c:164 ocfs2_lookup() warn: passing positive error code '(-512),(-122),(-28),(-4),524289' to 'ERR_PTR'

vim +660 fs/ocfs2/namei.c

021960cab320ae Mark Fasheh       2010-08-13  646  
88d5baf69082e5 NeilBrown         2025-02-27  647  static struct dentry *ocfs2_mkdir(struct mnt_idmap *idmap,
549c7297717c32 Christian Brauner 2021-01-21  648  				  struct inode *dir,
ccd979bdbce9fb Mark Fasheh       2005-12-15  649  				  struct dentry *dentry,
18bb1db3e7607e Al Viro           2011-07-26  650  				  umode_t mode)
ccd979bdbce9fb Mark Fasheh       2005-12-15  651  {
ccd979bdbce9fb Mark Fasheh       2005-12-15  652  	int ret;
ccd979bdbce9fb Mark Fasheh       2005-12-15  653  
8990e44a2bceaa Tao Ma            2011-02-23  654  	trace_ocfs2_mkdir(dir, dentry, dentry->d_name.len, dentry->d_name.name,
8990e44a2bceaa Tao Ma            2011-02-23  655  			  OCFS2_I(dir)->ip_blkno, mode);
5ebb29bee8d5fc Christian Brauner 2023-01-13  656  	ret = ocfs2_mknod(&nop_mnt_idmap, dir, dentry, mode | S_IFDIR, 0);
c1e8d35ef5ffb3 Tao Ma            2011-03-07  657  	if (ret)
c1e8d35ef5ffb3 Tao Ma            2011-03-07  658  		mlog_errno(ret);
ccd979bdbce9fb Mark Fasheh       2005-12-15  659  
88d5baf69082e5 NeilBrown         2025-02-27 @660  	return ERR_PTR(ret);
ccd979bdbce9fb Mark Fasheh       2005-12-15  661  }
ccd979bdbce9fb Mark Fasheh       2005-12-15  662  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
