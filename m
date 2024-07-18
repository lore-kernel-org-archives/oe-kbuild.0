Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1F92C1AC
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Jul 2024 03:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721274374; cv=none; b=VKg8RT7jRTm5CHm9a0BU5qGSdXVKBrrKGol39x+BukTAISjlkhGPkSqo0l9lKo3wN8pYwj5qYbucQ8AUD5EWlAalTAcSs+DWNt2j2260k0TdrZZY3OlD+cAiIlmNFC3Luj++IXxj6YSygpFmq+B8+kmg4tbE1DLjxE74WID+tBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721274374; c=relaxed/simple;
	bh=XtL1Szr+hACUtXWyebPFxOYX6vKuLeWDUEOTzySDxmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oCubvsRJ54YiQsU8ZS+XrCiMg1myx0WCQRkXvIWxV2AA+yDWQtuV3TJiFVEzm290cME1lbGoqhiPHMJqJwEKy7yNWQOujrY53/H8n2ehPfH243p1ao3jMWH6kkSrXDkVFp+eBbgUo//ZFw3PBBty/llJRLJ5Ex82cSppk9LSW58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f5mecupT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f5mecupT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721274372; x=1752810372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XtL1Szr+hACUtXWyebPFxOYX6vKuLeWDUEOTzySDxmo=;
  b=f5mecupTOVLdD6uZoWRZL534PCu3/exQ2Gl2VCOewpy78eQofJSRoa2Y
   r12efoT68C3qmYT55rPVyLR6op/fcJL5sz8yY772MKc8pCcHEBkPwp9Xz
   yz9WCOr6zXwyeAbsWgUcssy/cln70caNyRm6ovrocQddj34C1W4QJOi59
   SOink9dLjSnQWdN16slDnXogHkgDRwDPRm3TEDPsTqCt+vXv7mxecSFOi
   3uXYC1OMcMluOPY6DlDkDkoEb2whwVVwBSuzkPD+vsBczDC5LtIPt3Bha
   uHACQkS0LhTv+5Irp4fKTfQEA9xvolmHmFcbNw4Gj9dz5Ght+sQjN7TDE
   g==;
X-CSE-ConnectionGUID: 1OY2RPB1RIyo/jzp2YjJJA==
X-CSE-MsgGUID: /FiqvgtnRDuJOlP0dm7xnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="22623942"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="22623942"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 20:46:12 -0700
X-CSE-ConnectionGUID: V6zvwBHDTqSaXwslRVU0Qw==
X-CSE-MsgGUID: 3iO1z2JyTm2bqiWOyzASXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="50929766"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jul 2024 20:46:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUI5o-000gvK-0b;
	Thu, 18 Jul 2024 03:46:08 +0000
Date: Thu, 18 Jul 2024 11:46:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.6.y 52/74]
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: thermal-zones:
 bigcpu-reg-thermal:trips:phandle: 279 is not of type 'object'
Message-ID: <202407181137.COUtfIv1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Steve Jeong <steve@how2flow.net>
CC: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   fdb4709395deb4bfd668475eec2c0d482f12e1e1
commit: 95c198e2967f7f19e2d236190b1851075f2c5a4b [52/74] ODROID-COMMON: Add '--symbol' to device tree compiler
:::::: branch date: 23 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-051-20240717 (https://download.01.org/0day-ci/archive/20240718/202407181137.COUtfIv1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407181137.COUtfIv1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407181137.COUtfIv1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: pcie@0,0: wifi@0,0:interrupts:0: [8, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: usb@fe800000: 'extcon' does not match any of the regexes: '^usb@', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: usb@fe900000: 'extcon' does not match any of the regexes: '^usb@', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /i2c@ff110000/rt5514@57: failed to match any schema with compatible: ['realtek,rt5514']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /spi@ff1e0000/spi2@0: failed to match any schema with compatible: ['realtek,rt5514']
>> arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: thermal-zones: bigcpu-reg-thermal:trips:phandle: 279 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: thermal-zones: litcpu-reg-thermal:trips:phandle: 283 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: tpm@20: 'powered-while-suspended' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: da7219@1a: da7219_aad:dlg,jack-det-rate:0: '32ms_64ms' is not one of ['32_64', '64_128', '128_256', '256_512']
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /dfi@ff630000: failed to match any schema with compatible: ['rockchip,rk3399-dfi']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /syscon@ff770000/phy@f780: failed to match any schema with compatible: ['rockchip,rk3399-emmc-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
