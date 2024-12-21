Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807DB1DE3D1
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 23:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734823139; cv=none; b=VtYtvWTLuh0rcMg8csV+k75DTuVSpFpiNKCN5Cxrd70cOEg80RIsNP1nBjdoXgPdxN0dsukgojctvj/8iKpYOw8iwhVLcSjgqBf5I+MVHFAnzPCjbgSNsV2aldm1ISBkfEW+TV+cNumVjYUHO7NmbTXMBe7P4LCATq8uh8W9GPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734823139; c=relaxed/simple;
	bh=CA+Hgo89/tpl/IdaTSOXv/j1vo1txF/2NlBR5/NUyxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pyGhbcI2sk4Llorx3n8zcvZ4U2UnN8jNECtBVdjI6yZpNHFk67SNtEjpuq1vdETvgRgtig196vlT4IX+fxtsJEzXC1txax5c4wivUDO2mnrAt+NYIIpl6SVQ7MDnrC7LxuPnEVSH3mIaiIOv/JGh/yIT27KnS29qeoOt3DE766k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fv6q7goK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fv6q7goK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734823137; x=1766359137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CA+Hgo89/tpl/IdaTSOXv/j1vo1txF/2NlBR5/NUyxM=;
  b=fv6q7goKhjsN7oiXPuKTjTE0yjIOJWkkaPNVgaSdSxpdNIYYbsQdlp+G
   BuPkHwFEc1EmwrWxIwUez/xn2BXLlZnwJKrw3gNUz5RvIB4L+fXsPKb6I
   I4s/RhbNUeiMcWQEBg31De/fzVVAmhjRdPvNFcS4TdiLnfgylmNZyaQ6J
   qDjdv3Iz5/i5+WppFm5qRQpXkeSCQLi100ufqq3L/dK9RI0DoCgVbaTwx
   WoaqboeYJUVEOTOc7qt05+QdgEkONiayeX76J8wVJzmkes0sTJgmpD5W4
   B7nBXKAz9PSa5wpUkrd6Xp3egD3duXpdPskJ3jY8iKd+mtIpTz1TVCGHR
   Q==;
X-CSE-ConnectionGUID: cK45PJ42QpW4+P1SlwD5mQ==
X-CSE-MsgGUID: 95M/TgBTR2G9xhVu3KHH/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46715990"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="46715990"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 15:18:56 -0800
X-CSE-ConnectionGUID: Wj7WvcBMRHqqGwMTDzz7wg==
X-CSE-MsgGUID: pYKyzbtbRomP9/WD3JP0Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98732032"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Dec 2024 15:18:55 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP8kG-0002YZ-2g;
	Sat, 21 Dec 2024 23:18:52 +0000
Date: Sun, 22 Dec 2024 07:18:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: add header for PCA9555 GPIO
 extender bindings on some Rockchip-based devices
Message-ID: <202412220741.TlsssVBy-lkp@intel.com>
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
In-Reply-To: <20241215032507.4739-3-shimrrashai@gmail.com>
References: <20241215032507.4739-3-shimrrashai@gmail.com>
TO: Shimrra Shai <shimrrashai@gmail.com>
TO: linux-kernel@vger.kernel.org
CC: conor+dt@kernel.org
CC: devicetree@vger.kernel.org
CC: heiko@sntech.de
CC: krzk+dt@kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-pm@vger.kernel.org
CC: linux-rockchip@lists.infradead.org
CC: robh@kernel.org
CC: Shimrra Shai <shimrrashai@gmail.com>

Hi Shimrra,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on robh/for-next linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shimrra-Shai/arm64-dts-rockchip-add-DTs-for-Firefly-ITX-3588J-and-its-Core-3588J-SoM/20241215-112831
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241215032507.4739-3-shimrrashai%40gmail.com
patch subject: [PATCH v3 2/3] dt-bindings: pinctrl: add header for PCA9555 GPIO extender bindings on some Rockchip-based devices
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-052-20241220 (https://download.01.org/0day-ci/archive/20241222/202412220741.TlsssVBy-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220741.TlsssVBy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412220741.TlsssVBy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'google,veyron-minnie-rev2' was expected
   	'google,scarlet-rev14-sku0' was expected
   	'google,scarlet-rev14-sku7' was expected
   	'google,scarlet-rev15-sku6' was expected
   	'google,veyron-speedy-rev7' was expected
   	'google,veyron-tiger-rev6' was expected
   	'rockchip,rk3399pro' was expected
   	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: /: failed to match any schema with compatible: ['firefly,itx-3588j', 'firefly,core-3588j', 'rockchip,rk3588']
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: /: failed to match any schema with compatible: ['firefly,itx-3588j', 'firefly,core-3588j', 'rockchip,rk3588']
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: display-subsystem: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-drm.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: pmic@0: Unevaluated properties are not allowed ('rk806_dvs1_pwrdn' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: pcie@fe170000: Unevaluated properties are not allowed ('rockchip,skip-scan-in-resume' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
