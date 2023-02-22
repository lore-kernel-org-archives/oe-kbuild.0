Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59BD2F45
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Feb 2023 11:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677064334; x=1708600334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M3P1zOzQ8CIVIdeiet8Vk+YgCc8sQj5JL/PnATAPn1I=;
  b=bAa3s5ECrB8ALWtdnUjmSAlxDp5mgN2y10AmJ6XaRy/PotV05tmcu3HG
   JRbe/E8/hfLDxp6TmkMVaankZyiURSFkbGmfbrRoIz9MdjPhI/CFkMb2H
   thqZ9GSNyt2U9T4Gs0u91eer7hZEagDhx4qAXXQCes+M6OkTNR60BvZ4H
   ulW4v280P9jNJi3/PrVtaMS4WZxBIg5H0D8ZyQMg9ZidVN57dAoFdwc5y
   q3Dj0JWTpxG4yFMcvRB9WPZmCElNzsZavElZXNS+jiXWoDj4kT96d5HTK
   4gLYxrF9uxv0zhcjXYMvkPSfyZrmpD1dHEgolTAkyopuu9UJv1QywowX/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="330623508"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="330623508"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 03:12:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="760921989"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="760921989"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2023 03:12:11 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUn2g-0000Hz-0X;
	Wed, 22 Feb 2023 11:12:10 +0000
Date: Wed, 22 Feb 2023 19:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 13464/13727]
 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c:1087:28: warning:
 'tracker' is used uninitialized
Message-ID: <202302221930.bAs2WwY1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c:1087:28: warning: 'tracker' is used uninitialized [-Wuninitialized]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Huacai Chen <chenhuacai@loongson.cn>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aaf70d5ad5e2b06a8050c51e278b0c3a14fabef5
commit: bf367e296ce8b3b714984f827db8b086f9738098 [13464/13727] LoongArch: Make -mstrict-align configurable
:::::: branch date: 7 hours ago
:::::: commit date: 23 hours ago
config: loongarch-randconfig-c024-20230222 (https://download.01.org/0day-ci/archive/20230222/202302221930.bAs2WwY1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bf367e296ce8b3b714984f827db8b086f9738098
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout bf367e296ce8b3b714984f827db8b086f9738098
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302221930.bAs2WwY1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c: In function 'mlx5_lag_netdev_event':
>> drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c:1087:28: warning: 'tracker' is used uninitialized [-Wuninitialized]
    1087 |         struct lag_tracker tracker;
         |                            ^~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c:1087:28: note: 'tracker' declared here
    1087 |         struct lag_tracker tracker;
         |                            ^~~~~~~


vim +/tracker +1087 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c

54493a08e21f46 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Mark Bloch  2022-01-12  1081  
94db3317781922 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Eli Cohen   2022-01-31  1082  /* this handler is always registered to netdev events */
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1083  static int mlx5_lag_netdev_event(struct notifier_block *this,
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1084  				 unsigned long event, void *ptr)
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1085  {
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1086  	struct net_device *ndev = netdev_notifier_info_to_dev(ptr);
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17 @1087  	struct lag_tracker tracker;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1088  	struct mlx5_lag *ldev;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1089  	int changed = 0;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1090  
54493a08e21f46 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Mark Bloch  2022-01-12  1091  	if (event != NETDEV_CHANGEUPPER &&
54493a08e21f46 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Mark Bloch  2022-01-12  1092  	    event != NETDEV_CHANGELOWERSTATE &&
54493a08e21f46 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Mark Bloch  2022-01-12  1093  	    event != NETDEV_CHANGEINFODATA)
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1094  		return NOTIFY_DONE;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1095  
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1096  	ldev    = container_of(this, struct mlx5_lag, nb);
9b412cc35f0025 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Jianbo Liu  2020-04-17  1097  
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1098  	tracker = ldev->tracker;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1099  
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1100  	switch (event) {
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1101  	case NETDEV_CHANGEUPPER:
a4a9c87ebb689c drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Eli Cohen   2022-02-06  1102  		changed = mlx5_handle_changeupper_event(ldev, &tracker, ptr);
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1103  		break;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1104  	case NETDEV_CHANGELOWERSTATE:
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1105  		changed = mlx5_handle_changelowerstate_event(ldev, &tracker,
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1106  							     ndev, ptr);
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1107  		break;
54493a08e21f46 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Mark Bloch  2022-01-12  1108  	case NETDEV_CHANGEINFODATA:
54493a08e21f46 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Mark Bloch  2022-01-12  1109  		changed = mlx5_handle_changeinfodata_event(ldev, &tracker, ndev);
54493a08e21f46 drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c Mark Bloch  2022-01-12  1110  		break;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1111  	}
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1112  
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1113  	ldev->tracker = tracker;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1114  
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1115  	if (changed)
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1116  		mlx5_queue_bond_work(ldev, 0);
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1117  
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1118  	return NOTIFY_DONE;
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1119  }
7907f23adc1867 drivers/net/ethernet/mellanox/mlx5/core/lag.c     Aviv Heller 2016-04-17  1120  

:::::: The code at line 1087 was first introduced by commit
:::::: 7907f23adc186700efbe56c032527e47485c86ab net/mlx5: Implement RoCE LAG feature

:::::: TO: Aviv Heller <avivh@mellanox.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
