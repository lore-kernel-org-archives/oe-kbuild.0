Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ACA2DCF67
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 21:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769461596; cv=none; b=rBrVLc9U1Fml6vUoYzf2hemAAF9yk91nWkX7SCrMXEwElkfxfN6nRpsR63LipuAHuP8Px/lWmoHZ9GreQyFoWb5eQV7hlYnE88EahQ5eObPKMyVEygPlbMpzN6l9OaeMU9esAYR67n/nT2VChsG60xsVt6Kzc37Wnv/siGJx0IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769461596; c=relaxed/simple;
	bh=rYP4zJ5wq8qoF5pPgFovHERvUz9FFiwEw0q7A/y81zY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R1xu2OBWB6JVmWL72v5voypH948p1DWZDlvx3avv9SRgXnPqogFnG3utJRNpDHLuArOlioSY3OkBoqpRGNtQGGvuo0awidxIA1fkkV7Bh4CrcUQtwXwCWuCO5Xpqh2EtJmA05+v6fxsd5r1DnwaOnqOJf5kJpGPrY/jhSk2xmic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AnXAqEC/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnXAqEC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769461594; x=1800997594;
  h=date:from:to:cc:subject:message-id;
  bh=rYP4zJ5wq8qoF5pPgFovHERvUz9FFiwEw0q7A/y81zY=;
  b=AnXAqEC/gkiU9URsGlG7R2vGaHOgYiIxzzdqVnveYsil0hDF6OUAawzW
   1Lb3QpYdqn/FZSM3W/JmaVfxRxnAn3FjrzuDvcHgT6oOS9pS0gN9aJOTl
   X0X4it52YH6sHYCU+Y2cDL2xD5cuTRQA76RZ6sgb02o+WxiVloW2HrByw
   vAvAkwZrpuPNLwkqXn7miYcALxXummUlwY+zobwxl10CytMnhsezovQnh
   QghrZdIaDknYasWQSh/+eWiKww6CsfT++EkRjRd2mrkGMp1v9g5gVAmtf
   yncLnQYnbrx99UddE/mGc9te6aoBHx2xsNAS8NnVWjAR5nPBjGqJE0NOc
   Q==;
X-CSE-ConnectionGUID: H7zVaj0bQ3aE2fWJTe+Q5A==
X-CSE-MsgGUID: XqA6ItJYRq6Xg9x4JQKmgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88063068"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="88063068"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 13:06:34 -0800
X-CSE-ConnectionGUID: 1MuCvPZQT3e55aBy2OO9OA==
X-CSE-MsgGUID: k/i1Wz9lRkW4AuNuwGuqeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212243456"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jan 2026 13:06:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkTn4-00000000Xgo-288o;
	Mon, 26 Jan 2026 21:06:30 +0000
Date: Tue, 27 Jan 2026 05:05:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 465/799]
 fs/bcachefs/data/extents.h:551:9: sparse: sparse: unsigned value that used to
 be signed checked against zero?
Message-ID: <202601270413.cWKFX1kS-lkp@intel.com>
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
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-r122-20260126 (https://download.01.org/0day-ci/archive/20260127/202601270413.cWKFX1kS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270413.cWKFX1kS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601270413.cWKFX1kS-lkp@intel.com/

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
