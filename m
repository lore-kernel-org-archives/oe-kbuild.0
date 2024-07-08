Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D69120DE8
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jul 2024 21:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720472971; cv=none; b=dgUzdZ4i/MF2Nd/1tpH/94PYkDt/i33/aBCYn45T5Y5CdQjekSqMHUe9OIXwFNt1loInKoY588Uiyz+dOZrXN/ZgujFB8Ay/Dt/yJOmY2OoX4CcD67bqSdVtv9IgjzyqIQ2Oxrl5YlsLdscjsurokA5pAIRcDsaxSFzMxLmiV5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720472971; c=relaxed/simple;
	bh=b+hvEN6BCS4tfhWfG0FtfLBZr+2+wOXphSN3pwIdLe4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iy7uh++VAac6cM0tZuW3d3S002RWNIVLolW+JLxkFPRtxwutcrInY0Yhtyu29cPRFHqP2/AbwSikG+6JTBW1I+ap+n/sWZltipAU2t3YnaA0xEz1nKLobfCIrP4mzXicUz/qx2bKdq5zl3pKApSxNxr81D/i+ysy1SeWS0bSHMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJrBMpdQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJrBMpdQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720472969; x=1752008969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b+hvEN6BCS4tfhWfG0FtfLBZr+2+wOXphSN3pwIdLe4=;
  b=MJrBMpdQ8uFd6oEoU9RNKXlODuqEcepPHWjfrS6NkAM8c7X4uCuKYmFi
   EwaCgfbiQUu1AIN1YYa04WDgk525ipEqm/2xXFnDL2BvW4cYew3y4LEw6
   Br/tX/ygOaxXH/aZ4mAmKowJYTPv3Vvyhtqsp6es6sEKpdvUDd9L+Z51c
   egnwnVhkGJk0Du3CtY5fRFD+VxcGDsW+OmREBux9pAdVjX+d5QVyhlvOU
   z4MkAPcr6OiSImKDuMXMOJlrt8h7tm8fdHoMRfWB0G1j24V+Hxk9pABBx
   2hiuRs02cftVwLjbSZi9tvrd+tSSNhoxGh/3hCG2k/2tD3JkKF2QkuikK
   A==;
X-CSE-ConnectionGUID: DAh9xKRQTb6vs+0w2IUV7g==
X-CSE-MsgGUID: BrnkZ7vYQ9yZOMOHIGFA9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="35235700"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="35235700"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 14:09:28 -0700
X-CSE-ConnectionGUID: xtH080zTSd2MsbNVJXqs3Q==
X-CSE-MsgGUID: am2esZIMTl2l3UcZsAulHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="47575683"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jul 2024 14:09:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQvbx-000W26-1g;
	Mon, 08 Jul 2024 21:09:25 +0000
Date: Tue, 9 Jul 2024 05:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-6.1.y-cip 6/14]
 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: fcp@10880000:
 compatible:0: 'renesas,r9a07g044-fcpvd' is not one of ['renesas,fcpv',
 'renesas,fcpf']
Message-ID: <202407090525.Hr8cGDXl-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
TO: Pavel Machek <pavel@denx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip
head:   36ec072fc37c836df41fdb600a933321aa4804bd
commit: d22ba3fa55a226ee0e19b868d4575932d50b9217 [6/14] arm64: dts: renesas: r9a07g044: Add fcpvd node
:::::: branch date: 13 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-051-20240708 (https://download.01.org/0day-ci/archive/20240709/202407090525.Hr8cGDXl-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090525.Hr8cGDXl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407090525.Hr8cGDXl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: flash@0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['micron,mt25qu512a', 'jedec,spi-nor'] is too long
   	'micron,mt25qu512a' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'micron,mt25qu512a' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: flash@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: /soc/spi@10060000/flash@0: failed to match any schema with compatible: ['micron,mt25qu512a', 'jedec,spi-nor']
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: fcp@10880000: compatible:0: 'renesas,r9a07g044-fcpvd' is not one of ['renesas,fcpv', 'renesas,fcpf']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: fcp@10880000: compatible: ['renesas,r9a07g044-fcpvd', 'renesas,fcpv'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: fcp@10880000: clocks: [[4, 1, 57], [4, 1, 58], [4, 1, 59]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: fcp@10880000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: /soc/fcp@10880000: failed to match any schema with compatible: ['renesas,r9a07g044-fcpvd', 'renesas,fcpv']
--
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: flash@0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['micron,mt25qu512a', 'jedec,spi-nor'] is too long
   	'micron,mt25qu512a' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'micron,mt25qu512a' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: flash@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: /soc/spi@10060000/flash@0: failed to match any schema with compatible: ['micron,mt25qu512a', 'jedec,spi-nor']
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: fcp@10880000: compatible:0: 'renesas,r9a07g044-fcpvd' is not one of ['renesas,fcpv', 'renesas,fcpf']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: fcp@10880000: compatible: ['renesas,r9a07g044-fcpvd', 'renesas,fcpv'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: fcp@10880000: clocks: [[4, 1, 57], [4, 1, 58], [4, 1, 59]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: fcp@10880000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: /soc/fcp@10880000: failed to match any schema with compatible: ['renesas,r9a07g044-fcpvd', 'renesas,fcpv']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
