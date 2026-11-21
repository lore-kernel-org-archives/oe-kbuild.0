Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795271353;
	b=Jw0WTsZheRk5q2Bx0nXiJJxlvPiTbJde9ctzInbAiV2E2W092/P3XBQvSRDpnVUhukJ7
	 JNYgwkdf2Lsar4cEqTUgKJGZsNheHntkmEWmIykBS7z1T8pSViinzaa7KC+QIrPMsT2BB
	 awgm4fKRtjq2VwrshNLYuE6hM3Jx9tU0H1qI9d9mtAcMYydK5cNRkmZwc6dunRECDSjvr
	 dWrDdsvek+aDyPmBYmSfXdCeelIUvdx/++F12ebgrPLK13Gkhr0Ojt+ORbWJIClU9pVmj
	 V8av3p9vgbEkriASW7uxdCXcmXCVPcz/EeJ47aw9pTRCDl1mvdzirHBuij5ZM5o9hrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271353;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/gtfumsAgX5xrdJHV6vWkkAgDt+DUWpbiekWQee35Mw=;
	b=CVqQAeSekvaeSJi1/oErrqjw1wnWEI4v1Az3726f1R0hOQGeUsmzvSos8bA5hkigoFQO
	 jcxPOcgk0mf/AAE7stUNnF+2vDZw9mY1gGKMW8sHSzYottldYY7vRo80o6onI6ppI/U4t
	 pmbQXNtYqBADb3COuWv+hWc39Lr2p2jNp3Ghzp3ZQB3HK9BZ/0sgx1FqRbgyFNgAMV0MS
	 8HarzMYdcrtETF1Or+boz8gUwbHwnlLwpWq6L+CQ4R9zcBIVAeVPEYq612P2HjVqlXpGR
	 kT4gcLICr2Jhgrp1O8UPu5p/XHQUABsg3iQn2zDgHorAv/nWep38A4fjYzyeLeWVeJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KNgzyev6;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E258D606A320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 14:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E258D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KNgzyev6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795271352; x=1826807352;
  h=date:from:to:cc:subject:message-id;
  bh=F2t5SoneXAroPl8XtDoDgjHRWUAY76AuqvDbNLVWYlY=;
  b=KNgzyev6VEyRP0775T35hee6MIYCtO009o3tjFqIUp/EiOEWTmwqG0aR
   8XB3YE4fTUWyqMN5Lir0WBTb/K4ocpTRL1Z9xJndPj22/0Rqwta3Dvm8d
   LW00qPhIY+nmrQZlAw+CR1ubu1xQuxze29v1vbRU/4ZdeshJCastnrSP+
   j3FaOQgDNHvjQLlJsSAyV8FfFH8VEXmFPXHNpS1dg8TahzuJ973kuMv4K
   gw5ljYTbb82qxa0fHebopZJYotcw3XrV6CF7jwZGgFJwoVVnco/5xV20g
   BibGNkFfcczJdeg8MUSbofi6iVDgFVD4eBObWvMAHzXjlMlNvSP+kRBzo
   A==;
X-CSE-ConnectionGUID: OqB82ts1RHSMCdxBIYzsdw==
X-CSE-MsgGUID: U9GFynlkT0ejuuSDVC+sPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4026499"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4026499"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 06:29:11 -0800
X-CSE-ConnectionGUID: F0wjFMT0RFGxFECQMJ+7ag==
X-CSE-MsgGUID: R1vVdrRrRMa9dEZ4W69Xbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11258209"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 21 Nov 2026 06:29:10 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUm5U-000000004Kz-1nod;
	Sat, 21 Nov 2026 14:29:08 +0000
Date: Sat, 21 Nov 2026 15:28:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [net-next:main 61/101]
 arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: ethernet@c9410000
 (amlogic,meson8m2-dwmac): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <20261121152735.ksbRSpRZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: netdev@vger.kernel.org
TO: Lucas Tanure <tanure@linux.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git main
head:   d23de0bd0bfd62405e6c80028008838ec140af25
commit: 2297f88ce0b8b6836989ff75b5c63998f60a499c [61/101] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
:::::: branch date: 12 hours ago
:::::: commit date: 35 hours ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261121/20261121152735.ksbRSpRZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121152735.ksbRSpRZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121152735.ksbRSpRZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: ethernet@c9410000 (amlogic,meson8m2-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['amlogic,meson8m2-dwmac', 'snps,dwmac'] is too short
   	'amlogic,meson6-dwmac' was expected
   	'snps,dwmac-3.70a' was expected
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
