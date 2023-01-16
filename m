Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCDA1C33
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Jan 2023 11:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673868328; x=1705404328;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VIkr7gbu2HVCrsx9pMsPCWEovNgwR+l1V/j0L54wgkg=;
  b=OEVbAfZTAapq+MURVyPsGe2VciTW7WRTnqdwrDiOp8kf03QeUBZBbUrq
   SG9/JXxmutUaV3ko704UuiG+cThM9sYjGnPDu13G1/4s4vZvcqxeh0oY0
   r5LUoggIpORWOTwBinFXPpxnz/V0T4VM1K6sJ1IxGSA9kBd1HDBe3+YjV
   rUaLKOgX8418cHb9zwJvchz+bAsj/a114K6w6cU3JqKBBHb9KhOh3tXDR
   nI1LlzrGIU1/qOHgUBd4Dh/FvjZOIkdyYjIHHJNvX9Um69AfzBKYSty3C
   fDslWG1WxzFteXO35e3ZuQz3AYuq1XaIs+20fAHhPekJaOjo/CRk7OOy0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="312294559"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="312294559"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 03:25:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="782873401"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="782873401"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Jan 2023 03:25:26 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pHNc8-0000RN-2a;
	Mon, 16 Jan 2023 11:25:20 +0000
Date: Mon, 16 Jan 2023 19:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/wwan/t7xx/t7xx_pci.c:124:15: warning: Uninitialized
 variable: entity->id [uninitvar]
Message-ID: <202301161933.JsK1Yuiv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/wwan/t7xx/t7xx_pci.c:124:15: warning: Uninitialized variable: entity->id [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Haijun Liu <haijun.liu@mediatek.com>
CC: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
CC: Ricardo Martinez <ricardo.martinez@linux.intel.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5dc4c995db9eb45f6373a956eb1f69460e69e6d4
commit: 46e8f49ed7b3063f51e28f3ea2084b3da29c1503 net: wwan: t7xx: Introduce power management
date:   8 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 8 months ago
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 46e8f49ed7b3063f51e28f3ea2084b3da29c1503
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/wwan/t7xx/t7xx_pci.c:124:15: warning: Uninitialized variable: entity->id [uninitvar]
     if (entity->id == pm_entity->id) {
                 ^
   drivers/net/wwan/t7xx/t7xx_pci.c:141:15: warning: Uninitialized variable: entity->id [uninitvar]
     if (entity->id == pm_entity->id) {
                 ^
>> drivers/net/wwan/t7xx/t7xx_pci.c:382:15: warning: Uninitialized variable: entity->resume_early [uninitvar]
     if (entity->resume_early)
                 ^
   drivers/net/wwan/t7xx/t7xx_pci.c:309:42: note: Assuming condition is false
    if (atomic_read(&t7xx_dev->md_pm_state) <= MTK_PM_INIT) {
                                            ^
   drivers/net/wwan/t7xx/t7xx_pci.c:382:15: note: Uninitialized variable: entity->resume_early
     if (entity->resume_early)
                 ^

vim +124 drivers/net/wwan/t7xx/t7xx_pci.c

46e8f49ed7b306 Haijun Liu 2022-05-06  117  
46e8f49ed7b306 Haijun Liu 2022-05-06  118  int t7xx_pci_pm_entity_register(struct t7xx_pci_dev *t7xx_dev, struct md_pm_entity *pm_entity)
46e8f49ed7b306 Haijun Liu 2022-05-06  119  {
46e8f49ed7b306 Haijun Liu 2022-05-06  120  	struct md_pm_entity *entity;
46e8f49ed7b306 Haijun Liu 2022-05-06  121  
46e8f49ed7b306 Haijun Liu 2022-05-06  122  	mutex_lock(&t7xx_dev->md_pm_entity_mtx);
46e8f49ed7b306 Haijun Liu 2022-05-06  123  	list_for_each_entry(entity, &t7xx_dev->md_pm_entities, entity) {
46e8f49ed7b306 Haijun Liu 2022-05-06 @124  		if (entity->id == pm_entity->id) {
46e8f49ed7b306 Haijun Liu 2022-05-06  125  			mutex_unlock(&t7xx_dev->md_pm_entity_mtx);
46e8f49ed7b306 Haijun Liu 2022-05-06  126  			return -EEXIST;
46e8f49ed7b306 Haijun Liu 2022-05-06  127  		}
46e8f49ed7b306 Haijun Liu 2022-05-06  128  	}
46e8f49ed7b306 Haijun Liu 2022-05-06  129  
46e8f49ed7b306 Haijun Liu 2022-05-06  130  	list_add_tail(&pm_entity->entity, &t7xx_dev->md_pm_entities);
46e8f49ed7b306 Haijun Liu 2022-05-06  131  	mutex_unlock(&t7xx_dev->md_pm_entity_mtx);
46e8f49ed7b306 Haijun Liu 2022-05-06  132  	return 0;
46e8f49ed7b306 Haijun Liu 2022-05-06  133  }
46e8f49ed7b306 Haijun Liu 2022-05-06  134  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
