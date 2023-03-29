Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B3A882B
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Mar 2023 21:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680126258; x=1711662258;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=d3mUv65USnTDffH8gU7vi1zdxcjYpv3Y4TYNGTaYKHM=;
  b=Dhu1j3Y82MZG2ZRIKV84dW1Ta2DTKVdw56WEgDVvCpF+yRhqcCQfBKOG
   SgCUUj8nIQZ1y3LdgJr1q6MSkR28GqIGL2Za1APFbTwaAyIz2ttC1O3VD
   OMcC8l6iNQpcqTZKB0Un3UhjJ7U7JjfPsvoxgVyBJUT2PVpoCww8ZyRU3
   sAKDCNOM8r8fxhP0UZycWq65u2R/qthPXRFfNDnE1+XeT8EHGsNSLRafJ
   pLVZF9wgqevCRcP1+k2XARpHerc/tpSKoJ7i+79OxN2A1Rv4yeFDVzJEL
   zAH3cLYlMj28/bNuf3J1i4HSytexql8ZJNP2eEW/+nwMVCIFjjhC/OReU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="427280352"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="427280352"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 14:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="828046924"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="828046924"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2023 14:44:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phdaX-000JzK-2h;
	Wed, 29 Mar 2023 21:44:13 +0000
Date: Thu, 30 Mar 2023 05:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c:127
 t7xx_dpmaif_release_tx_buffer() error: potentially dereferencing
 uninitialized 'cur_drb'.
Message-ID: <202303300555.ucDb9eoG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Haijun Liu <haijun.liu@mediatek.com>
CC: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
CC: Ricardo Martinez <ricardo.martinez@linux.intel.com>
CC: Loic Poulain <loic.poulain@linaro.org>
CC: Sergey Ryazanov <ryazanov.s.a@gmail.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffe78bbd512166e0ef1cc4858010b128c510ed7d
commit: d642b012df70a76dd5723f2d426b40bffe83ac49 net: wwan: t7xx: Add data path interface
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300555.ucDb9eoG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303300555.ucDb9eoG-lkp@intel.com/

smatch warnings:
drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c:127 t7xx_dpmaif_release_tx_buffer() error: potentially dereferencing uninitialized 'cur_drb'.

vim +/cur_drb +127 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c

d642b012df70a7 Haijun Liu 2022-05-06   78  
d642b012df70a7 Haijun Liu 2022-05-06   79  static unsigned int t7xx_dpmaif_release_tx_buffer(struct dpmaif_ctrl *dpmaif_ctrl,
d642b012df70a7 Haijun Liu 2022-05-06   80  						  unsigned int q_num, unsigned int release_cnt)
d642b012df70a7 Haijun Liu 2022-05-06   81  {
d642b012df70a7 Haijun Liu 2022-05-06   82  	struct dpmaif_tx_queue *txq = &dpmaif_ctrl->txq[q_num];
d642b012df70a7 Haijun Liu 2022-05-06   83  	struct dpmaif_callbacks *cb = dpmaif_ctrl->callbacks;
d642b012df70a7 Haijun Liu 2022-05-06   84  	struct dpmaif_drb_skb *cur_drb_skb, *drb_skb_base;
d642b012df70a7 Haijun Liu 2022-05-06   85  	struct dpmaif_drb *cur_drb, *drb_base;
d642b012df70a7 Haijun Liu 2022-05-06   86  	unsigned int drb_cnt, i, cur_idx;
d642b012df70a7 Haijun Liu 2022-05-06   87  	unsigned long flags;
d642b012df70a7 Haijun Liu 2022-05-06   88  
d642b012df70a7 Haijun Liu 2022-05-06   89  	drb_skb_base = txq->drb_skb_base;
d642b012df70a7 Haijun Liu 2022-05-06   90  	drb_base = txq->drb_base;
d642b012df70a7 Haijun Liu 2022-05-06   91  
d642b012df70a7 Haijun Liu 2022-05-06   92  	spin_lock_irqsave(&txq->tx_lock, flags);
d642b012df70a7 Haijun Liu 2022-05-06   93  	drb_cnt = txq->drb_size_cnt;
d642b012df70a7 Haijun Liu 2022-05-06   94  	cur_idx = txq->drb_release_rd_idx;
d642b012df70a7 Haijun Liu 2022-05-06   95  	spin_unlock_irqrestore(&txq->tx_lock, flags);
d642b012df70a7 Haijun Liu 2022-05-06   96  
d642b012df70a7 Haijun Liu 2022-05-06   97  	for (i = 0; i < release_cnt; i++) {
d642b012df70a7 Haijun Liu 2022-05-06   98  		cur_drb = drb_base + cur_idx;
d642b012df70a7 Haijun Liu 2022-05-06   99  		if (FIELD_GET(DRB_HDR_DTYP, le32_to_cpu(cur_drb->header)) == DES_DTYP_PD) {
d642b012df70a7 Haijun Liu 2022-05-06  100  			cur_drb_skb = drb_skb_base + cur_idx;
d642b012df70a7 Haijun Liu 2022-05-06  101  			if (!cur_drb_skb->is_msg)
d642b012df70a7 Haijun Liu 2022-05-06  102  				dma_unmap_single(dpmaif_ctrl->dev, cur_drb_skb->bus_addr,
d642b012df70a7 Haijun Liu 2022-05-06  103  						 cur_drb_skb->data_len, DMA_TO_DEVICE);
d642b012df70a7 Haijun Liu 2022-05-06  104  
d642b012df70a7 Haijun Liu 2022-05-06  105  			if (!FIELD_GET(DRB_HDR_CONT, le32_to_cpu(cur_drb->header))) {
d642b012df70a7 Haijun Liu 2022-05-06  106  				if (!cur_drb_skb->skb) {
d642b012df70a7 Haijun Liu 2022-05-06  107  					dev_err(dpmaif_ctrl->dev,
d642b012df70a7 Haijun Liu 2022-05-06  108  						"txq%u: DRB check fail, invalid skb\n", q_num);
d642b012df70a7 Haijun Liu 2022-05-06  109  					continue;
d642b012df70a7 Haijun Liu 2022-05-06  110  				}
d642b012df70a7 Haijun Liu 2022-05-06  111  
d642b012df70a7 Haijun Liu 2022-05-06  112  				dev_kfree_skb_any(cur_drb_skb->skb);
d642b012df70a7 Haijun Liu 2022-05-06  113  			}
d642b012df70a7 Haijun Liu 2022-05-06  114  
d642b012df70a7 Haijun Liu 2022-05-06  115  			cur_drb_skb->skb = NULL;
d642b012df70a7 Haijun Liu 2022-05-06  116  		}
d642b012df70a7 Haijun Liu 2022-05-06  117  
d642b012df70a7 Haijun Liu 2022-05-06  118  		spin_lock_irqsave(&txq->tx_lock, flags);
d642b012df70a7 Haijun Liu 2022-05-06  119  		cur_idx = t7xx_ring_buf_get_next_wr_idx(drb_cnt, cur_idx);
d642b012df70a7 Haijun Liu 2022-05-06  120  		txq->drb_release_rd_idx = cur_idx;
d642b012df70a7 Haijun Liu 2022-05-06  121  		spin_unlock_irqrestore(&txq->tx_lock, flags);
d642b012df70a7 Haijun Liu 2022-05-06  122  
d642b012df70a7 Haijun Liu 2022-05-06  123  		if (atomic_inc_return(&txq->tx_budget) > txq->drb_size_cnt / 8)
d642b012df70a7 Haijun Liu 2022-05-06  124  			cb->state_notify(dpmaif_ctrl->t7xx_dev, DMPAIF_TXQ_STATE_IRQ, txq->index);
d642b012df70a7 Haijun Liu 2022-05-06  125  	}
d642b012df70a7 Haijun Liu 2022-05-06  126  
d642b012df70a7 Haijun Liu 2022-05-06 @127  	if (FIELD_GET(DRB_HDR_CONT, le32_to_cpu(cur_drb->header)))
d642b012df70a7 Haijun Liu 2022-05-06  128  		dev_err(dpmaif_ctrl->dev, "txq%u: DRB not marked as the last one\n", q_num);
d642b012df70a7 Haijun Liu 2022-05-06  129  
d642b012df70a7 Haijun Liu 2022-05-06  130  	return i;
d642b012df70a7 Haijun Liu 2022-05-06  131  }
d642b012df70a7 Haijun Liu 2022-05-06  132  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
