Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7341662FE
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jul 2024 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720787726; cv=none; b=P2ndbnYhB70ho3hZi0giEsBRCKEVQtj8yq5pggL5LguquU/lY32xE4IRRSB/ZKD3q8WMZgCfMOJgVt0nb3JRmnRGNOPU4qJoIuU0vhJWGbps/a6bGb4o0OTGOpUgbedWK+aCozVd9ddI3/xQ5ipM7OiI+fg4ePbA1SXa+7vqaZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720787726; c=relaxed/simple;
	bh=f1fHi5OpGcKZhkupNNrgZ0fBIQOmhz4pT4pBzX53dp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CuDfjzDAVtCkvj3xOx0KgIiXby8BEbqGGw6d2/Kgct37Bl+sPBOlPzQwmj55kDI+JoQXihyJANjUuEAj7JhEIR7dXPRNtWqGYezpOI+GKKNq3T07GtUmg8hv1KbRwv4BrBWrQ5b+zwQ6zyNj3eLfxDHKKj+kj23tuV8+7019lEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5vZclDb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5vZclDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720787725; x=1752323725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f1fHi5OpGcKZhkupNNrgZ0fBIQOmhz4pT4pBzX53dp0=;
  b=W5vZclDb77rbXMhPfaLlR4z1tgpqkRywNgKDTqaPOrMQW33wOroL8fxP
   WI3XRPViencLFbpCZyinyS/IPiiVpeTE1SX/3Y1tctSdzrcF2+b2PygT8
   XAwo/lRUhpmMRUdAP/u49/5QL99a11np0Wd/aow87W+hfifk5IiT8Ah6x
   B9vaud5AeuUbntvrZyGEZbRktKQAfrdTOk+7U6Y6wIwLCYmrJ0rSInjU9
   3vIxSCr4NBRO00ooGpmepqZISMujcJQWa8c0jTusNsw1gyHTJUJqrh/uL
   bWwpiai1iVBDdPQ3U9OHgbcTBtE6UuhbRgXuj3Oog7Pg8bQglR8yikZa+
   Q==;
X-CSE-ConnectionGUID: runnDOSHSlWU3X5JAQBwFA==
X-CSE-MsgGUID: 8t1JAZrWSb6TFd1WjHeYbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18426649"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="18426649"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 05:35:24 -0700
X-CSE-ConnectionGUID: XMPLzI0vQGWwAnqJ3dAF3Q==
X-CSE-MsgGUID: mKCmouLSRmGphCwrWYuUVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="80001536"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jul 2024 05:35:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSFUf-000akw-14;
	Fri, 12 Jul 2024 12:35:21 +0000
Date: Fri, 12 Jul 2024 20:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linuxsecuritymodule:dev-staging 11/11] include/linux/lsm_hooks.h:
 linux/jump_label.h is included more than once.
Message-ID: <202407122041.NOQqOcs5-lkp@intel.com>
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
TO: KP Singh <kpsingh@kernel.org>
CC: Paul Moore <paul@paul-moore.com>
CC: Casey Schaufler <casey@schaufler-ca.com>
CC: Kees Cook <keescook@chromium.org>

tree:   https://github.com/LinuxSecurityModule/kernel dev-staging
head:   fe232b5ad921472638f2034c93b15cf3940fa3cf
commit: fe232b5ad921472638f2034c93b15cf3940fa3cf [11/11] lsm: replace indirect LSM hook calls with static calls
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407122041.NOQqOcs5-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/lsm_hooks.h: linux/jump_label.h is included more than once.
>> include/linux/lsm_hooks.h: linux/static_call.h is included more than once.

vim +35 include/linux/lsm_hooks.h

    27	
    28	#include <uapi/linux/lsm.h>
    29	#include <linux/security.h>
    30	#include <linux/init.h>
    31	#include <linux/rculist.h>
    32	#include <linux/xattr.h>
    33	#include <linux/static_call.h>
    34	#include <linux/unroll.h>
  > 35	#include <linux/jump_label.h>
    36	#include <linux/lsm_count.h>
    37	#include <linux/static_call.h>
  > 38	#include <linux/jump_label.h>
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
