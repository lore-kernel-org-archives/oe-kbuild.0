Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A300317995E
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jan 2025 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736585548; cv=none; b=ToITCXpZK6nn6lRTzKg/D2fYH1jo+Lczu51L4EW1OkVU4SgkwgCdKH0NFzr00urAfWHicZ4b0c9s29A3RYTPpYwXr9j/NFmmlxUEPX1A6K7jlb4mN8p2J1Mtvkh9gL2+fDlxPGrpw7r+9DwQ6Dwznxctt2zAAu8vpJJMABeQ4Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736585548; c=relaxed/simple;
	bh=ZHI/E/z7FqdvU7HH5YQFT5F+zLpU0YdRHR4u141pFvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FAIkWaG4Lg3AZ5w4g3v1/0BfzKW0CuiOt44YAOhCqWwkheYNdoNh7SS20nonDwetdJNa82qXpyokaqEKuXFCn17NiVgt8or/zcK94XVhmbo2k4jzMwnsVn6Uavsm8sI+7LPM+zLFAb3jgL7LWDX7/Ut3+E9c9koTU1/7fSkCtLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZlXZxPp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZlXZxPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736585547; x=1768121547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZHI/E/z7FqdvU7HH5YQFT5F+zLpU0YdRHR4u141pFvk=;
  b=TZlXZxPpKR/oLQKW0RmvO67F5//0oIJY+dvPFNDly9ecqxlloc5IvWRt
   SYKWfCPrIz5aCaiLoIQ6901o2lv9LP+pGdIpfL83188kKANd8UxZmyLR0
   A1VsaYSF+YZ2vYSiEA8IoiLL0whWqekWmHHU6P1+ha3DpFr952q38+8Oa
   ty9/Us6ifgYDo1A8t6Ec6dsBAyZp16j9Qta0L0fSSBvRWNzkJpwxVUrxO
   p+w42y0WV+CSxqf6hQ6T+vtQ6Oj2ferpCGnfQWAcqmG44PtAJUAVw3EJV
   876rI5mnlsUcLYaGh113H6IvVnPC8l4c3/Hd2lS2N1ZIVqiPxRF8HLfpj
   A==;
X-CSE-ConnectionGUID: UFt4e/WaRn6AkzFwfuifWQ==
X-CSE-MsgGUID: 72NfeL8+RoiDw94zfsMl2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="48297143"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="48297143"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 00:52:26 -0800
X-CSE-ConnectionGUID: Tt8mhVTfRLCwdAjCrNuSFQ==
X-CSE-MsgGUID: d3GjsnxiSNWkV+Qhy0SMHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104469507"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jan 2025 00:52:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWXEA-000KPN-0D;
	Sat, 11 Jan 2025 08:52:18 +0000
Date: Sat, 11 Jan 2025 16:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 1/7] dt-bindings: display: mediatek: dpi: add
 power-domains property
Message-ID: <202501111608.ffOe6bPE-lkp@intel.com>
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
In-Reply-To: <20231023-display-support-v5-1-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-1-3905f1e4b835@baylibre.com>
TO: amergnat@baylibre.com
TO: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Jitao Shi <jitao.shi@mediatek.com>
TO: CK Hu <ck.hu@mediatek.com>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Simona Vetter <simona@ffwll.ch>
CC: dri-devel@lists.freedesktop.org
CC: linux-mediatek@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Alexandre Mergnat <amergnat@baylibre.com>
CC: Fabien Parent <fparent@baylibre.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9d89551994a430b50c4fffcb1e617a057fa76e20]

url:    https://github.com/intel-lab-lkp/linux/commits/amergnat-baylibre-com/dt-bindings-display-mediatek-dpi-add-power-domains-property/20250109-002152
base:   9d89551994a430b50c4fffcb1e617a057fa76e20
patch link:    https://lore.kernel.org/r/20231023-display-support-v5-1-3905f1e4b835%40baylibre.com
patch subject: [PATCH v5 1/7] dt-bindings: display: mediatek: dpi: add power-domains property
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-051-20250109 (https://download.01.org/0day-ci/archive/20250111/202501111608.ffOe6bPE-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111608.ffOe6bPE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501111608.ffOe6bPE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: mutex@1400e000: compatible:0: 'mediatek,mt7623-disp-mutex' is not one of ['mediatek,mt2701-disp-mutex', 'mediatek,mt2712-disp-mutex', 'mediatek,mt6795-disp-mutex', 'mediatek,mt8167-disp-mutex', 'mediatek,mt8173-disp-mutex', 'mediatek,mt8183-disp-mutex', 'mediatek,mt8186-disp-mutex', 'mediatek,mt8186-mdp3-mutex', 'mediatek,mt8188-disp-mutex', 'mediatek,mt8188-vpp-mutex', 'mediatek,mt8192-disp-mutex', 'mediatek,mt8195-disp-mutex', 'mediatek,mt8195-vpp-mutex', 'mediatek,mt8365-disp-mutex']
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: mutex@1400e000: compatible: ['mediatek,mt7623-disp-mutex', 'mediatek,mt2701-disp-mutex'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: mutex@1400e000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /mutex@1400e000: failed to match any schema with compatible: ['mediatek,mt7623-disp-mutex', 'mediatek,mt2701-disp-mutex']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: rdma@14012000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,rdma.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /dpi@14014000: failed to match any schema with compatible: ['mediatek,mt7623-dpi', 'mediatek,mt2701-dpi']
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /dpi@14014000: failed to match any schema with compatible: ['mediatek,mt7623-dpi', 'mediatek,mt2701-dpi']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: hdmi@14015000: compatible: ['mediatek,mt7623-hdmi', 'mediatek,mt2701-hdmi'] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,hdmi.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: hdmi@14015000: 'cec' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,hdmi.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: hdmi@14015000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,hdmi.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: cec@10012000: compatible: ['mediatek,mt7623-cec', 'mediatek,mt8173-cec'] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,cec.yaml#
--
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: mutex@1400e000: compatible:0: 'mediatek,mt7623-disp-mutex' is not one of ['mediatek,mt2701-disp-mutex', 'mediatek,mt2712-disp-mutex', 'mediatek,mt6795-disp-mutex', 'mediatek,mt8167-disp-mutex', 'mediatek,mt8173-disp-mutex', 'mediatek,mt8183-disp-mutex', 'mediatek,mt8186-disp-mutex', 'mediatek,mt8186-mdp3-mutex', 'mediatek,mt8188-disp-mutex', 'mediatek,mt8188-vpp-mutex', 'mediatek,mt8192-disp-mutex', 'mediatek,mt8195-disp-mutex', 'mediatek,mt8195-vpp-mutex', 'mediatek,mt8365-disp-mutex']
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: mutex@1400e000: compatible: ['mediatek,mt7623-disp-mutex', 'mediatek,mt2701-disp-mutex'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: mutex@1400e000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /mutex@1400e000: failed to match any schema with compatible: ['mediatek,mt7623-disp-mutex', 'mediatek,mt2701-disp-mutex']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: rdma@14012000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,rdma.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /dpi@14014000: failed to match any schema with compatible: ['mediatek,mt7623-dpi', 'mediatek,mt2701-dpi']
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /dpi@14014000: failed to match any schema with compatible: ['mediatek,mt7623-dpi', 'mediatek,mt2701-dpi']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: hdmi@14015000: compatible: ['mediatek,mt7623-hdmi', 'mediatek,mt2701-hdmi'] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,hdmi.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: hdmi@14015000: 'cec' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,hdmi.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: hdmi@14015000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,hdmi.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: cec@10012000: compatible: ['mediatek,mt7623-cec', 'mediatek,mt8173-cec'] is too long
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,cec.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
