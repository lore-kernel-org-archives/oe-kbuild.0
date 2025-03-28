Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E558A18A6AE
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Mar 2025 23:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743205006; cv=none; b=QndrsFRQBAqlNYXR8EUNX0n9BqYvftrQSMnzENrqA90dp77pk+WwHkvd1aDKCJs3LR3ygMmJ8F6IwnT2uJAaosr10iCRhRgyFQvJptilzKvnO+4cWjHzUjuY9oBZtv9LgARi0s4RDsVVrob7n+0+1S65efIclKPu3eFvQfhepQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743205006; c=relaxed/simple;
	bh=UktDFlYHcnyE3AuiGoo5IMPIBZkJW/O9odGDbAFOhXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iSaNBosgRG2fxsWImsoezmUKYf1tpco2Uiva1aS7V04xU2Q2fmmnt3hxWgnmWkFfK2CdyZcbDwaHM7M3pd91iHNgoZM50l3xJnAdduiqiOftUtL1jqALxa8cwHgY4h7ffiwi5O21HvNPxNyyq8lqmanic6W++b/sOSr0aEWT/g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7a4KKI6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7a4KKI6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743205004; x=1774741004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UktDFlYHcnyE3AuiGoo5IMPIBZkJW/O9odGDbAFOhXI=;
  b=E7a4KKI6gyEcY7iJ5x7vBWXlUuof9GmkzCzRvbx9QWF9U43U0h83NzvB
   gYGSaGaTpheBQyyW+EyhTW8/Khcwhc/Hkd7r/AhTJovk5+ls0lIZALpK8
   7K0PJemNq1mxv9+tXVOzq+UuJX/NcJOxsB393hqIg9GUychctcBDL7R5L
   4igKtRos2iP87dW2NG8OeYG9T1zjtEbWXfMB8BBBSwV4see3h6znZbN1Q
   byhRmHPN/GveRApjkg/ExCp5gzAuAL6AKzd9ebs4btOJ8E7GOwHQy0Ivi
   FC/8yANymUjHStBuE+7m6MiNtAwnV1S/ff60qVrJrvLCkwwf0Pi8dhApZ
   w==;
X-CSE-ConnectionGUID: OSlwYla3T8Sl3IZUMgdSUA==
X-CSE-MsgGUID: 5cKfBAawTm+md+u0yzoF7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55955205"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="55955205"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 16:36:43 -0700
X-CSE-ConnectionGUID: N8Jb2o2XSLG0wOoXJlClxQ==
X-CSE-MsgGUID: 0cD0ZqdrSoe+rXw6YnPxlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="125582574"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Mar 2025 16:36:42 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyJFc-0007m2-2m;
	Fri, 28 Mar 2025 23:36:37 +0000
Date: Sat, 29 Mar 2025 07:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-03-26 24/24]
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: spi@e6ea0000:
 Unevaluated properties are not allowed ('sound-mode' was unexpected)
Message-ID: <202503290716.lxf1auvA-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-26
head:   ba9316799e85a9ef14dd8a3e5580be4c97149576
commit: ba9316799e85a9ef14dd8a3e5580be4c97149576 [24/24] ASoC: renesas: add MSIOF sound Documentation
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250328 (https://download.01.org/0day-ci/archive/20250329/202503290716.lxf1auvA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290716.lxf1auvA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503290716.lxf1auvA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1262.24-1276.5: Warning (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #address-cells for SPI bus
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1262.24-1276.5: Warning (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #size-cells for SPI bus
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: spi@e6ea0000: Unevaluated properties are not allowed ('sound-mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,msiof.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: sound@ec5a0000: clock-names: ['ssiu.0', 'ssi.0', 'clkin', 'adg'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: sound@ec5a0000: clock-names:3: 'adg' is not one of ['ssi.0', 'ssiu.0', 'clkin']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
