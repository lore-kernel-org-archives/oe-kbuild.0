Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AD517E015
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Dec 2024 05:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733288982; cv=none; b=O7+qbnBS7NUdLqD9G8aOBDpo+FUS0+efXpNdIfKpHTrm7mFTmqoFV0L9cgPAnBk5h71BFAXP9ORL6SPddZlHL8IR+VcNrGcMvFzShFcSVhfDudSioCqTdOcTD6fh2AvwozMtIjDNb3/iHS1ufjbLN4iK8EFtnUN9cmdNGGfLrUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733288982; c=relaxed/simple;
	bh=czJrmZYAHnEV+cZiL2/jMC8qTWKe7BAv+OU/cIHszkc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gnMaTeUOSqO6vBBUI7WcVfUi/muRke0Rm3VjCZCpOoCeGFQyFg3w5OeREVNT/niLGtbfGSLl7gTrbgLsveKbsQn8cCK4/jRcTZn3DClSSZnGxIUu5G+eFcVFJS+iA90ObBVGw01F00qH1ztsev5TYiDsRws+FSUlZBja+K79wrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nl7i+87h; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nl7i+87h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733288977; x=1764824977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=czJrmZYAHnEV+cZiL2/jMC8qTWKe7BAv+OU/cIHszkc=;
  b=nl7i+87hu83u2TwTlnAz9Dg3+BGLTh7zcB1FseDfwbDZlL3fSUL8Y/o7
   idsv0c4L+716JZ7z6A3VLBFTLmvmp0oEUVlr0PkOYmC7UGsgoOCThEp16
   xhzrkOcj1L+lI6BE4wLMep8h+gstx06cV7iKyd1sBAOzKudy3C+3QBrFo
   5BppC1NyGzgw9V4M28zRpzUyA6k+KaKNl07xDYfX0zCTydptRDPQVYOFL
   QJgLz53Dx1FZ+I2GamJBv76K9ahcSRKrxQc/kpWI0aU/gVCi9CoqK3OGq
   OAUSkummJJQOIlf+hktW6vpfYC/lAdXmEQ1jW55WJF2zfvJTGzMucQjqB
   A==;
X-CSE-ConnectionGUID: M9+EaLs/STCCPwwoyDzeYA==
X-CSE-MsgGUID: kHcSPGEUSoGvu26jelyt4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33668840"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="33668840"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 21:09:37 -0800
X-CSE-ConnectionGUID: gDxE5oGcRVS8DPGUS+k/Fg==
X-CSE-MsgGUID: 2W2yIlZdTjqiXBpmF4tTMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="94082315"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Dec 2024 21:09:35 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIhdk-0002bn-1P;
	Wed, 04 Dec 2024 05:09:32 +0000
Date: Wed, 4 Dec 2024 13:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/intel/ice/ice_main.c:8847:2-8: preceding lock
 on line 8827
Message-ID: <202412041350.UOT90MWq-lkp@intel.com>
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
head:   feffde684ac29a3b7aec82d2df850fbdbdee55e4
commit: 4b31fd4d77ffa430d0b74ba1885ea0a41594f202 ice: Fix RDMA VSI removal during queue rebuild
date:   1 year, 4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 1 year, 4 months ago
config: alpha-randconfig-r051-20241117 (https://download.01.org/0day-ci/archive/20241204/202412041350.UOT90MWq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412041350.UOT90MWq-lkp@intel.com/

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
