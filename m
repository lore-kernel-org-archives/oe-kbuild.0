Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1C017BA6
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Jul 2025 07:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752391577; cv=none; b=VPTFQdx2l96oW+Ddll/cp+IieUftSvce47okDOk8ZHezUC10yHVwKxK+U5lspxr0HUPlVwLKtqOYesXIuwGOua5FeuzdAOCapkpAiYf8Lu+2EWSfya5WMyEWTNDKJBjeNMAmgqZOEUM2YSd2PdsiW09CdTZmzATmJ5eiikUzfBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752391577; c=relaxed/simple;
	bh=+/YXzFJTfCwPO8L6q1RA7uk5dTe1RC2CYkwbukBpTqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AZe4gZ6eHOnv+w7RSLPcEDJRS2hdJHnisiXCFL/coSJUFjOoT/Gr1aBR40xkSibJtIqtonKYqzOayESKzQX+QlvXhZqQ+TDLLZhXh6kJlIrGpfacn6LiDScPzuJkdtwGY4zPVAc58C1HNoacrdmvk42o8QzNa/ypSHvE7hjqUyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWw8+X2t; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWw8+X2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752391576; x=1783927576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+/YXzFJTfCwPO8L6q1RA7uk5dTe1RC2CYkwbukBpTqM=;
  b=JWw8+X2tz91bSR5Zv3ON+TQ9tUeE5xXsUWSsVtTtw9ZgmxR5F8MvADx9
   MMLFFUAtNyfFhIBNiWZrorsCFbvJZLZZBRgEsC1pQnronUpinTk9zc5k4
   +r1DxBzWAP6eL2yP1kdfrgFAPX7OHjvJ2/YV86HEpveIKtD6koK9UnHHw
   R4ufHjByito9Op2WyYqSC0ZlGlRlLiZckLv5VFTZro+4O82CnCGBLrheO
   dRbU9r8znKszAJCIXwWrYMM9pxtIxfhk2XXa7ZqMHn7R1KoMrasJp2Fbp
   6fuIWe1IMUGCwc2TC70y06XvX81RYRIYUVPLsGgzJfYVCDQw+Mts/mCbl
   A==;
X-CSE-ConnectionGUID: kNP6ah8UR4mI9jN9DTWtTg==
X-CSE-MsgGUID: mXuBil0rSeecl77ZzIJA8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54749827"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="54749827"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 00:26:15 -0700
X-CSE-ConnectionGUID: lLSC2UISSQGrm0w7xWfdKg==
X-CSE-MsgGUID: jueEU/sNSsmyCt49lnyy/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="160999601"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2025 00:26:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uar6B-0007xv-1q;
	Sun, 13 Jul 2025 07:26:11 +0000
Date: Sun, 13 Jul 2025 15:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sunxi:sunxi/for-next 6/8]
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: ethernet@4500000
 (allwinner,sun55i-a523-gmac0): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202507131501.stjikkPr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Chen-Yu Tsai" <wens@csie.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
head:   694575b9321bf4cb7fb73851cf155a790386a069
commit: 4acacd8bf1561c01b74db888d56e588a8d11d539 [6/8] Merge branch 'sunxi/fixes-for-6.16' into sunxi/for-next
:::::: branch date: 23 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250712 (https://download.01.org/0day-ci/archive/20250713/202507131501.stjikkPr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507131501.stjikkPr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507131501.stjikkPr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:103.6-652.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: ethernet@4500000 (allwinner,sun55i-a523-gmac0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun55i-a523-gmac0', 'allwinner,sun50i-a64-emac'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'allwinner,sun55i-a523-gmac0' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-emac0']
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: /soc/ethernet@4500000: failed to match any schema with compatible: ['allwinner,sun55i-a523-gmac0', 'allwinner,sun50i-a64-emac']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
