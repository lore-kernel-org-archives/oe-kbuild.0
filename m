Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC05392
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Apr 2023 04:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680494991; x=1712030991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DmBAG7V+GG+tK9mrFzxGc0lFeXDkvs2KZUIdgaacDzU=;
  b=jh4JhxED9rhC7s4nJ4kNCPlNpgKUqfy5rfnZA0cUOnOK0kyMHx5CbDUR
   Vbq78TWtWi2TOEPTE69GRz/84n5KIDYN2tq4KPmhxdKy7DOdYMptlP7ql
   9T3+NpPMpNyVD55zbcKxKVt+zBAmDkYGqRpJVQDUOJ0Ub64yflvDH4C2Y
   kq7FqwYtNEfjyIm9R0nYyYGh7MCNJp9nxphG79YqiwT8Tn8oCsUFDdmAR
   pgRpYcXKrzrhwNlsqJcsLqQjwbxvGmjvgIWSfcR3z4NRjxfDd9VzhvgHw
   xxEXLxEm8EG2DiwjPLYfcW7gOEHVb8m52jK8XKA3lyxkE+Scp3G2jvFPK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="341827589"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="341827589"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 21:09:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="718393402"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="718393402"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Apr 2023 21:09:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjBVq-000Nyj-1f;
	Mon, 03 Apr 2023 04:09:46 +0000
Date: Mon, 3 Apr 2023 12:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/wwan/t7xx/t7xx_pci.c:153:15: warning: Uninitialized
 variable: entity->id [uninitvar]
Message-ID: <202304031256.57kUiyuN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/wwan/t7xx/t7xx_pci.c:153:15: warning: Uninitialized variable: entity->id [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Souptick,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7e364e56293bb98cae1b55fd835f5991c4e96e7d
commit: 1298f83b546921506afa4050a833f21433ed4b88 ia64: old_rr4 added under CONFIG_HUGETLB_PAGE
date:   9 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 months ago
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 1298f83b546921506afa4050a833f21433ed4b88
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304031256.57kUiyuN-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/wwan/t7xx/t7xx_pci.c:153:15: warning: Uninitialized variable: entity->id [uninitvar]
     if (entity->id == pm_entity->id) {
                 ^
   drivers/net/wwan/t7xx/t7xx_pci.c:170:15: warning: Uninitialized variable: entity->id [uninitvar]
     if (entity->id == pm_entity->id) {
                 ^
>> drivers/net/wwan/t7xx/t7xx_pci.c:484:15: warning: Uninitialized variable: entity->resume_early [uninitvar]
     if (entity->resume_early)
                 ^
   drivers/net/wwan/t7xx/t7xx_pci.c:411:42: note: Assuming condition is false
    if (atomic_read(&t7xx_dev->md_pm_state) <= MTK_PM_INIT) {
                                            ^
   drivers/net/wwan/t7xx/t7xx_pci.c:484:15: note: Uninitialized variable: entity->resume_early
     if (entity->resume_early)
                 ^
--
>> drivers/net/wwan/t7xx/t7xx_state_monitor.c:83:17: warning: Uninitialized variable: notifier->notifier_fn [uninitvar]
     if (notifier->notifier_fn)
                   ^
>> drivers/net/wwan/t7xx/t7xx_state_monitor.c:465:14: warning: Uninitialized variable: event->event_id [uninitvar]
     if (event->event_id == event_id)
                ^
--
>> drivers/net/wwan/t7xx/t7xx_hif_cldma.c:376:16: warning: Uninitialized variable: req_cur->mapped_buff [uninitvar]
     if (req_cur->mapped_buff && req_cur->skb) {
                  ^
>> drivers/net/wwan/t7xx/t7xx_hif_cldma.c:794:12: warning: Uninitialized variable: req->skb [uninitvar]
     if (req->skb) {
              ^

vim +153 drivers/net/wwan/t7xx/t7xx_pci.c

46e8f49ed7b306 Haijun Liu 2022-05-06  146  
46e8f49ed7b306 Haijun Liu 2022-05-06  147  int t7xx_pci_pm_entity_register(struct t7xx_pci_dev *t7xx_dev, struct md_pm_entity *pm_entity)
46e8f49ed7b306 Haijun Liu 2022-05-06  148  {
46e8f49ed7b306 Haijun Liu 2022-05-06  149  	struct md_pm_entity *entity;
46e8f49ed7b306 Haijun Liu 2022-05-06  150  
46e8f49ed7b306 Haijun Liu 2022-05-06  151  	mutex_lock(&t7xx_dev->md_pm_entity_mtx);
46e8f49ed7b306 Haijun Liu 2022-05-06  152  	list_for_each_entry(entity, &t7xx_dev->md_pm_entities, entity) {
46e8f49ed7b306 Haijun Liu 2022-05-06 @153  		if (entity->id == pm_entity->id) {
46e8f49ed7b306 Haijun Liu 2022-05-06  154  			mutex_unlock(&t7xx_dev->md_pm_entity_mtx);
46e8f49ed7b306 Haijun Liu 2022-05-06  155  			return -EEXIST;
46e8f49ed7b306 Haijun Liu 2022-05-06  156  		}
46e8f49ed7b306 Haijun Liu 2022-05-06  157  	}
46e8f49ed7b306 Haijun Liu 2022-05-06  158  
46e8f49ed7b306 Haijun Liu 2022-05-06  159  	list_add_tail(&pm_entity->entity, &t7xx_dev->md_pm_entities);
46e8f49ed7b306 Haijun Liu 2022-05-06  160  	mutex_unlock(&t7xx_dev->md_pm_entity_mtx);
46e8f49ed7b306 Haijun Liu 2022-05-06  161  	return 0;
46e8f49ed7b306 Haijun Liu 2022-05-06  162  }
46e8f49ed7b306 Haijun Liu 2022-05-06  163  

:::::: The code at line 153 was first introduced by commit
:::::: 46e8f49ed7b3063f51e28f3ea2084b3da29c1503 net: wwan: t7xx: Introduce power management

:::::: TO: Haijun Liu <haijun.liu@mediatek.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
