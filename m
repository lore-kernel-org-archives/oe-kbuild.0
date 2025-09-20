Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F2A1DF725
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Sep 2025 02:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758335400; cv=none; b=Wnw6CTxsjivpsvhUBG/L4Fls+/xNfKTA7wRNFoGLORNgsz83+SOSC3xLz8E8tVa2sPRG6rsjt6+LEzwG70pDWYK2BiFW9EqUj7IaorBXPcBxs85vKFaiCIkW6VZ1pvX5UI4Ej5ICn9yLvcs0bwN8sBon4PGZwXNQp8IgMUHKqPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758335400; c=relaxed/simple;
	bh=A3mWd+bdqI3HQZD3NLs8LF2zVpUlKQT97oGvH9PdGec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P31Bt63M5j2dbs2RgNvcW0zGLxjGfSd807kKBW//L25klGPcKRZ1PqqmuBzkhFd1P+DfpaoGG0ASzf0ki+Ix/YFXguBb9E+YcfvnXu+DmZ38YgxI4EQMmGvXEqb3NvhuE6PizTMaAKAmlDdNgrt3N6h59CaA6wRP04sya3fftUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWSX1WKT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWSX1WKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758335399; x=1789871399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A3mWd+bdqI3HQZD3NLs8LF2zVpUlKQT97oGvH9PdGec=;
  b=QWSX1WKTsQ1Qnk6GvWEfNPKVJ7nGPKj8OWRbnY0h2zF7C15/d2nsGT72
   HQOx2nIdfdONs0/iT8mrcFEwEISxM1QMNAY/ou9Q4B2G0HNcjy7jhgGpt
   wzRCVQwch+YgwRSkeNAIn1kpV72ZpqwG/Tdfg0e5EtWy/Pz5VLbJsGjlS
   A8dCfjzgVXPZSS//ijjsm+D/WIMqNIGlN2buU9XyXfY6kzKTI9chTR65C
   3XDdxEzR/wkqax/OIwzvh0CH0KQGt9bsZjUsUD1R/pMeB+CQtL2wjfs8R
   5//DHkQGlWDR8JsqSKbrgOC13ZuIE5GDmcRuJomsLlzpDPuyOk346+ZCv
   w==;
X-CSE-ConnectionGUID: 0A51WXzkT2+6RMWXXrUKDA==
X-CSE-MsgGUID: 2isXk/yYQzOAhovCixso8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="60612913"
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="60612913"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 19:29:58 -0700
X-CSE-ConnectionGUID: 6VzY+AKYTS2Nm00PzG9Baw==
X-CSE-MsgGUID: AAOXTS6+TbuN3tSu/98+AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="176025613"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Sep 2025 19:29:57 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uznMI-0004yZ-32;
	Sat, 20 Sep 2025 02:29:54 +0000
Date: Sat, 20 Sep 2025 10:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool: cifsConvertToUTF16.part.0+0xbe2:
 ignoring unreachables due to jump table quirk
Message-ID: <202509201034.pc33HNBn-lkp@intel.com>
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
head:   cd89d487374c49f18a8c4af312ecc74d997f3b07
commit: eeff7ac61526a4a9c3916cf46885622078ad886b objtool: Warn when disabling unreachable warnings
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-121-20250915 (https://download.01.org/0day-ci/archive/20250920/202509201034.pc33HNBn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201034.pc33HNBn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509201034.pc33HNBn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: cifsConvertToUTF16.part.0+0xbe2: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
