Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EBA17BD9
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Dec 2024 01:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733794979; cv=none; b=gotGbxDUPi5gfiUzHIMtXKEgrrJ8jf79hRRvTlhKQiFvDJKBEsJ4mlFFGjK/yTGtSUY+RTrwdc2KXwfzfwLiZwPiTRTyVvsIAz+06n+xtFNSGpMxZWbuRIyz9jeJxmix5A8ifwTNanypFdD1fldwQlnmG/Cc9k+/nFz+/RdNQNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733794979; c=relaxed/simple;
	bh=lEvUuuT3dBNH7wXjcpgwETKpmDH5qyINd2MvY8BN55k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OsoatX5IP9aXDpdOjSztue/WnFHt+tBLjxtAxRZaUuokVFOO/k0tLLQil5BBK7zcK9U47xkyi5qkyizfT4tp5SdFBmZ1Ek7vhgQ0dq80BGZ12JqtOY9S41Grlr1MV2/6UjG5Gw8CFph2e9rWZWdDwXTwFpurvwVH0l5f0l59jyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXhUN34F; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXhUN34F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733794977; x=1765330977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lEvUuuT3dBNH7wXjcpgwETKpmDH5qyINd2MvY8BN55k=;
  b=TXhUN34FhgYxVrKEw8PMxZWGkk/60Ws5Ib4dn0cSA2hTD+X+2qLOGzTE
   LbWUvqISJAI7ALlm98fBSLh3V8P7mCWZLso0Ltp9FCfV2nHhxX7nv1J3G
   cdEOdY9oLTfjSF8WTFQYK8KEoQBLLApoFvxfSedpFXmLCKjzY0Hdd9jBi
   7546uDSvAEkU1whmSXc7S/56WaniF5XJGs412rVYzMT20srXUIZY5Pec5
   upIVX2kt/rWVwIQoiUSEl1GfsDlo1qV0XF/Gtu1JwcEu5J+DInwpFAPlz
   8dCQdnq4amxTor0OJd8+yFFa2SdUxQ6acdKCSrdysBKk05L5XKGWzEWP3
   Q==;
X-CSE-ConnectionGUID: 6AIqAAbBQcaYaTZBJTMqWQ==
X-CSE-MsgGUID: +c7Y3A+sSmCx+cx357e1/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33459627"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="33459627"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 17:42:56 -0800
X-CSE-ConnectionGUID: YxKAZK4YSDeYPVGTASWbOQ==
X-CSE-MsgGUID: gDk7ExSESJWJvMYWTLfipQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="95064555"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Dec 2024 17:42:55 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKpH2-00051J-1E;
	Tue, 10 Dec 2024 01:42:52 +0000
Date: Tue, 10 Dec 2024 09:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/hfsplus/hfsplus_fs.h:574 hfsplus_btree_lock_class() error:
 uninitialized symbol 'class'.
Message-ID: <202412100909.y8lVQVy2-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7cb1b466315004af98f6ba6c2546bb713ca3c237
commit: be4edd1642ee205ed7bbf66edc0453b1be1fb8d7 hfsplus: fix to avoid false alarm of circular locking
date:   6 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 months ago
config: sparc-randconfig-r071-20241210 (https://download.01.org/0day-ci/archive/20241210/202412100909.y8lVQVy2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412100909.y8lVQVy2-lkp@intel.com/

smatch warnings:
fs/hfsplus/hfsplus_fs.h:574 hfsplus_btree_lock_class() error: uninitialized symbol 'class'.

vim +/class +574 fs/hfsplus/hfsplus_fs.h

^1da177e4c3f415 Linus Torvalds 2005-04-16  555  
be4edd1642ee205 Chao Yu        2024-06-07  556  static inline enum hfsplus_btree_mutex_classes
be4edd1642ee205 Chao Yu        2024-06-07  557  hfsplus_btree_lock_class(struct hfs_btree *tree)
be4edd1642ee205 Chao Yu        2024-06-07  558  {
be4edd1642ee205 Chao Yu        2024-06-07  559  	enum hfsplus_btree_mutex_classes class;
be4edd1642ee205 Chao Yu        2024-06-07  560  
be4edd1642ee205 Chao Yu        2024-06-07  561  	switch (tree->cnid) {
be4edd1642ee205 Chao Yu        2024-06-07  562  	case HFSPLUS_CAT_CNID:
be4edd1642ee205 Chao Yu        2024-06-07  563  		class = CATALOG_BTREE_MUTEX;
be4edd1642ee205 Chao Yu        2024-06-07  564  		break;
be4edd1642ee205 Chao Yu        2024-06-07  565  	case HFSPLUS_EXT_CNID:
be4edd1642ee205 Chao Yu        2024-06-07  566  		class = EXTENTS_BTREE_MUTEX;
be4edd1642ee205 Chao Yu        2024-06-07  567  		break;
be4edd1642ee205 Chao Yu        2024-06-07  568  	case HFSPLUS_ATTR_CNID:
be4edd1642ee205 Chao Yu        2024-06-07  569  		class = ATTR_BTREE_MUTEX;
be4edd1642ee205 Chao Yu        2024-06-07  570  		break;
be4edd1642ee205 Chao Yu        2024-06-07  571  	default:
be4edd1642ee205 Chao Yu        2024-06-07  572  		BUG();
be4edd1642ee205 Chao Yu        2024-06-07  573  	}
be4edd1642ee205 Chao Yu        2024-06-07 @574  	return class;
be4edd1642ee205 Chao Yu        2024-06-07  575  }
be4edd1642ee205 Chao Yu        2024-06-07  576  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
