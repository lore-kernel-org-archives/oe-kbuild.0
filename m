Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD607C
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Jan 2023 06:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673678493; x=1705214493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bfexUbGH2n4/vPDeZjyT4SXmzpRqKfaaXY4s9aLapoM=;
  b=EQVTvcVKFaEmaW/amE+vALuyhDKzgfxLzWqv7nOl1JyXP/gzfWxolD1j
   PFdHZGJSwAZNk1sM49b6hhl3HCz1nfQQu/qv/iTPs/4rbG6/1U6Tbvg0s
   7CBzJNgV2gldSyYHfHQjplFYsYCCrVV17kolxtJaM/srx3/rk9WuZmzwQ
   QTGTepACkpbDqloC0kAIwpF76/QALD1GVqOKB9/RMMGo8GXPgZ7TqfZbw
   xddI9bQFeie+NZuP2tDyeMKNpooKBwASDk/YLI6KZ320Ws4htbP+O9yY+
   FzrS4ZSAABqq0LwpdDOQ+wIoK+0ZThHIgq8rjw7OqRwhFxU8ekIJ7Roho
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="312018577"
X-IronPort-AV: E=Sophos;i="5.97,216,1669104000"; 
   d="scan'208";a="312018577"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2023 22:41:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="660439452"
X-IronPort-AV: E=Sophos;i="5.97,216,1669104000"; 
   d="scan'208";a="660439452"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jan 2023 22:41:31 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pGaEM-000Br1-1Z;
	Sat, 14 Jan 2023 06:41:30 +0000
Date: Sat, 14 Jan 2023 14:41:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.15-2022-08 11181/11522]
 include/trace/hooks/remoteproc.h: linux/remoteproc.h is included more than
 once.
Message-ID: <202301141425.5mDpOtP4-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15-2022-08
head:   726946c4f06922176d3bd5a1f919995aaf25dce2
commit: d5f809c84dc6c322e2650228fa60387f9fc38432 [11181/11522] ANDROID: GKI: use public type definitions in vendor hooks
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> include/trace/hooks/remoteproc.h: linux/remoteproc.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
