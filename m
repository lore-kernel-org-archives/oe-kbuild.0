Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF1A72635
	for <oe-kbuild@lists.linux.dev>; Sun, 18 May 2025 15:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747580563; cv=none; b=ENO79bL6CPUMSmMI3bnt//u78iEEe8Is9+FmGVYEU/bqHSMBUdbAGkNQw3eFrlqYUhogEUXByUl8YSAmjGJH1sfyetOTSpONDjMtxuqHDj8jLEEizE7YjfS0vhMbSZEi6yFgEsuv4Obuxe5L7NY0Drv0buCIrVpHetLFArpkt0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747580563; c=relaxed/simple;
	bh=K93aGJnNPAIlXZGsW/8Tb+wFiBlCHN6c6+cbFqhLDhU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RiwrjQgu9v3qDJ/4IzsoJ2oz0fJGOvmGOxiceZcZeOrReSqbUwpRw4RrwbOBS8LXlfCRGUn7b1O+CDgaSEMHK+ExqLrB5aBmIbJUvIAMKWwPmYPiHg4So9GozBsJ4roZdJRFJM2G4S6tfNezTGdUBci2lg0gWPr+vy4k6e7V9Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=httkfldA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="httkfldA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747580561; x=1779116561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K93aGJnNPAIlXZGsW/8Tb+wFiBlCHN6c6+cbFqhLDhU=;
  b=httkfldAPVje9MGWaWUauThk93MMGUBt6UkpefyLqZrzK5GkT1Q/WBro
   J1BLU08hBijoz8hT8sga6MIik8sNoXl7AdS9dcum71hvIdX0zRemcSH7R
   /Pi0vyTPAsnNmHBZ8evrhYDQcWphsb8ASbOqFG9TdfDz2/ju2ydFOksHh
   NCqblp9ZQ60knuU/L8ED83Usks15pPAf+xlfCa/n+GsQVL8xBkX1rU3EE
   rDMPvWFew0dy0HjQbUyKya10a0WC4LLC9LEfgFmNOh5C04krAOM4cUeho
   f/c03vyyXXsyuOGkfsOc4ecjThr1HkKRIvaU9v2m03vNAd2jaUX5WLjN8
   A==;
X-CSE-ConnectionGUID: kMs57gGkRdqsi1DrIye0zw==
X-CSE-MsgGUID: SRXyjBhuRqKQNk2sF4GS4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="74886105"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="74886105"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 08:02:39 -0700
X-CSE-ConnectionGUID: 0tXqHEHYRfGdJz2jp89AMg==
X-CSE-MsgGUID: ZupRHBK1R5iG8VjjI81UJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="139049065"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 May 2025 08:02:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGfX9-000Kqd-2z;
	Sun, 18 May 2025 15:02:35 +0000
Date: Sun, 18 May 2025 23:02:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/sparse.o: warning: objtool: sparse_init_early_section+0x80:
 unreachable instruction
Message-ID: <202505182237.Nljowghd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank van der Linden <fvdl@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5723cc3450bccf7f98f227b9723b5c9f6b3af1c5
commit: d65917c42373f70159a3fc453f8f028fd665e04f mm/sparse: allow for alternate vmemmap section init at boot
date:   9 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 9 weeks ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250518/202505182237.Nljowghd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505182237.Nljowghd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505182237.Nljowghd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from mm/sparse.c:5:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:303:34: warning: missing braces around initializer [-Wmissing-braces]
     303 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:559:16: note: in expansion of macro '__swp_entry_to_pmd'
     559 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
>> mm/sparse.o: warning: objtool: sparse_init_early_section+0x80: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
