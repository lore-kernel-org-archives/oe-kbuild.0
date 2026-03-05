Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE52F3E3D9C
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 18:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772735030; cv=none; b=ZLXLXKriSWPe7zKiIAi+YN4ThUda8HSGbn/xqHKHDUOcRef+OLr02G8mPP+c+WXarBKOwacxysRZqldz9DvA7gCGqRFCuCaWARhl7Y6s3lLNXUisjVa+m5AbFxpbcTFbiAcB54Z4mM7Hr3pbKu3ejzEoIve7fv3mN31W6QekYp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772735030; c=relaxed/simple;
	bh=vbAvXNbqWZhLADrGeWwRSp0OpnPCybUJvQ275F8mIkg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NFgieGR+MWd6KfCCY0JnFL4EhtDARu31Gyl898O7MCPmABnPWFK/heIo1zv9t2Nq6stu7W0F2xvo0lTl9y8UjR/TgKeUhxOuJL1Y78r6qwQu/TRxgeIu/H2K51xy85+22cj3RJEle3zTkUbMpDGSNSGS+oc2+z3IfZ77h1SG4QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BShPrUJs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BShPrUJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772735028; x=1804271028;
  h=date:from:to:cc:subject:message-id;
  bh=vbAvXNbqWZhLADrGeWwRSp0OpnPCybUJvQ275F8mIkg=;
  b=BShPrUJszQW4OpnULuwGs1R4Eua8alOdEPxR9l+SYXVyXvzrZAYCKYu2
   ZTrXyWYE4OvD7UFxgY84Gcie84jMqyGa9eZwVyWZEPZs7HOVVhPBEPv8A
   qg6rj9MCGL369fb47XXI3SW12nFOcuAiai2n0IOLbgm44Xjv5Im/xsq7E
   0BJz3eATaiNdMlsZhXHmvF5So4lEyJsTQTEk27v3k7RmSKxPUzf/fqA7f
   fVjc7jGQSDPETl6QYX/PbkQtSoCsvekZmHqXOl8wfi24eFCzWxiuDLOQZ
   mmY0Puzqv2/R7GdX37x9upW0n+Hut9D40+0k1iHQ0LrQPQXb5+JvJ3aFH
   Q==;
X-CSE-ConnectionGUID: SkIOX+dBRmKLTnZ5lmlf5Q==
X-CSE-MsgGUID: mKymGv33SFqDmHFirw9zLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="61408525"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="61408525"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 10:23:47 -0800
X-CSE-ConnectionGUID: K3kIZz7tSOCUiIQU3q0qLQ==
X-CSE-MsgGUID: GxD6cQzWT9W4V4uJoJ7eZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="216561535"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2026 10:23:46 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyDMO-0000000023d-3948;
	Thu, 05 Mar 2026 18:23:44 +0000
Date: Thu, 05 Mar 2026 19:22:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:bfv-dts-cleanups 3/4]
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: adc@0
 (microchip,mcp3464r): interrupts-extended: [[17, 20], [8]] is too long
Message-ID: <202603051938.7qOAzcJL-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git bfv-dts-cleanups
head:   1dd53d0397c0493d759dc1688a4ad4bccac897f9
commit: dd6ee5a79a7399033cdaa7d44e3bb9407d3cae8b [3/4] riscv: dts: microchip: add adc interrupt on beaglev-fire
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: riscv-randconfig-2051-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051938.7qOAzcJL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051938.7qOAzcJL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603051938.7qOAzcJL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts:230.3-39: Warning (interrupts_extended_property): /soc/spi@21000000/adc@0:interrupts-extended: cell 2 is not a phandle reference
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts:223.8-282.4: Warning (interrupts_extended_property): /soc/spi@21000000/adc@0: Missing property '#interrupt-cells' in node /soc/mailbox@37020800 or bad phandle (referred from interrupts-extended[2])
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: adc@0 (microchip,mcp3464r): interrupts-extended: [[17, 20], [8]] is too long
   	from schema $id: http://devicetree.org/schemas/iio/adc/microchip,mcp3564.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
