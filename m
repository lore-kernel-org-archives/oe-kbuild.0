Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84042E8B64
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Nov 2025 09:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630633; cv=none; b=RpahbjSLlQLJv9ORBAiV3xrDVtPnidBbOZp5WiEWaNtN4ZD1VbFer1vMTaV23eHxrP9FRw8UQmUbP9aLnWun17GxOMS11VQdCY7KccmMMFfVzJg/LNZyv3fz/tlSksMObvtcIOpsZM9QVapYbJ6SSKf3iP0aA9MskDifWMNctQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630633; c=relaxed/simple;
	bh=YkixjW9mMkaT+aCFViFS1R1bNu0x9+0oJRj/bvpUrIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pyMJF4pjfOqhXpSzfPV/9mdpRNOua30h7gKtwa6xUkXrwThYhvbEiZSgzN+sXr+MjCM8vgmvmRG4/TbrUrdBIvC/xMTJB11o+FRRJpf+ODVwH/C/oHOTDSLSlzA9H0elbe1NQItTLIm0c8YxnlzRIAKgpn4OQQ7Eazo16Wqh8Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IwdcrAZO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IwdcrAZO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763630632; x=1795166632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YkixjW9mMkaT+aCFViFS1R1bNu0x9+0oJRj/bvpUrIo=;
  b=IwdcrAZOcnsHklDUeTJ9fMT6QUEMvCO+e2oQrtQF7mVxdz0NmbENuL/H
   p2B5XyIvMB0it3RFVNlljIWykmYlwugTwDpCYdV5/j7VDJ9E79j1NBH1E
   OW9qHvBZDIgoG7UP0WW6av3m4lW0V2mgJqnlpWXsmg/rIokTajMCtJ+kx
   fYZqgg2IxXzg3ZC+sBHYwJGRiPMOVH4f/FGqY9SDDIEtBM98B3O1SWdCF
   q9ui6WJuCoc9Lu0eFRXsGrQriI4qOF4XPYLGw24kll6naixLxUn01VhFH
   z3bmLklh7TiFUAGii7UiJ4Dj+bopsFfS96Ikm7pbnWzkP+Jkee6RZczBe
   A==;
X-CSE-ConnectionGUID: ywSM1PEcQpaBqjJPS/sm1Q==
X-CSE-MsgGUID: UKPHt33LTUWINewq4oecWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76301915"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="76301915"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 01:23:51 -0800
X-CSE-ConnectionGUID: pt5EL6knTHaY37/YqEANmg==
X-CSE-MsgGUID: NiWp/sGeRbOX4HNfVbH1ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="195447974"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 20 Nov 2025 01:23:50 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vM0tH-000000001QB-2wD7;
	Thu, 20 Nov 2025 09:23:47 +0000
Date: Thu, 20 Nov 2025 10:23:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [fustini:b4/ssqosid-cbqri 23/24]
 arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: /: failed to match any schema
 with compatible: ['riscv-virtio']
Message-ID: <202511201008.dBcwX4GK-lkp@intel.com>
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
TO: Drew Fustini <fustini@kernel.org>
CC: Adrien Ricciardi <aricciardi@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   f8bf739ad96594b69b3bf724e65ddf8c25a7d570
commit: 9772f5b0401545432586c779994b735abc136224 [23/24] DO_NOT_MERGE riscv: dts: build qemu virt device tree
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-2052-20251120 (https://download.01.org/0day-ci/archive/20251120/202511201008.dBcwX4GK-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev20+g7033eb7ce
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201008.dBcwX4GK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511201008.dBcwX4GK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:366.4-188: Warning (interrupts_extended_property): /soc/clint@2000000:interrupts-extended: cell 12 is not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:366.4-188: Warning (interrupts_extended_property): /soc/clint@2000000:interrupts-extended: cell 14 is not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:366.4-188: Warning (interrupts_extended_property): /soc/clint@2000000:interrupts-extended: cell 16 is not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:366.4-188: Warning (interrupts_extended_property): /soc/clint@2000000:interrupts-extended: cell 18 is not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:366.4-188: Warning (interrupts_extended_property): /soc/clint@2000000:interrupts-extended: cell 20 is not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:366.4-188: Warning (interrupts_extended_property): /soc/clint@2000000:interrupts-extended: cell 22 is not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:366.4-188: Warning (interrupts_extended_property): /soc/clint@2000000:interrupts-extended: cell 24 is not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:366.4-188: Warning (interrupts_extended_property): /soc/clint@2000000:interrupts-extended: cell 26 is not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:366.4-188: Warning (interrupts_extended_property): /soc/clint@2000000:interrupts-extended: cell 28 is not a phandle reference
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts:366.4-188: Warning (interrupts_extended_property): /soc/clint@2000000:interrupts-extended: cell 30 is not a phandle reference
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: /: failed to match any schema with compatible: ['riscv-virtio']
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: soc (simple-bus): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: pmu (riscv,pmu): riscv,event-to-mhpmcounters:6: [0, 0] is too short
   	from schema $id: http://devicetree.org/schemas/perf/riscv,pmu.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: /soc/test@100000: failed to match any schema with compatible: ['sifive,test1', 'sifive,test0', 'syscon']
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: /soc/test@100000: failed to match any schema with compatible: ['sifive,test1', 'sifive,test0', 'syscon']
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: controller@4820000 (foobar,cache-controller): 'cache-level', 'cache-line-size', 'cache-sets', 'cache-size', 'cache-unified', 'next-level-cache', 'riscv,cbqri-mcid', 'riscv,cbqri-rcid' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/foobar/foobar,cache-controller.yaml
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: controller@4821000 (foobar,cache-controller): 'cache-level', 'cache-line-size', 'cache-sets', 'cache-size', 'cache-unified', 'next-level-cache', 'riscv,cbqri-mcid', 'riscv,cbqri-rcid' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/foobar/foobar,cache-controller.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: controller@482b000 (foobar,cache-controller): 'cache-level', 'cache-line-size', 'cache-sets', 'cache-size', 'cache-unified', 'riscv,cbqri-mcid', 'riscv,cbqri-rcid' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/foobar/foobar,cache-controller.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: controller@4828000 (foobar,memory-controller): 'riscv,cbqri-mcid', 'riscv,cbqri-rcid' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/foobar/foobar,memory-controller.yaml
   arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: controller@4829000 (foobar,memory-controller): 'riscv,cbqri-mcid', 'riscv,cbqri-rcid' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/foobar/foobar,memory-controller.yaml
>> arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dtb: controller@482a000 (foobar,memory-controller): 'riscv,cbqri-mcid', 'riscv,cbqri-rcid' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/foobar/foobar,memory-controller.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
