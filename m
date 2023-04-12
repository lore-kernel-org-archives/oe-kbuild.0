Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718972F24
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Apr 2023 10:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681293787; x=1712829787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aJU15IdkTCxCx6uq9NwqukUsyMVMvInsbu6Jm1tCNXo=;
  b=na9GsJNMNH8btvdqN/cpO1YshiecvH4KQIPOgxn1XmFENLi7VONY3qzE
   HCQzdQfprKaRqSpwWDwTHoPmjn4vIo4B4koDlXeHp2aBOngTziqHgVEWA
   7/k9CVUoqPaBzAg7D7G/5MTu7KWhbwDe/100COgcPpFAmol0X3lC1fzWw
   tfIMoygHD61ey99b7VtfxkW9QjSf3yUWyPaTxr0eO5ElknW1vADxuI/Bd
   koQz2DVo3/uJ8RYRqcWG6yG0RPLYs6aXPzTjY5loVWPvjiRAI1yeB7haI
   heiwsDoC0lWrBLqfyEF5PQRfYfaubOK9g1ICitf1iWZAAeldsW338Hfr3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="343857461"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="343857461"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 03:03:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="753473339"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="753473339"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 Apr 2023 03:03:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmXJg-000XbX-3C;
	Wed, 12 Apr 2023 10:03:04 +0000
Date: Wed, 12 Apr 2023 18:02:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 9557/10976]
 drivers/hwmon/pmbus/pmbus_core.c:3164:7-32: WARNING: Threaded IRQ with no
 primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Message-ID: <202304121754.bsCabYUY-lkp@intel.com>
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
TO: Patrick Rudolph <patrick.rudolph@9elements.com>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Naresh Solanki <naresh.solanki@9elements.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d8214bba44c1aa6a75921a09a691945d26a8d43
commit: 7bcf28fc842aab78823536dca730113894cf0557 [9557/10976] hwmon: (pmbus/core) Add interrupt support
:::::: branch date: 5 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/20230412/202304121754.bsCabYUY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304121754.bsCabYUY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/hwmon/pmbus/pmbus_core.c:3164:7-32: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
