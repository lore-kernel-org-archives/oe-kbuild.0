Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1AE10FA
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 02:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691116442; x=1722652442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9AGos7Q0P+vhrfB3pzTb6DFw+qKEH26C9ia3dOUiJwI=;
  b=SNSd4vCJf1424l+RLnWxbMVFH0/BCd8OBHd8CTxU923aLCPTVfgmWIu7
   YQa9Uh8k77IaGIZ4y+1aUvhdAaMtGB8d9xd/yNVJKmcl2tbMfRNKho+Uf
   a4EcF1kbgMQ9Flt2n+6nYmnmWDaNB+QnCZZg8sb6Ms4lVb230cLXUSmzt
   flvBRwxGCFf6QxJz31jUjY0o2IQSS8/fCvqlXZJwmsUZ0mhxM4I/AbJ8n
   TlDTG7EvzKNpOvnvijVLk0jBO87VZOoNL/1A0vqCfUdM1ZdrGZ7F8LH58
   3N9p9TYXwng04rMl/hc5Cz8GUSPksjDaYMmlmKKiv/nLzRHPb2QZZN5K3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="367509853"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="367509853"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 19:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="903692433"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="903692433"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Aug 2023 19:34:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRkdb-0002YB-1y;
	Fri, 04 Aug 2023 02:33:59 +0000
Date: Fri, 4 Aug 2023 10:33:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4511/6910]
 drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:264
 mlx5_devcom_send_event() warn: variable dereferenced before IS_ERR check
 'devcom' (see line 259)
Message-ID: <202308041028.AkXYDwJ6-lkp@intel.com>
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
TO: Roi Dayan <roid@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Eli Cohen <elic@nvidia.com>
CC: Shay Drory <shayd@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fb4327106e5250ee360d0d8b056c1eef7eeb9a98
commit: 88d162b479815f5d6b6a4ff5fdb07aec9dc6280c [4511/6910] net/mlx5: Devcom, Infrastructure changes
:::::: branch date: 22 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-m001-20230803 (https://download.01.org/0day-ci/archive/20230804/202308041028.AkXYDwJ6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041028.AkXYDwJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308041028.AkXYDwJ6-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:264 mlx5_devcom_send_event() warn: variable dereferenced before IS_ERR check 'devcom' (see line 259)

vim +/devcom +264 drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c

fadd59fc50d010 Aviv Heller 2018-12-04  254  
88d162b479815f Roi Dayan   2023-05-04  255  int mlx5_devcom_send_event(struct mlx5_devcom_comp_dev *devcom,
e2a82bf8a42816 Shay Drory  2023-02-06  256  			   int event, int rollback_event,
fadd59fc50d010 Aviv Heller 2018-12-04  257  			   void *event_data)
fadd59fc50d010 Aviv Heller 2018-12-04  258  {
88d162b479815f Roi Dayan   2023-05-04 @259  	struct mlx5_devcom_comp *comp = devcom->comp;
88d162b479815f Roi Dayan   2023-05-04  260  	struct mlx5_devcom_comp_dev *pos;
88d162b479815f Roi Dayan   2023-05-04  261  	int err = 0;
88d162b479815f Roi Dayan   2023-05-04  262  	void *data;
fadd59fc50d010 Aviv Heller 2018-12-04  263  
fadd59fc50d010 Aviv Heller 2018-12-04 @264  	if (IS_ERR_OR_NULL(devcom))
88d162b479815f Roi Dayan   2023-05-04  265  		return -ENODEV;
fadd59fc50d010 Aviv Heller 2018-12-04  266  
fadd59fc50d010 Aviv Heller 2018-12-04  267  	down_write(&comp->sem);
88d162b479815f Roi Dayan   2023-05-04  268  	list_for_each_entry(pos, &comp->comp_dev_list_head, list) {
88d162b479815f Roi Dayan   2023-05-04  269  		data = rcu_dereference_protected(pos->data, lockdep_is_held(&comp->sem));
691c041bf20899 Vlad Buslov 2023-03-31  270  
88d162b479815f Roi Dayan   2023-05-04  271  		if (pos != devcom && data) {
691c041bf20899 Vlad Buslov 2023-03-31  272  			err = comp->handler(event, data, event_data);
e2a82bf8a42816 Shay Drory  2023-02-06  273  			if (err)
e2a82bf8a42816 Shay Drory  2023-02-06  274  				goto rollback;
e2a82bf8a42816 Shay Drory  2023-02-06  275  		}
fadd59fc50d010 Aviv Heller 2018-12-04  276  	}
e2a82bf8a42816 Shay Drory  2023-02-06  277  
e2a82bf8a42816 Shay Drory  2023-02-06  278  	up_write(&comp->sem);
e2a82bf8a42816 Shay Drory  2023-02-06  279  	return 0;
e2a82bf8a42816 Shay Drory  2023-02-06  280  
e2a82bf8a42816 Shay Drory  2023-02-06  281  rollback:
88d162b479815f Roi Dayan   2023-05-04  282  	if (list_entry_is_head(pos, &comp->comp_dev_list_head, list))
88d162b479815f Roi Dayan   2023-05-04  283  		goto out;
88d162b479815f Roi Dayan   2023-05-04  284  	pos = list_prev_entry(pos, list);
88d162b479815f Roi Dayan   2023-05-04  285  	list_for_each_entry_from_reverse(pos, &comp->comp_dev_list_head, list) {
88d162b479815f Roi Dayan   2023-05-04  286  		data = rcu_dereference_protected(pos->data, lockdep_is_held(&comp->sem));
e2a82bf8a42816 Shay Drory  2023-02-06  287  
88d162b479815f Roi Dayan   2023-05-04  288  		if (pos != devcom && data)
e2a82bf8a42816 Shay Drory  2023-02-06  289  			comp->handler(rollback_event, data, event_data);
691c041bf20899 Vlad Buslov 2023-03-31  290  	}
88d162b479815f Roi Dayan   2023-05-04  291  out:
fadd59fc50d010 Aviv Heller 2018-12-04  292  	up_write(&comp->sem);
fadd59fc50d010 Aviv Heller 2018-12-04  293  	return err;
fadd59fc50d010 Aviv Heller 2018-12-04  294  }
fadd59fc50d010 Aviv Heller 2018-12-04  295  

:::::: The code at line 264 was first introduced by commit
:::::: fadd59fc50d010145f251db583c7ccef37393d19 net/mlx5: Introduce inter-device communication mechanism

:::::: TO: Aviv Heller <avivh@mellanox.com>
:::::: CC: Saeed Mahameed <saeedm@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
