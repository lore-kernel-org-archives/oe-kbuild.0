Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CE2212FAD
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Mar 2026 07:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772349297; cv=none; b=qGv8Ab7kkSA2dRftyRXOuu3KXvtetbyEvU8gFy6s308yhvZoHLKmdjWT4wBMg4Tqln56+e4JwIIsPAEovH9NKfUqRVHwSJvrbAE+zolUYCBw2wuNznm7oeRQ8dt+ounFTk9EkmmzCOjiRLuGRyffmIZMSPSIJh0Jfrb49hPGDhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772349297; c=relaxed/simple;
	bh=5+r3H2xU20pNhTTXqOtt/fPBuGim0m+8JxN6z/3qc4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FhZc73yFhc1xWw3RIP5hCmbHSsEy/xllok7N1wYgSOyixDmdKIvtobxoYZOxlMeOPLpAX9XuVjZskkhyxsIDcQ1ZYH09SNbl/5GsdDDy8iQzOQ3ZbCEY8LAoFhsfZxQnIBH79UhVraZ7YXVz5nJ6+HtW+KHJzD90A0VTkCpYj8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/f/BvJD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/f/BvJD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772349293; x=1803885293;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5+r3H2xU20pNhTTXqOtt/fPBuGim0m+8JxN6z/3qc4o=;
  b=T/f/BvJDvsjwGPKVfx4+PMWxZ47YHmbRpxcXzIadGuab9s//TgRlGfp9
   hZQOkfpK2c0ljSTJ/F5qyDQ71dHAXZ69xMNmC2nV1lBZtpBYrJDM8YfAT
   6kXNtJpMZBJxoSK00PnSZgPCmtQ1odOjWNejL1BbR0xAHObMnaLs+VDPd
   /vXFCELYWegup6WcoUvLpNWA2fbacDxgJKO77Jb28/Q6dd1wxePp6xy1a
   ILfKCcT95rvVuLmHLHjoZZYd2OltWPw1WzayLwwTVPcfSHhIPX6PGxRaG
   LE2kT8gJqutXkViwEdWzFPMhKDMX80xvwof6kLbSRZxpmw0ijHTJjSSdk
   w==;
X-CSE-ConnectionGUID: p5rrdA32SN2KODwl74CRCg==
X-CSE-MsgGUID: E2Yqut3OQgui2tHvj6oxRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="84469737"
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="84469737"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 23:14:53 -0800
X-CSE-ConnectionGUID: 52zJyLesRNqm1NIP39h0pA==
X-CSE-MsgGUID: gdXHIV5KTqW8bxDLYOVTBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="221815593"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 28 Feb 2026 23:14:53 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwb0r-000000000xV-2zOx;
	Sun, 01 Mar 2026 07:14:49 +0000
Date: Sun, 1 Mar 2026 08:13:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/5] ARM: dts: bcm47094-phicomm-k3: specify switch
Message-ID: <202603010845.78tsA18k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260220021353.40554-6-rosenp@gmail.com>
References: <20260220021353.40554-6-rosenp@gmail.com>
TO: Rosen Penev <rosenp@gmail.com>
TO: devicetree@vger.kernel.org
CC: Florian Fainelli <florian.fainelli@broadcom.com>
CC: Hauke Mehrtens <hauke@hauke-m.de>
CC: "Rafał Miłecki" <zajec5@gmail.com>
CC: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.0-rc1 next-20260227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/ARM-dts-bcm4709-linksys-ea9200-set-WAN-MAC/20260220-101855
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260220021353.40554-6-rosenp%40gmail.com
patch subject: [PATCH 5/5] ARM: dts: bcm47094-phicomm-k3: specify switch
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-2052-20260220 (https://download.01.org/0day-ci/archive/20260301/202603010845.78tsA18k-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603010845.78tsA18k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603010845.78tsA18k-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts:22.17-26.4: Warning (unit_address_vs_reg): /nvram@1c080000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/broadcom/bcm5301x-nand-cs0.dtsi:10.18-19.5: Warning (avoid_unnecessary_addr_size): /nand-controller@18028000/nand@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:24.28-47.4: Warning (unique_unit_address_if_enabled): /chipcommon-a-bus@18000000: duplicate unit-address (also used in node /axi@18000000)
   arch/arm/boot/dts/broadcom/bcm-ns.dtsi:323.22-328.4: Warning (unique_unit_address_if_enabled): /mdio@18003000: duplicate unit-address (also used in node /mdio-mux@18003000)
>> arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: / (phicomm,k3): nvram@1c080000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: /axi@18000000: failed to match any schema with compatible: ['brcm,bus-axi']
   arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: pcie@12000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
