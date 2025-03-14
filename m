Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E66202F79
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Mar 2025 16:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741969569; cv=none; b=NDteN29RyYVtjfpbKzjBIkKO5qcPDEco0zUEvfmR1ctm2Fm14/M1gTm4/ti8nCTZkBjQFj1nljfEtbzkXpOH9XVqY0bSGNO4Enc0+QcqRYFUCrqgwiOdiTXxyEO1MdWrJmnh1UuxzxuAdgzBiQNkawjkAcSUBtm5i/NFP6ehkRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741969569; c=relaxed/simple;
	bh=WpvWbMG2NPu43I4ewoAdoZDwWNtwyoILf9PCRnCIodE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ErGvaSRjDQmqUTfZmbHqsd/6qQsb5f7PxhwfgHPi5j9fYSt8qZkFhGIXUFy7jOUnjXcQmuyuiC5JyknsM9neEYaPj7RShX3bsrlF+9Pf8h3EOeRmZXGCOH1P9R1ryuoykUTBrJJs+d5OyNJbIjY3BbXCnSx2iMo7xzPRRu+B71M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JroHOMTr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JroHOMTr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741969568; x=1773505568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WpvWbMG2NPu43I4ewoAdoZDwWNtwyoILf9PCRnCIodE=;
  b=JroHOMTrxJUo46GE0m0BI5KJHpk9RflQoWwWgEKvU8xlGOZaErcSyBFG
   y/bVZy6aTHORwkVoo6RmJbnyiKOvxmXtQF2eQt3akJ4sVKQ5pNrg2HNV8
   IXLVpui6LCCB/nm6qrqPBEgvgjor/Y5G1W7ouLAxx7NbQRruvTM49hlHj
   VNCD/Wl6K4SYEvaqtYYOAdcEo1KaWmuwxWGxeHiknGZM5cwVQZvF0Nyf+
   tZmK07N5X5wrmZ/LzfQ6c5tk+o9iMfhhF/wHnhA7HWTBgxVLLION7rfA+
   3LmVWTgrOim7eHIYN5SIrpDjtkiLO4Emmgkfgo0Ga9u2s1x7Hd8RvS1WG
   Q==;
X-CSE-ConnectionGUID: Qku7j8vvTV2+otqTg+2LGA==
X-CSE-MsgGUID: spvcroLVRaGW3DWqluy+wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43036396"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43036396"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 09:26:05 -0700
X-CSE-ConnectionGUID: EpvHOWD8Rj2qzVt45PK+ig==
X-CSE-MsgGUID: wgItkQl1SUOR0dxFng4g8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126532336"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 14 Mar 2025 09:26:04 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt7rF-000Adw-1J;
	Fri, 14 Mar 2025 16:26:01 +0000
Date: Sat, 15 Mar 2025 00:25:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.idmapped.squash 9/10] fs/mnt_idmapping.c:384
 alloc_mnt_idmap() error: 'idmap' dereferencing possible ERR_PTR()
Message-ID: <202503150052.sDyHku8X-lkp@intel.com>
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

tree:   https://github.com/brauner/linux.git work.idmapped.squash
head:   97968d12e00d95bcc960a4fbd00fdb3ceb7e0c29
commit: 27ead64a2c3d23b290e9cbff36f10b9fe9fe71f8 [9/10] mnt: add VFS {g,u}id squashing
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250315/202503150052.sDyHku8X-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503150052.sDyHku8X-lkp@intel.com/

smatch warnings:
fs/mnt_idmapping.c:384 alloc_mnt_idmap() error: 'idmap' dereferencing possible ERR_PTR()

vim +/idmap +384 fs/mnt_idmapping.c

783822e44594639 Christian Brauner 2023-11-22  366  
3707d84c13670bf Christian Brauner 2023-01-13  367  struct mnt_idmap *alloc_mnt_idmap(struct user_namespace *mnt_userns)
3707d84c13670bf Christian Brauner 2023-01-13  368  {
3707d84c13670bf Christian Brauner 2023-01-13  369  	struct mnt_idmap *idmap;
783822e44594639 Christian Brauner 2023-11-22  370  	int ret;
3707d84c13670bf Christian Brauner 2023-01-13  371  
3707d84c13670bf Christian Brauner 2023-01-13  372  	idmap = kzalloc(sizeof(struct mnt_idmap), GFP_KERNEL_ACCOUNT);
3707d84c13670bf Christian Brauner 2023-01-13  373  	if (!idmap)
3707d84c13670bf Christian Brauner 2023-01-13  374  		return ERR_PTR(-ENOMEM);
3707d84c13670bf Christian Brauner 2023-01-13  375  
3707d84c13670bf Christian Brauner 2023-01-13  376  	refcount_set(&idmap->count, 1);
783822e44594639 Christian Brauner 2023-11-22  377  	ret = copy_mnt_idmap(&mnt_userns->uid_map, &idmap->uid_map);
783822e44594639 Christian Brauner 2023-11-22  378  	if (!ret)
783822e44594639 Christian Brauner 2023-11-22  379  		ret = copy_mnt_idmap(&mnt_userns->gid_map, &idmap->gid_map);
783822e44594639 Christian Brauner 2023-11-22  380  	if (ret) {
783822e44594639 Christian Brauner 2023-11-22  381  		free_mnt_idmap(idmap);
783822e44594639 Christian Brauner 2023-11-22  382  		idmap = ERR_PTR(ret);
783822e44594639 Christian Brauner 2023-11-22  383  	}
27ead64a2c3d23b Christian Brauner 2025-03-11 @384  	idmap->vfsuid_squash = INVALID_VFSUID;
27ead64a2c3d23b Christian Brauner 2025-03-11  385  	idmap->vfsgid_squash = INVALID_VFSGID;
27ead64a2c3d23b Christian Brauner 2025-03-11  386  	return idmap;
27ead64a2c3d23b Christian Brauner 2025-03-11  387  }
27ead64a2c3d23b Christian Brauner 2025-03-11  388  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
