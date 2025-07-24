Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4D92CA8
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Jul 2025 00:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753317403; cv=none; b=FhWNuksTeu55M5qEiTsXfKeRMWdSpYSLQZezFGOWBTH/yhX8tMYo87AFyYsAcdS2bVAfNQdgfRSclPCJ6vqy9PuQQjDSvB2Cpi6l5n+TjK80iZw8EmtLI8RbmzjJ71/vmLoC1pmNQUT0VEkwl0QJgXskIAGKfghqlYZTc95+Gx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753317403; c=relaxed/simple;
	bh=pL7il27SbyvOmNIjmBsWcgneNi861b2xgqXhq8AWn50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ntkpNiFxssVmodh5b1Y/aB1vSX18McALIrwgKo85iHe5nP1KW8uEATbmBsMVyF/qMbe2E0lQ2Y3d8RZKZPSOdk3oLZQKKLtoKaRvX3UhazLda4t3V5m3VU82ojy8vqOQKOaiG3iCykuWqXJfjLJurpM7keB+L+uACEUDdTpJ9aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GoqYLbZh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GoqYLbZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753317402; x=1784853402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pL7il27SbyvOmNIjmBsWcgneNi861b2xgqXhq8AWn50=;
  b=GoqYLbZhjze7t6SQ4jkNpJVAHCgt4f2PpNAYuQNkFRa4lMkcD0qrR1Wo
   TDZFDPnji9BpJrZGBwM1iGckjuldsySSJ2RQDgu3psnsnStl6DldN1LiU
   gA6spQz0nr/6fh45i7Vm9Q0LpvyJ6jOgB0EL2wp0Htzap6AOuQ5dc5d55
   SPaxxDm1mX1Q1vFpWh3qe/nSdx+87FGrZx3ad9r3/uOE/LXWFnrOzVnMy
   F5/KQXyQz4PlwsSm5DfIzFbelWvpT03tje2gpn0WvC349UggBEQ+BBbko
   d3/OutC7rj7FWGrk6FWPMfFhRGZtfIC7EQ4saBYJXf8gmKCHVQgkwVO4t
   w==;
X-CSE-ConnectionGUID: T+4Y4kWsTTKtkachixEBQA==
X-CSE-MsgGUID: TEbBqcc8Ti+GLcqPYN6ong==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73194842"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="73194842"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 17:36:42 -0700
X-CSE-ConnectionGUID: gHWluatBSQW0dNxj4j/CkA==
X-CSE-MsgGUID: +NA7OrOXRKmkH7CJGVIbbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="164105001"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jul 2025 17:36:40 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uejws-000Jux-2J;
	Thu, 24 Jul 2025 00:36:38 +0000
Date: Thu, 24 Jul 2025 08:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ralink/rt2880_eval.dtb: cfi@1f000000 (cfi-flash):
 Unevaluated properties are not allowed ('partition@0', 'partition@30000',
 'partition@40000', 'partition@50000' were unexpected)
Message-ID: <202507240839.pxe1zab2-lkp@intel.com>
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
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f9af7b5d9349bf92cc4d0a0baa8a151295f12f4b
commit: 9ea13d9e40cfb6675a299147bb89d6ca9e7aad9a dt-bindings: mtd: physmap: Ensure all properties are defined
date:   5 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 months ago
config: mips-randconfig-051-20250724 (https://download.01.org/0day-ci/archive/20250724/202507240839.pxe1zab2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507240839.pxe1zab2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507240839.pxe1zab2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ralink,rt2880-intc.yaml#
   arch/mips/boot/dts/ralink/rt2880_eval.dtb: /palmbus@300000/memc@300: failed to match any schema with compatible: ['ralink,rt2880-memc']
   arch/mips/boot/dts/ralink/rt2880_eval.dtb: uartlite@c00 (ralink,rt2880-uart): $nodename:0: 'uartlite@c00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/rt2880_eval.dtb: uartlite@c00 (ralink,rt2880-uart): 'anyOf' conditional failed, one must be fixed:
   	'clock-frequency' is a required property
   	'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/rt2880_eval.dtb: cfi@1f000000 (cfi-flash): $nodename:0: 'cfi@1f000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/mips/boot/dts/ralink/rt2880_eval.dtb: cfi@1f000000 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@30000', 'partition@40000', 'partition@50000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
--
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000 (ralink,rt3050-usb): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000 (ralink,rt3050-usb): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000 (ralink,rt3050-usb): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: /usb@101c0000: failed to match any schema with compatible: ['ralink,rt3050-usb', 'snps,dwc2']
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: cfi@1f000000 (cfi-flash): $nodename:0: 'cfi@1f000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: cfi@1f000000 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@30000', 'partition@40000', 'partition@50000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
