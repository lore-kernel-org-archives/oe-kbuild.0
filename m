Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B001D5230
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Aug 2023 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690995030; x=1722531030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KGrL/OwSoIvjUnL+NlSV4Oe0dl9P7lFFzygf4Zi3/6c=;
  b=e+wsbTVKkWmCmw9vINd2KSe/2Ht+cUjeJGVrcyK7gUd5lI5PJpnY8j5B
   oaf+ueIfP2/93giUNlrigNePPeiY2iz6LrumLkYYVNdhxyS3v0A5Ad9YS
   xuFPcOHArV04gnWYOsm+FRDQmuLt4KMVLCzoYPvh+AWDraILQ6FxApmvt
   wfKm036n+iMAiTqii4MTpnwSGWofxBAbuHquZtdCorMC04xlErJV88Zv6
   Qw+u6ZggEUORXvOhIQjzWDEcQ3ulutMhRjPk6I4sszFSXesu2yLjYhO4j
   9FhRnKj5IdcthX5M7a3wCXofqovbA8nspJY9WU4X+O+fkY0otNcA4kZah
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="400585276"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="400585276"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 09:50:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="794658000"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="794658000"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Aug 2023 09:50:25 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRF3J-0001LR-0Q;
	Wed, 02 Aug 2023 16:50:25 +0000
Date: Thu, 3 Aug 2023 00:49:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [tnguy-next-queue:dev-queue 6/35]
 drivers/net/ethernet/intel/ice/ice_main.c:8876:2-8: preceding lock on line
 8856
Message-ID: <202308030015.k9edygXw-lkp@intel.com>
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
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Rafal Rogalski <rafalx.rogalski@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Mateusz Palczewski <mateusz.palczewski@intel.com>
CC: Kamil Maziarz <kamil.maziarz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   7f7d9efdd14a69d9e90700098448f6e15dce70ff
commit: ec38e724a7f8ba46d2f5a0e0a51bba595272e6fc [6/35] ice: Fix RDMA VSI removal during queue rebuild
:::::: branch date: 21 hours ago
:::::: commit date: 25 hours ago
config: s390-randconfig-r051-20230730 (https://download.01.org/0day-ci/archive/20230803/202308030015.k9edygXw-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030015.k9edygXw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308030015.k9edygXw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/ice/ice_main.c:8876:2-8: preceding lock on line 8856

vim +8876 drivers/net/ethernet/intel/ice/ice_main.c

0d08a441fb1a5c Kiran Patil    2021-08-06  8838  
0d08a441fb1a5c Kiran Patil    2021-08-06  8839  static int
0d08a441fb1a5c Kiran Patil    2021-08-06  8840  ice_setup_tc(struct net_device *netdev, enum tc_setup_type type,
0d08a441fb1a5c Kiran Patil    2021-08-06  8841  	     void *type_data)
0d08a441fb1a5c Kiran Patil    2021-08-06  8842  {
0d08a441fb1a5c Kiran Patil    2021-08-06  8843  	struct ice_netdev_priv *np = netdev_priv(netdev);
fbc7b27af0f9fb Kiran Patil    2021-10-15  8844  	struct ice_pf *pf = np->vsi->back;
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8845  	bool locked = false;
fbc7b27af0f9fb Kiran Patil    2021-10-15  8846  	int err;
0d08a441fb1a5c Kiran Patil    2021-08-06  8847  
0d08a441fb1a5c Kiran Patil    2021-08-06  8848  	switch (type) {
0d08a441fb1a5c Kiran Patil    2021-08-06  8849  	case TC_SETUP_BLOCK:
0d08a441fb1a5c Kiran Patil    2021-08-06  8850  		return flow_block_cb_setup_simple(type_data,
0d08a441fb1a5c Kiran Patil    2021-08-06  8851  						  &ice_block_cb_list,
0d08a441fb1a5c Kiran Patil    2021-08-06  8852  						  ice_setup_tc_block_cb,
0d08a441fb1a5c Kiran Patil    2021-08-06  8853  						  np, np, true);
fbc7b27af0f9fb Kiran Patil    2021-10-15  8854  	case TC_SETUP_QDISC_MQPRIO:
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8855  		if (pf->adev) {
ec38e724a7f8ba Rafal Rogalski 2023-07-03 @8856  			mutex_lock(&pf->adev_mutex);
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8857  			device_lock(&pf->adev->dev);
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8858  			locked = true;
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8859  			if (pf->adev->dev.driver) {
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8860  				netdev_err(netdev, "Cannot change qdisc when RDMA is active\n");
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8861  				err = -EBUSY;
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8862  				goto adev_unlock;
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8863  			}
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8864  		}
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8865  
fbc7b27af0f9fb Kiran Patil    2021-10-15  8866  		/* setup traffic classifier for receive side */
fbc7b27af0f9fb Kiran Patil    2021-10-15  8867  		mutex_lock(&pf->tc_mutex);
fbc7b27af0f9fb Kiran Patil    2021-10-15  8868  		err = ice_setup_tc_mqprio_qdisc(netdev, type_data);
fbc7b27af0f9fb Kiran Patil    2021-10-15  8869  		mutex_unlock(&pf->tc_mutex);
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8870  
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8871  adev_unlock:
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8872  		if (locked) {
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8873  			device_unlock(&pf->adev->dev);
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8874  			mutex_unlock(&pf->adev_mutex);
ec38e724a7f8ba Rafal Rogalski 2023-07-03  8875  		}
fbc7b27af0f9fb Kiran Patil    2021-10-15 @8876  		return err;
0d08a441fb1a5c Kiran Patil    2021-08-06  8877  	default:
0d08a441fb1a5c Kiran Patil    2021-08-06  8878  		return -EOPNOTSUPP;
0d08a441fb1a5c Kiran Patil    2021-08-06  8879  	}
0d08a441fb1a5c Kiran Patil    2021-08-06  8880  	return -EOPNOTSUPP;
0d08a441fb1a5c Kiran Patil    2021-08-06  8881  }
0d08a441fb1a5c Kiran Patil    2021-08-06  8882  

:::::: The code at line 8876 was first introduced by commit
:::::: fbc7b27af0f9fb181811424e29caf6825594a841 ice: enable ndo_setup_tc support for mqprio_qdisc

:::::: TO: Kiran Patil <kiran.patil@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
