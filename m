Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B9A6124
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Nov 2022 07:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667892107; x=1699428107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0DStjXNn5qxB2RicZMnsxa9qbRTPqfhrioCunzdo3Y=;
  b=Tauj2fW2qtY4Q4fcolvxiZa/B1MbyyGLs4zDiOnhVybwGALpGIq0GN2E
   SsHdTzYZOZWxzTqpPUDQlnEV7kWpVrm+n3VLK51TkHXdGvN6rHUHC7bBn
   Ci67kcK+LtyhZdSA5LLiQEiOXvs5Me1HAPL5WcedmL5FD7gk3DOJjXqXw
   t162SfuyCbPgmEf69ko+fDiHteQjal5tviaukoNbRSvf8FsxzOkEwAYiS
   TG62HnWEnVropBsW6h2lLuq8eujb/JHJJ9sVDkNTEiixPgXvdZYczl4G/
   zMJUO96H3o5dW3Z/k6NmzMCcpwiWdp0MXkbYDxsHR/Wg8Up+J/nrubuvf
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="291014314"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="291014314"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 23:21:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="725462791"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="725462791"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Nov 2022 23:21:45 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1osIvZ-0000A5-0e;
	Tue, 08 Nov 2022 07:21:45 +0000
Date: Tue, 8 Nov 2022 15:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.15-2022-08 11181/11463]
 include/trace/hooks/remoteproc.h: linux/remoteproc.h is included more than
 once.
Message-ID: <202211081413.aJWFgFmZ-lkp@intel.com>
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
head:   4c992e760217ba9d0c03e1dd9719b5618b884e04
commit: d5f809c84dc6c322e2650228fa60387f9fc38432 [11181/11463] ANDROID: GKI: use public type definitions in vendor hooks
:::::: branch date: 3 days ago
:::::: commit date: 5 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> include/trace/hooks/remoteproc.h: linux/remoteproc.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
