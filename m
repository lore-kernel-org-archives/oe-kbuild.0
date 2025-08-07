Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F3F271479
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754585187; cv=none; b=pxONM7yP8XNxiOccVX/nA6VRS/9QNDuK5k/SZkBg6Lpc7RXemJsrmLy1g81HS637mEhp92FwhKzbLDEhbJcGTSRXPMoJ46uJRQPNGMNIQnEE4AHRrwdrv0YZVzcoUycJFAdOWWkAUXBdY5uW6p0SYarNDP1FChaKIw93gNC4Hgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754585187; c=relaxed/simple;
	bh=E24vp4+bOuIHt7PrS1u85MarmIHAb075E1nqCXiW2Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LDMnqoGe52r4TMpDlzeejOZCDNP4KUUeTMll1RyK8VAsgdUr1lRJW2jClI7HNpP//1i/swiMqlB/nYhZ2kX3VK2f6aQBtuPDlrz+BA5DouPpBsrhOeI4B7lAPw7ldfPvdREYiKtXxW5EfmXnv0gzzqT5kRaDtfye0knpfNjzMzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/2TZaYX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/2TZaYX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754585185; x=1786121185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E24vp4+bOuIHt7PrS1u85MarmIHAb075E1nqCXiW2Ms=;
  b=k/2TZaYXgTMpKahTpj38uuhrfnhdX9jfKqK7y9daYsFSheZvyj1Zt6ga
   LmiKeq+TW7r4Lvuoa+/LB65i2OPobYZi6CvoQm8ff89oCwPUrbF9jgUTr
   +ISl2eU2JbpheOByHvr2M2642jh1WbuK3GOjf/DGdpZ59mV4bQkvl7/L8
   BuO1yZ+6d77u81vAiYylgA0mMlmODW3Tu8UezDLaozzWCX2r+0ZCbUNwR
   XvTKEUUQ1JYiOCieg0dj/K8/ZG38Jui2vCzRw+eKJ/pDWXumJkYURBqgC
   pmxDoXElmBDgTUso4wbHYeRRGdmeUMH0srdnW1wUBvxZDKQ63oHdImQL8
   w==;
X-CSE-ConnectionGUID: mf988fh3QJ6Ad5YHhy9tdA==
X-CSE-MsgGUID: quEhg+YER66YXt56WHQnVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="82372991"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="82372991"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 09:46:23 -0700
X-CSE-ConnectionGUID: 0f9dfMdbRmab/2F+ybjTBw==
X-CSE-MsgGUID: kOa1kkHhRPiyJ/Iw1gaK/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165489286"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 07 Aug 2025 09:46:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk3ky-00030Q-0g;
	Thu, 07 Aug 2025 16:46:20 +0000
Date: Fri, 8 Aug 2025 00:45:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: rockchip,pcie3-phy: add
 optional differential phy clocks
Message-ID: <202508080012.o5DCSPmD-lkp@intel.com>
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
In-Reply-To: <20250806133824.525871-2-rick.wertenbroek@gmail.com>
References: <20250806133824.525871-2-rick.wertenbroek@gmail.com>
TO: Rick Wertenbroek <rick.wertenbroek@gmail.com>
CC: rick.wertenbroek@heig-vd.ch
CC: dlemoal@kernel.org
CC: alberto.dassatti@heig-vd.ch
CC: Rick Wertenbroek <rick.wertenbroek@gmail.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Kishon Vijay Abraham I <kishon@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>
CC: linux-phy@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Rick,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on rockchip/for-next linus/master v6.16 next-20250807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rick-Wertenbroek/dt-bindings-phy-rockchip-pcie3-phy-add-optional-differential-phy-clocks/20250806-214044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250806133824.525871-2-rick.wertenbroek%40gmail.com
patch subject: [PATCH v2 1/3] dt-bindings: phy: rockchip,pcie3-phy: add optional differential phy clocks
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080012.o5DCSPmD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080012.o5DCSPmD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080012.o5DCSPmD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts:1393.7-1401.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts:626.7-634.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1110.7-1117.4: Warning (avoid_unnecessary_addr_size): /usb@fc000000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1125.7-1132.4: Warning (avoid_unnecessary_addr_size): /usb@fc400000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1110.7-1117.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1125.7-1132.4: Warning (graph_child_address): /usb@fc400000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts:1186.7-1194.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: pcie-ep@fe150000 (rockchip,rk3588-pcie-ep): Unevaluated properties are not allowed ('vpcie3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: phy@fee80000 (rockchip,rk3588-pcie3-phy): clock-names: ['pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
