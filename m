Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D07E171CD
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Sep 2024 04:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725598029; cv=none; b=SHzza7BDLuI5m1+AyPuBA4+rZSsc2JyLgE6HcwXBgGPNlza7Z408Djwdt9eD0zhE/IKAJ1vV077edtKIaVijVTGO5ZSK7jggu6HYeh6hcr1LDZPn7nmMGeSqtlv8vpzI9b4Sf7M/F5rJVzXQox/4fwaXVd1poJFOEmpUK6GipUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725598029; c=relaxed/simple;
	bh=1IA6F9jJ8GBYvoo5n2COxhxoXSiBtO4Pn4HhdG+mvXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YgqwQDD4izItTZn2t2dJ7DV/kz2ldyKyOZBiX3s+WURy8tiw3qeJ0SNSjsn9YIzoy+5paKqclEtADbPg4WgEphpN7baH+Bn5XX5p+GFU1oWNuchGB1ynabXjhSssAe4gLZ1l8LmPoMH7pf8rcG731lI9UpPo4Qh+F2LnCNeg+94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jn2VjrNF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jn2VjrNF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725598028; x=1757134028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1IA6F9jJ8GBYvoo5n2COxhxoXSiBtO4Pn4HhdG+mvXU=;
  b=Jn2VjrNFF9R9mirW3OJPak6vwgJXne8vrMU1J1ke6Ol+PYZfqaUZ40z2
   2yhEEQzdcuIjr7H1SwrkaewaSWZM7uBR5gWxSpBHqXCo1m4aszxjnxhnI
   4jcYFczzC1vjuYnHNqINCSPhpOAc88fiebsKTMvAmtyAGGdrZbE8KznLU
   h3SeAIlovf1CyPpSL5nWSAg81P0xiHhB3ZkOwf606i5YOOd0O1Vh3pj+m
   HiBb8UAJmgFs/nZnw0bFSBLD4W+qr4aeJD8sbVdxWpbv9hYpn/1MivGYZ
   pzcmQRWjtO0Ga7xy7wH9VL2LcU/CwKOSOtK1ss1L5+f9qutugI70wQZH4
   w==;
X-CSE-ConnectionGUID: /ppYzUdURg2HTj0JrUNpzA==
X-CSE-MsgGUID: 6NGPRu3lSLGEFqlTBsByCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24501504"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="24501504"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 21:47:07 -0700
X-CSE-ConnectionGUID: OTbpJTObTieosbbgdBtubQ==
X-CSE-MsgGUID: KBCG0CQzRhmUjPNuYDZdPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="103321749"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Sep 2024 21:47:06 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smQsB-000Aei-2V;
	Fri, 06 Sep 2024 04:47:03 +0000
Date: Fri, 6 Sep 2024 12:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.12-armsoc/dts64 70/73]
 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb:
 video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202409061214.Q7ltYsKo-lkp@intel.com>
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
TO: Chris Morgan <macromorgan@hotmail.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.12-armsoc/dts64
head:   e00bf11185033456f3d4345bcd366df1f7cc7255
commit: 4e946c447a043c88b5db38501f3af174989dcc94 [70/73] arm64: dts: rockchip: Add GameForce Ace
:::::: branch date: 8 hours ago
:::::: commit date: 34 hours ago
config: arm64-randconfig-051-20240905 (https://download.01.org/0day-ci/archive/20240906/202409061214.Q7ltYsKo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061214.Q7ltYsKo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409061214.Q7ltYsKo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: video-codec@fdb50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu'] is too long
   	'rockchip,rk3588-vpu121' is not one of ['rockchip,rk3036-vpu', 'rockchip,rk3066-vpu', 'rockchip,rk3288-vpu', 'rockchip,rk3328-vpu', 'rockchip,rk3399-vpu', 'rockchip,px30-vpu', 'rockchip,rk3568-vpu', 'rockchip,rk3588-av1-vpu']
   	'rockchip,rk3188-vpu' was expected
   	'rockchip,rk3228-vpu' was expected
   	'rockchip,rk3066-vpu' was expected
   	'rockchip,rk3399-vpu' was expected
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /video-codec@fdb50000: failed to match any schema with compatible: ['rockchip,rk3588-vpu121', 'rockchip,rk3568-vpu']
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /video-codec@fdba0000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /video-codec@fdba4000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /video-codec@fdba8000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /video-codec@fdbac000: failed to match any schema with compatible: ['rockchip,rk3588-vepu121']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
