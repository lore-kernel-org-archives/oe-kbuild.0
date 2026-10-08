Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F94B3D5236
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791446104; cv=none; b=jtECw7LdguXraa0BhIrgwGtP7jZkTCteo1JRI7M5W1Bf52zjZz4mzFd+2fFfYtbN6FageiXUQkIRRsKnPd/pAUKn90F9qUMx5vKyvzr72zPIYA7k9qNf1fEDNPfhCDViSvHs4HofjR5PV3HKhshgfrZU9oWVY4oklNiwjF+0qf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791446104; c=relaxed/simple;
	bh=6ZIFmN8nrSmSsT5icEKJXI7t0ZkmsYUswITL6J2x/Ls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LWJClc1J0KUuvUyMDhinnHT0gUtTahfjUUxaMsVcje3tOlYpTyJZxLvY9qkV8CvmIuipbuZVmYowVevDCf0OSYPTzizzfFCAI4t3kvHenf4TxOWC/cJFMPsjHPEGIzsGtEI4/7rH320z8v7wRXIzIrLOJvQFPwXB2cOw0hPRg4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFo7Nrxp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFo7Nrxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791446104; x=1822982104;
  h=date:from:to:cc:subject:message-id;
  bh=6ZIFmN8nrSmSsT5icEKJXI7t0ZkmsYUswITL6J2x/Ls=;
  b=hFo7NrxpUHLUzKCyHWqtjsDcWTBPF5kp3n0e9mWi9Tog89Zt0TMsr2MH
   bX+b6t1HfVqssTgFhqObkusKLFMVbJMPVGvAO1kdea0ez2CPv5z4l7zi9
   lBP766E9hMdlXLED2KwATsuaiqx04GjPoB2cyemKKuypbgb5NKcYamVtP
   GNW6PD/9rOjvfHdqgM4NDEiLHvphdjjAaq+I0XxQsOaYdbdJSQEnb4IQ5
   uMdr2H2UHzdsbvDApYF6j89l16FbT8IvvBb/kUxIeewxgPwdxGJs+5rRW
   yGmvAdMRElTOpyLaJqzrYvAw1WhUGselBDX50kU7Om0KqjprHql8wldVi
   Q==;
X-CSE-ConnectionGUID: SsQq58iKRQaO/Jrvsf5x4w==
X-CSE-MsgGUID: DfExKoYNQ1aK+B/ikjaXng==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="219823"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="219823"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 00:54:33 -0700
X-CSE-ConnectionGUID: /Qwks6RCRySDH2I1CuuoeA==
X-CSE-MsgGUID: Mv+qRREITkmj6+oS/p2ndw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="72631"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 08 Oct 2026 00:54:31 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEixR-0000000054X-40nG;
	Thu, 08 Oct 2026 07:54:29 +0000
Date: Thu, 08 Oct 2026 09:53:46 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:master 13/75]
 arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple.dtb: hub@1
 (usb4b4,6502): 'peer-hub' is a required property
Message-ID: <202610080934.5EBsxIvM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-renesas-soc@vger.kernel.org
TO: Josua Mayer <josua@solid-run.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   1320b9000130f6240b4f713b0948dcab4dfd95fa
commit: c9bbb744bec0c9a24c3c5cec4d23b21ef1dfc1ee [13/75] arm64: dts: renesas: Add support for solidrun rzg2ul som on hb-ripple
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2402-20260929 (https://download.01.org/0day-ci/archive/20261008/202610080934.5EBsxIvM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080934.5EBsxIvM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610080934.5EBsxIvM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple.dtb: pinctrl@11030000 (renesas,r9a07g043-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple.dtb: pinctrl@11030000 (renesas,r9a07g043-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple-emmc.dtb: pinctrl@11030000 (renesas,r9a07g043-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple-emmc.dtb: pinctrl@11030000 (renesas,r9a07g043-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple-emmc.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple-microsd.dtb: pinctrl@11030000 (renesas,r9a07g043-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple-microsd.dtb: pinctrl@11030000 (renesas,r9a07g043-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple-microsd.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple-leds.dtb: pinctrl@11030000 (renesas,r9a07g043-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple-leds.dtb: pinctrl@11030000 (renesas,r9a07g043-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g043u12-hummingboard-ripple-leds.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
