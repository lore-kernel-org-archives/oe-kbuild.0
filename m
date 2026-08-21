Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4203DFC6B
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 19:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787340469; cv=none; b=gZVSYQi9R2dRit/FzDEd/uMwhj8bYa17zuqDLUdE7YQFh6hpN+0doUsCDuMisrpHxFpjo6yGcXFqaVpMbtyaNmXbNjBelKIH2vw21WTlhS7gMEwVpnj+YyDgnKVuCc93CxcEFRf3q0h+n+njZCMZxSrgnZB9NKtAZetlxNipJrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787340469; c=relaxed/simple;
	bh=DQImvH3dgQOTqT6cys66YL7xCZG93PKJKshO+KrSnX0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XeLW+S/nng8mFzuFcmJNBiPtnkI59YprJZ4e4QDKt2M6iarQAnKVZQFvhShk775FKPOz3XwFrgMYaH80uhMj9Tk8G9W4W7Pe2AUIxaaJ+TMTEnGMX7GDfQH5MLBBecd0marUV0eWgRjSjcwQRPqzwsGgX6VxO92Unbx/77hr+fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMFL8ZRf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMFL8ZRf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787340467; x=1818876467;
  h=date:from:to:cc:subject:message-id;
  bh=DQImvH3dgQOTqT6cys66YL7xCZG93PKJKshO+KrSnX0=;
  b=JMFL8ZRfgD9leY7rhR9SSiT8AzgEnN5gpWPPmh3UsEcbq3cabLo17rkh
   vQ6P3OgnB4Ot4nsytlaOADrHss09yz4PTGBlMHrphI7tZUEC51ZlF+wb0
   26hyEM/5bFV+hMHYcLlSUlgkecf6wC8Gi7iRIF/h2JFbhqA/9cIQOKdHM
   uqJnV3ZD6yiAkFHLQkIFCGgEX2phIv/Ljsn4lKTtgaKtfAQ75/j49aFOV
   U0A0pCxFXlI93FNcr48Il7aBlp8kAYB9YlN1bXzdvUt1ZrEnqkBGO2XFy
   47PYPHtrxF9KRQwpeNqoavrztCu7ZLcfKdBXBRMFDSTLLZvpJUMttPHTD
   w==;
X-CSE-ConnectionGUID: SUl97VFkSrK+YeqYVLXLmw==
X-CSE-MsgGUID: IfHIgo4HTuaHC/sMm1gdaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="113433566"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="113433566"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 12:27:46 -0700
X-CSE-ConnectionGUID: iml84SUZQVi5Q8u9FQarig==
X-CSE-MsgGUID: 3Lz0P9ZMTaiaZy6ym5NgDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="266485179"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Aug 2026 12:27:45 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxUtz-000000007jp-0eoD;
	Fri, 21 Aug 2026 19:27:43 +0000
Date: Fri, 21 Aug 2026 21:27:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dtb:
 partitions (fixed-partitions): partition@240000: Unevaluated properties are
 not allowed ('read-write' was unexpected)
Message-ID: <202608212141.CUlMbsw9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   531ed942bb0df04f6747983fecdedce76a22d07f
commit: 1eb9fabd52933cdf9be349de5391920fac4ed30b dt-bindings: mtd: Ensure partition node properties are documented
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-2051-20260819 (https://download.01.org/0day-ci/archive/20260821/202608212141.CUlMbsw9-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project daa9d09970fed49996f42a8f7000b584f295991d)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608212141.CUlMbsw9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1eb9fabd5293 ("dt-bindings: mtd: Ensure partition node properties are documented")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608212141.CUlMbsw9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dts:173.4-179.31: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dts:173.4-179.31: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dts:173.4-179.31: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dts:173.4-179.31: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dtb: partitions (fixed-partitions): partition@240000: Unevaluated properties are not allowed ('read-write' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/fixed-partitions.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
