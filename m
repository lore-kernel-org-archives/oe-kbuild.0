Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38952C08D5
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 08:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769414661; cv=none; b=E8nI+2/dGRBRJWxRISvStqSGPTFuzzgfOa9k45kyYP++f4PDZvMV/0tg1HcufGNjqsDZylTfu+N9d2u22FYT0+7zxruzii1m3X+8LIY83kADncpFdw8Gg0JSdj/HeAv9KlOwrb9eKq5BBm/Vk5q/lfUQz/Nqy9r7ahyabNy2k6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769414661; c=relaxed/simple;
	bh=I7GCOX2CvcqPnZYcyuoJ8M5Q8U62u/NoMvtLA8PJcEk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EbGxaY6b0FuGsdrTbbOzLtsP1QaRsA5TVR+5QqyraQfvXFKBGXyLLZrRqIAJaA925v1I6tzhtmYk/Ds2E9EGH/J7sFfsBJElOz9YWQjoDGFVW4yis7YxZ1NRb+vpXk0QCWHWefflHOQZ8D/KvdOyrOPYH+9WiQyN7Nym8XaYxmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4w24Snh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4w24Snh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769414660; x=1800950660;
  h=date:from:to:cc:subject:message-id;
  bh=I7GCOX2CvcqPnZYcyuoJ8M5Q8U62u/NoMvtLA8PJcEk=;
  b=g4w24SnhjBd9eco7b+62udNkJctUsbC9DbCGVzerxk6waPasijYLCjyV
   /4vWCt0IYyY1ojxuvlASUN4ptonUDnaSeaVQWL6mJjCtKX4AlcpMgsu0F
   AMBkf5Jeje24OZ8IsVbiRDUFOrFT9CVit+R8GOwfSQRK2WaDiHxWCzzYV
   CFxA8ccILNY16srNXam2WpQsOziFO6rWR3dpPC9OztA+9GSgLoh9z62VV
   x04jaIgFckri76BljW5LrFbaItXhAMps8qoWQD6kApH071Q2NbizRHzwH
   WI04cODa2ujcFbSigVgNMKfD746RtKzyVSIVbOtIyVOHHc9K+M9Bh5aAX
   A==;
X-CSE-ConnectionGUID: NOSey2MSRzmNmU0WpkGSxw==
X-CSE-MsgGUID: VofT9KXxQHGXV4c8nDW6bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="80890336"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="80890336"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 00:04:19 -0800
X-CSE-ConnectionGUID: 3PYDcqgbQtaU2+rrh1Derw==
X-CSE-MsgGUID: kI5TfTXZT9esHc3p4Y/sMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="208047566"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jan 2026 00:04:18 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkHa4-000000001TV-01xW;
	Mon, 26 Jan 2026 08:04:16 +0000
Date: Mon, 26 Jan 2026 09:03:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pcarrier:v6.19-rc6-odin3 9/12]
 arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: Warning (graph_child_address):
 Failed prerequisite 'graph_endpoint'
Message-ID: <202601260928.MaoxN16I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gianni Spadoni <me@gio.blue>

tree:   https://github.com/pcarrier/linux v6.19-rc6-odin3
head:   91a28d8aa538293ebd31727779aac8f23cb73b39
commit: deae82762fe83e6dcfda215a495c15577ce57f14 [9/12] arm64: dts: qcom: Enable display on Ayn Odin 3
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2052-20260125 (https://download.01.org/0day-ci/archive/20260126/202601260928.MaoxN16I-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260928.MaoxN16I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601260928.MaoxN16I-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750-mdss.dtsi:249.26-311.5: Warning (avoid_unnecessary_addr_size): /display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8750-mdss.dtsi:405.28-407.8: Warning (graph_endpoint): /display-subsystem@ae00000/displayport-controller@af54000/ports/port@0/endpoint: graph connection to node '/display-subsystem@ae00000/display-controller@ae01000/ports/port@2/endpoint' is not bidirectional
   arch/arm64/boot/dts/qcom/sm8750-mdss.dtsi:413.29-416.8: Warning (graph_endpoint): /display-subsystem@ae00000/displayport-controller@af54000/ports/port@1/endpoint: graph connection to node '/soc@0/phy@88e8000/ports/port@2/endpoint' is not bidirectional
>> arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: Warning (graph_child_address): Failed prerequisite 'graph_endpoint'
   bias-disable: size (4) error for type flag
   bias-disable: size (4) error for type flag
   arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: / (ayn,odin3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ayn,odin3', 'qcom,sm8750'] is too short
   	'ayn,odin3' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'ayn,odin3' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'ayn,odin3' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'ayn,odin3' is not one of ['qcom,apq8074-dragonboard']
   	'ayn,odin3' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
   	'ayn,odin3' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
--
   	'qcom,qcs8550-aim300' was expected
   	'qcom,sm8650' was expected
   	'qcom,x1e001de' was expected
   	'lenovo,thinkpad-t14s' was expected
   	'qcom,x1e80100' was expected
   	'qcom,hamoa-iot-som' was expected
   	'asus,zenbook-a14-ux3407qa' was expected
   	'qcom,x1p42100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml
   arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: /: failed to match any schema with compatible: ['ayn,odin3', 'qcom,sm8750']
>> arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: pinctrl@f100000 (qcom,sm8750-tlmm): disp0-reset-n-active-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	0 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8750-tlmm.yaml
>> arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: pinctrl@f100000 (qcom,sm8750-tlmm): disp0-mipi-vdd-active-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	0 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8750-tlmm.yaml
>> arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: /display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any schema with compatible: ['chipone,icna3520']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
