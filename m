Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B42D2DA775
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 06:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780122050; cv=none; b=JoNLufHCs55MnwdKZXRCxYWKAJV4cS9v6hyVbIIEaBzd5drw20cyZobgH6qV6//eUMismMV2haWsyBxbRgH6Li4mePB8DUR4W2aKhYjP0QRsQkYEIJCJRr6PlTAOORiVQh0nF3i3SsoRUyjnHJ0A1vp5VtZCrqkVDurxubU57Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780122050; c=relaxed/simple;
	bh=L8KvSUzYPeGsaztYLwmqnMS6iyLxj7H4N2+WAlddl5g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ekeL9Ox23YTlSXmfFGh9UtwaHbycWJtykGy6jZ/yFMwmB7/1LndnxmCjWSeouHWFobRxo2FPHa0QisRwURHkoZfP+NSm26N3yuoHK2lMV4xJOmRm5T7HXHOni/RVSIC+fq8r0ACjF54PFoluqK5L8h2ZYio9SZaZ/YloVz/Ez68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i47ZFgKZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i47ZFgKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780122047; x=1811658047;
  h=date:from:to:cc:subject:message-id;
  bh=L8KvSUzYPeGsaztYLwmqnMS6iyLxj7H4N2+WAlddl5g=;
  b=i47ZFgKZ4oxpHOwW1NB5ojN4nabg9AUFw3OBgsTu53rt+lRZzUNwbeKB
   WSqXNvMMR+KSNjIgXhkytu916ArfEXYL1La2O/e4jfjt5ym9v74U0AtoM
   R5RcbgVsyLVNBdPesE27cW5yBIzs2emTj05kX4pJ69ZREly3W2xlJ5na5
   GpY5DSOF19UdsbkjUrULlOkk4TD4KE9A/3avzAb0llkxKbETK4wzm0F47
   4dX4PuhMiVsfVT90jfpDFmb21iqSvbb7Ly53Hmz3++DVG6F/jDmrKJTEi
   VuH196kfKMTU/jExot3wBYsFT/OBscwcflDoxDHzi9utP1S6NyTUBm/sM
   Q==;
X-CSE-ConnectionGUID: 1ikk8J0IQUW1GrKYLLVGCg==
X-CSE-MsgGUID: WjGggK65S2CV4xNoIYn6JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="84592759"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="84592759"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 23:20:47 -0700
X-CSE-ConnectionGUID: 7qkup+YDTNi+sxp3a1ZfNA==
X-CSE-MsgGUID: y8fYndzyQROaFgqIpVXPaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="242914820"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 29 May 2026 23:20:47 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTD3r-0000000014N-3CIB;
	Sat, 30 May 2026 06:20:43 +0000
Date: Sat, 30 May 2026 08:20:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:gemini-dts-for-soc 6/8]
 arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb:
 /soc/syscon@40000000: failed to match any schema with compatible:
 ['cortina,gemini-syscon', 'syscon', 'simple-mfd']
Message-ID: <202605300816.Xed2AJtx-lkp@intel.com>
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
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git gemini-dts-for-soc
head:   dce8e0cb88fb12d068459b75f299ff2242172257
commit: ccd7118d30488d69561e4c7a7e2062a367825719 [6/8] ARM: dts: Add a Verbatim Gigabit NAS DTS
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2055-20260528 (https://download.01.org/0day-ci/archive/20260530/202605300816.Xed2AJtx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300816.Xed2AJtx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605300816.Xed2AJtx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: /soc/syscon@40000000: failed to match any schema with compatible: ['cortina,gemini-syscon', 'syscon', 'simple-mfd']
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: /soc/syscon@40000000/pinctrl: failed to match any schema with compatible: ['cortina,gemini-pinctrl']
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: timer@43000000 (faraday,fttmr010): False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.yaml
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: power-controller@4b000000 (cortina,gemini-power-controller): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: ide@63000000 (cortina,gemini-pata): ide-port@0: '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yaml
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: ide@63000000 (cortina,gemini-pata): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'ide-port@0', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yaml
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: ide@63000000 (cortina,gemini-pata): ide-port@0: '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/pata-common.yaml
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: ide@63400000 (cortina,gemini-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
