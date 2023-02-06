Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B647F
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Feb 2023 02:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675650587; x=1707186587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HdpZJTtR3Cga7fyxPYRUga0/Dmineuh0R1Sz+vBFnLw=;
  b=m1HKuD8VwaqGLBO6yCKplSQR911ESqVcnY9aqk1Gu6VBGnjFbAP0YhG1
   uHyUq5lp3SAlJj99fxD5TRDMV5Wve38U/Ddlcxk/7X5kBWh69QmggXchl
   01Rt9HBhB+gt+D3pa7/yMMu0T0WfPHcKXbk4ued6A4Dsd8S1kf2naSxuG
   cHomJPT3iinKhdLFntX0G71snNbuf5nCwlSLVztJ0Jh8e+3ECqaVn9rR0
   0WK84yDziUQpGr8Eu2872Kgju/1JogIrnwspSkKnqnT9TOCuLoCBQgkcD
   tQ7j3YIIaHyhKFmvsvU/RXquvB/oEEfSuvGdtq+xUuKHuhoSLnSJgJklX
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="327750855"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="327750855"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 18:29:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="643866364"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="643866364"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Feb 2023 18:29:45 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOrGK-0002LI-1Q;
	Mon, 06 Feb 2023 02:29:44 +0000
Date: Mon, 6 Feb 2023 10:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.2-netnext-pcs 8/18]
 drivers/net/pcs/pcs-mtk.c: linux/phylink.h is included more than once.
Message-ID: <202302061048.zWxsXbVF-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.2-netnext-pcs
head:   a90e4faf55c95fcb3f43d2ee0c38c5c5d0d4bd72
commit: 2ac429fc69485d3d7ff1158bf8d57118565b8301 [8/18] net: pcs: add driver for MediaTek SGMII PCS
:::::: branch date: 9 hours ago
:::::: commit date: 33 hours ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/pcs/pcs-mtk.c: linux/phylink.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
