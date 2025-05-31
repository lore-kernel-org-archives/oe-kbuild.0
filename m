Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B777239E9F
	for <oe-kbuild@lists.linux.dev>; Sat, 31 May 2025 12:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694794; cv=none; b=dyVxVqc8wealMHkx6SGQrjfso+GB+bWLLQEKCXN/+Xqq/7D5RGdM2mpTI/fOMJylZVR3PrgGAsNcGnl0trHUGwYApWDXPwv4qW9dhdAot4XVXs6ergyxKgOQB8D/zuCtC4/0OFvz36iBTvoPgAdJlx0uNKrXAAqwZYUexPOe24Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694794; c=relaxed/simple;
	bh=bkHgl/+eGbWfLHDT5h1aZxk2u6VpzEz6d9ahSbeDLbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YLrQaTHLDUtRXJueNJuVIj7eAdhPXUdYb4FTiwY5hrRgeKZT3VXlVVE5Vs4V7UMRb6x2b/vyz5GQVrQCDfbfqou3smo6DGqL7h+emvhajh7YWK8VFxQFrylqZUUTj3zavzBHNu3MI/+0KINUg4dWeeTSsov5Ncj3bQpiI4gBAXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+sukJ3i; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+sukJ3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748694792; x=1780230792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bkHgl/+eGbWfLHDT5h1aZxk2u6VpzEz6d9ahSbeDLbE=;
  b=A+sukJ3iM5Y4Dgre4H9kIzSluj4/sYqzn67GiazDTNe6SJE1N+rMZLgt
   6zLTgSPkQAqb0MljyhbcjWFwDI+1Ad9b3zZJKU+UZGzUsSk8L7WeI+O2v
   Qm1nZHdEWAgnoMx4Tyf2KJAVPhhL+HYeX54FgBlicBjUPUOVYqxd3TIcl
   0oBk3UblBJ+RasbTu/9PAEv9bglN1HmcCkaf3R0UTqZo8D3M+nbgHgvNX
   Y6q3SUwed96fWA0SqXlYptUbjEqVTamJvZl7WnIaoHwhm3EWvHZGl4lRE
   1QUwtI5g0TCA7FnYDNLnKn8jN06/prYzJbAPhbzzDx29EKB1ccCLQxU8o
   g==;
X-CSE-ConnectionGUID: yzz9WubrScKAj1gCP6xGiA==
X-CSE-MsgGUID: ymHj45HDTVyvllA+y94Vfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50643031"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="50643031"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 05:33:10 -0700
X-CSE-ConnectionGUID: gWRiK8ICSc+JybGevj7AYg==
X-CSE-MsgGUID: U8BRTcenRH2Gk9gkwEixVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="174993905"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 May 2025 05:33:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLLOc-000YOq-0N;
	Sat, 31 May 2025 12:33:06 +0000
Date: Sat, 31 May 2025 20:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1
 nvmem phy selection
Message-ID: <202505312059.WccFJIxX-lkp@intel.com>
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
In-Reply-To: <20250527175558.2738342-3-james.hilliard1@gmail.com>
References: <20250527175558.2738342-3-james.hilliard1@gmail.com>
TO: James Hilliard <james.hilliard1@gmail.com>
TO: netdev@vger.kernel.org
CC: linux-sunxi@lists.linux.dev
CC: James Hilliard <james.hilliard1@gmail.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: "Chen-Yu Tsai" <wens@csie.org>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Samuel Holland <samuel@sholland.org>
CC: Maxime Ripard <mripard@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Giuseppe Cavallaro <peppe.cavallaro@st.com>
CC: Jose Abreu <joabreu@synopsys.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on robh/for-next net/main net-next/main linus/master v6.15 next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Hilliard/net-stmmac-dwmac-sun8i-Allow-runtime-AC200-AC300-phy-selection/20250528-020008
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20250527175558.2738342-3-james.hilliard1%40gmail.com
patch subject: [PATCH v2 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1 nvmem phy selection
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-052-20250530 (https://download.01.org/0day-ci/archive/20250531/202505312059.WccFJIxX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505312059.WccFJIxX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505312059.WccFJIxX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@4: Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
--
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@4: Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
--
   arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@0: Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
--
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@0: Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
--
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@4: Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
--
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@4: Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
   arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
