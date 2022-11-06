Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F8A185F
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Nov 2022 10:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667731397; x=1699267397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V6lVTzXbNvbRF4w2uOlSboI7Lw8/K3KN/WGCi64P5d4=;
  b=NJQu/jLsJitoMWf07xRXgCqZ+xfDlZslZfRUQNi9u8s7FVOFDXFAlILu
   zaX12ZgODyCFnnrgohRoNxwbC/alJ6aGNspMym5e1+iSekLvz8LLgXtOJ
   htpJ8aS8bLoZDcIdvCGSqlPRx9KDJh/itREipsdN38G5E81YT+ByPiYkt
   AhKz+Eup6CzYjs17QEcjiZcO5EY1WOoheQsRE5UJGuowYzeeLL5JjqOLO
   uV5rOiZYTw8Lml1QrgwNyYsSM3DUdosQtcZEgXdNi3BgOycMDSNYSL7+C
   FUKhnGn2R/kKCDvoOxcMlMRIoHYNZTArUCmor4jPg+jv7fVqONHnn58L3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10522"; a="372358632"
X-IronPort-AV: E=Sophos;i="5.96,142,1665471600"; 
   d="scan'208";a="372358632"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2022 02:43:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10522"; a="666869040"
X-IronPort-AV: E=Sophos;i="5.96,142,1665471600"; 
   d="scan'208";a="666869040"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 06 Nov 2022 02:43:16 -0800
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ord7T-000Iif-1e;
	Sun, 06 Nov 2022 10:43:15 +0000
Date: Sun, 6 Nov 2022 18:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.15-2022-06 11181/11233]
 include/trace/hooks/remoteproc.h: linux/remoteproc.h is included more than
 once.
Message-ID: <202211061815.aYEIAR7S-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android13-5.15-2022-06
head:   37c9f03552c841bc4e1d1e41064ea1f3a82c86f2
commit: d5f809c84dc6c322e2650228fa60387f9fc38432 [11181/11233] ANDROID: GKI: use public type definitions in vendor hooks
:::::: branch date: 4 days ago
:::::: commit date: 5 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> include/trace/hooks/remoteproc.h: linux/remoteproc.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
