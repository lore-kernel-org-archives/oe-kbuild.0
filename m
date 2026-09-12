Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8428D17A586
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Sep 2026 04:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789187748; cv=none; b=e+3fpJtVnx9XUjbtNlQ+9AtC41yc++NeTFGlqpStX/3tgbIMULUZHNjnDazHOzMQNIe9xm0GAh4dvY7k2tms2zlCp4tjmrd4oJTu6uMlpNWojZc/ZTBw607k7dDIaPN+0QN/nrFSoSzwALG8MclreA3aZoXasSbaMwZ8ApNaDnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789187748; c=relaxed/simple;
	bh=WUmuErsJh+9dNuOfXb3C0yxr+mthcjVoVDv/OiGhxkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VOz8WN462ouKHTuUjZTLGY05aVHggvyl39oBrpzrYpB/KU+IMMcmCHq7eRlis7W+3YuEVt+YV5USTEXRvmCrzA7n6biFF+7BZ/6a1giaXP/J7T3uVgOjasYPaqoD0BAvfeEDLTWILeGRDS6DnEcCyozBATZ9vnuC5nlMEnJD51w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EaDPx5mM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EaDPx5mM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789187747; x=1820723747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WUmuErsJh+9dNuOfXb3C0yxr+mthcjVoVDv/OiGhxkI=;
  b=EaDPx5mMBpyKmxXWXFnS/5jbDAxVoSw3FmiQMf9Y/YW2OSRBUNVMEtd6
   o/Uly6j/Cn9o1lGci1k/8VVkf5xLzhMcKchtSvs4oGRk9fNPVtTZ0atyD
   pjFMCbhwA6iW+ZDOSEQisrtDGu8f8B3D96jlJI513oGygwyhZC1u87ie4
   LqGL9jokzXSB+4w8KH2rtes4dSPIxL024rXI9JhX2RkRXm2vXkXdrQOoo
   aOV7e4T/HFCR0j9YGkwW+Ev3QTX+o0VArP82iE34YkD++AufZOh1JAvJs
   bfC5qzp0M8vuXWZOYGNBEX7QZWakdGQM99FIKXK/ykaKILcnNh4MVd8ha
   w==;
X-CSE-ConnectionGUID: DoUA4M8XRaqn++Kkvl2LxQ==
X-CSE-MsgGUID: TW0jdQztQKC9yX1/jaCSXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89855653"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89855653"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 21:35:46 -0700
X-CSE-ConnectionGUID: TuurDWFoRseKsmb0IuS8/w==
X-CSE-MsgGUID: InjxwmyETGmwuqlAWS1RzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="277360662"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Sep 2026 21:35:45 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5FSo-000000000yN-2LoC;
	Sat, 12 Sep 2026 04:35:42 +0000
Date: Sat, 12 Sep 2026 06:35:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm: sunplus: add Tibbo LTPP3G2 board support;
 update defconfig
Message-ID: <202609120633.W13Gq8MD-lkp@intel.com>
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
In-Reply-To: <20260902104545.67794-3-ag@ffroot.co.za>
References: <20260902104545.67794-3-ag@ffroot.co.za>
TO: Andrew Gaylard <ag@ffroot.co.za>
TO: qinjian@cqplus1.com
TO: linux-arm-kernel@lists.infradead.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linux@armlinux.org.uk
CC: devicetree@vger.kernel.org
CC: Andrew Gaylard <ag@ffroot.co.za>

Hi Andrew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm/for-next arm/fixes arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next soc/for-next linus/master shawnguo/for-next v7.3-rc2 next-20260910]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Gaylard/arm-dts-sunplus-add-peripheral-device-nodes-to-sp7021-dtsi/20260902-124544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260902104545.67794-3-ag%40ffroot.co.za
patch subject: [PATCH 2/2] arm: sunplus: add Tibbo LTPP3G2 board support; update defconfig
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm-randconfig-2053-20260907 (https://download.01.org/0day-ci/archive/20260912/202609120633.W13Gq8MD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120633.W13Gq8MD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609120633.W13Gq8MD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/sunplus/sunplus-sp7021-demo-v3.dtb: otp@af00 (sunplus,sp7021-ocotp): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/sunplus,sp7021-ocotp.yaml
>> arch/arm/boot/dts/sunplus/sunplus-sp7021-demo-v3.dtb: ethernet@108000 (sunplus,sp7021-emac): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/sunplus,sp7021-emac.yaml
>> arch/arm/boot/dts/sunplus/sunplus-sp7021-demo-v3.dtb: ethernet@108000 (sunplus,sp7021-emac): clocks: [[4, 61], [4, 67], [4, 66], [4, 68]] is too long
   	from schema $id: http://devicetree.org/schemas/net/sunplus,sp7021-emac.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
