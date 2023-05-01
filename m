Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30337F7
	for <oe-kbuild@lists.linux.dev>; Mon,  1 May 2023 06:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682923083; x=1714459083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tNDjXSZSAZE8bEOA9lK5Oxs22DUKGXW3QcuBP2ginjk=;
  b=hzhDzy/Uya4DD9DTT5XUXssF9KoMfqXt/CdMiwy9CkT3fChKU8Dlngdn
   ccYqwh4d7fM5yPtGcOMqpg4A89FA0va7SD7a2dT0UN6igMmftLR/A0qLF
   8NlaEmp8PnWZfeJ9s7vO8csJSZ4xNl+PgEWQJoNWet06D/xwOk5VR01Q3
   UaksGLBOVGfzmIHm5n5HGxjnziYFzZOtw6R6NAR6fAyUo/hdm+qcXmZur
   nZrHaj6HL7632imz62+/iXw9mAlwm8p5Xu4yv+tV2BmipTkr/Zb65Y5U7
   yNSFC94M71R+itAqEbDYwRR3n5idpb3bPFgu5KDv9E1slgjPuvjW1iyIB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="328448096"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="328448096"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 23:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="695692919"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="695692919"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Apr 2023 23:38:01 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptNAe-0000LF-0y;
	Mon, 01 May 2023 06:38:00 +0000
Date: Mon, 1 May 2023 14:37:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/sunplus/spl2sw_int.c:115 spl2sw_rx_poll()
 error: potentially dereferencing uninitialized 'h_desc'.
Message-ID: <202305011421.IygN7RH3-lkp@intel.com>
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
TO: Wells Lu <wellslutw@gmail.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58390c8ce1bddb6c623f62e7ed36383e7fa5c02f
commit: fd3040b9394c58bcedb83554bcf1a073021d6b36 net: ethernet: Add driver for Sunplus SP7021
date:   12 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 12 months ago
config: openrisc-randconfig-m041-20230501 (https://download.01.org/0day-ci/archive/20230501/202305011421.IygN7RH3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305011421.IygN7RH3-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/sunplus/spl2sw_int.c:115 spl2sw_rx_poll() error: potentially dereferencing uninitialized 'h_desc'.

vim +/h_desc +115 drivers/net/ethernet/sunplus/spl2sw_int.c

fd3040b9394c58 Wells Lu 2022-05-08   16  
fd3040b9394c58 Wells Lu 2022-05-08   17  int spl2sw_rx_poll(struct napi_struct *napi, int budget)
fd3040b9394c58 Wells Lu 2022-05-08   18  {
fd3040b9394c58 Wells Lu 2022-05-08   19  	struct spl2sw_common *comm = container_of(napi, struct spl2sw_common, rx_napi);
fd3040b9394c58 Wells Lu 2022-05-08   20  	struct spl2sw_mac_desc *desc, *h_desc;
fd3040b9394c58 Wells Lu 2022-05-08   21  	struct net_device_stats *stats;
fd3040b9394c58 Wells Lu 2022-05-08   22  	struct sk_buff *skb, *new_skb;
fd3040b9394c58 Wells Lu 2022-05-08   23  	struct spl2sw_skb_info *sinfo;
fd3040b9394c58 Wells Lu 2022-05-08   24  	int budget_left = budget;
fd3040b9394c58 Wells Lu 2022-05-08   25  	unsigned long flags;
fd3040b9394c58 Wells Lu 2022-05-08   26  	u32 rx_pos, pkg_len;
fd3040b9394c58 Wells Lu 2022-05-08   27  	u32 num, rx_count;
fd3040b9394c58 Wells Lu 2022-05-08   28  	s32 queue;
fd3040b9394c58 Wells Lu 2022-05-08   29  	u32 mask;
fd3040b9394c58 Wells Lu 2022-05-08   30  	int port;
fd3040b9394c58 Wells Lu 2022-05-08   31  	u32 cmd;
fd3040b9394c58 Wells Lu 2022-05-08   32  
fd3040b9394c58 Wells Lu 2022-05-08   33  	/* Process high-priority queue and then low-priority queue. */
fd3040b9394c58 Wells Lu 2022-05-08   34  	for (queue = 0; queue < RX_DESC_QUEUE_NUM; queue++) {
fd3040b9394c58 Wells Lu 2022-05-08   35  		rx_pos = comm->rx_pos[queue];
fd3040b9394c58 Wells Lu 2022-05-08   36  		rx_count = comm->rx_desc_num[queue];
fd3040b9394c58 Wells Lu 2022-05-08   37  
fd3040b9394c58 Wells Lu 2022-05-08   38  		for (num = 0; num < rx_count && budget_left; num++) {
fd3040b9394c58 Wells Lu 2022-05-08   39  			sinfo = comm->rx_skb_info[queue] + rx_pos;
fd3040b9394c58 Wells Lu 2022-05-08   40  			desc = comm->rx_desc[queue] + rx_pos;
fd3040b9394c58 Wells Lu 2022-05-08   41  			cmd = desc->cmd1;
fd3040b9394c58 Wells Lu 2022-05-08   42  
fd3040b9394c58 Wells Lu 2022-05-08   43  			if (cmd & RXD_OWN)
fd3040b9394c58 Wells Lu 2022-05-08   44  				break;
fd3040b9394c58 Wells Lu 2022-05-08   45  
fd3040b9394c58 Wells Lu 2022-05-08   46  			port = FIELD_GET(RXD_PKT_SP, cmd);
fd3040b9394c58 Wells Lu 2022-05-08   47  			if (port < MAX_NETDEV_NUM && comm->ndev[port])
fd3040b9394c58 Wells Lu 2022-05-08   48  				stats = &comm->ndev[port]->stats;
fd3040b9394c58 Wells Lu 2022-05-08   49  			else
fd3040b9394c58 Wells Lu 2022-05-08   50  				goto spl2sw_rx_poll_rec_err;
fd3040b9394c58 Wells Lu 2022-05-08   51  
fd3040b9394c58 Wells Lu 2022-05-08   52  			pkg_len = FIELD_GET(RXD_PKT_LEN, cmd);
fd3040b9394c58 Wells Lu 2022-05-08   53  			if (unlikely((cmd & RXD_ERR_CODE) || pkg_len < ETH_ZLEN + 4)) {
fd3040b9394c58 Wells Lu 2022-05-08   54  				stats->rx_length_errors++;
fd3040b9394c58 Wells Lu 2022-05-08   55  				stats->rx_dropped++;
fd3040b9394c58 Wells Lu 2022-05-08   56  				goto spl2sw_rx_poll_rec_err;
fd3040b9394c58 Wells Lu 2022-05-08   57  			}
fd3040b9394c58 Wells Lu 2022-05-08   58  
fd3040b9394c58 Wells Lu 2022-05-08   59  			dma_unmap_single(&comm->pdev->dev, sinfo->mapping,
fd3040b9394c58 Wells Lu 2022-05-08   60  					 comm->rx_desc_buff_size, DMA_FROM_DEVICE);
fd3040b9394c58 Wells Lu 2022-05-08   61  
fd3040b9394c58 Wells Lu 2022-05-08   62  			skb = sinfo->skb;
fd3040b9394c58 Wells Lu 2022-05-08   63  			skb_put(skb, pkg_len - 4); /* Minus FCS */
fd3040b9394c58 Wells Lu 2022-05-08   64  			skb->ip_summed = CHECKSUM_NONE;
fd3040b9394c58 Wells Lu 2022-05-08   65  			skb->protocol = eth_type_trans(skb, comm->ndev[port]);
fd3040b9394c58 Wells Lu 2022-05-08   66  			netif_receive_skb(skb);
fd3040b9394c58 Wells Lu 2022-05-08   67  
fd3040b9394c58 Wells Lu 2022-05-08   68  			stats->rx_packets++;
fd3040b9394c58 Wells Lu 2022-05-08   69  			stats->rx_bytes += skb->len;
fd3040b9394c58 Wells Lu 2022-05-08   70  
fd3040b9394c58 Wells Lu 2022-05-08   71  			/* Allocate a new skb for receiving. */
fd3040b9394c58 Wells Lu 2022-05-08   72  			new_skb = netdev_alloc_skb(NULL, comm->rx_desc_buff_size);
fd3040b9394c58 Wells Lu 2022-05-08   73  			if (unlikely(!new_skb)) {
fd3040b9394c58 Wells Lu 2022-05-08   74  				desc->cmd2 = (rx_pos == comm->rx_desc_num[queue] - 1) ?
fd3040b9394c58 Wells Lu 2022-05-08   75  					     RXD_EOR : 0;
fd3040b9394c58 Wells Lu 2022-05-08   76  				sinfo->skb = NULL;
fd3040b9394c58 Wells Lu 2022-05-08   77  				sinfo->mapping = 0;
fd3040b9394c58 Wells Lu 2022-05-08   78  				desc->addr1 = 0;
fd3040b9394c58 Wells Lu 2022-05-08   79  				goto spl2sw_rx_poll_alloc_err;
fd3040b9394c58 Wells Lu 2022-05-08   80  			}
fd3040b9394c58 Wells Lu 2022-05-08   81  
fd3040b9394c58 Wells Lu 2022-05-08   82  			sinfo->mapping = dma_map_single(&comm->pdev->dev, new_skb->data,
fd3040b9394c58 Wells Lu 2022-05-08   83  							comm->rx_desc_buff_size,
fd3040b9394c58 Wells Lu 2022-05-08   84  							DMA_FROM_DEVICE);
fd3040b9394c58 Wells Lu 2022-05-08   85  			if (dma_mapping_error(&comm->pdev->dev, sinfo->mapping)) {
fd3040b9394c58 Wells Lu 2022-05-08   86  				dev_kfree_skb_irq(new_skb);
fd3040b9394c58 Wells Lu 2022-05-08   87  				desc->cmd2 = (rx_pos == comm->rx_desc_num[queue] - 1) ?
fd3040b9394c58 Wells Lu 2022-05-08   88  					     RXD_EOR : 0;
fd3040b9394c58 Wells Lu 2022-05-08   89  				sinfo->skb = NULL;
fd3040b9394c58 Wells Lu 2022-05-08   90  				sinfo->mapping = 0;
fd3040b9394c58 Wells Lu 2022-05-08   91  				desc->addr1 = 0;
fd3040b9394c58 Wells Lu 2022-05-08   92  				goto spl2sw_rx_poll_alloc_err;
fd3040b9394c58 Wells Lu 2022-05-08   93  			}
fd3040b9394c58 Wells Lu 2022-05-08   94  
fd3040b9394c58 Wells Lu 2022-05-08   95  			sinfo->skb = new_skb;
fd3040b9394c58 Wells Lu 2022-05-08   96  			desc->addr1 = sinfo->mapping;
fd3040b9394c58 Wells Lu 2022-05-08   97  
fd3040b9394c58 Wells Lu 2022-05-08   98  spl2sw_rx_poll_rec_err:
fd3040b9394c58 Wells Lu 2022-05-08   99  			desc->cmd2 = (rx_pos == comm->rx_desc_num[queue] - 1) ?
fd3040b9394c58 Wells Lu 2022-05-08  100  				     RXD_EOR | comm->rx_desc_buff_size :
fd3040b9394c58 Wells Lu 2022-05-08  101  				     comm->rx_desc_buff_size;
fd3040b9394c58 Wells Lu 2022-05-08  102  
fd3040b9394c58 Wells Lu 2022-05-08  103  			wmb();	/* Set RXD_OWN after other fields are effective. */
fd3040b9394c58 Wells Lu 2022-05-08  104  			desc->cmd1 = RXD_OWN;
fd3040b9394c58 Wells Lu 2022-05-08  105  
fd3040b9394c58 Wells Lu 2022-05-08  106  spl2sw_rx_poll_alloc_err:
fd3040b9394c58 Wells Lu 2022-05-08  107  			/* Move rx_pos to next position */
fd3040b9394c58 Wells Lu 2022-05-08  108  			rx_pos = ((rx_pos + 1) == comm->rx_desc_num[queue]) ? 0 : rx_pos + 1;
fd3040b9394c58 Wells Lu 2022-05-08  109  
fd3040b9394c58 Wells Lu 2022-05-08  110  			budget_left--;
fd3040b9394c58 Wells Lu 2022-05-08  111  
fd3040b9394c58 Wells Lu 2022-05-08  112  			/* If there are packets in high-priority queue,
fd3040b9394c58 Wells Lu 2022-05-08  113  			 * stop processing low-priority queue.
fd3040b9394c58 Wells Lu 2022-05-08  114  			 */
fd3040b9394c58 Wells Lu 2022-05-08 @115  			if (queue == 1 && !(h_desc->cmd1 & RXD_OWN))
fd3040b9394c58 Wells Lu 2022-05-08  116  				break;
fd3040b9394c58 Wells Lu 2022-05-08  117  		}
fd3040b9394c58 Wells Lu 2022-05-08  118  
fd3040b9394c58 Wells Lu 2022-05-08  119  		comm->rx_pos[queue] = rx_pos;
fd3040b9394c58 Wells Lu 2022-05-08  120  
fd3040b9394c58 Wells Lu 2022-05-08  121  		/* Save pointer to last rx descriptor of high-priority queue. */
fd3040b9394c58 Wells Lu 2022-05-08  122  		if (queue == 0)
fd3040b9394c58 Wells Lu 2022-05-08  123  			h_desc = comm->rx_desc[queue] + rx_pos;
fd3040b9394c58 Wells Lu 2022-05-08  124  	}
fd3040b9394c58 Wells Lu 2022-05-08  125  
fd3040b9394c58 Wells Lu 2022-05-08  126  	spin_lock_irqsave(&comm->int_mask_lock, flags);
fd3040b9394c58 Wells Lu 2022-05-08  127  	mask = readl(comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
fd3040b9394c58 Wells Lu 2022-05-08  128  	mask &= ~MAC_INT_RX;
fd3040b9394c58 Wells Lu 2022-05-08  129  	writel(mask, comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
fd3040b9394c58 Wells Lu 2022-05-08  130  	spin_unlock_irqrestore(&comm->int_mask_lock, flags);
fd3040b9394c58 Wells Lu 2022-05-08  131  
fd3040b9394c58 Wells Lu 2022-05-08  132  	napi_complete(napi);
fd3040b9394c58 Wells Lu 2022-05-08  133  	return budget - budget_left;
fd3040b9394c58 Wells Lu 2022-05-08  134  }
fd3040b9394c58 Wells Lu 2022-05-08  135  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
