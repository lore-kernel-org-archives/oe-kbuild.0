Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5BD30F526
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 06:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778654023; cv=none; b=cIUv819l9Oo7Qv5mNltdylnPc8bdqKfzgYLCLgCAoiZ3tDMAMmsfXCVt/13tKmQDaPGmQq42PS9BPpG1+UNhXeUPexhmhnfg6sRMzKxFyCaNm+5oP8GGGFDTzgwKRpBL7BM3rWr30L+2w+bwZW1+j48Npc/4QSwOlpKWt6gUzGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778654023; c=relaxed/simple;
	bh=xcuwbIZn3+XnvdFP4z7HfxHsYPQ3p4+rbkvXjhoz4i0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NR2EcgTbzX0zth5S6rWsTNy/GtHMgAnHTkGdpK7akDqup9Qz+hxpLjL1hQKFKpAn0/GDzDsmynHZRIpI4GvsgvAyLIjEIbHgRJYh7eiEtwNNd3WAf/qcb0RLzcIRQcaHzkGn1GdKo1yT0SfTKtX8xzXHeVDgPTCYid3rAeuuAYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gBgjbaL1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gBgjbaL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778654020; x=1810190020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xcuwbIZn3+XnvdFP4z7HfxHsYPQ3p4+rbkvXjhoz4i0=;
  b=gBgjbaL1nPt3vwOAcAbnIf3ChrZybaSP04doO6RcvEgbS/mWiq9c04s5
   DJ3aAWH/MWiZiIwF4jsmXKIDJd3KKckEg8dsEaNg5/hVJWcKFGUHM1u3r
   w+SYWFi74QsErsXxp51gHU+6UvLcTXstUN3b83RelDbWassjRxC60X3F1
   Wv5thB6+tbkP4iGMyGHHfN15Hbrl02WxBwRFWIg/7J0m51aCdefA0OMzo
   ZneDL2eIeZNlxhhlg+Z0MYZesNFJk2eDasX6UhZ95GKS/4EJe/gT2NKYN
   9X6t9kDw7qq+1zOwuHiAJ+0jeW5EqUb5MDl40Mret+TPxxWxnt3jhzpWJ
   A==;
X-CSE-ConnectionGUID: 3cmpdhoqSniSRyRcm1Ci3A==
X-CSE-MsgGUID: OQgzGTxeTvGyKSQI23Bv+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="82141632"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="82141632"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 23:33:40 -0700
X-CSE-ConnectionGUID: 6QCqBxHwR0O9li/x7ZhyuA==
X-CSE-MsgGUID: x7CTyvHYSh+HvAn+XhJq/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="237143541"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 12 May 2026 23:33:39 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN3A0-000000008UT-3Gpa;
	Wed, 13 May 2026 06:33:36 +0000
Date: Wed, 13 May 2026 08:32:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 =?us-ascii?Q?Documentation/devicetree/bindings/display/rockchip/rockchip?=
 =?us-ascii?Q?,rk3399-cdn-dp.yaml:?= properties:extcon:items:0: 'anyOf'
 conditional failed, one must be fixed:
Message-ID: <202605130846.EhdQ7gcU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chaoyi Chen <chaoyi.chen@rock-chips.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 70a299ed2e03e7ef26e5be7889bab1a47960ed25 dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml
date:   12 months ago
:::::: branch date: 11 months ago
:::::: commit date: 12 months ago
config: openrisc-randconfig-2051-20260513 (https://download.01.org/0day-ci/archive/20260513/202605130846.EhdQ7gcU-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130846.EhdQ7gcU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 70a299ed2e03 ("dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605130846.EhdQ7gcU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml: properties:st,syscfg-dlyb:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml: properties:st,syscfg-dlyb:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml: properties:extcon:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml: properties:extcon:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml: $id: 'http://devicetree.org/schemas//soc/fsl/fsl,ls1028a-reset.yaml#' does not match 'http://devicetree.org/schemas(/[^/ ]+)+\\.yaml#'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
