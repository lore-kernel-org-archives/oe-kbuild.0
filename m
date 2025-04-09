Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F3C5FB95
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Apr 2025 01:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744163492; cv=none; b=jT2jpOCYQ5jS/8VNv75TXKyXX0Srci/eBr+lyVsUQwTXzqXB1nEdnfbNKXTbiEU0R4UUVRPYoUO3inYA69seP8xNlseQJaozNSCi8YiWXK2Eqi6fXSiOOXmD5hH/chaeut8fVCSEzs6BIkRsaTsyrffCxllvc/ISwSg1dQt+HHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744163492; c=relaxed/simple;
	bh=ekq1iA5N+zT6doTcvzCbWbTXFJUKeSBO8nowmPUVr+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cKy1ATtvfLFZYySdgJBuw12oLdWuwtLUhnk1BxpTQn8CbNHOz9y8Apypjp6KrU1C+WAiywJ6BAh+X5Mz7Fn1XpKFEMGL6LQ4lmiXsttX7/ITkKSd+8oUPdzbT9ehp/a7Dp4ZatRkppD3XCZQmY8nWpj+wJJsPPJYWbkXDiqL/TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BL9Fg0LE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BL9Fg0LE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744163490; x=1775699490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ekq1iA5N+zT6doTcvzCbWbTXFJUKeSBO8nowmPUVr+w=;
  b=BL9Fg0LETx3hb7ezFe9o240tQWGKn4/T8QaF9sA57ryMY6YVOyITl0tq
   4H3qWOfPLNJIL5waWgRHZnrxQ24pt0LxHRN2bXT9BvK4QgijK+CohBrij
   PxCOA4TQ0Cx8wtHBxUBP83dzwwYlzRQqBp7wGSOKqtujquHO7fPbEf30E
   MKUZ5S8NzaiMQMS2yf3eDtaemgjAz+LTQK7sBazedLzBEdxR3N7zKWWUe
   MEPT2C0hL6s844Upy+Y36JE2o7I9rhVqpFqY24P0HJcTRVP82Q+uzozs9
   0YwlOsYT8CJkmx8AFdjfRvzp+1LkfDpXVC0NMnoRch+XDXzv8JrBhwfK9
   Q==;
X-CSE-ConnectionGUID: JHLYXJsUSLuubrHJh73FGw==
X-CSE-MsgGUID: 6nsqidvYSXurARRPSvdpNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45334779"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="45334779"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 18:51:30 -0700
X-CSE-ConnectionGUID: om5Ub/OWSFKpqG3eFNXyHg==
X-CSE-MsgGUID: hB1WZkycTtiFM8kV31rKuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="159426561"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Apr 2025 18:51:29 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2Kb8-0008Ah-31;
	Wed, 09 Apr 2025 01:51:26 +0000
Date: Wed, 9 Apr 2025 09:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/smb/client/cifs_unicode.o: warning: objtool:
 cifsConvertToUTF16.part.0+0xce5: ignoring unreachables due to jump table
 quirk
Message-ID: <202504090910.QkvTAR36-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a24588245776dafc227243a01bfbeb8a59bafba9
commit: eeff7ac61526a4a9c3916cf46885622078ad886b objtool: Warn when disabling unreachable warnings
date:   2 weeks ago
:::::: branch date: 74 minutes ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-r071-20250409 (https://download.01.org/0day-ci/archive/20250409/202504090910.QkvTAR36-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504090910.QkvTAR36-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504090910.QkvTAR36-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/cifs_unicode.o: warning: objtool: cifsConvertToUTF16.part.0+0xce5: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
