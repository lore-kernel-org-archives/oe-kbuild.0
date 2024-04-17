Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7522C84FDF
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Apr 2024 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713364735; cv=none; b=PTYT5xnPGxPqQt56jPBsFqkYzd8Q2WPnM5AawcyPilS1eno5p8qRxwcc9+xSjG/UKJzAqdqxmLHGDCSJ4fIUtvN9Fl4mtEu+cEKc5/sXEaAa/fxondNurO8FXmt/CcyqbA6wQBbYKzoVZDy49pWvDLMb/BjX+yICEXnZfRddpCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713364735; c=relaxed/simple;
	bh=3j3rxE79cIJJTJQi+6I73e0+NUEz4tqxLRSAvan70Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W5Aue+gxZEmMB+ujuem0VrdslAGjSnS4Ha+IQo0rk5QMjPILGIb0UfgY/lvwAhc45TI5+0uJ7sIHFKMxRK5+BoIO3wtxFi1pZNTesvXcxoPl8EMr3PLrDVm97lb/XFTc/lldSoVL1opd9uCaMymQ5F6DnFmeSYoL8bNZRjMCqg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JAaH7DzU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JAaH7DzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713364734; x=1744900734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3j3rxE79cIJJTJQi+6I73e0+NUEz4tqxLRSAvan70Wc=;
  b=JAaH7DzUnWmjnzcvRQrvV+asB1+cWIm45bLO6rwpCsAA+BPUiOy1PZXP
   4luou+mxSsTDN470i2e2sBMftn0aIfx1ZE3pz/dFbRrgSvf12QRomjoSe
   U1EW9OIMtAXi1nsRWLP6+JcEq8dhnpiuc4Yq3j034rWGmFH1KhE6NMXoQ
   hpcT7Rj5LnczVqzyHD5MOej9A7Eok2i9Q61ObYCZIHpn0LuLFnU9Yl6+y
   kaLdBwy6qG3lL0R6ssY9zMRUK0srblkeeGFDIYXV3+RTZYNGBF9rrsz5o
   mW9au7oACPNQsah+24waa7wCU22xIBzc6uPCxwpwbHdsAJCdrlRTDGtxo
   Q==;
X-CSE-ConnectionGUID: 895lGLx3StWjB1g5x2/urA==
X-CSE-MsgGUID: 8oTjcs6VSGOd15oyFvjN1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="11801075"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="11801075"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 07:38:40 -0700
X-CSE-ConnectionGUID: 2y2hy8//Qgm7FXMDpokKLg==
X-CSE-MsgGUID: 7v3YPQbvSTCmCUOsXK7yXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="53594993"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Apr 2024 07:38:39 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx6Qm-0006gY-1Z;
	Wed, 17 Apr 2024 14:38:36 +0000
Date: Wed, 17 Apr 2024 22:37:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [net-next PATCH 3/9] octeontx2-pf: Create representor netdev
Message-ID: <202404172208.4REfSKKS-lkp@intel.com>
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
In-Reply-To: <20240416050616.6056-4-gakula@marvell.com>
References: <20240416050616.6056-4-gakula@marvell.com>
TO: Geetha sowjanya <gakula@marvell.com>
TO: netdev@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: kuba@kernel.org
CC: davem@davemloft.net
CC: pabeni@redhat.com
CC: edumazet@google.com
CC: sgoutham@marvell.com
CC: gakula@marvell.com
CC: sbhatta@marvell.com
CC: hkelam@marvell.com

Hi Geetha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Geetha-sowjanya/octeontx2-pf-Refactoring-RVU-driver/20240416-131052
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240416050616.6056-4-gakula%40marvell.com
patch subject: [net-next PATCH 3/9] octeontx2-pf: Create representor netdev
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: alpha-randconfig-r081-20240417 (https://download.01.org/0day-ci/archive/20240417/202404172208.4REfSKKS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404172208.4REfSKKS-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/marvell/octeontx2/nic/rep.c:170 rvu_rep_create() error: dereferencing freed memory 'ndev'
drivers/net/ethernet/marvell/octeontx2/nic/rep.c:181 rvu_rep_create() warn: 'ndev' from alloc_etherdev_mqs() not released on lines: 181.
drivers/net/ethernet/marvell/octeontx2/nic/rep.c:181 rvu_rep_create() warn: 'ndev' from register_netdev() not released on lines: 181.

Old smatch warnings:
drivers/net/ethernet/marvell/octeontx2/nic/rep.c:181 rvu_rep_create() error: uninitialized symbol 'err'.
drivers/net/ethernet/marvell/octeontx2/nic/rep.c:248 rvu_get_rep_cnt() error: uninitialized symbol 'rsp'.
drivers/net/ethernet/marvell/octeontx2/nic/rep.c:248 rvu_get_rep_cnt() warn: passing zero to 'PTR_ERR'
drivers/net/ethernet/marvell/octeontx2/nic/rep.c:293 rvu_rep_probe() warn: missing unwind goto?

vim +/ndev +170 drivers/net/ethernet/marvell/octeontx2/nic/rep.c

f9a5b510759eeb Geetha sowjanya 2024-04-16  131  
f9a5b510759eeb Geetha sowjanya 2024-04-16  132  int rvu_rep_create(struct otx2_nic *priv)
f9a5b510759eeb Geetha sowjanya 2024-04-16  133  {
f9a5b510759eeb Geetha sowjanya 2024-04-16  134  	int rep_cnt = priv->rep_cnt;
f9a5b510759eeb Geetha sowjanya 2024-04-16  135  	struct net_device *ndev;
f9a5b510759eeb Geetha sowjanya 2024-04-16  136  	struct rep_dev *rep;
f9a5b510759eeb Geetha sowjanya 2024-04-16  137  	int rep_id, err;
f9a5b510759eeb Geetha sowjanya 2024-04-16  138  	u16 pcifunc;
f9a5b510759eeb Geetha sowjanya 2024-04-16  139  
f9a5b510759eeb Geetha sowjanya 2024-04-16  140  	priv->reps = devm_kcalloc(priv->dev, rep_cnt, sizeof(struct rep_dev), GFP_KERNEL);
f9a5b510759eeb Geetha sowjanya 2024-04-16  141  	if (!priv->reps)
f9a5b510759eeb Geetha sowjanya 2024-04-16  142  		return -ENOMEM;
f9a5b510759eeb Geetha sowjanya 2024-04-16  143  
f9a5b510759eeb Geetha sowjanya 2024-04-16  144  	for (rep_id = 0; rep_id < rep_cnt; rep_id++) {
f9a5b510759eeb Geetha sowjanya 2024-04-16  145  		ndev = alloc_etherdev(sizeof(*rep));
f9a5b510759eeb Geetha sowjanya 2024-04-16  146  		if (!ndev) {
f9a5b510759eeb Geetha sowjanya 2024-04-16  147  			dev_err(priv->dev, "PFVF representor:%d creation failed\n", rep_id);
f9a5b510759eeb Geetha sowjanya 2024-04-16  148  			err = -ENOMEM;
f9a5b510759eeb Geetha sowjanya 2024-04-16  149  			goto exit;
f9a5b510759eeb Geetha sowjanya 2024-04-16  150  		}
f9a5b510759eeb Geetha sowjanya 2024-04-16  151  
f9a5b510759eeb Geetha sowjanya 2024-04-16  152  		rep = netdev_priv(ndev);
f9a5b510759eeb Geetha sowjanya 2024-04-16  153  		priv->reps[rep_id] = rep;
f9a5b510759eeb Geetha sowjanya 2024-04-16  154  		rep->mdev = priv;
f9a5b510759eeb Geetha sowjanya 2024-04-16  155  		rep->netdev = ndev;
f9a5b510759eeb Geetha sowjanya 2024-04-16  156  		rep->rep_id = rep_id;
f9a5b510759eeb Geetha sowjanya 2024-04-16  157  
f9a5b510759eeb Geetha sowjanya 2024-04-16  158  		ndev->min_mtu = OTX2_MIN_MTU;
f9a5b510759eeb Geetha sowjanya 2024-04-16  159  		ndev->max_mtu = priv->hw.max_mtu;
f9a5b510759eeb Geetha sowjanya 2024-04-16  160  		pcifunc = priv->rep_pf_map[rep_id];
f9a5b510759eeb Geetha sowjanya 2024-04-16  161  		rep->pcifunc = pcifunc;
f9a5b510759eeb Geetha sowjanya 2024-04-16  162  
f9a5b510759eeb Geetha sowjanya 2024-04-16  163  		snprintf(ndev->name, sizeof(ndev->name), "r%dp%dv%d", rep_id,
f9a5b510759eeb Geetha sowjanya 2024-04-16  164  			 rvu_get_pf(pcifunc), (pcifunc & RVU_PFVF_FUNC_MASK));
f9a5b510759eeb Geetha sowjanya 2024-04-16  165  
f9a5b510759eeb Geetha sowjanya 2024-04-16  166  		eth_hw_addr_random(ndev);
f9a5b510759eeb Geetha sowjanya 2024-04-16  167  		if (register_netdev(ndev)) {
f9a5b510759eeb Geetha sowjanya 2024-04-16  168  			dev_err(priv->dev, "PFVF reprentator registration failed\n");
f9a5b510759eeb Geetha sowjanya 2024-04-16  169  			free_netdev(ndev);
f9a5b510759eeb Geetha sowjanya 2024-04-16 @170  			ndev->netdev_ops = NULL;
f9a5b510759eeb Geetha sowjanya 2024-04-16  171  			goto exit;
f9a5b510759eeb Geetha sowjanya 2024-04-16  172  		}
f9a5b510759eeb Geetha sowjanya 2024-04-16  173  	}
f9a5b510759eeb Geetha sowjanya 2024-04-16  174  	err = rvu_rep_napi_init(priv);
f9a5b510759eeb Geetha sowjanya 2024-04-16  175  	if (err)
f9a5b510759eeb Geetha sowjanya 2024-04-16  176  		goto exit;
f9a5b510759eeb Geetha sowjanya 2024-04-16  177  
f9a5b510759eeb Geetha sowjanya 2024-04-16  178  	return 0;
f9a5b510759eeb Geetha sowjanya 2024-04-16  179  exit:
f9a5b510759eeb Geetha sowjanya 2024-04-16  180  	rvu_rep_free_netdev(priv);
f9a5b510759eeb Geetha sowjanya 2024-04-16 @181  	return err;
f9a5b510759eeb Geetha sowjanya 2024-04-16  182  }
f9a5b510759eeb Geetha sowjanya 2024-04-16  183  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
