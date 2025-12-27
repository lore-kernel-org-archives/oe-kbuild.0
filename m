Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207012E63C
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 01:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766797776; cv=none; b=MUsiSsdIpHVwGOvaDZi6O+uzti08QcnD3BUB6XD1o8xhrphKNfBBeV+iLmGThfjMZvA35fODVwOx8fnqsZOedfeEhJeSJHdeMBArGZEyyx+mKqN/KvzY1PSeLdYVrDpshfBHlskLWnta5d1yZvyWwX89cb03vr3sqge6ymbGRak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766797776; c=relaxed/simple;
	bh=aax5Ay3Cu1clnbLemqP/M9exHADpVjs9IxIWNWCcWjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FBniTQ0JkSPpPa1PJT9O0BbwG+gI4PdcfxqkT9dMMTQIPhUwdMC6eooDVHsNsBMVNNiUH39/vgbQGwhehhXzGIfQIrtRfUt8uYRQnuwFrlZ6XxIhhlF+xCZrQk+zOAoFOGRSFa47Sg+0l8OJ5BZsAO08G0coDca6mWcFnMQP034=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=enJ4fIoa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="enJ4fIoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766797773; x=1798333773;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aax5Ay3Cu1clnbLemqP/M9exHADpVjs9IxIWNWCcWjo=;
  b=enJ4fIoa4fvgEMlf6kD3y4VJLERee+vnAyy4UE6wTsU0zy6h9utnxiEl
   Wyko/zKarB82fA4Xx2AtjZLY7kXiTeH7vZbXStiRfuh4vpfCC5aqA/f+I
   TEJoGfXFRYsRfXx04xdh1ExhTAl+HNV+hzk305S3Mrsx3ziE0V3K++RAe
   C2nzO25XiQMdTk7ir1hCsgpQVSAP8zOipk47XjxqrV4hT0UmLvHF2O30o
   WSPoQYIdQ3nQJ+V+mvUL9Qgb+zr3NduKRyDk+zWPWRKsCTFTtxBZYJ5jU
   0ZPfVK7w7uhHzz8gB9x84bBaeeexPnz0uWqhS6lBVg9AYT/yoOsokO1Ex
   w==;
X-CSE-ConnectionGUID: VnW7xwLYR46iDG35tWVqOA==
X-CSE-MsgGUID: U+Crz4fkTVeywLhnpDke5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68602860"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68602860"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 17:09:33 -0800
X-CSE-ConnectionGUID: L27uRxPzSCqbQpyPAuySsQ==
X-CSE-MsgGUID: mNvK4+i9SkmRXlwhja5RJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200490666"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Dec 2025 17:09:31 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZIoC-0000000072G-3zOS;
	Sat, 27 Dec 2025 01:09:28 +0000
Date: Sat, 27 Dec 2025 02:09:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 03/14] dt-bindings: reset: renesas,rzv2h-usb2phy: Add
 '#mux-state-cells' property
Message-ID: <202512270224.p4rgf2cK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <d37670a6c5ace61ce9e9cbf79100960de44e7551.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
References: <d37670a6c5ace61ce9e9cbf79100960de44e7551.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
TO: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
TO: tomm.merciai@gmail.com
CC: linux-renesas-soc@vger.kernel.org
CC: biju.das.jz@bp.renesas.com
CC: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
CC: Peter Rosin <peda@axentia.se>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: "Uwe Kleine-König" <ukleinek@kernel.org>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Georgi Djakov <djakov@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-phy@lists.infradead.org

Hi Tommaso,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on geert-renesas-devel/next linus/master v6.19-rc2 next-20251219]
[cannot apply to pza/reset/next pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tommaso-Merciai/dt-bindings-mux-Remove-nodename-pattern-constraints/20251222-215453
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/d37670a6c5ace61ce9e9cbf79100960de44e7551.1766405010.git.tommaso.merciai.xr%40bp.renesas.com
patch subject: [PATCH v6 03/14] dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' property
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2052-20251224 (https://download.01.org/0day-ci/archive/20251227/202512270224.p4rgf2cK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512270224.p4rgf2cK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512270224.p4rgf2cK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
--
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
--
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
