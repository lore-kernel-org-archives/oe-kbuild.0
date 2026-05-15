Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A433D9691
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 17:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778865529; cv=none; b=Qf/NzhdbTqITCBkJ0DN9KFXOtPRISbMj7m7uBUwSLEIqiiBM7zHcQA6hofJ1NyDsCjmJ2wVnQVAuVJ2BQFIQCq6go8WVW6ydmZXinUzUK3rtS+710KYG+kOwAzKycqGWuye2g8LZVatLXCESFnMl2PaTKqfTuhuvDRXLuwztM/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778865529; c=relaxed/simple;
	bh=en4zUAuUhLed3iZzLO/E/SYutmu+PXZun/WWxLWP3uc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t4uWeysNwT9ZlDGDqlh6dysoJuJVX2qVL/Lkw68gJ2gDvMcKoQ2Sbj6M1qltlZw8eS29cS8XXvfNslcobHOesZQBRir/65PatBd/BvsMkdh7QnyLiEn37LcPXtBql3DTgvjqqyetAzRKO0j/3yeyNWd7J4ucsBDbNBzmfH0Xej4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+ZRmOAp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+ZRmOAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778865527; x=1810401527;
  h=date:from:to:cc:subject:message-id;
  bh=en4zUAuUhLed3iZzLO/E/SYutmu+PXZun/WWxLWP3uc=;
  b=m+ZRmOApsoNQ4w3hFPITzeKIPU6zrchsjlUxYJyk4htnMbf9rsmq/eZj
   qk76uvUlYlmo5par6LI+o0uUa88UiZnvu048w0GX84VhTZDXpX0JIagxR
   8dpgJLE7d6qnKzfPYI7H7DCJsKxMOAR634N7TiDrFXlp7OKodppW3XV+2
   5jI15bqMS3XvV79fEHJ4ZHGCGFWTTRi7FChVxRkT5rDwCJus/zRl8dvqc
   2KUaJtRBzcAZXyGeXc0O5/Z6GAJYskSqzSVRwP7T/0sjfj58R7CNNkLDh
   97iwk43eQfeEhZDmF7ql3VwV2GDnIGMGNPRTa2FSzHnNNSAMXDR4jZK9A
   w==;
X-CSE-ConnectionGUID: ic273AxXSvuyfTg0OOL/jg==
X-CSE-MsgGUID: JWpEavBITQqxaVo7v3eLrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="102499476"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="102499476"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 10:18:47 -0700
X-CSE-ConnectionGUID: x4TCZYFcSqWtvLE2jxJ0YA==
X-CSE-MsgGUID: zXXv3y3iQGqy1JEeVkHsKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238992360"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 15 May 2026 10:18:47 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNwBP-000000002Ob-2H1E;
	Fri, 15 May 2026 17:18:43 +0000
Date: Sat, 16 May 2026 01:18:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 465/799]
 fs/bcachefs/data/extents.h:551:9: sparse: sparse: unsigned value that used to
 be signed checked against zero?
Message-ID: <202605160113.mtdUWG58-lkp@intel.com>
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
:::::: branch date: 6 months ago
:::::: commit date: 7 months ago
config: sh-randconfig-r123-20260514 (https://download.01.org/0day-ci/archive/20260516/202605160113.mtdUWG58-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160113.mtdUWG58-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605160113.mtdUWG58-lkp@intel.com/

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
