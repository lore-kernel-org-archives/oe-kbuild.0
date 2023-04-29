Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2244C1FD3
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Apr 2023 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682782809; x=1714318809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xcr9g8IvQ/khhrT0Ff/6bFo8fqFEIIlg3854CaPy2TA=;
  b=Yp/WfNaigQyKK/WE1UmbR2y2ASMhHOtVjNjyAbKgldqEV1rZ5+oDC5S4
   tF4OEjt5uA//FbcKn7r4Sh+SRhq14EVZmz+PHHwA+WGwKhW6grv0B5SBs
   ynEsV4Ml7icjetsxg0b9FA/l0Ra0O3ojnsbkMhcsVMcDBOZ47kTK9SEcP
   MknjYLQJCkiKjf1sry7Jp3JsC/RjrCK932IkekPE5gYTHxSd3fn0a6jwU
   NJqhR2Hg/Eqff8QI2HS72Y/ZLexkI6O73arGlZ8B0Ub7SRHedMl4xMLA+
   unZCBvmaPa8okB90IFhJ/Eg0B4khwzbgA4Mxki3mo0PI1CrdnRvcac94d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="345408187"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="345408187"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 08:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="725782746"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="725782746"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Apr 2023 08:40:07 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psmgA-0001En-0e;
	Sat, 29 Apr 2023 15:40:06 +0000
Date: Sat, 29 Apr 2023 23:39:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 14334/14376] drivers/cpufreq/pcc-cpufreq.c:
 linux/platform_device.h is included more than once.
Message-ID: <202304292342.uojCpx6O-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Rob Herring <robh@kernel.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   92e815cf07ed24ee1c51b122f24ffcf2964b4b13
commit: 819da626f4656f3f99da5762d0a5528ac6f25f5f [14334/14376] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
:::::: branch date: 24 hours ago
:::::: commit date: 27 hours ago
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304292342.uojCpx6O-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/cpufreq/pcc-cpufreq.c: linux/platform_device.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
