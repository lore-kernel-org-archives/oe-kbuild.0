Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3080F18A93F
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 00:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775869098; cv=none; b=GbXVnIFQb1LNTEHNDdHxxj43C4KxCejaREtXfOquU8TN6wXDFbE1VntEP0vUxIIrUqswusJpBxjJTDIajs5HVD7IeHm5F0RoTaHiGaI7helkLJH84CPby2GhMl3uBTqQE0S+jORD44k0jFZJ0r9a2yW6FDGAeKU7NLM88pR9+5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775869098; c=relaxed/simple;
	bh=2/2spnBywvaEz8xeE/r1HASp8yJYsxCWdh/hWwRFVNg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rSqleLLVE18jxdJYbdJA2lxwlJajYoATojJAe8l3dnHEPCvZUYtaRI5tVOmFbHPOeoZgPibNZDX5He8qxezPsr6rrJOSOgMgZIgZS55O6jRA3bMljkHIVhFBBiZjFEgHwo/iK3Q189lXa8xPUrDyHtZnK/KfuGKRmT2GBO+zKp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EHjiJXGD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHjiJXGD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775869096; x=1807405096;
  h=date:from:to:cc:subject:message-id;
  bh=2/2spnBywvaEz8xeE/r1HASp8yJYsxCWdh/hWwRFVNg=;
  b=EHjiJXGDNnMiTTqKPwdpCEksyIEMiqPqpudIBhRBab+HkbU0jwJPD1n/
   9yoT5YIDsYt+Xzs/1IPQpb8ETWutDu8ay/mVemc4Wcy8Mqq7UA7oZOQHY
   aljDG8zKToXoExW+B5ck+krQ2KpFF5zVnYep1yUawtnh3pKWoNXaQU2BN
   IY4Pds+WoIbgP0231tbGH5e2PnXNrOUY6j5n7jmWYuLqyq5P3KtsJr79r
   h5XrFa5QCbMMf1rkPh4EJ89tGUMQwFLcEDAMjrFYAnhXwTSJaDqSkH9yl
   oEEKPgti9BO3Xerf+ua3YEqQr3g90jzJ/Q4/sIgg5WlqGNdsYowRgMYb+
   w==;
X-CSE-ConnectionGUID: XpIiLYCGQOGdUQZqdSfbyA==
X-CSE-MsgGUID: x2eFnM5LRluFP1x1vFn0TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87185756"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="87185756"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 17:58:15 -0700
X-CSE-ConnectionGUID: 3R6bLLOeQYKM0p2t95KMNA==
X-CSE-MsgGUID: 4D7HHMIzRZqU/Z5IPZflAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="226081181"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 10 Apr 2026 17:58:14 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBMfs-00000000Azd-2XuW;
	Sat, 11 Apr 2026 00:58:12 +0000
Date: Sat, 11 Apr 2026 02:57:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sre-misc:thinkpad-t14s-x1e 83/106]
 arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: video-codec@aa00000
 (qcom,x1e80100-iris): Unevaluated properties are not allowed
 ('video-firmware' was unexpected)
Message-ID: <202604110250.GtICKxVg-lkp@intel.com>
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
TO: Stephan Gerhold <stephan.gerhold@linaro.org>
CC: Sebastian Reichel <sre@kernel.org>
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   c368130866898c0f67e75fb8e36b0708e623553b
commit: ddd829fd609aa62195329392019045aedeb29c28 [83/106] arm64: dts: qcom: x1-el2: Add iris video-firmware node
:::::: branch date: 27 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2052-20260410 (https://download.01.org/0day-ci/archive/20260411/202604110250.GtICKxVg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110250.GtICKxVg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604110250.GtICKxVg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: csiphy@acec000 (qcom,x1e80100-mipi-csi2-combo-phy): 'phy-type' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
--
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
