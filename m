Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF598483
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Feb 2023 20:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676145747; x=1707681747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b2EMaJxvELA/9hDE6rq++IvTw8K1+o/HBYUIWco2vNg=;
  b=IW+68s74amhvcnvrzTwQF0QeLSIDeNQUP5+7QJZft+VlTaP/cWiWubGq
   EB6CQFjbVdEZesXL6pd2PFWlfs19l85N86ub54LjCtl349BPyJZ66TAVR
   rrHHBt5A5zuKovGA6MJTDuvORrRdTIeL1N8pFquj2NTKKtlA4PVyPtB5x
   AqsYymQ7Ls8SdOQkXx+uy6a8kCesmtmGDHmrFBXTMooyn23GwZkvDNFOp
   MYUAKVHvoEw7D+s9/SyYQ3d7sIjfjlIfy6McDAVe1J/6ojab02tMa+l9T
   bpGhKDw/VAODrHkRiispHJ+sGUjthSdjJpdEc51k9Ya31KKI0CpGPyxX4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="310280088"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="310280088"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 12:02:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="811173619"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="811173619"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2023 12:02:23 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQw4k-0006lf-2X;
	Sat, 11 Feb 2023 20:02:22 +0000
Date: Sun, 12 Feb 2023 04:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/sfc/tc_bindings.c:171 efx_tc_indr_setup_cb()
 warn: passing a valid pointer to 'PTR_ERR'
Message-ID: <202302120301.1ZRklsQH-lkp@intel.com>
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
commit: 5b2e12d51bd8efaf0be8309d5b2c716ad848cb37 sfc: bind indirect blocks for TC offload on EF100
date:   5 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 months ago
config: parisc-randconfig-m031-20230209 (https://download.01.org/0day-ci/archive/20230212/202302120301.1ZRklsQH-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302120301.1ZRklsQH-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/sfc/tc_bindings.c:171 efx_tc_indr_setup_cb() warn: passing a valid pointer to 'PTR_ERR'

Old smatch warnings:
drivers/net/ethernet/sfc/tc_bindings.c:90 efx_tc_setup_block() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +171 drivers/net/ethernet/sfc/tc_bindings.c

9dc0cad203ab57 Edward Cree 2022-09-26  137  
5b2e12d51bd8ef Edward Cree 2022-09-26  138  int efx_tc_indr_setup_cb(struct net_device *net_dev, struct Qdisc *sch,
5b2e12d51bd8ef Edward Cree 2022-09-26  139  			 void *cb_priv, enum tc_setup_type type,
5b2e12d51bd8ef Edward Cree 2022-09-26  140  			 void *type_data, void *data,
5b2e12d51bd8ef Edward Cree 2022-09-26  141  			 void (*cleanup)(struct flow_block_cb *block_cb))
5b2e12d51bd8ef Edward Cree 2022-09-26  142  {
5b2e12d51bd8ef Edward Cree 2022-09-26  143  	struct flow_block_offload *tcb = type_data;
5b2e12d51bd8ef Edward Cree 2022-09-26  144  	struct efx_tc_block_binding *binding;
5b2e12d51bd8ef Edward Cree 2022-09-26  145  	struct flow_block_cb *block_cb;
5b2e12d51bd8ef Edward Cree 2022-09-26  146  	struct efx_nic *efx = cb_priv;
5b2e12d51bd8ef Edward Cree 2022-09-26  147  	bool is_ovs_int_port;
5b2e12d51bd8ef Edward Cree 2022-09-26  148  	int rc;
5b2e12d51bd8ef Edward Cree 2022-09-26  149  
5b2e12d51bd8ef Edward Cree 2022-09-26  150  	if (!net_dev)
5b2e12d51bd8ef Edward Cree 2022-09-26  151  		return -EOPNOTSUPP;
5b2e12d51bd8ef Edward Cree 2022-09-26  152  
5b2e12d51bd8ef Edward Cree 2022-09-26  153  	if (tcb->binder_type != FLOW_BLOCK_BINDER_TYPE_CLSACT_INGRESS &&
5b2e12d51bd8ef Edward Cree 2022-09-26  154  	    tcb->binder_type != FLOW_BLOCK_BINDER_TYPE_CLSACT_EGRESS)
5b2e12d51bd8ef Edward Cree 2022-09-26  155  		return -EOPNOTSUPP;
5b2e12d51bd8ef Edward Cree 2022-09-26  156  
5b2e12d51bd8ef Edward Cree 2022-09-26  157  	is_ovs_int_port = netif_is_ovs_master(net_dev);
5b2e12d51bd8ef Edward Cree 2022-09-26  158  	if (tcb->binder_type == FLOW_BLOCK_BINDER_TYPE_CLSACT_EGRESS &&
5b2e12d51bd8ef Edward Cree 2022-09-26  159  	    !is_ovs_int_port)
5b2e12d51bd8ef Edward Cree 2022-09-26  160  		return -EOPNOTSUPP;
5b2e12d51bd8ef Edward Cree 2022-09-26  161  
5b2e12d51bd8ef Edward Cree 2022-09-26  162  	if (is_ovs_int_port)
5b2e12d51bd8ef Edward Cree 2022-09-26  163  		return -EOPNOTSUPP;
5b2e12d51bd8ef Edward Cree 2022-09-26  164  
5b2e12d51bd8ef Edward Cree 2022-09-26  165  	switch (type) {
5b2e12d51bd8ef Edward Cree 2022-09-26  166  	case TC_SETUP_BLOCK:
5b2e12d51bd8ef Edward Cree 2022-09-26  167  		switch (tcb->command) {
5b2e12d51bd8ef Edward Cree 2022-09-26  168  		case FLOW_BLOCK_BIND:
5b2e12d51bd8ef Edward Cree 2022-09-26  169  			binding = efx_tc_create_binding(efx, NULL, net_dev, tcb->block);
5b2e12d51bd8ef Edward Cree 2022-09-26  170  			if (IS_ERR(binding))
5b2e12d51bd8ef Edward Cree 2022-09-26 @171  				return PTR_ERR(binding);
5b2e12d51bd8ef Edward Cree 2022-09-26  172  			block_cb = flow_indr_block_cb_alloc(efx_tc_block_cb, binding,
5b2e12d51bd8ef Edward Cree 2022-09-26  173  							    binding, efx_tc_block_unbind,
5b2e12d51bd8ef Edward Cree 2022-09-26  174  							    tcb, net_dev, sch, data, binding,
5b2e12d51bd8ef Edward Cree 2022-09-26  175  							    cleanup);
5b2e12d51bd8ef Edward Cree 2022-09-26  176  			rc = PTR_ERR_OR_ZERO(block_cb);
5b2e12d51bd8ef Edward Cree 2022-09-26  177  			netif_dbg(efx, drv, efx->net_dev,
5b2e12d51bd8ef Edward Cree 2022-09-26  178  				  "bind indr block for device %s, rc %d\n",
5b2e12d51bd8ef Edward Cree 2022-09-26  179  				  net_dev ? net_dev->name : NULL, rc);
5b2e12d51bd8ef Edward Cree 2022-09-26  180  			if (rc) {
5b2e12d51bd8ef Edward Cree 2022-09-26  181  				list_del(&binding->list);
5b2e12d51bd8ef Edward Cree 2022-09-26  182  				kfree(binding);
5b2e12d51bd8ef Edward Cree 2022-09-26  183  			} else {
5b2e12d51bd8ef Edward Cree 2022-09-26  184  				flow_block_cb_add(block_cb, tcb);
5b2e12d51bd8ef Edward Cree 2022-09-26  185  			}
5b2e12d51bd8ef Edward Cree 2022-09-26  186  			return rc;
5b2e12d51bd8ef Edward Cree 2022-09-26  187  		case FLOW_BLOCK_UNBIND:
5b2e12d51bd8ef Edward Cree 2022-09-26  188  			binding = efx_tc_find_binding(efx, net_dev);
5b2e12d51bd8ef Edward Cree 2022-09-26  189  			if (!binding)
5b2e12d51bd8ef Edward Cree 2022-09-26  190  				return -ENOENT;
5b2e12d51bd8ef Edward Cree 2022-09-26  191  			block_cb = flow_block_cb_lookup(tcb->block,
5b2e12d51bd8ef Edward Cree 2022-09-26  192  							efx_tc_block_cb,
5b2e12d51bd8ef Edward Cree 2022-09-26  193  							binding);
5b2e12d51bd8ef Edward Cree 2022-09-26  194  			if (!block_cb)
5b2e12d51bd8ef Edward Cree 2022-09-26  195  				return -ENOENT;
5b2e12d51bd8ef Edward Cree 2022-09-26  196  			flow_indr_block_cb_remove(block_cb, tcb);
5b2e12d51bd8ef Edward Cree 2022-09-26  197  			netif_dbg(efx, drv, efx->net_dev,
5b2e12d51bd8ef Edward Cree 2022-09-26  198  				  "unbind indr block for device %s\n",
5b2e12d51bd8ef Edward Cree 2022-09-26  199  				  net_dev ? net_dev->name : NULL);
5b2e12d51bd8ef Edward Cree 2022-09-26  200  			return 0;
5b2e12d51bd8ef Edward Cree 2022-09-26  201  		default:
5b2e12d51bd8ef Edward Cree 2022-09-26  202  			return -EOPNOTSUPP;
5b2e12d51bd8ef Edward Cree 2022-09-26  203  		}
5b2e12d51bd8ef Edward Cree 2022-09-26  204  	default:
5b2e12d51bd8ef Edward Cree 2022-09-26  205  		return -EOPNOTSUPP;
5b2e12d51bd8ef Edward Cree 2022-09-26  206  	}
5b2e12d51bd8ef Edward Cree 2022-09-26  207  }
5b2e12d51bd8ef Edward Cree 2022-09-26  208  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
