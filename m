Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B528203710
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 18:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754157935; cv=none; b=YKPlKZggCFQN0nnrDSGy1uBhiRi63Wp5shH7B90aHEy2AopUjTKHx6OD5yVYZyHxSnId8YedO4lcCL/98/Y1MDZBU61jX+impGmGoW1lQxu2vK5416yz1UzI2vo4TGC1ydAWKAg2LBhqHKuK8EhyA5lYiuCxe88mZmR8vxNYGyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754157935; c=relaxed/simple;
	bh=TtK4c4WwokMuFQda8e0XTLAgOvnYGI3CbKZXVcZskIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ujKrK6LOnmFpfIi+q2AcRDKeTiJM9lU8vHC+gxGFyxd0FKWVCW2ouYXbPQVWhDpxkaybY1T1prQ6bNwe3TYdhvll+A0XkizofEKCCvRWXxxe9Z1NPsuC0uvn5j4rX3JvKFK+GXlCt1WRAnBPo/590zezvls/hmq70QDXFOtLoac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FE3JscSG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FE3JscSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754157931; x=1785693931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TtK4c4WwokMuFQda8e0XTLAgOvnYGI3CbKZXVcZskIs=;
  b=FE3JscSGaVHpj4IYGV0iWD1+y/v9AayUZdMTp1VBoZoJq2qSMR3/mewT
   T/Q3GC0eoVVEwruvXYW7WDsNKL57HzcCPZ/jjhEKRdd3jc/rfeZ6KbHAH
   zI61G3pZitXgp1el9nnB9kf4LYuJSXLZRzulC8RC1hoNPB6Tq1ooq5Tzs
   V+RXlbZFOeWd7u80v/ig4yhyrR4UJuOdozqkAx4Ev1DeZxOF63/5qQJNV
   U/3A48NWCYfu3IbZ7WpZ4JynStYqkZXYVVKhFk44QMDy627GanmuOxBTL
   vUTYbQYtF8qDokmU7737tNv0GshkxSdHc1z82f1gKVgfzU7fhHU7H89B4
   Q==;
X-CSE-ConnectionGUID: SB6ycv4yTsWVVBaOkseO1g==
X-CSE-MsgGUID: tlI/rZt8R669h6bg5PrHtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="79029663"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="79029663"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 11:05:31 -0700
X-CSE-ConnectionGUID: QEWZKA/SRAmBmVtmlY3bBg==
X-CSE-MsgGUID: GtlODy4UTki74FzLFO6FNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169124135"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Aug 2025 11:05:30 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiGbn-0005Wu-1T;
	Sat, 02 Aug 2025 18:05:27 +0000
Date: Sun, 3 Aug 2025 02:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mripard:drm/tidss/field-api 10/60]
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss):
 oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202508030228.k1ID5Eh2-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-053-20250802 (https://download.01.org/0day-ci/archive/20250803/202508030228.k1ID5Eh2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030228.k1ID5Eh2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508030228.k1ID5Eh2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
--
>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
--
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
--
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
--
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
--
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
