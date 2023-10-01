Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159A2390
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Oct 2023 20:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696193193; x=1727729193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MTUNvOAvhDGYm1fzYD68eJLTTJYz+SmqYpuViPTr39Y=;
  b=a0ifeK5UFK6bD6xhaoTc1WRNKeSAE13KN5SnJOtOOtjt0Y4176t/LuxQ
   tQ1rUcB6jFyB33HKot2wddsGojjHaIcJNTjdxv4qnC7Hq6QQdGFXHe6hP
   7VNRcolf9ohI7DT8rHxx9ueTxnGvaToUKtg6yb9ZuVuJ20nMfdfUD1Xe3
   +FvAi2rEChIkW7Vr+51jmaoKHWFY5FVkUQrvp39g9KrPw0TKoVnQzTW/8
   u2+QhffjwrzIFpLWkBFb6uV0rY9+45Dhs2ymkisyeGP5XiWfGQMtvoMI6
   k0MnpmkS+Lc6da0pDUqfRMI6Jfos1v/+WtDpoRI6CzMP+H3CrQPryICl/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="367612279"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="367612279"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 13:46:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="753880842"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="753880842"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 01 Oct 2023 13:46:30 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qn3Ke-0005OP-2I;
	Sun, 01 Oct 2023 20:46:28 +0000
Date: Mon, 2 Oct 2023 04:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/emulex/benet/be_main.c:2460
 be_rx_compl_process_gro() error: buffer overflow
 '((skb_end_pointer(skb)))->frags' 17 <= u16max
Message-ID: <202310020436.9ag5ravL-lkp@intel.com>
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
TO: Yunsheng Lin <linyunsheng@huawei.com>
CC: Leon Romanovsky <leonro@nvidia.com>
CC: Simon Horman <simon.horman@corigine.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ec8c298121e3616f8013d3cf1db9c7169c9b0b2d
commit: b51f4113ebb02011f0ca86abc3134b28d2071b6a net: introduce and use skb_frag_fill_page_desc()
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20230930 (https://download.01.org/0day-ci/archive/20231002/202310020436.9ag5ravL-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231002/202310020436.9ag5ravL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310020436.9ag5ravL-lkp@intel.com/

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
