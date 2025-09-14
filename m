Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF2243ABC
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Sep 2025 02:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757816150; cv=none; b=suoV0TpPksUsUAy1ep2f7XO9kzMtoX8h/Xart7nh5f+WHskApSncYa7nmUW+SvurORwFHR9MZKa5iP6MXLKwZ8Qo3ootiNcnoDOSF53/QQi8qhbmGsvRA3kWK0AYJcCfh9N4Dr3yZUH83UYucYBqZcV/IwnipDYukGeY7g1yyDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757816150; c=relaxed/simple;
	bh=WuiPFgDZlSZr8xLaDxMA3PeitKX+IVFyH8u90yETjBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fzzqWQ+plkRdN6jKi6xY5nzZ6mzt1tnA3a5xrqrOZGsHKAG7tg3WonvYf5sF6/kTMPp9i2aNmUZJR6l7VSfx58bVqTXXBOv7txRblx88gcjlfG2IyCVAGd5mmOLXDFZ8kzKVHX6XMZnV8811qr9oUeo4jl9D7Tko+c94BwJMBIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9rYzBln; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9rYzBln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757816149; x=1789352149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WuiPFgDZlSZr8xLaDxMA3PeitKX+IVFyH8u90yETjBk=;
  b=k9rYzBlnRZEcUOZTZsHbGhGkriBpRgI2N00ZiwQo0Ad9H0PFXmsJggAS
   GEoCN+MVL/xUp+p/hSlYUzNMHVRaCEEygz9NNlle/wBMo7Ckv6Il3mk95
   6Sx57vZxAZ9ukMivwLA5QPKsUmazds6HG1kQpYQ3JSdQVYKBnFu4YliX6
   Bo/HCqgmSwHStqBU/YPqkdxpb6810Z4vxBljcR9Jy5FErKRAvP++EAFh3
   0uu/MLG9eksMGniiX2cDRzikb+vX7kCaVMXEoOLf8/ZSDJ9pjtqLiAV3y
   sogQvS6LasXOBJgRNJNi39g14EdwFPfmq7AEkWYQuTzOsk780TcYgzKBi
   w==;
X-CSE-ConnectionGUID: eepDNvE5QE2nEFPX0hGUmQ==
X-CSE-MsgGUID: C4xKn3UvRiOKMY6ugGfjtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="70733998"
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="70733998"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 19:15:48 -0700
X-CSE-ConnectionGUID: 3fa+zZ1gQB+SIGaqaXAMRQ==
X-CSE-MsgGUID: fAyZmmV0RHKWxy7z90N4EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="211467072"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Sep 2025 19:15:47 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxcHI-00021s-1e;
	Sun, 14 Sep 2025 02:15:44 +0000
Date: Sun, 14 Sep 2025 10:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] ARM: dts: microchip: add I3C controller
Message-ID: <202509140949.UNIkYYID-lkp@intel.com>
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
In-Reply-To: <20250909111333.170016-5-durai.manickamkr@microchip.com>
References: <20250909111333.170016-5-durai.manickamkr@microchip.com>
TO: Durai Manickam KR <durai.manickamkr@microchip.com>
TO: linux-i3c@lists.infradead.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: alexandre.belloni@bootlin.com
TO: Frank.Li@nxp.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: balamanikandan.gunasundar@microchip.com
TO: nicolas.ferre@microchip.com
CC: Durai Manickam KR <durai.manickamkr@microchip.com>

Hi Durai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next linus/master v6.17-rc5 next-20250912]
[cannot apply to abelloni/rtc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Durai-Manickam-KR/clk-at91-sama7d65-add-peripheral-clock-for-I3C/20250909-192231
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250909111333.170016-5-durai.manickamkr%40microchip.com
patch subject: [PATCH 4/4] ARM: dts: microchip: add I3C controller
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-051-20250910 (https://download.01.org/0day-ci/archive/20250914/202509140949.UNIkYYID-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509140949.UNIkYYID-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509140949.UNIkYYID-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: i2c@600 (microchip,sama7d65-i2c): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible: ['microchip,sama7d65-ddr3phy', 'microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/i3c@e9000000: failed to match any schema with compatible: ['microchip,sama7d65-i3c-hci']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
