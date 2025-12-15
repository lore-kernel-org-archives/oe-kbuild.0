Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA47923EAB3
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 14:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765809303; cv=none; b=Ry78gvNRBSQVD0YU/HKTH/tgn2R1VcAD0PIUlC2l3HPanJDeXVs0+ZKX/OdefITgM0W7pgDsvr7RU0oY/PTiPUSs/t9bz26bH4aLZJsSSi5ANGmon0B00eVxsnnChUrFtJOp0ies4hnOgfiGw6WaZOp30q4z1Fa2LfkjrCjYbqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765809303; c=relaxed/simple;
	bh=nePWFq+CPBWqcDxcekIKnPH0tQ7VYpP+SsvzF9T/h5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bGDlYnRhasyhAqWEFclABhH4ZkmRo4WCadEnXPVhc6fFqms5yWAMdoPqZVC8ucGu38Vq/+wPN72Jm8oM1s4JqUqr5LfYmep2jsYQrfKijYr7mToRHqgGXYvn/VBxkmRJrskpy0HvBLsM4kOEWowY/FLWUeWpNZY9X2+gtW8F57c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moPa+Uvg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moPa+Uvg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765809301; x=1797345301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nePWFq+CPBWqcDxcekIKnPH0tQ7VYpP+SsvzF9T/h5c=;
  b=moPa+Uvg9YJ7fDOD9JAqBwk+XMsiVWBF2uTKLRKe8Kyf6GBRIM/fgNZo
   v6L0GQd+VSNQ/qm6Mkk6MgHSVClRII4neQLN1NenURqrDPeyUGblWHsRk
   3TNHNL4u3DTbK0EeowAtm2EbXTW9fIy7I7RADCOQWt5w9tpffQC5OSpf6
   8TiykbC8yvdiS/hVZ0kAS909xBQ19w0dk/hkTSE4egAbHKAT7L6P1iKkx
   65y3gyYCccDjij2lOOWjgrWtPir866F4rD1H0g5XEErQS0afNOj8ysOqd
   XxZcLMLDGWVtCOiI2FLNoM0XKtqBGwNZFd6jQ0gld7/135obvgpC5QesQ
   g==;
X-CSE-ConnectionGUID: r3/toLiHSdijF+DkrZEuhg==
X-CSE-MsgGUID: KMJ/B/7kQo+dsamZp8dmhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66893931"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="66893931"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 06:35:00 -0800
X-CSE-ConnectionGUID: 5WbHBilsQAacV2t6OYxxzw==
X-CSE-MsgGUID: ZAqm/agASo6A6Nhf4DpOEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197000668"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 15 Dec 2025 06:34:58 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV9f6-000000002gS-1mZm;
	Mon, 15 Dec 2025 14:34:56 +0000
Date: Mon, 15 Dec 2025 15:33:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v1 1/3] dt-bindings: net: micrel: Convert to
 YAML schema
Message-ID: <202512151555.vuRD6iHK-lkp@intel.com>
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
In-Reply-To: <20251212084657.29239-2-eichest@gmail.com>
References: <20251212084657.29239-2-eichest@gmail.com>
TO: Stefan Eichenberger <eichest@gmail.com>
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: hkallweit1@gmail.com
TO: linux@armlinux.org.uk
TO: geert+renesas@glider.be
TO: ben.dooks@codethink.co.uk
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: francesco.dolcini@toradex.com
CC: rafael.beims@toradex.com
CC: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Eichenberger/dt-bindings-net-micrel-Convert-to-YAML-schema/20251212-165111
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251212084657.29239-2-eichest%40gmail.com
patch subject: [PATCH net-next v1 1/3] dt-bindings: net: micrel: Convert to YAML schema
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2052-20251214 (https://download.01.org/0day-ci/archive/20251215/202512151555.vuRD6iHK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151555.vuRD6iHK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512151555.vuRD6iHK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: ethernet-phy@3 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: ethernet-phy@3 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds (panel-lvds): panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z8dha', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds (panel-lvds): Unevaluated properties are not allowed ('backlight', 'height-mm', 'panel-timing', 'port', 'power-supply', 'width-mm' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
--
>> arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds (panel-lvds): panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z8dha', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds (panel-lvds): Unevaluated properties are not allowed ('backlight', 'height-mm', 'panel-timing', 'port', 'power-supply', 'width-mm' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
--
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1689.12-1699.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1717.12-1727.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1745.12-1755.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1773.12-1783.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds (panel-lvds): panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z8dha', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds (panel-lvds): Unevaluated properties are not allowed ('backlight', 'height-mm', 'panel-timing', 'port', 'power-supply', 'width-mm' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:84.11-93.6: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:119.11-128.6: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:169.9-178.5: Warning (graph_child_address): /soc/display@10890000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:827.12-835.7: Warning (graph_child_address): /soc/video@10830000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:837.12-846.7: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:872.12-881.7: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:827.12-835.7: Warning (graph_child_address): /soc/video@10830000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:837.12-846.7: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:872.12-881.7: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g054.dtsi:832.12-840.7: Warning (graph_child_address): /soc/video@10830000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g054.dtsi:842.12-851.7: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g054.dtsi:877.12-886.7: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
   arch/arm64/boot/dts/renesas/r9a09g047.dtsi:1123.12-1132.7: Warning (graph_child_address): /soc/video@16000000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a09g047.dtsi:1155.12-1164.7: Warning (graph_child_address): /soc/csi2@16000400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv7513.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-pmod.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc-cru-csi-ov5645.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc-cru-csi-ov5645.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc-cru-csi-ov5645.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc-cru-csi-ov5645.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc-cru-csi-ov5645.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
