Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C072E06C9
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Sep 2025 06:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756795477; cv=none; b=TxmBEc3ZvAYtIB0D5gpM+DEu0mdXrdLQRJV7fQnX8gr7/5W+DrHTBRfQ8fwFYP6Q1mMQ4+dSvgG13Bl6OmgnoU654aQoH7YzkPYY7TYhmfQyrzkwA9YA72QuyPbX4h5b5gL1fAuQ7YTNCCTC7YuIe/9lUtFyMnVs+o6X2cy4N58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756795477; c=relaxed/simple;
	bh=oWyELOlP4Iu3aQpC5cct9L/o8yrlG2nqe/D97z0dlIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R2JbL6jLtXeHf1WjduCAoFlhVwRSMS9e/TWeI5+z1CjefN0NNj5KNW6gMqGi5dh6PC7nt06zVn7EyI+D4A0CA4cBCA/qR2HFs5KTBQDt1zPrO7ZiA6ZQIT7gQ5g1QJCmU4GM9u2ZBhxDniAqJFzejIXcted8RWvL/QtQLtZkQTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GyEW1dbN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GyEW1dbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756795476; x=1788331476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oWyELOlP4Iu3aQpC5cct9L/o8yrlG2nqe/D97z0dlIE=;
  b=GyEW1dbNSeK+WrdDLyNbbexlKKL05ksVhDrKwIpFCvjWupFIq+l98ai/
   bsFg1D5LiEpz25LS8LyS1t47s5zuD85urN8tHBxgPjEMTjZjuaoOKzeBR
   CE7rD5EtZqGvZkWDMANtIgmmE1yl9+D2cb78lziHLepAa8b2zcrJVdMs1
   SmBOj8yEJz/jiqO1AtmrI7yndYsxe9+hm/LDnljEetE51iWEAcz5H9Jbi
   8B0UNshgfboVOPqjEdgqbICViFaerpnko7bSrec7wpHKNYkdFlECtt+aM
   ywdcKD0Qb/8DejfPcob0QJ8YQIrOcwp9EeUeojYerwCQE1vMRsecylJ/I
   A==;
X-CSE-ConnectionGUID: aMPbfrgoRR6NU0amB7Wbcw==
X-CSE-MsgGUID: LeMGp9GXS2uoM7Dc7gTb3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="76649948"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="76649948"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 23:44:36 -0700
X-CSE-ConnectionGUID: Gs6FWDalSc+0FKNgdWlYqg==
X-CSE-MsgGUID: yGPO6GzRSDCN4jDCUQlzIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="202121468"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 01 Sep 2025 23:44:34 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utKkq-0003G3-07;
	Tue, 02 Sep 2025 06:44:32 +0000
Date: Tue, 2 Sep 2025 08:43:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.18-armsoc/dts64 41/47]
 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: /soc/syscon@ff348000:
 failed to match any schema with compatible: ['rockchip,rk3528-pipe-phy-grf',
 'syscon']
Message-ID: <202509020818.RwZf5BQg-lkp@intel.com>
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
TO: Jonas Karlman <jonas@kwiboo.se>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.18-armsoc/dts64
head:   df02252f271b4fa50c7087a0e6f5a7d7ed2f1dcc
commit: 7cedc908a877d7c003aa0c205fb088bb6c15f5d4 [41/47] arm64: dts: rockchip: Add ArmSoM Sige1
:::::: branch date: 20 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2051-20250901 (https://download.01.org/0day-ci/archive/20250902/202509020818.RwZf5BQg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020818.RwZf5BQg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509020818.RwZf5BQg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:240.6-1136.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: /soc/syscon@ff348000: failed to match any schema with compatible: ['rockchip,rk3528-pipe-phy-grf', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: adc@ffae0000 (rockchip,rk3528-saradc): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/rockchip-saradc.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: /soc/phy@ffdc0000: failed to match any schema with compatible: ['rockchip,rk3528-naneng-combphy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
