Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F251626560B
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Sep 2025 08:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758270098; cv=none; b=Mm//SQ0zc3FgabAGt/2msdksJxenPlkZFNsvt/iMhuc32NygzoDsgYB1KCL8mX01hXdbsmVGoSPw8Hv8FgQYe2TjIq/yXQxS+qNsW0s8v6Ty1loKBuUYa0oyr3aohAaMMaJPXEugOQw/k4KcGia4sbP4oEYLWcwtWHKAo8Fa0ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758270098; c=relaxed/simple;
	bh=8h3x2BGZwC/i+q+pZSVF0adRcffOGrrLBInfwdVgb1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WWYI13oLMrNznEJeiHy3CzlOzR+BoL/GD91f012AoBOaVfGg/Hz7IAjpw58MVm6AtjgLWppr9vmtxvDnY/nm8GSurGGQ/nRbogHVu4KN9usTYbonX7R+kA6Y3vEALrScA5On60MEPWkjTOsBu1CJ3FfesyhHXrqr1TlLPrB0mMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MTmYL4cm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTmYL4cm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758270097; x=1789806097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8h3x2BGZwC/i+q+pZSVF0adRcffOGrrLBInfwdVgb1Q=;
  b=MTmYL4cm+kwCWsIJpwEetzm+ot7vdjQIqeOAV9ECS09xPn7v4yqZQssk
   RO120fLqmmSC4wuFLBRasFcW3b1qcx51chXt4kBja2btuuQ1IUt6t3zpX
   TxG8dQhSycSt5cbafLS3uEqb6B/tXtFUA6WeQJwh3mz3hCv+CIt6lacjp
   9Ysu9yOrXpgfCX8T44mSYoTJPhDz6fVROqndoVTzjZ7JX3v7i5t1WavwT
   2p6NNkpI5N2zvteBMzSjNBLBrxYw3ruNuAEuWFvX3v0nXqK+r00gMAphl
   KdcE8LpiVtS/3IfANHnr02FQmRTi79QcLwO3SB8i/HFR8Ui0nGU528fVF
   g==;
X-CSE-ConnectionGUID: 66BBXcmPQCiJMKO1/HsUXQ==
X-CSE-MsgGUID: hEXFa5m/SWm1aVDC5p/0/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="64434742"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="64434742"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 01:21:36 -0700
X-CSE-ConnectionGUID: ItbEDkVNTMiZMN/h1NRW5A==
X-CSE-MsgGUID: SsdRpW3PR1i8Q1IGHQUjHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="212932175"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 19 Sep 2025 01:21:36 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uzWN3-000000003J7-037h;
	Fri, 19 Sep 2025 08:21:33 +0000
Date: Fri, 19 Sep 2025 10:21:28 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: tegra: Add pinctrl definition for PCIe C4 EP
Message-ID: <202509191041.vFSx93PJ-lkp@intel.com>
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
In-Reply-To: <20250918120138.17572-2-cassel@kernel.org>
References: <20250918120138.17572-2-cassel@kernel.org>
TO: Niklas Cassel <cassel@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
CC: Vidya Sagar <vidyas@nvidia.com>
CC: "Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>
CC: Gautham Srinivasan <gauthams@nvidia.com>
CC: Niklas Cassel <cassel@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org

Hi Niklas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-dt/for-next tegra/for-next linus/master v6.17-rc6 next-20250918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Cassel/arm64-tegra-Add-pinctrl-definition-for-PCIe-C4-EP/20250918-202414
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250918120138.17572-2-cassel%40kernel.org
patch subject: [PATCH] arm64: tegra: Add pinctrl definition for PCIe C4 EP
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250919/202509191041.vFSx93PJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509191041.vFSx93PJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509191041.vFSx93PJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pinmux@2430000 (nvidia,tegra234-pinmux): Unevaluated properties are not allowed ('pex_rst_c4_in' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
--
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pinmux@2430000 (nvidia,tegra234-pinmux): Unevaluated properties are not allowed ('pex_rst_c4_in' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: audio-codec@1c (realtek,rt5640): realtek,jack-detect-source: 7 is not one of [0, 1, 2, 3, 4, 5, 6]
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: audio-codec@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks', 'port', 'realtek,jack-detect-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-1: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: pinmux@2430000 (nvidia,tegra234-pinmux): Unevaluated properties are not allowed ('pex_rst_c4_in' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: audio-codec@1c (realtek,rt5640): realtek,jack-detect-source: 7 is not one of [0, 1, 2, 3, 4, 5, 6]
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: audio-codec@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks', 'port', 'realtek,jack-detect-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: pinmux@2430000 (nvidia,tegra234-pinmux): Unevaluated properties are not allowed ('pex_rst_c4_in' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
