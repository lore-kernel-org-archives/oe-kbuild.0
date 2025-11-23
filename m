Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E48F1A285
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Nov 2025 06:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763878491; cv=none; b=WCFuDhl06wDnnKVwsYrUle4LuUycerON3gtf/1L8qxGeJm+/eGbPDmYpTwkya7nge5+7eXpVTxJq3gzqPHLHPDospCk689j6m7Lwu6IfTg48nyWoPFskhVta2hokpelQAGlA0sDwVoqdnnrY5dUNvMQp0Pbcy5GWhUlmhu0a4+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763878491; c=relaxed/simple;
	bh=MtW+bfdcmxQhIahJTFbn3smJIRBhArx+mIeURsut5wE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cAKhRRzQWczjP7gnrdpFS7SNhpm8a4RBILVOd7bOLtVb7wPBAA4wXGWzkaxyt3kcLF15AOoYm3fgzcT/P9Glyr4E77nQonsA8nHdrUVFUf2Ph8wpGmas5ywznpxi3V8tD6DgkX3JM2pHgN5lxKMXVQTIKlnUDPtvI/VllALrqAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TBeCf3sD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBeCf3sD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763878490; x=1795414490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MtW+bfdcmxQhIahJTFbn3smJIRBhArx+mIeURsut5wE=;
  b=TBeCf3sDMV6snNkbdC3zNINkVo2i/+MejwlMURg7nIQYaMEQOWlQq3TN
   qUiaVadfK8aT0245sLicZm01DuKNN9BmDZx1qLDfCcFBjBtHO0estOKwi
   +KM/8FMskHgQnm8OIJvxwnyEvdoMYO5OKbKN0mJ9fyFGvmVINZeUWGH5Z
   uVpwJNb5bE158LsuwcKe/Mglih8ABb+cPsXjruJ+oVoNnqHqquVZNMY+R
   /ohwFyt8jlxNw/jAgxCjmvjJ8amGFZZ0gUXaDg6GZI6Zzxp9oxLHI/Tuy
   atLiR3tV5mbEB7eoallzd2/xNNmxDlJeoegyoQiPH9csNuJ3QL2knsQhm
   A==;
X-CSE-ConnectionGUID: UaiboshCQYaeBZ5MCGsUsw==
X-CSE-MsgGUID: bhJ8K3PfQz2bzWJ8ywWFQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="83303605"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="83303605"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 22:14:49 -0800
X-CSE-ConnectionGUID: SjsqZeVDQr6GDHdrelRpcw==
X-CSE-MsgGUID: YRcXCTbBRnqyvizaGzJrqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="192290440"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 22 Nov 2025 22:14:48 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vN3Mz-000000002LF-2i5K;
	Sun, 23 Nov 2025 06:14:45 +0000
Date: Sun, 23 Nov 2025 07:14:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:k3/dt-2 47/47] arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb:
 /bus@f0000/bus@a80000/pinctrl@4084000: failed to match any schema with
 compatible: ['ti,am62l-padconf', 'pinctrl-single']
Message-ID: <202511230717.PXzTVnpR-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Vignesh Raghavendra <vigneshr@ti.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git k3/dt-2
head:   56baa9190988f35d53b1479a87c1bf44f6c979c6
commit: 56baa9190988f35d53b1479a87c1bf44f6c979c6 [47/47] arm64: dts: ti: k3-am62l: Fix unit address of cbass_wakeup
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20251122 (https://download.01.org/0day-ci/archive/20251123/202511230717.PXzTVnpR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.9.dev20+g7033eb7ce
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230717.PXzTVnpR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511230717.PXzTVnpR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: pinctrl@4084000 (ti,am62l-padconf): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am62l-padconf', 'pinctrl-single'] is too long
   	'ti,am62l-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	'ti,am62l-padconf' is not one of ['ti,am437-padconf', 'ti,am654-padconf', 'ti,dra7-padconf', 'ti,omap2420-padconf', 'ti,omap2430-padconf', 'ti,omap3-padconf', 'ti,omap4-padconf', 'ti,omap5-padconf', 'ti,j7200-padconf']
   	'ti,am62l-padconf' is not one of ['marvell,pxa1908-padconf']
   	'pinconf-single' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml
>> arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: /bus@f0000/bus@a80000/pinctrl@4084000: failed to match any schema with compatible: ['ti,am62l-padconf', 'pinctrl-single']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
