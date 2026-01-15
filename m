Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA72253F13
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 02:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768445943; cv=none; b=DZpRnHLJZ5ugGp+EDMxEL+6suFbcWfBRUlnoYYRjnYODPtf0JzmNSuOLQhiyuVnqtJSemkcLQeZJgKBi0buoXjug4mhg78zjYZgwNNzyXOmx+S5Ww2aZEkIaRg09349kChOVY0UsskskR6PZPHu3QbjP292QVTKKoxkjXQFx//w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768445943; c=relaxed/simple;
	bh=RZtW/uQWPMjBPXG6j/z046HzyqhT6vS/BHOhBdMQEj4=;
	h=Date:From:To:Subject:Message-ID; b=KsW0thJsyVfdkbpYJjYuJ183ifvQDqacaQTXBpQ3K3V7vj8dz1Mzp2xxGt2bZfxYRWiYOsaQkL3PMsuoYwcgyerxJsPoiDlR3jctuqMnzgcG8xxdxJNJHFHiPz/D89ZjC9seK+hIGg992laDE5t65H8RdQP2KWnpHO04y0zsEmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jqkO4KEZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jqkO4KEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768445943; x=1799981943;
  h=date:from:to:subject:message-id;
  bh=RZtW/uQWPMjBPXG6j/z046HzyqhT6vS/BHOhBdMQEj4=;
  b=jqkO4KEZXzuVnBdb2HKLtxeoWpaEPV/2LmuFS3tjKnysn9yGtP7VHyG4
   /lgQOe85+0zN8FLHacAB7S0u4eaoK/ojefoni6jYdQEHxFapeDjJXswD0
   IP+MuOVkR/HTKdR12sc3ZgofiJp9Qlg3TMB0y7SEiCIu4jcdT+5+MzLGz
   rnCOe/mR7aurwLMUzeYPj//7YzfbzfJaL1On2rBubGUlSvJLCAXIUMgTG
   UkAi87zM4cHf3XnQSewmLekb1iU/JchtpfGW8CSjt/z/2jsaBnit3O+Jg
   ttxh0VFMqhyJLPLVMZxdv32t67utqC3v9z7Z8nc52STRCdscWFC+w3+ml
   w==;
X-CSE-ConnectionGUID: Z8BisH5/R/uMNm6BOZ3PRA==
X-CSE-MsgGUID: rdkqZA1fT5apnKoBMlfaLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80863270"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="80863270"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 18:59:02 -0800
X-CSE-ConnectionGUID: OzNrabA3Rfi8c+raHrI8EA==
X-CSE-MsgGUID: kROXdz4QSBabxOjlfqtLNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="209892462"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 14 Jan 2026 18:59:02 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgDZb-000000001Uf-18jN
	for oe-kbuild@lists.linux.dev;
	Thu, 15 Jan 2026 02:58:59 +0000
Date: Thu, 15 Jan 2026 03:58:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/cxl/controllers/v4 1/3]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'to'
Message-ID: <202601150319.IqcMXRyT-lkp@intel.com>
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
TO: Gregory Price <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/controllers/v4
head:   f5ef590422b49660add3a641b64825492f5426b2
commit: 18c1ec321f89eb27607928e866559d123ee0d90d [1/3] drivers/cxl: introduce cxl_region_driver field for cxl_region
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260115/202601150319.IqcMXRyT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#22: 
The intent is to clarify how to to add additional drivers (sysram,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
