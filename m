Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C456B4AF16C
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Sep 2026 21:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506972; cv=none; b=MxtBtgDvLcbEkDGdWBZBZvYB4CU+W0COLG3Tw7DgXF3pBq1MhLeuzFW/2Bu5IxwE5IlSMzKOW2aJLdg5p6dBKbu0OTasAlgrdwSPMYIsJuc80+S1Vlnz7DhMqO9SmP692l0kMEf1imhzhMDUhg8SUG2qrY69fXbQGGJvgV4w/tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506972; c=relaxed/simple;
	bh=jXkKZaZ2F64qlLyDBrNc1CLRzX0FzcMRzXVrnVWVCrU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JfW6uHsiHBZzfmrXJhrLWlkuBhg8oV9SDuymolT9DGE3bCMMxCBvvq+aV/j8jNTgYRJabVzJwvHct6JcO4fwyIhadPP56c8KhhlKc4Y3izBfUKRzum5/+5jHH2T5ususYBRhFPMGB1+V5XISGgkw3qKPNPZZH4w7w2W4apaWZ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GeKbLY8C; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GeKbLY8C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789506969; x=1821042969;
  h=date:from:to:cc:subject:message-id;
  bh=jXkKZaZ2F64qlLyDBrNc1CLRzX0FzcMRzXVrnVWVCrU=;
  b=GeKbLY8CkcMsG1Vlx/J8y/um1H96gsrPWkuUk98xG4cmiXniIBaXRIFG
   eFCwJ2aPKoadidhzmPku8fUJdsjiyfKwKEXh+/m5MnXcqHTVoa8O0UCIi
   Em9/HE8S/jqY0EmYccxwxFuoQCk+YyY/NR/oq5OsVf72/mr4ExUWk6txU
   0sdUQehxy1MzrIqhQZv4xT7AEdq529s8FuKIkW7vRYxwsMS2vvUz9+PcX
   1uBz/Qm8MkF3XbBNgr2OrLUgKE8FDe4H4rJiImp3smKptbt6qnL9nUX6+
   +wDFad0wYBJKrP8Oy8DC/LLaHsxnRL9m3jWHAkwqJMeKlZwZhc4BCMCHY
   g==;
X-CSE-ConnectionGUID: GB0SL91sSJW+aIAKw0hCXA==
X-CSE-MsgGUID: Z0eRfI1FQK6TnZJ1Bvu8SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89821506"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89821506"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 14:16:09 -0700
X-CSE-ConnectionGUID: YrcTgF2JSRG4jE00vBzIow==
X-CSE-MsgGUID: xzhYHYfdQyue5X6HY/hC9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276659494"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Sep 2026 14:16:09 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6aVa-0000000055J-1ZW1;
	Tue, 15 Sep 2026 21:16:06 +0000
Date: Wed, 16 Sep 2026 05:15:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 465/799]
 fs/bcachefs/data/extents.h:551:9: sparse: sparse: unsigned value that used to
 be signed checked against zero?
Message-ID: <202609160548.ipN3I3fM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/data/extents.h:551:9: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 78e53242d57830619d4964261dda9934f4d18c47 [465/799] bcachefs: move data code to subdir
:::::: branch date: 10 months ago
:::::: commit date: 11 months ago
config: openrisc-randconfig-r112-20260915 (https://download.01.org/0day-ci/archive/20260916/202609160548.ipN3I3fM-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160548.ipN3I3fM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609160548.ipN3I3fM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/fs-io.c: note: in included file (through fs/bcachefs/alloc/buckets.h):
>> fs/bcachefs/data/extents.h:551:9: sparse: sparse: unsigned value that used to be signed checked against zero?
   fs/bcachefs/fs-io.c:748:16: sparse: signed value source
>> fs/bcachefs/data/extents.h:551:9: sparse: sparse: unsigned value that used to be signed checked against zero?
   fs/bcachefs/fs-io.c:748:16: sparse: signed value source

vim +551 fs/bcachefs/data/extents.h

1c6fdbd8f2465d fs/bcachefs/extents.h Kent Overstreet 2017-03-16  546  
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  547  static inline bool bkey_extent_is_unwritten(struct bkey_s_c k)
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  548  {
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  549  	struct bkey_ptrs_c ptrs = bch2_bkey_ptrs_c(k);
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  550  
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13 @551  	bkey_for_each_ptr(ptrs, ptr)
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  552  		if (ptr->unwritten)
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  553  			return true;
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  554  	return false;
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  555  }
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  556  

:::::: The code at line 551 was first introduced by commit
:::::: 792031116bee35e13be7c8ae8cf1b8eec141b136 bcachefs: Unwritten extents support

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
