Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B6C301004
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 04:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009605; cv=none; b=DqaRqct1Xtjf6zPYRDI1kyYz77oT/Zbd+4m21ElkPfflS+VfOwZowwO9946Eesxk0y4NmkiWIzJ8vXUDVOVnV6UNtjAB+NT9pAS6KZvbV9vw60AKzwWtViq5n9VdJoPOUhdKa/O1s6A51fQ7MmlqtIAPjU98e+UQx2ltiOy3+UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009605; c=relaxed/simple;
	bh=iBTaNpRIJ61/eyq1f3IFlG84vkXibjQFx4lExXealxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nC0VyHVcfONQyvSiXza875SAkOEr2N5l9/RjXCr4+ToDyKqHs13Dk2K5xCR5SAOvYri7SQuw7rQXZ7/AiBFZGjDZBkaxoVefIG3PDmW+oG8r8JILMNAaUzz8k6bk6X0zT4pN8yVduJaxCdMLTAhTDZT0iaaUNqCd86XZX3i3MI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvmlcBY/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvmlcBY/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009604; x=1794545604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iBTaNpRIJ61/eyq1f3IFlG84vkXibjQFx4lExXealxY=;
  b=FvmlcBY/F7yKsz9WZEZBDqwd9AAccckjVSocmhjhxqBx6WtR3QoIHiJw
   0cRABivhm3sE5qXTwTRtgzY5PGyw1qzdDAQo9vcZlyuazVb+6MrvBEFP2
   uRDfVC2VssPm3xzqm3F9mCdvvbnvbivC8QVwkf1sPb+BQNh3gpruKSp2o
   BA6Gap9gj1oFfgkGQ6I8GQjBaEq3WhHhzrZcWeIXkyowNctz+CXYsWEd5
   b4mHP3Sj9XMq3f5A7jxPGbtMGNjQPIW8Tf2nZereWjk6AaRSWpcVvBPH3
   dqh2/JHZtRz3c6GrVtAVPGzA9UbXLOhGcgQKrq7vjTBz8ljOzq/nKNoOq
   w==;
X-CSE-ConnectionGUID: Cc/MCu2JQruyRg7pygtyww==
X-CSE-MsgGUID: N/SfUxWaQG6qXDVnfzZfBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65175886"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65175886"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:53:22 -0800
X-CSE-ConnectionGUID: Bd1Yl60zRh67mH8UhvImUw==
X-CSE-MsgGUID: T/6xFygnR6SEZQf44aWAUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="190138862"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Nov 2025 20:53:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPKh-0004tz-1I;
	Thu, 13 Nov 2025 04:53:19 +0000
Date: Thu, 13 Nov 2025 12:52:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 25/28] objtool: Improve naming of group alternatives
Message-ID: <202511130627.2BQemoMP-lkp@intel.com>
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
In-Reply-To: <20251112160315.2207947-26-alexandre.chartre@oracle.com>
References: <20251112160315.2207947-26-alexandre.chartre@oracle.com>
TO: Alexandre Chartre <alexandre.chartre@oracle.com>
TO: linux-kernel@vger.kernel.org
TO: mingo@kernel.org
TO: jpoimboe@kernel.org
TO: peterz@infradead.org
CC: alexandre.chartre@oracle.com

Hi Alexandre,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18-rc5]
[cannot apply to next-20251112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Chartre/objtool-Move-disassembly-functions-to-a-separated-file/20251113-013604
base:   linus/master
patch link:    https://lore.kernel.org/r/20251112160315.2207947-26-alexandre.chartre%40oracle.com
patch subject: [PATCH v3 25/28] objtool: Improve naming of group alternatives
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20251113/202511130627.2BQemoMP-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511130627.2BQemoMP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511130627.2BQemoMP-lkp@intel.com/

All errors (new ones prefixed by >>):

   check.c: In function 'validate_insn':
   check.c:3656:29: error: 'trace' undeclared (first use in this function)
    3656 |                         if (trace) {
         |                             ^~~~~
   check.c:3656:29: note: each undeclared identifier is reported only once for each function it appears in
>> check.c:3657:44: error: implicit declaration of function 'disas_alt_name' [-Wimplicit-function-declaration]
    3657 |                                 alt_name = disas_alt_name(alt);
         |                                            ^~~~~~~~~~~~~~
>> check.c:3657:42: error: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    3657 |                                 alt_name = disas_alt_name(alt);
         |                                          ^
   make[5]: *** [tools/build/Makefile.build:85: tools/objtool/check.o] Error 1
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:87: tools/objtool/objtool-in.o] Error 2
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:73: objtool] Error 2
   make[2]: *** [Makefile:1449: tools/objtool] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
