Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2311FDD
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Aug 2025 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754246772; cv=none; b=Phj8rV4M5dLF+j0r/A4RcIxw3BIbOpctbUYmYMEsGM53r30r1//+4YsA9nkNKXbIghprB3bDvrar0qpTZzOxUYe+FXLguok9HuyZocwmn0bWlRVRdCgfrjmZ7oJEESPlrau6wUIiKD+hKTkC/hDPkGDpljkYZcwyA5s1ppEPyjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754246772; c=relaxed/simple;
	bh=/cSD9vlKOmTB2dG7TELUD9P/ebchAfiIDtRlURhwHd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IEiihKljRh1aQaXorxqT+AZ33HaOFbG2BHUrENZ+B964u0qKDWHsMfDmcZ8YJ3ldLPk6XPCGQlOPmyWd9XqFMMOCWHLxFmHzcwgIM1z1jotzeSAbIraGqyxDYu04y/uQxfm7TE6onzrip2WeQmaUndu3zXoxgfdWrRH/2Af1AyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBYZZ00e; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBYZZ00e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754246768; x=1785782768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/cSD9vlKOmTB2dG7TELUD9P/ebchAfiIDtRlURhwHd0=;
  b=EBYZZ00enXp2fTKHedXsXGQcsF0/3Fbz6Ca8gCEwpIkVmwIPE0jrHjqa
   dNZeZjMqlESHO4HcFZ2iwTO5R73SBcEnO0XrsOvzuCnLjUhjdMfsTfsl1
   hiJvYlvANCjl1fNVteLrMvrR2o8nuRBLAtvmcP/ekS2/a1sxhhPdA0Mpw
   XU7YMs9YcvKvS2luDMp/MPKcyxErMtfHoqyeYvZSmmjFFq4BXKZWnTy1L
   fNAHx+NuCo7qU59i7NN+VKlbkQYTt+bdZqAzy35+qu5tfyff+AXQukVmX
   +n3FXPKKAyqgRqKHBudZ+smDC/pvuZoI7CHo451R5365pHo/Q03FFx20o
   g==;
X-CSE-ConnectionGUID: b2/aY/DlR6+fcib04ZhO1A==
X-CSE-MsgGUID: 3JCiPHAYTpewTIgIYa8C8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="74101051"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="74101051"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 11:46:07 -0700
X-CSE-ConnectionGUID: i9hhbjYCTDOZ4WVEVBQKdA==
X-CSE-MsgGUID: g1tW6g8aTdijEMn+3UiMTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163524663"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Aug 2025 11:46:06 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uidie-0006aG-0b;
	Sun, 03 Aug 2025 18:46:04 +0000
Date: Mon, 4 Aug 2025 02:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mripard:drm/tidss/field-api 10/60]
 arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: dss@30200000
 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required
 property
Message-ID: <202508040207.aB0iF22O-lkp@intel.com>
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
TO: Aradhya Bhatia <a-bhatia1@ti.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/tidss/field-api
head:   8e7aa9647fd4168ea2115bb34ca99eade5b0c751
commit: 17047a3326a961f01a2e6de8a6fa0a7ac74ebbb4 [10/60] arm64: dts: ti: k3-am625: Add OLDI support
:::::: branch date: 4 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-052-20250802 (https://download.01.org/0day-ci/archive/20250804/202508040207.aB0iF22O-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040207.aB0iF22O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508040207.aB0iF22O-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
--
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
--
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
--
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
--
>> arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
