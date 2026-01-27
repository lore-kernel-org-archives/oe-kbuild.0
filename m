Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7FB26C3B0
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 22:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769553462; cv=none; b=G/cYbQv4LRK6bdMwhEB7xL64LKWplKXXP4r2nTId5SFCdCL/RdB6a7wso01TKacVLrcHPSBQQ+RAl2gHXiTQ7ol+ymVho0kQiSfsYmk7NUBf3R3/RhiJAdYuaH6Os3tEov1GCEXBVLntYX9NL1VV9YM7j1UdRAyZoEOxBppeVig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769553462; c=relaxed/simple;
	bh=VOnBrkEgGhRfL5QvgMXSI6E+IzvhIEh/XDBzIkL8qC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tOaCzYdVH3Je8ZTxhA7U63oZYTXDBV8R8r/ATdpUiuoO2GvENyLm8PBU01b7I1EGbQkmqGlzcxrDUzwZS8bv7YClOTSX/kbAxkFqm1iiyTnsHcv9+6dlzbczwuTehD24Awn+QNtMFyN9ee/4anr01bTsvXxTreW4OOmOoJOzafM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfcRYPIz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfcRYPIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769553462; x=1801089462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VOnBrkEgGhRfL5QvgMXSI6E+IzvhIEh/XDBzIkL8qC0=;
  b=GfcRYPIzWuRMDm1p6nwy2GoPGPmnT8SzAnZj5U2XcRrzE4zoNxA8jhEK
   QlnB1IQ6vy8H7RW0Ynwcm6ouNMllpwZGu8HRTUaWIttqt+yC5XpV51eiG
   AtqSADlRFIStr/KWX7VemxiCvFvuvWlp1IKxJdA6FLgLRG3vDCZs+CThS
   YKAjcS+uKywe9ZWxaYHqZ1yJA1LF9m/fbSEUvN6Fa68xhOIN56PoEGNPJ
   PmMN/AndkaJZ9fNo4/HSM1G3tmmZ7xIPU3kAv0QqoksPofz0elHVvMLZu
   oDSMhDlVYzsK66vpb2AQzd4A2ZhS+iOgo26bYafc9h1F48mrvIrqa9Eyu
   Q==;
X-CSE-ConnectionGUID: awZCPHC9QSGuLG/DTHricQ==
X-CSE-MsgGUID: JMDbpVdvQsOzTUgu/yzRTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74385846"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="74385846"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 14:37:41 -0800
X-CSE-ConnectionGUID: roW9C/4CREmH+QyGLO+V9g==
X-CSE-MsgGUID: aV2Wlu9iQdqu+hUtXGcKUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207709793"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Jan 2026 14:37:39 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkrgn-000000001wf-3jFz;
	Tue, 27 Jan 2026 22:37:37 +0000
Date: Tue, 27 Jan 2026 23:37:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 4/5] dt-bindings: memory: Document Tegra114 External
 Memory Controller
Message-ID: <202601272325.JLrhA2rd-lkp@intel.com>
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
In-Reply-To: <20260126190755.78475-5-clamor95@gmail.com>
References: <20260126190755.78475-5-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Mikko Perttunen <mperttunen@nvidia.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Sumit Gupta <sumitg@nvidia.com>
TO: Dmitry Osipenko <digetx@gmail.com>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk-mem-ctrl/for-next]
[also build test WARNING on tegra/for-next robh/for-next linus/master v6.19-rc7 next-20260127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-memory-Document-Tegra114-Memory-Controller/20260127-045059
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-next
patch link:    https://lore.kernel.org/r/20260126190755.78475-5-clamor95%40gmail.com
patch subject: [PATCH v1 4/5] dt-bindings: memory: Document Tegra114 External Memory Controller
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-2052-20260127 (https://download.01.org/0day-ci/archive/20260127/202601272325.JLrhA2rd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272325.JLrhA2rd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601272325.JLrhA2rd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra132-mc']
>> arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: external-memory-controller@7001b000 (nvidia,tegra132-emc): compatible:0: 'nvidia,tegra132-emc' is not one of ['nvidia,tegra114-emc', 'nvidia,tegra124-emc']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-emc.yaml
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: external-memory-controller@7001b000 (nvidia,tegra132-emc): compatible: ['nvidia,tegra132-emc', 'nvidia,tegra124-emc'] is too long
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-emc.yaml
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: /external-memory-controller@7001b000: failed to match any schema with compatible: ['nvidia,tegra132-emc', 'nvidia,tegra124-emc']
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra124-ahub']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
