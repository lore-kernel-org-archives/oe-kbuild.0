Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF7C2233B
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Nov 2024 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731160789; cv=none; b=n5939F8kYbA8nTyzS1l99wfrjgRfYOmwFUgO8p1xp9jT02a6b9w71hpGDGj9CfxVoL5dAOvu7a0xKCKrLC0avKJ3D1nsQm2JkoGMTMIGUrQra3Qp6Z1V5T5vTUBHM+81lI9W3zBqftg+neLKHGqx/pu8xd4U+D8Q69jt25BDLzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731160789; c=relaxed/simple;
	bh=5W7UAfq/+eujWfU6Kqj816b4JcpR3+/Oa27mNR9ks2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bniDiaCo2haP9KqOFNmqIulqC8pWiyWwmDfLB8LNBu1b5XMJoO8rfGRGGfy/XavpeBbmFqNPyw9IIPyHQEBTCSCqG7fad3vMVaZJf2OfAeB2Ir3UegsesuaD4Oj4acE5XfFk4ob0bOG72hptGpkQsWhlkScr1zlgTmidW8YE+OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYKF5cPM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYKF5cPM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731160786; x=1762696786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5W7UAfq/+eujWfU6Kqj816b4JcpR3+/Oa27mNR9ks2k=;
  b=QYKF5cPMn9vmd3bzJzcuMaQf6RIgBLduymuAbA5inlUFj2Di1NF3n2xA
   Ox8vYYm2cdZfCkQ2eqOkTg4Tkg3RDYIWM2huSenBNvbpxOdllgKbGiLKn
   efg+ztCg93kkS7awAXCCWoMWP/DecHPC7R4UxDkNOkA3e4fuL+O5Ob6q4
   +FM+4vW2ENoT+xG3Fnf4p/JU/3g+N8TSX8wCwpqBQLYlRVdwyCmd8PMMe
   isBXv3GZVfESwUBxD7ALzbHytyt1Bj0/r4neO3SATkq3+AhgTCGG0KMzO
   E2B7Ls/ON0OWUGtfv7TPU9zArHf34Aejhi0t0Vn73T0aTS/6FFw/BvIw0
   w==;
X-CSE-ConnectionGUID: kTK80fGDQiW5BJCbp5H+ow==
X-CSE-MsgGUID: /VDQBcoGTe+nN+TUv4dp/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34716038"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34716038"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 05:59:46 -0800
X-CSE-ConnectionGUID: ACeDnRQAS7uLwv2ZblK/4A==
X-CSE-MsgGUID: 79XNbupRQ8mGaWWA+Y+nVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="85611702"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Nov 2024 05:59:45 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9m07-000sO2-0h;
	Sat, 09 Nov 2024 13:59:43 +0000
Date: Sat, 9 Nov 2024 21:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: add dts for Ariaboard
 Photonicat RK3568
Message-ID: <202411092150.1lgXV2fR-lkp@intel.com>
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
In-Reply-To: <20241108031847.700606-4-bigfoot@classfun.cn>
References: <20241108031847.700606-4-bigfoot@classfun.cn>
TO: Junhao Xie <bigfoot@classfun.cn>
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Jonas Karlman <jonas@kwiboo.se>
CC: Chukun Pan <amadeus@jmu.edu.cn>
CC: Junhao Xie <bigfoot@classfun.cn>
CC: FUKAUMI Naoki <naoki@radxa.com>
CC: Dragan Simic <dsimic@manjaro.org>
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Junhao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm64/for-next/core clk/clk-next kvmarm/next shawnguo/for-next soc/for-next arm/for-next arm/fixes linus/master v6.12-rc6]
[cannot apply to rockchip/for-next next-20241108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Junhao-Xie/dt-bindings-vendor-prefixes-Add-prefix-for-Ariaboard/20241108-112705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241108031847.700606-4-bigfoot%40classfun.cn
patch subject: [PATCH v5 3/3] arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm64-randconfig-052-20241109 (https://download.01.org/0day-ci/archive/20241109/202411092150.1lgXV2fR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411092150.1lgXV2fR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411092150.1lgXV2fR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: bluetooth: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: phy@fe8c0000: 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: rfkill-modem: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/rfkill-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
