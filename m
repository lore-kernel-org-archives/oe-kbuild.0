Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67DD2777F3
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Apr 2026 18:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775413696; cv=none; b=Eo+VU71XVwXe+1UX3c8cpONJ2ZM/qQnRrBdc555ntJuzjt3hfMla3pfNAziZYBOKrssLe0JeaplstANeAfEmDJf2V5E9vBPbYubOrj933ZaAD/75DcuNXXM5T8eyZb4cSrzGHFchQd3uNEdTgLkBt320nyvZQed4lDvYQ6Rm76I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775413696; c=relaxed/simple;
	bh=WowGM4Ksizlls5WY5kbBlmGOuHiORrpc0tjIC1LS8vk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rD8PwrmBDD9C123d9cBiFd8paIBRnpLfF3iN8NwKULxsXSIMQP1NgP69vV3asz5rcFo8BbuT3gwxwstICwxETVgUm2PIIao5aX2XLMk2F4XfTFrhcUnmfgHoqlFaJlYVQ2/UQD86CN6TPl0EXN3pbWEZOKYIkSv7NgELOuV9ni0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biLE5sQP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biLE5sQP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775413695; x=1806949695;
  h=date:from:to:cc:subject:message-id;
  bh=WowGM4Ksizlls5WY5kbBlmGOuHiORrpc0tjIC1LS8vk=;
  b=biLE5sQPJ2W7krowo3xhC/NNdUpqtVLIGzMzDVrjqRbHfrwQk1QmIMWr
   ZQvtIvP9ubVZTTBEWzjOv7xdnFp07JJYtdrmrdYX7Db8OmX0LyJCMZxPg
   iogcQZfVy6KJ0ouCXt5R+HIIS4O0m17tHxFc0mCfvrqJ4hORCunvQ5XTK
   JOEGxk72RTQ0EcSnedNB3xHjJmFq9SnbBsWSaGE8Z5kNCqCt2qsP4E8K9
   ZX79/31e3MoUOQcTsGwtWgW01QqSItSWNQmtCucpfk8niGwNcx3/EVfCs
   q3gIkDQWztxCtSmdYhF9wk4QJElYX9vEMshy2J2aR9whHH3ox7AgA51Wp
   w==;
X-CSE-ConnectionGUID: jE8s/SLpSsq2YjrQpJHk2w==
X-CSE-MsgGUID: JJM6Leq9T3uOfsxZ+jqh5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="87092849"
X-IronPort-AV: E=Sophos;i="6.23,162,1770624000"; 
   d="scan'208";a="87092849"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 11:28:14 -0700
X-CSE-ConnectionGUID: hjDKxp4HT3mYdg+sGpZcFQ==
X-CSE-MsgGUID: tc0RVcbqS8uTgyywf+5Bpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,162,1770624000"; 
   d="scan'208";a="227980635"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 05 Apr 2026 11:28:13 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9SCg-000000009t3-1gC5;
	Sun, 05 Apr 2026 18:28:10 +0000
Date: Sun, 05 Apr 2026 20:27:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [netfilter-nf:testing 20/28]
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6800000
 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
Message-ID: <202604052058.a4EjOFsu-lkp@intel.com>
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
CC: netfilter-devel@vger.kernel.org
CC: coreteam@netfilter.org
TO: Jon Hunter <jonathanh@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git testing
head:   dad08c7a4db751768e501ae89c7b790a96f825d0
commit: fb22b1fc5bca3c0aad95388933497ceb30f1fb26 [20/28] dt-bindings: net: Fix Tegra234 MGBE PTP clock
:::::: branch date: 29 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260405 (https://download.01.org/0day-ci/archive/20260405/202604052058.a4EjOFsu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604052058.a4EjOFsu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604052058.a4EjOFsu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6b00000 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
--
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-1: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb3-0: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb3-1: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): phy-mode: ['10gbase-r'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6b00000 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
--
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>> arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>> arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>> arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6b00000 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
--
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>> arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>> arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>> arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6b00000 (nvidia,tegra234-mgbe): clock-names:3: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
