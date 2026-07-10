Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA22C329C60
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jul 2026 04:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783657527; cv=none; b=JMEWjmHuPlQjpggbqhGuAT3wtTa5HCRUqkswzD6Wo+Lsn3dlt5GNGU4ewSjTqtxe058y5n7yS1+Ownd9poLAQsvg/xiXilPQu9trhkDHW9NPohhMJ+TpTLTKDCO1D8Cygz7/melTFdYKiuEjGccWeOqm3iuK2wvDvqXpqsuZMWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783657527; c=relaxed/simple;
	bh=lFGlVRNDPAYZssJmZVKU4MFvWhfSQxAZG4IFM9i/nQ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YLfNVQ9rew6cIidSWcur42uhth46iYmpdYmjINq7LM5zUUjBgf4Sme54DAdN+f3lnj3ykl/vCDfTobCxIb+PoV5bvYkdl/iAwJavJRayEOxXSiE+hsTLX2f5BAMXIIXitqrflWoy6lniJQWR91a4CNjlLg1BX+FVNbDk44S/d8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8dS4OmK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8dS4OmK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783657525; x=1815193525;
  h=date:from:to:cc:subject:message-id;
  bh=lFGlVRNDPAYZssJmZVKU4MFvWhfSQxAZG4IFM9i/nQ4=;
  b=U8dS4OmK8O0I5o2wj5pUkJm4gU26MiLQhdE1GCsIe7epEY7XVVUfVGzG
   kdXiqvFq8wOy4SQM6gWa7nQ8/6ResMgtJSn+k2fWiE0eym3OiqYj4t0mQ
   WLLIrWw6rGY7UZDSnDgRG3s0dagR4yxJLWfQLO9kcUeR73rqYTDSNROow
   aBtROpG+wj4jt7/2nayV+fYFyoLNHG0t3agEyCLvVilxmlzl2IWod+YXU
   I0C/l1GGjtkeIoGxcqT+lRrOqIvlxJc+9nxG+OoFZXZYeb2nQbCJpEsk/
   xy6uQKxA1Co4QSYHT+lyTcfS+Anw3wxT8TbMwPPqvSMWVZEVgpjZ+Vzlr
   Q==;
X-CSE-ConnectionGUID: EKn9p5KyQUS5VMD76/+Pag==
X-CSE-MsgGUID: PIILQ+maTzursL44MjUzqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84468450"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84468450"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 21:25:24 -0700
X-CSE-ConnectionGUID: HovvYh+iSuCU/2WgnvQHBQ==
X-CSE-MsgGUID: QbJgQrgJQKydrlXpdYY5OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255438548"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 09 Jul 2026 21:25:24 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wi2nh-00000000377-1WrL;
	Fri, 10 Jul 2026 04:25:21 +0000
Date: Fri, 10 Jul 2026 06:24:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: padctl@3520000
 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202607100627.Dj1W9dZ2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thierry Reding <treding@nvidia.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a635d6748234582ea287c5ffeae28b9b23f91c7e
commit: d4e0199bb5545acdfe5ce9d8046f4f35c95d6b8a dt-bindings: phy: tegra-xusb: Document Type C support
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2055-20260708 (https://download.01.org/0day-ci/archive/20260710/202607100627.Dj1W9dZ2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607100627.Dj1W9dZ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d4e0199bb554 ("dt-bindings: phy: tegra-xusb: Document Type C support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607100627.Dj1W9dZ2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'oneOf' conditional failed, one must be fixed:
   	'connector' is a required property
   	'port' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
--
>> arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'oneOf' conditional failed, one must be fixed:
   	'connector' is a required property
   	'port' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
