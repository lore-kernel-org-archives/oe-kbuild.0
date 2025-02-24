Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB4912F5A5
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Feb 2025 14:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407089; cv=none; b=PpoTQyDUZE/8lKKTmsRbwhdmeFI+LPIHxgcHSQP88+x9SozSQS1QajyIgHlerNXMu4vBC7lcfi9lYg2MqgMfBOMXqGBdhngmbwj4xlrvXGyRuOacn8NW2UMFgWbK7Sci8kd51fpaQNiC187MKGze4oui+WMbt0J3jIvJVC0Wlu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407089; c=relaxed/simple;
	bh=o5yuJx7RRqBWlw0LcLyc53ylRpomAe91yCv8Y0QSQ9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BOAvygu7hYG4OTz0RGllos8Gbz5ZRFR3oKsWJ9Oz/o4FHVl0cVxAwxumje2qhysZjC6P8Ro/dzOoIi7a3hdeeQI7g7e5CD4i7LESQ0jykGqbjyaHfgbYrxX5ERR9skGkNCfKlKrHI+/ewGEvKSxplcGcQ0HEmpjcGNHB1Wa6b1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxiR2T9I; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxiR2T9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740407087; x=1771943087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o5yuJx7RRqBWlw0LcLyc53ylRpomAe91yCv8Y0QSQ9k=;
  b=cxiR2T9IVSxPoNAhmlwdk+s+BEV0wwqz3jOxj9CZpwVnk2s0k7qyMYK9
   cdegdnCAzVS31RrBwMIYVzQ+9ZZk50sik8PUty2xXYibikLYPHylf87Pn
   r25BrcIXcCfzWcO0K/VtdVrYreCiOAoX5T9iiiK3kzFGaFTen91zSZfNr
   aBIhwMtz/ccOEC3pAFs/kQQyVtPNMIhPHaOJCjQVHsK55bWvjY5hbt74C
   aAaIFFBqWhofNsojwOgsseZ7n4/89TwXBstyHXMY9k4eeO4Eqq/3SP34X
   8OIPsV5iOPF9cXN2+FhzTeDEnM0m+wdf8MRshn45UkHXP5KbMgWzV3MRm
   g==;
X-CSE-ConnectionGUID: NybRELinQ2eyxNePMPMocQ==
X-CSE-MsgGUID: hxrOUibRSH6p4viAIyDzYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41179323"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="41179323"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 06:24:47 -0800
X-CSE-ConnectionGUID: m854WdSuSPiL0+y3VI38iQ==
X-CSE-MsgGUID: xaz+Nkl7Q46BSVQaS/iF1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115911726"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Feb 2025 06:24:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmZO0-0008SV-0H;
	Mon, 24 Feb 2025 14:24:44 +0000
Date: Mon, 24 Feb 2025 22:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 3/3]
 Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml: fsl,liodn:
 multiple incompatible types: uint32-array
Message-ID: <202502242202.5B4OKs2C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml: fsl,liodn: multiple incompatible types: uint32-array"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   578bcc20c07e88c093e63192c838b7245b3bfc01
commit: 304a90c4f75dadd0f80d0b27e61e8ed04b36ad95 [3/3] dt-bindings: soc: fsl: Convert q(b)man-* to yaml format
:::::: branch date: 3 days ago
:::::: commit date: 8 months ago
config: arm-randconfig-052-20250221 (https://download.01.org/0day-ci/archive/20250224/202502242202.5B4OKs2C-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502242202.5B4OKs2C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502242202.5B4OKs2C-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml: ti,x-plate-ohms: missing type definition
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
   Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml: voltage-ranges: multiple incompatible types: uint32-matrix
   Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml: voltage-ranges: multiple incompatible types: uint32-array
>> Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml: fsl,liodn: multiple incompatible types: uint32
>> Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml: fsl,liodn: multiple incompatible types: uint32-array
>> Documentation/devicetree/bindings/soc/fsl/fsl,bman.yaml: fsl,liodn: multiple incompatible types: uint32-array
>> Documentation/devicetree/bindings/soc/fsl/fsl,qman.yaml: fsl,liodn: multiple incompatible types: uint32-array
   Warning: Duplicate compatible "mediatek,mt6795-topckgen" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/mediatek,mt6795-sys-clock.yaml#
   	http://devicetree.org/schemas/clock/mediatek,topckgen.yaml#
   Warning: Duplicate compatible "mediatek,mt6795-apmixedsys" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/mediatek,mt6795-sys-clock.yaml#
   	http://devicetree.org/schemas/clock/mediatek,apmixedsys.yaml#
   Warning: Duplicate compatible "dallas,ds75" found in schemas matching "$id":
   	http://devicetree.org/schemas/trivial-devices.yaml#
   	http://devicetree.org/schemas/hwmon/lm75.yaml#
   Warning: Duplicate compatible "dallas,ds1775" found in schemas matching "$id":

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
