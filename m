Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D8A1DDC2C
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 00:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761526019; cv=none; b=S7GqKsXX16FUuhKd0cVajTtYEG0YiWgomyOMQISxhr46kbbW1rzZxpQKBxgpdCd09zweoEcEASd8gLJ8ynojQ4BxX1ktcxeARTHSXmk0cOPcPOVlhbnglXRbCjnBjdhIas5ChGTVkSwcgRv2hfC5e445svvmsqLaJsVk2hArtRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761526019; c=relaxed/simple;
	bh=ZXF/4evuM6QDSUJ2vdoygAw/jxlaMNJqRsbfUalhmJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y6nLmhsZk8BKC91jKCUB5eErXcPG3BD0PWEw/F2dDb1nl9Qf+ELrMbPHcn61p+o/vKv3qR2B7hip3QX+QDYBlAyEU1PCXmhGnc9iL1nlt/MytmYCGUtxON5NXPqzu2uQ9INQfdmMQ9ZCBAHtHXuetzGzTYFLr+XBvW3BLYIdBVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNHNOgk9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNHNOgk9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761526018; x=1793062018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZXF/4evuM6QDSUJ2vdoygAw/jxlaMNJqRsbfUalhmJ4=;
  b=HNHNOgk9rrjImgbz3pAOY5Zpo6ZFPWK91vf8FbaOmZbZdEnEC9hAFwqV
   qVZwiC/S2EmZD6aziGsaqQbE+UQQBs7uneQBFZygDiVRARpT2spWZngBF
   4Vq/HK50AqRTs0Z4DI2pIKEKoYGIKPq4aKRJuqI5LJA4Lw6HrVOzwdVIw
   iYyg7bzMTQcbP1vj1h5sMfgQRDZGXZf5kAUHOLGWiiQI6xSjQhtcNFDTG
   iAhn4/j9fjB6kq7HQ1Pl4KETbijil2Rn05i0Rao9jrOZXtjwJ7gUxY4qa
   VS8E9lX904ckP05JP/bqYbR08X+A5Co5HQaf6T2RnJ83+vA9Nt5qgHEgO
   Q==;
X-CSE-ConnectionGUID: MRZKCTh1RwuEUq/DbvPKvw==
X-CSE-MsgGUID: SX6/tpUcQDCBSBOFWEicig==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63699750"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="63699750"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 17:46:57 -0700
X-CSE-ConnectionGUID: DSvBF8LhTK+KF1p5Q7u47Q==
X-CSE-MsgGUID: SwrlTj+uR6uq4vx1ayee/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="184608676"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 26 Oct 2025 17:46:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDBNt-000GQN-2l;
	Mon, 27 Oct 2025 00:46:53 +0000
Date: Mon, 27 Oct 2025 08:46:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [koverstreet-bcachefs:bcachefs-testing 465/695]
 fs/bcachefs/data/extents.h:551:9: sparse: sparse: unsigned value that used
 to be signed checked against zero?
Message-ID: <202510270839.B1aOZopI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/data/extents.h:551:9: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   175194e612187a15f7f0b1017f061a3edfe16420
commit: 78e53242d57830619d4964261dda9934f4d18c47 [465/695] bcachefs: move data code to subdir
:::::: branch date: 2 hours ago
:::::: commit date: 22 hours ago
config: powerpc-randconfig-r112-20251026 (https://download.01.org/0day-ci/archive/20251027/202510270839.B1aOZopI-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270839.B1aOZopI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510270839.B1aOZopI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/fs-io.c: note: in included file (through fs/bcachefs/alloc/buckets.h):
>> fs/bcachefs/data/extents.h:551:9: sparse: sparse: unsigned value that used to be signed checked against zero?
   fs/bcachefs/fs-io.c:748:16: sparse: signed value source
>> fs/bcachefs/data/extents.h:551:9: sparse: sparse: unsigned value that used to be signed checked against zero?
   fs/bcachefs/fs-io.c:748:16: sparse: signed value source
--
>> fs/bcachefs/data/copygc.c:440:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/data/copygc.c:440:21: sparse:    struct task_struct [noderef] __rcu *
   fs/bcachefs/data/copygc.c:440:21: sparse:    struct task_struct *
--
   fs/bcachefs/recovery_passes.c:341:5: sparse: sparse: context imbalance in '__bch2_run_explicit_recovery_pass' - wrong count at exit
   fs/bcachefs/recovery_passes.c: note: in included file:
>> fs/bcachefs/data/copygc.h:11:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/data/copygc.h:11:33: sparse:    struct task_struct [noderef] __rcu *
   fs/bcachefs/data/copygc.h:11:33: sparse:    struct task_struct *
--
   fs/bcachefs/recovery.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:633:38: sparse: sparse: array of flexible structures
   fs/bcachefs/bcachefs_format.h:1326:38: sparse: sparse: array of flexible structures
   fs/bcachefs/recovery.c: note: in included file:
>> fs/bcachefs/data/copygc.h:11:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/data/copygc.h:11:33: sparse:    struct task_struct [noderef] __rcu *
   fs/bcachefs/data/copygc.h:11:33: sparse:    struct task_struct *
--
   fs/bcachefs/opts.c: note: in included file:
>> fs/bcachefs/data/copygc.h:11:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/data/copygc.h:11:33: sparse:    struct task_struct [noderef] __rcu *
   fs/bcachefs/data/copygc.h:11:33: sparse:    struct task_struct *

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
