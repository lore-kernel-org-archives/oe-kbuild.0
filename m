Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948581FCC
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Jul 2023 02:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688782580; x=1720318580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mh+TCKJiZ5xok1zUeUjbuuUuqbegj+wEyU4QCQTIrjQ=;
  b=nANuX+rIN+tzSc6pij8DrVvd3+LOsITK9TqHOFRNCEuy9cbxHNIicn/A
   jE311s8lPDmmOfFvGcpCJNwBbPCteyG6qz/4Jh9e+WrZeGx4RO7ZbXFTJ
   Wvm9gBKvuxo45U3nO0sKqwDzxy+TdGtVLcVU/czexTlg56iS4J61g7V4O
   xXy4R+SQtYxbIeqDFbuF4B3BEe9hwlndJfEo3QfrZ4RKlu52qDADlNpJ9
   5+d42Vz8MaSXOyNQze8j4CpoCp010es3jKCLvHHVuexDnR0K4XVpe98Vn
   M7wBPaQiweDGmQnJgILoQHKLpvBDLeVyyFQT5870fErGUoldyHzU9JVQp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="362885098"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="362885098"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 19:16:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="833608679"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="833608679"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Jul 2023 19:16:18 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHxUf-0002V8-2E;
	Sat, 08 Jul 2023 02:16:17 +0000
Date: Sat, 8 Jul 2023 10:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [tnguy-next-queue:dev-queue 54/56]
 drivers/net/ethernet/intel/ice/ice_main.c:8917:2-8: preceding lock on line
 8897
Message-ID: <202307081040.PYgYBtQi-lkp@intel.com>
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
head:   4c26b12c99efda751ecd155f84c50c280d4c85de
commit: fc5b3871fcffdec029388e3f5b66d2673c3ddaed [54/56] ice: Fix RDMA VSI removal during queue rebuild
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: powerpc-randconfig-r064-20230704 (https://download.01.org/0day-ci/archive/20230708/202307081040.PYgYBtQi-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307081040.PYgYBtQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307081040.PYgYBtQi-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/ice/ice_main.c:8917:2-8: preceding lock on line 8897

vim +8917 drivers/net/ethernet/intel/ice/ice_main.c

0d08a441fb1a5c Kiran Patil    2021-08-06  8879  
0d08a441fb1a5c Kiran Patil    2021-08-06  8880  static int
0d08a441fb1a5c Kiran Patil    2021-08-06  8881  ice_setup_tc(struct net_device *netdev, enum tc_setup_type type,
0d08a441fb1a5c Kiran Patil    2021-08-06  8882  	     void *type_data)
0d08a441fb1a5c Kiran Patil    2021-08-06  8883  {
0d08a441fb1a5c Kiran Patil    2021-08-06  8884  	struct ice_netdev_priv *np = netdev_priv(netdev);
fbc7b27af0f9fb Kiran Patil    2021-10-15  8885  	struct ice_pf *pf = np->vsi->back;
fc5b3871fcffde Rafal Rogalski 2023-07-03  8886  	bool locked = false;
fbc7b27af0f9fb Kiran Patil    2021-10-15  8887  	int err;
0d08a441fb1a5c Kiran Patil    2021-08-06  8888  
0d08a441fb1a5c Kiran Patil    2021-08-06  8889  	switch (type) {
0d08a441fb1a5c Kiran Patil    2021-08-06  8890  	case TC_SETUP_BLOCK:
0d08a441fb1a5c Kiran Patil    2021-08-06  8891  		return flow_block_cb_setup_simple(type_data,
0d08a441fb1a5c Kiran Patil    2021-08-06  8892  						  &ice_block_cb_list,
0d08a441fb1a5c Kiran Patil    2021-08-06  8893  						  ice_setup_tc_block_cb,
0d08a441fb1a5c Kiran Patil    2021-08-06  8894  						  np, np, true);
fbc7b27af0f9fb Kiran Patil    2021-10-15  8895  	case TC_SETUP_QDISC_MQPRIO:
fc5b3871fcffde Rafal Rogalski 2023-07-03  8896  		if (pf->adev) {
fc5b3871fcffde Rafal Rogalski 2023-07-03 @8897  			mutex_lock(&pf->adev_mutex);
fc5b3871fcffde Rafal Rogalski 2023-07-03  8898  			device_lock(&pf->adev->dev);
fc5b3871fcffde Rafal Rogalski 2023-07-03  8899  			locked = true;
fc5b3871fcffde Rafal Rogalski 2023-07-03  8900  			if (pf->adev->dev.driver) {
fc5b3871fcffde Rafal Rogalski 2023-07-03  8901  				netdev_err(netdev, "Cannot change qdisc when RDMA is active\n");
fc5b3871fcffde Rafal Rogalski 2023-07-03  8902  				err = -EBUSY;
fc5b3871fcffde Rafal Rogalski 2023-07-03  8903  				goto adev_unlock;
fc5b3871fcffde Rafal Rogalski 2023-07-03  8904  			}
fc5b3871fcffde Rafal Rogalski 2023-07-03  8905  		}
fc5b3871fcffde Rafal Rogalski 2023-07-03  8906  
fbc7b27af0f9fb Kiran Patil    2021-10-15  8907  		/* setup traffic classifier for receive side */
fbc7b27af0f9fb Kiran Patil    2021-10-15  8908  		mutex_lock(&pf->tc_mutex);
fbc7b27af0f9fb Kiran Patil    2021-10-15  8909  		err = ice_setup_tc_mqprio_qdisc(netdev, type_data);
fbc7b27af0f9fb Kiran Patil    2021-10-15  8910  		mutex_unlock(&pf->tc_mutex);
fc5b3871fcffde Rafal Rogalski 2023-07-03  8911  
fc5b3871fcffde Rafal Rogalski 2023-07-03  8912  adev_unlock:
fc5b3871fcffde Rafal Rogalski 2023-07-03  8913  		if (locked) {
fc5b3871fcffde Rafal Rogalski 2023-07-03  8914  			device_unlock(&pf->adev->dev);
fc5b3871fcffde Rafal Rogalski 2023-07-03  8915  			mutex_unlock(&pf->adev_mutex);
fc5b3871fcffde Rafal Rogalski 2023-07-03  8916  		}
fbc7b27af0f9fb Kiran Patil    2021-10-15 @8917  		return err;
0d08a441fb1a5c Kiran Patil    2021-08-06  8918  	default:
0d08a441fb1a5c Kiran Patil    2021-08-06  8919  		return -EOPNOTSUPP;
0d08a441fb1a5c Kiran Patil    2021-08-06  8920  	}
0d08a441fb1a5c Kiran Patil    2021-08-06  8921  	return -EOPNOTSUPP;
0d08a441fb1a5c Kiran Patil    2021-08-06  8922  }
0d08a441fb1a5c Kiran Patil    2021-08-06  8923  

:::::: The code at line 8917 was first introduced by commit
:::::: fbc7b27af0f9fb181811424e29caf6825594a841 ice: enable ndo_setup_tc support for mqprio_qdisc

:::::: TO: Kiran Patil <kiran.patil@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
