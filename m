Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4045326FA60
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Aug 2026 13:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937741; cv=none; b=EGIAUZ+WJg/FMd9P58ZW91i62NFAyjMNfgn/5P/U1VwQzkt23FPKyb18TMZTWBiE95DYITb8DXup56h/8YJfYRvYkDHuo6YaHZEW1UUi+zTuf+HtjBJqE2Qkaoo+wEa+vS34Wf4aYHsVfo45Buyc4Ou9whx00bRuUr1/bBWiZP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937741; c=relaxed/simple;
	bh=Iubh80u4VX9TA0oIYJdYQidj4uO7n1XxtMl8n85eX7k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bF0XrD5lizENHbIaMyaI69kKqgC+QJ7XYuFuD6dFyoDRghWnUsC6ip29fzBCRkursKDOPAdi1B/imznBZ4DhD0R4+8WnpP9mYkfqQRG3UnJOxD78fnsVmj+6lXxXIeFOl9nz7wroEgFnmxJB2x2l2eqzGg78g+k+i7KMmnPpp5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F4o1LE3d; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F4o1LE3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785937739; x=1817473739;
  h=date:from:to:cc:subject:message-id;
  bh=Iubh80u4VX9TA0oIYJdYQidj4uO7n1XxtMl8n85eX7k=;
  b=F4o1LE3djb5ae15lOqxTr9fHzs9a1gTaRPR2fKHU3DqloqeJOkFUpYyF
   vfOUa0m8THG3fdHQtgaiDdkoGv3MnM3acDk/8LCFQUMNrPu9OTpS/B9EL
   I20fCR+VTFOXgjIdC7MN5+lzFlqD4w+00ABxkfTi2xVwoX4+wCXzvdJzf
   z7MLOlf4zD1gga6GXhbQDhwaahBii6KsxIo3wzPKC9pAwXN43enmL9Qn2
   6kLbpUH4ow+MDzGkSzE9nNSejMbRcgHABWtLswsw+qACixaIqbEEfhF/Y
   VMZJwk1VuJw3GwcxhaeeoRbHPy0KMl7tCTxnbPTJcri/IhgxUwHt2kRnM
   Q==;
X-CSE-ConnectionGUID: PTzYAwqvTXuQucv60GOeRA==
X-CSE-MsgGUID: JjRO6+k6TzaCXnrPzxWG2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90396274"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="90396274"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 06:48:59 -0700
X-CSE-ConnectionGUID: aodQcBrAQRKmgF4ChNFoMQ==
X-CSE-MsgGUID: E170ryAWQty940GStzQdQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="260052317"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 05 Aug 2026 06:48:58 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrbzL-000000004Oo-1tPJ;
	Wed, 05 Aug 2026 13:48:55 +0000
Date: Wed, 05 Aug 2026 15:48:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.3 313/360]
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: scm
 (qcom,scm-sm6350): 'sram' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202608051539.o2SWQPRd-lkp@intel.com>
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
TO: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.3
head:   b426fedcef8c277574bd7beed0ae9d482c03605a
commit: 4e9b6041bbdddde93369df47ba44c759e29c0972 [313/360] arm64: dts: qcom: sm6350: Add minidump SRAM config to SCM node
:::::: branch date: 10 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2054-20260803 (https://download.01.org/0day-ci/archive/20260805/202608051539.o2SWQPRd-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ade128740327db281859708ddcb3b072903b3414)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051539.o2SWQPRd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608051539.o2SWQPRd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6350.dtsi:2452.27-2529.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: scm (qcom,scm-sm6350): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: sram@14680000 (qcom,sm6350-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
--
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: scm (qcom,scm-sm6350): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: sram@14680000 (qcom,sm6350-imem): 'minidump-sram@1c' does not match any of the regexes: '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
