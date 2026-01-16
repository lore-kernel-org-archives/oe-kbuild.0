Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139AA2D594B
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 21:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768599741; cv=none; b=sRtes7maMnjYgOdo8+xL2SrEsJ48LnieFACeEw0pYfhIFNYk02VcMB2aRtev79EAcUFHtVFE/1v2snKX2ipZ5TVZTAlDQFJnSj3dPPu6X/gvfqqm5IgBOD4FNiqIak+cWBUg/FeSlmK45Auwtkq11denwVKsd90lWSpv23zTNbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768599741; c=relaxed/simple;
	bh=ZM6rdfg6Z+id8lZ76q3to3CgeVTX9HkpPrdyezM4+pY=;
	h=Date:From:To:Subject:Message-ID; b=DBSvduSL7RSUzmwPvJoB5dnEkKf9q6tXg9pYzH/UKiJlPThgP+pqHl5fBj7Xp5uH7WcfMqZQ4mE94sGYWz727pLz486Myh9a1B/YxQZVqFlYCo98ZiqGRbrp/O09IdzSuFD5RYYdrQ26pNelNqHh3SnRtTyaqtnkp9o0+aV7Evw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G18YhVvz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G18YhVvz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768599740; x=1800135740;
  h=date:from:to:subject:message-id;
  bh=ZM6rdfg6Z+id8lZ76q3to3CgeVTX9HkpPrdyezM4+pY=;
  b=G18YhVvznU/W9Mo2UnOxIIeR3MuSCAo9hL3cB57i1Hvpa+ijwOSGOdzr
   jqf5Sa1J7oxRqyrxdmBgWlBDsWTKOKDFTwc2GW4xZA6slfZNaVwZaHIMI
   ycwX6KUzWCkNRzknvecDA2JLq5lipzvS7+e4LI2krq2iF2EPbrM1+mkh6
   XurgdjdkW2IEIndZInmMHoijxwnXqoCebz25h/MMzicls4CW92wfM2RDM
   qmDe88ihdWv4HTrje+CpBUPaq/q8U3uRFlx8x5DvxiZwL54/s+/PBJ+Pz
   h/5DRGpnjsjYofWC5/A/1a6DwjdEDjm7TQ32TpTbIamkCbCApHd9FMn1H
   A==;
X-CSE-ConnectionGUID: x/YEUK3cT1S2wV98vUsGmw==
X-CSE-MsgGUID: sedc/zkfR/Onpz1OXpnDgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="87334885"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="87334885"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:42:19 -0800
X-CSE-ConnectionGUID: 4lixznkuScOrFR1cMR312w==
X-CSE-MsgGUID: kY4tN2v5Rpa3FV1bThI4xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="209475306"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 16 Jan 2026 13:42:18 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgraB-000000001rZ-1dRy
	for oe-kbuild@lists.linux.dev;
	Fri, 16 Jan 2026 21:42:15 +0000
Date: Fri, 16 Jan 2026 22:41:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [pdx86-platform-drivers-x86:review-ilpo-fixes 36/37]
 checkpatch: ERROR:BAD_SIGN_OFF: Unrecognized email address: ''
Message-ID: <202601162228.DdVdjTHp-lkp@intel.com>
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
TO: Mario Limonciello <mario.limonciello@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-fixes
head:   791c3c82091eecd862f0d55a7c7a3302a518f599
commit: bb820f17b68f624547357e207ce9a8c7af3e7845 [36/37] platform/x86: hp-bioscfg: Fix kernel panic in GET_INSTANCE_ID macro
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260116/202601162228.DdVdjTHp-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: ''
#32: 
Signed-off-by:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
