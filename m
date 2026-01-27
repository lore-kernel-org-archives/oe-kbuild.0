Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6C133B6CD
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 17:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769534030; cv=none; b=TSAtd96TICtzNv1XJz5ec3qJD+Hs/DljlEot/iaU7leazZ+vPyZcZXMpeAF7nCmDBw6g31jH7bMn4ZBcY15Sfc+5n0WXd/olhchcxlxxAihbgVkveqe3ByLIay5FwYDXK2NoQ+s4In4ERtoKkTpU4EBujbNvupg+H1U6kqSAs4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769534030; c=relaxed/simple;
	bh=3dXKyl9CZji++Ol7Atl9xcwkn6AITq+/ImrFFh3UqX4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BTp04wJrVUROK+cyhr9fDHhKgZTLXgqXV5AdRAui38gPScdimHYP/WIP4V8b/ym4r60W7FtwT8CwwfWOg4JHP9rCxSSOdVd9QOpEsxTeFqMZjBLVTr6lX1rarET+ZpAcax/aqCRkGsQV2CROmsqDH6j043MzxIXZBT9mxl20mUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ng1fXF6o; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ng1fXF6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769534028; x=1801070028;
  h=date:from:to:cc:subject:message-id;
  bh=3dXKyl9CZji++Ol7Atl9xcwkn6AITq+/ImrFFh3UqX4=;
  b=ng1fXF6owWWmc35nVlpcRgHVIEjXuvXGQnfbDkcg+4/T4dmROU/ErxcF
   dZWoGKZOLyUEKTpB+WFbalQfWG+emiq60jqvrJud4fRC99WitU3rlnuN4
   /uA2NNP3mr13U6oNdk/CKkr8SCKxL8i+m74hLIH+x42vqQiOouOg0mTNQ
   kGSY3aIhINZbQR5cNyhCtCWom7EBo6RhRZeIh671HgK9ecX8oWXfN8zEZ
   zG9tc0CUsi/e04i6wE6RjNkGI/hsh728iEL29sKL1IwBKQ9RlYekOt5nr
   R2KDHHljPC33K92yP/KOPDeCshJ0MVIvrkHAoFNJUwpPgZIRepSfTpCIY
   w==;
X-CSE-ConnectionGUID: VvWMajKvRAiOX+QtsgyDbg==
X-CSE-MsgGUID: VzUq0MLaS/6R1U8gYYTMYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70638922"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70638922"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 09:13:46 -0800
X-CSE-ConnectionGUID: YDy7nlm0RaWXdBGvxKUVgA==
X-CSE-MsgGUID: QlVDKTD5RhaDY9HJ55AS6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212884301"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2026 09:13:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkmdJ-00000000Yl6-0cyH;
	Tue, 27 Jan 2026 17:13:41 +0000
Date: Wed, 28 Jan 2026 01:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1959/9596]
 drivers/clk/spacemit/ccu_common.c:5:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601280158.DSYqDHdp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/spacemit/ccu_common.c:5:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Inochi Amaoto <inochiama@gmail.com>
CC: Yixun Lan <dlan@gentoo.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   615aad0f61e0c7a898184a394dc895c610100d4f
commit: 5ec8cbbc54c82c0bdae4dbf0e5aecf9817bde2b9 [1959/9596] clk: spacemit: Respect Kconfig setting when building modules
:::::: branch date: 17 hours ago
:::::: commit date: 5 weeks ago
config: powerpc64-randconfig-r132-20260127 (https://download.01.org/0day-ci/archive/20260128/202601280158.DSYqDHdp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280158.DSYqDHdp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601280158.DSYqDHdp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/spacemit/ccu_common.c:5:1: sparse: sparse: bad integer constant expression
   drivers/clk/spacemit/ccu_common.c:5:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/spacemit/ccu_common.c:6:1: sparse: sparse: bad integer constant expression
   drivers/clk/spacemit/ccu_common.c:6:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/spacemit/ccu_common.c:6:1: sparse: sparse: bad integer constant expression
   drivers/clk/spacemit/ccu_common.c:6:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +5 drivers/clk/spacemit/ccu_common.c

5ec8cbbc54c82c0 Inochi Amaoto 2025-12-19  4  
5ec8cbbc54c82c0 Inochi Amaoto 2025-12-19 @5  MODULE_DESCRIPTION("SpacemiT CCU common clock driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
