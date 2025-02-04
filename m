Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799A5204C27
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Feb 2025 19:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738698173; cv=none; b=ET1+/ii2U/wexifZc0Y4XlB7IalsTCRIWGTUN4DTkL5oT2j2bikx3stM7cUKWMw76IObRV2nlY0mMhf10QsgCjAqcm3w5UmIPw1ywXUlbDWEz7YZC+FfUX/1yEFcae3CF6zCIdZfYw9JXUcQ389Eft1ttZ+BL5bCt4Np8VxSVEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738698173; c=relaxed/simple;
	bh=vQODFdCVqw0ygbe3Bj8SNTYu5PdjWhZGxqnvTJhRXm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dCa59zxi7D9hfJb1pFZwKA73bjd1QlwI4qGtg+qiYpc/mcUcrtgVJh4xaYr5TjCa8a2G0RWTkblKyxQr9s4KMH/3/KwjgJeaoteJdtg0MyocfnN/Z6NivIxc0bGvykMT6ExibDBRO/lYQPo/iZsE7T60oQxAd8v9WBu5nfTo3yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=McOD7xb5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="McOD7xb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738698171; x=1770234171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vQODFdCVqw0ygbe3Bj8SNTYu5PdjWhZGxqnvTJhRXm4=;
  b=McOD7xb5bmR0jZvY7IdR6moxGk1//KmHAeXJmbW9Kg4HNMCSi9ea0b/+
   FGG3uChna/lTTlKg77Jwd8yFiLZ58B6jpBNajLnZCJnOg8JliGvfO/ats
   LfWhH/XFiDjH8Xi1MvuTKjcgwvqHc4hx6qFWkOuG1YYiT4crUaB6lNNCD
   CwkbtV+0gJ8P/xVGcoOEbSIDhPif9zXJu8gGrrpfYP+qusyWnPVP1c35Z
   1p3Y4Q8vugm98cuciazHo6CSJJkRF+CLgBJrHWKbEBjDWsSYrcCslyj6+
   QL/KdLYmYPOEv5Zy5/HFKTn5DwibyvuHHDe98U3eIqvTDkkB3zh56NT+g
   w==;
X-CSE-ConnectionGUID: BVVDb44ATbe5hpyM1qgFyA==
X-CSE-MsgGUID: EOjdWc0GSNiR/6SskWH1EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38453122"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38453122"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 11:42:48 -0800
X-CSE-ConnectionGUID: BD9DJ8XXSvi1jVqik4tRag==
X-CSE-MsgGUID: g3Q8sDqsTRulBsH4L/ePyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="111231189"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Feb 2025 11:42:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfOon-000sve-0w;
	Tue, 04 Feb 2025 19:42:45 +0000
Date: Wed, 5 Feb 2025 03:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error: ABI 'o32' is not supported on CPU 'mips4'
Message-ID: <202502050320.eI6e5lkP-lkp@intel.com>
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
TO: Jiaxun Yang <jiaxun.yang@flygoat.com>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Jiaxun,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5c8c229261f14159b54b9a32f12e5fa89d88b905
commit: bfc0a330c1b4526b88f6f9e711484b342cb00fb5 MIPS: Fallback CPU -march flag to ISA level if unsupported
date:   12 months ago
:::::: branch date: 39 minutes ago
:::::: commit date: 12 months ago
config: mips-randconfig-r053-20240908 (https://download.01.org/0day-ci/archive/20250205/202502050320.eI6e5lkP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050320.eI6e5lkP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502050320.eI6e5lkP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: ABI 'o32' is not supported on CPU 'mips4'
>> error: ABI 'o32' is not supported on CPU 'mips4'
>> error: ABI 'o32' is not supported on CPU 'mips4'
   make[3]: *** [scripts/Makefile.build:243: scripts/mod/empty.o] Error 1
   make[3]: *** [scripts/Makefile.build:116: scripts/mod/devicetable-offsets.s] Error 1
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1198: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
