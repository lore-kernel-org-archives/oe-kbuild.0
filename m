Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BE23FB7E7
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Jul 2026 16:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218423; cv=none; b=s/2PCHw9RQMtyqDU/OODKAyRrS4zY8WptDtdZK9YzF71qjZGE9GP810dYyj+oREFpOO2rFuq4U4TyjOTcHosnQei9ob/TkXkOlYiGfPkqQDIqNr9f1rynLCPnGtMAYYRDkgM49aX6ivUGaWSAloy+tuiWm8q7Zlma2AsFahIoP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218423; c=relaxed/simple;
	bh=DatrI0zhm4Li8a50kPcoBm7VhdoU+wG/YHBRCNLDQrQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dpW62XBhC6/ZUAg4jy6Iq99mgI2GffaGBDcFK6CIzUIgRg8gvs7DOkO2eWacQ2LaNLwUWVINPBug7c4dE4/lLkM9+HH15BX3Sqo+hWXTJhz+4vBoR6xin775DHBm9GZf8pvzvZzoXSYWhj+0GKpMMXW5r4MSYJypm6vFfm/G6Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDONVIJJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDONVIJJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784218420; x=1815754420;
  h=date:from:to:cc:subject:message-id;
  bh=DatrI0zhm4Li8a50kPcoBm7VhdoU+wG/YHBRCNLDQrQ=;
  b=UDONVIJJyrQo1Qc4JLl13LShNKkvaz6hmAmcVtDBUXN52lOZ2U53G2DY
   tydtxq6tcJLqEKn9Td7t7dI/z14Ls8HEo4XtT/dmKQ9hqnRHhHkSPfPuh
   fDzbLN4WwT6kn3MQqLDEBaGOps5/9erN14POXmzPEc2jLSaK6cw7i8qeP
   j/RintUYHyuyQKNSygnGCy4AzpsoXO3RrkUCa0Aw2bgDYeuwG6CPdous8
   KRf2O44Du8hvWQQq7pmaHWCafl8U9G7n5ZZhZt4+nrBibjGVIEa6wPDTb
   SFQbK7AkqyafpOn76PsOs+N3pzvSVjiaA8XRYEIRIWWZ65cffhtbgLOHw
   g==;
X-CSE-ConnectionGUID: 7aE6IdOnTuONSMkrYkO/mQ==
X-CSE-MsgGUID: g2fGTs+3SUiQ1v72MYe+NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="95484985"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="95484985"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 09:13:39 -0700
X-CSE-ConnectionGUID: wVVQbn1kSAGkwpEYo84r4g==
X-CSE-MsgGUID: 41EyifJPQYG37gj0ns68Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="260145042"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 16 Jul 2026 09:13:38 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkOiO-000000004en-1KQN;
	Thu, 16 Jul 2026 16:13:36 +0000
Date: Thu, 16 Jul 2026 18:13:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit-com:wip/k3-pm 3/3]
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /power-controller: failed to
 match any schema with compatible: ['spacemit,k3-power-controller']
Message-ID: <202607161853.LTqlOqB3-lkp@intel.com>
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
TO: Yixun Lan <dlan@kernel.org>

tree:   https://github.com/spacemit-com/linux wip/k3-pm
head:   7564307504c3ad0df589dba3aee9a1f7cf7ce185
commit: 7564307504c3ad0df589dba3aee9a1f7cf7ce185 [3/3] dts: riscv: spacemit: Add power domain nodes
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: riscv-randconfig-2051-20260716 (https://download.01.org/0day-ci/archive/20260716/202607161853.LTqlOqB3-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161853.LTqlOqB3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607161853.LTqlOqB3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /power-controller: failed to match any schema with compatible: ['spacemit,k3-power-controller']
--
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /power-controller: failed to match any schema with compatible: ['spacemit,k3-power-controller']
--
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /power-controller: failed to match any schema with compatible: ['spacemit,k3-power-controller']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
