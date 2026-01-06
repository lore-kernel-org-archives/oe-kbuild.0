Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544E326ACC
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jan 2026 03:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767669698; cv=none; b=mlaFx5uhbWuDyqnieZ+2z7Wx6kBbc0uMIdS2TMuDA8fiHxM649hmq9kBkXhqtlwjNMubMpjkk1nzwXRUgq3MjAgBGmMAj2NktxGRceUXsgfZl/brBaSsrE27BDjfCB2RH/VQcug6qhNctG/urqdpcm2BY9tVJknrTX4P00vtUJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767669698; c=relaxed/simple;
	bh=8o9FgNM60/Ld8NsrMI38QTRkXLDy+HBLgJ5ddS0/JW8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c02Qm6FXabVe+ZE2rjgVm972oUtn6LTvJgQHx08IjbxPixiGvte6np696GjLbqzePMUO+f0bnRNe5/n4oyVMGNPZojYS5ttHZK1grIQpCWBSQdJpp0Rerf+2mq4j1Wxs8OGSbo0OjAis8LfRqHRTFD/Rm7eUUysflgELGZ/WShI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENLwGKIs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENLwGKIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767669696; x=1799205696;
  h=date:from:to:cc:subject:message-id;
  bh=8o9FgNM60/Ld8NsrMI38QTRkXLDy+HBLgJ5ddS0/JW8=;
  b=ENLwGKIsGYc7hRgHEyB7a86O8khaUQ80TwqzFKS5FfVFW8Mnn7C9sEtm
   l39aobivgfK0MJTktMRV1+254pSimHRqGDrAHFdXl8WjjfA1ONEhvtDFk
   rWoCJOa/rLfkQN3ekKEf7YkAwB3xkJT4V2uiMZv7rPZMcQ1rykCNSGmEH
   B75GhLVxFmUEppx8k91nq29ygVxdNR9vLN/Y9K1ZFmvpmw/RbxifDULRj
   vteXUjoau9BjRdKdlj8Q9j15hle8A5AbZRr9XtiYD1CybC/7g3eCQLBbN
   2EykSPI9HXQO6gKRxRVly+Ct9FJceD/ATOzZ5QnLMRbsmlhw5NJrYnI7+
   w==;
X-CSE-ConnectionGUID: C5sgioNXRQKAZLko6YX0hw==
X-CSE-MsgGUID: DiwLj3MyR52uwOR6CRFSog==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68047955"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="68047955"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 19:21:35 -0800
X-CSE-ConnectionGUID: up/wRfGTTeGpWdb0IJNHhA==
X-CSE-MsgGUID: 9wXOcPSzSk+XRS9Tz/oJRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="203515321"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jan 2026 19:21:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcxdU-000000001dZ-2BLp;
	Tue, 06 Jan 2026 03:21:32 +0000
Date: Tue, 06 Jan 2026 11:21:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2990/3725]
 drivers/phy/spacemit/phy-k1-usb2.c:199:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601061140.6GUe2frS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/phy/spacemit/phy-k1-usb2.c:199:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ze Huang <huang.ze@linux.dev>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6cd6c12031130a349a098dbeb19d8c3070d2dfbe
commit: fe4bc1a08638309b6be1af37210930b856908eb7 [2990/3725] phy: spacemit: support K1 USB2.0 PHY controller
:::::: branch date: 88 minutes ago
:::::: commit date: 5 days ago
config: arm64-randconfig-r113-20260105 (https://download.01.org/0day-ci/archive/20260106/202601061140.6GUe2frS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601061140.6GUe2frS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601061140.6GUe2frS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/spacemit/phy-k1-usb2.c:199:1: sparse: sparse: bad integer constant expression
   drivers/phy/spacemit/phy-k1-usb2.c:199:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/phy/spacemit/phy-k1-usb2.c:200:1: sparse: sparse: bad integer constant expression
   drivers/phy/spacemit/phy-k1-usb2.c:200:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/phy/spacemit/phy-k1-usb2.c:200:1: sparse: sparse: bad integer constant expression
   drivers/phy/spacemit/phy-k1-usb2.c:200:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +199 drivers/phy/spacemit/phy-k1-usb2.c

fe4bc1a0863830 Ze Huang 2025-10-17  198  
fe4bc1a0863830 Ze Huang 2025-10-17 @199  MODULE_DESCRIPTION("Spacemit USB 2.0 PHY driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
