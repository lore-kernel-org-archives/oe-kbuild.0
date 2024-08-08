Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFDF4A1E
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Aug 2024 22:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723157924; cv=none; b=j06fXt39vT0C9ANIbOXsJonlmvfO2+x24JnQOnZ4IOYdnjvGplFMzYoWP74pblGQfjIK8xXgngtqEbxHDtUu0VpS6R8/Cc7btRZTiqDjz49I6kY76dYYwxPOUlSG1xYyvl+TugXAOnf6plZijAZEU1PHZJWCDu//yPJ6dlUIQ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723157924; c=relaxed/simple;
	bh=g/bckn9ok7GIvMjcFp3WG7/1xzfCZZ/6i0xIi7EVJf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qVmoBJ8+c9kF25GA2+yFJ6ndk9kteh0Ew/RALD16NnaS7Ni4Zx976sPit+1wn5XOwhGnm6blEGwEkqJGR5FjJ/TIzif6MscXjVmKG63WgaE5fgzlac1VWt62C97y0h21gkbCEBAAUH2KPMR1lL3TLzHPkkKWZLxBZ2DmZQ5xvoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmfteCOi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmfteCOi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723157922; x=1754693922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g/bckn9ok7GIvMjcFp3WG7/1xzfCZZ/6i0xIi7EVJf8=;
  b=TmfteCOi/oQBX/CtOZz89xhAB+PtTIe8gXJXPlaCTDFD4/jszRfR/4qN
   CEbXo42szHPv70kGRJrYh1FyCng55ToaZqQYP5orAdqsvupChruu4LrKw
   lJ04Mp9H6PuklS68TjKB/mUPmHC0gJ7RyhEXEo9c7VMHqGRHMFQxWNNbe
   yXka4DHCO8yQVlcWJwxLrHvoRYzclkHrDdfEDs1EH+McQdq6tYbUQFpLT
   t2JaGGQ5RKijz9Z+TidIWrtxkJgBbX+VA3/CIdK2FNZNRTt5Vq/shNgp5
   TXntFzHNVUZmIQfEJ6QNHMe7eEBGnyEFc69H+Kcz9DdN3VlSOsYmgRVim
   Q==;
X-CSE-ConnectionGUID: BKS0tukeTneU1KCLkQHi8Q==
X-CSE-MsgGUID: PxGnfkRGQnebOcW+Pi9fBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="20976133"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="20976133"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 15:58:41 -0700
X-CSE-ConnectionGUID: hl1mhRazSg+Xa+FHr/k+aA==
X-CSE-MsgGUID: SfzXm51lSPujBb2dZaqU5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="62014059"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 08 Aug 2024 15:58:40 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scC5e-0006b4-0s;
	Thu, 08 Aug 2024 22:58:38 +0000
Date: Fri, 9 Aug 2024 06:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [khilman-omap:lpm-v6.10/constraints-integ 3/3]
 arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: pinctrl@f4000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202408090619.L1NVILee-lkp@intel.com>
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
TO: Kevin Hilman <khilman@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git lpm-v6.10/constraints-integ
head:   f37c5f79d87871fec323501bfe34d50dd46b656f
commit: f37c5f79d87871fec323501bfe34d50dd46b656f [3/3] Merge branch 'lpm-v6.10/constraints-tweaks' into lpm-v6.10/constraints-integ
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090619.L1NVILee-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090619.L1NVILee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408090619.L1NVILee-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: serial@2800000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: i2c-switch@71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: i2c-switch@71: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: camera@10: 'VANA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: camera@10: 'VDIG-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: camera@10: 'VDDL-supply' is a required property
--
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: serial@2800000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: i2c-switch@71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: i2c-switch@71: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: camera@3c: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: camera@3c: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: camera@3c: 'DOVDD-supply' is a required property
--
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-hdmi-audio.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-hdmi-audio.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk-hdmi-audio.dtb: serial@2800000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
