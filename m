Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8561FB4
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Jun 2023 23:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685836323; x=1717372323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6itFSinHbMbOLmPMcpTCdlPU/jRaUYWBo2xakdcVn9U=;
  b=FKLa+VhClV3PEAnZeb3Af70GxQoUNUUgfbXGIA7/pLZw1juMTgQSxi5w
   Lrd450Fu1vOmFq60Yh3KeCpj6AINvX/rJt04Y8N6z/qWlH38i0A1H7+c6
   3Dg7XHFHpTc0+br9VSofVOXLxqr+6/S70L93MqgZOlHEhdsyGy5nKyS0V
   3jGOf6vVkBKGCfNLv0RktGxVVHHIOP+RowB/FQaJx7NubocIEr/9t176G
   KIA0AP+Tp5V5hH/RqW7CyWRJmKHuOCMNyEq20J26mceKpdA9YM1JCxpxx
   NNHliSFGXvI4sxKtveuBeCHEzUR9qy+zzO7mQ3E1OZ+i5TxwwqamNJEkn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="358568637"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="358568637"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 16:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="658654371"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="658654371"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Jun 2023 16:52:02 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5b2P-00027l-1R;
	Sat, 03 Jun 2023 23:52:01 +0000
Date: Sun, 4 Jun 2023 07:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:5.10/dovetail-xenomai 29719/30000]
 include/linux/dovetail.h: asm/dovetail.h is included more than once.
Message-ID: <202306040755.LCrulrV3-lkp@intel.com>
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
CC: Hao Li <hao3.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/dovetail-xenomai
head:   5610fff176c8ff3eb470b8270294bc7a7acb4a15
commit: 71307ea4c35460ffd9a3828d523bd190df483d85 [29719/30000] dovetail: include asm/dovetail.h even if !DOVETAIL
:::::: branch date: 10 days ago
:::::: commit date: 8 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306040755.LCrulrV3-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/dovetail.h: asm/dovetail.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
