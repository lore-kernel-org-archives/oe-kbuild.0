Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ECC643
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Apr 2023 15:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682866901; x=1714402901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Igs/NDApF4CriP1jFt/AwTkLY1nS3WF0Cp5XktwsY/c=;
  b=SwKwn9pNv189ewnv/1r7CDDu2qjBRfVXBtA+22INtVC2S7TBo9b3kf9e
   h4y3hYTAjTT4d3I9LCSSW2oPcDJc4aUqD1LaXCYvOZN2cmEnptnlj/NPK
   Yw53LpnbPQ2SsxYgJQlCVDz70xhjlsG48lulsIOcZ5H/xrY+TV4OWtywI
   NvoDqQg/UrL0J5ftNgyamAYavn7H/ZZ6tqS6XNjATj6ePyq2YUq/nVwRf
   deZhgKkdKrjNUfTK6Ny1agyIpCmgmjWgDKArNJ4uOjrKQzzQr7vDLevyR
   LJO7fYpvgxjRfTkcYnuZxfMlvFh0aj0l3DoaU8Gx5YAXop+E0CJ1qtDN8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="413451302"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="413451302"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 08:01:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="765028508"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="765028508"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Apr 2023 08:01:39 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pt8YU-00000z-1m;
	Sun, 30 Apr 2023 15:01:38 +0000
Date: Sun, 30 Apr 2023 23:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/eq.c:834
 comp_irqs_request_pci() error: we previously assumed 'cpus' could be null
 (see line 827)
Message-ID: <202304302259.FRdwjMVP-lkp@intel.com>
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
TO: Eli Cohen <elic@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Shay Drory <shayd@nvidia.com>
CC: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   825a0714d2b3883d4f8ff64f6933fb73ee3f1834
commit: b48a0f72bc3e5b10f55b3d40f051135fc9afd0e5 net/mlx5: Refactor completion irq request/release code
date:   5 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 weeks ago
config: openrisc-randconfig-m031-20230430 (https://download.01.org/0day-ci/archive/20230430/202304302259.FRdwjMVP-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304302259.FRdwjMVP-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eq.c:834 comp_irqs_request_pci() error: we previously assumed 'cpus' could be null (see line 827)

Old smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eq.c:1033 mlx5_comp_irq_get_affinity_mask() warn: iterator used outside loop: 'eq'

vim +/cpus +834 drivers/net/ethernet/mellanox/mlx5/core/eq.c

79b60ca83b6fa6 Shay Drory   2021-12-12  813  
b48a0f72bc3e5b Eli Cohen    2023-01-09  814  static int comp_irqs_request_pci(struct mlx5_core_dev *dev)
79b60ca83b6fa6 Shay Drory   2021-12-12  815  {
79b60ca83b6fa6 Shay Drory   2021-12-12  816  	struct mlx5_eq_table *table = dev->priv.eq_table;
2acda57736de1e Tariq Toukan 2023-01-20  817  	const struct cpumask *prev = cpu_none_mask;
2acda57736de1e Tariq Toukan 2023-01-20  818  	const struct cpumask *mask;
b48a0f72bc3e5b Eli Cohen    2023-01-09  819  	int ncomp_eqs;
79b60ca83b6fa6 Shay Drory   2021-12-12  820  	u16 *cpus;
79b60ca83b6fa6 Shay Drory   2021-12-12  821  	int ret;
2acda57736de1e Tariq Toukan 2023-01-20  822  	int cpu;
79b60ca83b6fa6 Shay Drory   2021-12-12  823  	int i;
79b60ca83b6fa6 Shay Drory   2021-12-12  824  
79b60ca83b6fa6 Shay Drory   2021-12-12  825  	ncomp_eqs = table->num_comp_eqs;
79b60ca83b6fa6 Shay Drory   2021-12-12  826  	cpus = kcalloc(ncomp_eqs, sizeof(*cpus), GFP_KERNEL);
b48a0f72bc3e5b Eli Cohen    2023-01-09 @827  	if (!cpus)
79b60ca83b6fa6 Shay Drory   2021-12-12  828  		ret = -ENOMEM;
2acda57736de1e Tariq Toukan 2023-01-20  829  
2acda57736de1e Tariq Toukan 2023-01-20  830  	i = 0;
2acda57736de1e Tariq Toukan 2023-01-20  831  	rcu_read_lock();
2acda57736de1e Tariq Toukan 2023-01-20  832  	for_each_numa_hop_mask(mask, dev->priv.numa_node) {
2acda57736de1e Tariq Toukan 2023-01-20  833  		for_each_cpu_andnot(cpu, mask, prev) {
2acda57736de1e Tariq Toukan 2023-01-20 @834  			cpus[i] = cpu;
2acda57736de1e Tariq Toukan 2023-01-20  835  			if (++i == ncomp_eqs)
2acda57736de1e Tariq Toukan 2023-01-20  836  				goto spread_done;
2acda57736de1e Tariq Toukan 2023-01-20  837  		}
2acda57736de1e Tariq Toukan 2023-01-20  838  		prev = mask;
2acda57736de1e Tariq Toukan 2023-01-20  839  	}
2acda57736de1e Tariq Toukan 2023-01-20  840  spread_done:
2acda57736de1e Tariq Toukan 2023-01-20  841  	rcu_read_unlock();
79b60ca83b6fa6 Shay Drory   2021-12-12  842  	ret = mlx5_irqs_request_vectors(dev, cpus, ncomp_eqs, table->comp_irqs);
79b60ca83b6fa6 Shay Drory   2021-12-12  843  	kfree(cpus);
79b60ca83b6fa6 Shay Drory   2021-12-12  844  	return ret;
b48a0f72bc3e5b Eli Cohen    2023-01-09  845  }
b48a0f72bc3e5b Eli Cohen    2023-01-09  846  

:::::: The code at line 834 was first introduced by commit
:::::: 2acda57736de1e486036b90a648e67a3599080a1 net/mlx5e: Improve remote NUMA preferences used for the IRQ affinity hints

:::::: TO: Tariq Toukan <tariqt@nvidia.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
