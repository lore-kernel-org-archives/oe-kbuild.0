Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6031C15A9
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Jul 2023 04:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689656196; x=1721192196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VujUwwinH0s7xJP3sthIFtXF1WbBvZwaYuGBGtDN8yQ=;
  b=Fl3b/FrQOVpya96OtQpvCkO8FZ36S3VQyQXGP6q5vcqVAYExrPCrMN/Q
   xRad//Sb2tnyIcbBPfxtB/Z+EBTzuhSuy3PaMTgL6qlEY5wUw4zJRpV0m
   hXnVcYRt4C5KlOtnIwexTyA3JWbEmjyewpToPntAs0OJrP6P23YHpebQn
   P4wckVbevmVPrztgt2ca54tr3UMvv3FXHdREDYYnD1VxfU4h9trGJaMxS
   UYj7Z7emabywVOj6VA1fWI+IaSmo2QOEnRboV3galhfKlU+897h6bHcDl
   9BwRl2JDBoxR7JVWhKnP1flCaTCIQqp2eGRl9cSV6x5Fp/z/NVvNPerx8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="452486363"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="452486363"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 21:56:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="837133222"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="837133222"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2023 21:56:34 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLclF-0000E3-1x;
	Tue, 18 Jul 2023 04:56:33 +0000
Date: Tue, 18 Jul 2023 12:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 1622/3113]
 drivers/input/touchscreen/iqs7211.c:2547:9-34: WARNING: Threaded IRQ with no
 primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Message-ID: <202307181237.QzmhKgTU-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jeff LaBundy <jeff@labundy.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aeba456828b4e47d99ec8ffb01412fbed0f94806
commit: f2ba47e65f3b5642488802a60cb7dd068f425edc [1622/3113] Input: add support for Azoteq IQS7210A/7211A/E
:::::: branch date: 51 minutes ago
:::::: commit date: 5 days ago
config: xtensa-randconfig-r061-20230716 (https://download.01.org/0day-ci/archive/20230718/202307181237.QzmhKgTU-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307181237.QzmhKgTU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307181237.QzmhKgTU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/input/touchscreen/iqs7211.c:2547:9-34: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
