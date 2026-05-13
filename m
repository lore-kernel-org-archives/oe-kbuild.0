Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B377E3955CF
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 05:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778649701; cv=none; b=meNxLLT0AUJRpS7sFspIv/c/n046DfQAF+FjxMdvkiZXIuz5/DAwifSv9pWmmrSkpv+m6wVqg/rZoyuEDHclst5fFu/ZKh68Mdsn6vsg4hfxl9M+Y6/cahUpeiEasro6DWovxymAZ0hZnBYaG58X3MNtPXu+6/TvvHjIPSWckvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778649701; c=relaxed/simple;
	bh=glJVzQ84Kq3FRggXe+qoM/S8FqP4ssIHqM5qiagumHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JX4Rzqd/6C3D7gLFKDTXEEpcpuKahJ99Awbt2a6jcRKWVKVLEFdAf+mRCqklqHHUOvquPoK640bAimE/Sjog47W0vj7x/gSZ4Ohp05Chgl2Mk27GbjFrVbUvth2th07agShx1NuCkBKH23N0+ejhbS8WM/LZcTfTAUhDpF1YzJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXGl2Juf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXGl2Juf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778649700; x=1810185700;
  h=date:from:to:cc:subject:message-id;
  bh=glJVzQ84Kq3FRggXe+qoM/S8FqP4ssIHqM5qiagumHQ=;
  b=EXGl2Jufqlh5VGlncxbJAJLCQfW0YfxfO2ypzP3nYlXBOsKos7kpqgaB
   OzOI7zodDZEfb0VpBpCkD1441uWvvlElbEiyNBC4o3lH1GqE8VOqNRETx
   kR37o8pQFp7s/257eUyK/Dk0io7DU5VVG08GzKwJTw/ze1tYICwcLxTtH
   tH9K2PCd1goXV6eMWnTx5h4mmI/dyWNRNyyeFfNyOCxpnXbPIR8fqjd7C
   2xTcz1CLyP9ZIqIjWBDFLNiObNhy8NtC5sQo2O6TKHH0/4ur3Acx5FrgS
   8yrjQs/yuM9iJhYtmwwSftDYwHQs/m/juKqvsT6P9dvxzNy2p8CRIopbe
   g==;
X-CSE-ConnectionGUID: L+8c+K5mQFW3aamtDxqZfQ==
X-CSE-MsgGUID: eFIA/eLySHKBvlBctus/zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79281485"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79281485"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 22:21:39 -0700
X-CSE-ConnectionGUID: 74qLjGAoQV+X/AH+ueRFPQ==
X-CSE-MsgGUID: PrJScLt5Q4Wh7ikYoUST5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="261470733"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 12 May 2026 22:21:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN22J-000000008TV-3yqV;
	Wed, 13 May 2026 05:21:35 +0000
Date: Wed, 13 May 2026 07:20:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml:
 properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be
 fixed:
Message-ID: <202605130705.Dvuey8te-lkp@intel.com>
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
TO: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 94fcd39ca255758335ace05f70365f2126190ee0 dt-bindings: net: wireless: describe the ath12k AHB module for IPQ5332
date:   1 year, 2 months ago
:::::: branch date: 11 months ago
:::::: commit date: 1 year, 2 months ago
config: openrisc-randconfig-2051-20260513 (https://download.01.org/0day-ci/archive/20260513/202605130705.Dvuey8te-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130705.Dvuey8te-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 94fcd39ca255 ("dt-bindings: net: wireless: describe the ath12k AHB module for IPQ5332")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605130705.Dvuey8te-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/mmc/hisilicon,hi3798cv200-dw-mshc.yaml: properties:hisilicon,sap-dll-reg:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml: maintainers:0: 'Frank Li <Frank Li@nxp.com>' does not match '^(.+ <[\\S]+@[\\S]+>|[\\S]+@[\\S]+)$'
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml
>> Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml: properties:qcom,smem-states:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml: properties:qcom,smem-states:items:2: 'anyOf' conditional failed, one must be fixed:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
