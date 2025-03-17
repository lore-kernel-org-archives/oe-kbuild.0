Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E97B19E968
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Mar 2025 16:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742229302; cv=none; b=qfNEnVd3JEW0lVUNqZDR3Fr/Q78xuh3T6P4ZoNVwCht9+ak2HNuw/VY4JVwDF9gmlbhgHOe8xcOI36O2snh7IFgGgGz8vFgzs8tlmaxsNbQ9e8d0JZpI0C+TKtTNhMkDgyoE/MF/VsOa+3CGYTbFqwWXSa5j7clY1zf3cgYfqa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742229302; c=relaxed/simple;
	bh=+FTh10oPRPu6XK8Sx3bpT25PJwc3HX4am9Eq5DyxhLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bRnyyZZfTwZb+QqA3+bAVO3nX7jYcChzzQym9Nk9x16ExArzNC3cZtqGkGmkn66NEkFujrvenrbguyyZPyWYyrBu9cpszvjJLykAOx/0d41/xDrxHuVuAGk2RRyCwGhdV8omjP58A36AXdGQJP1vv3ZoyJp4U2Z97VfYPLKbpKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edW5La0s; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edW5La0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742229301; x=1773765301;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+FTh10oPRPu6XK8Sx3bpT25PJwc3HX4am9Eq5DyxhLw=;
  b=edW5La0s51Rl0kHOZSHyaXWVgbanQywN78xagJzBruIogFTVD1Ci+OdR
   B56NIQIN3PvlfnRX/Z0+dQ4TYuuzi1g8YaDMs2v5nahnddN+rLZjrWHrJ
   63KRUBzhLlFVOno5+vGvYDa8icUsehkiVyGcbyyxHw9aOy/ixCI6MZ3MR
   EavXYZh7SJsXGbM9BYZFqP/lBrjXVCPboMmOon3C2DtQ5LyGjkDCyden4
   ezM4TlMuRSxCBnMT08GYWzMFkfjnuF169ZadPxnYHNrwNoHx0XS7vP0Xl
   MWpmKgMh+LGpACalMrdJ0Y1F+WZBRr7uP9E6/sXG2ApJHXiep/6tIPknJ
   A==;
X-CSE-ConnectionGUID: CdmLQmYZRSyGM5oZpNHDaQ==
X-CSE-MsgGUID: JHFEJrkxQTiwpqCz+9N16g==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43215902"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="43215902"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 09:34:56 -0700
X-CSE-ConnectionGUID: Ai3CB92hT8OE6g6steqWdA==
X-CSE-MsgGUID: 57p2UV4qT+6zlaXAvEj2zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="121977307"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 17 Mar 2025 09:34:55 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuDQS-000Cvt-19;
	Mon, 17 Mar 2025 16:34:52 +0000
Date: Tue, 18 Mar 2025 00:34:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board
 device-tree
Message-ID: <202503172325.DvN3eCYo-lkp@intel.com>
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
In-Reply-To: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com>
References: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com>
TO: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Magnus Damm <magnus.damm@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "Miquèl Raynal" <miquel.raynal@bootlin.com>
CC: linux-renesas-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "Clément Léger" <clement.leger@bootlin.com>
CC: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9c5968db9e625019a0ee5226c7eebef5519d366a]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Bonnefille/ARM-dts-r9a06g032-add-r9a06g032-rzn1d400-eb-board-device-tree/20250315-025809
base:   9c5968db9e625019a0ee5226c7eebef5519d366a
patch link:    https://lore.kernel.org/r/20250314-rzn1d400-eb-v3-1-45c4fd3f6e01%40bootlin.com
patch subject: [PATCH v3] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board device-tree
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-051-20250315 (https://download.01.org/0day-ci/archive/20250317/202503172325.DvN3eCYo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503172325.DvN3eCYo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503172325.DvN3eCYo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:393.27-442.5: Warning (avoid_unnecessary_addr_size): /soc/switch@44050000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: cpus: cpu@1:enable-method:0: 'spin-table' was expected
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@40060000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a06g032-uart', 'renesas,rzn1-uart', 'snps,dw-apb-uart'] is too long
   	'renesas,r9a06g032-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart', 'rockchip,px30-uart', 'rockchip,rk1808-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3128-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rk3528-uart', 'rockchip,rk3568-uart', 'rockchip,rk3576-uart', 'rockchip,rk3588-uart', 'rockchip,rv1108-uart', 'rockchip,rv1126-uart', 'sophgo,sg2044-uart', 'starfive,jh7100-hsuart', 'starfive,jh7100-uart', 'starfive,jh7110-uart']
   	'snps,dw-apb-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@40060000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@40061000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a06g032-uart', 'renesas,rzn1-uart', 'snps,dw-apb-uart'] is too long
   	'renesas,r9a06g032-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart', 'rockchip,px30-uart', 'rockchip,rk1808-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3128-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rk3528-uart', 'rockchip,rk3568-uart', 'rockchip,rk3576-uart', 'rockchip,rk3588-uart', 'rockchip,rv1108-uart', 'rockchip,rv1126-uart', 'sophgo,sg2044-uart', 'starfive,jh7100-hsuart', 'starfive,jh7100-uart', 'starfive,jh7110-uart']
   	'snps,dw-apb-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@40062000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a06g032-uart', 'renesas,rzn1-uart', 'snps,dw-apb-uart'] is too long
   	'renesas,r9a06g032-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart', 'rockchip,px30-uart', 'rockchip,rk1808-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3128-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rk3528-uart', 'rockchip,rk3568-uart', 'rockchip,rk3576-uart', 'rockchip,rk3588-uart', 'rockchip,rv1108-uart', 'rockchip,rv1126-uart', 'sophgo,sg2044-uart', 'starfive,jh7100-hsuart', 'starfive,jh7100-uart', 'starfive,jh7110-uart']
   	'snps,dw-apb-uart' was expected
--
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50002000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50003000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50003000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50004000: dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50004000: dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: switch@44050000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
