Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D1C1DE2DF
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Dec 2024 18:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733940812; cv=none; b=k9t9X1koO7oPtT3bPtzQRdGRHsb4yBcZMid1hfeM6gw1fjSpyDKoEqfFL53Nme12szQPxJWpOgZFWxE0VU1+4M1YcYAFZgjh2yAYeGmjPbUCbUaP77xloUy8Y4Jmj86tyQ9wpC3h8oSMt+zKMQFJQVm5zS1UQ+0/+kszh9tRKnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733940812; c=relaxed/simple;
	bh=U8Nx56AN5txcPTsIeJy6SIjIYOAlce/+WW3c8JLKmJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P1WcLk+NmiDOK5fBolwtDIldRzRsdFVgFrNprzsH/B1EdrbI2vMibu9DAqZ2lSApVc0WQduLkfGCw8aulZC/0/2+8q+LKFL9yqX2CAxTHy3ZvQESc05rbyMEviOShGYwHu7J08j/vH1Go3D5hbf06U0avlGQ/feWy4ZD5/SZqRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqxAdUw5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqxAdUw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733940810; x=1765476810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U8Nx56AN5txcPTsIeJy6SIjIYOAlce/+WW3c8JLKmJg=;
  b=SqxAdUw5OwAUHix1YUBlFo4bjQisKPbfzGn6UL99Qc/5cw34RrNkljn9
   Nd5u0ntgOEjgPtCtNP/w3DTJ55oP0OiMEOo5+Qs7ODWbmV8MRViRzSRQg
   h7gnX5H0ZWzNo3jyc1fRyQbKRGSGksHWuBEp2Cr0CfJFAKMUcRwMapEUf
   nMh3HJHNsGPFMgs+kPlk7h7bJctX0TyBfNmYIvvThbadUEjPTRlcGWXyP
   hlYFjQeYifJbt8VayJeXDO+tVOXTcRzjujQQmUu7/vrlL4BovT/StRRHO
   rfcHpCUqqbfO1PZv3hJ8xJAILoY3CH6IuGyOzuLTFbNqTUvB1lE4nEBIc
   Q==;
X-CSE-ConnectionGUID: IvYgpVD4SQuB0SVcJRg+JQ==
X-CSE-MsgGUID: 3LDQeiQbQsi9T6EdgOm4sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="38021384"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="38021384"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 10:13:30 -0800
X-CSE-ConnectionGUID: vcg95bNES1Ou+H/UpUyOgQ==
X-CSE-MsgGUID: C4xQO2dGQo2e4277vAuU6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="100734353"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Dec 2024 10:13:28 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLRDB-0006yP-3C;
	Wed, 11 Dec 2024 18:13:25 +0000
Date: Thu, 12 Dec 2024 02:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol
 '.L.str'; recompile with -fPIC
Message-ID: <202412120234.ojVNPuHQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f92f4749861b06fed908d336b4dee1326003291b
commit: bede169618c68379e1be7ace14e8ac85b964a9ec kbuild: enable objtool for *.mod.o and additional kernel objects
date:   2 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-r054-20241209 (https://download.01.org/0day-ci/archive/20241212/202412120234.ojVNPuHQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120234.ojVNPuHQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412120234.ojVNPuHQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '.L.str'; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by errata.c:72 (arch/riscv/errata/sifive/errata.c:72)
   >>>               vmlinux.o:(sifive_errata_patch_func)
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '.L.str'; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by errata.c:72 (arch/riscv/errata/sifive/errata.c:72)
   >>>               vmlinux.o:(sifive_errata_patch_func)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
