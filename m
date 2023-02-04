Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9627C2568
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Feb 2023 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675522488; x=1707058488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/joN+OVQ5i/C9a73nXGK8dAzaWADo8WwuWgohtaM7vI=;
  b=K4mnkuSnQO7GxN9wLUG0fcDdzQgrkRncnjTSt/q2N2lCVdeL0XymhcmK
   fYP+qfWJfzTR21FyYYHMcDbSFkLMkWpPVDk6yXleRBwoMsRv1sjxrCLfL
   jUBiGn+05iflxmgMDC26viznlsxen2IXhttZIaGt07H7tvuoc3iiHVWP/
   zuRarS0rWjYw99+7WNlmKhRu7pmT3K+JJWUKeC3rPqxKDt/OVG4ggg9n4
   llLKQFb0yDmV4BlmC0jaZBrPKOipAD6IsWmJ5y2EFtCpSFr7WrNCzc1CP
   NDiotUeYAe+fPdXm6JbgsDsYNFqWG8XYvWKxM2IDr06nEKjt+RtN44Cjx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312605196"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="312605196"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 06:54:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="659409704"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="659409704"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Feb 2023 06:54:47 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOJwE-0001My-0v;
	Sat, 04 Feb 2023 14:54:46 +0000
Date: Sat, 4 Feb 2023 22:54:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-6.1 6086/6874] spdxcheck:
 include/uapi/linux/android_fuse.h: 1:57 Exception not valid for license
 BSD-3-CLAUSE: Linux-syscall-note
Message-ID: <202302042232.Sdi71DwQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/uapi/linux/android_fuse.h: 1:57 Exception not valid for license BSD-3-CLAUSE: Linux-syscall-note"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   f4011fc8aedfcbcec01ce8ad9c91d4678de0c5ce
commit: 57f3ff9648991998d008ecf32f2f9e78a08bfb8b [6086/6874] ANDROID: fuse-bpf v1.1
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

spdxcheck warnings: (new ones prefixed by >>)
   drivers/cpufreq/amd-pstate-ut.c: 1:28 Invalid License ID: GPL-1.0-or-later
>> include/uapi/linux/android_fuse.h: 1:57 Exception not valid for license BSD-3-CLAUSE: Linux-syscall-note

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
