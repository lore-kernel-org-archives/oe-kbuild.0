Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1794818A6A5
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758465771; cv=none; b=uPfShSKv1KK4bfy2/i9cJiz0XKT8ZuVd1znVWX5cU/2GFOUkrPAr5+sygtD5P8a/e8HLXI4SXPKhp0ORXxquCjeeWfWJ3yFsPGiFLPnM2+NhdE1/FA28T+eXXFkLHneo0cNhQP2zPomJSuV9UBTyhPVaAs0gmt8u+/L0gOHaoz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758465771; c=relaxed/simple;
	bh=G2H5KAOAeL00+QfJABp8IM5EA/x4omOUCglobjTW8vE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J6i7QLJT7nU8Pi1sLFXTTXWmqpmSdBhT+DzjYgLJR2MoYFts4X+D+UbUSr32kD7y8Z7QlH2ePaJHg/OrkuQY8dB1h8aOouWiCeE27He8kU7YYzQm/3/3vUTjHnJhvyllAYpDR7bWwbGxEs6GeBCsVKms+rgEXaMS8FLS4IChb+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORTos2qq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORTos2qq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758465770; x=1790001770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G2H5KAOAeL00+QfJABp8IM5EA/x4omOUCglobjTW8vE=;
  b=ORTos2qqZinlpaaWlirPSyPOYMsReVGaWDaiOH73TKuSyT5lZfMsVwh2
   PJ0EGgn0sNrZNplPzny+0gatO3Xgnrp/MNuz8XuiDNIkcdMOvnL3M3U2e
   88zw+SYiCJbq+DZKakXgtlZzuVbvO6+3/HPFjuO/rDozdibGx8eVDk81l
   aMQGU2z+WVwus3MNHLTMMc4FPtDCxj20mUP0DPhqAhxfD6P4eR245Z3/b
   7T7Xt2rrJHd/q7nSaHc8xYrKWLTeNNvq4YWfSrIia8mjViUs2E8PAde8J
   G5m71R5RdSuSA1Hp1pkganSU5fXKSV6pdRRij3KTw2prmlQ+OnAqgE1pu
   A==;
X-CSE-ConnectionGUID: JJIkdUXZT32whXac9hNh+g==
X-CSE-MsgGUID: Rdt867jGRCidoMjIu5W5zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="71848841"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="71848841"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 07:42:49 -0700
X-CSE-ConnectionGUID: shqoLzVIRjmaPPUsuDXWBA==
X-CSE-MsgGUID: eY5ZkPZKQL6moqbWQIE0tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="176710265"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 21 Sep 2025 07:42:47 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0LH3-000000003af-1dOf;
	Sun, 21 Sep 2025 14:42:45 +0000
Date: Sun, 21 Sep 2025 16:42:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 7/7] arm64: dts: axis: Add ARTPEC-9 Alfred board support
Message-ID: <202509211624.HWsRcUUz-lkp@intel.com>
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
In-Reply-To: <20250917085005.89819-8-ravi.patel@samsung.com>
References: <20250917085005.89819-8-ravi.patel@samsung.com>
TO: Ravi Patel <ravi.patel@samsung.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: jesper.nilsson@axis.com
TO: lars.persson@axis.com
TO: mturquette@baylibre.com
TO: sboyd@kernel.org
TO: alim.akhtar@samsung.com
TO: s.nawrocki@samsung.com
TO: cw00.choi@samsung.com
CC: ravi.patel@samsung.com
CC: ksk4725@coasia.com
CC: smn1196@coasia.com
CC: linux-arm-kernel@axis.com
CC: krzk@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: pjsin865@coasia.com
CC: gwk1013@coasia.com
CC: bread@coasia.com
CC: jspark@coasia.com
CC: limjh0823@coasia.com
CC: lightwise@coasia.com
CC: hgkim05@coasia.com
CC: mingyoungbo@coasia.com
CC: shradha.t@samsung.com
CC: swathi.ks@samsung.com

Hi Ravi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on next-20250919]
[cannot apply to robh/for-next clk/clk-next linus/master v6.17-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ravi-Patel/dt-bindings-clock-Add-ARTPEC-9-clock-controller/20250917-165346
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250917085005.89819-8-ravi.patel%40samsung.com
patch subject: [PATCH 7/7] arm64: dts: axis: Add ARTPEC-9 Alfred board support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2052-20250921 (https://download.01.org/0day-ci/archive/20250921/202509211624.HWsRcUUz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211624.HWsRcUUz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509211624.HWsRcUUz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/exynos/axis/artpec9.dtsi:121.11-268.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb: timer@10040000 (axis,artpec9-mct): compatible: 'oneOf' conditional failed, one must be fixed:
   	['axis,artpec9-mct', 'samsung,exynos4210-mct'] is too long
   	'axis,artpec9-mct' is not one of ['samsung,exynos4210-mct', 'samsung,exynos4412-mct']
   	'axis,artpec9-mct' is not one of ['axis,artpec8-mct', 'google,gs101-mct', 'samsung,exynos2200-mct-peris', 'samsung,exynos3250-mct', 'samsung,exynos5250-mct', 'samsung,exynos5260-mct', 'samsung,exynos5420-mct', 'samsung,exynos5433-mct', 'samsung,exynos850-mct', 'samsung,exynos8895-mct', 'samsung,exynos990-mct', 'tesla,fsd-mct']
   	from schema $id: http://devicetree.org/schemas/timer/samsung,exynos4210-mct.yaml#
   arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb: /soc/timer@10040000: failed to match any schema with compatible: ['axis,artpec9-mct', 'samsung,exynos4210-mct']
   arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb: /soc/pinctrl@141f0000: failed to match any schema with compatible: ['axis,artpec9-pinctrl']
   arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb: /soc/pinctrl@14430000: failed to match any schema with compatible: ['axis,artpec9-pinctrl']
   arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb: /soc/pinctrl@14c30000: failed to match any schema with compatible: ['axis,artpec9-pinctrl']
>> arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb: serial@14c70000 (axis,artpec9-uart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['axis,artpec9-uart', 'samsung,exynos8895-uart'] is too long
   	'axis,artpec9-uart' is not one of ['apple,s5l-uart', 'axis,artpec8-uart', 'google,gs101-uart', 'samsung,s3c6400-uart', 'samsung,s5pv210-uart', 'samsung,exynos4210-uart', 'samsung,exynos5433-uart', 'samsung,exynos850-uart', 'samsung,exynos8895-uart']
   	'axis,artpec9-uart' is not one of ['samsung,exynos2200-uart']
   	'axis,artpec9-uart' is not one of ['samsung,exynos7-uart', 'tesla,fsd-uart']
   	'axis,artpec9-uart' is not one of ['samsung,exynos7885-uart']
   	'axis,artpec9-uart' is not one of ['samsung,exynosautov9-uart', 'samsung,exynosautov920-uart']
   	'axis,artpec9-uart' is not one of ['samsung,exynos7870-uart']
   	'google,gs101-uart' was expected
   	'samsung,exynos4210-uart' was expected
   	'samsung,exynos5433-uart' was expected
   	'samsung,exynos850-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/samsung_uart.yaml#
>> arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb: /soc/serial@14c70000: failed to match any schema with compatible: ['axis,artpec9-uart', 'samsung,exynos8895-uart']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
