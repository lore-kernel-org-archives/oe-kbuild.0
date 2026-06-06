Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FD21419A4
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jun 2026 00:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780705760; cv=none; b=De4Kl7D7cKhuznXd1FUHE8Y5dkmN8/y6OPQEXrljtuOi6tPVGyglPou7qHM4He9SDe16Gw6JSLQUnEZc6EeyvMpmX69iWvSb6m/nQQyrRe/0g9wybvvtBHl8VoRcwoCdxNzRoRsBuYsMrZmubVMe88n2IpEVM5Rn+wgCytP9BFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780705760; c=relaxed/simple;
	bh=5s6zog5b6eNfWdIWOLEgjJaLXAgsJD14jKyWB5AaHEk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nNIRbP8y5X9Rz1yna9JMosrNffDZScwNc8r6apNDZtC4CakGCHyv9wU1F46WPHpnc9ENq4/VIMuagPoQNBqTiRjXM3mNMGdB9Bj0/yNapJ9Xm3kJSlQK/Cy6pSDT8JUM+oHmopgbzJuLmTns0fhqu7Julcf6Ak6qM0aA1FQJ4gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZnc+NOM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZnc+NOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780705758; x=1812241758;
  h=date:from:to:cc:subject:message-id;
  bh=5s6zog5b6eNfWdIWOLEgjJaLXAgsJD14jKyWB5AaHEk=;
  b=ZZnc+NOMjRDK0WNUYW9juKEtNb93csKxII5Nczgt2nGDoZuZvcXUu1Bl
   4QLOV+f4w1YDl2FtlPY6omxSKosTegh61XF/BQGibCd5/Gbu41GPEiYjG
   NFG9MMOt3hZBahwKCSnqQ/WOixRpdv0S1xS9thZ2vst2fR3xup4R8JVB8
   jrYH0JlljNQfG6E4GxrgNKtNz1f6AlAbxY2OdHA0b2TSMGsjXp2nldk0m
   vQpIRiRyFJvhGN1RL89oOMETkQtAvaRu6+FfAxNZ3ggULaLWihTzm6H/K
   sGKfYfY5BcZ/lTN4WugV7DCqb2myiYbeifDkfDMhfyq5WLOe9/qQhCjuu
   A==;
X-CSE-ConnectionGUID: kChjQFyYSkiRTNkUiGahlA==
X-CSE-MsgGUID: dmhM6ZSwRoavL8pVtlZIqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81539340"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="81539340"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 17:29:18 -0700
X-CSE-ConnectionGUID: gXSTWsM0RAGGb68sBynUiw==
X-CSE-MsgGUID: a7XowjfkS0S4CaSte82hzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="249918559"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Jun 2026 17:29:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVeuY-00000000GbU-23Pu;
	Sat, 06 Jun 2026 00:29:14 +0000
Date: Sat, 06 Jun 2026 08:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:objtool/urgent 6/8] mm/memory.o: error: objtool:
 folio_zero_user+0x886: unknown CFA base reg -1
Message-ID: <202606060816.vuto21FA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/urgent
head:   4e5019216402ad0b4a84cff457b662d26803f103
commit: 1fd1dc41724319406b0aff221a352a400b0ddfc5 [6/8] objtool: Fix ERROR_INSN() error message
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: x86_64-buildonly-randconfig-001-20260606 (https://download.01.org/0day-ci/archive/20260606/202606060816.vuto21FA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606060816.vuto21FA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606060816.vuto21FA-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.o: warning: objtool: folio_zero_user+0x8bd: undefined stack state
>> mm/memory.o: error: objtool: folio_zero_user+0x886: unknown CFA base reg -1

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
