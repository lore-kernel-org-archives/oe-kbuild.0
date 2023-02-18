Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF413ECE
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Feb 2023 10:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676717818; x=1708253818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YxKfSMqY7FGJbY+Kv4ZQ2ZfkrAYjKVP8SxN8DEojycw=;
  b=FsaB0wFE1YLYGu0j6oXtTGdxYNkroKed+Y454pg33UsObBJYWXCoOMtb
   e/L4iXeCQT2gDV2g7dVaL4ELJeRO2lpAPCmYIqCvRoJjXIo3DSAyc5iF6
   k4iiEYaO/dEv58k2x6M4nZ8+8+RFK80avuaaLwMynItw48FsNTHeC/pyj
   XIh7IjWb5RxKths9R0ijU7hsK1ySxJ6upJjUg0VwIB0czp9v8TwkoZ2If
   jbFP24mkHQkUY//Rzg6qrHUIZnkhQzL80F58ov35jMVpSJCHpnmEtN9iH
   in/aZsKzdkEKFo/XUWPKolUDw8OaTZtJhecaI8bfMyLOuMCE6ZhXMgrAR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="332167079"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="332167079"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 02:56:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="813655905"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="813655905"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2023 02:56:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTKtk-000CKD-2d;
	Sat, 18 Feb 2023 10:56:56 +0000
Date: Sat, 18 Feb 2023 18:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.15-2022-08 11181/11525]
 include/trace/hooks/remoteproc.h: linux/remoteproc.h is included more than
 once.
Message-ID: <202302181839.CW3Myr2J-lkp@intel.com>
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
head:   d77f6d6020b0d1e5d80b68e4534b1d7cbb047c49
commit: d5f809c84dc6c322e2650228fa60387f9fc38432 [11181/11525] ANDROID: GKI: use public type definitions in vendor hooks
:::::: branch date: 25 hours ago
:::::: commit date: 8 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302181839.CW3Myr2J-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/trace/hooks/remoteproc.h: linux/remoteproc.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
