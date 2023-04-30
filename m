Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC57B3209
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Apr 2023 17:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682875844; x=1714411844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QXRaSxEXQezppwTL7CYI9QTEFmW/WLLlC1ZEQPlb+t4=;
  b=fuJOjNKwdQLTJKfv5UEQGw9bGHWbm/l24AdD9ArT8z2MvUpM+cBzItCV
   9A7x1UDDh1ebeYzMwI+bZMEzu1F9XJzBx3is6wgbrfX8+rjbElUojKOaT
   9UbXNJF1JkfkcOtS0+zilAfPC9edcMzVPtfUvQzkuoGANbdreNTL8jGKz
   S881ooJ80Uepa17gZMfUNd6PgFGdLNugN1oNDd7EZ9zEP5qCnAPUyu87d
   4ngvYDi8+VNzwZ0hyGWmIgjcc8xOxiBXJ9fHBjxKadHQJMovZSrU7N2sv
   kimP/e3nC8gkm/Vykl+ko+vPvpdJc+4qXrIuqm+4ECPCQ9Tqhocvh5WW7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="411168826"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="411168826"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 10:30:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="869930806"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="869930806"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Apr 2023 10:30:41 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptAsj-00004F-0o;
	Sun, 30 Apr 2023 17:30:41 +0000
Date: Mon, 1 May 2023 01:30:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 net-next 2/9] net: vlan: introduce skb_vlan_eth_hdr()
Message-ID: <202305010154.lUDr2BCo-lkp@intel.com>
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
In-Reply-To: <20230420225601.2358327-3-vladimir.oltean@nxp.com>
References: <20230420225601.2358327-3-vladimir.oltean@nxp.com>
TO: Vladimir Oltean <vladimir.oltean@nxp.com>

Hi Vladimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Oltean/net-vlan-don-t-adjust-MAC-header-in-__vlan_insert_inner_tag-unless-set/20230421-065832
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230420225601.2358327-3-vladimir.oltean%40nxp.com
patch subject: [PATCH v2 net-next 2/9] net: vlan: introduce skb_vlan_eth_hdr()
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: openrisc-randconfig-m031-20230430 (https://download.01.org/0day-ci/archive/20230501/202305010154.lUDr2BCo-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305010154.lUDr2BCo-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5436 stmmac_rx() error: 'skb' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3650 stmmac_request_irq_multi_msi() warn: 'dev->irq' from request_irq() not released on lines: 3650.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3650 stmmac_request_irq_multi_msi() warn: 'priv->lpi_irq' from request_irq() not released on lines: 3650.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3650 stmmac_request_irq_multi_msi() warn: 'priv->sfty_ce_irq' from request_irq() not released on lines: 3650.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3650 stmmac_request_irq_multi_msi() warn: 'priv->sfty_ue_irq' from request_irq() not released on lines: 3650.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3650 stmmac_request_irq_multi_msi() warn: 'priv->wol_irq' from request_irq() not released on lines: 3650.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3701 stmmac_request_irq_single() warn: 'dev->irq' from request_irq() not released on lines: 3701.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3701 stmmac_request_irq_single() warn: 'priv->wol_irq' from request_irq() not released on lines: 3701.
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4871 stmmac_xdp_run_prog() error: (-2147483647) too low for ERR_PTR

vim +/skb +5436 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

bba2556efad66e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-13  5193  
32ceabcad3c8ab drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2013-04-08  5194  /**
732fdf0e5253e9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2014-11-18  5195   * stmmac_rx - manage the receive process
32ceabcad3c8ab drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2013-04-08  5196   * @priv: driver private structure
54139cf3bb33fa drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto              2017-04-06  5197   * @limit: napi bugget
54139cf3bb33fa drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto              2017-04-06  5198   * @queue: RX queue index.
32ceabcad3c8ab drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2013-04-08  5199   * Description :  this the function called by the napi poll method.
32ceabcad3c8ab drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2013-04-08  5200   * It gets all the frames inside the ring.
32ceabcad3c8ab drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2013-04-08  5201   */
54139cf3bb33fa drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto              2017-04-06  5202  static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5203  {
8531c80800c10e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Christian Marangi       2022-07-23  5204  	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
8fce3331702316 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2018-09-17  5205  	struct stmmac_channel *ch = &priv->channel[queue];
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5206  	unsigned int count = 0, error = 0, len = 0;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5207  	int status = 0, coe = priv->hw->rx_csum;
07b3975352374c drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Aaro Koskinen           2019-03-27  5208  	unsigned int next_entry = rx_q->cur_rx;
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5209  	enum dma_data_direction dma_dir;
bfaf91ca848e75 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joakim Zhang            2021-02-25  5210  	unsigned int desc_size;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5211  	struct sk_buff *skb = NULL;
5b24324a907c99 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song Yoong Siang        2023-04-15  5212  	struct stmmac_xdp_buff ctx;
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5213  	int xdp_status = 0;
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5214  	int buf_sz;
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5215  
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5216  	dma_dir = page_pool_get_dma_dir(rx_q->page_pool);
8531c80800c10e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Christian Marangi       2022-07-23  5217  	buf_sz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5218  
83d7af64ac9eaf drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2013-07-02  5219  	if (netif_msg_rx_status(priv)) {
d0225e7de62290 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Alexandre TORGUE        2016-04-01  5220  		void *rx_head;
d0225e7de62290 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Alexandre TORGUE        2016-04-01  5221  
38ddc59d65b6d9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c LABBE Corentin          2016-11-16  5222  		netdev_dbg(priv->dev, "%s: descriptor ring:\n", __func__);
bfaf91ca848e75 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joakim Zhang            2021-02-25  5223  		if (priv->extend_desc) {
54139cf3bb33fa drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto              2017-04-06  5224  			rx_head = (void *)rx_q->dma_erx;
bfaf91ca848e75 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joakim Zhang            2021-02-25  5225  			desc_size = sizeof(struct dma_extended_desc);
bfaf91ca848e75 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joakim Zhang            2021-02-25  5226  		} else {
54139cf3bb33fa drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto              2017-04-06  5227  			rx_head = (void *)rx_q->dma_rx;
bfaf91ca848e75 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joakim Zhang            2021-02-25  5228  			desc_size = sizeof(struct dma_desc);
bfaf91ca848e75 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joakim Zhang            2021-02-25  5229  		}
d0225e7de62290 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Alexandre TORGUE        2016-04-01  5230  
8531c80800c10e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Christian Marangi       2022-07-23  5231  		stmmac_display_ring(priv, rx_head, priv->dma_conf.dma_rx_size, true,
bfaf91ca848e75 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joakim Zhang            2021-02-25  5232  				    rx_q->dma_rx_phy, desc_size);
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5233  	}
c24602ef866493 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2013-03-26  5234  	while (count < limit) {
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5235  		unsigned int buf1_len = 0, buf2_len = 0;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5236  		enum pkt_hash_types hash_type;
2af6106ae94965 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-07-09  5237  		struct stmmac_rx_buffer *buf;
2af6106ae94965 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-07-09  5238  		struct dma_desc *np, *p;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5239  		int entry;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5240  		u32 hash;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5241  
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5242  		if (!count && rx_q->state_saved) {
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5243  			skb = rx_q->state.skb;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5244  			error = rx_q->state.error;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5245  			len = rx_q->state.len;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5246  		} else {
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5247  			rx_q->state_saved = false;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5248  			skb = NULL;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5249  			error = 0;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5250  			len = 0;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5251  		}
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5252  
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5253  		if (count >= limit)
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5254  			break;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5255  
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5256  read_again:
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5257  		buf1_len = 0;
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5258  		buf2_len = 0;
07b3975352374c drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Aaro Koskinen           2019-03-27  5259  		entry = next_entry;
2af6106ae94965 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-07-09  5260  		buf = &rx_q->buf_pool[entry];
07b3975352374c drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Aaro Koskinen           2019-03-27  5261  
c24602ef866493 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2013-03-26  5262  		if (priv->extend_desc)
54139cf3bb33fa drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto              2017-04-06  5263  			p = (struct dma_desc *)(rx_q->dma_erx + entry);
c24602ef866493 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2013-03-26  5264  		else
54139cf3bb33fa drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto              2017-04-06  5265  			p = rx_q->dma_rx + entry;
c24602ef866493 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2013-03-26  5266  
c1fa3212be5503 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Fabrice Gasnier         2016-02-29  5267  		/* read the status of the incoming frame */
42de047d60bc5d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2018-04-16  5268  		status = stmmac_rx_status(priv, &priv->dev->stats,
c1fa3212be5503 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Fabrice Gasnier         2016-02-29  5269  				&priv->xstats, p);
c1fa3212be5503 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Fabrice Gasnier         2016-02-29  5270  		/* check if managed by the DMA otherwise go ahead */
c1fa3212be5503 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Fabrice Gasnier         2016-02-29  5271  		if (unlikely(status & dma_own))
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5272  			break;
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5273  
aa042f60e4961d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song, Yoong Siang       2020-09-16  5274  		rx_q->cur_rx = STMMAC_GET_ENTRY(rx_q->cur_rx,
8531c80800c10e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Christian Marangi       2022-07-23  5275  						priv->dma_conf.dma_rx_size);
54139cf3bb33fa drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto              2017-04-06  5276  		next_entry = rx_q->cur_rx;
e3ad57c96715df drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe Cavallaro      2016-02-29  5277  
c24602ef866493 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2013-03-26  5278  		if (priv->extend_desc)
54139cf3bb33fa drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto              2017-04-06  5279  			np = (struct dma_desc *)(rx_q->dma_erx + next_entry);
c24602ef866493 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2013-03-26  5280  		else
54139cf3bb33fa drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto              2017-04-06  5281  			np = rx_q->dma_rx + next_entry;
ba1ffd74df74a9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2016-11-14  5282  
ba1ffd74df74a9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2016-11-14  5283  		prefetch(np);
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5284  
42de047d60bc5d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2018-04-16  5285  		if (priv->extend_desc)
42de047d60bc5d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2018-04-16  5286  			stmmac_rx_extended_status(priv, &priv->dev->stats,
42de047d60bc5d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2018-04-16  5287  					&priv->xstats, rx_q->dma_erx + entry);
891434b18ec0a2 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Rayagond Kokatanur      2013-03-26  5288  		if (unlikely(status == discard_frame)) {
2af6106ae94965 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-07-09  5289  			page_pool_recycle_direct(rx_q->page_pool, buf->page);
2af6106ae94965 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-07-09  5290  			buf->page = NULL;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5291  			error = 1;
0b273ca41fe005 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-09-04  5292  			if (!priv->hwts_rx_en)
0b273ca41fe005 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-09-04  5293  				priv->dev->stats.rx_errors++;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5294  		}
ceb694997e1b5d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2013-04-08  5295  
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5296  		if (unlikely(error && (status & rx_not_ls)))
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5297  			goto read_again;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5298  		if (unlikely(error)) {
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5299  			dev_kfree_skb(skb);
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5300  			skb = NULL;
cda4985a3ebb95 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-06  5301  			count++;
07b3975352374c drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Aaro Koskinen           2019-03-27  5302  			continue;
e527c4a769d375 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2015-11-26  5303  		}
e527c4a769d375 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2015-11-26  5304  
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5305  		/* Buffer is good. Go on. */
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5306  
4744bf072b4640 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Matteo Croce            2021-06-09  5307  		prefetch(page_address(buf->page) + buf->page_offset);
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5308  		if (buf->sec_page)
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5309  			prefetch(page_address(buf->sec_page));
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5310  
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5311  		buf1_len = stmmac_rx_buf1_len(priv, p, status, len);
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5312  		len += buf1_len;
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5313  		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5314  		len += buf2_len;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5315  
929d43421ee526 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Kurt Kanzenbach         2022-09-05  5316  		/* ACS is disabled; strip manually. */
929d43421ee526 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Kurt Kanzenbach         2022-09-05  5317  		if (likely(!(status & rx_not_ls))) {
0f296e782f21dc drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Zekun Shen              2021-11-18  5318  			if (buf2_len) {
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5319  				buf2_len -= ETH_FCS_LEN;
0f296e782f21dc drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Zekun Shen              2021-11-18  5320  				len -= ETH_FCS_LEN;
0f296e782f21dc drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Zekun Shen              2021-11-18  5321  			} else if (buf1_len) {
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5322  				buf1_len -= ETH_FCS_LEN;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5323  				len -= ETH_FCS_LEN;
83d7af64ac9eaf drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2013-07-02  5324  			}
0f296e782f21dc drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Zekun Shen              2021-11-18  5325  		}
22ad3838154795 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe Cavallaro      2016-02-29  5326  
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5327  		if (!skb) {
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5328  			unsigned int pre_len, sync_len;
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5329  
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5330  			dma_sync_single_for_cpu(priv->device, buf->addr,
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5331  						buf1_len, dma_dir);
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5332  
5b24324a907c99 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song Yoong Siang        2023-04-15  5333  			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
5b24324a907c99 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song Yoong Siang        2023-04-15  5334  			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
e3f9c3e348406f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song Yoong Siang        2023-04-15  5335  					 buf->page_offset, buf1_len, true);
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5336  
5b24324a907c99 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song Yoong Siang        2023-04-15  5337  			pre_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5338  				  buf->page_offset;
e3f9c3e348406f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song Yoong Siang        2023-04-15  5339  
e3f9c3e348406f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song Yoong Siang        2023-04-15  5340  			ctx.priv = priv;
e3f9c3e348406f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song Yoong Siang        2023-04-15  5341  			ctx.desc = p;
e3f9c3e348406f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song Yoong Siang        2023-04-15  5342  			ctx.ndesc = np;
e3f9c3e348406f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song Yoong Siang        2023-04-15  5343  
5b24324a907c99 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song Yoong Siang        2023-04-15  5344  			skb = stmmac_xdp_run_prog(priv, &ctx.xdp);
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5345  			/* Due xdp_adjust_tail: DMA sync for_device
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5346  			 * cover max len CPU touch
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5347  			 */
5b24324a907c99 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song Yoong Siang        2023-04-15  5348  			sync_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5349  				   buf->page_offset;
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5350  			sync_len = max(sync_len, pre_len);
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5351  
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5352  			/* For Not XDP_PASS verdict */
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5353  			if (IS_ERR(skb)) {
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5354  				unsigned int xdp_res = -PTR_ERR(skb);
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5355  
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5356  				if (xdp_res & STMMAC_XDP_CONSUMED) {
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5357  					page_pool_put_page(rx_q->page_pool,
5b24324a907c99 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song Yoong Siang        2023-04-15  5358  							   virt_to_head_page(ctx.xdp.data),
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5359  							   sync_len, true);
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5360  					buf->page = NULL;
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5361  					priv->dev->stats.rx_dropped++;
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5362  
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5363  					/* Clear skb as it was set as
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5364  					 * status by XDP program.
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5365  					 */
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5366  					skb = NULL;
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5367  
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5368  					if (unlikely((status & rx_not_ls)))
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5369  						goto read_again;
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5370  
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5371  					count++;
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5372  					continue;
8b278a5b69a229 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5373  				} else if (xdp_res & (STMMAC_XDP_TX |
8b278a5b69a229 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5374  						      STMMAC_XDP_REDIRECT)) {
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5375  					xdp_status |= xdp_res;
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5376  					buf->page = NULL;
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5377  					skb = NULL;
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5378  					count++;
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5379  					continue;
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5380  				}
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5381  			}
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5382  		}
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5383  
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5384  		if (!skb) {
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5385  			/* XDP program may expand or reduce tail */
5b24324a907c99 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song Yoong Siang        2023-04-15  5386  			buf1_len = ctx.xdp.data_end - ctx.xdp.data;
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5387  
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5388  			skb = napi_alloc_skb(&ch->rx_napi, buf1_len);
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5389  			if (!skb) {
22ad3838154795 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe Cavallaro      2016-02-29  5390  				priv->dev->stats.rx_dropped++;
cda4985a3ebb95 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-06  5391  				count++;
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5392  				goto drain_data;
22ad3838154795 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe Cavallaro      2016-02-29  5393  			}
22ad3838154795 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe Cavallaro      2016-02-29  5394  
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5395  			/* XDP program may adjust header */
5b24324a907c99 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Song Yoong Siang        2023-04-15  5396  			skb_copy_to_linear_data(skb, ctx.xdp.data, buf1_len);
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5397  			skb_put(skb, buf1_len);
22ad3838154795 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe Cavallaro      2016-02-29  5398  
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5399  			/* Data payload copied into SKB, page ready for recycle */
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5400  			page_pool_recycle_direct(rx_q->page_pool, buf->page);
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5401  			buf->page = NULL;
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5402  		} else if (buf1_len) {
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5403  			dma_sync_single_for_cpu(priv->device, buf->addr,
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5404  						buf1_len, dma_dir);
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5405  			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5406  					buf->page, buf->page_offset, buf1_len,
8531c80800c10e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Christian Marangi       2022-07-23  5407  					priv->dma_conf.dma_buf_sz);
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5408  
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5409  			/* Data payload appended into SKB */
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5410  			page_pool_release_page(rx_q->page_pool, buf->page);
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5411  			buf->page = NULL;
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5412  		}
83d7af64ac9eaf drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2013-07-02  5413  
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5414  		if (buf2_len) {
67afd6d1cfdf0d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5415  			dma_sync_single_for_cpu(priv->device, buf->sec_addr,
5fabb01207a2d3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5416  						buf2_len, dma_dir);
67afd6d1cfdf0d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5417  			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5418  					buf->sec_page, 0, buf2_len,
8531c80800c10e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Christian Marangi       2022-07-23  5419  					priv->dma_conf.dma_buf_sz);
67afd6d1cfdf0d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5420  
67afd6d1cfdf0d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5421  			/* Data payload appended into SKB */
67afd6d1cfdf0d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5422  			page_pool_release_page(rx_q->page_pool, buf->sec_page);
67afd6d1cfdf0d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5423  			buf->sec_page = NULL;
67afd6d1cfdf0d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5424  		}
67afd6d1cfdf0d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5425  
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5426  drain_data:
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5427  		if (likely(status & rx_not_ls))
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5428  			goto read_again;
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5429  		if (!skb)
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5430  			continue;
ba1ffd74df74a9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2016-11-14  5431  
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5432  		/* Got entire packet into SKB. Finish it. */
b93819854d6e79 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Vince Bridgers          2014-01-14  5433  
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5434  		stmmac_get_rx_hwtstamp(priv, p, np, skb);
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5435  		stmmac_rx_vlan(priv->dev, skb);
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14 @5436  		skb->protocol = eth_type_trans(skb, priv->dev);
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5437  
ceb694997e1b5d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2013-04-08  5438  		if (unlikely(!coe))
bc8acf2c8c3e43 drivers/net/stmmac/stmmac_main.c                  Eric Dumazet            2010-09-02  5439  			skb_checksum_none_assert(skb);
62a2ab935c8d0f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2012-11-25  5440  		else
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5441  			skb->ip_summed = CHECKSUM_UNNECESSARY;
62a2ab935c8d0f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe CAVALLARO      2012-11-25  5442  
76067459c686c4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-07  5443  		if (!stmmac_get_rx_hash(priv, p, &hash, &hash_type))
76067459c686c4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-07  5444  			skb_set_hash(skb, hash, hash_type);
76067459c686c4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-07  5445  
76067459c686c4 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-07  5446  		skb_record_rx_queue(skb, queue);
4ccb45857c2c07 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-02-19  5447  		napi_gro_receive(&ch->rx_napi, skb);
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5448  		skb = NULL;
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5449  
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5450  		priv->dev->stats.rx_packets++;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5451  		priv->dev->stats.rx_bytes += len;
cda4985a3ebb95 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-06  5452  		count++;
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5453  	}
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5454  
88ebe2cf7f3fc9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-11-11  5455  	if (status & rx_not_ls || skb) {
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5456  		rx_q->state_saved = true;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5457  		rx_q->state.skb = skb;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5458  		rx_q->state.error = error;
ec222003bd948d drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu              2019-08-17  5459  		rx_q->state.len = len;
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5460  	}
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5461  
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5462  	stmmac_finalize_xdp_rx(priv, xdp_status);
be8b38a722e68f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong          2021-04-01  5463  
54139cf3bb33fa drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto              2017-04-06  5464  	stmmac_rx_refill(priv, queue);
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5465  
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5466  	priv->xstats.rx_pkt_n += count;
68e9c5dee1cf9f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Vijayakannan Ayyathurai 2021-08-16  5467  	priv->xstats.rxq_stats[queue].rx_pkt_n += count;
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5468  
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5469  	return count;
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5470  }
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro      2009-10-14  5471  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
