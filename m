Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C2E17B425
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 11:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771068239; cv=none; b=UfXJsCPt5XzPJvDMUgessfRcyvBxIaSO6GjkmsHBHqfHAXwmhi2SYQFOZ+tC/xBjUpAwL+oAgBsLqwGoCwJMxV1fUXRUe2xRp42qtrjETdcx7BNvQqmeadsFCxHxQL9JtF7v+l+taKYU91IjdGt6nUljceuqUWtxXjwQuR3tU6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771068239; c=relaxed/simple;
	bh=NyCSzItmxGR4NFDTRarCU1qfTEKHBMdv/6gTPiooPK8=;
	h=Date:From:To:Subject:Message-ID; b=U1C0fbjc37pEDI5q8ue1L3epwpYcqahC8Dyv5kbMTsho6kUL1Tsx7QzeKdomEyoEHDnF+LW0Tf0r29tqJcGvgleHLZkKbbiRf1Td764so0OiBDPxPyH6jemE5xFv+DZjrEOP/fGlMKlOA72Drt+G1lxuxtZqhYNEvP3BDceGXPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AijAnuJE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AijAnuJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771068239; x=1802604239;
  h=date:from:to:subject:message-id;
  bh=NyCSzItmxGR4NFDTRarCU1qfTEKHBMdv/6gTPiooPK8=;
  b=AijAnuJEmfH0fjeM6AlAgTZsTHxieEg52ATBvLBe9WB2G6xmiHcxTVho
   JIyVR8nrY/QiImYi3ZgGi5YN7LjbPGA3jCfpkR70KR48DX1FLysszWHPa
   ZxpgO5hBpnlmZKPY42cBYol9jk9lOuAPSuzuUdmThsVtfErk/gCBETW+j
   jKtgLLhMvUojtvv28KwETcUTISMg+07QS6e8SlmOSyZjNvqPweaji4gYx
   mS4UFbV3gWfSDA0Hbfbgj9txwf9YiI62xeuS78siyOMMbfAEXiHa/LmDI
   jinCTG6J45s8pPIQIogZj5JlT1Ju36qLzjE1P/e1Qz/+dFlw4RJiuq1w5
   Q==;
X-CSE-ConnectionGUID: zZl9ZhYoTxq1132i+TOUZw==
X-CSE-MsgGUID: 4Z2O1GXCTtKXxrdCG5JN7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="75857086"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="75857086"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 03:23:58 -0800
X-CSE-ConnectionGUID: BSbFUBSUT1SE6okODFqHMg==
X-CSE-MsgGUID: qqAYJ4XjSi2vtdOrS078Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="211799071"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 14 Feb 2026 03:23:57 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrDkh-000000001pr-26yP
	for oe-kbuild@lists.linux.dev;
	Sat, 14 Feb 2026 11:23:55 +0000
Date: Sat, 14 Feb 2026 12:23:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [wsa:renesas/hwspinlock/refactor-alloc-buildtest 8/21]
 checkpatch: ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202602141224.jjzm2oGo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest
head:   d52a5165d1428debb5772cb5363a286aaad35aed
commit: 6f6559738f2ea5a9ea4c278d44ca5960d18cdd1c [8/21] mfis adaptions
:::::: branch date: 7 minutes ago
:::::: commit date: 27 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260214/202602141224.jjzm2oGo-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#70: FILE: drivers/hwspinlock/rcar-mfis.c:95:
+static void * rcar_hwspinlock_init_priv(int local_id, void *init_data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
