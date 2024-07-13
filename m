Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC6213049E
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jul 2024 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720881571; cv=none; b=RQdA7iGVMINv9H8A7KkAGUtrVV33Z4WKH2iVuspqge72BxlhwbR34KzYMXcpfUYgerzBunrTR1ZcfUVL9RXw8XlgC0hJUjzUHd1s7vtppvl5snF1MDR57s99dKGNvUTRn2rznDR8mx5GZM6jmAtnad2Zc1Gt1uJdjtSrWxwtV6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720881571; c=relaxed/simple;
	bh=UgY/+CwkYLldtC9bGDAECQ2Rh72C5gh1smljH0gqJdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HdjRyNAOU5XLzvoqhkQui9Ism2z0GZPBNcADEWqVShQozVSzuurjRKjApA75KGZYK6OoB4gyrRu8mH5R8eP6MQXo+44ibKAAeMADPiW2Baco9Azw0l30dmrX3Hr3dXFIMCN4C+0qoBkrWDgtmMai+1/lb6yva8cdjtdkk2XCpgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DmpZoSAd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmpZoSAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720881569; x=1752417569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UgY/+CwkYLldtC9bGDAECQ2Rh72C5gh1smljH0gqJdc=;
  b=DmpZoSAd4CIDuq2RG1oYuzoBlFyNkwhLFvOm3V3fk5xCRgKyQUdsZCPa
   RhBpYl01W5jKdp1N4yRXcV040O/0+sHP12BlVNTrwwi4JsX9N/RWb6ylt
   HSq4PDWA10kgtuPqPZQup3Uv55y7W+4wKakbCdgBwVJhemlVrDjhH7PFA
   WlauXCv8RA6RsdDsk9Mc/nPzagVIeyljUaIBuhud152XtRl8/EZYuusvh
   Y8wADSjG30QLK9Fj9rB0D3Q4Ou+2X7ypxr5FiPDJiYGURBafK/Cd2u2HX
   7Aw0rgCep4V4/21usXheXeU57vQ8Sh86YcE15C2lVYMcCTiHmOsggh5Qa
   g==;
X-CSE-ConnectionGUID: Y8POjyEJQMOC/JutSoBC3g==
X-CSE-MsgGUID: QgtEPb6YTkaW41DJp0QlMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="22130203"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="22130203"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 07:39:28 -0700
X-CSE-ConnectionGUID: 8hjcORIqQB61fn/TbzW/Fw==
X-CSE-MsgGUID: j/ZQV0TaTj6RfMucp/DieA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="49175355"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Jul 2024 07:39:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSduG-000cGg-32;
	Sat, 13 Jul 2024 14:39:24 +0000
Date: Sat, 13 Jul 2024 22:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:soc/dt 28/42]
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-nslu2.dtb: /pwm: failed to
 match any schema with compatible: ['pwm-gpio']
Message-ID: <202407132220.lJYy3dYv-lkp@intel.com>
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
CC: arm@kernel.org
TO: Linus Walleij <linus.walleij@linaro.org>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/dt
head:   48d2245586452b8279a854970ce82f43477669d3
commit: 8b5d415c4f9cc5a147c791d0300ee0b0cd8deae0 [28/42] ARM: dts: ixp4xx: nslu2: beeper uses PWM
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-051-20240712 (https://download.01.org/0day-ci/archive/20240713/202407132220.lJYy3dYv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407132220.lJYy3dYv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407132220.lJYy3dYv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-nslu2.dtb: ethernet@c800c000: 'intel,npe' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/intel,ixp4xx-ethernet.yaml#
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-nslu2.dtb: /soc/usb@c800b000: failed to match any schema with compatible: ['intel,ixp4xx-udc']
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-nslu2.dtb: /i2c/rtc@6f: failed to match any schema with compatible: ['xicor,x1205']
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-nslu2.dtb: /pwm: failed to match any schema with compatible: ['pwm-gpio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
