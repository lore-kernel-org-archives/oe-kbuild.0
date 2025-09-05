Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D243469F7
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Sep 2025 11:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757072594; cv=none; b=sZd8k3p7dj888xqbYq/QJ0bDD1eYbk3trd5lN5bN0GT9v3NXfEKRcfxU+mTJtGodI6h8gdnvQR2KPf1mbQtOjSwTr/ag52AoYxsMOAucRPw5LLMizab7ZfBlkba7y81NeYyPXh/JZVJMBRUjNfKuxxAiZEdjl2wMJgHqB3KZJ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757072594; c=relaxed/simple;
	bh=FvNitdS93A92Asa8ynVgOz+ySW1yAUC5D2e5TlrXc6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HMQIRfdpIxOzyyX2wF7/rmcVVGFchErkoSpllnm20VudwgFoIDweJYL6MUfkKp+KDHaXHa7nTIv6FX8jRkvFKi+8W+LMioXR16QxgNFsSZpxFZ/w72Xfsf58wKbglLSaIIuLNxgdThmgc17z8NbBF/wcfehKCBVoRjaLHQFCj5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3VmX5Lh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3VmX5Lh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757072592; x=1788608592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FvNitdS93A92Asa8ynVgOz+ySW1yAUC5D2e5TlrXc6g=;
  b=J3VmX5LhSHvspuiag0MhYQu3cKDlbzVlmKUIyTRJHR8fbZWl+nKV6q7D
   JYOk6Qx3kELE1lyp8gU5+1Mv0KtDcVSJOPP+HkSdvAOAx7KWg/8fMqVEe
   ObSe6yC0oWLqNUgaXoEM3xFIDu8upTRByRjpI3DAcWup8Gk4b+Mg8Fo9U
   uYsqlHgZwLABDJcPhtLJCl38CfY1oXUuBNJncpVy9zgjlGu8NEvFiwoYx
   QBCEZcvILC6mfTVxRczOjBafWhsqe9EwKFPoeFAjJlvcZaEfA/AC+zlqD
   GfjxpJccK1OMotI6HiTF0psa2kzy2IUi9WtickQVKe73oWnynON0sqWxG
   w==;
X-CSE-ConnectionGUID: zuWGNjzkQoivcA2xRlGu9Q==
X-CSE-MsgGUID: Oyq0yMHsSPedVVGvd30hZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59343248"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59343248"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 04:43:10 -0700
X-CSE-ConnectionGUID: ij0qiO8JR6qEH9ZANvi8Zg==
X-CSE-MsgGUID: lJL13bnFRbaOwemmlTu3OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="176486065"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Sep 2025 04:43:09 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuUqQ-0000NL-2X;
	Fri, 05 Sep 2025 11:43:06 +0000
Date: Fri, 5 Sep 2025 19:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/9] arm64: tegra: Add VPR placeholder node on Tegra234
Message-ID: <202509051946.VuKb6kNh-lkp@intel.com>
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
In-Reply-To: <20250902154630.4032984-7-thierry.reding@gmail.com>
References: <20250902154630.4032984-7-thierry.reding@gmail.com>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Sumit Semwal <sumit.semwal@linaro.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Brian Starkey <Brian.Starkey@arm.com>
CC: John Stultz <jstultz@google.com>
CC: "T.J. Mercier" <tjmercier@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Hildenbrand <david@redhat.com>
CC: Mike Rapoport <rppt@kernel.org>
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linaro-mm-sig@lists.linaro.org

Hi Thierry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250902]
[also build test WARNING on v6.17-rc4]
[cannot apply to robh/for-next akpm-mm/mm-everything tegra/for-next linus/master v6.17-rc4 v6.17-rc3 v6.17-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Reding/dt-bindings-reserved-memory-Document-Tegra-VPR/20250902-235038
base:   next-20250902
patch link:    https://lore.kernel.org/r/20250902154630.4032984-7-thierry.reding%40gmail.com
patch subject: [PATCH 6/9] arm64: tegra: Add VPR placeholder node on Tegra234
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250905 (https://download.01.org/0day-ci/archive/20250905/202509051946.VuKb6kNh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509051946.VuKb6kNh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509051946.VuKb6kNh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
>> 	arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
   		'iommu-addresses' is a required property
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
--
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 439, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 439, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
>> 	arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
   		'iommu-addresses' is a required property
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: audio-codec@1c (realtek,rt5640): realtek,jack-detect-source: 7 is not one of [0, 1, 2, 3, 4, 5, 6]
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: audio-codec@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks', 'port', 'realtek,jack-detect-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
--
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 429, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 429, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
>> 	arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
   		'iommu-addresses' is a required property
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: audio-codec@1c (realtek,rt5640): realtek,jack-detect-source: 7 is not one of [0, 1, 2, 3, 4, 5, 6]
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: audio-codec@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks', 'port', 'realtek,jack-detect-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
--
>> arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 416, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 416, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
   	arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
   		'iommu-addresses' is a required property
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
