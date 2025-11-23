Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9F82248A8
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Nov 2025 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763885410; cv=none; b=qJWsb30Cl9zLdEmWWONl8JkHJm0cW0ObetM+Q8E1PtL3v/YPNse74PA0UeiluruM3DhjxnZN4cBoq9B7for+Cr8wl+904L09AJLdNQmIv+W+Dq5ki4ByoNUI2xUQ4jasy6IcrTHOOfaNRWBYWkor0T4UQxNoZQIEX9usWV5hF3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763885410; c=relaxed/simple;
	bh=r4JYL221fIBqUPO+SpszHegMcZSBOm0Nb70wJzKDQbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cxic9gCi8aBkwUvrljnqsk/1G2dJ28WFHcNwDjB3XkkVDqQWGORnAiTALJ+p2T5MelphM5GopdmvhC7c8uggpmyo5Uw+j0BMsQ0ajDJvekpQUvs26YDRwj6RLx3yNAgQv6FgAXTF0nW7tWYXF2kT91r5ekgPK7xcq9VT8Yako8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GA8GecOD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GA8GecOD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763885409; x=1795421409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r4JYL221fIBqUPO+SpszHegMcZSBOm0Nb70wJzKDQbQ=;
  b=GA8GecOD3Uj27N61wxPmItyIWv3KQhhuzZTVyiyrzQXA3/2z+HtA9wIp
   N8a0BNZCCxI+viwfkOB2Mccb8d7dQNLThMrMtPAr84kyGTChyJfaOvieH
   q7i/mX1hLETZtsE+08MGVQrR3MD7hubH8yGLfmIxd2m+W8DDakSUJxVB0
   Lo/vZLcoEDlRub0mqM79S5kXSI310w9JlKh438gX10sVgcojQUABX/c+s
   4db2XJtpAoDhnQktEjozqcrYayIOQLl6mvL48/SDp9BVMhcgboquKm+QR
   2h8SEezcXuGZeZp0GsPuqvKAQWzJg7+z5jTrPlVOsUnOjRwA4PD7Fcr69
   g==;
X-CSE-ConnectionGUID: MQ3LgFiFThaHUpewNL20QQ==
X-CSE-MsgGUID: Hw+Mzpd1SsSDAkE1jockmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65997812"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="65997812"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 00:10:08 -0800
X-CSE-ConnectionGUID: yvqckRnaQjK8BXSlQ3zu8w==
X-CSE-MsgGUID: VBcRBPkORzivJlSWqXCFsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="223007545"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Nov 2025 00:10:07 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN5Ab-00089F-1E;
	Sun, 23 Nov 2025 08:10:05 +0000
Date: Sun, 23 Nov 2025 16:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-nonmm-unstable 87/104] luo_test_utils.c:10:10: fatal
 error: stdio.h: No such file or directory
Message-ID: <202511231626.rt7Q2XkL-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   5b8dc8b45ebd9e7f3fea3adefeccd9ce94215103
commit: 81a033341e2b1e75301ff034735ea0dc632e473c [87/104] selftests/liveupdate: add kexec-based selftest for
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251123/202511231626.rt7Q2XkL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231626.rt7Q2XkL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511231626.rt7Q2XkL-lkp@intel.com/

Note: the akpm-mm/mm-nonmm-unstable HEAD 5b8dc8b45ebd9e7f3fea3adefeccd9ce94215103 builds fine.
      It only hurts bisectability.

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
