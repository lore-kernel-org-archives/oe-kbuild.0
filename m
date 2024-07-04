Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F44713D243
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 23:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720136401; cv=none; b=A/c+95WvYupeLJxavrxCAdBg4e9ES3bfHUR34HUkDtYXV+6Z0jJDFH/4yN8xkniLnXxPLsCZyZkX3iDwvpN8pz3Xl3OLNefPrXbeS201n7ap2Cdtp7mkbnlVJ+WkzL5ofc7egbwU9CHv+1diEJd3fQ5uubjENDwfxg4wYCcBLUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720136401; c=relaxed/simple;
	bh=TQRv4CHrN0H18lRrOYQ/Epok4/gS6+aMvwg+/Gp/FLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P6rJDidAWRkj5bw+y93VdpnHyKmqsqGjZGxvUO8tgyRZ4Yf2JR0Zrho31ezne+goIOrDJr9CDijNZ2U0+1n6JpQ1nOsGouEOXNF7vx+Okd3xdhz2RwGDeNH/+9mvOGqpKYrekaVHAWB4/KE6eLeV2h0Wv14tjVKNBS9IFrhPBHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hL6lfQCj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hL6lfQCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720136399; x=1751672399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TQRv4CHrN0H18lRrOYQ/Epok4/gS6+aMvwg+/Gp/FLs=;
  b=hL6lfQCjsrNcstwB1/ErMUykje6YTYy1iAx3Alypjmn70Pw38l2h7ugr
   EMTntYQQLOVXuViucD8p/s2iLl+il5OzHXumiTAiqE3u/62DUlMwt6mnn
   j1tUliqQ8QpgVoQGtQMiHkm61G0+9gsPJ8NDen5o/v1e/XHiaCXkAWNju
   +QfHoiH4i+xm6oTaapnfa3FyKYy4DUwG6poOV1o4bjY5LSg/whINE55xQ
   glFpXSdaii6+AsRgGSq1GDBjCFNjLAmEKxn5HXkYRZGrMYvqgwWx9WakP
   oxZUFoti8RY0oa3VyogDDh8VOblmY9SDPc4a8xOtvqSQFGA/1hzxtANbP
   g==;
X-CSE-ConnectionGUID: /yDQOkNqTGqBnjLejKHRJw==
X-CSE-MsgGUID: +5dy/kdVRNOEOSJNrvmA4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="42845758"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="42845758"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 16:39:59 -0700
X-CSE-ConnectionGUID: HlGjCVbcSc+fXj9k0JP4tw==
X-CSE-MsgGUID: HXERPlPXSlSpUxQbwxnx3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="47361842"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jul 2024 16:39:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPW3P-000Rdw-0O;
	Thu, 04 Jul 2024 23:39:55 +0000
Date: Fri, 5 Jul 2024 07:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 8/8] arm64: dts: imx8qm-mek: add usb 3.0 and related
 type C nodes
Message-ID: <202407050734.rym0HQwD-lkp@intel.com>
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
In-Reply-To: <20240701-imx8qm-dts-usb-v4-8-03cdbc8c44b6@nxp.com>
References: <20240701-imx8qm-dts-usb-v4-8-03cdbc8c44b6@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9db27bc55bd8363570c5a259ff4dc77bd6a0b2cd]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/arm64-dts-imx8-add-basic-lvds0-and-lvds1-subsystem/20240702-000741
base:   9db27bc55bd8363570c5a259ff4dc77bd6a0b2cd
patch link:    https://lore.kernel.org/r/20240701-imx8qm-dts-usb-v4-8-03cdbc8c44b6%40nxp.com
patch subject: [PATCH v4 8/8] arm64: dts: imx8qm-mek: add usb 3.0 and related type C nodes
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240705/202407050734.rym0HQwD-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407050734.rym0HQwD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407050734.rym0HQwD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@57240000/interrupt-controller@57240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: pwm@57244000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/pwm/imx-pwm.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: jpegdec@58400000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: jpegenc@58450000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: usb@5b110000: usb@5b120000: 'port', 'usb-role-switch' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: usb@5b120000: 'port', 'usb-role-switch' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: dma-controller@5b810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh'] is too long
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx6q-dma-apbh', 'fsl,imx6sx-dma-apbh', 'fsl,imx7d-dma-apbh']
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx23-dma-apbh', 'fsl,imx23-dma-apbx', 'fsl,imx28-dma-apbh', 'fsl,imx28-dma-apbx']
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: dma-controller@5b810000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@5b000000/dma-controller@5b810000: failed to match any schema with compatible: ['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh']
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@5b000000/nand-controller@5b812000: failed to match any schema with compatible: ['fsl,imx8qxp-gpmi-nand']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
