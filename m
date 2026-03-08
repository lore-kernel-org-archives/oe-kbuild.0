Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9730533993
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Mar 2026 05:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772948900; cv=none; b=T0XpruoI2IxFcx0Pz3eepQj311c/AIB05JsnPQ01vmcYwSVpi/kkpZTrpsjr8hem+DyRXrsqmvuZQ0da69i38o8nv6ftOQHeWAIxPDwbQkC2DLghnktK1hFRYIyar/Ui3bYxkZ/33Zzo6eF2YaDNoBJ7OYCOPgkBTrtDmQG5Uu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772948900; c=relaxed/simple;
	bh=4un0+DuPQkqoRQYDiDnoqR7HJfdMa7H6jyl0f0dYFUg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HECirks5Mr3mOxQD5gUXi7WAqYKHrSQwULR/tkd4vG/clM9xwTtDteQ5fZHNToWkhMDqPKT7/a1jCT6aMNItkzBtLIv486hzAU1OezIc6qJ6zMatv/0LMHe/bPqY608mRmt8dy2zpdqHKoYcJ1aeU1SYSfjxgEKFwIlJYVhbnEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjpz/2Ea; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjpz/2Ea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772948898; x=1804484898;
  h=date:from:to:cc:subject:message-id;
  bh=4un0+DuPQkqoRQYDiDnoqR7HJfdMa7H6jyl0f0dYFUg=;
  b=gjpz/2EaoWFyTDDVC7bHMnw+H/uxismHWdd15P4IGENaEAr6aq7S7H/Z
   oxf4uPipxYuxU5kNqTYnq+lDisMG9PxTQSOUe0fNJ62ufD0+YVlonLHjp
   1WRe0KgyfntRAG16iSYkYi8ZeSMqZhtaErEPN5I4SJ27/VA1yjzuZ9rcw
   BrfgyEAvAlj1zQBsTJ0XiD5wqafPwcCpOdGMWMwR1YmRXdhdxjBtf8Fb4
   OPqf4cdyPUVXbCz5kg4PXAqtljl3qgTjP93vljVFmnnLZslVTogmVHmk7
   9VBDL4b85sa+Fakh9HKum4z/7N4gWt1UH3wVm4gTqu3fAcorUh17pGbyh
   Q==;
X-CSE-ConnectionGUID: kQPoWXM4Rr+IxRNfcaOmWg==
X-CSE-MsgGUID: e/rNWLDkRBSwFF607YO1nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73879940"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="73879940"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 21:48:18 -0800
X-CSE-ConnectionGUID: 1ChitH7oTomSdO3nHA1WlQ==
X-CSE-MsgGUID: vA/ZuFq5TEyZklS3ElF+VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="223889663"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 07 Mar 2026 21:48:16 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz6zu-000000002dV-3fPF;
	Sun, 08 Mar 2026 05:48:14 +0000
Date: Sun, 08 Mar 2026 06:48:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wsa:renesas/x5h/mfis-single-driver 10/10]
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: mailbox_test_send_to_recv
 (mailbox-test): 'mbox-names', 'mboxes', 'reg' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202603080627.TvjVLEBg-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/x5h/mfis-single-driver
head:   e921fc1b87b0832d20c6be75629cbc3414a30af0
commit: e921fc1b87b0832d20c6be75629cbc3414a30af0 [10/10] TEST: DTS additions for mailbox-test
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20260306 (https://download.01.org/0day-ci/archive/20260308/202603080627.TvjVLEBg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603080627.TvjVLEBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603080627.TvjVLEBg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts:70.28-76.5: Warning (unit_address_vs_reg): /mailbox_test_send_to_recv: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts:78.28-84.5: Warning (unit_address_vs_reg): /mailbox_test_recv_to_send: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: mailbox_test_send_to_recv (mailbox-test): 'mbox-names', 'mboxes', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: mailbox_test_send_to_recv (mailbox-test): 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: mailbox_test_recv_to_send (mailbox-test): 'mbox-names', 'mboxes', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: mailbox_test_recv_to_send (mailbox-test): 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
