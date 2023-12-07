Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E844437C
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Dec 2023 15:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKkqklpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701961675; x=1733497675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RMv3ljcSTmHs7bvYLscVqUVXkXya+dWw5HgXg06C5Mw=;
  b=PKkqklpAN2uW3y9IxztyJBp+gfGsizxQmTrj02B8ipqzQXMBYePqv4Rs
   oVdk14Py0DYUH9+bHymtN4MFHPH2dTZo5oaWJPlFbfKGKaV81yOF52Nvs
   6l9iPz7Ak9rf+42V/9QNzuLGfz07udTJOgnKt08fA2yMBUOZmwKSIo0gl
   9JAXAYu4bV7bUoGKXQI7G2L1cg9jR0V205PsRHTmoebltcLsOmVgNYoZp
   lbjlTO/7vxGMm2rBv5kMQqUfreuPxzoLSRRcRuTzAtT69xHwH79ipdAmu
   VWn/xwK4YO/wiZvXDg0rowssmNbSCt9CEbNRtrof7eV9bjQmU/Oy1gDmM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1350183"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1350183"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 07:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="945065975"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="945065975"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 07 Dec 2023 07:07:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBFyf-000COc-0d;
	Thu, 07 Dec 2023 15:07:49 +0000
Date: Thu, 7 Dec 2023 23:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/intel/ice/ice_main.c:8847:2-8: preceding lock
 on line 8827
Message-ID: <202312072228.qxI0BsIf-lkp@intel.com>
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
TO: Rafal Rogalski <rafalx.rogalski@intel.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Mateusz Palczewski <mateusz.palczewski@intel.com>
CC: Kamil Maziarz <kamil.maziarz@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 4b31fd4d77ffa430d0b74ba1885ea0a41594f202 ice: Fix RDMA VSI removal during queue rebuild
date:   4 months ago
:::::: branch date: 3 days ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-102-20231207 (https://download.01.org/0day-ci/archive/20231207/202312072228.qxI0BsIf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312072228.qxI0BsIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312072228.qxI0BsIf-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/ice/ice_main.c:8847:2-8: preceding lock on line 8827

vim +8847 drivers/net/ethernet/intel/ice/ice_main.c

0d08a441fb1a5c Kiran Patil    2021-08-06  8809  
0d08a441fb1a5c Kiran Patil    2021-08-06  8810  static int
0d08a441fb1a5c Kiran Patil    2021-08-06  8811  ice_setup_tc(struct net_device *netdev, enum tc_setup_type type,
0d08a441fb1a5c Kiran Patil    2021-08-06  8812  	     void *type_data)
0d08a441fb1a5c Kiran Patil    2021-08-06  8813  {
0d08a441fb1a5c Kiran Patil    2021-08-06  8814  	struct ice_netdev_priv *np = netdev_priv(netdev);
fbc7b27af0f9fb Kiran Patil    2021-10-15  8815  	struct ice_pf *pf = np->vsi->back;
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8816  	bool locked = false;
fbc7b27af0f9fb Kiran Patil    2021-10-15  8817  	int err;
0d08a441fb1a5c Kiran Patil    2021-08-06  8818  
0d08a441fb1a5c Kiran Patil    2021-08-06  8819  	switch (type) {
0d08a441fb1a5c Kiran Patil    2021-08-06  8820  	case TC_SETUP_BLOCK:
0d08a441fb1a5c Kiran Patil    2021-08-06  8821  		return flow_block_cb_setup_simple(type_data,
0d08a441fb1a5c Kiran Patil    2021-08-06  8822  						  &ice_block_cb_list,
0d08a441fb1a5c Kiran Patil    2021-08-06  8823  						  ice_setup_tc_block_cb,
0d08a441fb1a5c Kiran Patil    2021-08-06  8824  						  np, np, true);
fbc7b27af0f9fb Kiran Patil    2021-10-15  8825  	case TC_SETUP_QDISC_MQPRIO:
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8826  		if (pf->adev) {
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28 @8827  			mutex_lock(&pf->adev_mutex);
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8828  			device_lock(&pf->adev->dev);
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8829  			locked = true;
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8830  			if (pf->adev->dev.driver) {
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8831  				netdev_err(netdev, "Cannot change qdisc when RDMA is active\n");
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8832  				err = -EBUSY;
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8833  				goto adev_unlock;
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8834  			}
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8835  		}
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8836  
fbc7b27af0f9fb Kiran Patil    2021-10-15  8837  		/* setup traffic classifier for receive side */
fbc7b27af0f9fb Kiran Patil    2021-10-15  8838  		mutex_lock(&pf->tc_mutex);
fbc7b27af0f9fb Kiran Patil    2021-10-15  8839  		err = ice_setup_tc_mqprio_qdisc(netdev, type_data);
fbc7b27af0f9fb Kiran Patil    2021-10-15  8840  		mutex_unlock(&pf->tc_mutex);
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8841  
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8842  adev_unlock:
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8843  		if (locked) {
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8844  			device_unlock(&pf->adev->dev);
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8845  			mutex_unlock(&pf->adev_mutex);
4b31fd4d77ffa4 Rafal Rogalski 2023-07-28  8846  		}
fbc7b27af0f9fb Kiran Patil    2021-10-15 @8847  		return err;
0d08a441fb1a5c Kiran Patil    2021-08-06  8848  	default:
0d08a441fb1a5c Kiran Patil    2021-08-06  8849  		return -EOPNOTSUPP;
0d08a441fb1a5c Kiran Patil    2021-08-06  8850  	}
0d08a441fb1a5c Kiran Patil    2021-08-06  8851  	return -EOPNOTSUPP;
0d08a441fb1a5c Kiran Patil    2021-08-06  8852  }
0d08a441fb1a5c Kiran Patil    2021-08-06  8853  

:::::: The code at line 8847 was first introduced by commit
:::::: fbc7b27af0f9fb181811424e29caf6825594a841 ice: enable ndo_setup_tc support for mqprio_qdisc

:::::: TO: Kiran Patil <kiran.patil@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
