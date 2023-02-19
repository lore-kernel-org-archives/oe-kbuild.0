Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07850629
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 10:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676802997; x=1708338997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7GMSQBiDBIDtJlKmmdMp9ix8nJAGrDxuaJ6TFhToexg=;
  b=a8VCPW2ovasJFPVc4KFX/5d1IBm5ycGw7Jc94blA4zXkarX+gIS8qlAC
   3fi01SZYiAmGLiQMS/eTUGFldWJiGLfwU16Dvin7v1BIBe4ZWr6UsXIL5
   oWEjhIjhtxG4bvn3nRDN3qRIohgGhvmpsrVFKrItKp61/GsiQkH0NoUxK
   62ONeO0CGfcBfSkKrJq513PlStuy/9jQiomcfRN4ku8Rk3PbGzw/FmJJT
   YKzNvRABPpdTKQOUq4LzDNKIKvFyB9XlqFI4uZAtAQZALcYUZH42xUem+
   lWLZvZE02TzlXKoXC3Ng3WqV9pA+uBGHeB/TLuvE92xo5D8h4vCSpOvlV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="312606636"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="312606636"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 02:36:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="845034855"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="845034855"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Feb 2023 02:36:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTh3Z-000DFP-2h;
	Sun, 19 Feb 2023 10:36:33 +0000
Date: Sun, 19 Feb 2023 18:36:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c:409
 rvu_mbox_handler_mcs_alloc_resources() error: uninitialized symbol
 'rsrc_id'.
Message-ID: <202302191804.2XNyyLhY-lkp@intel.com>
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
TO: Geetha sowjanya <gakula@marvell.com>
CC: Vamsi Attunuru <vattunuru@marvell.com>
CC: Sunil Goutham <sgoutham@marvell.com>
CC: Subbaraya Sundeep <sbhatta@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: cfc14181d497cd7241d2aca7dcbca9039bf8d7dd octeontx2-af: cn10k: mcs: Manage the MCS block hardware resources
date:   5 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 months ago
config: s390-randconfig-m031-20230219 (https://download.01.org/0day-ci/archive/20230219/202302191804.2XNyyLhY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302191804.2XNyyLhY-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c:409 rvu_mbox_handler_mcs_alloc_resources() error: uninitialized symbol 'rsrc_id'.
drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c:452 rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule() error: uninitialized symbol 'offset'.

Old smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c:330 rvu_mbox_handler_mcs_free_resources() error: uninitialized symbol 'rc'.
drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c:523 rvu_mcs_set_lmac_bmap() error: uninitialized symbol 'lmac_bmap'.

vim +/rsrc_id +409 drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c

cfc14181d497cd Geetha sowjanya 2022-10-01  332  
cfc14181d497cd Geetha sowjanya 2022-10-01  333  int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
cfc14181d497cd Geetha sowjanya 2022-10-01  334  					 struct mcs_alloc_rsrc_req *req,
cfc14181d497cd Geetha sowjanya 2022-10-01  335  					 struct mcs_alloc_rsrc_rsp *rsp)
cfc14181d497cd Geetha sowjanya 2022-10-01  336  {
cfc14181d497cd Geetha sowjanya 2022-10-01  337  	u16 pcifunc = req->hdr.pcifunc;
cfc14181d497cd Geetha sowjanya 2022-10-01  338  	struct mcs_rsrc_map *map;
cfc14181d497cd Geetha sowjanya 2022-10-01  339  	struct mcs *mcs;
cfc14181d497cd Geetha sowjanya 2022-10-01  340  	int rsrc_id, i;
cfc14181d497cd Geetha sowjanya 2022-10-01  341  
cfc14181d497cd Geetha sowjanya 2022-10-01  342  	if (req->mcs_id >= rvu->mcs_blk_cnt)
cfc14181d497cd Geetha sowjanya 2022-10-01  343  		return MCS_AF_ERR_INVALID_MCSID;
cfc14181d497cd Geetha sowjanya 2022-10-01  344  
cfc14181d497cd Geetha sowjanya 2022-10-01  345  	mcs = mcs_get_pdata(req->mcs_id);
cfc14181d497cd Geetha sowjanya 2022-10-01  346  
cfc14181d497cd Geetha sowjanya 2022-10-01  347  	if (req->dir == MCS_RX)
cfc14181d497cd Geetha sowjanya 2022-10-01  348  		map = &mcs->rx;
cfc14181d497cd Geetha sowjanya 2022-10-01  349  	else
cfc14181d497cd Geetha sowjanya 2022-10-01  350  		map = &mcs->tx;
cfc14181d497cd Geetha sowjanya 2022-10-01  351  
cfc14181d497cd Geetha sowjanya 2022-10-01  352  	mutex_lock(&rvu->rsrc_lock);
cfc14181d497cd Geetha sowjanya 2022-10-01  353  
cfc14181d497cd Geetha sowjanya 2022-10-01  354  	if (req->all) {
cfc14181d497cd Geetha sowjanya 2022-10-01  355  		rsrc_id = mcs_alloc_all_rsrc(mcs, &rsp->flow_ids[0],
cfc14181d497cd Geetha sowjanya 2022-10-01  356  					     &rsp->secy_ids[0],
cfc14181d497cd Geetha sowjanya 2022-10-01  357  					     &rsp->sc_ids[0],
cfc14181d497cd Geetha sowjanya 2022-10-01  358  					     &rsp->sa_ids[0],
cfc14181d497cd Geetha sowjanya 2022-10-01  359  					     &rsp->sa_ids[1],
cfc14181d497cd Geetha sowjanya 2022-10-01  360  					     pcifunc, req->dir);
cfc14181d497cd Geetha sowjanya 2022-10-01  361  		goto exit;
cfc14181d497cd Geetha sowjanya 2022-10-01  362  	}
cfc14181d497cd Geetha sowjanya 2022-10-01  363  
cfc14181d497cd Geetha sowjanya 2022-10-01  364  	switch (req->rsrc_type) {
cfc14181d497cd Geetha sowjanya 2022-10-01  365  	case MCS_RSRC_TYPE_FLOWID:
cfc14181d497cd Geetha sowjanya 2022-10-01  366  		for (i = 0; i < req->rsrc_cnt; i++) {
cfc14181d497cd Geetha sowjanya 2022-10-01  367  			rsrc_id = mcs_alloc_rsrc(&map->flow_ids, map->flowid2pf_map, pcifunc);
cfc14181d497cd Geetha sowjanya 2022-10-01  368  			if (rsrc_id < 0)
cfc14181d497cd Geetha sowjanya 2022-10-01  369  				goto exit;
cfc14181d497cd Geetha sowjanya 2022-10-01  370  			rsp->flow_ids[i] = rsrc_id;
cfc14181d497cd Geetha sowjanya 2022-10-01  371  			rsp->rsrc_cnt++;
cfc14181d497cd Geetha sowjanya 2022-10-01  372  		}
cfc14181d497cd Geetha sowjanya 2022-10-01  373  		break;
cfc14181d497cd Geetha sowjanya 2022-10-01  374  	case MCS_RSRC_TYPE_SECY:
cfc14181d497cd Geetha sowjanya 2022-10-01  375  		for (i = 0; i < req->rsrc_cnt; i++) {
cfc14181d497cd Geetha sowjanya 2022-10-01  376  			rsrc_id = mcs_alloc_rsrc(&map->secy, map->secy2pf_map, pcifunc);
cfc14181d497cd Geetha sowjanya 2022-10-01  377  			if (rsrc_id < 0)
cfc14181d497cd Geetha sowjanya 2022-10-01  378  				goto exit;
cfc14181d497cd Geetha sowjanya 2022-10-01  379  			rsp->secy_ids[i] = rsrc_id;
cfc14181d497cd Geetha sowjanya 2022-10-01  380  			rsp->rsrc_cnt++;
cfc14181d497cd Geetha sowjanya 2022-10-01  381  		}
cfc14181d497cd Geetha sowjanya 2022-10-01  382  		break;
cfc14181d497cd Geetha sowjanya 2022-10-01  383  	case MCS_RSRC_TYPE_SC:
cfc14181d497cd Geetha sowjanya 2022-10-01  384  		for (i = 0; i < req->rsrc_cnt; i++) {
cfc14181d497cd Geetha sowjanya 2022-10-01  385  			rsrc_id = mcs_alloc_rsrc(&map->sc, map->sc2pf_map, pcifunc);
cfc14181d497cd Geetha sowjanya 2022-10-01  386  			if (rsrc_id < 0)
cfc14181d497cd Geetha sowjanya 2022-10-01  387  				goto exit;
cfc14181d497cd Geetha sowjanya 2022-10-01  388  			rsp->sc_ids[i] = rsrc_id;
cfc14181d497cd Geetha sowjanya 2022-10-01  389  			rsp->rsrc_cnt++;
cfc14181d497cd Geetha sowjanya 2022-10-01  390  		}
cfc14181d497cd Geetha sowjanya 2022-10-01  391  		break;
cfc14181d497cd Geetha sowjanya 2022-10-01  392  	case MCS_RSRC_TYPE_SA:
cfc14181d497cd Geetha sowjanya 2022-10-01  393  		for (i = 0; i < req->rsrc_cnt; i++) {
cfc14181d497cd Geetha sowjanya 2022-10-01  394  			rsrc_id = mcs_alloc_rsrc(&map->sa, map->sa2pf_map, pcifunc);
cfc14181d497cd Geetha sowjanya 2022-10-01  395  			if (rsrc_id < 0)
cfc14181d497cd Geetha sowjanya 2022-10-01  396  				goto exit;
cfc14181d497cd Geetha sowjanya 2022-10-01  397  			rsp->sa_ids[i] = rsrc_id;
cfc14181d497cd Geetha sowjanya 2022-10-01  398  			rsp->rsrc_cnt++;
cfc14181d497cd Geetha sowjanya 2022-10-01  399  		}
cfc14181d497cd Geetha sowjanya 2022-10-01  400  		break;
cfc14181d497cd Geetha sowjanya 2022-10-01  401  	}
cfc14181d497cd Geetha sowjanya 2022-10-01  402  
cfc14181d497cd Geetha sowjanya 2022-10-01  403  	rsp->rsrc_type = req->rsrc_type;
cfc14181d497cd Geetha sowjanya 2022-10-01  404  	rsp->dir = req->dir;
cfc14181d497cd Geetha sowjanya 2022-10-01  405  	rsp->mcs_id = req->mcs_id;
cfc14181d497cd Geetha sowjanya 2022-10-01  406  	rsp->all = req->all;
cfc14181d497cd Geetha sowjanya 2022-10-01  407  
cfc14181d497cd Geetha sowjanya 2022-10-01  408  exit:
cfc14181d497cd Geetha sowjanya 2022-10-01 @409  	if (rsrc_id < 0)
cfc14181d497cd Geetha sowjanya 2022-10-01  410  		dev_err(rvu->dev, "Failed to allocate the mcs resources for PCIFUNC:%d\n", pcifunc);
cfc14181d497cd Geetha sowjanya 2022-10-01  411  	mutex_unlock(&rvu->rsrc_lock);
cfc14181d497cd Geetha sowjanya 2022-10-01  412  	return 0;
cfc14181d497cd Geetha sowjanya 2022-10-01  413  }
cfc14181d497cd Geetha sowjanya 2022-10-01  414  
cfc14181d497cd Geetha sowjanya 2022-10-01  415  int rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule(struct rvu *rvu,
cfc14181d497cd Geetha sowjanya 2022-10-01  416  					     struct mcs_alloc_ctrl_pkt_rule_req *req,
cfc14181d497cd Geetha sowjanya 2022-10-01  417  					     struct mcs_alloc_ctrl_pkt_rule_rsp *rsp)
cfc14181d497cd Geetha sowjanya 2022-10-01  418  {
cfc14181d497cd Geetha sowjanya 2022-10-01  419  	u16 pcifunc = req->hdr.pcifunc;
cfc14181d497cd Geetha sowjanya 2022-10-01  420  	struct mcs_rsrc_map *map;
cfc14181d497cd Geetha sowjanya 2022-10-01  421  	struct mcs *mcs;
cfc14181d497cd Geetha sowjanya 2022-10-01  422  	int rsrc_id;
cfc14181d497cd Geetha sowjanya 2022-10-01  423  	u16 offset;
cfc14181d497cd Geetha sowjanya 2022-10-01  424  
cfc14181d497cd Geetha sowjanya 2022-10-01  425  	if (req->mcs_id >= rvu->mcs_blk_cnt)
cfc14181d497cd Geetha sowjanya 2022-10-01  426  		return MCS_AF_ERR_INVALID_MCSID;
cfc14181d497cd Geetha sowjanya 2022-10-01  427  
cfc14181d497cd Geetha sowjanya 2022-10-01  428  	mcs = mcs_get_pdata(req->mcs_id);
cfc14181d497cd Geetha sowjanya 2022-10-01  429  
cfc14181d497cd Geetha sowjanya 2022-10-01  430  	map = (req->dir == MCS_RX) ? &mcs->rx : &mcs->tx;
cfc14181d497cd Geetha sowjanya 2022-10-01  431  
cfc14181d497cd Geetha sowjanya 2022-10-01  432  	mutex_lock(&rvu->rsrc_lock);
cfc14181d497cd Geetha sowjanya 2022-10-01  433  
cfc14181d497cd Geetha sowjanya 2022-10-01  434  	switch (req->rule_type) {
cfc14181d497cd Geetha sowjanya 2022-10-01  435  	case MCS_CTRL_PKT_RULE_TYPE_ETH:
cfc14181d497cd Geetha sowjanya 2022-10-01  436  		offset = MCS_CTRLPKT_ETYPE_RULE_OFFSET;
cfc14181d497cd Geetha sowjanya 2022-10-01  437  		break;
cfc14181d497cd Geetha sowjanya 2022-10-01  438  	case MCS_CTRL_PKT_RULE_TYPE_DA:
cfc14181d497cd Geetha sowjanya 2022-10-01  439  		offset = MCS_CTRLPKT_DA_RULE_OFFSET;
cfc14181d497cd Geetha sowjanya 2022-10-01  440  		break;
cfc14181d497cd Geetha sowjanya 2022-10-01  441  	case MCS_CTRL_PKT_RULE_TYPE_RANGE:
cfc14181d497cd Geetha sowjanya 2022-10-01  442  		offset = MCS_CTRLPKT_DA_RANGE_RULE_OFFSET;
cfc14181d497cd Geetha sowjanya 2022-10-01  443  		break;
cfc14181d497cd Geetha sowjanya 2022-10-01  444  	case MCS_CTRL_PKT_RULE_TYPE_COMBO:
cfc14181d497cd Geetha sowjanya 2022-10-01  445  		offset = MCS_CTRLPKT_COMBO_RULE_OFFSET;
cfc14181d497cd Geetha sowjanya 2022-10-01  446  		break;
cfc14181d497cd Geetha sowjanya 2022-10-01  447  	case MCS_CTRL_PKT_RULE_TYPE_MAC:
cfc14181d497cd Geetha sowjanya 2022-10-01  448  		offset = MCS_CTRLPKT_MAC_EN_RULE_OFFSET;
cfc14181d497cd Geetha sowjanya 2022-10-01  449  		break;
cfc14181d497cd Geetha sowjanya 2022-10-01  450  	}
cfc14181d497cd Geetha sowjanya 2022-10-01  451  
cfc14181d497cd Geetha sowjanya 2022-10-01 @452  	rsrc_id = mcs_alloc_ctrlpktrule(&map->ctrlpktrule, map->ctrlpktrule2pf_map, offset,
cfc14181d497cd Geetha sowjanya 2022-10-01  453  					pcifunc);
cfc14181d497cd Geetha sowjanya 2022-10-01  454  	if (rsrc_id < 0)
cfc14181d497cd Geetha sowjanya 2022-10-01  455  		goto exit;
cfc14181d497cd Geetha sowjanya 2022-10-01  456  
cfc14181d497cd Geetha sowjanya 2022-10-01  457  	rsp->rule_idx = rsrc_id;
cfc14181d497cd Geetha sowjanya 2022-10-01  458  	rsp->rule_type = req->rule_type;
cfc14181d497cd Geetha sowjanya 2022-10-01  459  	rsp->dir = req->dir;
cfc14181d497cd Geetha sowjanya 2022-10-01  460  	rsp->mcs_id = req->mcs_id;
cfc14181d497cd Geetha sowjanya 2022-10-01  461  
cfc14181d497cd Geetha sowjanya 2022-10-01  462  	mutex_unlock(&rvu->rsrc_lock);
cfc14181d497cd Geetha sowjanya 2022-10-01  463  	return 0;
cfc14181d497cd Geetha sowjanya 2022-10-01  464  exit:
cfc14181d497cd Geetha sowjanya 2022-10-01  465  	if (rsrc_id < 0)
cfc14181d497cd Geetha sowjanya 2022-10-01  466  		dev_err(rvu->dev, "Failed to allocate the mcs ctrl pkt rule for PCIFUNC:%d\n",
cfc14181d497cd Geetha sowjanya 2022-10-01  467  			pcifunc);
cfc14181d497cd Geetha sowjanya 2022-10-01  468  	mutex_unlock(&rvu->rsrc_lock);
cfc14181d497cd Geetha sowjanya 2022-10-01  469  	return rsrc_id;
cfc14181d497cd Geetha sowjanya 2022-10-01  470  }
cfc14181d497cd Geetha sowjanya 2022-10-01  471  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
