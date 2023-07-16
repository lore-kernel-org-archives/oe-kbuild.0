Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C90EA0
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Jul 2023 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689525688; x=1721061688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AQ4DOrD7Jjr2lg4cApFIL3TLe13JCyruOt4KokdnTbs=;
  b=AY5cqLPAcBudiDNpXOkG7YRTZFKhyrWr+kNvX5VkzPdjYSAnkrDpXKmm
   QrBOtg+cF3svfVA5/b+7arYaMOugrBmuc6KOEvY457ChRszSIJRnURRFR
   VYaeACgIE482T6apVn+X8iimPYlT1qrQDQ7jGsxGb8Ktd3L3XBYHsXtDe
   cdYM3YDcQYMGtU0eOL/M1S8q79XTPlxHTK5rr7GFIJXYXXMr6Zv40Eh9G
   vVuOBDKmFthund4k5yvGsclzmFh0QUVb/dDQ68Lx4T5jmJLAg+q4hdLTy
   3fh3m9uZoYLuRxP8T8nqY3eVm1Y9Qizd4ZMzhiKber8HORzuQWqlz3I7H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="365813752"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="365813752"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 09:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="813052017"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="813052017"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2023 09:41:26 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qL4oH-0008ts-2I;
	Sun, 16 Jul 2023 16:41:25 +0000
Date: Mon, 17 Jul 2023 00:41:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/soc/codecs/tas2781-i2c.c:255:26-27: WARNING opportunity for
 min()
Message-ID: <202307170049.Itoc4w21-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Shenghao Ding <13916275206@139.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   831fe284d8275987596b7d640518dddba5735f61
commit: ef3bcde75d06d65f78ba38a30d5a87fb83a5cdae ASoC: tas2781: Add tas2781 driver
date:   4 weeks ago
:::::: branch date: 25 hours ago
:::::: commit date: 4 weeks ago
config: powerpc-randconfig-r061-20230716 (https://download.01.org/0day-ci/archive/20230717/202307170049.Itoc4w21-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307170049.Itoc4w21-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307170049.Itoc4w21-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/codecs/tas2781-i2c.c:255:26-27: WARNING opportunity for min()
   sound/soc/codecs/tas2781-i2c.c:365:14-15: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
