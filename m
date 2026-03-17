Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8FA34252B
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Mar 2026 22:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773785272; cv=none; b=m/AYMjm6rZxEGh+6DzBJUzsOXFoV9CKoGAplaWyjAGItkPFkntmFR0ZGPWYQwbqSliBrENo0C+6VJA6BSToaFcuTBHn86qosY8hsmmdEdjU4/K2y9hTAepFaTd9Z8udiCx3aEanwDZp/MRg/aH2EuBLGT/lO8WLycuoqVU4Cwr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773785272; c=relaxed/simple;
	bh=1M6BgivtateIYnUkAAjIvbUZkwM2JsFnxVPYifBvvp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bEVHCUl0Lbv2CUpUUW32RrOReXF7bB9xhoBcTkpmF+WHNN5kRXSiiguTbw+BntXYVagE2/7WgAGpZ5fsc5vNdjgItH7dk8lvYuoDw01L60OTKJPg+J97l7BiQ+CtJJcRXpnDTLo4nLD1p9amB45ATOzRbyMGU5DDpx5DQ7t+vGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9l00SLW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9l00SLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773785271; x=1805321271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1M6BgivtateIYnUkAAjIvbUZkwM2JsFnxVPYifBvvp4=;
  b=C9l00SLWcWFGIz4FmQw34q5jrZC3vhqJss8yVZ/CJFid2C+RYMtLB8bj
   r+YbDpLLiXLkTtPfUnersbbZZrElUkFcZcjHMMfSSYt38eORC+KitOmjY
   06rmDDD43owH6JgzcLsnU8Jz333xZ09oHKy9ChrYKmPv7yUky7iYzOMjF
   gtBzuxbVBn6j1iKp6cHFdjOgot73aeu69Nrdiuku4ymBuIery9pLf2zPx
   0+6YW1/v4bw06je/ReAvduCyqjA/MLDznLIGLVfXcDNRPpt/bsl/NzMK5
   K6vQOpLLztbZWS8M4ZkZm4Qw1WQk+FCcyTvebj9+kkHed0puRpU/ECdPu
   g==;
X-CSE-ConnectionGUID: /rkHbQFTSuqvcCdUa068tw==
X-CSE-MsgGUID: o+1CNmjJQyil+aAs3vF8bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78439818"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="78439818"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 15:07:51 -0700
X-CSE-ConnectionGUID: 45dNK+aCQzeg5XNYtphxFw==
X-CSE-MsgGUID: dImnYFweSF6dvcEbV62xvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226552703"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Mar 2026 15:07:49 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2cZl-0000000025d-1r12;
	Tue, 17 Mar 2026 22:07:45 +0000
Date: Wed, 18 Mar 2026 06:06:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v6 06/10] bng_en: add HW stats infra and
 structured ethtool ops
Message-ID: <202603180509.nOQGZrG0-lkp@intel.com>
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
In-Reply-To: <20260310144044.21672-7-bhargava.marreddy@broadcom.com>
References: <20260310144044.21672-7-bhargava.marreddy@broadcom.com>
TO: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: andrew+netdev@lunn.ch
TO: horms@kernel.org
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: michael.chan@broadcom.com
CC: pavan.chebbi@broadcom.com
CC: vsrama-krishna.nemani@broadcom.com
CC: vikas.gupta@broadcom.com
CC: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
CC: Rahul Gupta <rahul-rg.gupta@broadcom.com>
CC: Ajit Kumar Khaparde <ajit.khaparde@broadcom.com>

Hi Bhargava,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Bhargava-Marreddy/bng_en-add-per-PF-workqueue-timer-and-slow-path-task/20260310-231948
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260310144044.21672-7-bhargava.marreddy%40broadcom.com
patch subject: [PATCH net-next v6 06/10] bng_en: add HW stats infra and structured ethtool ops
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-r071-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180509.nOQGZrG0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603180509.nOQGZrG0-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c:1598 bnge_hwrm_port_qstats_ext() warn: missing error code? 'rc'

vim +/rc +1598 drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c

598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1522  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1523  int bnge_hwrm_port_qstats_ext(struct bnge_dev *bd, u8 flags)
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1524  {
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1525  	struct hwrm_queue_pri2cos_qcfg_output *resp_qc;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1526  	struct bnge_net *bn = netdev_priv(bd->netdev);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1527  	struct hwrm_queue_pri2cos_qcfg_input *req_qc;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1528  	struct hwrm_port_qstats_ext_output *resp_qs;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1529  	struct hwrm_port_qstats_ext_input *req_qs;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1530  	struct bnge_pf_info *pf = &bd->pf;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1531  	u32 tx_stat_size;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1532  	int rc;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1533  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1534  	if (!(bn->flags & BNGE_FLAG_PORT_STATS_EXT))
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1535  		return 0;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1536  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1537  	if (flags && !(bd->fw_cap & BNGE_FW_CAP_EXT_HW_STATS_SUPPORTED))
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1538  		return -EOPNOTSUPP;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1539  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1540  	rc = bnge_hwrm_req_init(bd, req_qs, HWRM_PORT_QSTATS_EXT);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1541  	if (rc)
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1542  		return rc;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1543  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1544  	req_qs->flags = flags;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1545  	req_qs->port_id = cpu_to_le16(pf->port_id);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1546  	req_qs->rx_stat_size = cpu_to_le16(sizeof(struct rx_port_stats_ext));
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1547  	req_qs->rx_stat_host_addr =
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1548  		cpu_to_le64(bn->rx_port_stats_ext.hw_stats_map);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1549  	tx_stat_size = bn->tx_port_stats_ext.hw_stats ?
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1550  		       sizeof(struct tx_port_stats_ext) : 0;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1551  	req_qs->tx_stat_size = cpu_to_le16(tx_stat_size);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1552  	req_qs->tx_stat_host_addr =
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1553  		cpu_to_le64(bn->tx_port_stats_ext.hw_stats_map);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1554  	resp_qs = bnge_hwrm_req_hold(bd, req_qs);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1555  	rc = bnge_hwrm_req_send(bd, req_qs);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1556  	if (!rc) {
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1557  		bn->fw_rx_stats_ext_size =
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1558  			le16_to_cpu(resp_qs->rx_stat_size) / 8;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1559  		bn->fw_tx_stats_ext_size = tx_stat_size ?
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1560  			le16_to_cpu(resp_qs->tx_stat_size) / 8 : 0;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1561  	} else {
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1562  		bn->fw_rx_stats_ext_size = 0;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1563  		bn->fw_tx_stats_ext_size = 0;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1564  	}
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1565  	bnge_hwrm_req_drop(bd, req_qs);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1566  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1567  	if (flags)
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1568  		return rc;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1569  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1570  	if (bn->fw_tx_stats_ext_size <=
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1571  	    offsetof(struct tx_port_stats_ext, pfc_pri0_tx_duration_us) / 8) {
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1572  		bn->pri2cos_valid = false;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1573  		return rc;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1574  	}
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1575  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1576  	rc = bnge_hwrm_req_init(bd, req_qc, HWRM_QUEUE_PRI2COS_QCFG);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1577  	if (rc)
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1578  		return rc;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1579  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1580  	req_qc->flags = cpu_to_le32(QUEUE_PRI2COS_QCFG_REQ_FLAGS_IVLAN);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1581  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1582  	resp_qc = bnge_hwrm_req_hold(bd, req_qc);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1583  	rc = bnge_hwrm_req_send(bd, req_qc);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1584  	if (!rc) {
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1585  		u8 *pri2cos;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1586  		int i, j;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1587  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1588  		pri2cos = &resp_qc->pri0_cos_queue_id;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1589  		for (i = 0; i < 8; i++) {
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1590  			u8 queue_id = pri2cos[i];
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1591  			u8 queue_idx;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1592  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1593  			/* Per port queue IDs start from 0, 10, 20, etc */
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1594  			queue_idx = queue_id % 10;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1595  			if (queue_idx >= BNGE_MAX_QUEUE) {
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1596  				bn->pri2cos_valid = false;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1597  				bnge_hwrm_req_drop(bd, req_qc);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10 @1598  				return rc;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1599  			}
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1600  			for (j = 0; j < bd->max_q; j++) {
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1601  				if (bd->q_ids[j] == queue_id)
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1602  					bn->pri2cos_idx[i] = queue_idx;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1603  			}
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1604  		}
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1605  		bn->pri2cos_valid = true;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1606  	}
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1607  	bnge_hwrm_req_drop(bd, req_qc);
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1608  
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1609  	return rc;
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1610  }
598cdbbcf8f4c1 Bhargava Marreddy 2026-03-10  1611  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
