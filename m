Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5352519CC0A
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 19:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746647049; cv=none; b=uS74v1xLiUWoSvsbAwH+Wzg05WLrR/0dKqROdk1VYH2YikHWyjjMewcnBUImRfVXr3STbQ9eMAtBz3IpleU/q+7r8tO7ZuuyXtLHFwlaVNlirjYaOYtECDE3QkasvEjhvfDPpUzqvGfrEcKlH5hEHnD3YnuCeSNvInZrhJj6aio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746647049; c=relaxed/simple;
	bh=VsOSEEN+fo5kXyI0pJCy03Onl4rPbjxMRf5u7gF9dn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f+5u7EYhvSBgYlAUFb4/E6bqEXwfY+WQNfD1mmYVQHtrq0ixm3zqThas9et7DWipYnu+69L+mDx9gjf6uyINx2caymqTHdUo7kBeWaox/JzaVVF/Up+FUglDqXC/nHJTzn9WsN3lMXcSXNxmjkMtCZpa20BZVJTvJDFO1xBFaLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dC+Fzibg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dC+Fzibg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746647047; x=1778183047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VsOSEEN+fo5kXyI0pJCy03Onl4rPbjxMRf5u7gF9dn8=;
  b=dC+FzibgGnpm3y3JqSaVFr1noObhoRc4/fBPSjwGZceM0Dx/GJ/i8bLp
   X+jv/97m9GsgJeDo75wBOIVBiQieChxyVS6fumAIO2h2bn3S56RkPG3ls
   gKXPcySWTjsXLaE+Cn/+qJd63GxpHwVhkalIEJSMYBUOK8oYLH3Ezn/Fj
   ciy06arQr05Y0mJoPIqbuFaMEw4lj4RMKTGrpq/ua7T7vmJzfV+M8w5L3
   f2kea1gfl6/leY3ETOqJHWQmQOVlHnhLXKeqBTZG5iTzUFoEwUiLbrVC5
   oKSZkT+EMav7zW2hnh3RP2Rdz2G37b3t5KtQsljMdewy6qx7BWmdw7M9S
   w==;
X-CSE-ConnectionGUID: VEi6svXEQiSO62xVYQ8kOQ==
X-CSE-MsgGUID: RolcFmYXTxq43/mVFkgWog==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="36032255"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="36032255"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 12:44:06 -0700
X-CSE-ConnectionGUID: Qp8lRdOLQjC/AgYTJjSwvg==
X-CSE-MsgGUID: fCr963bUR+qS3dlXkRJ0ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="136024269"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 12:44:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCkgV-000903-2T;
	Wed, 07 May 2025 19:44:03 +0000
Date: Thu, 8 May 2025 03:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: timer: Convert marvell,armada-370-timer to
 DT schema
Message-ID: <202505080328.IMC7U9jK-lkp@intel.com>
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
In-Reply-To: <20250506022301.2588282-1-robh@kernel.org>
References: <20250506022301.2588282-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Gregory Clement <gregory.clement@bootlin.com>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-timer-Convert-marvell-armada-370-timer-to-DT-schema/20250506-144131
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20250506022301.2588282-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: timer: Convert marvell,armada-370-timer to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20250507 (https://download.01.org/0day-ci/archive/20250508/202505080328.IMC7U9jK-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505080328.IMC7U9jK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505080328.IMC7U9jK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/devbus-cs2: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/devbus-cs3: failed to match any schema with compatible: ['marvell,mvebu-devbus']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: internal-regs (simple-bus): gpio_leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: internal-regs (simple-bus): $nodename:0: 'internal-regs' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/pin-ctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6710-pinctrl']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/corediv-clock@18740: failed to match any schema with compatible: ['marvell,armada-370-corediv-clock']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/coherency-fabric@20200: failed to match any schema with compatible: ['marvell,coherency-fabric']
>> arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: timer@20300 (marvell,armada-370-timer): 'clock-frequency' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/marvell,armada-370-timer.yaml#
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-370-wdt']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/cpurst@20800: failed to match any schema with compatible: ['marvell,armada-370-cpu-reset']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/pmsu@22000: failed to match any schema with compatible: ['marvell,armada-370-pmsu']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/ethernet@70000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/ethernet@74000: failed to match any schema with compatible: ['marvell,armada-370-neta']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: /soc/internal-regs/sata@a0000: failed to match any schema with compatible: ['marvell,armada-370-sata']
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/armada-370-mirabox.dtb: mvsdio@d4000 (marvell,orion-sdio): Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cap-sdio-irq' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
