Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729B078F2E
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Feb 2025 18:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740334355; cv=none; b=D74i+g5nsYxGKevmSFbD61GO1la8l3iql7dYkQOPlHjAqK/nNwVo7GvQdHDUluGeHcBOUP/NvSOQ70PDXNIz1O6weWDmCpwC+FMSuzruGbUYBkAqHMPa5l91cgRUFuYllU0VScS5THJHO7RWN23kXnjXYfJYrb75K55k+w3T2Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740334355; c=relaxed/simple;
	bh=15V2g8SVo+W5QRuAQ/IUk6lbXuQvlLaDqiIeqZRXCiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MIOK7ZFw6Q3Coq18lbgmEVPJndH2HbIZi7MLgDSeztOIS547DFlFAxRiuTkSZ1I5MI2A+0KCa6MWzcTOgCxZ2HNBCnuc8VNbI3yIZCoR2QHFjvAR1Wt1TOCZU89xoDViOTPW4/sD5urzWpAg98o8pW3OW30QoKaoUqHtHhdaPkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnVhu+vD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnVhu+vD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740334353; x=1771870353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=15V2g8SVo+W5QRuAQ/IUk6lbXuQvlLaDqiIeqZRXCiI=;
  b=dnVhu+vD/+s4Vj58Xv1PFRE0HszbHFZXZg1mVNMlO/2Wk/IYU1DBXcVI
   WQPgduu1e4NepxRroJXgF5IVl7Nn/ihlgvko5nXKzTLfLzlmfdhttq16u
   P2Mw24zIPZIBtOXFL7phNEqrTrJ78UI3kCKkpPNMgw1oazEQP5kf/mDqC
   s7yu7nlqk2VKZkOKhnKcPV5Uy0pNdaLZ55Rje1ihZkxa29TGPRRJXs6xa
   3+gwClYMHCN60Rf/6PT8DsPNyvNAyf5qRnokSlK/dWpOXDQ25bIChGV4B
   BZitlyaEEU5B0Jc7ELs9aS91Bc+WVID8xSM/eYa7aq22k6l2a+bFfXbyj
   A==;
X-CSE-ConnectionGUID: NrScSGh2SVSdjvX4pQjXwA==
X-CSE-MsgGUID: O8B38yjmSi2NbdhP1nJQ6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="44742553"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="44742553"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 10:12:32 -0800
X-CSE-ConnectionGUID: pLEN9u7pR/em+j98ZxYbnQ==
X-CSE-MsgGUID: sSBFYCmmRYKC9TACazWdUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="139089326"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Feb 2025 10:12:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmGSr-0007VW-1S;
	Sun, 23 Feb 2025 18:12:29 +0000
Date: Mon, 24 Feb 2025 02:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.15-armsoc/dts64 29/47]
 arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: vop@fdd90000:
 clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612],
 [31, 603], [104]] is too long
Message-ID: <202502240207.ZkB0pEBD-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Quentin Schulz <quentin.schulz@cherry.de>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Dragan Simic <dsimic@manjaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.15-armsoc/dts64
head:   5c349537e298c9657eaf48e2768b308d04523052
commit: 920ceeedeb00eef0c3c4f5f0276882b4666dc770 [29/47] arm64: dts: rockchip: minimal support for Pre-ICT tester adapter for RK3588 Jaguar
:::::: branch date: 18 hours ago
:::::: commit date: 9 days ago
config: arm64-randconfig-051-20250217 (https://download.01.org/0day-ci/archive/20250224/202502240207.ZkB0pEBD-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502240207.ZkB0pEBD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502240207.ZkB0pEBD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: /spdif-tx@fddb0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: spdif-tx@fdde0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: /spdif-tx@fdde0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: spdif-tx@fe4e0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: /spdif-tx@fe4e0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: spdif-tx@fe4f0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: /spdif-tx@fe4f0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: spdif-tx@fddb8000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: /spdif-tx@fddb8000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: spdif-tx@fdde8000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: /spdif-tx@fdde8000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
