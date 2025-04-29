Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A9F21B18A
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 16:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745943396; cv=none; b=MEgE5A3GJrMCOreX0ZFt+Zgw4pol/MXlbr/1CIfvmb6oLEG/JRgx9kbp+W7BZ0E0l2Mthns0HI8iF7CwqJucQiBgwK34trEdcq9ny4e15Ee55tqS73Pk4Y9WPyahmPnEhbmMDdokWpkLomVU5V6uyw8RInqrcavTIClspIY4Ksk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745943396; c=relaxed/simple;
	bh=UjyXFdGZtYfbvZOepw69JyZSrsOa8xwNE5X3H6l6j+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C99ejOzsS+fpz0wxci5YPDoudz8xPwOXbYPuiNK25e8CI16EGRw3X5m6g2tASe5b+c4gDMcXNICRg5T04N6UxFEjjD05RLJF8ePcUAFo/ps1/Ie3GedhZVVBjTnvlQAOUY5a4jDf9JO04v0u7orSBeXwLG3Meop9lYUCPmzJOEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kf8UhAfW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kf8UhAfW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745943393; x=1777479393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UjyXFdGZtYfbvZOepw69JyZSrsOa8xwNE5X3H6l6j+U=;
  b=Kf8UhAfWBgXtmevAOZDmHbQUELS+2U12rcRKFcjOfUMpgHVAZ6frgTae
   sI68C6Zxtk5hXLSCl4HOQHtjWZUyLb1TUHIsQZ5zQcnM1W3cqhvPGmxSM
   MPEoI8wiMFOIMjU+kVqzdR6xxQBIbx/1zzI+xVJcgavzTJaZMfHefpsla
   hli9aKdKWOQVRlEB6THtiWvuC7ngvtl6M2X/RTrW6pGkOrPDxvN0haUQL
   6MUjo0SExbm9FSjIzSzqRc6q7P9IWQ5XQFHTkx3ktG0C9wf2QegXFAirm
   LzwsFkYd5+3zTHrDXmPrNKoQMCZ0Oxg1YXf3/NZGfbol2U/5Air0bby2m
   Q==;
X-CSE-ConnectionGUID: v4zu7rSWTkOGnkgb2tzQ9g==
X-CSE-MsgGUID: rTDdVRAnRAO7NdUpeOoN1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47713524"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="47713524"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 09:16:32 -0700
X-CSE-ConnectionGUID: rpqkz7fgRpO6yUvTFRCK1Q==
X-CSE-MsgGUID: 0q696Ru2SyaSLfbZAcGNPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="138980859"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Apr 2025 09:16:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ndE-0000tj-1m;
	Tue, 29 Apr 2025 16:16:28 +0000
Date: Wed, 30 Apr 2025 00:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
Message-ID: <202504292323.mhKD7CV8-lkp@intel.com>
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
In-Reply-To: <20250427094211.246-3-kernel@airkyi.com>
References: <20250427094211.246-3-kernel@airkyi.com>
TO: Chaoyi Chen <kernel@airkyi.com>
TO: Heiko Stuebner <heiko@sntech.de>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Jonas Karlman <jonas@kwiboo.se>
CC: Kever Yang <kever.yang@rock-chips.com>
CC: Jianfeng Liu <liujianfeng1994@gmail.com>
CC: Dragan Simic <dsimic@manjaro.org>
CC: Jimmy Hon <honyuenkwun@gmail.com>
CC: Quentin Schulz <quentin.schulz@cherry.de>
CC: FUKAUMI Naoki <naoki@radxa.com>
CC: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: Alexey Charkov <alchark@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Chaoyi Chen <chaoyi.chen@rock-chips.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Chaoyi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on rockchip/for-next krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.15-rc4 next-20250429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/dt-bindings-arm-rockchip-Add-rk3399-industry-evaluation-board/20250427-174445
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250427094211.246-3-kernel%40airkyi.com
patch subject: [PATCH 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250429/202504292323.mhKD7CV8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504292323.mhKD7CV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504292323.mhKD7CV8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: tcs4526@10 (tcs,tcs4525): Unevaluated properties are not allowed ('regulator-compatible', 'regulator-initial-state' were unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: pmic: vsel2-gpio: {'rockchip,pins': [[1, 14, 0, 164]], 'phandle': 113} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
