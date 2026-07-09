Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91654DC55C
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 18:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621702; cv=none; b=NoyhSseEI3655GBSRDfms91mQmeUZE5uuITZs4VtPXdwga1n/glZ3O/PyzMBOe8EIA07DXktUvU66F19VEtlCFt11TZIF+I4KeJG2p7KJrnGkFtaNttKZnjQB1BCyqB2BzXh8JgFtayh/uVlE7Bgb+xe4vwbx6OnO39hhbwidWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621702; c=relaxed/simple;
	bh=RO4QqCrmYS8ciQ5a+6Sl41HrUSmOv9McelBBk4JQn0M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DIUS4lJZoEawYaubQBS545JPyq2tD6fX0xuNxhmssLG+TqkhkV2lnbFnW2vQMrnXREycw0eCkURTQ2KMEQtC8PvzvGP9k7ToAdwz3Dx4H/g+QEnr7Z63GCFrC/UKRheM9FQMsq10bYyVCa7b5bzPFoWfZJno16f1gXHgmZEnB5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aahXWVho; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aahXWVho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783621699; x=1815157699;
  h=date:from:to:cc:subject:message-id;
  bh=RO4QqCrmYS8ciQ5a+6Sl41HrUSmOv9McelBBk4JQn0M=;
  b=aahXWVhoqUoAYlpPHignKrJnN6pgAOvNCKun7RPVkntbJsQ3cRkGMgxY
   VBRxH4p9spJXCS26WqpRSoufdqF9spH/4hoFyG/z7mdFhQ1kROaEo61gs
   66XD7SDODD+TdFfi4QyJ1iWonGE8SZ7LZjk1Uf6qAmkeYfBP89B3aBdh+
   L5ixwy7gUt9ED+r+DQfNLtrbsjgIcUKoPI9nqa8+CaDBWShdavJsTa5Wg
   zfUs0z1PL/9ItQCq2Lpw/Q6ScFMevq9pHYuti9/5mHTraUSQPNRNFnvgW
   usADQw+T09Cwg+SzbKuXp5e2AFo6+O2T4MD5U0IYzPdMgtUFrl01Ulq0N
   w==;
X-CSE-ConnectionGUID: At0eMnoqQMOmjzv6H0iRtQ==
X-CSE-MsgGUID: CHKQNscCR5ma2yPDuztE/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71839325"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="71839325"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 11:28:17 -0700
X-CSE-ConnectionGUID: 2JbQ5Yq/SMO833htNBYbzw==
X-CSE-MsgGUID: GJEdYKfLQ36X/O2KOuXxrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258966574"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 09 Jul 2026 11:28:16 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whtTq-0000000031l-2Lkz;
	Thu, 09 Jul 2026 18:28:14 +0000
Date: Thu, 09 Jul 2026 20:27:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: flash@0
 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth',
 'spi-tx-buswidth' were unexpected)
Message-ID: <202607092032.1TT8BBEo-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2c7c88a412aa6d09cd04b414211b4ef8553b5309
commit: 987697749def9c5e10d9a2d992f012db61ae1967 arm64: dts: mediatek: mt7986: add dtbs with applied overlays for bpi-r3
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-2055-20260708 (https://download.01.org/0day-ci/archive/20260709/202607092032.1TT8BBEo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092032.1TT8BBEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 987697749def ("arm64: dts: mediatek: mt7986: add dtbs with applied overlays for bpi-r3")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607092032.1TT8BBEo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml
--
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
