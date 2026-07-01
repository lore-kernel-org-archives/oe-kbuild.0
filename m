Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CD021257F
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Jul 2026 02:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782873506; cv=none; b=nb86XbLmwU8VQNToJMakbyyJFSTWip3PKU7Us6+V/CVaYuRPOJxsKKnpbxYMgZfvGfQVWViJuAgLmPT9oDz6vCreSD4jw4v0FVpp37eKjBPAGgSyId4QJmVHb/QFwBNBU8fxgo0HVCw6JlOZ/TPVXGoGLyCI6kv91M+IR46WOJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782873506; c=relaxed/simple;
	bh=8YHJJCC1zGIpiMb+kAO/+4D5OdE+US20nKQ4s4PHaIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AAAMpztpJZwhfD4G8Dc3iXenQzgS100lG9a5fKo87hUU+cAy3RkvAZ87yTik0IWT/6r6AI5g/gBEWKSP2AkCWKdcRcurKb6vakl60+aKq1xpoxGOZ4oIr2c95Ecvmev3J/4andJiSqBIqU+MEi8tTm6mK5z1yj9h4u/RULRuo8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+aURsUh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+aURsUh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782873505; x=1814409505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8YHJJCC1zGIpiMb+kAO/+4D5OdE+US20nKQ4s4PHaIk=;
  b=E+aURsUh7m5RXF1nFzHc8snMPXxgQGZJqpkuaFvUGQ6hb1tJ53YLtcwP
   B4gfICArxCSPKyZ2x3Oaf9XGDGl42VxPXAN+7rprmOtG8vU6VgLGz1UBp
   gNTyOU27MznyFeCjfsgGuE1KVFGPTAVLCTMQzQAYs1gALeFcTm7GdpZLM
   XsSEjUcCzwfHQMPSt4lwwrcUr8VtGq3c+9RT4HkLoHyS9iZLTlNbQJMNu
   8a7vjnx9lJrkte1f7c9x3gg6uwIoAQvlff5uUpb1dN81lVrsBEqKIlD8n
   UUKYy/yA1OhB7Q5F5DvkckznMlpipH9RJki03wW5dQ2THYSbgmfoVHz6J
   A==;
X-CSE-ConnectionGUID: baRDoHNmQVKREqcPPoXyMw==
X-CSE-MsgGUID: B7JzM9kjQ/6LN2HvuEVVlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="109142941"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="109142941"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 19:38:24 -0700
X-CSE-ConnectionGUID: bY3q2+lbT9Kt1RtqVFWdxA==
X-CSE-MsgGUID: ariJwo26Tq2qIxpcGtZXxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="276735206"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jun 2026 19:38:23 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wekqD-000000000e1-34GY;
	Wed, 01 Jul 2026 02:38:21 +0000
Date: Wed, 1 Jul 2026 04:38:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 net-next 2/2] dt-bindings: phy: cadence-torrent:
 Update property values to support 3 clocks
Message-ID: <202607010413.ARNFa3Bx-lkp@intel.com>
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
In-Reply-To: <20260630134324.61085-3-g-praveen@ti.com>
References: <20260630134324.61085-3-g-praveen@ti.com>
TO: Gokul Praveen <g-praveen@ti.com>
TO: conor+dt@kernel.org
TO: devicetree@vger.kernel.org
TO: krzk+dt@kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
TO: linux-phy@lists.infradead.org
TO: neil.armstrong@linaro.org
TO: nm@ti.com
TO: robh@kernel.org
TO: sjakhade@cadence.com
TO: kristo@kernel.org
TO: vigneshr@ti.com
TO: vkoul@kernel.org
TO: yamonkar@cadence.com

Hi Gokul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Gokul-Praveen/arm64-dts-ti-Add-PLL1-refclk-to-J784S4-SoC-SERDES-node/20260630-214733
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260630134324.61085-3-g-praveen%40ti.com
patch subject: [PATCH v3 net-next 2/2] dt-bindings: phy: cadence-torrent: Update property values to support 3 clocks
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm64-randconfig-2051-20260630 (https://download.01.org/0day-ci/archive/20260701/202607010413.ARNFa3Bx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010413.ARNFa3Bx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607010413.ARNFa3Bx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: serdes@5020000 (ti,j721e-serdes-10g): clock-names: ['refclk', 'pll1_refclk', 'phy_en_refclk'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
   arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: serdes@5020000 (ti,j721e-serdes-10g): clocks: [[147, 0], [147, 1], [147, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
--
>> arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: serdes@5020000 (ti,j721e-serdes-10g): clock-names: ['refclk', 'pll1_refclk', 'phy_en_refclk'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
   arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: serdes@5020000 (ti,j721e-serdes-10g): clocks: [[152, 0], [152, 1], [152, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
--
>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: serdes@5020000 (ti,j721e-serdes-10g): clock-names: ['refclk', 'pll1_refclk', 'phy_en_refclk'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
   arch/arm64/boot/dts/ti/k3-am69-sk.dtb: serdes@5020000 (ti,j721e-serdes-10g): clocks: [[115, 0], [115, 1], [115, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: serdes@5020000 (ti,j721e-serdes-10g): clock-names: ['refclk', 'pll1_refclk', 'phy_en_refclk'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: serdes@5020000 (ti,j721e-serdes-10g): clocks: [[132, 0], [132, 1], [132, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: serdes@5020000 (ti,j721e-serdes-10g): clock-names: ['refclk', 'pll1_refclk', 'phy_en_refclk'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
   arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: serdes@5020000 (ti,j721e-serdes-10g): clocks: [[132, 0], [132, 1], [132, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: serdes@5020000 (ti,j721e-serdes-10g): clock-names: ['refclk', 'pll1_refclk', 'phy_en_refclk'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
   arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: serdes@5020000 (ti,j721e-serdes-10g): clocks: [[132, 0], [132, 1], [132, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: serdes@5020000 (ti,j721e-serdes-10g): clock-names: ['refclk', 'pll1_refclk', 'phy_en_refclk'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
   arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: serdes@5020000 (ti,j721e-serdes-10g): clocks: [[132, 0], [132, 1], [132, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: serdes@5020000 (ti,j721e-serdes-10g): clock-names: ['refclk', 'pll1_refclk', 'phy_en_refclk'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
   arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: serdes@5020000 (ti,j721e-serdes-10g): clocks: [[132, 0], [132, 1], [132, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
--
>> arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: serdes@5020000 (ti,j721e-serdes-10g): clock-names: ['refclk', 'pll1_refclk', 'phy_en_refclk'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
   arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: serdes@5020000 (ti,j721e-serdes-10g): clocks: [[115, 0], [115, 1], [115, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
--
>> arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: serdes@5020000 (ti,j721e-serdes-10g): clock-names: ['refclk', 'pll1_refclk', 'phy_en_refclk'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml
   arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: serdes@5020000 (ti,j721e-serdes-10g): clocks: [[115, 0], [115, 1], [115, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/phy-cadence-torrent.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
