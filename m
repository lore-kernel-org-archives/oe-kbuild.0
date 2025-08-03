Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999BB846F
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Aug 2025 22:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754261002; cv=none; b=PebD0e2HgHztiiyxTV63ltAK6QEnKuDKVWIbf2kA7LMUbEo1nmk+wRL9T3sS0uZxiRIvKZWWEGSx+W+KXesjZf/hU3DQXCvA6mnC+RYH+BiffxJHheYWvQhPmp2M4gtBR5q1Hi9n+xrxAfvloxw+zynVnsziXYuKMJc99UkXHBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754261002; c=relaxed/simple;
	bh=O30AIDccUkZDDA0zUmyqb3X11S+yO+Mh5Xp3QVpkzYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uXaWgJ7SqFc6O0LJhOMFHvb4rypJnuyLn0hr9JS8YRdsl2E0i4T3pQWzYhSB5pUAOYrUM9Z10f+1jDQN8Z+M73yf+fuhVKYuTqhMGhNGhy3Ro1fixg3sIxuAT20Mx0oieDL6e82w3K/kwkTaQiFpje2OY9ocvEo6ixuI8OvE9jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkVGvaEs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkVGvaEs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754261001; x=1785797001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O30AIDccUkZDDA0zUmyqb3X11S+yO+Mh5Xp3QVpkzYU=;
  b=bkVGvaEsYVkERxEYpfJLLVgal0Fiyx2KNjrv5CGOtXKDzDLQPW/HRzJv
   7fVn7yRAoRb7MWx42tahxnLr8W9d4BD4EyPuw/nPD663M1sg/klutjPBG
   TBa5EBLoaaHlmIXzWv4bU0qK8VOhSOZfSFXLhCn/KAI45JK0bCL6nVdQJ
   EFrPLgW4UmQbQ7mjXcS+KX4le1OZ47QWZabfxhY+kjIdW0+hhcb6RPjdX
   WL3Ysdpr9pXQat8ZmhUOftfOzgTstpqEv2PTxg931WMBJNEGHoPEq09eE
   q62Dgg4q7Whk25qCUiq5V0YqZoQb5SuwUwVr2iknx7cAjk8KYUhsYFRCM
   A==;
X-CSE-ConnectionGUID: Ei+0DLxaQrepAz4+vdRO4A==
X-CSE-MsgGUID: wVnpZwIcSKuEJvLefeudKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="67969177"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67969177"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 15:43:20 -0700
X-CSE-ConnectionGUID: EUvQZD+rRdu9vnUWUJPIVw==
X-CSE-MsgGUID: /aRfYOzwSEC3ZwBkPc8FQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169313795"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 03 Aug 2025 15:43:19 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uihQC-0001gl-20;
	Sun, 03 Aug 2025 22:43:16 +0000
Date: Mon, 4 Aug 2025 00:43:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mripard:drm/tidss/field-api 10/60]
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss):
 oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202508040046.shKRZqtG-lkp@intel.com>
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
config: arm64-randconfig-2051-20250802 (https://download.01.org/0day-ci/archive/20250804/202508040046.shKRZqtG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040046.shKRZqtG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508040046.shKRZqtG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
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
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
--
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
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
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
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
   arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@0:ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'oneOf' conditional failed, one must be fixed:
   	'port' is a required property
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: dss@30200000 (ti,am625-dss): oldi-transmitters:oldi@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
