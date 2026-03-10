Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A4D364954
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 07:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129535; cv=none; b=Tx0/UzUbmQeJbHYtjm2gyWk/RzddPKrLs1CNmP/qUzzP99cHZMnczPLoUr0F+waecloF70FfP1RYBOLF4NSDkm5Vs51tIbjZvnVQoF5f6oz5R+sHTQhemZ3sb2BmkJI+/mgo6nt2GqAaAbMeo2KGXrj/4n20NYpEFh9SpZRmNf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129535; c=relaxed/simple;
	bh=5oAklvnNRYrhYSi6+nq5qOJgxTecfgAGoTrm+dLnyjs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lmOFIqEJZqCwMrkob8HPtOBLwAhu8dIF5GCZCKL7V/phhPhBwad/nmSFItuOfuoY/BCzX+ovzB6htaZd+lfUOWWcP/bt/wDtwgrtFzptlDDK/9uiGnymEEIB8+cKOIsTzacNP+44lq0ns3uzIrQSE3RjkwnLkwizTu3mbhvX01o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bf+bcKjh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bf+bcKjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773129534; x=1804665534;
  h=date:from:to:cc:subject:message-id;
  bh=5oAklvnNRYrhYSi6+nq5qOJgxTecfgAGoTrm+dLnyjs=;
  b=Bf+bcKjhSnPpiQmrowUcutByANr5CprWjfNRQCBojsdA60ykIV7dC6SR
   26Nqe46YhW29QWfRxNuRAk5ylE1R5nQXRvCKx/wSYecAZXrcpF4x3A1DR
   3KuOJGHGErRM3WGFmvuTCqpJdeJnJKVb7EeZx/KlR8tvNHEVQHnE6mraj
   udeKN6E+w3LIwLI5NJXnrYI6+Pc4f0RhoqiM1Kqsd662TDNNRSzKg4gu0
   MJRKPkC4q0AIF/ADrfXj++jqZL/rcl7yf9Fe95hhpl+Ah2f5p1S/C37mT
   Yogrgd4h1kkrvEDyaiv70YTKtZEjLmJeRl3Atn8+7lHZtMVzn4Cum91wc
   A==;
X-CSE-ConnectionGUID: eznCCKRbTu6UFBiOdc3mXg==
X-CSE-MsgGUID: bNIydeg9R3ai8SUYIIEEGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85256277"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="85256277"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 00:58:53 -0700
X-CSE-ConnectionGUID: 9VD9rBJzTI6bc+VXWcRdGA==
X-CSE-MsgGUID: lIIM4BIFQJCt8RJQ0lgbjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224976274"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Mar 2026 00:58:53 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzrzO-000000001YG-0nFY;
	Tue, 10 Mar 2026 07:58:50 +0000
Date: Tue, 10 Mar 2026 15:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ardb:x86-pie-v4-wip 20/21]
 arch/x86/boot/startup/relocate.c:19:26: sparse: sparse: invalid initializer
Message-ID: <202603101542.SwerkpZX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/boot/startup/relocate.c:19:26: sparse: sparse: invalid initializer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   ac16b9ed881281b934626d9265e7eda3fe234674
commit: 4c348dd3d04b2f5c686778d662c2e5fefbf5c068 [20/21] x86/boot: Apply ELF PIE relocation fixups during startup
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-121-20260310 (https://download.01.org/0day-ci/archive/20260310/202603101542.SwerkpZX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603101542.SwerkpZX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603101542.SwerkpZX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/boot/startup/relocate.c:19:26: sparse: sparse: invalid initializer
>> arch/x86/boot/startup/relocate.c:19:59: sparse: sparse: need scalar for ++/--
   arch/x86/boot/startup/relocate.c:24:26: sparse: sparse: invalid initializer
   arch/x86/boot/startup/relocate.c:24:59: sparse: sparse: need scalar for ++/--

vim +19 arch/x86/boot/startup/relocate.c

4c348dd3d04b2f Ard Biesheuvel 2026-01-31  11  
4c348dd3d04b2f Ard Biesheuvel 2026-01-31  12  void __init startup_relocate_kernel(void)
4c348dd3d04b2f Ard Biesheuvel 2026-01-31  13  {
4c348dd3d04b2f Ard Biesheuvel 2026-01-31  14  	u64 *place;
4c348dd3d04b2f Ard Biesheuvel 2026-01-31  15  
4c348dd3d04b2f Ard Biesheuvel 2026-01-31  16  	if (!va_shift)
4c348dd3d04b2f Ard Biesheuvel 2026-01-31  17  		return;
4c348dd3d04b2f Ard Biesheuvel 2026-01-31  18  
4c348dd3d04b2f Ard Biesheuvel 2026-01-31 @19  	for (auto rela = rela_start; rela < rela_end; rela++) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
