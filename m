Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C376F361DBE
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 03:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135452; cv=none; b=MDTAx5+edyn1KkylD1r5RIaJdlJPhrWMRgAVFk8gvHjrV7uIFIVHUDz5ypYRMWrXwXNYAu3zYo82B/iXBIu2CBVk5FagE0EbGU+nUVOAbKUS6wDvJKR4767ZNEz4hWF/5xCyUQvwWI70fE9EwMeiZ5lAodN4FDo08vQZTxKTrPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135452; c=relaxed/simple;
	bh=A4iskOZ4jJ2rihrxUIgHTxmFfRUi8atPdlZdHQeASBM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=csEWWd7awTsOv6JzOlZF2El+QwTucW3Z8eKdlFmIAX+fCWgZo600vK/LsqUXLnDNCRvwE5hGQXJtHvzbA7xKGr2rV2t7z8iwpl3rYr3gNEIqyr3ZMzNzgnjL3ab/RRP5qP6f9tQVm0FtA/id2trliSCsDYW4C/XhoCZTZPj6WwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJhoaTWP; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJhoaTWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790135450; x=1821671450;
  h=date:from:to:cc:subject:message-id;
  bh=A4iskOZ4jJ2rihrxUIgHTxmFfRUi8atPdlZdHQeASBM=;
  b=HJhoaTWPs4Qd212cOJVdYNj45CqDonyMT8DugsmAh4Kq4piq4NtW7Oog
   Lx9FSQMpwTTX2lxqlGzx1tGwAbTDyHOHt95nLc52JjsoYsjZW/SE5B7kt
   z85jTpbz+Qb0+Gs8MG7bw4s8pTrLdYhKBpExTS32rGFWdnnQ3uKAzWfyA
   DMq7hD2waBABODDYfGqa22EyPCwaFAwiVyWjRss2lqbMc/vi3kQOz8jPL
   A9Y1UVadSi3K9A9+54+Md5GP2xFcMSVKO9N4DS6h/lfR42A5c5zt38342
   hFdAEw2B56bOc7SImyXa9rQpe8ERgmfYpVFSvctAypoIJvsJI24/l+xrH
   g==;
X-CSE-ConnectionGUID: JLurIdhYTsO9aNXIVMyLDw==
X-CSE-MsgGUID: p4ewzgwvSXupTgXGjVFp2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1288003"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="1288003"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 20:50:49 -0700
X-CSE-ConnectionGUID: ZqED5qw2R3OvfbW9VhqTaQ==
X-CSE-MsgGUID: K0Q6DQfNTUS1h6KVUfEKRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="281500113"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 22 Sep 2026 20:50:48 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9E0M-000000000Sz-2Tnw;
	Wed, 23 Sep 2026 03:50:46 +0000
Date: Wed, 23 Sep 2026 05:50:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/dwc-rcar-gen4 7/9]
 Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml:
 properties:reset-names: {'minItems': 1, 'maxItems': 2, 'items': [{'const':
 'pwr'}, {'const': 'core'}]} should not be valid under {'required':
 ['maxItems']}
Message-ID: <202609230547.zdjJoKk2-lkp@intel.com>
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
commit: 50b1333e0c7b40ca203e8c5834ea1ffa7362097c [7/9] dt-bindings: PCI: rcar-gen4-pci-host: Document Application/Local register reset
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arc-randconfig-2401-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230547.zdjJoKk2-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230547.zdjJoKk2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609230547.zdjJoKk2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml: properties:reset-names: {'minItems': 1, 'maxItems': 2, 'items': [{'const': 'pwr'}, {'const': 'core'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
