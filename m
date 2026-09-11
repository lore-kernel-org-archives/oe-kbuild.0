Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B6646D572
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 09:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117765; cv=none; b=BpiomTJ30GeQ6qgJxbWnfLhqYyQ7upEC42NewswyjbIlrwNj/cz8sdacCkUu3ViOvU7CDy0AOXjYsibK7xYkAcVTNIGZ/TDUuPTHcDtAcufYVblVI64l+4NN+w/yw0AraN+RO3WGHTICfMaH6WkMvob1CohkkLj2uywkQzcOh+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117765; c=relaxed/simple;
	bh=l4owZEpyLtDRuev0Agt5SIifEyiTyw2kLvlhJXt5iWU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gSJ62S3EE250ypGQBdEmDK2SjZPd11hqY7lzXtvtxTQNcprrX6CoMty0OZGnTU0dciMbDFm4Nsj/bzNf3bRMmLTTquBNdPzAve/V/dWMxt0nGwArM/2CbIgH27Yh9/rTGdsycvBMwuO+INlWAb/+X0tHRm5Si6V1sQbQ53qPGr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6D7HoEJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6D7HoEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789117763; x=1820653763;
  h=date:from:to:cc:subject:message-id;
  bh=l4owZEpyLtDRuev0Agt5SIifEyiTyw2kLvlhJXt5iWU=;
  b=D6D7HoEJyOSnt7GdMBK+8aNGFy888dnQh5kOX34hQZIUaLKrvtalzvTJ
   HkGA05Mg6z/RqYE7UxVQPpSdsttZVspCP9X14k2R0DWI2hGUpsSDtLsG2
   +k9RtOeeXCYdTQRkfdwb2XEkJQ2Tr/keYLLVvw+HEWJMeRxkjPXHD8zre
   4XDEK+QX7ZxnrGcVS6SH3uPnC985DU+deRSKanGOMLM+n8LEbVjc8zMou
   Eo0g2BzrmmSAiCePVpW5/DFdP05CNFOsELGnc7iDclgHO8CmSCNpPO+nt
   CKtECa4UDIVJf0jBENC+m/VN7UOIgJqwRP3H8JExPuP2Bc7dF8Z1DDq4v
   Q==;
X-CSE-ConnectionGUID: 7ZmESLZVTNCb89YLHyOufw==
X-CSE-MsgGUID: E6tp3rwrQMKo0sGZ3qgACA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89450491"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89450491"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 02:09:22 -0700
X-CSE-ConnectionGUID: wRRUGygPR3Ww+OCR2CWWMQ==
X-CSE-MsgGUID: z9yTLuFhSZuZ1q08FrWQDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="236952"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa013.fm.intel.com with ESMTP; 11 Sep 2026 02:09:21 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4xFy-000000001LA-39JG;
	Fri, 11 Sep 2026 09:09:16 +0000
Date: Fri, 11 Sep 2026 17:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pci/probe.c:1891:12: warning: unused variable 'rev'
Message-ID: <202609111648.eMDdSsjJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Logan-Odell/PCI-IOV-Make-VF-config-reads-match-PCIe-7-0-spec/20260910-103648, commit: 21c24671e9f5da453547304c9f06a1536c6ff4d6"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Logan Odell <loganodell@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Logan-Odell/PCI-IOV-Make-VF-config-reads-match-PCIe-7-0-spec/20260910-103648
head:   21c24671e9f5da453547304c9f06a1536c6ff4d6
commit: 21c24671e9f5da453547304c9f06a1536c6ff4d6 PCI/IOV: Make VF config reads match PCIe 7.0 spec
date:   11 hours ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260911/202609111648.eMDdSsjJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111648.eMDdSsjJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609111648.eMDdSsjJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/probe.c: In function 'pci_class':
>> drivers/pci/probe.c:1891:12: warning: unused variable 'rev' [-Wunused-variable]
    1891 |         u8 rev;
         |            ^~~


vim +/rev +1891 drivers/pci/probe.c

0b950f0f3c67e4 Stephen Hemminger 2014-01-10  1887  
cf0921bea66c55 KarimAllah Ahmed  2018-03-19  1888  static u32 pci_class(struct pci_dev *dev)
cf0921bea66c55 KarimAllah Ahmed  2018-03-19  1889  {
cf0921bea66c55 KarimAllah Ahmed  2018-03-19  1890  	u32 class;
21c24671e9f5da Logan Odell       2026-09-10 @1891  	u8 rev;
cf0921bea66c55 KarimAllah Ahmed  2018-03-19  1892  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
