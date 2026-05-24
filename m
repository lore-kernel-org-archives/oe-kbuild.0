Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D4231F98A
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 06:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779604205; cv=none; b=J8KLxLlccTmonQTlWyitJPObRwiEYPkmh2HaJfCbhXymD7KEjhuxbdTs4Lf5E3+vkdiYItJl1cDr/NmSggi//amxbW9ucLver7qmKyAD/vpcA7LM+es0PGrshOcS+5S0Vrlx0uZJkpzaFgBVXIP8TZCDVB7fmw6JAh4ZTj9AzFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779604205; c=relaxed/simple;
	bh=X8dX6XyGZJJ2+xc133x6eoBAshSiY6eotyySuVM4arU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HNlPXM4MFnDSja5s0kEnHwlH19qhR3bYQfsqf02+JoeMhFcfTBuTuPWjwEnHflQ5y4KrvB+SEU+Z51RpDMkh748R9/1XtDpJJJzXMZtcwuExS8XgM8E7f/cfY3c41nhFnGUq15VNfiZNm5F2XIekYOFHfNKIBBH1qf2yJMFQhSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APr5+afl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APr5+afl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779604203; x=1811140203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X8dX6XyGZJJ2+xc133x6eoBAshSiY6eotyySuVM4arU=;
  b=APr5+afleukpqBigi+XIDSnL5aPwNHSvlKnez5NkCitFHDmqVqBTN4qp
   /YK8itRErUBVKCGOWFngZ5hg1u4VnePjtVUvGaAsJ2xwY+zwXn97HuaYI
   M/bnVe/ZwfMz0ZS5S5bMpSCHIcKjMy2pQQBxaAfAN+oJqC9Zu6obY87KZ
   y/zZnT+JIVH7YyHvNB63iV12I7bneBUlEKbt2mkMDwriIW/L5xnUEBucG
   0kkRZK3bCR536DiT8mxycwmtEIF+4YM4TjaitH/4weUpuRBhWGQM3odke
   UUjiB0BwhA3Y0Byl9/yMzwUaXnZkQz7uKXe+UoQze1/g/KUmvFbLANCmd
   A==;
X-CSE-ConnectionGUID: V88YvcKnR0q1FRftZ8beHw==
X-CSE-MsgGUID: 9syhcPuRRT+Zbs7JMhWCLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="80518447"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="80518447"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 23:30:03 -0700
X-CSE-ConnectionGUID: +UUtANshRcuSuh7ElAYWVg==
X-CSE-MsgGUID: r2aSdkGUQYuIhWar1d68JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="241362922"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 23 May 2026 23:30:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR2LX-00000000BuX-1iLd;
	Sun, 24 May 2026 06:29:59 +0000
Date: Sun, 24 May 2026 08:29:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] arm64: dts: s32g: add SAR ADC support for s32g2 and
 s32g3
Message-ID: <202605240837.krNTRpu5-lkp@intel.com>
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
In-Reply-To: <20260513142948.640057-2-khristineandreea.barbulescu@oss.nxp.com>
References: <20260513142948.640057-2-khristineandreea.barbulescu@oss.nxp.com>
TO: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
TO: Chester Lin <chester62515@gmail.com>
TO: Matthias Brugger <mbrugger@suse.com>
TO: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: linux-arm-kernel@lists.infradead.org
CC: imx@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: NXP S32 Linux <s32@nxp.com>
CC: Christophe Lizzi <clizzi@redhat.com>
CC: Alberto Ruiz <aruizrui@redhat.com>
CC: Enric Balletbo <eballetb@redhat.com>

Hi Khristine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.1-rc4 next-20260522]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Khristine-Andreea-Barbulescu/arm64-dts-s32g-add-SAR-ADC-support-for-s32g2-and-s32g3/20260515-181815
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260513142948.640057-2-khristineandreea.barbulescu%40oss.nxp.com
patch subject: [PATCH 1/1] arm64: dts: s32g: add SAR ADC support for s32g2 and s32g3
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2053-20260523 (https://download.01.org/0day-ci/archive/20260524/202605240837.krNTRpu5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240837.krNTRpu5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605240837.krNTRpu5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: adc@401f8000 (nxp,s32g2-sar-adc): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/nxp,s32g2-sar-adc.yaml
>> arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: adc@402e8000 (nxp,s32g2-sar-adc): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/nxp,s32g2-sar-adc.yaml
--
>> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: adc@401f8000 (nxp,s32g2-sar-adc): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/nxp,s32g2-sar-adc.yaml
>> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: adc@402e8000 (nxp,s32g2-sar-adc): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/nxp,s32g2-sar-adc.yaml
--
   arch/arm64/boot/dts/freescale/s32g3.dtsi:885.27-891.5: Warning (simple_bus_reg): /soc@0/watchdog@40500000: simple-bus unit address format error, expected "269fb20"
>> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: adc@401f8000 (nxp,s32g3-sar-adc): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/nxp,s32g2-sar-adc.yaml
>> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: adc@402e8000 (nxp,s32g3-sar-adc): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/nxp,s32g2-sar-adc.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
