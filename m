Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B86B1C3A
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jun 2023 07:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686124131; x=1717660131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Por97HK17Gy8J3vx5xM6Y4LfKdR5Oxuy2W2+5dx7qRI=;
  b=kUqoogjdCWZAXorrbdEpLQPOctXJRlSuNd4pOTQ8QepXl4pJJVpLai5d
   D7n7geg9P3hf6U1Ln8rp7pHvdwLZqeX9NByDrh4heLFfHYZ1lYHn32OdN
   ii7SRQdLgwmpLgXfNkTYs+IjxvZeOBXESl4scdZpGHMgPSt6BBdrMQZy7
   cviAgVxqCszY1YLolUE2CadxaYeqpQWrF4oC8nLJIuJUYgOrivx3+BXmg
   W6rSRDuras2Ud2/sJl/rsWJyCQ2GFiWGR2yf+ORWCLm3IqoiNoKNg49WV
   jYRkTRkzayRkFPGAHGYvN0rwVxdULy3vFSDv5ZgzaFCHcAhDYadsugaiR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="443282151"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="443282151"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 00:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="659845428"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="659845428"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Jun 2023 00:48:49 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6nuS-0006Kv-1A;
	Wed, 07 Jun 2023 07:48:48 +0000
Date: Wed, 7 Jun 2023 15:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 7217/7747]
 drivers/pci/endpoint/functions/pci-epf-mhi.c:362:2-9: line 362 is redundant
 because platform_get_irq() already prints an error
Message-ID: <202306071547.PBPGIy8p-lkp@intel.com>
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
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Kishon Vijay Abraham I <kishon@kernel.org>
CC: Damien Le Moal <dlemoal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abbd8bb42915d9ed06df11b430bf4ecb3d8ac5ad
commit: 7db424a84d96b0ce8db0469ecd083c05c39f66a3 [7217/7747] PCI: endpoint: Add PCI Endpoint function driver for MHI bus
:::::: branch date: 3 hours ago
:::::: commit date: 23 hours ago
config: powerpc-randconfig-c031-20230607 (https://download.01.org/0day-ci/archive/20230607/202306071547.PBPGIy8p-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306071547.PBPGIy8p-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pci/endpoint/functions/pci-epf-mhi.c:362:2-9: line 362 is redundant because platform_get_irq() already prints an error

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
