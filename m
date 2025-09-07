Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74EB1990A7
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Sep 2025 14:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757256489; cv=none; b=sKVGWhOn/jrlvjF5cF8N8RZdKxUqR9+fJsVj1cVY3+C936rkrU2bdcaiNigAy7fFz/OKZKBVOLX+xWkQjFGFtheS+M1fAJE7e+RcBCk0TU14hpJ001wMFbTawvQKfFkNLOxN3pMpkLCykZTLmyeAobyc0c06WjK43/V0K+KiTN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757256489; c=relaxed/simple;
	bh=sIJzEIkbLgOsz7ifbHQhIixtZfb6ETnno/mRvQoHEFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=afczuIq91LLa1gFRvCWgESdBWx78E56SUIDic9szZ9L2B73f9QfqQL8yenbcc0YVZ0kAerglF6kwuAoot8exzLB5aQaG3VANV2Tlx5+TPxUDtTPXTDtCZb2qWBySPiSbiBa8TO/k61H4O5XUgumEMXLbb4jugoNVvIwsnbcu5yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBaNp10F; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBaNp10F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757256487; x=1788792487;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sIJzEIkbLgOsz7ifbHQhIixtZfb6ETnno/mRvQoHEFo=;
  b=XBaNp10FeBLhRvevxSulZomxkds7LyH+GSejozpfdZANQNVu7ecrX37X
   mdHBfx8Cm/E3xg69WlRcNNbL2GU8MzB2dKpVNdn7dQvBg+BujZ6Ho7BFB
   ZrEg0iVmaMduBi/5k+BYF8yx5/OejP8u8pUDq9rBRMRhg1cWoS4cUdhge
   5gimdCLWguzcKNM7g/ZiCmDCC4zFJxtWgPnI3DwdvlWozpWSwKKftUvxs
   ix079jEDTp17qgh/CRHor7HBrRBFXOiHws/6fgRu7xcopnGT6o9Bx1OHu
   ha+hIlsbAMBQ4Cz1iPU1+NpZtlvywHn8pvNXiEUrwcXup9ICKyYVRaTqg
   Q==;
X-CSE-ConnectionGUID: gegR78KGSLud94QKPW+Rfw==
X-CSE-MsgGUID: 1bdUhf01ThmI7ayepgiIFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="47099393"
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; 
   d="scan'208";a="47099393"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 07:48:07 -0700
X-CSE-ConnectionGUID: slmfRcbSSUqNtn4fcS9MpQ==
X-CSE-MsgGUID: JscmUuOpTJW1nJ4VwWzc+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; 
   d="scan'208";a="203529599"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Sep 2025 07:48:06 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvGgW-0002JX-06;
	Sun, 07 Sep 2025 14:48:04 +0000
Date: Sun, 7 Sep 2025 22:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 12/23] dt-bindings: display: tegra: move
 avdd-dsi-csi-supply from VI to CSI
Message-ID: <202509072200.uL95SKjO-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250906135345.241229-13-clamor95@gmail.com>
References: <20250906135345.241229-13-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Mikko Perttunen <mperttunen@nvidia.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Sowjanya Komatineni <skomatineni@nvidia.com>
TO: Luca Ceresoli <luca.ceresoli@bootlin.com>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Prashant Gaikwad <pgaikwad@nvidia.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Dmitry Osipenko <digetx@gmail.com>
TO: "Jonas Schwöbel" <jonasschwoebel@yahoo.de>
TO: Charan Pedumuru <charan.pedumuru@gmail.com>
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: linux-staging@lists.linux.dev

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on robh/for-next clk/clk-next linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/clk-tegra-set-CSUS-as-vi_sensors-gate-for-Tegra20-Tegra30-and-Tegra114/20250906-215750
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20250906135345.241229-13-clamor95%40gmail.com
patch subject: [PATCH v2 12/23] dt-bindings: display: tegra: move avdd-dsi-csi-supply from VI to CSI
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-051-20250907 (https://download.01.org/0day-ci/archive/20250907/202509072200.uL95SKjO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509072200.uL95SKjO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509072200.uL95SKjO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: vi@54080000 (nvidia,tegra210-vi): 'avdd-dsi-csi-supply' does not match any of the regexes: '^csi@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /i2c@7000d000/pmic@3c: failed to match any schema with compatible: ['maxim,max77620']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   	'google,nyan-big-rev9' was expected
   	'google,nyan-big-rev6' was expected
   	'nvidia,tegra186' was expected
   	'nvidia,tegra194' was expected
   	'nvidia,tegra234' was expected
   	'nvidia,p3701-0008' was expected
   	'nvidia,p3834-0008' was expected
   	from schema $id: http://devicetree.org/schemas/arm/tegra.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /: failed to match any schema with compatible: ['nvidia,p3450-0000', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: vi@54080000 (nvidia,tegra210-vi): 'avdd-dsi-csi-supply' does not match any of the regexes: '^csi@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /i2c@7000d000/pmic@3c: failed to match any schema with compatible: ['maxim,max77620']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
