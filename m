Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794543570;
	b=mNrUa3lT9NBd818sts98KcNtiRjlhcvW/OgVuFTIubw9s2ELaU79zzl2l26zgT/6YUqO
	 frCIcTa1UAb2mhKSeJxrEoVUx4EM2jOLQIaTrdAwXf1FQ1GDYWhCVUJudzBJWVoEIDYIj
	 ecRr9zCwomNblstE9pP266pvt0zR/wfxTJYLbbJW6Pw9xUmLJeTsmlLYT7giasi7TdFsd
	 mdqZX8jpX14SfDEZaRX8Z1M0qoyzI4uuRCjxpydU55CV8TykaPTab+EwgSUOB/lQPhBVQ
	 MJAP/14USiP+QcpMBndzsbyQAszxJ9AoBFkOVaoUw6JAMyhsxkghAS89b3fRsfMiz3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543570;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=63DbWmPQjj8Huz5QUZD4eZ1Bpyg1IA6L1VQZ1F/UxAA=;
	b=G1AIzyOvEi8IDGBRP5XyFHrBcqr0T8dx7QJAkLtLbwazkFJulILQaS/PWTQlA5g7rJrc
	 riZM4UBuKVDzu9TMjNZDT41qXZ9szLsPR5nKKhaG+iaoJY1SPRmfKKGcWYr4yOR8zrb42
	 TkaIdil/t7jcAYEIQHyhqW+IW6Bc8qXvtpMQ1CkrWB1yYBKaL+2mW2SMNLZ3HjCTbg15d
	 Sx3KPJkd0Mg0+Rtljryn8Xq0ePSgmTvY51qOifGmq741D9eLgTHU/HLjFFrj4Qa9yb0gP
	 /k4IXEHA1Sxbx/TM5pi2Eh26pCU9MgJ68F1qPG2mdoeyMfcrZXMVcTMCz0vbJak3yOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QDRTVPeH;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C23606A32E
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 04:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C23606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QDRTVPeH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794543570; x=1826079570;
  h=date:from:to:cc:subject:message-id;
  bh=5OYaebyenBkpfcmJUyLImIGhPLnA8jBPQ95ia+qFvKk=;
  b=QDRTVPeHPvXP9SZHs8VRHY0fihkdA3HqIi/H3+diT9syw6NaJ37Y1XEx
   xWU6VnfGj+w7mnk8iyqsGOxNAG60lGO0OSPObjwSXsAP95YkSXReb47SA
   nbBV/Yl4bB7I/fh1+Mvn1ekMimtQ70ve3YIjqiLD+/okj0APs7f+kkWkL
   MqznL8dCGIELTe1q6JPyHjkd26bDEabEVdvyqMQD6zw9gWKcp7LMr2Ji3
   Fz0R4qR2WO0pcGkv6THBzYCJg5erTD5VBYycHWlTFwrAw0Aq9hkHwYd8U
   X8XW8qrp+BSWXiD+XeljHZpteo1eQJZU6dWTjf8aQ7Y3/Al8pChH6Gc/X
   Q==;
X-CSE-ConnectionGUID: Wtnt33AfQjOlAS0tH9p/dw==
X-CSE-MsgGUID: u5tVKrY+RoauPIw/JjiEiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3373485"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3373485"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 20:19:29 -0800
X-CSE-ConnectionGUID: XG1gTj3yTBC+9uyjAinShA==
X-CSE-MsgGUID: /k5hZo4oQVmIt14Fim8glQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8687483"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 12 Nov 2026 20:19:28 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRil3-0000000016J-2hyq;
	Fri, 13 Nov 2026 04:19:25 +0000
Date: Fri, 13 Nov 2026 05:18:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 87/242]
 arch/arm64/boot/dts/apple/t6030-j514s.dtb: spmi@364714000 (apple,t6030-spmi):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202611130531.QtyvFRxY-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   c46abf5713fa41e1574fb50c462f53392d6f5cd7
commit: da04d8c50639d4def50d7e2effd6cdbefa3c9226 [87/242] arm64: dts: apple: t6030: Add more hardware
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261113/202611130531.QtyvFRxY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130531.QtyvFRxY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611130531.QtyvFRxY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6030.dtsi:582.28-586.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6030.dtsi:588.32-592.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67700000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: spmi@364714000 (apple,t6030-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-spmi' is not one of ['apple,t6020-spmi', 'apple,t8012-spmi', 'apple,t8015-spmi', 'apple,t8122-spmi']
   	'apple,t6030-spmi' is not one of ['apple,t8103-spmi', 'apple,t6000-spmi', 'apple,t8112-spmi']
   	'apple,spmi' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/spmi@364714000: failed to match any schema with compatible: ['apple,t6030-spmi', 'apple,t8103-spmi']
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: pmic@b (apple,chapel-pmic): compatible:0: 'apple,chapel-pmic' is not one of ['apple,maverick-pmic', 'apple,sera-pmic', 'apple,stowe-pmic']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/spmi@364714000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: smc@36c400000 (apple,t6030-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: smc@36c400000 (apple,t6030-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6030-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/smc@36c400000: failed to match any schema with compatible: ['apple,t6030-smc', 'apple,t8103-smc']
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/smc@36c400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']
--
   arch/arm64/boot/dts/apple/t6030.dtsi:582.28-586.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6030.dtsi:588.32-592.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67700000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: spmi@364714000 (apple,t6030-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-spmi' is not one of ['apple,t6020-spmi', 'apple,t8012-spmi', 'apple,t8015-spmi', 'apple,t8122-spmi']
   	'apple,t6030-spmi' is not one of ['apple,t8103-spmi', 'apple,t6000-spmi', 'apple,t8112-spmi']
   	'apple,spmi' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/spmi@364714000: failed to match any schema with compatible: ['apple,t6030-spmi', 'apple,t8103-spmi']
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: pmic@b (apple,chapel-pmic): compatible:0: 'apple,chapel-pmic' is not one of ['apple,maverick-pmic', 'apple,sera-pmic', 'apple,stowe-pmic']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/spmi@364714000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: smc@36c400000 (apple,t6030-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: smc@36c400000 (apple,t6030-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6030-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/smc@36c400000: failed to match any schema with compatible: ['apple,t6030-smc', 'apple,t8103-smc']
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/smc@36c400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
