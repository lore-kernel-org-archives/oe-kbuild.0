Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A7F7E0FF
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Feb 2026 04:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770958544; cv=none; b=pW0dnhC3ytxYGtQzo2c/D95P2+qTERB3dlgkN71r7g+8ClFrsW7fr5KF5VvXrWh1rFkP2QAzNONd8mUtmlnT9zlS2yDyMoiM1yGD5ZRkMo9DXQ0SBW3OFBB5l9U8cSe521GPmQ4H34U0inJf48ZheVPtrBBIwDFVku3WMDE0wPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770958544; c=relaxed/simple;
	bh=dREtOdKZcXEYVZGqhmPanvbsS4r1WPAbwejJZFHqL3M=;
	h=Date:From:To:Subject:Message-ID; b=bZmCgPpl6RrxL863vit/v0Q88P5mKe2nJQNCWZqYBbA+3OjmGi4tvLz3TZXqo4zXXmXgv0RtzkTn/KCt2JTptX5oUiY/UVvteeGIy1+xjbSUiwPyw0RQzkrfWCk1JmaFxEGwo0ZybjI9NKeJ91OGq5BIUTs7evwZtiWvZbkZ1rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LeEE0jh4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LeEE0jh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770958542; x=1802494542;
  h=date:from:to:subject:message-id;
  bh=dREtOdKZcXEYVZGqhmPanvbsS4r1WPAbwejJZFHqL3M=;
  b=LeEE0jh4P0u8Ke4nP8D/JDXzoqfCbldp2PFanmRKH49rBtBWLxtw5GxY
   WZ7EzQimvqmK2PqNMcDCBRgqXXJyGAn+N14MzNqkS1QefUAxkwk6/CUaH
   M/H/NM9OkSBaIymwjeXcVj1EBCvU8NWK8Tb1ghZOXUjNO/kyLf5MqDL+W
   6fvPXUZ1VIrI7hZ2cig9knxrsY8ePVPMcZwfLVRX2BdXpLpst+KGyAZC5
   e6SztwM12zf77HL9tQjLd2KS+3nydQKXaOpG5MoMi4xAFPqQEf9DocpiU
   ZumIvz/ovJO83JGcSHCcRpRzPmmACVf94xb7e1E87D6Nx7whxYI5J5Vdy
   A==;
X-CSE-ConnectionGUID: XExqOOjmTDW+jLYkWzT/yA==
X-CSE-MsgGUID: p4jUlPnDSDSyJLC9yanxzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="59713206"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="59713206"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 20:55:41 -0800
X-CSE-ConnectionGUID: b2KxAq0fQ62k96U7QZbDOg==
X-CSE-MsgGUID: ErPa7WXCRAa3+hWxkL+xxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="212267575"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 12 Feb 2026 20:55:41 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqlDP-000000001Qp-0TDD
	for oe-kbuild@lists.linux.dev;
	Fri, 13 Feb 2026 04:55:39 +0000
Date: Fri, 13 Feb 2026 05:55:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [paragon-software-group-ntfs3:master 26/26] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202602130503.vSjsnaBJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git master
head:   2391a1a2469ae0d275b951e8e8ba7651525df11a
commit: 2391a1a2469ae0d275b951e8e8ba7651525df11a [26/26] fs/ntfs3: add delayed-allocation (delalloc) support
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260213/202602130503.vSjsnaBJ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1674: FILE: fs/ntfs3/inode.c:815:
+	 * Normal file allocates clusters in attr_set_size.
+	*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
