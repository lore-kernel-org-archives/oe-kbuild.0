Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2A32FB082
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Sep 2025 15:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757086595; cv=none; b=iegQQor+x4mod6qX1IPcTIRLsKilVZrJVsK9R+EwQP9YL15/zVDI7grn0Ay61NxbZKfSThE1LxNrJ6iCZTUPjDSGV+PKLgJEeF6X9m1MUB355wT7/R/E4wcO46jsXpQYW6m8jY3Q4/eCkmdula4T8jj/hYqnhv8uJbMHAfdf/qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757086595; c=relaxed/simple;
	bh=SHZR0MSzWJzn3Q50sKt7Vk8jc8JH2plX1CAl3q4gT2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RiQQgBP3UJDT0RsMN+jBsVY08AqH5IYgY+ymJgzZFuRso6WglsfgQcJ3cruw/zU+vyXoIYJWr0grg58gou73S8vPrC8FJrpmeFc/ymWCJgR0n1NbbL8L2fyWb0F/OeB3hEsjttx/mOINTybP5bAl6fqCAY3DjC0eMflEADsEPVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZeQEi8A; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZeQEi8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757086591; x=1788622591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SHZR0MSzWJzn3Q50sKt7Vk8jc8JH2plX1CAl3q4gT2g=;
  b=cZeQEi8A/4IKMQCTthIgfes4KURmwf48mAMMpWwkYDH+K/oQkGDJI90l
   t6Nf7ymqoM78qLhvR00zfDvAAQcd42b35aVwIJUkzbri6wT3GlzkgHlDt
   SoUHaK+7I/g/bcu3UQB9aiXE0QEkWpNUKnliKV9BB6wOcXlfGl14zZ7PE
   yftbACUNXrqrlKtT7Qg2v/TBJCQrX1XoEXkndt+Lin3IUFGE+RAe4HlKu
   AT9qW2/8oRNmue77jusP1OlyksNrSfRjXHi8/XNVhuSBl4Ez0u0tODDgc
   DJjkymHTgiL6L8qx2GF5FrJjlBFn73D36eVgbIAxb5cUM+KGYn5aMbCfi
   Q==;
X-CSE-ConnectionGUID: v5UP1rYrTJO05BITzolq1w==
X-CSE-MsgGUID: C3PmuDcVQgm8Dwc8SO+4jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63269903"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63269903"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 08:36:30 -0700
X-CSE-ConnectionGUID: gxDiYwwuR2ysCe/23mnbbA==
X-CSE-MsgGUID: P7mtNU7+RAChFd+fyOpmHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="195850563"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2025 08:36:31 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuYUG-0000ZT-2U;
	Fri, 05 Sep 2025 15:36:28 +0000
Date: Fri, 5 Sep 2025 23:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 7/9] arm64: tegra: Add GPU node on Tegra234
Message-ID: <202509052342.hXQoLkrk-lkp@intel.com>
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
In-Reply-To: <20250902154630.4032984-8-thierry.reding@gmail.com>
References: <20250902154630.4032984-8-thierry.reding@gmail.com>
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
patch link:    https://lore.kernel.org/r/20250902154630.4032984-8-thierry.reding%40gmail.com
patch subject: [PATCH 7/9] arm64: tegra: Add GPU node on Tegra234
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250905 (https://download.01.org/0day-ci/archive/20250905/202509052342.hXQoLkrk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509052342.hXQoLkrk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509052342.hXQoLkrk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   		'iommu-addresses' is a required property
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,ga10b']
--
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb3-1: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): phy-mode: ['10gbase-r'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,ga10b']
--
   	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,ga10b']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
