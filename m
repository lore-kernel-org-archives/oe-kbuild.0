Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B982C11D9
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 08:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769157165; cv=none; b=Z4cZUPRR8gj9ElnUcnKmz/SC/UbVcq0cH/K9BNl434luUkABfkrcLISzXLcsVjQSI4eiIfIi7zuI/yMkXeHVpitDfFiVMtL7upvHbC2SDEcA0Hz+x0KVBi7IXkrVuUjM8XsD7HfLU322hbFrBZR6fg5lcL0l99JFDSsS4rQ4FME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769157165; c=relaxed/simple;
	bh=gDqChU+XBsZtlVTLgKOphQu5DVWlTpwnhaDtgoydMgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ff65sDyAvqqlSc++ZsrdmIFD+UyNu97lXRGiIYCj5dBxpI3q6hifcEIbdkFP1b5EIChOZDc8zkMXqlNHATk8P1zC23u50M54UbSuI/Y0a+OAen7RVHH8ZiTBIzGvDLnw4pYN5MWPTjrD6GnvQzZ+nn96L+SrWQxt8J7NtK8ddBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TyhI6pdP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TyhI6pdP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769157164; x=1800693164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gDqChU+XBsZtlVTLgKOphQu5DVWlTpwnhaDtgoydMgE=;
  b=TyhI6pdPGMF1ih5V/ydLdoJ+gCQUcTHnnrJYE5OIKq0XaDm/o21g72kV
   MGv0dmSb8uf0A6Vlr810bEBgZXJSCvUlNZWzIb/HeiGWSVW20NN76oEzo
   /VL/X29k9pSuJZzywLPYT755t8ajcL1Tx+RJlt//qihoFQrTHd1buqn0B
   YEBWRSu2ScJ2tiz3c0sA91hhE89sRpGmUKyYJ6baWdVh4jg411YeY2f6p
   mEZWQr4JZyH9zKRYPLcArJsT0QfeK4YUDNKegJZw0I4ZYVw9NO856s3dg
   HipOusTX5FBqIALdpQuTPd0PA2/MKIZoz9e3UFgnrTnuagNFPLD4NPDuu
   A==;
X-CSE-ConnectionGUID: ubqzbkXKR0qZ8pI35v5gkA==
X-CSE-MsgGUID: IKxW3GSbR1O6MdldSwHTeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70324525"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70324525"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 00:32:44 -0800
X-CSE-ConnectionGUID: pysSoyogQeWIj4tTNfVhEA==
X-CSE-MsgGUID: WnAc9JL+SoyoDgSdRzGq7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="206229234"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2026 00:32:43 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjCau-000000000gP-2gxf;
	Fri, 23 Jan 2026 08:32:40 +0000
Date: Fri, 23 Jan 2026 09:32:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] selftests/liveupdate: add end to end test infrastructure
 and scripts
Message-ID: <202601230927.dONFqM3q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260122214427.3568647-1-jordanrichards@google.com>
References: <20260122214427.3568647-1-jordanrichards@google.com>
TO: Jordan Richards <jordanrichards@google.com>
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
TO: Mike Rapoport <rppt@kernel.org>
TO: Pratyush Yadav <pratyush@kernel.org>
TO: Shuah Khan <skhan@linuxfoundation.org>
CC: Jason Miu <jasonmiu@google.com>
CC: David Matlack <dmatlack@google.com>
CC: linux-mm@kvack.org
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: Jordan Richards <jordanrichards@google.com>

Hi Jordan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0f61b1860cc3f52aef9036d7235ed1f017632193]

url:    https://github.com/intel-lab-lkp/linux/commits/Jordan-Richards/selftests-liveupdate-add-end-to-end-test-infrastructure-and-scripts/20260123-061926
base:   0f61b1860cc3f52aef9036d7235ed1f017632193
patch link:    https://lore.kernel.org/r/20260122214427.3568647-1-jordanrichards%40google.com
patch subject: [PATCH] selftests/liveupdate: add end to end test infrastructure and scripts
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260123/202601230927.dONFqM3q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230927.dONFqM3q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601230927.dONFqM3q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> luo_test_utils.c:16:10: fatal error: sys.h: No such file or directory
      16 | #include <sys.h>
         |          ^~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
