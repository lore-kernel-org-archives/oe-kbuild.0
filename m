Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F169F3246E7
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069240; cv=none; b=lG4srbrQu2U0IworAVHR9RD9pHo0DxZHBCldUdZmsHMc8gw1xCb/GQbcU06zY7xIRGJDPauFo+BSYq30QVukeQGK/ER297GAirMX5X7udq5JafN0tJ2JxUvqt4HcC3zqbt9nLPnGEQtYfDevAu/FRN5mYaOduO0PgfBkU6Mduhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069240; c=relaxed/simple;
	bh=9RzuacykYhsnJFX4LETyrtQMBegtOjq2OkPebwQfQM8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hesPPWBrMdHq2cPpFI/8MgptKsHFmVcVsd6oBC9rNlQ0RQlmjaxM/FFMFrjkjIY+dKbmW0albAxjZrcZaNDvP0oFoZRirfEFXSrDlzfuM7IuSCTGV3CW4MaxbzTvWyg4eNI2rGDysXq4I5Ner672m5sEqy9Z1mj811kaPSy8g1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nz41Nh/1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nz41Nh/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069239; x=1794605239;
  h=date:from:to:subject:message-id:mime-version;
  bh=9RzuacykYhsnJFX4LETyrtQMBegtOjq2OkPebwQfQM8=;
  b=Nz41Nh/15Ul6VB3ALOH7yJ9N+hMTA6c5tNbiPmwRLvCiLI7BBTaAf841
   GxIGMV/XfdwO6CwuZi80MG8lNb1LDRYgHOum0yLhjAdnBr45QqpheGupY
   zSe04odHQMXfDPhjhQT8PlbaZPHojlCcuNyE6FR5B5kiZmnukj1wIAcvm
   EOL53kxwERYHvKflqReiANAIL7wfiRn6zn2La2bC78sk8/Hw6+tNc6wBi
   dQeSyFaQoopdKsQaYEmAFsLwlHKTH1FJzSrxmH7tDOdvPBTx9/ykH1dGA
   yXZBxRB9dyC3w/akFt0NdRiJWN71pnMRDREQz0xcYDyzLP1y1BetZ/zOK
   g==;
X-CSE-ConnectionGUID: ZTIgKz8WQZWRDHfnfLy7SA==
X-CSE-MsgGUID: H2DY76oZSmqdQhH2mKjgHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64871228"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="64871228"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:27:17 -0800
X-CSE-ConnectionGUID: ykXLc6JyQsS5xNiTf6ksvQ==
X-CSE-MsgGUID: vB+p2JpEReavLibDRmLh2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189450238"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2025 13:27:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeqX-00000000197-40Nn
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:27:13 +0000
Date: Thu, 13 Nov 2025 22:26:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 264/867] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202511131832.FOFoy8nP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Francis Rossi <francisdrossi@gmail.com>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: 038107d7a62b15fd606219cc43e94ab40be0be49 [264/867] bcachefs: Switch statement evaluate ids and confirm they are unique going forward
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131832.FOFoy8nP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131832.FOFoy8nP-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#22: FILE: fs/bcachefs/sb-counters_format.h:128:
+	switch(0){

ERROR:SPACING: space required before the open parenthesis '('
#22: FILE: fs/bcachefs/sb-counters_format.h:128:
+	switch(0){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
