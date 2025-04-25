Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA40B17A314
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Apr 2025 07:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745567453; cv=none; b=JOIeUThSnnkHD4z81XJXHEqYbzBBxvESQzgXMLV7S9xPPBbcxurjfvI12qInRvqRbAXQ25pqLhXsOWlLWuMBbFWtEsLf4QvemqTaJDCNCCKECL4EUPxtOFwRL+XGmyhNpH1vHNBWQC9ZaWU87alYUx/63bGXHCRl7LAiHuc7E7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745567453; c=relaxed/simple;
	bh=UjFcEwzcG32ZZW3QdXZhsE7dDbglQ+eVYUlIcvIEg2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DGJ/Hqs+mrTJOuvbvkW0VB20x4Fw0CAVbWmqRQf27skuIxBBCtSiICnb2rhYqievn1C1RIO+Md8YaFIkui/w3gPNSx8MhvBPO8lqiEuXNUaWlY7ibQYpMRMsq6xlZ1uMhaCjNofDP2wKk6UIetAKImmXk/YosbG4AyLCXjHnI70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxOIwVeP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxOIwVeP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745567450; x=1777103450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UjFcEwzcG32ZZW3QdXZhsE7dDbglQ+eVYUlIcvIEg2Y=;
  b=nxOIwVePi/YQvl95GqZ4ZI2fzqHqFxm/VImpr9Lqa6lu1Wf0P16YOORf
   kJFbrWthDyCe+GXxWfNXJQjOtVCql99IrfAuw/NqDaXbLZAa8pykZjf8Y
   5wdA67uN9ja8nwOZYWOrtOWV8+nqgDs+6bV/5jjmKWtysM186y/FTgL9Y
   uFoykdPfnvqnWNNJ2TWGt4qrn48pnQybSbT9Cs2ZD08gZybFfskPCoVAW
   AU+FR1g5DB1la9xDCy9C0W2EzFBcfH7O7iVukUvHJfYCabNO/83V50qn5
   sOLn/YBANRM/YwosmOEWfT5DRbLUXI4nGmuUcBFpXt1mvZKo14s7QjZd1
   Q==;
X-CSE-ConnectionGUID: +snGAGepSVy+igJFsGa9cQ==
X-CSE-MsgGUID: GCPx92VgRyaBYta37ZQ0rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47315306"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47315306"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 00:50:47 -0700
X-CSE-ConnectionGUID: Xd1lKIIWTG6TDl0OaU/KSQ==
X-CSE-MsgGUID: bxuRzK6MSUCUKAMg1HX54w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132761847"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Apr 2025 00:50:47 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Dpc-0004vl-1F;
	Fri, 25 Apr 2025 07:50:44 +0000
Date: Fri, 25 Apr 2025 15:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.16 23/26]
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: /: failed to match
 any schema with compatible: ['retronix,sparrow-hawk', 'renesas,r8a779g3',
 'renesas,r8a779g0']
Message-ID: <202504251531.a4vEAB0Z-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.16
head:   9f78a29caacef6df5d6a43e85d1112e39cfa3b34
commit: a719915e76f2b1390fbed7d40848aaaf7823060c [23/26] arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-052-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251531.a4vEAB0Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251531.a4vEAB0Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504251531.a4vEAB0Z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,r8a779g3' is not one of ['renesas,r9a09g056n41', 'renesas,r9a09g056n42', 'renesas,r9a09g056n43', 'renesas,r9a09g056n44', 'renesas,r9a09g056n45', 'renesas,r9a09g056n46', 'renesas,r9a09g056n47', 'renesas,r9a09g056n48']
   	'renesas,r8a779g3' is not one of ['renesas,r9a09g057h41', 'renesas,r9a09g057h42', 'renesas,r9a09g057h44', 'renesas,r9a09g057h45', 'renesas,r9a09g057h46', 'renesas,r9a09g057h48']
   	'renesas,r9a09g057h48' was expected
   	'renesas,r9a07g043' was expected
   	'renesas,r9a07g044' was expected
   	'renesas,r9a07g054' was expected
   	'renesas,r8a779g0' is not one of ['renesas,r9a09g047e27', 'renesas,r9a09g047e28', 'renesas,r9a09g047e37', 'renesas,r9a09g047e38', 'renesas,r9a09g047e47', 'renesas,r9a09g047e48', 'renesas,r9a09g047e57', 'renesas,r9a09g047e58']
   	'renesas,r9a09g056' was expected
   	'renesas,r9a09g057' was expected
   	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: /: failed to match any schema with compatible: ['retronix,sparrow-hawk', 'renesas,r8a779g3', 'renesas,r8a779g0']
--
   	'renesas,r8a779g3' is not one of ['renesas,r9a09g056n41', 'renesas,r9a09g056n42', 'renesas,r9a09g056n43', 'renesas,r9a09g056n44', 'renesas,r9a09g056n45', 'renesas,r9a09g056n46', 'renesas,r9a09g056n47', 'renesas,r9a09g056n48']
   	'renesas,r8a779g3' is not one of ['renesas,r9a09g057h41', 'renesas,r9a09g057h42', 'renesas,r9a09g057h44', 'renesas,r9a09g057h45', 'renesas,r9a09g057h46', 'renesas,r9a09g057h48']
   	'renesas,r9a09g057h48' was expected
   	'renesas,r9a07g043' was expected
   	'renesas,r9a07g044' was expected
   	'renesas,r9a07g054' was expected
   	'renesas,r8a779g0' is not one of ['renesas,r9a09g047e27', 'renesas,r9a09g047e28', 'renesas,r9a09g047e37', 'renesas,r9a09g047e38', 'renesas,r9a09g047e47', 'renesas,r9a09g047e48', 'renesas,r9a09g047e57', 'renesas,r9a09g047e58']
   	'renesas,r9a09g056' was expected
   	'renesas,r9a09g057' was expected
   	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: /: failed to match any schema with compatible: ['retronix,sparrow-hawk', 'renesas,r8a779g3', 'renesas,r8a779g0']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
