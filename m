Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7BB2D321B
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764836026; cv=none; b=o5NLQZw0FXwitGdokGdt3RW4LSca1OgFrcBeVJusW8dx3nFxstcEETeyBo8i40Y9oQE7YlFp68eW6E/AqtNYtGxhiznUCNvQE/4R2QorkfCpD7hwmWybvzIw4ORyJ5bShD0Wxxo+oKmB77H9BDXJFejnUBT6saJuTp7NV6kQCK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764836026; c=relaxed/simple;
	bh=kH5Z03uq2GdFAGOwwpDVTBDPoVUorAjGu66Se30ENnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cQpUgAIqKhm6tqiknBM7z0WooeDPWNDRNYu4VVIW+tclALwHaglF+z0SV3DLWbBirHWCFM2OmxGj/CUtD+3Bqnaa/EqOZYSw1tXDufUZL4tcYfRKxVEJV0bIxZoZoE2qituNJcreyvCBldsKIZkKaDe6XWMcRhZvtcJGXoXmk0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTvSrXJG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTvSrXJG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764836024; x=1796372024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kH5Z03uq2GdFAGOwwpDVTBDPoVUorAjGu66Se30ENnI=;
  b=XTvSrXJGH5jQQb48ASvdL78i1/z3r9BY2LCrg2aPiY9+RPWBDTV+r49H
   vaOwDBJQHo0TKzwx+H+fNOcDfZh0Ul1OMpQ4q6BQNNrCJKiMX830R7eYQ
   SibSGOK6YwthSm2FN8/+kAucy8oRFExh0MAgdp60LLfDYZShojAnENd9J
   YQb4BzQt5jRSHjaqsVGy5dfXD7c0/RWuBcG3SQEhx2ks4lBvtL/PgFB4P
   Fr37fUu2G4YcO+rfTjpT/uG4jvn6VGyGX2BdY/8IaQdJGp3Pk7vKPH527
   Cq+SvvVHLX9zwC64kiR6WkNCBkkXEWIqOcL2XgK/6RtqNv0L8dqEEAoSw
   A==;
X-CSE-ConnectionGUID: Z90kp3egTf2WkTClZQub7w==
X-CSE-MsgGUID: uZvw6KDERzSNrkAZcNj7wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66887291"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="66887291"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 00:13:44 -0800
X-CSE-ConnectionGUID: PC4oRw3GRWO8regUu9tCxQ==
X-CSE-MsgGUID: by3MK+bQSOyGKnTPw3KFog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="195162926"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Dec 2025 00:13:42 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR4T6-000000000i3-0EjY;
	Thu, 04 Dec 2025 08:13:40 +0000
Date: Thu, 4 Dec 2025 09:13:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12100/13363] luo_test_utils.c:10:10: fatal error:
 stdio.h: No such file or directory
Message-ID: <202512040957.utdW7Ubt-lkp@intel.com>
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
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Zhu Yanjun <yanjun.zhu@linux.dev>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc04acf4aeca588496124a6cf54bfce3db327039
commit: a003bdb9ec4e12c869b9c8641dd9bebf90ac0389 [12100/13363] selftests/liveupdate: add simple kexec-based selftest for LUO
:::::: branch date: 80 minutes ago
:::::: commit date: 6 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251204/202512040957.utdW7Ubt-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040957.utdW7Ubt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512040957.utdW7Ubt-lkp@intel.com/

Note: the linux-next/master HEAD bc04acf4aeca588496124a6cf54bfce3db327039 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> luo_test_utils.c:10:10: fatal error: stdio.h: No such file or directory
      10 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.
--
   In file included from luo_kexec_simple.c:11:
>> luo_test_utils.h:13:10: fatal error: errno.h: No such file or directory
      13 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
