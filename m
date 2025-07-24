Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574B53207
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Jul 2025 01:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753321757; cv=none; b=CMfgK+8iOZhh45esCPFVQCA/4Fr+LCyx7qmyxkxc73st/7j+HzjIFvMc2S0f4ORt5J5gMTQ2Vd+71VY5dTN1hZ4/kTOE4Fm4ymChWhBg62TDyoZLpHXY+762qeXNEAI//QlxMEFhjKRPw5dGC61StCoUMKDlapcQbrVnNxJZWa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753321757; c=relaxed/simple;
	bh=MNsc3Rsb+QPLZQV6GAtIrZQ6NRa4cCZo8oQWK7vmsZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d6qef91BDa+mQas0jMK8kc10+YdX/tobuY/HSFeRYK4EA8CDRjI7ug4+7bmUoKFXysCYBgHNPsOhT+/kU5Nlz0fYNbMk13kvpiP6S5/02J0Gf0xZEUU3BMMR4t4JYL3NqYajnPJS4u8PKp6uSSrJUD61q2ZDkr6xYwzSSS8Xmtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwcfAxzg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwcfAxzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753321757; x=1784857757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MNsc3Rsb+QPLZQV6GAtIrZQ6NRa4cCZo8oQWK7vmsZU=;
  b=nwcfAxzgstG6YeWc+d0FITjQZliOGjfEiSCBujFczLWqNryPb7A9S1Bm
   xlpflG2K+aUvidx5OnWah7dU8OkdaW5OPPf7unxCwxx/29v4hsVFdYQM3
   Mhl90I8j+5i6KODgXf56Qn1WjFLTYoxl0BOR77m4Pe4YHhHr5N9rDiMDH
   oz/IxDZZdPU9olkN15R5ypfXYvbck1XewWcfOAhCK/+ukQI4mz696TUTw
   d8DFpEE24YijW0LPq4sptTYvih1jgFcNaRe/l4X8n5tlv7tkR4eN0U9JU
   VHqPuI0RPsU0mbnsUsNexMz4Hneow8biLCC9qX0QDy6yvWqoXLHavZgCA
   g==;
X-CSE-ConnectionGUID: TFJ6Vk0fRROk34Hfj73X3A==
X-CSE-MsgGUID: J0qz2g50SVKPfMyL1gHDlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="54711886"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="54711886"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 18:49:16 -0700
X-CSE-ConnectionGUID: G5D3gt35S/iCaFEIYXQ9HQ==
X-CSE-MsgGUID: mC7FkRG/Tw2hQdORwFJDRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="165461985"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Jul 2025 18:49:15 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uel56-000Jzj-1o;
	Thu, 24 Jul 2025 01:49:12 +0000
Date: Thu, 24 Jul 2025 09:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ralink/omega2p.dtb: wmac@10300000
 (mediatek,mt7628-wmac): clocks: [[1, 17]] is too short
Message-ID: <202507240929.YI3GMpj5-lkp@intel.com>
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
TO: Sergio Paracuellos <sergio.paracuellos@gmail.com>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f9af7b5d9349bf92cc4d0a0baa8a151295f12f4b
commit: 232085d118ff4695c0e9992ebc7ba4da7a24875e mips: dts: ralink: mt7628a: update system controller node and its consumers
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: mips-randconfig-051-20250724 (https://download.01.org/0day-ci/archive/20250724/202507240929.YI3GMpj5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507240929.YI3GMpj5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507240929.YI3GMpj5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ralink/omega2p.dtb: uartlite@c00 (ns16550a): Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/omega2p.dtb: uart1@d00 (ns16550a): $nodename:0: 'uart1@d00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/omega2p.dtb: uart1@d00 (ns16550a): Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/omega2p.dtb: uart2@e00 (ns16550a): $nodename:0: 'uart2@e00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/omega2p.dtb: uart2@e00 (ns16550a): Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/omega2p.dtb: wmac@10300000 (mediatek,mt7628-wmac): clocks: [[1, 17]] is too short
   	from schema $id: http://devicetree.org/schemas/net/wireless/mediatek,mt76.yaml#
--
   arch/mips/boot/dts/ralink/vocore2.dtb: uartlite@c00 (ns16550a): Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: uart1@d00 (ns16550a): $nodename:0: 'uart1@d00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: uart1@d00 (ns16550a): Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: uart2@e00 (ns16550a): $nodename:0: 'uart2@e00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: uart2@e00 (ns16550a): Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/vocore2.dtb: wmac@10300000 (mediatek,mt7628-wmac): clocks: [[1, 17]] is too short
   	from schema $id: http://devicetree.org/schemas/net/wireless/mediatek,mt76.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
