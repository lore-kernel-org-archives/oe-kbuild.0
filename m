Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A855C39A7F9
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 22:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778364516; cv=none; b=FvazQoRg2M4Gx0sURpHeFEY3/IF95tEiMtVeJrs0TPcLnd4bYgoOQxYcJqEkx+aMT00ThWXGfV7j/Gww+wuWtYbu7qkiL05qCZndnTLzTdd4F0psl7GCoqJymtNarxeqRusRL2UAOAPzCcD9HD9NYP38T01ek9Z6iJREbp+zTOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778364516; c=relaxed/simple;
	bh=OwoMaBIvD36yKo0SuxRzwH027fxs1iEV1rDqhnaMs7Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U1Wg02lXdiwuqIduXkgb84Z62l/zQh9RDvbwvJyl1XXj+uPIp0DueaZhAlmn4NYuZNIXwHv2zw1QQL3Wexz1SEBNKmD24oTd8BkStgYtWE9ttWq//d2cvAn75hhX/k/C8/JJVrc+vecyH7l0wMUHTjRCWIlhNxNlWEK6VB8mzKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFHZviTL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFHZviTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778364515; x=1809900515;
  h=date:from:to:cc:subject:message-id;
  bh=OwoMaBIvD36yKo0SuxRzwH027fxs1iEV1rDqhnaMs7Q=;
  b=cFHZviTLIqxSswEBIMjL87XjGPlzUUvIIFcpSNjw0WbEY1tTrZve/GpI
   tMNEBuxxrK0VjABEy+0CECEHFj10A/bhjFlzaxFwS9ngWL6W5EaPImKLv
   y2y8ShQSWXfuPRUo9bFyxKeKoUcMLnqUwvbww407UJ3Ff6/KR+QCU+k1A
   EdFnpn6qLVXeGubrjiDjr3SPhHFnvav+kTiD5OJtEHDsQeji669xHGjdX
   uimpWpoxsB2UAoZfhO3shlSVNaqFhVdA5JHUjbtnR/OErMyC/f/xvL9l6
   XNURc2Av7wZNi64bCjKYF0qIV3SlRHr1klwJ3SrDGBnAscjQ/sin+Tgda
   g==;
X-CSE-ConnectionGUID: 4X8MiXhDQkuYWkqaHhH+qA==
X-CSE-MsgGUID: zSEmxbFTQembT1MilWu2wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="78333649"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="78333649"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 15:08:34 -0700
X-CSE-ConnectionGUID: 4Q/fBckIQ3Gyxane+jD3Bw==
X-CSE-MsgGUID: kgpEtCAGRd+/BfaH+LTpfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="275212850"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 09 May 2026 15:08:33 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLpqY-000000007Yz-1ihz;
	Sat, 09 May 2026 22:08:30 +0000
Date: Sun, 10 May 2026 00:08:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb:
 pinconf@8a21000 (pinconf-single): $nodename:0: 'pinconf@8a21000' does not
 match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
Message-ID: <202605100044.WpL5OPIY-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: 0day robot <lkp@intel.com>
CC: Linus Walleij <linusw@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/Frank-Li/mux-add-devm_mux_state_get_from_np-to-get-mux-from-child-node/20260509-123711
head:   51b3a88d4505a0bd5c5a53452925a784aabec2ad
commit: ddfdae02177cc3cbb74e9571f21255d56a276057 dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips
date:   17 hours ago
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm64-randconfig-2052-20260509 (https://download.01.org/0day-ci/archive/20260510/202605100044.WpL5OPIY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100044.WpL5OPIY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605100044.WpL5OPIY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/clock-reset-controller@8a22000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-crg', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/clock-reset-controller@8a22000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/system-controller@8000000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-sysctrl', 'syscon']
>> arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: pinconf@8a21000 (pinconf-single): $nodename:0: 'pinconf@8a21000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: spi@8b1a000 (arm,pl022): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: gpio@8b29000 (arm,pl061): gpio-ranges:1: [11, 71, 1] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9840000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9840000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9841000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9841000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ir@8001000: failed to match any schema with compatible: ['hisilicon,hix5hd2-ir']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
