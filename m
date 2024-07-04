Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C615A1755B
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 21:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720127243; cv=none; b=XVQuA1lsXk/0DEjUXuy4KNkTURsZu+Vn7dFQsRdIdVLra4uAwdHfA8Fuq8Yq754gGWf6oH8xba10yYGjweNVWD77gzTYDpv3Du7c7J4PJI3nIPbjqzWiN56LXLAu0eLEznWLgJow/CdSzAqguTvgiJlKuxhqOUu+2lpsY1MqowQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720127243; c=relaxed/simple;
	bh=HBCfzISIDHLhPedlq9Aym98FnnSeaPydG89xxq9/+yE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DPN0V+9kHtLFVT8+SfH4LmdG+N9dbeWt03/xfuLFz2V0CIJXD5IxWuRGsp0Aoav3whcHvy7gp8wvnKFZoqVuwGv4fnCLZkwor4OKE0thAQg/kRtJqmls5ihM5YAEH5MTGvy7xrsP03yu3O2FNj7JVmGFGXFHeiFMDb4ki7tUbsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E64K4H8x; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E64K4H8x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720127240; x=1751663240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HBCfzISIDHLhPedlq9Aym98FnnSeaPydG89xxq9/+yE=;
  b=E64K4H8xvTOCzU0ljZjtCNuxHNTj0yanx3NZtn5Ab2WGkpI82QNbbloM
   pSPItmOy0VgD8cSPIHgmlXvePi03auOhXJukaEKGF2xxrfQKW9B6vwV3v
   IOlP+yjFkmzlHUHk+wJaUC+45bLXPHRfaFpK79mfP/Owm2WCLSiux+ZJf
   GpLDC5bcN3m+IUIPo4JKQXLAI5XPw05vsWTRTkAu5vhPWLNkOO9kjCvuz
   UvKQqgv57QYEWBSXkeSGtLJ4lUJzUAp6Cj4GJDuQgf0PNk+1u8fN2nIOD
   ti+qYAUJQjRk4sPpEw9NVwyp+nbcYYjmvwWnH3KbDzueIXzeT82dyLyRW
   g==;
X-CSE-ConnectionGUID: p6G+ZcZxRdCnqZDpP2zl7Q==
X-CSE-MsgGUID: k+0XsIRIQwm9Rva2LZ1piw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21181904"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="21181904"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 14:07:20 -0700
X-CSE-ConnectionGUID: MGrICmRaQ5aZVYhOpU5d/g==
X-CSE-MsgGUID: KMdQ+RZ/QtaTL4gNFBcxDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51126065"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Jul 2024 14:07:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPTfh-000RS8-0c;
	Thu, 04 Jul 2024 21:07:17 +0000
Date: Fri, 5 Jul 2024 05:07:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 6/8] arm64: dts: imx8qm-mek: add pwm and i2c in lvds
 subsystem
Message-ID: <202407050453.j7cfnTH6-lkp@intel.com>
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
In-Reply-To: <20240701-imx8qm-dts-usb-v4-6-03cdbc8c44b6@nxp.com>
References: <20240701-imx8qm-dts-usb-v4-6-03cdbc8c44b6@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9db27bc55bd8363570c5a259ff4dc77bd6a0b2cd]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/arm64-dts-imx8-add-basic-lvds0-and-lvds1-subsystem/20240702-000741
base:   9db27bc55bd8363570c5a259ff4dc77bd6a0b2cd
patch link:    https://lore.kernel.org/r/20240701-imx8qm-dts-usb-v4-6-03cdbc8c44b6%40nxp.com
patch subject: [PATCH v4 6/8] arm64: dts: imx8qm-mek: add pwm and i2c in lvds subsystem
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240705/202407050453.j7cfnTH6-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407050453.j7cfnTH6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407050453.j7cfnTH6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: interrupt-controller@56220000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: interrupt-controller@56220000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@56220000/interrupt-controller@56220000: failed to match any schema with compatible: ['fsl,imx8qxp-irqsteer', 'fsl,imx-irqsteer']
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: pwm@56244000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/pwm/imx-pwm.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: interrupt-controller@56240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: interrupt-controller@56240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
