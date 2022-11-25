Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172098474
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Nov 2022 21:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669411183; x=1700947183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ith2JDLtPhFbCR7U0VMAk+IzbxEN3S0t0yr2guss3uE=;
  b=clN3fJFYW2tsP9MYlXeu8AfLR4ncZOTXag0WNG3hinUgNYbo2e+1WmXR
   1oQ7QdHu00lazsoakpu4nZOzIF1no1/pU8Wn3UakkFjKBbYCLoSxxl3FS
   wmBYl3+BCq1hwpL+b33hNqqSEvxbPu2y7YuAq8M1ANuw3SV+t5PT5DC7X
   uNiY4X3TNQ6SD31Jzo92ofYEjThwYX8MxAFPY5LFVcylfxQ982wGBwI7I
   IkhwfZbZ2jrIKwlfhfwwJ0BauKAdXnN6jdu+zFo7F/p2iqZTJrz1ORr/U
   9hAU/VwRp4k00F7P3SyfnYFt5Tjb5tJwCp0rQlmwFmi0uJ3YYJK/OwxK2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="312177526"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
   d="scan'208";a="312177526"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2022 13:19:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="644889461"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
   d="scan'208";a="644889461"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 25 Nov 2022 13:19:41 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oyg6n-0005Wb-0W;
	Fri, 25 Nov 2022 21:19:41 +0000
Date: Sat, 26 Nov 2022 05:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-5.15 1/1] spdxcheck:
 include/uapi/linux/android_fuse.h: 1:57 Exception not valid for license
 BSD-3-CLAUSE: Linux-syscall-note
Message-ID: <202211260524.fwSWKTKK-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   5853a069e0fdf286bc1904f187538bcee6d3c70d
commit: 9bc75534b343be508a9a492afc9699caa807da26 [1/1] ANDROID: fuse-bpf v1.1
:::::: branch date: 31 hours ago
:::::: commit date: 7 days ago
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

spdxcheck warnings: (new ones prefixed by >>)
>> include/uapi/linux/android_fuse.h: 1:57 Exception not valid for license BSD-3-CLAUSE: Linux-syscall-note
   tools/testing/selftests/rseq/compiler.h: 1:28 Invalid License ID: LGPL-2.1-only
   tools/testing/selftests/rseq/rseq-generic-thread-pointer.h: 1:28 Invalid License ID: LGPL-2.1-only
   tools/testing/selftests/rseq/rseq-ppc-thread-pointer.h: 1:28 Invalid License ID: LGPL-2.1-only
   tools/testing/selftests/rseq/rseq-thread-pointer.h: 1:28 Invalid License ID: LGPL-2.1-only
   tools/testing/selftests/rseq/rseq-x86-thread-pointer.h: 1:28 Invalid License ID: LGPL-2.1-only

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
