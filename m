Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD622F5B
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Aug 2025 02:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755830011; cv=none; b=N2bVA4009tOU08cVYOaTF2NPcMbAbgK/ZCj69IsuSoPDsHkXOKIULuzlxuCob1SR4hEAX7ZlcFSPBepi0KOOs5UtgAWQCgbZtLS1eZwikgKZ11H8zpq4W6DgFQK5Sc33eeYM9t65XmZAGFZtem9I/7Pg6RMTSWG6Lrb8iqDGSzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755830011; c=relaxed/simple;
	bh=QmIBLsi4zgxt/xHbGbhCC5icvkSssUPI3CQIuyn5oYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JJjx2sBR8WEenazTMSbBcZEfUvVMg46hoo//GxdbmphT7QIfZJfK0yxBGgybXYkBTY/TMalKUwvPH0glHYxSKGxIxPx4Wy/+xW9w8I8JXOmjveNeVQX4FR6oKT0to0u7mVkl4Tdx+eNJ6nBYuGtJhAabGZPGfN0rm+Atg1MQqyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOzucBON; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOzucBON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755830002; x=1787366002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QmIBLsi4zgxt/xHbGbhCC5icvkSssUPI3CQIuyn5oYw=;
  b=FOzucBONngtJpLbozq+/XFq4Wiho2Iif6eSm4xb9Vf6KvTBCLgEC5GKY
   /XbYk7z3xhqGrq49ZmWQr9KtIuP37siOWP46qUx0EUuHwyVg/DXdtTkGM
   WvEVNl5pRUY+Yl4n90cNp5WJ4/1xObF7HlJnMaXDtV+rtwLak//PlEk+G
   NhmQWBlk2N5iggvniXv5sj49rPkPapp+xBqv81e923qs5LA0x46JSkylq
   6fEZyR+j7GAUblR0MTAZZPFT4Qfp9YCc6a9rW03Qh0WkViQkCJjHCSmF9
   6YHN+cvjOAZKJLGiuhi9sUqFNjhmiHFukAD4TvkUCl9MOlkesnkS8TN9w
   w==;
X-CSE-ConnectionGUID: NZPwJZLAR/ydHj8FSeEJGA==
X-CSE-MsgGUID: VkOsBvlMRBuw6wqbLAgxbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61967252"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="61967252"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 19:33:20 -0700
X-CSE-ConnectionGUID: myorW9N5QpCYAR0AMmhM1w==
X-CSE-MsgGUID: 7piBw9q+RXWFG0BreC7QgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168985673"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Aug 2025 19:33:18 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upHae-000Kpr-0R;
	Fri, 22 Aug 2025 02:33:16 +0000
Date: Fri, 22 Aug 2025 10:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 net-next 02/15] dt-bindings: net: move ptp-timer
 property to ethernet-controller.yaml
Message-ID: <202508220945.AMZTpg1C-lkp@intel.com>
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
In-Reply-To: <20250819123620.916637-3-wei.fang@nxp.com>
References: <20250819123620.916637-3-wei.fang@nxp.com>
TO: Wei Fang <wei.fang@nxp.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: richardcochran@gmail.com
TO: claudiu.manoil@nxp.com
TO: vladimir.oltean@nxp.com
TO: xiaoning.wang@nxp.com
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: vadim.fedorenko@linux.dev
TO: Frank.Li@nxp.com
TO: shawnguo@kernel.org
TO: s.hauer@pengutronix.de
TO: festevam@gmail.com
CC: fushi.peng@nxp.com
CC: devicetree@vger.kernel.org
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: kernel@pengutronix.de

Hi Wei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Fang/dt-bindings-ptp-add-NETC-Timer-PTP-clock/20250819-211556
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250819123620.916637-3-wei.fang%40nxp.com
patch subject: [PATCH v4 net-next 02/15] dt-bindings: net: move ptp-timer property to ethernet-controller.yaml
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc-randconfig-052-20250820 (https://download.01.org/0day-ci/archive/20250822/202508220945.AMZTpg1C-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508220945.AMZTpg1C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508220945.AMZTpg1C-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fsl-usb2-dr-v2.4' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v2.4' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: usb@210000 (fsl-usb2-dr-v2.4): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.4', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): mdio@fc000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): mdio@fc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): mdio@fd000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): mdio@fd000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): mdio@e1000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
--
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): mdio@e5000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): mdio@e7000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: fman@400000 (fsl,fman): mdio@e7000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: mdio@fd000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
--
   	'fsl-usb2-dr-v2.4' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v2.4' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: usb@210000 (fsl-usb2-dr-v2.4): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.4', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@ea000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@ea000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@ea000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@f0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@f0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@f0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@f2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): ethernet@f2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): mdio@f1000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): mdio@f3000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: fman@400000 (fsl,fman): mdio@f3000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: mdio@fd000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible', 'xaui-phy@slot1', 'xaui-phy@slot2' were unexpected)
--
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: mdio@e5000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: mdio@e7000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: mdio@e7000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@ea000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@f0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: sata@220000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: sata@221000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('fixed-link', 'phy-mode', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('fixed-link', 'phy-mode', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): ethernet@e8000: Unevaluated properties are not allowed ('phy-handle', 'phy-mode', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): mdio@fc000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): mdio@fc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): mdio@fd000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): mdio@e1000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): mdio@e1000: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): mdio@e7000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): mdio@e9000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000 (fsl,fman): mdio@e9000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('fixed-link', 'phy-mode', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('fixed-link', 'phy-mode', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-handle', 'phy-mode', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: mdio@e1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('ptp-timer', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): mdio@fc000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): mdio@fc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): mdio@fd000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): mdio@fd000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): mdio@e1000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
--
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): mdio@e5000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): mdio@e7000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: fman@400000 (fsl,fman): mdio@e7000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('ptp-timer', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@fd000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
--
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	'fsl,sec-v5.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: sec_mon@314000 (fsl,sec-v5.0-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): mdio@fc000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): mdio@fc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): mdio@fd000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): mdio@fd000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: fman@400000 (fsl,fman): mdio@e1000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
--
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: mdio@fd000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: mdio@e1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: mdio@e1000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: mdio@e3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: mdio@e3000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: mdio@e5000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: mdio@e5000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: mdio@e7000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: mdio@e7000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1024-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1024-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t1023-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('ptp-timer', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): mdio@fc000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): mdio@fc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): mdio@fd000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): mdio@fd000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): mdio@e1000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
--
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): mdio@e5000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): mdio@e7000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: fman@400000 (fsl,fman): mdio@e7000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('ptp-timer', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: mdio@fd000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
--
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	'fsl,sec-v5.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: sec_mon@314000 (fsl,sec-v5.0-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): mdio@fc000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): mdio@fc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): mdio@fd000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): mdio@e1000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: fman@400000 (fsl,fman): mdio@e1000: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: mdio@e1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: mdio@e1000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: mdio@e3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: mdio@e3000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: mdio@e5000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: mdio@e5000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: mdio@e7000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: mdio@e7000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t1040-pcie', 'fsl,qoriq-pcie-v2.4', 'fsl,qoriq-pcie']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: i2c@118000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('fixed-link', 'phy-connection-type', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('fixed-link', 'phy-connection-type', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): mdio@fc000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): mdio@fc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): mdio@fd000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): mdio@e1000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): mdio@e1000: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): mdio@e7000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): mdio@e9000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: fman@400000 (fsl,fman): mdio@e9000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('fixed-link', 'phy-connection-type', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('fixed-link', 'phy-connection-type', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: mdio@e1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): ethernet@e8000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('fixed-link', 'phy-connection-type', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('fixed-link', 'phy-connection-type', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): mdio@fc000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): mdio@fc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): mdio@fd000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): mdio@e1000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): mdio@e1000: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): mdio@e7000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): mdio@e9000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: fman@400000 (fsl,fman): mdio@e9000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('fixed-link', 'phy-connection-type', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('fixed-link', 'phy-connection-type', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: mdio@e1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: mdio@e1000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: mdio@e3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('fixed-link', 'phy-connection-type', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('fixed-link', 'phy-connection-type', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): mdio@fc000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): mdio@fc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): mdio@fd000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): mdio@e1000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): mdio@e1000: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): mdio@e7000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): mdio@e9000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: fman@400000 (fsl,fman): mdio@e9000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('fixed-link', 'phy-connection-type', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('fixed-link', 'phy-connection-type', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: mdio@e1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: mdio@e1000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: mdio@e3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): mdio@fc000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): mdio@fc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): mdio@fd000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): mdio@e1000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): mdio@e1000: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): mdio@e7000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): mdio@e9000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: fman@400000 (fsl,fman): mdio@e9000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: mdio@e1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: i2c@118000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('fixed-link', 'phy-connection-type', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('fixed-link', 'phy-connection-type', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): mdio@fc000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): mdio@fc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): mdio@fd000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): mdio@e1000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): mdio@e1000: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): mdio@e7000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): mdio@e9000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: fman@400000 (fsl,fman): mdio@e9000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('fixed-link', 'phy-connection-type', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('fixed-link', 'phy-connection-type', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: mdio@e1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): mdio@fc000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): mdio@fc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): mdio@fd000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): mdio@e1000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): mdio@e1000: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): mdio@e7000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): mdio@e9000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: fman@400000 (fsl,fman): mdio@e9000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: mdio@fd000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: mdio@e1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: mdio@e1000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: mdio@e3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: fman@400000 (fsl,fman): ethernet@e8000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: fman@400000 (fsl,fman): mdio@e7000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: fman@400000 (fsl,fman): mdio@e9000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: fman@400000 (fsl,fman): mdio@e9000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: mdio@fc000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: mdio@fc000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: sdhc@114000 (fsl,t2080-esdhc): compatible:0: 'fsl,t2080-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: sdhc@114000 (fsl,t2080-esdhc): Unevaluated properties are not allowed ('compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t2080-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@ea000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@ea000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@ea000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@f0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@f0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@f0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@f2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): ethernet@f2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): mdio@f1000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): mdio@f3000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: fman@400000 (fsl,fman): mdio@f3000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@ea000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: sdhc@114000 (fsl,t2080-esdhc): compatible:0: 'fsl,t2080-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: sdhc@114000 (fsl,t2080-esdhc): Unevaluated properties are not allowed ('compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t2080-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@f0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@f0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@f0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@f2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@f2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@f2000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@ea000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@ea000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): ethernet@ea000: Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): mdio@fc000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): mdio@fc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): mdio@fd000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): mdio@fd000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): mdio@e1000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
--
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): mdio@f1000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): mdio@f3000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: fman@400000 (fsl,fman): mdio@f3000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@f0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@e5000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@e7000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@e7000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@ea000 (fsl,fman-memac): Unevaluated properties are not allowed ('ptp-timer' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@eb000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@eb000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@f1000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@f1000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: sdhc@114000 (fsl,t2080-esdhc): compatible:0: 'fsl,t2080-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: sdhc@114000 (fsl,t2080-esdhc): Unevaluated properties are not allowed ('compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t2080-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@ea000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@ea000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@ea000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@f0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@f0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@f0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@f2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): ethernet@f2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): mdio@f1000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): mdio@f3000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: fman@400000 (fsl,fman): mdio@f3000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@ea000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@f0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: i2c@118000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: sdhc@114000 (fsl,t4240-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@e8000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@ea000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@ea000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@ea000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@f0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@f0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@f0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@f2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): ethernet@f2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): mdio@e9000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): mdio@eb000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@400000 (fsl,fman): mdio@eb000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@ea000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@500000 (fsl,fman): mdio@e9000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@500000 (fsl,fman): mdio@eb000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: fman@500000 (fsl,fman): mdio@eb000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@ea000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: i2c@118000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: sdhc@114000 (fsl,t4240-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@e2000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@e4000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@e6000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@ea000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@ea000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): ethernet@f0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): mdio@f1000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): mdio@f3000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@400000 (fsl,fman): mdio@f3000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@500000 (fsl,fman): mdio@f1000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@500000 (fsl,fman): mdio@f3000:compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: fman@500000 (fsl,fman): mdio@f3000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle', 'ptp-timer' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
