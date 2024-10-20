Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FCE63D
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 01:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729388056; cv=none; b=eVHk93+UkRFk+ufZBfI6gBkN2WzOSumgkjylVISzZq6wncyW9i0kqREI2jXJAFiZCTWhROacEqX1TSxpc61pHjxBo5ZXMSmCDKjBTI/iBoWdb6l5291kCZDnt2dt5gxPy0igLW511wRCLvd9a2/n8rD0iijqdSTqUNpEekSsP40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729388056; c=relaxed/simple;
	bh=0HoubGcKYE9OSSeJAwWZAF2dqUbtBCcpOcLJn1RK7YY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RkxfUgVGAbbMBXvnyiN1A/Ok2TN3kiJUfZRY+p1ni89+NvZkgeNIyiWmEJQZF661PwWlltabe3JjPy9kDB9ORUP0ot0c0GIG+KTxSuYS7TzEt4wlmEqSyxQnE0nowvxY9rztc2fWffIBpIxiGdSWMk7e/FdKA0NKzdhxa8iWk2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHwf+soC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHwf+soC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729388055; x=1760924055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0HoubGcKYE9OSSeJAwWZAF2dqUbtBCcpOcLJn1RK7YY=;
  b=WHwf+soCODhl57dCcB4FexDF4lZ61332/grLtwmJxa7dKbEwAzMw0yLC
   tvIHoRIIBaGV9v/X9xivp2u41A4XDxMtKpLk9mPyxBpErp8HTcnPtF+mT
   v2aWQKQN56Y6iqrL6fw5sNx1WKcL2kSigdrizS6Sj5c3bHjBI3irqcEpY
   EVP2DDDVBcsVaTBeUJTpm8OLmPwB8uKYkYj7iOfWnajTS+thLqw3LLvjL
   mlrO/OvoMY92irjCRNpgZ8CYb+CT4ucifNUkPiy+ynnDXBNSL2On9AB4z
   hiv8WjenTvEfapPD1ayUVakwI93FrhaUBMvPmSi0/bJ6wM4+aU5wWjzi0
   g==;
X-CSE-ConnectionGUID: fiRh7IunRmyUvNYWYFOyxw==
X-CSE-MsgGUID: 3ugiy8dyRNWsQozZSTEZZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="40254042"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="40254042"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 18:34:11 -0700
X-CSE-ConnectionGUID: by/hlTNfRf+aoiNiRJEQzA==
X-CSE-MsgGUID: Sh6Gh5wwSSCQtmG1hG/0HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="79603236"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Oct 2024 18:34:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Kpb-000Pl3-2Y;
	Sun, 20 Oct 2024 01:34:07 +0000
Date: Sun, 20 Oct 2024 09:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/hfsplus/hfsplus_fs.h:574 hfsplus_btree_lock_class() error:
 uninitialized symbol 'class'.
Message-ID: <202410200939.56DQGQWC-lkp@intel.com>
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
head:   f9e4825524aaf28af6b2097776616f27c31d6847
commit: be4edd1642ee205ed7bbf66edc0453b1be1fb8d7 hfsplus: fix to avoid false alarm of circular locking
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
config: arc-randconfig-r073-20241020 (https://download.01.org/0day-ci/archive/20241020/202410200939.56DQGQWC-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410200939.56DQGQWC-lkp@intel.com/

smatch warnings:
fs/hfsplus/hfsplus_fs.h:574 hfsplus_btree_lock_class() error: uninitialized symbol 'class'.

vim +/class +574 fs/hfsplus/hfsplus_fs.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  555  
be4edd1642ee20 Chao Yu        2024-06-07  556  static inline enum hfsplus_btree_mutex_classes
be4edd1642ee20 Chao Yu        2024-06-07  557  hfsplus_btree_lock_class(struct hfs_btree *tree)
be4edd1642ee20 Chao Yu        2024-06-07  558  {
be4edd1642ee20 Chao Yu        2024-06-07  559  	enum hfsplus_btree_mutex_classes class;
be4edd1642ee20 Chao Yu        2024-06-07  560  
be4edd1642ee20 Chao Yu        2024-06-07  561  	switch (tree->cnid) {
be4edd1642ee20 Chao Yu        2024-06-07  562  	case HFSPLUS_CAT_CNID:
be4edd1642ee20 Chao Yu        2024-06-07  563  		class = CATALOG_BTREE_MUTEX;
be4edd1642ee20 Chao Yu        2024-06-07  564  		break;
be4edd1642ee20 Chao Yu        2024-06-07  565  	case HFSPLUS_EXT_CNID:
be4edd1642ee20 Chao Yu        2024-06-07  566  		class = EXTENTS_BTREE_MUTEX;
be4edd1642ee20 Chao Yu        2024-06-07  567  		break;
be4edd1642ee20 Chao Yu        2024-06-07  568  	case HFSPLUS_ATTR_CNID:
be4edd1642ee20 Chao Yu        2024-06-07  569  		class = ATTR_BTREE_MUTEX;
be4edd1642ee20 Chao Yu        2024-06-07  570  		break;
be4edd1642ee20 Chao Yu        2024-06-07  571  	default:
be4edd1642ee20 Chao Yu        2024-06-07  572  		BUG();
be4edd1642ee20 Chao Yu        2024-06-07  573  	}
be4edd1642ee20 Chao Yu        2024-06-07 @574  	return class;
be4edd1642ee20 Chao Yu        2024-06-07  575  }
be4edd1642ee20 Chao Yu        2024-06-07  576  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
