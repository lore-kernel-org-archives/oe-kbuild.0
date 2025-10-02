Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9203413B5AE
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Oct 2025 15:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759418061; cv=none; b=YsS3O+pSDJ/5V8eUz5DXKUtuWhHYyW+j6o2McrxOakvMMVLfyr9cXEUrpBlk91Vb4vhtBUA1Fl9liT95Mru4D7HgKxf1CATJCj4cegHPbq7epVcI5UTCTBINIIG+wTlCNPcjq742PCY5TSEbGsPgWWoyWTo/3Ul9VQfYOWKCG/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759418061; c=relaxed/simple;
	bh=J7NcYSFZeJZc8ktp/oyXxp47mJZxw/vrd+lJ41a1x1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oDZ9Vq8joheZbGqnBVphaSdd6Qn1XdAa95Up6QR1tQUtnjl3CNEI/9wrNj2mx3fpBxJxuyaYM7HEVnuVP8D/WyJNJw4beJIEd3k97Khk+YaIAd0yRqh/HIbxBUz5i/ppYTfUw8Y2zZwzAXFEOt4yvsxDVqD5pSMiU+vCNYkV5nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzD8FC1O; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzD8FC1O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759418060; x=1790954060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J7NcYSFZeJZc8ktp/oyXxp47mJZxw/vrd+lJ41a1x1s=;
  b=MzD8FC1OEyuM4xw3mHELUbVAkFslYuvFkuxd0XHEcRYTG0l2oMXnt1YH
   2EDsCU38rbhIAiUErhQBuuge1uj3y/MLCHYgmMV0Hn1HgAUSXmyE4+mZz
   I5wzjTWro1eBwgo+3TjbrGI1X7KqElrPHBYpDfnOy5BEyNv/fHj6yjLLI
   IyHcj4wmH4zFbsl+Awjud7F6osqkzfoMgWUKkb7ozmHy3x6a7ifgCZV+M
   qy/+ONN12192plrAMcmJ4mTzg/RwP89Sa1gSOsmcxN/euzSjk6W8V8eJT
   njalqOwGY0fkhmFDhj0qbErPldPWvXJiPSdxs1t4VV6gcQ3ajg5kigu8u
   g==;
X-CSE-ConnectionGUID: UcjJiVcKR6+UrHlq5ZY0hg==
X-CSE-MsgGUID: 6edqiCr/R4uUb003gCCqmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="84321297"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="84321297"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 08:14:19 -0700
X-CSE-ConnectionGUID: DjOBAUFKS6ur5Qx0Z1W3uQ==
X-CSE-MsgGUID: opkkGaR2QTqxaACmaum5jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="184254576"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Oct 2025 08:14:17 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4L0Z-0003tD-1B;
	Thu, 02 Oct 2025 15:14:15 +0000
Date: Thu, 2 Oct 2025 23:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] dt-bindings: net: Convert Marvell 8897/8997 bindings
 to DT schema
Message-ID: <202510022212.93KX01ET-lkp@intel.com>
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
In-Reply-To: <20251001183320.83221-1-ariel.dalessandro@collabora.com>
References: <20251001183320.83221-1-ariel.dalessandro@collabora.com>
TO: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
TO: andrew+netdev@lunn.ch
TO: angelogioacchino.delregno@collabora.com
TO: ariel.dalessandro@collabora.com
TO: conor+dt@kernel.org
TO: davem@davemloft.net
TO: edumazet@google.com
TO: krzk+dt@kernel.org
TO: kuba@kernel.org
TO: luiz.dentz@gmail.com
TO: pabeni@redhat.com
TO: robh@kernel.org
CC: devicetree@vger.kernel.org
CC: kernel@collabora.com
CC: linux-bluetooth@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org

Hi Ariel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17 next-20250929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ariel-D-Alessandro/dt-bindings-net-Convert-Marvell-8897-8997-bindings-to-DT-schema/20251002-023641
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251001183320.83221-1-ariel.dalessandro%40collabora.com
patch subject: [PATCH v3] dt-bindings: net: Convert Marvell 8897/8997 bindings to DT schema
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-051-20251002 (https://download.01.org/0day-ci/archive/20251002/202510022212.93KX01ET-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251002/202510022212.93KX01ET-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510022212.93KX01ET-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'aud_i2s2', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: thermal@1100b000 (mediatek,mt8173-thermal): Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: syscon@14000000 (mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/rdma@14002000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/rsz@14003000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/rsz@14004000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/rsz@14005000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/wdma@14006000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-wdma']
--
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'aud_i2s2', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: thermal@1100b000 (mediatek,mt8173-thermal): Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11010000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: syscon@14000000 (mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/rdma@14002000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/rsz@14003000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/rsz@14004000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/rsz@14005000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/wdma@14006000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-wdma']
--
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'aud_i2s2', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: thermal@1100b000 (mediatek,mt8173-thermal): Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11010000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: syscon@14000000 (mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/rdma@14002000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/rsz@14003000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/rsz@14004000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/rsz@14005000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/wdma@14006000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-wdma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
