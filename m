Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E4F17BA6
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Aug 2025 22:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754258661; cv=none; b=ZehRTlUMcwh7KvjKJJ378F9LcW4jU4oaRuiBNwgqdKt+h8baEOx4l9fuX01zlcZc7gHtWWtwdPbekOqM2OXeT7HcSL4FVpV9Tsfy5uWmuo8a9YJqbubI8py7hGSzD8inbyFMtFBDZuQAVBc9Kw9YPFvrM1RT6StcPjCe+QZgGMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754258661; c=relaxed/simple;
	bh=+mAn/D86DBtBL1ruzzCblY8A9NQMdUcvmFUaRZOgcd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cJ76UUyGPpDEaFyvPlOZWonNvY3BCZePkyV4TcjhBuLPUOFJFz/4wk/EmZI9T2CRUG44UJajnH0so3lpkGKea+i4IblnwIybqUNmxNtrIA3qlhV4CjMJogwcvKtJ8DBwF5uVhdT7kHhqnqHFhltdLHCMERSlUodJMgKgn88Z58A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCpqEvkV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCpqEvkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754258659; x=1785794659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+mAn/D86DBtBL1ruzzCblY8A9NQMdUcvmFUaRZOgcd8=;
  b=jCpqEvkVwu9mAKY00XrbemIF0qVAiV4ZHQ6MkzFMHsDxCEnJfO0BMAT3
   ZC4VJxPzd4JmS03iE8Ovev1t0HdbT4ErAknJ7dbaBDtBtPE9kSgzrvXVu
   RKjJD1gqJJKjy7CiR5EkmzlfoU6H1h4qSrWs7ZqQQ+8om4HX/wbzYKumZ
   7ja1b6lx2pQ3bOEm2qdsAsuJwKPJZhBY9KAtUXzN3+rYCS/s8CSE8n1Kx
   gO3PtiNF+CipWgx24hnGRDz/QpqHoL5GQaAq5j+g174Ix97njC44PnnES
   Tl+wYUzv9gkOkFFpt3qNsWvAigmn0W2sJ4ox50IVwxGbEPmU99oDKi1sb
   Q==;
X-CSE-ConnectionGUID: xcTHO1VdSKO4gEwzQ/veHg==
X-CSE-MsgGUID: j++BAUQTRjScKmTlwqKW5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56220728"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56220728"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 15:04:17 -0700
X-CSE-ConnectionGUID: K4W4kNxkSIOMAijRaTVdQw==
X-CSE-MsgGUID: iS8ud6Y+S52PBiZrWCvXjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="187696626"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 03 Aug 2025 15:04:16 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uigoQ-0001g7-0S;
	Sun, 03 Aug 2025 22:04:14 +0000
Date: Mon, 4 Aug 2025 00:03:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mripard:drm/tidss/field-api 10/60]
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss):
 oldi-transmitters:oldi@0:ports: 'port@0' is a required property
Message-ID: <202508040039.CGPwUSC4-lkp@intel.com>
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
:::::: branch date: 5 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2052-20250802 (https://download.01.org/0day-ci/archive/20250804/202508040039.CGPwUSC4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040039.CGPwUSC4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508040039.CGPwUSC4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
