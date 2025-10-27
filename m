Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288E0261B99
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 22:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761605505; cv=none; b=Wz/I4mpd+CP0XtjDZxU4wZXqZwd3eF+SI/45kWHWOAePbLmd6NG4TJA9RqtkF8Gok2XyjN+EimBqfVzMW34Y4HNcfp50H6OufU4NDJmUrEjObrFdHa8putrigxJZUS9PfXP9nIgqTMHGsVkyDmMOr4mAXXCxtaq/vFQ06Beo3Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761605505; c=relaxed/simple;
	bh=jwJ0sV9kVM8S+YBSea543WUbFA4eVCXQ0Guv4wRmGBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ElrnptP0G1cJ0bArQm+9tlvP77XzS5RrFf1C/PkbmFhJaryu0kRxQ+0o95jYmME8ZEUixGucU+iZiDvRb0JvOZEqd+22MretpzA6AhyuXcF5rEnQbU4yNJSJkUY5as5c3jEJJsKvk5dFcfGnTdUBfx+ygXhSDE1nmRj9QilmIDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B21gdbRr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B21gdbRr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761605503; x=1793141503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jwJ0sV9kVM8S+YBSea543WUbFA4eVCXQ0Guv4wRmGBU=;
  b=B21gdbRrdnjvpFzrop+w7nSNPRsI4HekviQKJXqLZQpjZspCY6/f+iRg
   9ONTF3/1wU7MS8rc/SaHW7NK2tFrBVD62I7fk2eYMLAxC6UEOwB87cLXu
   sT7O2hrYMRk6kT7pfw+gxgfmshAw6M/OqaDEu4NRH70SHlXsN5N/ifN3K
   kaJ0LXW0kIp5iZbHIKlgcqcOmWIPdMod77WLno6yr7rT+YdMkmEKrbaHU
   Ift/hH1MUUlQBUAwfEjzEtF92wr80sykFS5MN8FfXSGlffz8GKiF/zVhQ
   OAeLhIkhQRTUsWO1+2Smlbaa9QNOwPMbIhbgXfbma80u1Si5l/9a3EvJb
   A==;
X-CSE-ConnectionGUID: Q1/ZeX2IS8CC1dD1ZNObLw==
X-CSE-MsgGUID: xN+xiZ9SQyqL4co+iFlptA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63586386"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="63586386"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 15:51:42 -0700
X-CSE-ConnectionGUID: Ais4sGp/R66xDI9xzzh4OQ==
X-CSE-MsgGUID: VI8NVtTiSKuwJ9NeJQFpwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="222382668"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 Oct 2025 15:51:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDW3r-000IYP-21;
	Mon, 27 Oct 2025 22:51:36 +0000
Date: Tue, 28 Oct 2025 06:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:ux500-codina-v6.18-rc1 2/2]
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: mmc@80005000 (arm,pl18x):
 Unevaluated properties are not allowed ('cardreset-gpios' was unexpected)
Message-ID: <202510280623.jxm748zt-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-codina-v6.18-rc1
head:   2055a1ec95917518ed9a724a2a0f641f09786a37
commit: 2055a1ec95917518ed9a724a2a0f641f09786a37 [2/2] horror hack
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-052-20251024 (https://download.01.org/0day-ci/archive/20251028/202510280623.jxm748zt-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280623.jxm748zt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510280623.jxm748zt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: proximity@39 (amstaos,tmd2672): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/tsl2772.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: /soc/i2c@80110000/isp@50: failed to match any schema with compatible: ['zinitix,bt404-isp']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: mmc@80005000 (arm,pl18x): Unevaluated properties are not allowed ('cardreset-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: /soc/msp@80123000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: /soc/msp@80124000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: /soc/msp@80117000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: /soc/msp@80125000: failed to match any schema with compatible: ['stericsson,ux500-msp-i2s']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: regulator-gpio (regulator-fixed): Unevaluated properties are not allowed ('regulator-type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
