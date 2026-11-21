Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795273218;
	b=5svvYaH+Ntrsaa+9C9B/Z85luiifAF72wk0CdLB2hMbxRcfTfXNMpkONpbHpjc+7WmpG
	 p4WUW+ETDotBR+xCN5ByqvWbJSdSiEZ2DkI7pDJhHU/0rejhibipTYDW457qNAs8wcoxf
	 bs/o8qDnSE38nETjiKfRhDAC3wgNYUxWV69RE6x+BE8/76WC++Jf69nRoLorJMiR9uVMd
	 nPFq2MfE0heEXK25Jk1mPeQ6x6M996FQG4qCW1BZXOv/68mA4qLy56lEh/Vox/eTYSJ64
	 +G+Jwv9yXgb+DDs8tat03CJNHI3chBfx0++LZm92s3xXJR1hA0Z9FV1DSB8mlTqbNIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795273218;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mkTqh30YR4aqDmTzaDBhgbaXJepE8kP2jyDTZcdi8rA=;
	b=iw4fdBgTe5S8WA3U2MjJ4VW9f9E6x4DHh9zz9zpPR7jJipUEU08PTv4LjVW9n/RK8GZL
	 3TEwm08EVpTLmlrPryjqjMEnMNbNxpXoGdfgiUXpxXF8w6X4E0OazFKKOBFEQN6QGe1yp
	 pGsSVxVvvgtR8j2GAx6SGjhX1P1AqNe784XuekaRkGIBKwfposzJvCiPsrxEZ6awHCQOB
	 ZzDlVl72epSWdnuWxQqwOFb+uiea3WIB1hmhXJARLR4eQbM0rcWtMOQS8hG08r8D0uGmD
	 MAAF+ithJjQ6xz7GqHIPQl7D/f80rGG6aLnAEhJrnSwu4LVbdpDZ7x7HxCrUs6q+aAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QewpT2qN;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EA8606A32A
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 15:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42EA8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QewpT2qN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795273217; x=1826809217;
  h=date:from:to:cc:subject:message-id;
  bh=MjPRnI/BGQJx4Xib8QedDfEMuwZ0RhYj5cZqfBLD3tw=;
  b=QewpT2qNPgoq3rN0zq12t1so1Jd4CudgVk3vEqZCHHtk5mUd90iyzRSr
   UTO7RF5OoKpjP5QM4od7z6Ofh0CLTTm64CjNFqS8T2kntddgSKvRNopU0
   vhDVCNYEgb/74+viKXucH9U6cA56aMgfCao2/E1JcEMDfpgP6jMtjeD7S
   grSYbOXPjMdvU9Z2JQLxp0//Iuy27SkrFVO3L7bsOs5lVsfppN/sEKKJi
   uC9dO10J4iWyq8uBL62uKcA9iKlzKrNIiuzL0gVDBzVgxpGaz4tW81q7N
   vo/Ui8kvuZxqaV9eF9Q5yB4YMhhQ18runKycfZYVgMG4DiC+T5SPteR/i
   Q==;
X-CSE-ConnectionGUID: XzJ1HdJATs6uhThTdVpBkQ==
X-CSE-MsgGUID: j83Ipw8LSP68rggg6KrCMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4235707"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4235707"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 07:00:17 -0800
X-CSE-ConnectionGUID: fh6jreznQ6Si6QTakApn8Q==
X-CSE-MsgGUID: ocIdZoDqRVidyu2Vynv1oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10822978"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 21 Nov 2026 07:00:15 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUmZY-000000004LF-3wXH;
	Sat, 21 Nov 2026 15:00:12 +0000
Date: Sat, 21 Nov 2026 15:59:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broadcom-stblinux:next 53/58]
 arch/arm/boot/dts/broadcom/bcm958522er.dtb: sata@41000 (brcm,bcm-nsp-ahci):
 reg: [[266240, 4096], [262176, 28], [1171456, 4096]] is too long
Message-ID: <20261121155729.F5ucNsI0-lkp@intel.com>
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
TO: Florian Fainelli <florian.fainelli@broadcom.com>

tree:   https://github.com/Broadcom/stblinux next
head:   f93174d2517cdc04e05315bafc980ea59f165d65
commit: dfd53f1f6e547eeba1fd6ff1db0aab19ab81cb02 [53/58] ARM: dts: broadcom: Add the NSP SATA IDM registers
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261121/20261121155729.F5ucNsI0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121155729.F5ucNsI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121155729.F5ucNsI0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'mspi_halted' was expected
   	'spi_lr_fullness_reached' was expected
   	'spi_lr_session_aborted' was expected
   	'spi_lr_impatient' was expected
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958522er.dtb: spi@27200 (brcm,spi-nsp-qspi): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958522er.dtb: /axi@18000000/pinctrl@3f1c0: failed to match any schema with compatible: ['brcm,nsp-pinmux']
>> arch/arm/boot/dts/broadcom/bcm958522er.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg: [[266240, 4096], [262176, 28], [1171456, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
>> arch/arm/boot/dts/broadcom/bcm958522er.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg-names: ['ahci', 'top-ctrl', 'idm'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
--
   	'mspi_halted' was expected
   	'spi_lr_fullness_reached' was expected
   	'spi_lr_session_aborted' was expected
   	'spi_lr_impatient' was expected
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958525er.dtb: spi@27200 (brcm,spi-nsp-qspi): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958525er.dtb: /axi@18000000/pinctrl@3f1c0: failed to match any schema with compatible: ['brcm,nsp-pinmux']
>> arch/arm/boot/dts/broadcom/bcm958525er.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg: [[266240, 4096], [262176, 28], [1171456, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
>> arch/arm/boot/dts/broadcom/bcm958525er.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg-names: ['ahci', 'top-ctrl', 'idm'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
--
   	'spi_lr_session_aborted' was expected
   	'spi_lr_impatient' was expected
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958525xmc.dtb: spi@27200 (brcm,spi-nsp-qspi): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958525xmc.dtb: i2c@38000 (brcm,iproc-i2c): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm958525xmc.dtb: /axi@18000000/pinctrl@3f1c0: failed to match any schema with compatible: ['brcm,nsp-pinmux']
>> arch/arm/boot/dts/broadcom/bcm958525xmc.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg: [[266240, 4096], [262176, 28], [1171456, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
>> arch/arm/boot/dts/broadcom/bcm958525xmc.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg-names: ['ahci', 'top-ctrl', 'idm'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
--
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958622hr.dtb: spi@27200 (brcm,spi-nsp-qspi): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958622hr.dtb: ethernet-switch@36000 (brcm,bcm58622-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958622hr.dtb: ethernet-switch@36000 (brcm,bcm58622-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958622hr.dtb: /axi@18000000/pinctrl@3f1c0: failed to match any schema with compatible: ['brcm,nsp-pinmux']
>> arch/arm/boot/dts/broadcom/bcm958622hr.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg: [[266240, 4096], [262176, 28], [1171456, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
>> arch/arm/boot/dts/broadcom/bcm958622hr.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg-names: ['ahci', 'top-ctrl', 'idm'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
--
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958623hr.dtb: spi@27200 (brcm,spi-nsp-qspi): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958623hr.dtb: ethernet-switch@36000 (brcm,bcm58623-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958623hr.dtb: ethernet-switch@36000 (brcm,bcm58623-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958623hr.dtb: /axi@18000000/pinctrl@3f1c0: failed to match any schema with compatible: ['brcm,nsp-pinmux']
>> arch/arm/boot/dts/broadcom/bcm958623hr.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg: [[266240, 4096], [262176, 28], [1171456, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
>> arch/arm/boot/dts/broadcom/bcm958623hr.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg-names: ['ahci', 'top-ctrl', 'idm'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
--
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64.dtb: ethernet-switch@36000 (brcm,bcm58625-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64.dtb: ethernet-switch@36000 (brcm,bcm58625-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64.dtb: i2c@38000 (brcm,iproc-i2c): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64.dtb: /axi@18000000/pinctrl@3f1c0: failed to match any schema with compatible: ['brcm,nsp-pinmux']
>> arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg: [[266240, 4096], [262176, 28], [1171456, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
>> arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg-names: ['ahci', 'top-ctrl', 'idm'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
--
   	'spi_lr_session_aborted' was expected
   	'spi_lr_impatient' was expected
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64-a0.dtb: ethernet-switch@36000 (brcm,bcm58625-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64-a0.dtb: ethernet-switch@36000 (brcm,bcm58625-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64-a0.dtb: /axi@18000000/pinctrl@3f1c0: failed to match any schema with compatible: ['brcm,nsp-pinmux']
>> arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64-a0.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg: [[266240, 4096], [262176, 28], [1171456, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
>> arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64-a0.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg-names: ['ahci', 'top-ctrl', 'idm'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
--
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64w.dtb: ethernet-switch@36000 (brcm,bcm58625-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64w.dtb: ethernet-switch@36000 (brcm,bcm58625-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64w.dtb: i2c@38000 (brcm,iproc-i2c): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64w.dtb: /axi@18000000/pinctrl@3f1c0: failed to match any schema with compatible: ['brcm,nsp-pinmux']
>> arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64w.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg: [[266240, 4096], [262176, 28], [1171456, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
>> arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64w.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg-names: ['ahci', 'top-ctrl', 'idm'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
--
   	'spi_lr_session_aborted' was expected
   	'spi_lr_impatient' was expected
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64w-a0.dtb: ethernet-switch@36000 (brcm,bcm58625-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64w-a0.dtb: ethernet-switch@36000 (brcm,bcm58625-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64w-a0.dtb: /axi@18000000/pinctrl@3f1c0: failed to match any schema with compatible: ['brcm,nsp-pinmux']
>> arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64w-a0.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg: [[266240, 4096], [262176, 28], [1171456, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
>> arch/arm/boot/dts/broadcom/bcm958625-meraki-mx64w-a0.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg-names: ['ahci', 'top-ctrl', 'idm'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
--
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65.dtb: ethernet-switch@36000 (brcm,bcm58625-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65.dtb: ethernet-switch@36000 (brcm,bcm58625-srab): Unevaluated properties are not allowed ('dsa,member', 'ports' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65.dtb: i2c@38000 (brcm,iproc-i2c): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65.dtb: /axi@18000000/pinctrl@3f1c0: failed to match any schema with compatible: ['brcm,nsp-pinmux']
>> arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg: [[266240, 4096], [262176, 28], [1171456, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
>> arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg-names: ['ahci', 'top-ctrl', 'idm'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65.dtb: mdio-mux@3f1c0 (mdio-mux-mmioreg): Unevaluated properties are not allowed ('mdio-mii@2000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-mmioreg.yaml
--
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65w.dtb: ethernet-switch@36000 (brcm,bcm58625-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65w.dtb: ethernet-switch@36000 (brcm,bcm58625-srab): Unevaluated properties are not allowed ('dsa,member', 'ports' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65w.dtb: i2c@38000 (brcm,iproc-i2c): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65w.dtb: /axi@18000000/pinctrl@3f1c0: failed to match any schema with compatible: ['brcm,nsp-pinmux']
>> arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65w.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg: [[266240, 4096], [262176, 28], [1171456, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
>> arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65w.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg-names: ['ahci', 'top-ctrl', 'idm'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
   arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65w.dtb: mdio-mux@3f1c0 (mdio-mux-mmioreg): Unevaluated properties are not allowed ('mdio-mii@2000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-mmioreg.yaml
--
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958625hr.dtb: spi@27200 (brcm,spi-nsp-qspi): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958625hr.dtb: ethernet-switch@36000 (brcm,bcm58625-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958625hr.dtb: ethernet-switch@36000 (brcm,bcm58625-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958625hr.dtb: i2c@38000 (brcm,iproc-i2c): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm958625hr.dtb: /axi@18000000/pinctrl@3f1c0: failed to match any schema with compatible: ['brcm,nsp-pinmux']
>> arch/arm/boot/dts/broadcom/bcm958625hr.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg: [[266240, 4096], [262176, 28], [1171456, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
>> arch/arm/boot/dts/broadcom/bcm958625hr.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg-names: ['ahci', 'top-ctrl', 'idm'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
--
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm988312hr.dtb: spi@27200 (brcm,spi-nsp-qspi): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm988312hr.dtb: ethernet-switch@36000 (brcm,bcm88312-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm988312hr.dtb: ethernet-switch@36000 (brcm,bcm88312-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm988312hr.dtb: /axi@18000000/pinctrl@3f1c0: failed to match any schema with compatible: ['brcm,nsp-pinmux']
>> arch/arm/boot/dts/broadcom/bcm988312hr.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg: [[266240, 4096], [262176, 28], [1171456, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
>> arch/arm/boot/dts/broadcom/bcm988312hr.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg-names: ['ahci', 'top-ctrl', 'idm'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
--
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958625k.dtb: spi@27200 (brcm,spi-nsp-qspi): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
   arch/arm/boot/dts/broadcom/bcm958625k.dtb: ethernet-switch@36000 (brcm,bcm58625-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958625k.dtb: ethernet-switch@36000 (brcm,bcm58625-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm958625k.dtb: /axi@18000000/pinctrl@3f1c0: failed to match any schema with compatible: ['brcm,nsp-pinmux']
>> arch/arm/boot/dts/broadcom/bcm958625k.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg: [[266240, 4096], [262176, 28], [1171456, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml
>> arch/arm/boot/dts/broadcom/bcm958625k.dtb: sata@41000 (brcm,bcm-nsp-ahci): reg-names: ['ahci', 'top-ctrl', 'idm'] is too long
   	from schema $id: http://devicetree.org/schemas/ata/brcm,sata-brcm.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
