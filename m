Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B620417BC3
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 06:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145967; cv=none; b=T9SGaGf9A+30eu3EmNL8d9kMjz7fAsT7zdKwaGWr/WtNSunNFkg5MxufcmWzGCnF1rzPU2ZDqnFxBz7kQ/7QE0hnB8twtvLVTDQQzxY5ubs8x/IUA8pDHlBSglBURayLTRESxng07tyB9KIHohPtWX6/vYYs/Zi+XqWyAIqb92k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145967; c=relaxed/simple;
	bh=BHOeOX2BLr4pyrDQ+mGeYLiyKMI26yPGRy+qMqqwOtY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gckNkQznwzqRFMEZg0dLVask9MqKwlDoDA7XP7f5OCshXP/SITEntmSt06+QC43TQvP+dADtWJbYlTbKkCCokb1nvdBbrsrEJUu4g+JUZwqF7WCC4XB90THuWvwW73FwEp7Pa5ZVSgv+8P/ejp+d/tndY4cg1IP27tB67b7OWok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mpICnuGe; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mpICnuGe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790145963; x=1821681963;
  h=date:from:to:cc:subject:message-id;
  bh=BHOeOX2BLr4pyrDQ+mGeYLiyKMI26yPGRy+qMqqwOtY=;
  b=mpICnuGeNVZ/BAWGEjClyZvR+2+V2nxqz7DlbhS0paVqNf8gJIpGcjTM
   UUZwQz83ZyLB6pPLPL+UA/feJNJ8YMcZQ55zT5fZlzDLHNBO10T4ADhWI
   p+4xdgiF7rm64OTMXOF4j8YIX6M46hMiP4IYnpSO/VTc5IvSoRPnbNc0w
   ziWWecBbtB6NcvhJmyskrHJ7UjORNshdNI60mgjh0KLhx4etV+oECQW3A
   GOF35/DHcIO3m7TtjWzAfOknfankjYLw23sSafhaaYlDCO7THbsNGxbaA
   Ffmw+tXnn8JFnu3w0tzvWf7EQpjRYT8dBtP7e0L5BxnEvNWFCgyOC2UiW
   w==;
X-CSE-ConnectionGUID: VeXfZKGdQBWWYxs8OCc81w==
X-CSE-MsgGUID: FOK7L9vKRzmltLHbiE3Nsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1314995"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1314995"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 23:46:01 -0700
X-CSE-ConnectionGUID: WmdJIRwwQjaPqZoXBWSHKw==
X-CSE-MsgGUID: 1w7ctG+/ROKm9U3D1tFegg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4547047"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 22 Sep 2026 23:46:01 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Gju-000000000YV-1dra;
	Wed, 23 Sep 2026 06:45:58 +0000
Date: Wed, 23 Sep 2026 08:45:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/dwc-rcar-gen4 8/9]
 Documentation/devicetree/bindings/pci/rcar-gen4-pci-ep.yaml:
 properties:reset-names: {'minItems': 1, 'maxItems': 2, 'items': [{'const':
 'pwr'}, {'const': 'core'}]} should not be valid under {'required':
 ['maxItems']}
Message-ID: <202609230819.0wgao12k-lkp@intel.com>
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
CC: linux-pci@vger.kernel.org
TO: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/dwc-rcar-gen4
head:   7fc9907223d6fa1bea13f896af7d0c77b36724e0
commit: 173cc7417848f8a2cee6042ce20c675133b72188 [8/9] dt-bindings: PCI: rcar-gen4-pci-ep: Document Application/Local register reset
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arc-randconfig-2401-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230819.0wgao12k-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230819.0wgao12k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609230819.0wgao12k-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/pci/rcar-gen4-pci-ep.yaml: properties:reset-names: {'minItems': 1, 'maxItems': 2, 'items': [{'const': 'pwr'}, {'const': 'core'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml: properties:reset-names: {'minItems': 1, 'maxItems': 2, 'items': [{'const': 'pwr'}, {'const': 'core'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
