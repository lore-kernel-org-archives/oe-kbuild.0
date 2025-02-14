Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E5D1C84D9
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 23:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739575832; cv=none; b=Cc8zLSqRE0sPiFXoM6Ihml5xNSeWozDYRTVSGZLSio+/r5baxHZUe5G+6cNpOiIX/QBVfRqV/WW6b/VITtlCddShqh28b/Tva6rzARqnNYX5zz3Bi5VZwOqmN+L2C4MGrDHjj9R7LVvG21v8oWbv6p1JBS7JH9fXBv1BI7BlCzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739575832; c=relaxed/simple;
	bh=REQkCnzAKhuV0CyegGPHP7jUUqVeJH04JAhxddkh1qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bk8U9OWpORg1+6RDGEQW2gYkrrNp9GWo9biRa+PxFbdNAAo2AKHJF7iKybXRdAZlrhbTDgrrV6rMxnyNO5bUEd9gQJ4z5HhBfIaicdbN8LykmX4obpjoh5k2krX6tJIU+JyqbCADb+6f5bB5HMN64VJMxaoB7kFHkT7EFuzYLF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZCtgAzN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZCtgAzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739575831; x=1771111831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=REQkCnzAKhuV0CyegGPHP7jUUqVeJH04JAhxddkh1qQ=;
  b=WZCtgAzNOfGQyZdMM4sh4QIrL/LLCaE+9249M64Y8uzUe66mQO0T5CHM
   Jl56Pt6DBLTXl0DAwjto0cHXnMRV9ohbWcFl5xdL2AIC/6UJuHcABSMdA
   G0fT7/1ykxdh6WN6viwcQoTSy0X+X9bVeEiqUHG1Nx3Fd1Avvcca4sZTg
   8bJK4AUTsJX+H+zn4/jgLK/ypRKd9xYrYW4GoSc5kEz1p/bFe8AlG4KdC
   /TqIcEdx+Nb/Na3tkkGOKkWfcPH4tmw58tl1N7o25ENehXtE4Pvdd9G9H
   1QrlIp6AakXXWs6yBw6TNL5BgQWJnH4p/PFy03ZBa8VAVbmZ56VTZO0Mh
   Q==;
X-CSE-ConnectionGUID: tWA7orm3SOCveqW216p0oA==
X-CSE-MsgGUID: 4N+mTzLDRheYSy/ALTv1hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40608015"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="40608015"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 15:30:30 -0800
X-CSE-ConnectionGUID: 3Y+NI9eUSUeuL9rbRBwZyA==
X-CSE-MsgGUID: 9571YXPKTUmcrWXLLHxKOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="113551779"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Feb 2025 15:30:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj58d-001AHH-0Q;
	Fri, 14 Feb 2025 23:30:27 +0000
Date: Sat, 15 Feb 2025 07:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: warning: vmlinux.o: DWARF unit at offset 0x000003bb has
 unsupported version 27439, supported are 2-5
Message-ID: <202502150718.KRAMO9uu-lkp@intel.com>
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
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   04f41cbf03ec7221ab0b179e336f4c805ee55520
commit: 695ed93bb30e03e9f826ee70abdd83f970741a37 kbuild: fix Clang LTO with CONFIG_OBJTOOL=n
date:   2 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-r131-20250214 (https://download.01.org/0day-ci/archive/20250215/202502150718.KRAMO9uu-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20250215/202502150718.KRAMO9uu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502150718.KRAMO9uu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ld.lld: warning: vmlinux.o: DWARF unit at offset 0x000003bb has unsupported version 27439, supported are 2-5
   ld.lld: error: vmlinux.o:(function __folio_migrate_mapping: .text.__folio_migrate_mapping+0xa8): relocation R_RISCV_BRANCH out of range: 4132 is not in [-4096, 4095]; references .LBB10854_127
   >>> referenced by ld-temp.o
   >>> defined in vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
