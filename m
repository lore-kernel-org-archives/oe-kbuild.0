Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA399236445
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Apr 2025 04:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744691756; cv=none; b=OCPWuSDpr3FEoIkrtVzwNMDDrJVbSrmWqUaK9NaZ4dcKZ4jZMhAnWqSMVIrvq/pBzNAZoCsVVV+uoXTQK/NiWCVGE5PfNdTnOH408JzNgxgtGq6bg2g/YfsupKDLwc5bMw1QPiOdjKhfyZsTQWxgMJmovwx294lqvE4+pcZY5Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744691756; c=relaxed/simple;
	bh=hTW8SkY/f7Ar6d18CIVMl0f277tBkPEZb5GQg82fgq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U/Ew0MWEBXHYq9iog/ElvpItJXcRD8fOJ32weXykJ4vEk5sV2VKlNU3Rbpbt10AmBODgWsLne1n/QhpIG0GiPZ26ZsgvqGGdl1HniqwaHuvcblO/Xc++j24i7qhvUTZV8rV9WGb9rjAJvGtH9h4AhvBvGAbhZquz/x6FR1orbZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3FrEXa3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3FrEXa3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744691754; x=1776227754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hTW8SkY/f7Ar6d18CIVMl0f277tBkPEZb5GQg82fgq0=;
  b=C3FrEXa38Q2QHf4d8myxU+fO6MRFkbcBIvvkoDvzU3z0py4biextK29C
   Bh0jnLm6VD0yY+UqNFlv5Tr20FTOONchwkMZS7koY+pEHJ5pPXxgpqqhm
   XAoVCcMIqhjKTTz2my7nyc7fDJOB5TB+i+VRqlt6SrrG+n3j/KjrAjHRD
   1swiwEu1Mp7upBhWFLoVpPq8h19wd2q6+1tJBKxgVfskKMwbFcJW3V0Gf
   pZZa5BVWAvSGI8sJiDGfztTxPW4Spmh9+LU+hy/kNpg55HsYGeuElLo2N
   +V2kIA+Q4X/fwdJLhQ61UaG+305s3H1RcgecGBKKcvU7RTzbMxpqUcfaY
   g==;
X-CSE-ConnectionGUID: 60G6GGeQSDWNyBmKDvqlcg==
X-CSE-MsgGUID: PEbBq37eTHScq/ibmfcVMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57564027"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="57564027"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 21:35:53 -0700
X-CSE-ConnectionGUID: AmmEUSQFQS+Drwl6sRrCNA==
X-CSE-MsgGUID: drmkXKFDRTiOq8aHjXL+Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="160970603"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Apr 2025 21:35:51 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4Y1V-000FCw-1W;
	Tue, 15 Apr 2025 04:35:49 +0000
Date: Tue, 15 Apr 2025 12:34:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: Function Import: link error: linking module flags
 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at
 1555976), and 'i32 1' from vmlinux.a(super.o at 1617056)
Message-ID: <202504151211.HeGYKvMw-lkp@intel.com>
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
head:   834a4a689699090a406d1662b03affa8b155d025
commit: 695ed93bb30e03e9f826ee70abdd83f970741a37 kbuild: fix Clang LTO with CONFIG_OBJTOOL=n
date:   2 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 2 months ago
config: riscv-randconfig-r053-20250414 (https://download.01.org/0day-ci/archive/20250415/202504151211.HeGYKvMw-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504151211.HeGYKvMw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504151211.HeGYKvMw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(super.o at 1617056)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(core.o at 1571096)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(filter.o at 1848416)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(inode.o at 1617656)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(skbuff.o at 1847336)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(trace.o at 1566416)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(smartpqi_init.o at 1756016)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(syscall.o at 1568336)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(mballoc.o at 1587416)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(volumes.o at 1618196)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(slub.o at 1574636)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(ipr.o at 1757636)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(memcontrol.o at 1575536)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(tcp.o at 1853216)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(af_packet.o at 1858736)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(core.o at 1758056)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(e1000_main.o at 1769156)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(target_core_transport.o at 1761356)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(mpt3sas_base.o at 1756736)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1555976), and 'i32 1' from vmlinux.a(hugetlb.o at 1575056)
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
