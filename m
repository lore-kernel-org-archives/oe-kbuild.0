Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F5B23BCE7
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Sep 2025 21:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757106552; cv=none; b=rflkX0O1dwYRHgZXUcLddjfa2fWEEPZ6GFOnUDu2UVxExKDtMHuVh5fea5KmIlc0+ELIqegT/GcfZjrh6Ea40e6QhxrHLBqZHCS7e5/scSBC1qYiDMSmnOgFqolHf9twlCMae5k7kka2LSpjXcU30Rbczkbw8ryDEBwCoxR7DZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757106552; c=relaxed/simple;
	bh=tz/oPMZfF2ocvEvYhjCUNBeF6nHBCpxLovuuIvWxiAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D8LuqqqzOf9hqAu6sOQ1YUWCP1Waa6aSlEcSKibTRbXlmeV5wiZhtw6nM1RQrqTCobzUu2EI0sPQzRyTgPSCcHTgTFc/lYUc+E1RXusgC4fvBDWyO1z1IDucgA4xNh0tr/Mkqjh5CVMPNjP2W/qEX7lWG/pyNPEpZxoJTm49u8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EszYYeiU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EszYYeiU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757106547; x=1788642547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tz/oPMZfF2ocvEvYhjCUNBeF6nHBCpxLovuuIvWxiAk=;
  b=EszYYeiUT+U75VoAymPc0lJHr26EQ0FhnNbGAYhQvLktWaUu5MARhDNF
   4hEHH8cNvDt/8Co/VJ0OMMs0bB+RSdSoyvId5L7IwtHheRV7cKFhoiQaG
   YTZ5tJBFJ3390eV91QoWVG1j4m1fCdriVM3okPiHgo7oSiqGD6QXpS7gQ
   WazXIGjq4cQVHghB4H719PPolbrlpaSsBGDycc41ay/bpCx55jQeELJ1l
   2+/ky//3IgJZ22R/t9JmVwo4BZBV6hU8D86pfSXksRmZ6hOOa3qF9GO+g
   jp91FPvEDwjKFi+aoal/hS8Wp6A8P+NAYvk5qTlEbg9YIzfM0yvVaZRcz
   g==;
X-CSE-ConnectionGUID: uEjHBXCCTKmG/ZzWwCLfIA==
X-CSE-MsgGUID: 8pwHNyzwRouq0dlueJPv3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59531455"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59531455"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 14:09:07 -0700
X-CSE-ConnectionGUID: kKobbHK9RrCUx17rKr0GIw==
X-CSE-MsgGUID: Us0bfvDlQneflgod0l7v9A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Sep 2025 14:09:05 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uudg7-0000rD-1E;
	Fri, 05 Sep 2025 21:09:03 +0000
Date: Sat, 6 Sep 2025 05:08:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/9] arm64: tegra: Add VPR placeholder node on Tegra234
Message-ID: <202509060438.W3UGkvvG-lkp@intel.com>
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
config: arm64-randconfig-052-20250905 (https://download.01.org/0day-ci/archive/20250906/202509060438.W3UGkvvG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509060438.W3UGkvvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509060438.W3UGkvvG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 429, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 429, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
   	arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
   		'iommu-addresses' is a required property
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
--
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 416, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 416, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
>> 	arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
   		'iommu-addresses' is a required property
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
