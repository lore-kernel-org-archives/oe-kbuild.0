Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384143234
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jun 2025 04:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749183490; cv=none; b=Mmb1lpi2s54sH1a0kaL/NcrjcYHnPy1LIdKwN3gegXX5HufVpUcCU9azHN/CvqyvkmwQeabZ3oA0z96uix97A5e9BSS5RXSCdxIyht4gaeSnAP7UtBdk7J+uTsTvhDqnGYwZml6GzQFDZTKsjBxylluzMG4YKONT6XoB7yI+exQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749183490; c=relaxed/simple;
	bh=ExczhN/K8SmbaQCjYFlNb3pnoXjPMQJcsE+MRKj8cK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OC+LYvombvznf5mJrkck3q9PPrPdeaSAH1ODiI5/b5QdGIVpUu94/Mtxw9Dnhwz6aJjrqMI3Eddn36pI7AjMsjYx0gasSVrvfJHqALHL5nENz3qw0xJn8eo0kMwMS5FtqcPfUTHmXPm+fetu3+fBjFhTHaAi/fOYF+onFMWcJHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dViKyFIT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dViKyFIT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749183488; x=1780719488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ExczhN/K8SmbaQCjYFlNb3pnoXjPMQJcsE+MRKj8cK4=;
  b=dViKyFIT8gBlWmt9zFUa6e42D2o8T4bfdE8vEVRP/6oJqp0oH1Rii9He
   TQzaO1vs3bRXCumkK20mPofRO+lywyNa4p0qjGeHQoZqCioJujNPRWsIL
   QUc5pEMuJMz0Ud3GG+Jik6HqjEWwQ+5uoLdXC0xseAZ6pRAx6pN4RH+c+
   lRnwDFdXwelY6YP2VhqXd2kH1xpBy/M7suT6JtBEGiaw3aLwPSAtoPNsI
   mhl/uEb+rxZL2aoQcGS2IHAIEIXBaXATRll3p9wKfF7igMS2iPlqrVF4c
   fWJ4GPHa4AlcvqPlr5uYuZ6NgAk0V/2jZeRDKrQWbtS41hli95jvIl8eX
   Q==;
X-CSE-ConnectionGUID: aU3RxawKR7edgtL8hVnFmw==
X-CSE-MsgGUID: KmlqK7B1RsiMe1OwNZt8jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61951585"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="61951585"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 21:18:07 -0700
X-CSE-ConnectionGUID: kYBfaHacTOmFIF+AfPOfFQ==
X-CSE-MsgGUID: IX16CSnyTJCy/Yc8TDhvbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="145669308"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Jun 2025 21:18:06 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNOWq-0004jR-0M;
	Fri, 06 Jun 2025 04:18:04 +0000
Date: Fri, 6 Jun 2025 12:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:master 8/33]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet@15c30000
 (renesas,r9a09g056-gbeth): interrupt-names:3: 'rx-queue-0' is not one of
 ['eth_wake_irq', 'eth_lpi', 'sfty']
Message-ID: <202506061243.mYINfXl0-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
head:   0cc4c9c39e8953745481c13288a46edc616dc7cd
commit: 18b4e571dc82ac91ae9a39e169c8de285845b80c [8/33] arm64: dts: renesas: r9a09g056: Add GBETH nodes
:::::: branch date: 10 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-051-20250605 (https://download.01.org/0day-ci/archive/20250606/202506061243.mYINfXl0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506061243.mYINfXl0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506061243.mYINfXl0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,sdhi-r9a09g056' is not one of ['renesas,sdhi-r8a774a1', 'renesas,sdhi-r8a774b1', 'renesas,sdhi-r8a774c0', 'renesas,sdhi-r8a774e1', 'renesas,sdhi-r8a7795', 'renesas,sdhi-r8a7796', 'renesas,sdhi-r8a77961', 'renesas,sdhi-r8a77965', 'renesas,sdhi-r8a77970', 'renesas,sdhi-r8a77980', 'renesas,sdhi-r8a77990', 'renesas,sdhi-r8a77995']
   	'renesas,sdhi-r9a09g056' is not one of ['renesas,sdhi-r8a779a0', 'renesas,sdhi-r8a779f0', 'renesas,sdhi-r8a779g0', 'renesas,sdhi-r8a779h0']
   	'renesas,sdhi-r9a09g056' is not one of ['renesas,sdhi-r9a07g043', 'renesas,sdhi-r9a07g044', 'renesas,sdhi-r9a07g054', 'renesas,sdhi-r9a08g045', 'renesas,sdhi-r9a09g011']
   	'renesas,sdhi-r9a09g047' was expected
   	'renesas,rcar-gen1-sdhi' was expected
   	'renesas,rcar-gen2-sdhi' was expected
   	'renesas,rcar-gen3-sdhi' was expected
   	'renesas,rcar-gen4-sdhi' was expected
   	'renesas,rzg2l-sdhi' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet@15c30000 (renesas,r9a09g056-gbeth): interrupt-names:3: 'rx-queue-0' is not one of ['eth_wake_irq', 'eth_lpi', 'sfty']
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet@15c30000 (renesas,r9a09g056-gbeth): interrupt-names: ['macirq', 'eth_wake_irq', 'eth_lpi', 'rx-queue-0', 'rx-queue-1', 'rx-queue-2', 'rx-queue-3', 'tx-queue-0', 'tx-queue-1', 'tx-queue-2', 'tx-queue-3'] is too long
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet@15c30000 (renesas,r9a09g056-gbeth): interrupts: [[0, 765, 4], [0, 767, 4], [0, 766, 4], [0, 772, 4], [0, 773, 4], [0, 774, 4], [0, 775, 4], [0, 768, 4], [0, 769, 4], [0, 770, 4], [0, 771, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet@15c40000 (renesas,r9a09g056-gbeth): interrupt-names:3: 'rx-queue-0' is not one of ['eth_wake_irq', 'eth_lpi', 'sfty']
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet@15c40000 (renesas,r9a09g056-gbeth): interrupt-names: ['macirq', 'eth_wake_irq', 'eth_lpi', 'rx-queue-0', 'rx-queue-1', 'rx-queue-2', 'rx-queue-3', 'tx-queue-0', 'tx-queue-1', 'tx-queue-2', 'tx-queue-3'] is too long
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet@15c40000 (renesas,r9a09g056-gbeth): interrupts: [[0, 780, 4], [0, 782, 4], [0, 781, 4], [0, 787, 4], [0, 788, 4], [0, 789, 4], [0, 790, 4], [0, 783, 4], [0, 784, 4], [0, 785, 4], [0, 786, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
