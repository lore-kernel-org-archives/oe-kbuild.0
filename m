Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EA21E5219
	for <oe-kbuild@lists.linux.dev>; Sat, 24 May 2025 15:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748100491; cv=none; b=RcJBtK50AHEZZRoM91za8r96bWw6haPaPZAtuMlMhIy3kgSO931cf0fZDb5nfrIsjwiSynJLzP/cG1e/96clpCnseR8nc3L3K6WdlJbNl72E6q9EKEKD38oy0nBUD7cAu4RFWJy0gblzkLKswHkvULvBiALe+r4a1N1RGD6T/4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748100491; c=relaxed/simple;
	bh=jhg+rZl+5rgtTPzUnvuYn223LUhByWjKliKEU55U4yA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Idy7p9NmLO7ZuMGg9J4YxF2HuCNRTIZTDzHoDVVCSEjOOT1DLXqRlAe2DkTK+i6m+L1LzP00cbJeeGD6CZzYg3V1Olksy0RAdPD+bPvXaCkZzVaE/ka7nYpaR5nWfgjo0tVC0UcwrKMOKR2DvYNRNHgexCfnktrUVKxtbtMB1Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISqlTLRs; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISqlTLRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748100489; x=1779636489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jhg+rZl+5rgtTPzUnvuYn223LUhByWjKliKEU55U4yA=;
  b=ISqlTLRsz6kSLc2GL4VJOIadC/tmXPUXHo9bTxeso64DXJTw6K5Cxhtl
   ldYwON+5ptIlz7bBw1Cxyf6nWI/1AgT9SNUB0SgfVk/TLkU/SBxyDTaH2
   fz1fJfpurOC8IDZ9jTwCbtwGTlDFZN2Q/xFaNN4Ub173CADg9nYCXvxt1
   5xwpGZ8RRFSuf3XImbsMS5/hmUtvQY5gBGXyz4a2szI+3Qb+dPhOA3TjE
   Tx6zOtm/b8RZlVmTYtytyisJMQCIqLroNmKa8Qs79PYZqPfPg4s3a+mlj
   Z8wcwOvt6Lp9K4arwUmn30HIDrAiVwLjPZehJpockG60jIdXoX+r1Yqdp
   w==;
X-CSE-ConnectionGUID: 8du451egSryXTmpzTZgtbw==
X-CSE-MsgGUID: jvwxHsr6STuC1Dd/cnGO+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="67690914"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="67690914"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 08:28:08 -0700
X-CSE-ConnectionGUID: LWBWCO9PS6OhSfdr4sQlVg==
X-CSE-MsgGUID: dEB6qJcqRUaJV0R5RFK3ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="146793118"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 May 2025 08:28:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIqn6-000RGW-2j;
	Sat, 24 May 2025 15:28:04 +0000
Date: Sat, 24 May 2025 23:27:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jlayton:uek-localio 2095/2262] clang diag: warning: unknown warning
 option '-Werror=frame-larger-than=2048'; did you mean
 '-Werror=frame-larger-than='?
Message-ID: <202505242337.1y2UM9bX-lkp@intel.com>
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
TO: Somasundaram Krishnasamy <somasundaram.krishnasamy@oracle.com>
CC: LUCI Bot <vijayendra.suman@oracle.com>
CC: Jack Vogel <jack.vogel@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 489bb69303b3421ba3e8af23d77f998ebfbbe698 [2095/2262] kbuild: Convert stack frame size larger than warning to error.
:::::: branch date: 24 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250524/202505242337.1y2UM9bX-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505242337.1y2UM9bX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505242337.1y2UM9bX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   warning: unknown warning option '-Werror=frame-larger-than=2048'; did you mean '-Werror=frame-larger-than='? [-Wunknown-warning-option]
>> clang diag: warning: unknown warning option '-Werror=frame-larger-than=2048'; did you mean '-Werror=frame-larger-than='? [-Wunknown-warning-option]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
