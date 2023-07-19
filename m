Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FD312B88
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Jul 2023 10:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689762832; x=1721298832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ngt7N2MLsGFocrqkspLL3ICwhdDkw8rqkDDAh65pXWc=;
  b=Bc+6UVMWBX4d+BYij/h3eGfHerjg7f5XB93TyeDIfCCgYRIshM04R8M+
   8VSw0z2z6TrPD9ICGq8flDIIGSQJgHWoY85KGG7XrT9S1PXaoLxZFHTN+
   +nLm2Ri8c6dH68edBnWv/Q3op86ZeoCo32xEIBDsuYsx8Lw4kA9N6W5fP
   FEPA/qWloT4f3CKfvrNNyhHoPD7MgTihmz+M7pPIYieVRHO4A6MHxD1fZ
   iMtqG0o01QINqkGQ/r8VRxWrRJLfsfnNN1eXOq/n4sWFG9Uvo69NdXuej
   FiKpdID1gcwqjtgZv7vkyMAVY+HW3yDNLtnjTuvIiPR5TpF+C9cv0wecA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="397282752"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="397282752"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 03:33:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="674247429"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="674247429"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 19 Jul 2023 03:33:51 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM4VC-0004gF-1G;
	Wed, 19 Jul 2023 10:33:50 +0000
Date: Wed, 19 Jul 2023 18:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2809/3113]
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1196 event_alloc() error:
 uninitialized symbol 'ret'.
Message-ID: <202307191810.9m1K9s1Q-lkp@intel.com>
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
TO: Lucas Stach <l.stach@pengutronix.de>
CC: Christian Gmeiner <cgmeiner@igalia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aeba456828b4e47d99ec8ffb01412fbed0f94806
commit: f098f9b8042af09087f37353150c5ad6f26620d5 [2809/3113] drm/etnaviv: move runtime PM handling to events
:::::: branch date: 31 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021-20230717 (https://download.01.org/0day-ci/archive/20230719/202307191810.9m1K9s1Q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191810.9m1K9s1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307191810.9m1K9s1Q-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1196 event_alloc() error: uninitialized symbol 'ret'.

vim +/ret +1196 drivers/gpu/drm/etnaviv/etnaviv_gpu.c

3283ee771c88bdf Lucas Stach         2018-11-05  1141  
a8c21a5451d831e The etnaviv authors 2015-12-03  1142  /*
a8c21a5451d831e The etnaviv authors 2015-12-03  1143   * event management:
a8c21a5451d831e The etnaviv authors 2015-12-03  1144   */
a8c21a5451d831e The etnaviv authors 2015-12-03  1145  
95a428c17212dde Christian Gmeiner   2017-09-24  1146  static int event_alloc(struct etnaviv_gpu *gpu, unsigned nr_events,
95a428c17212dde Christian Gmeiner   2017-09-24  1147  	unsigned int *events)
a8c21a5451d831e The etnaviv authors 2015-12-03  1148  {
5a23144cb507bda Lucas Stach         2018-09-12  1149  	unsigned long timeout = msecs_to_jiffies(10 * 10000);
f098f9b8042af09 Lucas Stach         2023-06-07  1150  	unsigned i, acquired = 0, rpm_count = 0;
f098f9b8042af09 Lucas Stach         2023-06-07  1151  	int ret;
a8c21a5451d831e The etnaviv authors 2015-12-03  1152  
95a428c17212dde Christian Gmeiner   2017-09-24  1153  	for (i = 0; i < nr_events; i++) {
95a428c17212dde Christian Gmeiner   2017-09-24  1154  		unsigned long ret;
95a428c17212dde Christian Gmeiner   2017-09-24  1155  
95a428c17212dde Christian Gmeiner   2017-09-24  1156  		ret = wait_for_completion_timeout(&gpu->event_free, timeout);
a8c21a5451d831e The etnaviv authors 2015-12-03  1157  
95a428c17212dde Christian Gmeiner   2017-09-24  1158  		if (!ret) {
a8c21a5451d831e The etnaviv authors 2015-12-03  1159  			dev_err(gpu->dev, "wait_for_completion_timeout failed");
f098f9b8042af09 Lucas Stach         2023-06-07  1160  			ret = -EBUSY;
95a428c17212dde Christian Gmeiner   2017-09-24  1161  			goto out;
95a428c17212dde Christian Gmeiner   2017-09-24  1162  		}
95a428c17212dde Christian Gmeiner   2017-09-24  1163  
95a428c17212dde Christian Gmeiner   2017-09-24  1164  		acquired++;
95a428c17212dde Christian Gmeiner   2017-09-24  1165  		timeout = ret;
95a428c17212dde Christian Gmeiner   2017-09-24  1166  	}
a8c21a5451d831e The etnaviv authors 2015-12-03  1167  
5a23144cb507bda Lucas Stach         2018-09-12  1168  	spin_lock(&gpu->event_spinlock);
a8c21a5451d831e The etnaviv authors 2015-12-03  1169  
95a428c17212dde Christian Gmeiner   2017-09-24  1170  	for (i = 0; i < nr_events; i++) {
95a428c17212dde Christian Gmeiner   2017-09-24  1171  		int event = find_first_zero_bit(gpu->event_bitmap, ETNA_NR_EVENTS);
95a428c17212dde Christian Gmeiner   2017-09-24  1172  
95a428c17212dde Christian Gmeiner   2017-09-24  1173  		events[i] = event;
547d340d3f9bcd8 Christian Gmeiner   2017-09-24  1174  		memset(&gpu->event[event], 0, sizeof(struct etnaviv_event));
355502e03ad26e3 Christian Gmeiner   2017-09-24  1175  		set_bit(event, gpu->event_bitmap);
a8c21a5451d831e The etnaviv authors 2015-12-03  1176  	}
a8c21a5451d831e The etnaviv authors 2015-12-03  1177  
5a23144cb507bda Lucas Stach         2018-09-12  1178  	spin_unlock(&gpu->event_spinlock);
a8c21a5451d831e The etnaviv authors 2015-12-03  1179  
f098f9b8042af09 Lucas Stach         2023-06-07  1180  	for (i = 0; i < nr_events; i++) {
f098f9b8042af09 Lucas Stach         2023-06-07  1181  		ret = pm_runtime_resume_and_get(gpu->dev);
f098f9b8042af09 Lucas Stach         2023-06-07  1182  		if (ret)
f098f9b8042af09 Lucas Stach         2023-06-07  1183  			goto out_rpm;
f098f9b8042af09 Lucas Stach         2023-06-07  1184  		rpm_count++;
f098f9b8042af09 Lucas Stach         2023-06-07  1185  	}
f098f9b8042af09 Lucas Stach         2023-06-07  1186  
95a428c17212dde Christian Gmeiner   2017-09-24  1187  	return 0;
95a428c17212dde Christian Gmeiner   2017-09-24  1188  
f098f9b8042af09 Lucas Stach         2023-06-07  1189  out_rpm:
f098f9b8042af09 Lucas Stach         2023-06-07  1190  	for (i = 0; i < rpm_count; i++)
f098f9b8042af09 Lucas Stach         2023-06-07  1191  		pm_runtime_put_autosuspend(gpu->dev);
95a428c17212dde Christian Gmeiner   2017-09-24  1192  out:
95a428c17212dde Christian Gmeiner   2017-09-24  1193  	for (i = 0; i < acquired; i++)
95a428c17212dde Christian Gmeiner   2017-09-24  1194  		complete(&gpu->event_free);
95a428c17212dde Christian Gmeiner   2017-09-24  1195  
f098f9b8042af09 Lucas Stach         2023-06-07 @1196  	return ret;
a8c21a5451d831e The etnaviv authors 2015-12-03  1197  }
a8c21a5451d831e The etnaviv authors 2015-12-03  1198  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
