Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715CC383
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 03:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720667764; cv=none; b=AFjYw2cxdjAEgvVFH4vS+eBhHfg4Y944IJ5kKLEhsY3W57Aeat4QCz5Cxw5jFB/z67MpeXYdfF62QRU9JHhMhcifbLH0h+ZwXtOtUvC2f8tSeC4gGaEn3ZK6FUk5eVQ/9x68B92ulWX824zP0TcmXmjatemAfuCWcHbY7w/nirk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720667764; c=relaxed/simple;
	bh=1L8ufLgYaQYeRJ4s5iMfVhdturMvxljcpFZ5iZntjZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MUh51OHi31TjWRqtOxT1awcOk3HzocaP+eOgsbwe1TY0BWAPCwLtaV7DglEiE40kDB8fnKvNwfbdNN9jsm0CknqU8b/I25mDd/2VpAPJrz+ULSm6M/OPmjudloZng+vDzl0T7giTyLZ/HAjtC45SU1r4DhPL+saZslRxJg0YcTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQA6CBv+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQA6CBv+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720667762; x=1752203762;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1L8ufLgYaQYeRJ4s5iMfVhdturMvxljcpFZ5iZntjZk=;
  b=VQA6CBv+1S9yiTlkmpxkmi8hzSxzDV7keqaHtxI5xsYQP0MEZKaPd1SB
   BDd5H3Mp4krddzUT1K75nlE2bGb6hNuy+lppOdhES/yb/ikMESUA9ZrEn
   FkMP3U+IcoOTnXCfAFOGHTLOpV4F6s4i5AdGqm65lULwDcE826j3d94Gg
   YyAchue/pK9Rhg0vxfPmwfCOoWly8LMzeBrKndTLvvNKWjq2ta0+h/u7N
   uuTo6rReC6I+D6ct0Dz0uAfwgRVh0pa5UyxGwX0qqJDABm2zwM/2bgmdd
   vIEiq5K/UJQebCdJIT+mXXJa/Xyv7B0OvsO5Lsa5hV1JI8zCEpnVEaT9b
   A==;
X-CSE-ConnectionGUID: yeyFsI0zTYqRENJAxqO+Cw==
X-CSE-MsgGUID: YH43R3/PQ9ir2U6oFWPewg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="28692691"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="28692691"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 20:16:02 -0700
X-CSE-ConnectionGUID: Wn4az6ToSwqxlWXkDoByUQ==
X-CSE-MsgGUID: BH4XVXzUSXmcfNq94tHf+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="48395505"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jul 2024 20:16:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRkHm-000YgW-1T;
	Thu, 11 Jul 2024 03:15:58 +0000
Date: Thu, 11 Jul 2024 11:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2c-mux@70:
 idle-state: [1] is not of type 'integer'
Message-ID: <202407111159.NNLaem91-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Arnd Bergmann <arnd@arndb.de>
CC: "Philippe Mathieu-Daudé" <philmd@linaro.org>

Hi Geert,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9a2f29aefdadc86e450308ff056017a209c755
commit: 4b46d86c978bbca24c110a5b0d6890380ed4b6c7 ARM: dts: aspeed: Fix pca954x i2c-mux node names
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407111159.NNLaem91-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111159.NNLaem91-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407111159.NNLaem91-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2c-bus@600: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2c-bus@680: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c-bus@680/tpm@2e: failed to match any schema with compatible: ['nuvoton,npct75x', 'tcg,tpm-tis-i2c']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c-bus@680/tpm@2e: failed to match any schema with compatible: ['nuvoton,npct75x', 'tcg,tpm-tis-i2c']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2c-bus@700: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2c-bus@780: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2c-mux@70: idle-state: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2c-mux@70: Unevaluated properties are not allowed ('idle-state' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@70/i2c@2/pca9551@60: failed to match any schema with compatible: ['nxp,pca9551']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@70/i2c@3/max31785@52: failed to match any schema with compatible: ['maxim,max31785a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@70/i2c@3/max31785@52/fan@0: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@70/i2c@3/max31785@52/fan@1: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@70/i2c@3/max31785@52/fan@2: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@70/i2c@3/max31785@52/fan@3: failed to match any schema with compatible: ['pmbus-fan']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@70/i2c@3/pca9552@60: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@70/i2c@3/pca9552@61: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2c-bus@800: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
