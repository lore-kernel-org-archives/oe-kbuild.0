Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398552F39C7
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 17:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765562118; cv=none; b=W8ojQTdCX6cd7rSW7qKUTyQpmPBgCgCqPf3+qXzJ26j+4eFw2nZxyWjsmE8HDnKbZzqMVH+n4KzsVUHh6D8f37uozIRjvQQQvRVAdwX+sjLFRKT3lQeJL1OiqXRUjUb9ucIZO8gz6sSrzEWihC4FK3GSY+b/GHD+pO1h0sNhYjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765562118; c=relaxed/simple;
	bh=O91Gc7MLnJsAuaVTXUQfYaMjWD0falSR5eNRwsQCd7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q+BXW2fLLqdZJikfLoINnFGYIlNH/uAKGMa3PVkcdyzyHO8B3+dfE8aDyT9Fq9FckCUmuOo2M+odKS8tDiumU4Y9HgseDqfKuzEgavhkUicsnD/ofCcvNyriYhlAQ4Ag8zysQvXAy+PaRxZ87IORPyRwqFE7d0JinSGST7SIHR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkKlO6RZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkKlO6RZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765562116; x=1797098116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O91Gc7MLnJsAuaVTXUQfYaMjWD0falSR5eNRwsQCd7s=;
  b=SkKlO6RZwQn10zU9rXJLO7fXIS49ee9Me4zvWFofxh0FnG0cGElIIpDj
   0lBiss18iA9WzAQLRmFXFI0hhxP16UAc9hUfvplSwuPnjTcYmvRKnvhnH
   zvqNv2mn3Y4+FIkuEjHsO1U0tMB69jKkAGt7vjFMseVIL7YwH94JoKYMr
   yPizQejIHEVrBHpSWAHqfKz1yMLF5LVDz/P3vO3J0s1hoISTpKQQrFHBs
   UoZEmtVcFHcU6HCbdyAKJWz7AIBPmrmWjS/H9TMGmo+ttbWRrRjaKhNwk
   0Vh08PlYrVrZmNZbcHQwHFN+BxDU1kW6FhC+Mcm5dkG82BTNI8+hFEkiO
   Q==;
X-CSE-ConnectionGUID: tLpXrX4VQIKv3KeyA/mMQQ==
X-CSE-MsgGUID: WA/EmOYjT02TmAGSRqj3sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67641466"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67641466"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 09:55:16 -0800
X-CSE-ConnectionGUID: YJzNgs7bQMqqEp9iyjPLmg==
X-CSE-MsgGUID: gywI6yJqRkmNfdCVv4ZrqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="202076002"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 09:55:15 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU7MG-000000006Or-2HeP;
	Fri, 12 Dec 2025 17:55:12 +0000
Date: Sat, 13 Dec 2025 01:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/ipv4/netfilter/iptable_raw.c:16:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202512130127.TEUJyP4m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: net/ipv4/netfilter/iptable_raw.c:16:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <kees@kernel.org>
CC: Daniel Gomez <da.gomez@samsung.com>
CC: Aaron Tomlin <atomlin@atomlin.com>
CC: Petr Pavlu <petr.pavlu@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: ae83f3b72621bd3187eb7956c7c2993a97d4b187 module: Add compile-time check for embedded NUL characters
date:   5 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 weeks ago
config: sparc-randconfig-r123-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130127.TEUJyP4m-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130127.TEUJyP4m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512130127.TEUJyP4m-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/netfilter/iptable_raw.c:16:1: sparse: sparse: bad integer constant expression
   net/ipv4/netfilter/iptable_raw.c:16:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   net/ipv4/netfilter/iptable_raw.c:17:1: sparse: sparse: bad integer constant expression
   net/ipv4/netfilter/iptable_raw.c:17:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   net/ipv4/netfilter/iptable_raw.c:110:1: sparse: sparse: bad integer constant expression
   net/ipv4/netfilter/iptable_raw.c:110:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   net/ipv4/netfilter/iptable_raw.c:110:1: sparse: sparse: bad integer constant expression
   net/ipv4/netfilter/iptable_raw.c:110:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   net/ipv4/netfilter/iptable_raw.c:111:1: sparse: sparse: bad integer constant expression
   net/ipv4/netfilter/iptable_raw.c:111:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
--
>> drivers/net/ethernet/amd/sunlance.c:111:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/amd/sunlance.c:111:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/net/ethernet/amd/sunlance.c:112:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/amd/sunlance.c:112:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/net/ethernet/amd/sunlance.c:113:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/amd/sunlance.c:113:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/net/ethernet/amd/sunlance.c:113:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/amd/sunlance.c:113:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/net/ethernet/intel/igc/igc_main.c:35:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/intel/igc/igc_main.c:35:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/net/ethernet/intel/igc/igc_main.c:36:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/intel/igc/igc_main.c:36:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/net/ethernet/intel/igc/igc_main.c:36:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/intel/igc/igc_main.c:36:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/net/ethernet/intel/igc/igc_main.c:37:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/intel/igc/igc_main.c:37:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/net/ethernet/intel/igc/igc_main.c:38:1: sparse: sparse: bad integer constant expression
   drivers/net/ethernet/intel/igc/igc_main.c:38:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"

vim +16 net/ipv4/netfilter/iptable_raw.c

^1da177e4c3f41 Linus Torvalds                 2005-04-16  14  
902d6a4c2a4f41 Subash Abhinov Kasiviswanathan 2018-01-10  15  static bool raw_before_defrag __read_mostly;
902d6a4c2a4f41 Subash Abhinov Kasiviswanathan 2018-01-10 @16  MODULE_PARM_DESC(raw_before_defrag, "Enable raw table before defrag");
902d6a4c2a4f41 Subash Abhinov Kasiviswanathan 2018-01-10  17  module_param(raw_before_defrag, bool, 0000);
902d6a4c2a4f41 Subash Abhinov Kasiviswanathan 2018-01-10  18  

:::::: The code at line 16 was first introduced by commit
:::::: 902d6a4c2a4f411582689e53fb101895ffe99028 netfilter: nf_defrag: Skip defrag if NOTRACK is set

:::::: TO: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
