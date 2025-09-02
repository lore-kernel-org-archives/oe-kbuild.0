Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F0E1DED7B
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Sep 2025 03:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756785207; cv=none; b=eN6Zto1nZtJp5cND6fM9ATEdjyr/K9DxzT5VLGiHv1xnKn5ypkQE8UjXK4VZ0jigxcqofYjxAhyz9BKM/7mEQN0cVoqmmIZFoqowU591Kxrfro1KhqjeFPk9O2JcxQZva0pxa0oxY3m9VZsv9MwVk4dcPDRf8cYNTaiIGuvNDFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756785207; c=relaxed/simple;
	bh=TSwUAc0aUIqTg8gYvW0m1g45H6Kqq0F0WcokMNwx3r0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dZFPH+7Ppsbl+1rTigawMrCXe/TAuPuN/Y+Qwo1G8V8S4fDIw+B3GFyLc5+UA0fUldmomxPBWCPLaKjA5NoALm3jz6V1oFN+3QoGxkDQLKS9iiyez5Zn+mFiRC5HyjN6ASxy9aOVIkUhpyohKvnUhM1TEmKWo0Wl5xxOTQXDamY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lR3Zkak2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lR3Zkak2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756785206; x=1788321206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TSwUAc0aUIqTg8gYvW0m1g45H6Kqq0F0WcokMNwx3r0=;
  b=lR3Zkak2Sx3P/wdCSFebKuuthPiaKDcxb/oWjdnRS6BA9y7wSpCJjYEJ
   4KMZqoMdUkkj7VuSIX9KnEwCS+1euQ16JBsnvyeVHVTgIg2yiw2nUH8Uu
   OTIRhzcR+57inLDtOJzCytdHiQmk3jlD63OL2fvtRFzigNjMlNgc/x6yT
   Kxy2bboK5b3Aan5C3dcjQfBWiFS0cmlLJFpmbSsW1WlUcZOhyZShiYscm
   DFR841HCX2pG+2txz9GDDTWMgfa1rMkbd/XAdNh1E6woBxp20Bf9htsSS
   09eMstmOWxzJ2h5oQkMGdz72CF6X2qbV8na0vIt7zJTru0rLylrI/jkK7
   Q==;
X-CSE-ConnectionGUID: AGYLRK3YT7Gd/E+9We8fmw==
X-CSE-MsgGUID: Lp0qZAYiS8WQu0O5xHgS5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70419600"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="70419600"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 20:53:25 -0700
X-CSE-ConnectionGUID: 2014xdQ/R9i68f8VWus/xQ==
X-CSE-MsgGUID: CtS1PHL8TqCWq5UDVEKacQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="194806006"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 01 Sep 2025 20:53:24 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utI5C-0003F5-0L;
	Tue, 02 Sep 2025 03:53:22 +0000
Date: Tue, 2 Sep 2025 05:53:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.18-armsoc/dts64 39/47]
 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: /soc/syscon@ff348000:
 failed to match any schema with compatible: ['rockchip,rk3528-pipe-phy-grf',
 'syscon']
Message-ID: <202509020548.OFuArzK6-lkp@intel.com>
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
CC: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.18-armsoc/dts64
head:   df02252f271b4fa50c7087a0e6f5a7d7ed2f1dcc
commit: dc16a221c07b5336d4efb1cfc0bfd7089eea1fce [39/47] arm64: dts: rockchip: Add Radxa ROCK 2A/2F
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20250901 (https://download.01.org/0day-ci/archive/20250902/202509020548.OFuArzK6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020548.OFuArzK6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509020548.OFuArzK6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:240.6-1136.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: /soc/syscon@ff348000: failed to match any schema with compatible: ['rockchip,rk3528-pipe-phy-grf', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: adc@ffae0000 (rockchip,rk3528-saradc): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/rockchip-saradc.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: /soc/phy@ffdc0000: failed to match any schema with compatible: ['rockchip,rk3528-naneng-combphy']
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:240.6-1136.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: /soc/syscon@ff348000: failed to match any schema with compatible: ['rockchip,rk3528-pipe-phy-grf', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: adc@ffae0000 (rockchip,rk3528-saradc): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/rockchip-saradc.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: /soc/phy@ffdc0000: failed to match any schema with compatible: ['rockchip,rk3528-naneng-combphy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
