Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A9737FF46
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 15:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300731; cv=none; b=tdl65xfucPJnsy+04XmtGytS33eAbFgDjmN+Hk0U6HqzIqvq2iEsHiJO6h/I9cEnckUlRspGG82Hipi8+9A5niAX9wV7qEVqcVh9crZmfgcjxG10R8JkyzU64j7qd06ENYxsN+3hE3zc5drNmJKC5P/V9qn28kzBPKMIAABnog8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300731; c=relaxed/simple;
	bh=nCvU2LBuM4nFPT+dbpq3yD9uZfYwOcDVm+Aw2pGCmxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YOuG7Fr2qJHoDU01Jl/kSNvD/c5mGs/VTdg/yBnMChbgX29moYRy6SQBoTU79p6Q+FnCyp3c38Pw2bHufrbWSlR1oHTY2WziYPa0w+ypNBG7W8ScKePXaR/jKUr11AvZejB5pUY5FYr0XksOIG6JK8lv+Wv2OjXmA8YltBD18pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vs+aNQRP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vs+aNQRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791300729; x=1822836729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nCvU2LBuM4nFPT+dbpq3yD9uZfYwOcDVm+Aw2pGCmxM=;
  b=Vs+aNQRPnoSyFTkSqXC1BaXoFUBmzJ/xlLZUDyZ92CsoDjY3g/rXChVB
   whApiAsdT914OBI/iBts8HM+ZYQyP/Kc9iCAEPB41SePXHqZS12Ii5apf
   2SmlSPF2BuqqWTDCy1g3+vKeM26hqNUbEpE2Kqy5fnhv11HSRejp+KRoI
   geD0qbmhx1sRfu117dtTCNozokXvUAY8AfySPCfX5ux9UdRPe2Y96W5Pv
   4mGwAZheNbSE1Dd+xLmggnjs/wK3s7vQO0+FxiGYqTFcoD3+ZLiNUkoqJ
   xF9hp3BTC1KkO+DzE1W5QZMa/WKSbOgd3La9Ni2SmuWWo5b7qrtmb9abz
   A==;
X-CSE-ConnectionGUID: gHOoMoS5Qw6vjrfYJ55aCQ==
X-CSE-MsgGUID: 7j0QGjWBSBCHVGSuFaAPsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="94865885"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="94865885"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 08:32:08 -0700
X-CSE-ConnectionGUID: 9y6LICWhSSWLHFyjQeo5gQ==
X-CSE-MsgGUID: XEPM7eJDTC+dDbTb2tUg1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="273547946"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 06 Oct 2026 08:32:07 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE79C-000000001RP-02o9;
	Tue, 06 Oct 2026 15:32:06 +0000
Date: Tue, 06 Oct 2026 17:31:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:master 9/75]
 =?us-ascii?Q?arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-p?=
 =?us-ascii?Q?anel-dsi-WJ70N3TYJHMNG0.dtb:?= hub@1 (usb4b4,6502):
 'peer-hub' is a required property
Message-ID: <202610061721.KldUFL8R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

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
commit: 1b16a69bb19bdfafc41fc4bf5ef3059c9511fa13 [9/75] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: Add dsi panel dt overlay
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-2402-20260929 (https://download.01.org/0day-ci/archive/20261006/202610061721.KldUFL8R-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061721.KldUFL8R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610061721.KldUFL8R-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
