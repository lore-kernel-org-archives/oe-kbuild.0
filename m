Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB815210F4A
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Jul 2025 04:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753244429; cv=none; b=f6DZ1a52ObXwedZX+caNlwWDZXivzq8TcBe08F2Nl/SUTButebxxc0TkRbR3+Id92HwF8qol6Lo0682W+zov4GmsYagNc+Rx4SssZZKgliERxisdH3QZAeUQZ+0VMEKxRaXKiNCsdezj1fTZATiiiGitE8h72ZpAJAeoqpJL4Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753244429; c=relaxed/simple;
	bh=H9YFDiBphBMLmoUVI3nbn8tx8UIthUST8ANm7arRzZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZvzfOdRqTnbR7Gma1LxfHlsUWyJ11QzjJd0BEHgDNIfrlm/vQrMeR6rnD0FYS/GjCWUH5Iy9I9vMyJUnU+cgudgVEJKffKlJqBeDZVgCKUNEnfYpf4L/dEMQitvqH5fbr1RnU7+xLVYwYXrPHhsWr3ACaCIYY4n5k8TCObL/h7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OROfqacQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OROfqacQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753244428; x=1784780428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H9YFDiBphBMLmoUVI3nbn8tx8UIthUST8ANm7arRzZk=;
  b=OROfqacQ0LxINh945CW5F+Hc4Ygz35W7/FMdoAQ7mfB08cxw9CI61IPM
   /VZLVNliE9XrxuUh8pGjg8HcA1XTxU6z5/awAKgk+Scayab6DAg81RoFT
   OhWNEh6YMP+La9/R6STKKPjn65VnzzAx9nGuvMWbYkG2ie+Jymu5Vhuj8
   q7RjzwG4mQ1wpE+GRfrxE2LiUiK7R17LHJh0jbGqal7ppLfJqurfuSeOZ
   HxOiV0Fpmtou9Y4cKR6PDyECwxyNyRR+FAbU+Pj9AY0OJUeI/j9E5pycd
   000nOx2jmdIskWCG+whxy5g2Xj5IjUiXeeR1Y6ubqBRt5juTMp/IK2oZb
   A==;
X-CSE-ConnectionGUID: 0WWRj+A3TMyuX9ehUF8VwQ==
X-CSE-MsgGUID: qCBrIdpHR560SH0PzFMJ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="59314226"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="59314226"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 21:20:28 -0700
X-CSE-ConnectionGUID: iK9xtgfLQD66l9eM70iuDg==
X-CSE-MsgGUID: eIWfrurmThufFBoK+hgd6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159425592"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Jul 2025 21:20:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueQxs-000Ix7-1u;
	Wed, 23 Jul 2025 04:20:24 +0000
Date: Wed, 23 Jul 2025 12:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool: pqi_pci_probe+0x734: machine_restart()
 missing __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <202507231254.1nzhKlbv-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89be9a83ccf1f88522317ce02f854f30d6115c41
commit: acae6b5bfffedc0440837c52584696dadb2fa334 objtool: Improve __noreturn annotation warning
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r053-20250723 (https://download.01.org/0day-ci/archive/20250723/202507231254.1nzhKlbv-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231254.1nzhKlbv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507231254.1nzhKlbv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: kernel_entry+0x0: unreachable instruction
   vmlinux.o: warning: objtool: smpboot_entry+0x0: unreachable instruction
   vmlinux.o: warning: objtool: kernel_kexec+0x94: machine_kexec() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: pqi_pci_probe+0x734: machine_restart() missing __noreturn in .c/.h or NORETURN() in noreturns.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
