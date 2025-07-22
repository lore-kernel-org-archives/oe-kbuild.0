Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA2C8836
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Jul 2025 06:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753165341; cv=none; b=gHr600xQmsS0MBLHAxYSL0/6UUSJ013KOa51RRlk6gscWpzsBVsXeSnZYrbVHydAlaHcmAF1LR4gjyV1pNrOQfPAdUN62+vnirj3uj3+HENRlhLsuFmq5JNG1fT6XWX8bGW6hHdo6ut2JGA7SfK0bOeOOJKwCmgyseP9gEnC+UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753165341; c=relaxed/simple;
	bh=nQHnJKkxi9k1Vtmtz95eVD1yFtbzqtt1hqR38wbb2s8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n2af0Ox57x2J9aSzwhqxvBvirxf0xQHSJwisC0KNDUqCgNp5sPTvrAc5yNOh5msLDbk6VhkUb5f08e4sN79/cutmDLHMbxG2PJeymciY7btYobLWWHSRiMokdY6CELlZ72vDvPsuAd+DqengTjFGOg4oCf+ZpwR+eTtlMHaauug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fvawu9bz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fvawu9bz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753165340; x=1784701340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nQHnJKkxi9k1Vtmtz95eVD1yFtbzqtt1hqR38wbb2s8=;
  b=fvawu9bzPIBk0na7k1N8/HrfLXZuNtyKRD1DuZxk212CrqYf5PjydNXN
   Qad3/etyvollaL+KeBEM6WmDFLKyZZkxrREk69XTqco/Spu+kisJfeUIA
   3ISmDv02V/mAtw9aaGJ6wXiap9wB891nqbq13y6za7/d7Ilh171PU2aCt
   11B7cso3EyZLsHcHlKZfFRZP3CBiflN4UoCoEjQwhQlAMxaX7hfREGcPJ
   wrNcEj9NqEFWzXjZACd50M4NjIPamfs4TTtiniLESjBxraulxp2KbpXln
   6dM5vsLjTZMBkZZY9f/TQ0e/s9BM8mDf2rhjuK4ZVS5L480hV3XaNX1yY
   g==;
X-CSE-ConnectionGUID: 9VbQVdAIQHGtAJr9LHting==
X-CSE-MsgGUID: tstYe8sxSLeGbSWOMMh2gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="58015248"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="58015248"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 23:22:19 -0700
X-CSE-ConnectionGUID: rwWG8Hg6RRix6C9seYbepg==
X-CSE-MsgGUID: nRcrSoVsQ9mWFMH9snzi9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="159453544"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Jul 2025 23:22:18 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue6OF-000HWR-2h;
	Tue, 22 Jul 2025 06:22:15 +0000
Date: Tue, 22 Jul 2025 14:21:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] tools/objtool: Fix typo in warning message
Message-ID: <202507221431.fhyNGiNQ-lkp@intel.com>
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
In-Reply-To: <20250721180422.24656-1-praveenrajendran2009@gmail.com>
References: <20250721180422.24656-1-praveenrajendran2009@gmail.com>
TO: Praveen Rajendran <praveenrajendran2009@gmail.com>
TO: jpoimboe@kernel.org
CC: peterz@infradead.org
CC: linux-kernel@vger.kernel.org
CC: Praveen Rajendran <praveenrajendran2009@gmail.com>

Hi Praveen,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc7 next-20250722]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Praveen-Rajendran/tools-objtool-Fix-typo-in-warning-message/20250722-021135
base:   linus/master
patch link:    https://lore.kernel.org/r/20250721180422.24656-1-praveenrajendran2009%40gmail.com
patch subject: [PATCH] tools/objtool: Fix typo in warning message
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-buildonly-randconfig-002-20250722 (https://download.01.org/0day-ci/archive/20250722/202507221431.fhyNGiNQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221431.fhyNGiNQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507221431.fhyNGiNQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   check.c: In function 'create_return_sites_sections':
>> check.c:770:1: error: 'tools' undeclared (first use in this function)
     770 | tools/objtool/.check.c.swp              idx++;
         | ^~~~~
   check.c:770:1: note: each undeclared identifier is reported only once for each function it appears in
>> check.c:770:7: error: 'objtool' undeclared (first use in this function); did you mean 'bool'?
     770 | tools/objtool/.check.c.swp              idx++;
         |       ^~~~~~~
         |       bool
>> check.c:770:15: error: expected expression before '.' token
     770 | tools/objtool/.check.c.swp              idx++;
         |               ^
   make[5]: *** [tools/build/Makefile.build:85: tools/objtool/check.o] Error 1 shuffle=2554924622
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:65: tools/objtool/objtool-in.o] Error 2 shuffle=2554924622
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:73: objtool] Error 2 shuffle=2554924622
   make[2]: *** [Makefile:1443: tools/objtool] Error 2 shuffle=2554924622
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2554924622
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2554924622
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
