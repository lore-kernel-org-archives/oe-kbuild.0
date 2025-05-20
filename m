Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7061A83F9
	for <oe-kbuild@lists.linux.dev>; Tue, 20 May 2025 22:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778683; cv=none; b=sX2EHW4R9BD0nvgL1k8uHENN1OFCcJXz+LcLkEJWPCRWnousMjzoqTQVDW5A1z7rRxgtyUxR8wHmaj1KwD2qZBNPfFG5h4h5VGhnXatEIqZSrcGboxvVGq4sxTIGscAEbL9tFGV9Ug8e4ZXkDO4N4zxmI6VFUidBk7oWIUSc0bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778683; c=relaxed/simple;
	bh=o0gPHzrSAxXSCva3DFLZUdQduLjNHTbwSD1uQbfODaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nDpaInuDQfJSN0kyBwtdJIx3DydeJmsDReCgcRTB4m4Bxjf1z++WqgdbIvKsz01sVikRzt2/18EV8IClapECsHdZaPvbwk8f+y0wfSmTxsH0fKBjab19qaxK2g0aAvyAvxh+qEpO+6gsrOzQvsM3UbB4lvge/7i/H4oc0IFwFRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vk790n+D; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vk790n+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747778681; x=1779314681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o0gPHzrSAxXSCva3DFLZUdQduLjNHTbwSD1uQbfODaQ=;
  b=Vk790n+DNwSYlY3aKQx6+Eiwzl3qap2C7GcXEg0nG3iaYt+OYafG293W
   P6XIyx9Br9vVQku6zI1XrRYVTIMRhoHsLH4PN2j910cNEGssBr7800yMk
   gkVPS85jGSC5m7U+oRWehYU48QS0LCxxrDitvLIj6j1ZIdBmCbDsXH0+F
   oNUXJZmP8fTMMAfHjA3QtFTZG5GTg1VMlEyRTpcbqOYwK506djNjDO7Xz
   7fzPVqnEkw+baEQkwY9UjXAl8EsDKoqeXVDVhfl8LxzTrjd6xNIgguURK
   VHPY8LWpz2MBrZSAEqAmJTbZEA9RFQgr4nf84i5T1C1Lc9X8FimLNECMY
   Q==;
X-CSE-ConnectionGUID: gm8feouDQT2l3vV3W7Cf0w==
X-CSE-MsgGUID: Rd6rLPRyTk21CQimNlCN1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49663167"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49663167"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:04:39 -0700
X-CSE-ConnectionGUID: bnYhfJ3qQD2HdFCqUFEuwg==
X-CSE-MsgGUID: Yv7q+hH3T5S35bSQshq52w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139727022"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 May 2025 15:04:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHV4e-000NcC-2W;
	Tue, 20 May 2025 22:04:36 +0000
Date: Wed, 21 May 2025 06:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: sound/soc/codecs/snd-soc-wcd9335.o: error: objtool:
 wcd9335_slimbus_irq(): unexpected end of section .text.wcd9335_slimbus_irq
Message-ID: <202505210550.mlILwRO5-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b36ddb9210e6812eb1c86ad46b66cc46aa193487
commit: 188d90f817e13b66e03e110eb6f82e8f5f0d654b objtool: Append "()" to function name in "unexpected end of section" warning
date:   7 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-073-20250521 (https://download.01.org/0day-ci/archive/20250521/202505210550.mlILwRO5-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210550.mlILwRO5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505210550.mlILwRO5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/snd-soc-wcd9335.o: error: objtool: wcd9335_slimbus_irq(): unexpected end of section .text.wcd9335_slimbus_irq

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
