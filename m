Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B19BBA42
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Sep 2024 01:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726708807; cv=none; b=iCEcu0JuuRkZDi4aUXUTgr7msczvdwxTlG5qdcDEDbQajD0L2+TqZ2ZfIA64XmE9layatzqo9mjpNJv5tKCgecqAyDlfy+Uw8Be84Q8CfjG8VioxMkcYub94QNDrmFJdrd2BFgWniIO9x4Sns1xsBnXF0EopH0cD5T8bOd5rPRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726708807; c=relaxed/simple;
	bh=O0EaG/cS2+zkg6E90pNz/oelDTCoroulQ59T/aepwTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=haBAIrjKHLRUe/x2a3MkKCVG7zyzAaCh8z9lZSWhVZlDeVqAYFeSdf9c8FlOIVpl2++uZWWVHPiXT1QoZGxRMxMDbptUSe72U8oVSoa/Ujj6lETi5tiOGFZO098VakZp+URDFjSCNY3/U8BLRcSi2Z5bffQcAuqgVtCfLEchjd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IaXYJFV6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IaXYJFV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726708805; x=1758244805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O0EaG/cS2+zkg6E90pNz/oelDTCoroulQ59T/aepwTI=;
  b=IaXYJFV6Jl1y11zYBVubxRBHVvt8eSCzDfCaQwhGooyiyB4ID4Uh1ABa
   KEtooZ3SsTQXDYO5Slk4dzSqro+WWwJRUgddQ7g6WTksbydYcMaJEfHox
   PILJc17ef1kN9Y9enWAE0O0JXksGbJUyEAbcHmwGpAMOZwAU3L66IkzFx
   TtHxb9DPcaxuCcti91wyRuMEQ374Kl5gOP6a5SWmWHOepUxY0Lh+RZXYO
   iIqPGsrHsU8OYL7X5r3oKbALkPYzHJ65kpICktaTAHSTVNwNRXb6uL1DE
   YtCYH1EO/Zfl7zvRlsk32LW1On34JT7QQiCJRo5b+iq8qauH9BibXkpbX
   A==;
X-CSE-ConnectionGUID: VBguORmmTTmVObcMb/dGUQ==
X-CSE-MsgGUID: eGP448nxRzqcKgVJhjyZqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25796484"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25796484"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 18:20:05 -0700
X-CSE-ConnectionGUID: TQi80sffTDCnEar4MHJbTw==
X-CSE-MsgGUID: p0OhoZKkRye7AAtTjr4Ssg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="69787630"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Sep 2024 18:20:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sr5px-000Cme-0Z;
	Thu, 19 Sep 2024 01:20:01 +0000
Date: Thu, 19 Sep 2024 09:19:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/hfsplus/hfsplus_fs.h:574 hfsplus_btree_lock_class() error:
 uninitialized symbol 'class'.
Message-ID: <202409190947.diPKhKXv-lkp@intel.com>
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
head:   4a39ac5b7d62679c07a3e3d12b0f6982377d8a7d
commit: be4edd1642ee205ed7bbf66edc0453b1be1fb8d7 hfsplus: fix to avoid false alarm of circular locking
date:   3 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 months ago
config: sparc-randconfig-r071-20240916 (https://download.01.org/0day-ci/archive/20240919/202409190947.diPKhKXv-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409190947.diPKhKXv-lkp@intel.com/

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
