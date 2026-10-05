Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8586734D92C
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 07:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184936; cv=none; b=KpxfefctTvXvHraAZJxHwZVD24+GyAmXmC1IucIzXPP9gsBG75a2wdoqSNeMSNdBC80hCCCH09/TkZNhpPLJEO/C0mzQ4l58gr/AQ6uvc5D/2Y+WaP7fxCS1r+2jktLfl0Ozjd2ky2FD0alxxBuR5v0Te5AUBJwcl07Po3oTygU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184936; c=relaxed/simple;
	bh=u/jXJ31C9Hy171mMUj3R76swcRY+vrGTOCr5qbhKZVs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qf1jxTexIS6l6hlX7miauL0UveeIql7iBSKjNM8S8sDpaIKdKidhQGyLnjxqlNk5DFCekmZQ66AHoIvNhmjkr8lKe4NnqCR8bROIY5KDVhHjn2abCM0EuvXD+v31hQTSLbuxNw3yQm4YXpK/V9GUro+uJyEGNpoabJdMBh37kkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iR6XYju7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iR6XYju7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791184933; x=1822720933;
  h=date:from:to:cc:subject:message-id;
  bh=u/jXJ31C9Hy171mMUj3R76swcRY+vrGTOCr5qbhKZVs=;
  b=iR6XYju7E73+zs8qFD3VXVyV3enFaNXhpuEyICDqX0973KD1trtEek81
   eAla9/W3cEg6RSLgUYfOx7bYRogUEvzS8k29k0bxT2+goqzEP9d8PwhSD
   uST474BgAQKyVpZhweGwdan+ZoxXfrk281UsQyNIRwKwhbi4UVThK2WQ4
   futkMaDOsvXw/aYEAXLLhOj48QazfTt5gjzgow9T/PUqjN4OHBMnPD1Z1
   sSloIeYo9Zz1+b+rqhyplc/vlkNdDYaZ/0pBN7goHbTtSXHjicmY0K16L
   lxe1C8R6zEb9ESeszGEpC925fahHF6z+FJM+1rXl6H5dtryN7e8eRfDQ6
   A==;
X-CSE-ConnectionGUID: WUsQkTGMRFqYLNAvLzWzJg==
X-CSE-MsgGUID: w4lZ/Xy1S2ChN6EtwH6K5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="109337837"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="109337837"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 00:22:13 -0700
X-CSE-ConnectionGUID: 8zWn0i/SSjWR7+kduCuwwA==
X-CSE-MsgGUID: t7nfIjWQS4WJUj7QGsCeXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="281508555"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 05 Oct 2026 00:22:12 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDd1W-0000000002h-272f;
	Mon, 05 Oct 2026 07:22:10 +0000
Date: Mon, 05 Oct 2026 09:21:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ardb:arm64-bti-veneers-v2 2/2] WARNING: modpost:
 arch/arm64/kernel/bti_veneer_test.ko: missing MODULE_DESCRIPTION()
Message-ID: <202610050926.DXKIjekb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-bti-veneers-v2
head:   bf6d477cd43ba9f2d080dbb0acbaee5be7114cdd
commit: bf6d477cd43ba9f2d080dbb0acbaee5be7114cdd [2/2] DONOTMERGE: arm64: module: Test module for BTI veneers
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261005/202610050926.DXKIjekb-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610050926.DXKIjekb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610050926.DXKIjekb-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: arch/arm64/kernel/bti_veneer_test.ko: missing MODULE_DESCRIPTION()

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
