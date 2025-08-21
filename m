Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45272E9ED3
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763812; cv=none; b=OYl13hLwiwrZDo9WpLrnMKuyG9lkkEu0sU6c6S20PRX/VoeGXb19M4aywfHkwvWUKkVlIq8U+hmlUdojBSU81KZO1/Yq/QjX5gv/oXjcaR9gUnStfM/W3hv3/RV/hEaI8INn6i3isVUz39AL1z3JM7uJQsYcWy29SSvssjXJCi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763812; c=relaxed/simple;
	bh=foG+zrYC5lxc9RzJAYY8AQ2L+egln/CmGw1j07+Htdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qF57JN3Yf8zKhehKK/49Z5Mv+EFePejiYzbf6VzGigD4qDFmt2Xdbvl7V0KvcZGV1LkUjGfe2zwGsCkN/OQCZldCrgbQ20capAasuq4zRhnI0gEzz/FEPZnKBUB34Cmv7koj+TF1r6LPSIytawH2zSz4lCO62gQAVt9RQwvGAKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QCGm8Pet; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCGm8Pet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755763809; x=1787299809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=foG+zrYC5lxc9RzJAYY8AQ2L+egln/CmGw1j07+Htdk=;
  b=QCGm8Pet8qlHhhKuhETXUnkCwcJ2CbeWo1WeoA+gj5rQTLkNTOeCBY4Y
   DTU46JBaK9szCDSyC5Oa5d/QQn4IndRa+PuBlj4MTNZqz/CQNML6LTWVD
   Lf1xxidKr00IdSRUWI+g+Mx4htcd0MTCbrXtjSxJGkmP7HLGRjsrsJHbt
   efEO6XqrIRi2AQfib0TuZkGEknrUexXxfSE9Q06Zf1Lnk+HZqTMaJKQNr
   D8uf3Gzx5CmCnM3zLnw7hxjNdaMl9l0Rvbj59iVQIC9qt1YA3qK0oVjjV
   k2AOV8/3Rpj61bOZOJ/kwxRp+6vcgE5IeKSO8HlJEUYbSy3cpRoIg3BQ0
   Q==;
X-CSE-ConnectionGUID: Hisp4+UnS+qIyXP+8sWb4Q==
X-CSE-MsgGUID: PA88tMJBQi+qa2rIOrWwPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61684066"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="61684066"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 01:10:09 -0700
X-CSE-ConnectionGUID: Jt4unnl0RAKzG+ypGDaoWg==
X-CSE-MsgGUID: HwXmqJHIRGSaBg17hfVcaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172576830"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Aug 2025 01:10:07 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up0Ml-000K4n-0T;
	Thu, 21 Aug 2025 08:09:52 +0000
Date: Thu, 21 Aug 2025 16:09:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: error: objtool: wcd9335_slimbus_irq(): unexpected end of
 section .text.wcd9335_slimbus_irq
Message-ID: <202508211604.sGdAw1NA-lkp@intel.com>
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
head:   068a56e56fa81e42fc5f08dff34fab149bb60a09
commit: 188d90f817e13b66e03e110eb6f82e8f5f0d654b objtool: Append "()" to function name in "unexpected end of section" warning
date:   5 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-104-20250820 (https://download.01.org/0day-ci/archive/20250821/202508211604.sGdAw1NA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508211604.sGdAw1NA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508211604.sGdAw1NA-lkp@intel.com/

All errors (new ones prefixed by >>):

   vmlinux.o: error: objtool: dc_fixpt_recip(): unexpected end of section .text.dc_fixpt_recip
   vmlinux.o: error: objtool: spl_fixpt_recip(): unexpected end of section .text.spl_fixpt_recip
>> vmlinux.o: error: objtool: wcd9335_slimbus_irq(): unexpected end of section .text.wcd9335_slimbus_irq

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
