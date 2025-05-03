Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84D6171C9
	for <oe-kbuild@lists.linux.dev>; Sat,  3 May 2025 04:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746246997; cv=none; b=iJOLldbgn1sbfFxqUGfSkGWCcP0S3t3fzNQfnhuwzjQZfuOezQE3uwXP3ysCOv76iwxDX2gq8z0+zW920DP183N5jU/D10DS4W5iVAuZartw8ZUokCd8IaR8zRM9odhfNsrh0dRiSD7YxvYQH0YQzwVomspoDpZOYwVzv+w42iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746246997; c=relaxed/simple;
	bh=OiRubDKWtUlq12UcbauS2Wjns3nvOqaQV2sykBWdQ08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TXRU8cn/r2KbY0UAB9L+/Dj1Tb6dFLJh53YWy3CmH0nTeBur4bDr+AiVkOkkjYYZfwDyMieXIVEKrJkCMoO4N16VDswYOQkSslFEechx093O1aQBafhC85KW/xxuOOguWF5BoJjNxDd9U/ojgTYXVCk1aopgnYCBKYqBZmJf/lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOfV/Pfd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOfV/Pfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746246995; x=1777782995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OiRubDKWtUlq12UcbauS2Wjns3nvOqaQV2sykBWdQ08=;
  b=DOfV/Pfdm5IwUIO3j+GpHLa3Z5DYiNggnhVc/hTcPkUZYawXd4yzdYp/
   aXE9seZplTNS2JJU9P4WxiYuhQfQ4XR4V5i7DJdtuB7S4t1yK71lxqZ5A
   LYAKanNdivsnlSfRP4QA7rSCcR2vZFxzoU1VIPZssuVaEwgzU6RqmreBP
   DzkRri2xQKWcaQUuYI/VCXZ/G/NINgVvwPe+BWyaKliaOpLNpP+PyYlvg
   sfoKtOzVOIbP5KdwTppaUGux9+s7ZpaDjQ/UIWKcjEa1Z5oG3pc+uHcTX
   mVCghhpuDOMpSq4rwLGN/foHZzb6PgI6QaN/XyHcpU7PAqSLLZiEIcz2e
   g==;
X-CSE-ConnectionGUID: c5nQCYurRWu8sLZ3nkL9xQ==
X-CSE-MsgGUID: F7oA8SDLRCGbP5kIWOfdZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48017065"
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="48017065"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 21:36:34 -0700
X-CSE-ConnectionGUID: lgvlDf7VTGucqzgy/8qLxw==
X-CSE-MsgGUID: 6OMcHwbZSkurgAq2BfXSDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="172046025"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2025 21:36:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uB4c2-0005C5-0w;
	Sat, 03 May 2025 04:36:30 +0000
Date: Sat, 3 May 2025 12:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
Message-ID: <202505031259.5pyTQ75L-lkp@intel.com>
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
In-Reply-To: <20250430074848.539-3-kernel@airkyi.com>
References: <20250430074848.539-3-kernel@airkyi.com>
TO: Chaoyi Chen <kernel@airkyi.com>
TO: Heiko Stuebner <heiko@sntech.de>
CC: Andrew Lunn <andrew@lunn.ch>
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

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on robh/for-next linus/master v6.15-rc4 next-20250502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/dt-bindings-arm-rockchip-Add-rk3399-industry-evaluation-board/20250430-155258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250430074848.539-3-kernel%40airkyi.com
patch subject: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250501 (https://download.01.org/0day-ci/archive/20250503/202505031259.5pyTQ75L-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505031259.5pyTQ75L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505031259.5pyTQ75L-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: pmic@20 (rockchip,rk809): 'pmic-reset-func' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk817.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: tcs4525@1c (tcs,tcs4525): Unevaluated properties are not allowed ('regulator-compatible', 'regulator-initial-state' were unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: tcs4526@10 (tcs,tcs4525): Unevaluated properties are not allowed ('regulator-compatible', 'regulator-initial-state' were unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: pmic: vsel1-gpio: {'rockchip,pins': [[1, 17, 0, 169]], 'phandle': 117} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: pmic: vsel2-gpio: {'rockchip,pins': [[1, 14, 0, 169]], 'phandle': 118} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
