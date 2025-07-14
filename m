Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EE118DB02
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 00:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752454304; cv=none; b=czp9+hlKmFLckjTIsuyWyTDGVJZhPuNvLzYMz2FAjYZ/8TePlj3DAUMcZjp1/9kfZOwdzUS0yQ5Y2WVXFXgEsUSUGKU5SsGNKwObFJD55Bfx+o9maueq19u8hHjjNOxzCBTgpEZjycMTgrzcId52Uri/2LWo9+9JIS4onlnTIqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752454304; c=relaxed/simple;
	bh=mfYHsOcLz6ZyyfgcLLOaxjAQcNIuHATs5V+78kxWo+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vl2g8PTUn5UdJG/Eb7fBBWu1weanYq37dN+eWT50SSIjnJm/PzTNf7iVwzHSGH3doWRVfDQqtzDaWTzgYrnF/CXlBw9HYwKkn7OYu9GNud4KdRgtBbYC5YWQYE9+tDvVnkQdceiffd+Mq7I8J8hPNYR3E8GnjoWpxXpiwgAl79M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0LRtY+b; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0LRtY+b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752454302; x=1783990302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mfYHsOcLz6ZyyfgcLLOaxjAQcNIuHATs5V+78kxWo+A=;
  b=J0LRtY+buBOwccRBNx5KZEMwcEte7bp7u19huUfOTIm+1BuXsJO1r/ws
   9qhZFQjTJ86s25par6bvAuKfRz27S9aBa03u7ic5AKBYI42ysD3OidK4g
   hf+xdQkqV7kV91eHZ64UArBhEjW5M6inZu5Ajzit85gi53YHkGaawDnOH
   hBAAWF8h9pwkQd/RERK6AMqbg5DuQDd3maY0tGFlY9rEIEI6bqs/kX8AD
   OzNVzHa+mbTsI9GSfDvrhp8W+BW00zzemCoeRZMFJ9HNvDooyDIxJqqm9
   RwH/YHWEE3Cso82c2KiHOGToGS0Xm/QRicbYDpl/vi+ids7+uWyQPu9AV
   Q==;
X-CSE-ConnectionGUID: MEN5d3HKS7q4IDanWoehfg==
X-CSE-MsgGUID: XDhzFSxmRQOrv4yErxrcEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54613450"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="54613450"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 17:51:41 -0700
X-CSE-ConnectionGUID: gH9kYJeiSYG8loTtQtEkTg==
X-CSE-MsgGUID: g7bCGBWSQ1SXGjMG9aAgFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="187802379"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2025 17:51:40 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ub7Pu-0008OA-1E;
	Mon, 14 Jul 2025 00:51:38 +0000
Date: Mon, 14 Jul 2025 08:51:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 85/85]
 arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: crypto@31400000
 (fsl,imx8qm-caam): 'power-domains' does not match any of the regexes:
 '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
Message-ID: <202507140827.eiLYoXzQ-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   4f25d7f1439f12233768dce853260b8302424d16
commit: 4f25d7f1439f12233768dce853260b8302424d16 [85/85] arm64: dts: imx8q: add camera ov5640 support for imx8qm-mek and imx8qxp-mek
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-051-20250713 (https://download.01.org/0day-ci/archive/20250714/202507140827.eiLYoXzQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507140827.eiLYoXzQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507140827.eiLYoXzQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: crypto@31400000 (fsl,imx8qm-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: crypto@31400000 (fsl,imx8qm-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qm-isi']
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
--
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: crypto@31400000 (fsl,imx8qm-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: crypto@31400000 (fsl,imx8qm-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qm-isi']
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
--
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: crypto@31400000 (fsl,imx8qm-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: crypto@31400000 (fsl,imx8qm-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: crypto@31400000 (fsl,imx8qm-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qm-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qm-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qm-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qm-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qm-job-ring', 'fsl,sec-v4.0-job-ring']
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qm-isi']
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
>> arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-dual.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qm-mipi-csi2', 'fsl,imx8qxp-mipi-csi2']
--
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtb: /bus@58000000/isi@58100000: failed to match any schema with compatible: ['fsl,imx8qxp-isi']
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtb: /bus@58000000/csi@58227000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
   arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtb: /bus@58000000/csi@58247000: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-csi2']
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtb: crypto@31400000 (fsl,imx8qxp-caam): 'power-domains' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@30000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000: 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtb: crypto@31400000 (fsl,imx8qxp-caam): jr@40000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	'fsl,sec-v5.2-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtb: crypto@31400000 (fsl,imx8qxp-caam): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too short
   	['fsl,imx8qxp-caam', 'fsl,sec-v4.0'] is too long
   	'fsl,imx8qxp-caam' is not one of ['fsl,sec-v5.4', 'fsl,sec-v6.0']
   	'fsl,imx8qxp-caam' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	'fsl,sec-v5.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtb: /bus@31400000/crypto@31400000: failed to match any schema with compatible: ['fsl,imx8qxp-caam', 'fsl,sec-v4.0']
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtb: /bus@31400000/crypto@31400000/jr@30000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtb: /bus@31400000/crypto@31400000/jr@40000: failed to match any schema with compatible: ['fsl,imx8qxp-job-ring', 'fsl,sec-v4.0-job-ring']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
