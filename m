Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A3F346E6B
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 15:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768058946; cv=none; b=BEq1q7pKGngCS69kdzGf0poXwQeQg0AECfA/XLoshZUG7W746+zk1tf1DQBNrkov2Ya8VH0IECxfpWA+n10xuunkvQ8jZx3lauHuIyG7d2lKsWaObsXJrdgRpOMzjA9udYYaxMOiAN9ITfgOuvRMThlMAwjHzZPhH2cvDe3S3WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768058946; c=relaxed/simple;
	bh=peEageKGDYTjtlmMSk95oQzTRRLuK0wODVhzizp2BTw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L96AbRrXQ4VZ28sWjobzz24VEqyKVvv6XRv2zFKhGQP9K3h8mv1phcmAKg9+tf0HuRoJ+Afl+QY1v06goUPlt0BNpTUOC7wbuUe4x5GodaZbTOJLug0355GIiaDAtiExdGiA8Dpn5wgMJLmMVvVjYClTsd+M850HO7NBRJLBKHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WfK9yrm/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WfK9yrm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768058944; x=1799594944;
  h=date:from:to:cc:subject:message-id;
  bh=peEageKGDYTjtlmMSk95oQzTRRLuK0wODVhzizp2BTw=;
  b=WfK9yrm/8Tnkh/sx0VUcbRpOnpZHldRrfzIr2IerL3SBcVSxuMiu6C8b
   u3qCW7zPHYuBP70HgdwljFXd5wHZb/H79SWRruas/3UDfKWhl7ra+mfbw
   uPwl9KrovIrKz4NxgCM8+lJiY7nDzLurP86HfTGCPbwzw8+I4jq7ZKIAW
   f7rCik+oH5mgn2iO0hfIqpTbWAtqrv6QbGIwVtDVUWkXqCdlSjsAJBXwd
   vyxnemSo+eUNdoBk+3eyV+yGXlHfs3l6/BRbDZymrq0LWuFWPvNUpgVVi
   tiGIH02wt8N+65ho67mLo7yC7N8Zrl5ww84tyoWjicg161HV2GRy1RjKW
   Q==;
X-CSE-ConnectionGUID: KTNVOsXHS/yy6/lO0DpEyQ==
X-CSE-MsgGUID: FRaBtltAQK2aOdfKDqnbcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69309243"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69309243"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 07:29:03 -0800
X-CSE-ConnectionGUID: msRyQIlAR6KFp2pwJh3ETw==
X-CSE-MsgGUID: Okzq3MGvQx+M1528mvivAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203504475"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Jan 2026 07:29:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veatg-000000008nz-3hIk;
	Sat, 10 Jan 2026 15:29:00 +0000
Date: Sat, 10 Jan 2026 23:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [glemco:staging_rv_mon_kunit 21/29]
 kernel/trace/rv/monitors/deadline/deadline.c:33:1: sparse: sparse: bad
 integer constant expression
Message-ID: <202601102340.E2jdm3s8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/trace/rv/monitors/deadline/deadline.c:33:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gabriele Monaco <gmonaco@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_mon_kunit
head:   45a96d573274287926f2fd31092f229238476843
commit: 5c22af5956b42cc02d383e188c13d383d334043a [21/29] rv: Add deadline monitors
:::::: branch date: 3 days ago
:::::: commit date: 8 days ago
config: sh-randconfig-r134-20260110 (https://download.01.org/0day-ci/archive/20260110/202601102340.E2jdm3s8-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601102340.E2jdm3s8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601102340.E2jdm3s8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/rv/monitors/deadline/deadline.c:33:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/deadline/deadline.c:33:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> kernel/trace/rv/monitors/deadline/deadline.c:33:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/deadline/deadline.c:33:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   kernel/trace/rv/monitors/deadline/deadline.c:34:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/deadline/deadline.c:34:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   kernel/trace/rv/monitors/deadline/deadline.c:35:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/deadline/deadline.c:35:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
--
>> kernel/trace/rv/monitors/nomiss/nomiss.c:35:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/nomiss/nomiss.c:35:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   kernel/trace/rv/monitors/nomiss/nomiss.c:287:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/nomiss/nomiss.c:287:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   kernel/trace/rv/monitors/nomiss/nomiss.c:287:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/nomiss/nomiss.c:287:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   kernel/trace/rv/monitors/nomiss/nomiss.c:288:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/nomiss/nomiss.c:288:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   kernel/trace/rv/monitors/nomiss/nomiss.c:289:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/nomiss/nomiss.c:289:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
--
>> kernel/trace/rv/monitors/throttle/throttle.c:246:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/throttle/throttle.c:246:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> kernel/trace/rv/monitors/throttle/throttle.c:246:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/throttle/throttle.c:246:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   kernel/trace/rv/monitors/throttle/throttle.c:247:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/throttle/throttle.c:247:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   kernel/trace/rv/monitors/throttle/throttle.c:248:1: sparse: sparse: bad integer constant expression
   kernel/trace/rv/monitors/throttle/throttle.c:248:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +33 kernel/trace/rv/monitors/deadline/deadline.c

5c22af5956b42c Gabriele Monaco 2025-07-31  32  
5c22af5956b42c Gabriele Monaco 2025-07-31 @33  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
