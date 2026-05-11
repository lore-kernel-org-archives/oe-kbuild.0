Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC312F90E0
	for <oe-kbuild@lists.linux.dev>; Mon, 11 May 2026 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499418; cv=none; b=bXfJfA6rX3jswIugyfEtOLrV6JFB6sKpwEb144awGY2LmieEU+Uy89eKxTd6xqvyhSLvh7UbuvM3CJI6uRloFarVOnPRL5zOJhg6qY+i+zQUHa+2y1gwe5clQBuZbMv3D8mIyruDN967rn55GoJ5T/3V6w2pdFouxV5VjtUSecY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499418; c=relaxed/simple;
	bh=lFvRiQkkdPPPdTFG6IGsp3Vk/+WamoL7Ti4XeDkrViY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WqANZrZl6X6GcoA7E3xmhvmMcJ0kK+TyQUfrEIMvqorqqcCCYxDlb3PCO/3LWohzAOOH0aqRUxk5Ngh6RrnWnIQPLYMM57KY4UHVv6iCNQdiFZWH6yvfn4q9cLfBRx+6XJRLiq0nWNRLnN7vLKSIOfA74lNArrEaHpFjeneExQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hIJadwjG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIJadwjG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778499416; x=1810035416;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lFvRiQkkdPPPdTFG6IGsp3Vk/+WamoL7Ti4XeDkrViY=;
  b=hIJadwjGRRs62240leloORj6DGwmBvfgp6sL/ndczroSpSNa42jmAGRo
   EnEfyExWojIzBHtt0/uFDYD0w/tuH9z8aA75JiNiDZyaSx3NcDxfFDhlr
   RuyycDb8XWhLYYu+OTnaT5/m/SsIUCP1q28afZNfyApHdZRbghBVEwd5I
   tZMsp5OpPPbG/rvTbyaxeO0ANS88sCqXMUjJPt8IG3nSVICKjKq3+i6CC
   g7jNTqRsoDSAlvvOaxaEziVweDVUmw/Hp0eeic0JRhcu/ejXkNOJSpmZR
   XLc3pRpO4ODCIJAWtZhbM3iP4omFmkLPKfpFLMxsctriviOIS70ewEQsC
   Q==;
X-CSE-ConnectionGUID: 5BNPAviHRGujN59lSl0kPg==
X-CSE-MsgGUID: SLM6ObAdTS2g7btXdRHdIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90483770"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="90483770"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 04:36:56 -0700
X-CSE-ConnectionGUID: Mx02ocmGR9eF2OupRPYmWw==
X-CSE-MsgGUID: YDcuv8kTTeiPNe98D5rtig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="242410736"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 May 2026 04:36:55 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMOwO-000000000UX-1cVt;
	Mon, 11 May 2026 11:36:52 +0000
Date: Mon, 11 May 2026 19:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 1/1] gcov: use atomic counter updates to fix
 concurrent access crashes
Message-ID: <202605111900.vv8DEuyr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260509142216.382205-2-khorenko@virtuozzo.com>
References: <20260509142216.382205-2-khorenko@virtuozzo.com>
TO: Konstantin Khorenko <khorenko@virtuozzo.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Arnd Bergmann <arnd@arndb.de>
TO: Peter Oberparleiter <oberpar@linux.ibm.com>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Nicolas Schier <nsc@kernel.org>
CC: Mikhail Zaslonko <zaslonko@linux.ibm.com>
CC: "Thomas Weiﬂschuh" <linux@weissschuh.net>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
CC: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
CC: linux-kernel@vger.kernel.org
CC: linux-kbuild@vger.kernel.org
CC: Konstantin Khorenko <khorenko@virtuozzo.com>

Hi Konstantin,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on rust/rust-next linus/master v7.1-rc3]
[cannot apply to akpm-mm/mm-everything next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Konstantin-Khorenko/gcov-use-atomic-counter-updates-to-fix-concurrent-access-crashes/20260511-031901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260509142216.382205-2-khorenko%40virtuozzo.com
patch subject: [PATCH v3 1/1] gcov: use atomic counter updates to fix concurrent access crashes
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20260511/202605111900.vv8DEuyr-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605111900.vv8DEuyr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605111900.vv8DEuyr-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:200406: Error: branch out of range
   {standard input}:200407: Error: branch out of range
   {standard input}:200465: Error: branch out of range
   {standard input}:200473: Error: branch out of range
   {standard input}:200537: Error: branch out of range
   {standard input}:200542: Error: branch out of range

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
