Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B3663AC
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Feb 2023 16:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676131760; x=1707667760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZhcLiOj/XQXCDfYSKVOJqm45KpGYAGtSfDj+tWhtVuM=;
  b=AEfh5uBOsiIWGScYcvS0iPJSxLREkH2gJgWCdM9Z7chkPdyxuiJm5hY8
   Qb2EOL8YnN3RkBF/dg8QNwI51+0ExG6Pt+h/gYo9tuAKckzFvZfLuZ2Dk
   HjDHa3ztvrvrho4LusT/rkM/Z5OhZPUPv3yJVlUUinMgHWyTD8jHU41DY
   MhAuiHISmbQI9AJVxDaSO1B2SuTMjVi+7lWvG064TArdlSDKFURdqfElQ
   iIiwJc2QnEfgJYj2mPyRAna7ANg96ZpztvGd4TPfVKFYzyWPRQjoHDAjb
   dnNyNDMMWcQMNyQPNsROqd+U38rUBGCoA/TsXeofsQQ34RxYADHb1qZ/0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="318640228"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="318640228"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 08:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="811139722"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="811139722"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2023 08:09:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQsRB-0006eu-1c;
	Sat, 11 Feb 2023 16:09:17 +0000
Date: Sun, 12 Feb 2023 00:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/sfc/tc_bindings.c:90 efx_tc_setup_block() warn:
 passing a valid pointer to 'PTR_ERR'
Message-ID: <202302120014.68EpCbpL-lkp@intel.com>
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
TO: Edward Cree <ecree.xilinx@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   420b2d431d18a2572c8e86579e78105cb5ed45b0
commit: 9dc0cad203ab57efac34e6bcb67635edf3b62ebf sfc: bind blocks for TC offload on EF100
date:   5 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 months ago
config: parisc-randconfig-m031-20230209 (https://download.01.org/0day-ci/archive/20230212/202302120014.68EpCbpL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302120014.68EpCbpL-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/sfc/tc_bindings.c:90 efx_tc_setup_block() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +90 drivers/net/ethernet/sfc/tc_bindings.c

9dc0cad203ab57 Edward Cree 2022-09-26   72  
9dc0cad203ab57 Edward Cree 2022-09-26   73  int efx_tc_setup_block(struct net_device *net_dev, struct efx_nic *efx,
9dc0cad203ab57 Edward Cree 2022-09-26   74  		       struct flow_block_offload *tcb, struct efx_rep *efv)
9dc0cad203ab57 Edward Cree 2022-09-26   75  {
9dc0cad203ab57 Edward Cree 2022-09-26   76  	struct efx_tc_block_binding *binding;
9dc0cad203ab57 Edward Cree 2022-09-26   77  	struct flow_block_cb *block_cb;
9dc0cad203ab57 Edward Cree 2022-09-26   78  	int rc;
9dc0cad203ab57 Edward Cree 2022-09-26   79  
9dc0cad203ab57 Edward Cree 2022-09-26   80  	if (tcb->binder_type != FLOW_BLOCK_BINDER_TYPE_CLSACT_INGRESS)
9dc0cad203ab57 Edward Cree 2022-09-26   81  		return -EOPNOTSUPP;
9dc0cad203ab57 Edward Cree 2022-09-26   82  
9dc0cad203ab57 Edward Cree 2022-09-26   83  	if (WARN_ON(!efx->tc))
9dc0cad203ab57 Edward Cree 2022-09-26   84  		return -ENETDOWN;
9dc0cad203ab57 Edward Cree 2022-09-26   85  
9dc0cad203ab57 Edward Cree 2022-09-26   86  	switch (tcb->command) {
9dc0cad203ab57 Edward Cree 2022-09-26   87  	case FLOW_BLOCK_BIND:
9dc0cad203ab57 Edward Cree 2022-09-26   88  		binding = efx_tc_create_binding(efx, efv, net_dev, tcb->block);
9dc0cad203ab57 Edward Cree 2022-09-26   89  		if (IS_ERR(binding))
9dc0cad203ab57 Edward Cree 2022-09-26  @90  			return PTR_ERR(binding);
9dc0cad203ab57 Edward Cree 2022-09-26   91  		block_cb = flow_block_cb_alloc(efx_tc_block_cb, binding,
9dc0cad203ab57 Edward Cree 2022-09-26   92  					       binding, efx_tc_block_unbind);
9dc0cad203ab57 Edward Cree 2022-09-26   93  		rc = PTR_ERR_OR_ZERO(block_cb);
9dc0cad203ab57 Edward Cree 2022-09-26   94  		netif_dbg(efx, drv, efx->net_dev,
9dc0cad203ab57 Edward Cree 2022-09-26   95  			  "bind %sdirect block for device %s, rc %d\n",
9dc0cad203ab57 Edward Cree 2022-09-26   96  			  net_dev == efx->net_dev ? "" :
9dc0cad203ab57 Edward Cree 2022-09-26   97  			  efv ? "semi" : "in",
9dc0cad203ab57 Edward Cree 2022-09-26   98  			  net_dev ? net_dev->name : NULL, rc);
9dc0cad203ab57 Edward Cree 2022-09-26   99  		if (rc) {
9dc0cad203ab57 Edward Cree 2022-09-26  100  			list_del(&binding->list);
9dc0cad203ab57 Edward Cree 2022-09-26  101  			kfree(binding);
9dc0cad203ab57 Edward Cree 2022-09-26  102  		} else {
9dc0cad203ab57 Edward Cree 2022-09-26  103  			flow_block_cb_add(block_cb, tcb);
9dc0cad203ab57 Edward Cree 2022-09-26  104  		}
9dc0cad203ab57 Edward Cree 2022-09-26  105  		return rc;
9dc0cad203ab57 Edward Cree 2022-09-26  106  	case FLOW_BLOCK_UNBIND:
9dc0cad203ab57 Edward Cree 2022-09-26  107  		binding = efx_tc_find_binding(efx, net_dev);
9dc0cad203ab57 Edward Cree 2022-09-26  108  		if (binding) {
9dc0cad203ab57 Edward Cree 2022-09-26  109  			block_cb = flow_block_cb_lookup(tcb->block,
9dc0cad203ab57 Edward Cree 2022-09-26  110  							efx_tc_block_cb,
9dc0cad203ab57 Edward Cree 2022-09-26  111  							binding);
9dc0cad203ab57 Edward Cree 2022-09-26  112  			if (block_cb) {
9dc0cad203ab57 Edward Cree 2022-09-26  113  				flow_block_cb_remove(block_cb, tcb);
9dc0cad203ab57 Edward Cree 2022-09-26  114  				netif_dbg(efx, drv, efx->net_dev,
9dc0cad203ab57 Edward Cree 2022-09-26  115  					  "unbound %sdirect block for device %s\n",
9dc0cad203ab57 Edward Cree 2022-09-26  116  					  net_dev == efx->net_dev ? "" :
9dc0cad203ab57 Edward Cree 2022-09-26  117  					  binding->efv ? "semi" : "in",
9dc0cad203ab57 Edward Cree 2022-09-26  118  					  net_dev ? net_dev->name : NULL);
9dc0cad203ab57 Edward Cree 2022-09-26  119  				return 0;
9dc0cad203ab57 Edward Cree 2022-09-26  120  			}
9dc0cad203ab57 Edward Cree 2022-09-26  121  		}
9dc0cad203ab57 Edward Cree 2022-09-26  122  		/* If we're in driver teardown, then we expect to have
9dc0cad203ab57 Edward Cree 2022-09-26  123  		 * already unbound all our blocks (we did it early while
9dc0cad203ab57 Edward Cree 2022-09-26  124  		 * we still had MCDI to remove the filters), so getting
9dc0cad203ab57 Edward Cree 2022-09-26  125  		 * unbind callbacks now isn't a problem.
9dc0cad203ab57 Edward Cree 2022-09-26  126  		 */
9dc0cad203ab57 Edward Cree 2022-09-26  127  		netif_cond_dbg(efx, drv, efx->net_dev,
9dc0cad203ab57 Edward Cree 2022-09-26  128  			       !efx->tc->up, warn,
9dc0cad203ab57 Edward Cree 2022-09-26  129  			       "%sdirect block unbind for device %s, was never bound\n",
9dc0cad203ab57 Edward Cree 2022-09-26  130  			       net_dev == efx->net_dev ? "" : "in",
9dc0cad203ab57 Edward Cree 2022-09-26  131  			       net_dev ? net_dev->name : NULL);
9dc0cad203ab57 Edward Cree 2022-09-26  132  		return -ENOENT;
9dc0cad203ab57 Edward Cree 2022-09-26  133  	default:
9dc0cad203ab57 Edward Cree 2022-09-26  134  		return -EOPNOTSUPP;
9dc0cad203ab57 Edward Cree 2022-09-26  135  	}
9dc0cad203ab57 Edward Cree 2022-09-26  136  }
9dc0cad203ab57 Edward Cree 2022-09-26  137  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
