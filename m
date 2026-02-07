Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7792517AC
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Feb 2026 01:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770427676; cv=none; b=A5zzwD68muXlJUb5NoD7CeNo+2s+maKG3bmL9RHCBnMB3C+jC3rkYmoCSGd0AVgd9h7CarzRRi5gapZrhlEpMaJ44jIeqmADm3nq+x4w9HNUqVZ8OKyh8pQd4xsb1IX93CtBaH2zE1UXpJzk3l3j11XeoHUgVIktis0ignCToMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770427676; c=relaxed/simple;
	bh=41cSGqEW+6RVUJ1dH5DKWSNOCBHDh2J3XTbNJziP4F4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NHTyxPnAJp7XGg5iwX5qbovWb49sdEfYT5taK2FO19Dk2Tmg+f1Mxv4zJkHfO1jQgT+ngqNlwEwiTB42Mzr1a/uwA8L4yoHOdQuWsDcgHFvTtW7NS23r90f1lw4vAALL14vyCXpiESeILY2GCoVj9+UxH9+RKKmiUh6y+tUESeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKL8xlis; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKL8xlis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770427676; x=1801963676;
  h=date:from:to:cc:subject:message-id;
  bh=41cSGqEW+6RVUJ1dH5DKWSNOCBHDh2J3XTbNJziP4F4=;
  b=cKL8xlis7Sfj3vkNeUVYarU1XkKhhcyTpOBP+jotWqYLbBMxq2/+34kw
   D31/esNlgEH9PtEk88osfKXcT2UhQzzmcn8VNi8Sj1Srqo1fZRHS+ECT/
   fja4/ghlv5m5cxIYsHApmaHsZs8ktACTvWoir7fmL/U3NLh5iLHe/6xKC
   AsOot9pRNyfZltGUsOEwQVWQXqo6FhaBvwqbwC4d1HX7lo7MWa1R2yR0L
   C16XkcxN1Vq1aryM7fCXgbWXQnBZ/6+b/ilHTJBzXroWwfYHCF7Krvcsm
   Q+4998zKX3xpwu4ihXtIdEenefFOhnCZWO9ff2GguCrkMlUcix2OmhJmi
   A==;
X-CSE-ConnectionGUID: xG7eBvkMRUmgRPMP38BPUA==
X-CSE-MsgGUID: j4+p3ZvyQTGlojuTd7Zkmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71702592"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71702592"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 17:27:55 -0800
X-CSE-ConnectionGUID: IKaezPSVRriFTutXdiOR/Q==
X-CSE-MsgGUID: unPkXgw7RP+ILw0H9pFA9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="248645661"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 06 Feb 2026 17:27:55 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voX71-000000004lh-3y7X;
	Sat, 07 Feb 2026 01:27:51 +0000
Date: Sat, 07 Feb 2026 02:27:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/xtensa/boot/dts/virt.dtb: pic (cdns,xtensa-pic):
 '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202602070220.CGaTMhMI-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2687c848e57820651b9f69d30c4710f4219f7dbf
commit: 1ee0fd43803bf82b5388db9b406c1b5e1a08cac8 dt-bindings: interrupt-controller: Convert cdns,xtensa-{mx,pic} to DT schema
date:   9 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 months ago
config: xtensa-randconfig-2051-20260206 (https://download.01.org/0day-ci/archive/20260207/202602070220.CGaTMhMI-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070220.CGaTMhMI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602070220.CGaTMhMI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/xtensa/boot/dts/virt.dts:48.6-71.4: Warning (unit_address_vs_reg): /pci: node has a reg or ranges property, but no unit name
   arch/xtensa/boot/dts/virt.dtb: /: failed to match any schema with compatible: ['cdns,xtensa-iss']
   arch/xtensa/boot/dts/virt.dtb: / (cdns,xtensa-iss): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/xtensa/boot/dts/virt.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
   arch/xtensa/boot/dts/virt.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['cdns,xtensa-cpu']
>> arch/xtensa/boot/dts/virt.dtb: pic (cdns,xtensa-pic): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/cdns,xtensa-pic.yaml
   arch/xtensa/boot/dts/virt.dtb: pci (pci-host-ecam-generic): $nodename:0: 'pci' does not match '^pcie?@'
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml
   arch/xtensa/boot/dts/virt.dtb: pci (pci-host-ecam-generic): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
