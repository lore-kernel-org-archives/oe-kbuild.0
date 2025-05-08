Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198A821D581
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 19:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746732700; cv=none; b=EGDdOM4hRF7sQnEgTYkvmNOXoX1z9KnKruF7bWtbXxmD1j0+2zcfjGryxXHqVXIIzxfhO4orSFSfNoRu9pcDUCHGwcGnGqzlN08+hBn3Mt5KItgJvIYZ7KybomyIDRJlaiCf8x1S+WB1kQxgy10+SU4B6kCXUhERNqzgCV+WRZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746732700; c=relaxed/simple;
	bh=9h7i4193nrRu1KVPzUzr1zyv7+l9/ZN2fKwxy58xFbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DlCHSGygrEFxAABfy9v1qC3CHsoBNoTpUTvBeT9eNUK4KqLeDaEDQ5yPqyaJwXXV5XzJ1fpFkMs3+iwVcHKXBUbnGS9+xBcwbRSZ3t/cDL3eVZ+zCNx11+r7hDkiou4KmjebP3Mczo+MP6A6oiaCbRfxk1ZMKBHg0k+fjPtlUUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUKg4IgB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUKg4IgB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746732699; x=1778268699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9h7i4193nrRu1KVPzUzr1zyv7+l9/ZN2fKwxy58xFbE=;
  b=SUKg4IgBREVejbtHR0JwUTruInIUgCyarIvp4VjeLJ6qZ7LzrIBGOJIU
   n3bl5FlxBPYgpZQRC1XPIGeO5WuLfirHYcjTK9yNCV+LlxIgvzEQJbY0d
   D3GTbKM5cVzqufPHgGdb61yxbZwJbFZlVG0M2dGpnSDnjWggqwKIBxgvC
   BgJk9k2Se2BKGPDgcdEwRZnPcPeftV7DoKkoUFbwxIcabRRWaD5CpIEnv
   EKApgaq3eHYKKmgQ8jAnPZ1xkFNz+bGnlVuHh2XqqvStNMfVpxXuYzH3D
   1hN8hA1PKa0oiGJ0x0G3tjZknLBjUcxm+j104jFC4nLVPdgih/blTCbzj
   g==;
X-CSE-ConnectionGUID: vuB++afMTA281zR9YofCnA==
X-CSE-MsgGUID: inGvvaHlTFSlZYxOKcMNng==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48651579"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48651579"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:31:38 -0700
X-CSE-ConnectionGUID: NW/XLdWBTde9XFtGOqvqHQ==
X-CSE-MsgGUID: cjU48EQLRHmh7LOpJd61Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136906942"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 May 2025 12:31:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD6xy-000BJ5-2q;
	Thu, 08 May 2025 19:31:34 +0000
Date: Fri, 9 May 2025 03:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/input/misc/uinput.o: warning: objtool:
 uinput_str_to_user+0x1a8: unknown CFA base reg -1
Message-ID: <202505090349.BDLOO2Am-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2c89c1b655c0b06823f4ee8b055140d8628fc4da
commit: 0a7fb6f07e3ad497d31ae9a2082d2cacab43d54a objtool: Increase per-function WARN_FUNC() rate limit
date:   7 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-buildonly-randconfig-004-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090349.BDLOO2Am-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090349.BDLOO2Am-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505090349.BDLOO2Am-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/misc/uinput.o: warning: objtool: uinput_str_to_user+0x1b0: undefined stack state
>> drivers/input/misc/uinput.o: warning: objtool: uinput_str_to_user+0x1a8: unknown CFA base reg -1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
