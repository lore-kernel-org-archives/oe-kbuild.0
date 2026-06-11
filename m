Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155EC3D9670
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175894; cv=none; b=dw+VMIzHSER5QUXmO/HQOHaW1NiYGDZbzUbflY9ooTS2W8+aHl90wQIyFlopin/n+0dgwaJRaFSbq1BC5jJ7SKQCub0adyZb2ymvs+rvRLryDSuE4dDUtpx9HyMIX6L5UN/BwNeBUD8tIy1Rq+7HJpV8r3vGzMQTH+xKMsKKQbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175894; c=relaxed/simple;
	bh=FDEfCKVKd0HZi13JRE1JkvYe4KZ7A44LnPhYALM5hVc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hdfjVtHcYgokTv0ekvHma3r8eRBgWNPvAB8+UunyqQXGrhuIwnXsKSDV4d98dAU0Ync/9QFueyp/eNAgTFwvpqAO8Smrc6tF9+BedS42G29CxG3CMLavg2bLkzjiCVKs5+DHmpDejoOI0HBs7S6apffrdVNmVbAyj3yW0Xsg3kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZNkBek+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZNkBek+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781175893; x=1812711893;
  h=date:from:to:cc:subject:message-id;
  bh=FDEfCKVKd0HZi13JRE1JkvYe4KZ7A44LnPhYALM5hVc=;
  b=ZZNkBek+cIYE8vYO0jduUV0UId4YEErLSkgomhv5jqgtmwaIhzOGiqai
   J5s2di2Xl2VIvLzCd7HjXAYx1wjoSl5jV5ReBWNRxYyLNkD3CdpT0P/fB
   84HUTe8lMJIlagioEZHxyz/4iHiL/aOp0knolrLJvGXqLL0inARwGS+Tx
   pfajpmpNJHp+8NKwLG5YOGQlakig0dUZG5BOku9JHRQHeFx0h4ZeptCKV
   W+XTfJt4N+mzkghVWlLawOxAgk4ZjS5QzqB/h7aLXh7OK5kg8ZMXtbAVM
   R5jd/ICqLbT29YfEqfvWQzec4MSRxKY5Il6S+C4BEJ559nCJk37wR2SEe
   g==;
X-CSE-ConnectionGUID: fs5EIkqjRxe2Vz4Up0prFw==
X-CSE-MsgGUID: QewBC2KqQI2RwxdlZLuo1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81990561"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81990561"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 04:04:52 -0700
X-CSE-ConnectionGUID: ZZWiZxGfRROZ+0JpcFOvxA==
X-CSE-MsgGUID: O0jY/b6MSMao7BA96lGqjw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2026 04:04:50 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXdDM-00000000405-2nQB;
	Thu, 11 Jun 2026 11:04:48 +0000
Date: Thu, 11 Jun 2026 13:04:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peter-chen-usb:cdns3_kconfig_reorg 4/4]
 arch/arm64/boot/dts/cix/sky1-orion-o6.dtb: /soc@0/usb@91d0000: failed to
 match any schema with compatible: ['cix,sky1-usb3', 'cix,cdns-usb3']
Message-ID: <202606111237.vIFRPODq-lkp@intel.com>
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
CC: linux-usb@vger.kernel.org
TO: Peter Chen <peter.chen@cixtech.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git cdns3_kconfig_reorg
head:   92f1268518fcc084e175fdfeeadc03f0b9d125f2
commit: 92f1268518fcc084e175fdfeeadc03f0b9d125f2 [4/4] arm64: dts: cix: add Sky1 USB4 and USB5 controllers
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm64-randconfig-2055-20260610 (https://download.01.org/0day-ci/archive/20260611/202606111237.vIFRPODq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111237.vIFRPODq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606111237.vIFRPODq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/cix/sky1-orion-o6.dtb: /soc@0/usb@91d0000: failed to match any schema with compatible: ['cix,sky1-usb3', 'cix,cdns-usb3']
>> arch/arm64/boot/dts/cix/sky1-orion-o6.dtb: /soc@0/usb@91d0000: failed to match any schema with compatible: ['cix,sky1-usb3', 'cix,cdns-usb3']
>> arch/arm64/boot/dts/cix/sky1-orion-o6.dtb: /soc@0/usb@91e0000: failed to match any schema with compatible: ['cix,sky1-usb3', 'cix,cdns-usb3']
>> arch/arm64/boot/dts/cix/sky1-orion-o6.dtb: /soc@0/usb@91e0000: failed to match any schema with compatible: ['cix,sky1-usb3', 'cix,cdns-usb3']
--
>> arch/arm64/boot/dts/cix/sky1-xcp.dtb: /soc@0/usb@91d0000: failed to match any schema with compatible: ['cix,sky1-usb3', 'cix,cdns-usb3']
>> arch/arm64/boot/dts/cix/sky1-xcp.dtb: /soc@0/usb@91d0000: failed to match any schema with compatible: ['cix,sky1-usb3', 'cix,cdns-usb3']
>> arch/arm64/boot/dts/cix/sky1-xcp.dtb: /soc@0/usb@91e0000: failed to match any schema with compatible: ['cix,sky1-usb3', 'cix,cdns-usb3']
>> arch/arm64/boot/dts/cix/sky1-xcp.dtb: /soc@0/usb@91e0000: failed to match any schema with compatible: ['cix,sky1-usb3', 'cix,cdns-usb3']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
