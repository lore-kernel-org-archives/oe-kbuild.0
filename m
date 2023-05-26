Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6E5168D7
	for <oe-kbuild@lists.linux.dev>; Fri, 26 May 2023 13:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685108204; x=1716644204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kdxyXHsDSUOPG7X4Ln/7Ozio20mYZfgADXu68owQObI=;
  b=X9dkk4z/LsmWTjl25wvMPWGKbxevssHTJFi75CngCS7Nz5pUUC91aDvK
   h+6qmf9At+flNlMvPzLANg+DZQGv/kA2FfyFJlvFQLTRnkYM0nUxLnrEe
   wPYGt7p7mq7SIrSjV5PrJCaMW/jgjH2aQIKiH5G7RnXSfMvRu/xSe7O1X
   +1aQS81Nl9R9ZZmDsqyTIE8kBZLRp4Rscx7EI08U6uOCoG5Ku89OCUV9N
   518YghxnNVx8RslFEc4s5PUKPoJpeNVaImR6h2BLri7ze5rrrnrIfNahn
   uv1//WHEs+9Asf9ekIy4iXyc14MNiYDU/cyw5Tdj7LXVhDibfcOQn+7RG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382446739"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="382446739"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 06:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="738264319"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="738264319"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 May 2023 06:36:33 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2XcO-000JMw-13;
	Fri, 26 May 2023 13:36:32 +0000
Date: Fri, 26 May 2023 21:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1786/4815]
 drivers/net/ethernet/emulex/benet/be_main.c:2460 be_rx_compl_process_gro()
 error: buffer overflow '((skb_end_pointer(skb)))->frags' 17 <= u16max
Message-ID: <202305262137.gbhUSXZ7-lkp@intel.com>
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
TO: Yunsheng Lin <linyunsheng@huawei.com>
CC: Leon Romanovsky <leonro@nvidia.com>
CC: Simon Horman <simon.horman@corigine.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a3d37b4d885129561e1cef361216f00472f7d2e
commit: b51f4113ebb02011f0ca86abc3134b28d2071b6a [1786/4815] net: introduce and use skb_frag_fill_page_desc()
:::::: branch date: 34 hours ago
:::::: commit date: 13 days ago
config: i386-randconfig-m021-20230525 (https://download.01.org/0day-ci/archive/20230526/202305262137.gbhUSXZ7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305262137.gbhUSXZ7-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/emulex/benet/be_main.c:2460 be_rx_compl_process_gro() error: buffer overflow '((skb_end_pointer(skb)))->frags' 17 <= u16max

vim +2460 drivers/net/ethernet/emulex/benet/be_main.c

6b7c5b947c671a drivers/net/benet/be_main.c                 Sathya Perla    2009-03-11  2426  
5be93b9a865344 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-07-21  2427  /* Process the RX completion indicated by rxcp when GRO is enabled */
4188e7df44bf31 drivers/net/ethernet/emulex/benet/be_main.c Jingoo Han      2013-08-05  2428  static void be_rx_compl_process_gro(struct be_rx_obj *rxo,
4188e7df44bf31 drivers/net/ethernet/emulex/benet/be_main.c Jingoo Han      2013-08-05  2429  				    struct napi_struct *napi,
2e588f84f254cc drivers/net/benet/be_main.c                 Sathya Perla    2011-03-11  2430  				    struct be_rx_compl_info *rxcp)
6b7c5b947c671a drivers/net/benet/be_main.c                 Sathya Perla    2009-03-11  2431  {
10ef9ab4329edd drivers/net/ethernet/emulex/benet/be_main.c Sathya Perla    2012-02-09  2432  	struct be_adapter *adapter = rxo->adapter;
6b7c5b947c671a drivers/net/benet/be_main.c                 Sathya Perla    2009-03-11  2433  	struct be_rx_page_info *page_info;
5be93b9a865344 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-07-21  2434  	struct sk_buff *skb = NULL;
2e588f84f254cc drivers/net/benet/be_main.c                 Sathya Perla    2011-03-11  2435  	u16 remaining, curr_frag_len;
2e588f84f254cc drivers/net/benet/be_main.c                 Sathya Perla    2011-03-11  2436  	u16 i, j;
3968fa1e588961 drivers/net/benet/be_main.c                 Ajit Khaparde   2011-02-20  2437  
10ef9ab4329edd drivers/net/ethernet/emulex/benet/be_main.c Sathya Perla    2012-02-09  2438  	skb = napi_get_frags(napi);
5be93b9a865344 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-07-21  2439  	if (!skb) {
10ef9ab4329edd drivers/net/ethernet/emulex/benet/be_main.c Sathya Perla    2012-02-09  2440  		be_rx_compl_discard(rxo, rxcp);
5be93b9a865344 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-07-21  2441  		return;
5be93b9a865344 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-07-21  2442  	}
5be93b9a865344 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-07-21  2443  
2e588f84f254cc drivers/net/benet/be_main.c                 Sathya Perla    2011-03-11  2444  	remaining = rxcp->pkt_size;
2e588f84f254cc drivers/net/benet/be_main.c                 Sathya Perla    2011-03-11  2445  	for (i = 0, j = -1; i < rxcp->num_rcvd; i++) {
0b0ef1d027008f drivers/net/ethernet/emulex/benet/be_main.c Suresh Reddy    2014-01-15  2446  		page_info = get_rx_page_info(rxo);
6b7c5b947c671a drivers/net/benet/be_main.c                 Sathya Perla    2009-03-11  2447  
6b7c5b947c671a drivers/net/benet/be_main.c                 Sathya Perla    2009-03-11  2448  		curr_frag_len = min(remaining, rx_frag_size);
6b7c5b947c671a drivers/net/benet/be_main.c                 Sathya Perla    2009-03-11  2449  
bd46cb6cf11867 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-06-26  2450  		/* Coalesce all frags from the same physical page in one slot */
bd46cb6cf11867 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-06-26  2451  		if (i == 0 || page_info->page_offset == 0) {
bd46cb6cf11867 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-06-26  2452  			/* First frag or Fresh page */
bd46cb6cf11867 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-06-26  2453  			j++;
b51f4113ebb020 drivers/net/ethernet/emulex/benet/be_main.c Yunsheng Lin    2023-05-11  2454  			skb_frag_fill_page_desc(&skb_shinfo(skb)->frags[j],
b51f4113ebb020 drivers/net/ethernet/emulex/benet/be_main.c Yunsheng Lin    2023-05-11  2455  						page_info->page,
b51f4113ebb020 drivers/net/ethernet/emulex/benet/be_main.c Yunsheng Lin    2023-05-11  2456  						page_info->page_offset,
b51f4113ebb020 drivers/net/ethernet/emulex/benet/be_main.c Yunsheng Lin    2023-05-11  2457  						curr_frag_len);
bd46cb6cf11867 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-06-26  2458  		} else {
bd46cb6cf11867 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-06-26  2459  			put_page(page_info->page);
b51f4113ebb020 drivers/net/ethernet/emulex/benet/be_main.c Yunsheng Lin    2023-05-11 @2460  			skb_frag_size_add(&skb_shinfo(skb)->frags[j],
b51f4113ebb020 drivers/net/ethernet/emulex/benet/be_main.c Yunsheng Lin    2023-05-11  2461  					  curr_frag_len);
bd46cb6cf11867 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-06-26  2462  		}
b51f4113ebb020 drivers/net/ethernet/emulex/benet/be_main.c Yunsheng Lin    2023-05-11  2463  
bdb28a97f46b53 drivers/net/ethernet/emulex/benet/be_main.c Eric Dumazet    2011-10-13  2464  		skb->truesize += rx_frag_size;
bd46cb6cf11867 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-06-26  2465  		remaining -= curr_frag_len;
6b7c5b947c671a drivers/net/benet/be_main.c                 Sathya Perla    2009-03-11  2466  		memset(page_info, 0, sizeof(*page_info));
6b7c5b947c671a drivers/net/benet/be_main.c                 Sathya Perla    2009-03-11  2467  	}
bd46cb6cf11867 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-06-26  2468  	BUG_ON(j > MAX_SKB_FRAGS);
6b7c5b947c671a drivers/net/benet/be_main.c                 Sathya Perla    2009-03-11  2469  
5be93b9a865344 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-07-21  2470  	skb_shinfo(skb)->nr_frags = j + 1;
2e588f84f254cc drivers/net/benet/be_main.c                 Sathya Perla    2011-03-11  2471  	skb->len = rxcp->pkt_size;
2e588f84f254cc drivers/net/benet/be_main.c                 Sathya Perla    2011-03-11  2472  	skb->data_len = rxcp->pkt_size;
5be93b9a865344 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-07-21  2473  	skb->ip_summed = CHECKSUM_UNNECESSARY;
aaa6daec586cd3 drivers/net/ethernet/emulex/benet/be_main.c Somnath Kotur   2012-05-02  2474  	skb_record_rx_queue(skb, rxo - &adapter->rx_obj[0]);
4b97291429bf59 drivers/net/benet/be_main.c                 Ajit Khaparde   2011-04-06  2475  	if (adapter->netdev->features & NETIF_F_RXHASH)
d2464c8c547333 drivers/net/ethernet/emulex/benet/be_main.c Tom Herbert     2013-12-17  2476  		skb_set_hash(skb, rxcp->rss_hash, PKT_HASH_TYPE_L3);
c9c47142f6bf46 drivers/net/ethernet/emulex/benet/be_main.c Sathya Perla    2014-03-27  2477  
b6c0e89dd3a1b2 drivers/net/ethernet/emulex/benet/be_main.c Tom Herbert     2014-08-27  2478  	skb->csum_level = rxcp->tunneled;
5be93b9a865344 drivers/net/benet/be_main.c                 Ajit Khaparde   2009-07-21  2479  
343e43c02850a3 drivers/net/ethernet/emulex/benet/be_main.c Jiri Pirko      2011-08-25  2480  	if (rxcp->vlanf)
86a9bad3ab6b6f drivers/net/ethernet/emulex/benet/be_main.c Patrick McHardy 2013-04-19  2481  		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), rxcp->vlan_tag);
4c5102f94c175d drivers/net/benet/be_main.c                 Ajit Khaparde   2011-07-12  2482  
10ef9ab4329edd drivers/net/ethernet/emulex/benet/be_main.c Sathya Perla    2012-02-09  2483  	napi_gro_frags(napi);
2e588f84f254cc drivers/net/benet/be_main.c                 Sathya Perla    2011-03-11  2484  }
2e588f84f254cc drivers/net/benet/be_main.c                 Sathya Perla    2011-03-11  2485  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
