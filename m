Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCCD15AE1
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Aug 2023 22:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692224895; x=1723760895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5VTV5XPj8p4OIP4rdj4lt+w7Em7wtr4c+10Oxe/XqzI=;
  b=Uns3ZavZU3UYCXUQry/P/rUqVyhYWBLeWz1JVsN1IXM5lxJi+w1s6jYH
   hm2w7ppNPKIinqUQE7KpvR40uUf6NPXPDdxdhp0wE/A5lTRnR+iv5Tj2/
   rJREcULgTpDh6Vgbk+M77j0LoSo2bOMM1inC+lVfhB4/Ev/VWHjaAxuSU
   qwqeqPxRr16qtB4bwGoVP8RGJBZadqisubTeFIIp03i/yeU5NtmDyOwIk
   QQtrlKdL6e7IqZ686GTEKjKaKG019KNh41jsbKUmMpH4y3r3qRpzy+a4f
   8bWwz/kJGAIMfVu2F5WutIsCXu8ubn+8dw20VMjUWM+TXP4EtK94o1MJW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372652529"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="372652529"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 15:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="727901755"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="727901755"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Aug 2023 15:28:13 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWOzt-0000cR-05;
	Wed, 16 Aug 2023 22:28:13 +0000
Date: Thu, 17 Aug 2023 06:27:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hare-nvme:tls.v12 18/19] drivers/nvme/target/tcp.c:1850:1: sparse:
 sparse: unused label 'out_destroy_sq'
Message-ID: <202308170613.kaNxvQep-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/nvme/target/tcp.c:1850:1: sparse: sparse: unused label 'out_destroy_sq'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git tls.v12
head:   c623bc8e57d23dde503188eacbf2d11e7dfe0564
commit: 2a255c0e370975ef7a7b22e4fce2d77080280761 [18/19] nvmet-tcp: enable TLS handshake upcall
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: nios2-randconfig-r093-20230817 (https://download.01.org/0day-ci/archive/20230817/202308170613.kaNxvQep-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170613.kaNxvQep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308170613.kaNxvQep-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/tcp.c:1850:1: sparse: sparse: unused label 'out_destroy_sq'

vim +/out_destroy_sq +1850 drivers/nvme/target/tcp.c

2a255c0e370975 Hannes Reinecke 2023-02-14  1845  
872d26a391da92 Sagi Grimberg   2018-12-03  1846  	ret = nvmet_tcp_set_queue_sock(queue);
a2fdd38afda518 Hannes Reinecke 2023-08-10  1847  	if (!ret)
1f5bec63b543b7 Hannes Reinecke 2023-08-08  1848  		return;
a2fdd38afda518 Hannes Reinecke 2023-08-10  1849  
2a255c0e370975 Hannes Reinecke 2023-02-14 @1850  out_destroy_sq:
a2fdd38afda518 Hannes Reinecke 2023-08-10  1851  	queue->state = NVMET_TCP_Q_DISCONNECTING;
872d26a391da92 Sagi Grimberg   2018-12-03  1852  	mutex_lock(&nvmet_tcp_queue_mutex);
872d26a391da92 Sagi Grimberg   2018-12-03  1853  	list_del_init(&queue->queue_list);
872d26a391da92 Sagi Grimberg   2018-12-03  1854  	mutex_unlock(&nvmet_tcp_queue_mutex);
a2fdd38afda518 Hannes Reinecke 2023-08-10  1855  	nvmet_tcp_put_queue(queue);
a2fdd38afda518 Hannes Reinecke 2023-08-10  1856  	return;
872d26a391da92 Sagi Grimberg   2018-12-03  1857  out_free_connect:
872d26a391da92 Sagi Grimberg   2018-12-03  1858  	nvmet_tcp_free_cmd(&queue->connect);
872d26a391da92 Sagi Grimberg   2018-12-03  1859  out_ida_remove:
44f331a630bdc7 Sagi Grimberg   2022-02-14  1860  	ida_free(&nvmet_tcp_queue_ida, queue->idx);
b17ce0e215347f Hannes Reinecke 2023-03-04  1861  out_sock:
b17ce0e215347f Hannes Reinecke 2023-03-04  1862  	fput(queue->sock->file);
872d26a391da92 Sagi Grimberg   2018-12-03  1863  out_free_queue:
872d26a391da92 Sagi Grimberg   2018-12-03  1864  	kfree(queue);
1f5bec63b543b7 Hannes Reinecke 2023-08-08  1865  out_release:
1f5bec63b543b7 Hannes Reinecke 2023-08-08  1866  	pr_err("failed to allocate queue, error %d\n", ret);
b17ce0e215347f Hannes Reinecke 2023-03-04  1867  	if (!sock_file)
1f5bec63b543b7 Hannes Reinecke 2023-08-08  1868  		sock_release(newsock);
872d26a391da92 Sagi Grimberg   2018-12-03  1869  }
872d26a391da92 Sagi Grimberg   2018-12-03  1870  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
