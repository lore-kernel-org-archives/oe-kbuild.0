Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466FE3D811B
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jul 2026 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783676333; cv=none; b=Onpy76YSyyJaJfygctJSMaKIIQ14sLBKIb8qumtEfC5+6N2MzwkMNc6g0+9L68VO+swfoD6BkFMDg3kcJQXX585gI0zsY5Irv3/HAGy6t9dPHf782Z/m0IvOPjPgiPvUhmYWkUafvttGMmqNlhSkAI0oR7/uTZSAKMT8CZLu9+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783676333; c=relaxed/simple;
	bh=3kv5A6kK1J7+SCZGdq917zY4fO8vtsfFayuROeSHFXM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b1bSAix8PZzgWleQaljV/WwS8DjqBF0QoTwPcE0JAbFUkAT5pVZsxrMntmUkL3iscyUqvmhnbCwz5rDKJE/CURNfcCKd6SCXcqlbKg1aNlR/7K3hZC4jC0N8FfGdLR//UJp9pcawRPExKS8SqwzB6ev0/g/T4g2c6j5d/yBdqi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CeLyVDbd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CeLyVDbd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783676331; x=1815212331;
  h=date:from:to:cc:subject:message-id;
  bh=3kv5A6kK1J7+SCZGdq917zY4fO8vtsfFayuROeSHFXM=;
  b=CeLyVDbd7ZfqfXSxp4u8Yu3raeRCoQIgb/v3097pkfuNTGbBz/VnodQP
   xt5KywUFynmwvvP6HlrWOAPZeWPMt5i6ANfL+Heb4GemEkUBY4nlt0lkb
   kZzXKi52ygeEd+EGhLA2rPD2Uylh41A2aE8A3JK9ai087RxZA4tErFS9M
   zqhRGV4utBL3XAD480wJlfveldfUzCctVUGFQuUZLxfeeVNFZjvuyH8db
   WHXCaPhYfhT7oaRhgt5Z7hp9jQ4A/7/SvoRfmrnR1R0MT9Ndkrhh90zDB
   wRaRpYMqL4mQDOWz8XJF9Rrn+6SpsYtHbXOraRueE7FBGSt6Cw+t0aqUk
   g==;
X-CSE-ConnectionGUID: NHch32ITSN+UhIDYnKPeAQ==
X-CSE-MsgGUID: GLRSfHc2SgSWTiqQydk0RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84394607"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84394607"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 02:38:51 -0700
X-CSE-ConnectionGUID: lJqUN49URjadc0FLQR8txA==
X-CSE-MsgGUID: /XAM2748SwWWqgS8/POvxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253724921"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 10 Jul 2026 02:38:50 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wi7h1-0000000039V-3yTO;
	Fri, 10 Jul 2026 09:38:47 +0000
Date: Fri, 10 Jul 2026 11:38:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: soc
 (simple-bus): usb-phy: 'ranges' is a required property
Message-ID: <202607101131.LVtKVpSK-lkp@intel.com>
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
TO: Joey Lu <a0987203069@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-phy-nuvoton-ma35d1-usb2-phy-extend-for-dual-port-and-OTG/20260708-184204
head:   170f5f4d1ccee94f8a0ec9848a2b3fa215145023
commit: d2238012e6e261d5bf0f5d00c869698e5e01c72d arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260708 (https://download.01.org/0day-ci/archive/20260710/202607101131.LVtKVpSK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607101131.LVtKVpSK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607101131.LVtKVpSK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi:91.20-97.5: Warning (simple_bus_reg): /soc/usb-phy: missing or empty reg/ranges property
>> arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: soc (simple-bus): usb-phy: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: pinctrl@40040000 (nuvoton,ma35d1-pinctrl): 'hsusb' does not match any of the regexes: '-grp$', '^gpio@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-pinctrl.yaml
--
   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi:91.20-97.5: Warning (simple_bus_reg): /soc/usb-phy: missing or empty reg/ranges property
>> arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: soc (simple-bus): usb-phy: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: pinctrl@40040000 (nuvoton,ma35d1-pinctrl): 'hsusb' does not match any of the regexes: '-grp$', '^gpio@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-pinctrl.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
