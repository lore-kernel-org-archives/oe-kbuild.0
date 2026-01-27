Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B4E35C1BC
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 14:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524055; cv=none; b=UNDFd77n40ems+wzbNe7Fz3b5vdZm59B3HrSYimGBB7WdBrz4HvGlwAjh6d1qE9GcY0VCqHHzGEmO7DT7roMFjVmX3Id3gZASXq10ZOyQHRQiTt2XWyo2Y3Bw1Kyk7qCFPqGoII4T8q7euVXZcT5Dgf1v/y9mvNAwKzntnAY9ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524055; c=relaxed/simple;
	bh=ZUhOchVOgPiuFgDIXCX0W3HFPcImZc4n9NpHbyrGzZs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WIv7/N1TMVOqzXmRbtVdWB8Z7wN0jwNPup7T+mLQ14USZ82qo8iftXsj28Tlg0TCud/duulkQIyDWt18UKBvgG5hQoP7aG51HqyEZKNVkkSE2VidM4dIWQIN+sV832IT1Ny5RWpy18a9bo4VsH0vTy7727xXF6pY9E+y6dwMMwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NnURdKw5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnURdKw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769524054; x=1801060054;
  h=date:from:to:cc:subject:message-id;
  bh=ZUhOchVOgPiuFgDIXCX0W3HFPcImZc4n9NpHbyrGzZs=;
  b=NnURdKw5SCj1l80xjwg5Zynhae1ZI7AZ1LOn9JTNy0BNLMuqy4QY0+l9
   e1NwHmLTgI7vPezIlPvuKFTmnjGI99lOjI99HyWZ/krrKuob1glZk41LY
   mRLPS98Tf8ClAuZBb9jC1qyCO8LYhg87fX4s9Ppe5HeDigz2QSZtZBW8D
   KGAHmrM8D5D49Npq86VCrp/Qi3scAQJhD/V+bhU0znNpP44gS2Xp1cV6z
   Pt6RxpYTmV8aFrKe9295nHzogudyOfGE6yh9swWoYtp53P11onqd738Tl
   xYw+StFL/X2x2NwZw+VHV9qcO3alQ8dKOOWiGHb6vJapv2WsaLqB7di7b
   Q==;
X-CSE-ConnectionGUID: xbpl7WTUSfa3+BMAT2hw8w==
X-CSE-MsgGUID: R1HhJOXoQtiB8NQ8za+twQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70776378"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70776378"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 06:27:33 -0800
X-CSE-ConnectionGUID: /2jOVPzTSjaytV1pUmSe3Q==
X-CSE-MsgGUID: 3pN1wQtzQFCtH8tUcMNaIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208006185"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Jan 2026 06:27:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkk2T-00000000YYg-1SRK;
	Tue, 27 Jan 2026 14:27:29 +0000
Date: Tue, 27 Jan 2026 22:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5587/9596]
 drivers/phy/phy-google-usb.c:295:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601272204.HroNCoCy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/phy/phy-google-usb.c:295:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Roy Luo <royluo@google.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Joy Chakraborty <joychakr@google.com>
CC: Naveen Kumar <mnkumar@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   615aad0f61e0c7a898184a394dc895c610100d4f
commit: cbce66669c82ee9ae0e26523c0fcd3c721fcfe85 [5587/9596] phy: Add Google Tensor SoC USB PHY driver
:::::: branch date: 15 hours ago
:::::: commit date: 13 days ago
config: parisc-randconfig-r121-20260127 (https://download.01.org/0day-ci/archive/20260127/202601272204.HroNCoCy-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272204.HroNCoCy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601272204.HroNCoCy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/phy-google-usb.c:295:1: sparse: sparse: bad integer constant expression
   drivers/phy/phy-google-usb.c:295:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/phy/phy-google-usb.c:296:1: sparse: sparse: bad integer constant expression
   drivers/phy/phy-google-usb.c:296:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +295 drivers/phy/phy-google-usb.c

cbce66669c82ee9 Roy Luo 2025-12-27  293  
cbce66669c82ee9 Roy Luo 2025-12-27  294  module_platform_driver(google_usb_phy);
cbce66669c82ee9 Roy Luo 2025-12-27 @295  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
