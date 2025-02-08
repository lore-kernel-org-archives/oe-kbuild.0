Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1E1241107
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Feb 2025 18:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739039207; cv=none; b=GtAqp6/RyhcgrRAoXVF4A+E6loWG2KQkl0NGm11kJKjedrc2kQGNThaJcQNK15sBH1Idd7xMpqRFMcsBFpUzVSSmUCdG8FyeP2fDSSW4t+2P7O0i7tx5OhMAz9mu04aQm7e9kO+DMzX6BmvqliwrH+/F7XIbVkA3r/w39wB+/6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739039207; c=relaxed/simple;
	bh=jeFft8j9mm6CfbG11UTNGQC53QWcDmbU9O4k5xAwN0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X1O/FTFWVbOdivSAm3tEmiqshELMjYcOuCvhKsxQcu/CrPILL+1/K3lWFYJJ6huT7r+Jv7qQIo08H+VEBs2gARIi+VhXXn4TUwha8Ny5jxjoffUvBtUgv/vOmxQWLr1RlIG5dHgfOTRs+rivIdJE0uDNUjufAeJLXhSSw+gG+gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yi/+6XLF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yi/+6XLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739039206; x=1770575206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jeFft8j9mm6CfbG11UTNGQC53QWcDmbU9O4k5xAwN0E=;
  b=Yi/+6XLFqNnHYSOa8QqC88T0B0FvqXYI+0HQuI2+ZouBgVBgwA7UN6QG
   3EaZtYdjr8DAw77iQukaONubiyf8dKO7r7D7mAthsFh04ILjpguLMFktK
   RWxP3OkMmJmwSTE7d/pv6WiSQAKbsGqHKSqeHPO7Y2For3Gqt3+u1y+bP
   iR6h3tg6D3d70+LXUyVOp3QPPDiLpXko2S0R4J3ECaEeZJIPeNKAfQsol
   SzEz3i2AuDNDHXwCtooxCoc0Pa3Mb9AGzoOiSCQo4U0M/eEJJ8a4nz9zh
   VWX+7Cid84/BOIj9IY9Cxnz4jrXfEjfEA2NQStiWbHUzmvfbPL7XGGAGG
   w==;
X-CSE-ConnectionGUID: x3g8a1uJQcGT/TvxApFJSg==
X-CSE-MsgGUID: /yKplOe/SsOdZsUSdbSfqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39555053"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39555053"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 10:26:44 -0800
X-CSE-ConnectionGUID: 6qStIPh7TwaFDNMxvtBxLg==
X-CSE-MsgGUID: GbiKlJ6hS9evJvfkBSk/Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="142677433"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Feb 2025 10:26:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgpXL-0010Ub-2G;
	Sat, 08 Feb 2025 18:26:39 +0000
Date: Sun, 9 Feb 2025 02:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mtd:nand/next 1/1]
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb:
 nand-controller@ff100000: Unevaluated properties are not allowed
 ('arasan,has-mdma', 'power-domains' were unexpected)
Message-ID: <202502090253.2lBdh1Cd-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
head:   499a4b16a4869a901a9bc601bc1e0b8f60151e93
commit: 499a4b16a4869a901a9bc601bc1e0b8f60151e93 [1/1] dt-bindings: mtd: arasan,nand-controller: Ensure all properties are defined
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-052-20250208 (https://download.01.org/0day-ci/archive/20250209/202502090253.2lBdh1Cd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090253.2lBdh1Cd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502090253.2lBdh1Cd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: nand-controller@ff100000: Unevaluated properties are not allowed ('arasan,has-mdma', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: /axi/spi@ff050000/flash@0: failed to match any schema with compatible: ['atmel,at45db041e', 'atmel,at45', 'atmel,dataflash']
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: /axi/spi@ff050000/flash@0: failed to match any schema with compatible: ['atmel,at45db041e', 'atmel,at45', 'atmel,dataflash']
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: /axi/spi@ff050000/flash@0: failed to match any schema with compatible: ['atmel,at45db041e', 'atmel,at45', 'atmel,dataflash']
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dtb: nand-controller@ff100000: Unevaluated properties are not allowed ('arasan,has-mdma', 'num-cs', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
