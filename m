Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28133BBF0
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Dec 2025 13:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766929496; cv=none; b=aZrPrhIiMmu+2oq6OcfM7BVHSxeH2vPalKp7lrV1ez/tVYr2PfjOEkCBfOTT9JULsRjDPf24xAIhvXHpO/K6SDJz/R6VcFeNlwekvThngIso8W6dR+JU7LKWJE042lyCQUEPP8z0jqU5mG5Mp6XHN3cLIhKGWKJG1IWBYzOgCAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766929496; c=relaxed/simple;
	bh=KBOu9hciahA43xb8CvaBGUErJGVFkWVMtJyOg0eDnT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TmO1LvQVvu6TQy5yQjoaMHeHz8fYAeEvtw3NzCfptxiIl05VvVTEYx3s0yGym2hi/f29WH/eCJETh61v3jOdkWBJmucUNwWT2NL+9uGoXDe2PpcMWg7+2OBYYfp7VAeA+wgJSMbtBx+ByJr8BW99TAsNv4ao1U7sPDBK7ZtmxSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcnKLxcb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcnKLxcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766929495; x=1798465495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KBOu9hciahA43xb8CvaBGUErJGVFkWVMtJyOg0eDnT4=;
  b=kcnKLxcbPL6YNlwgRM9GY3iemrV1ILxITX8mFLaswgsHiFNhfvTtDgit
   al/z7j9/0w1QUO8CmOXhLThkkEys4C6SS24NhlBc9Fr7yvVrfJRLApFPo
   RER3a453iOKAUC4wCKLr3pqrfGVJm8WVl7m2lb3ib9hpk67g4QrrLnLi9
   dsP+x9VECe6gJwDTqtbUPdZ2+uTS+BUPrxscFsSnQVVywWRfHjDa6del1
   IXCO/lM4vUYYg/0xrUnLxtY7Atr+v5C6h4CAyuYf6eA5hJ0sH1fhiDjcw
   8uxxIuljNYiibD+dgllykXK9Ux2/QnZu8NDIUEVHSDCtixQlh7DlM35op
   Q==;
X-CSE-ConnectionGUID: qLiB8X11Rk+zyZunuCog9w==
X-CSE-MsgGUID: 8YAgUH1sQZy+j3AvXFm7dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="79693996"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="79693996"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 05:44:54 -0800
X-CSE-ConnectionGUID: quFIsK1eTj6pUSmyZqBIBg==
X-CSE-MsgGUID: CPYSgHP8S0iJQwkc2KaDaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="200736666"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 28 Dec 2025 05:44:54 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZr4k-000000007VA-3Ter;
	Sun, 28 Dec 2025 13:44:50 +0000
Date: Sun, 28 Dec 2025 14:44:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.20-armsoc/dts64 10/17]
 arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: ethernet@2a220000
 (rockchip,rk3576-gmac): Unevaluated properties are not allowed
 ('dma-coherent' was unexpected)
Message-ID: <202512281455.DriEmA6E-lkp@intel.com>
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
TO: Shawn Lin <shawn.lin@rock-chips.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.20-armsoc/dts64
head:   51babf83f424a695179183204226d453c8af7dc7
commit: 2d6fcdcaf42671dd3fb281d7a2e5ea985af11ce5 [10/17] arm64: dts: rockchip: add dma-coherent for pcie and gmac of RK3576
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2052-20251227 (https://download.01.org/0day-ci/archive/20251228/202512281455.DriEmA6E-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project c9eb572b141746426560c650fadf9ab75cca9867)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512281455.DriEmA6E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512281455.DriEmA6E-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/i2c@2ac90000/eeprom@50: failed to match any schema with compatible: ['belling,bl24c16f', 'atmel,24c16']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: eeprom@50 (belling,bl24c16f): compatible: 'oneOf' conditional failed, one must be fixed:
   	arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: eeprom@50 (belling,bl24c16f): compatible: 'oneOf' conditional failed, one must be fixed:
   		'belling,bl24c16f' does not match 'c00$'
   		'belling,bl24c16f' does not match 'c01$'
   		'belling,bl24c16f' does not match 'cs01$'
   		'belling,bl24c16f' does not match 'c02$'
   		'belling,bl24c16f' does not match 'cs02$'
   		'belling,bl24c16f' does not match 'mac402$'
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
