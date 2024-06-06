Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841DF198A31
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Jun 2024 17:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717694781; cv=none; b=c2bq79QzDT3+FHIR9rS+sYjQ+k3BCiTHsULhL7CUr6pxQA0gIGf/RXZ/oMv2Hf9aQjwx1A9OwGFx0wM4nc229zc6DAIKw7NTLQX6jCtsTxhCL7Va+GCX64fCKjJBvdWsoYaPFshfF8g73uIQDdCkzxMHp2THMYMZPLhFtf21Lwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717694781; c=relaxed/simple;
	bh=Z8LVf1Rw20MJeyahna7t0UMcaZ0sRz7NCaeEmD/QeZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IYRMyzGs3Ctlc2qRK52SiK6WSClccsXPCHMluQ3S4iVOFwr6T65r812UMu/UhV4DlDhPq8IOVnXOP4B4scCPY9c5lazqcI93qeP3T9yY1rSvihH5Q0Vrw/VexIZgByBiD8n8V6QfrIqu3O03DN3OS3GETJXZsSbBH2w2BV/ZDAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Njxz8JfJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Njxz8JfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717694779; x=1749230779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z8LVf1Rw20MJeyahna7t0UMcaZ0sRz7NCaeEmD/QeZw=;
  b=Njxz8JfJeMVxd7vE1uOXmq6ZntGcLBFYrrO0aLzIap8MbJuuqsWD58s1
   /j9KtZy/kACTq0DvENNj5829yb5jzqzGJ49PPvaMotjgz6vlqKtTS4hMz
   De8HkNuSSxwS5WuVw5N4QOuNclO8VYLJhUaNsUgzG4/fST2Wq3rYSTQF4
   ozmvjyn9WaXR/cTJWWaRHbMp+27f48t75S1O4Z3O0yjq78s9ZODZEI9aF
   LVDRd2EoKVMd8Jt3H2VR+DwAXJJFcXkS7NGM/SW9DsyljlSGM7fVc617U
   3qfxFcrYWNamN5Lj6cXjDaSA5AilyTgBStZuqjcS/dvhDtt5vpCpiXB3G
   Q==;
X-CSE-ConnectionGUID: ewiyhHdTThiFj2s/R1zSPw==
X-CSE-MsgGUID: NrsQDDYMRyiPzKo9LBxOAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14123172"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14123172"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 10:26:19 -0700
X-CSE-ConnectionGUID: FwzgEvLGRl2V17f/vTER0g==
X-CSE-MsgGUID: AqlYehsmQ3up1+dV3i+BdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="75515317"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 06 Jun 2024 10:26:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFGsP-0003Ui-2X;
	Thu, 06 Jun 2024 17:26:14 +0000
Date: Fri, 7 Jun 2024 01:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/ep8248e.dts:101.13-190.5: Warning
 (interrupt_provider): /soc@f0000000/cpm@119c0: '#interrupt-cells' found, but
 node is not an interrupt provider
Message-ID: <202406070146.xwA9ooQC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: Manual check reason: "low confidence static check first_new_problem: arch/powerpc/boot/dts/ep8248e.dts:101.13-190.5: Warning (interrupt_provider): /soc@f0000000/cpm@119c0: '#interrupt-cells' found, but node is not an interrupt provider"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d30d0e49da71de8df10bf3ff1b3de880653af562
commit: a8528f7f31abf792f188d3f397b15aae7ed8564c dtc: Enable dtc interrupt_provider check
date:   3 months ago
:::::: branch date: 29 minutes ago
:::::: commit date: 3 months ago
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070146.xwA9ooQC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406070146.xwA9ooQC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/ep8248e.dts:65.9-80.6: Warning (unit_address_vs_reg): /localbus@f0010100/bcsr@1,0/mdio: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/ep8248e.dts:84.9-87.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/ep8248e.dts:110.10-119.6: Warning (unit_address_vs_reg): /soc@f0000000/cpm@119c0/muram: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/ep8248e.dts:51.19-56.5: Warning (simple_bus_reg): /localbus@f0010100/flash@0,3800000: simple-bus unit address format error, expected "3800000"
   arch/powerpc/boot/dts/ep8248e.dts:58.12-81.5: Warning (simple_bus_reg): /localbus@f0010100/bcsr@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/ep8248e.dts:110.10-119.6: Warning (simple_bus_reg): /soc@f0000000/cpm@119c0/muram: simple-bus unit address format error, expected "0"
>> arch/powerpc/boot/dts/ep8248e.dts:101.13-190.5: Warning (interrupt_provider): /soc@f0000000/cpm@119c0: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/ep8248e.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   arch/powerpc/boot/dts/ep8248e.dts:15.10-22.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/ep8248e.dts:15.10-22.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

vim +101 arch/powerpc/boot/dts/ep8248e.dts

0dde1a1df9ab06 Scott Wood 2008-01-17 @101  		cpm@119c0 {

:::::: The code at line 101 was first introduced by commit
:::::: 0dde1a1df9ab0615ed08558fb7144e7739e9f565 [POWERPC] 82xx: Embedded Planet EP8248E support

:::::: TO: Scott Wood <scottwood@freescale.com>
:::::: CC: Kumar Gala <galak@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
