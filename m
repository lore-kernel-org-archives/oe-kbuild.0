Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC4E6D24
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 16:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676996975; x=1708532975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k/Jd6Y9DFqE6ibHl3C/XqLxj4svE2M3xvN2GRGKld1o=;
  b=kdTp7A5/RBeWrS4P2VNXoyeXHdjMtvA9D4SfrsYUw1mv2QYME4zrzyWN
   QTtw2aCa69Ps3LannSuID09Yu7i0tleh4LuQVh+Dfi3B/svrYkbeCmyMv
   dAeoCf0OEiPPiGAQmWi27yPHap5Sdbrp1/0K7k2scV+TpaK41C1aHaEbg
   RfsI6e1i14zLfzsdaXjzu4nSFYyFa4R0dHdzpjA5hz7L4HGAgahdO9fyJ
   uaTXBRkaa2k3g2eOQbYRqtm1hja03uXmgkfuxZ7PXHcZzyQeklDt9r3Uj
   Ckh82jXqRDkFq8YZLb6POgvMXk+Y8+EKyfUxtqMDEDc/ZtT3k169ae8wj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="331346656"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="331346656"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 08:29:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814562064"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="814562064"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2023 08:29:27 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUVWB-00002D-02;
	Tue, 21 Feb 2023 16:29:27 +0000
Date: Wed, 22 Feb 2023 00:28:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13057/13664]
 drivers/net/ethernet/mellanox/mlx5/core/eq.c:1010
 mlx5_comp_irq_get_affinity_mask() warn: iterator used outside loop: 'eq'
Message-ID: <202302220006.nXIY6No9-lkp@intel.com>
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
TO: Parav Pandit <parav@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Shay Drory <shayd@nvidia.com>
CC: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   465461cf48465b8a0a54025db5ae2b3df7a04577
commit: 3ac0b6aa892a1961d3bc62c87e3e3c9646e9d309 [13057/13664] net/mlx5: Simplify eq list traversal
:::::: branch date: 10 hours ago
:::::: commit date: 3 days ago
config: s390-randconfig-m031-20230219 (https://download.01.org/0day-ci/archive/20230222/202302220006.nXIY6No9-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302220006.nXIY6No9-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eq.c:1010 mlx5_comp_irq_get_affinity_mask() warn: iterator used outside loop: 'eq'

vim +/eq +1010 drivers/net/ethernet/mellanox/mlx5/core/eq.c

f2f3df5501391b Saeed Mahameed 2018-11-19   997  
f2f3df5501391b Saeed Mahameed 2018-11-19   998  struct cpumask *
f2f3df5501391b Saeed Mahameed 2018-11-19   999  mlx5_comp_irq_get_affinity_mask(struct mlx5_core_dev *dev, int vector)
f2f3df5501391b Saeed Mahameed 2018-11-19  1000  {
fc63dd2a85be1f Shay Drory     2021-02-23  1001  	struct mlx5_eq_table *table = dev->priv.eq_table;
3ac0b6aa892a19 Parav Pandit   2023-02-15  1002  	struct mlx5_eq_comp *eq;
fc63dd2a85be1f Shay Drory     2021-02-23  1003  	int i = 0;
fc63dd2a85be1f Shay Drory     2021-02-23  1004  
3ac0b6aa892a19 Parav Pandit   2023-02-15  1005  	list_for_each_entry(eq, &table->comp_eqs_list, list) {
fc63dd2a85be1f Shay Drory     2021-02-23  1006  		if (i++ == vector)
fc63dd2a85be1f Shay Drory     2021-02-23  1007  			break;
fc63dd2a85be1f Shay Drory     2021-02-23  1008  	}
561aa15ad69e9d Yuval Avnery   2019-06-10  1009  
fc63dd2a85be1f Shay Drory     2021-02-23 @1010  	return mlx5_irq_get_affinity_mask(eq->core.irq);
f2f3df5501391b Saeed Mahameed 2018-11-19  1011  }
f2f3df5501391b Saeed Mahameed 2018-11-19  1012  EXPORT_SYMBOL(mlx5_comp_irq_get_affinity_mask);
f2f3df5501391b Saeed Mahameed 2018-11-19  1013  

:::::: The code at line 1010 was first introduced by commit
:::::: fc63dd2a85be1f37fb822594101e9219b7be7460 net/mlx5: Change IRQ storage logic from static to dynamic

:::::: TO: Shay Drory <shayd@nvidia.com>
:::::: CC: Saeed Mahameed <saeedm@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
