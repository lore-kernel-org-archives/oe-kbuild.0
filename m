Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5159A472792
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 16:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777566954; cv=none; b=ezghf/M2jZfP7swB6wfU4TPp5RIPrkBJpbXAdZY6rYjnjJIvr2Svd1jSi4ZVZ0iqsnOeaadtzvn/fS8nMhBo4Dw0S+z//IaEFS5gsPC07d3guA0Cj7zYIVrUy05fg+854tG2atF6pUb39DDoq4KcNUFF+oqPTdGxWDMIBg9JM4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777566954; c=relaxed/simple;
	bh=/viqkYpsSgMQ2y2pFtxo42xJNmT/ItXoE3kkiIAUcZQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=REfEUHEjXhLFe8YEfkKGtxWvo4KWzmIcfcCWsaSyZ+GW9AhsgPtMnQ8GES7bm7BT3OCtVJGl2ZBDITwYUa5zxH0TZsqEYvC7GhWkjejEWTXN7Jk6P6dhmmkQHoXMzuc2qGUVW83FSR9E31ZsE4qFp8JcqtTxpEjsA3GFqt/p1QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G12ffOdQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G12ffOdQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777566952; x=1809102952;
  h=date:from:to:cc:subject:message-id;
  bh=/viqkYpsSgMQ2y2pFtxo42xJNmT/ItXoE3kkiIAUcZQ=;
  b=G12ffOdQDFiVi36pc6BhmjArHTDC8cOOSnW3gAwKB4HKV83xk0XaEPXo
   o6x7H84sFEccNEeGxspf17E9gBc3/C0O6slSio5efZCP1xu/rni4u7eXP
   s2huoWw3yogMmnNbCanC4QLxsKj9mw0V0i+vwxyDbStvqBke8v11E5IbJ
   dbnsoxYIukzpjMEVzBPq2kh001rCYzPYoNDE3nbMIHE6z+aM68G6NHAdU
   BUoZU14KZXFH34T9YiHa1sDyR/KkU4RQzHvtW/+UgLhTY9+xzBNIJA3mi
   VSFqEtx8XZoSxL873xCdF+DPViFrLa8hzT7IoAjwHTvJ2DSHI21jXFAY4
   Q==;
X-CSE-ConnectionGUID: F/z2S2xUTZaJVMKHCtxExA==
X-CSE-MsgGUID: IC2y9IaVQ+ifAqLx3txK7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="103979102"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="103979102"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 09:35:50 -0700
X-CSE-ConnectionGUID: r0dMzFEsSCud1VdjiuGowg==
X-CSE-MsgGUID: WcChSzeQQ/u2618JJiNfoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="238952721"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Apr 2026 09:35:49 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIUMc-00000000Ceq-1VwD;
	Thu, 30 Apr 2026 16:35:46 +0000
Date: Fri, 01 May 2026 00:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ardb:x86-pie-v4-wip 20/21]
 arch/x86/boot/startup/relocate.c:19:26: sparse: sparse: invalid initializer
Message-ID: <202605010056.DreJA7h9-lkp@intel.com>
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
head:   9a6d85275cb1def4a196bd5c757f22c4e21f1d0a
commit: 8d8b4ec8c3a81e870e51c902bc3b390069d7965a [20/21] x86/boot: Apply ELF PIE relocation fixups during startup
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-121-20260430 (https://download.01.org/0day-ci/archive/20260501/202605010056.DreJA7h9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605010056.DreJA7h9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605010056.DreJA7h9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/boot/startup/relocate.c:19:26: sparse: sparse: invalid initializer
>> arch/x86/boot/startup/relocate.c:19:59: sparse: sparse: need scalar for ++/--
   arch/x86/boot/startup/relocate.c:24:26: sparse: sparse: invalid initializer
   arch/x86/boot/startup/relocate.c:24:59: sparse: sparse: need scalar for ++/--

vim +19 arch/x86/boot/startup/relocate.c

8d8b4ec8c3a81e Ard Biesheuvel 2026-01-31  11  
8d8b4ec8c3a81e Ard Biesheuvel 2026-01-31  12  void __init startup_relocate_kernel(void)
8d8b4ec8c3a81e Ard Biesheuvel 2026-01-31  13  {
8d8b4ec8c3a81e Ard Biesheuvel 2026-01-31  14  	u64 *place;
8d8b4ec8c3a81e Ard Biesheuvel 2026-01-31  15  
8d8b4ec8c3a81e Ard Biesheuvel 2026-01-31  16  	if (!va_shift)
8d8b4ec8c3a81e Ard Biesheuvel 2026-01-31  17  		return;
8d8b4ec8c3a81e Ard Biesheuvel 2026-01-31  18  
8d8b4ec8c3a81e Ard Biesheuvel 2026-01-31 @19  	for (auto rela = rela_start; rela < rela_end; rela++) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
