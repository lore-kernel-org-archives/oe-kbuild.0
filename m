Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7298E405C20
	for <oe-kbuild@lists.linux.dev>; Sun, 17 May 2026 04:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778991580; cv=none; b=HEL68K/GxaseBGDIi8DX2G5IYP7RQ1eZBInUPigUcIuBceVeBiUARPxbXNCzg8dxFHfAstssRsV9RDN1PcZkTTCBdWEtG+hJMXalLfvH1wbU9CxPuLR63seBJg4ZRXmyeGF1VpkJoq75bUAhEMKZBwT3mW0aZWPOFD0Qf+nURV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778991580; c=relaxed/simple;
	bh=XoqSayKDXWXn3Wl3wptz4IKio8tDHj6pUXwINWdWO2U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a6tvHaZHwIQbYogJ9mOFRyZZh9G+DJYVSP2Cjme/B2yy3JXmEbfsfEcO/m7JWzMGITZXjy6YyW8yfBx11XXWzYj83yniu6bOdKVRKJ/PrJOxh27FRmyOoKTJ0SNH30fN2LtGQQBHmN+AIF3VJveDPr3pIve8SontMJAz9yC8nFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hO3hz+7z; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hO3hz+7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778991578; x=1810527578;
  h=date:from:to:cc:subject:message-id;
  bh=XoqSayKDXWXn3Wl3wptz4IKio8tDHj6pUXwINWdWO2U=;
  b=hO3hz+7zXb9ZzHLaRWUV8hkRtfBVSvOW+jB4ILiQM8VxdBqF/6cENPi5
   gPUJfip4y2xe6Q8Zq2TCpk4LLYK0KiH+QmECPpSuYUCPCOr/ozc8rGttd
   Oxhu1lXXSBJH6D2/gXIiiOyyZa2PUl0GF7FjahvLslbIXcr0k4L6v+W3y
   ooTx5EmcBGeViqSa5tgJRb4nSx8/6+bhduX5heT4KytYkW97nAOfYFjfg
   4hmUKbiR9LdcEgZPN1hO1kg9R7UAVhE1g+mJBe9giAgXwtLVxgnh1KRTO
   /AC45o+m0+sUKUyyGxhvikzf2bFYreyeK8PA32BhMv6jux/Ce1Xy+PRA9
   w==;
X-CSE-ConnectionGUID: BtPWOemDRqKVwTNprp8YKA==
X-CSE-MsgGUID: NDcp/aAVTHa5EPQBwxVDKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90584167"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="90584167"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 21:19:38 -0700
X-CSE-ConnectionGUID: pD/Lv9WkSH29gDXnfMTTZQ==
X-CSE-MsgGUID: K9jtTc9QRhmHSUAEMfjSDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="277197033"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 16 May 2026 21:19:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOSyU-000000009TB-3cXk;
	Sun, 17 May 2026 04:19:34 +0000
Date: Sun, 17 May 2026 06:18:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dtb: usb@12500000
 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
Message-ID: <202605170637.8XahGQXQ-lkp@intel.com>
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
TO: Antony Kurniawan Soemardi <linux@smankusors.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Antony-Kurniawan-Soemardi-via-B4-Relay/dt-bindings-clock-qcom-rpmcc-add-msm8960-compatible/20260515-120217
head:   9b40a3dc63b1638eb23da30b3610b40a117678f2
commit: 671ac8c62b292acf8c1fd78bd3f4d25f4aa6988f ARM: dts: qcom: msm8960: add RPM clock controller and fix USB clocks
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2053-20260515 (https://download.01.org/0day-ci/archive/20260517/202605170637.8XahGQXQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605170637.8XahGQXQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605170637.8XahGQXQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[29, 10], [23, 126], [23, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
>> arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[34, 10], [23, 126], [23, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
>> arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dtb: usb@12500000 (qcom,ci-hdrc): clock-names: ['core', 'iface', 'fs'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dtb: usb@12500000 (qcom,ci-hdrc): clocks: [[33, 10], [24, 126], [24, 128]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
