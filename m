Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185A9ED4
	for <oe-kbuild@lists.linux.dev>; Thu,  4 May 2023 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683192259; x=1714728259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=klcrnulEe4iWs2auxWEa8hEnUs6/qy5Y8UOmr6i5ICk=;
  b=oF009AwmXPBAloN5zAxPzffEWHywvtjgY7dYUMwPwJuGWnpM+qBVWOc9
   sa/CIIOqJiYueIrFevTWLOur1XPXDU0Fwgr/lsBzLxFtF+tKVGWz7TqGD
   SfAKlV2ZpIsKr+ZLRvigntgQur99CMjS6NApN9FCSlyJfM7nAmG76112v
   oYRNL9HYT1SRIj/xLJpIVN2cRmv3x5Pg8t1oLgNsqBsRdahm/xLDNsFMV
   TenmRngjKmJO4W0M8JvH9sPBH8Bdsqek8qUhc9ZXIanHM8tGB/m91f4UN
   WYAA6HfXTqPw5mg0PtHef6JNxQB6Q1X6CbtzfOlA7QMY2Bi3jC7gbZBaV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="329239054"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="329239054"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 02:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="786455502"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="786455502"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 May 2023 02:24:17 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puVCC-0002ma-1y;
	Thu, 04 May 2023 09:24:16 +0000
Date: Thu, 4 May 2023 17:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/intel/ice/ice_txrx.c:996 ice_build_skb() error:
 uninitialized symbol 'nr_frags'.
Message-ID: <202305041733.lSMiTh8P-lkp@intel.com>
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
TO: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Alexander Lobakin <alexandr.lobakin@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1a5304fecee523060f26e2778d9d8e33c0562df3
commit: 2fba7dc5157b6f85dbf1b8e26e63a724db1f3d79 ice: Add support for XDP multi-buffer on Rx side
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: openrisc-randconfig-m031-20230430 (https://download.01.org/0day-ci/archive/20230504/202305041733.lSMiTh8P-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305041733.lSMiTh8P-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/ice_txrx.c:996 ice_build_skb() error: uninitialized symbol 'nr_frags'.

vim +/nr_frags +996 drivers/net/ethernet/intel/ice/ice_txrx.c

2b245cb29421ab Anirudh Venkataramanan 2018-03-20   950  
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   951  /**
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   952   * ice_build_skb - Build skb around an existing buffer
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   953   * @rx_ring: Rx descriptor ring to transact packets on
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   954   * @xdp: xdp_buff pointing to the data
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   955   *
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31   956   * This function builds an skb around an existing XDP buffer, taking care
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31   957   * to set up the skb correctly and avoid any memcpy overhead. Driver has
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31   958   * already combined frags (if any) to skb_shared_info.
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   959   */
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   960  static struct sk_buff *
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31   961  ice_build_skb(struct ice_rx_ring *rx_ring, struct xdp_buff *xdp)
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   962  {
88865fc4bbd61e Karol Kolacinski       2020-05-07   963  	u8 metasize = xdp->data - xdp->data_meta;
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31   964  	struct skb_shared_info *sinfo = NULL;
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31   965  	unsigned int nr_frags;
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   966  	struct sk_buff *skb;
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   967  
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31   968  	if (unlikely(xdp_buff_has_frags(xdp))) {
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31   969  		sinfo = xdp_get_shared_info_from_buff(xdp);
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31   970  		nr_frags = sinfo->nr_frags;
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31   971  	}
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31   972  
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   973  	/* Prefetch first cache line of first page. If xdp->data_meta
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   974  	 * is unused, this points exactly as xdp->data, otherwise we
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   975  	 * likely have a consumer accessing first few bytes of meta
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   976  	 * data, and then actual data.
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   977  	 */
f468f21b7af0fa Tariq Toukan           2020-08-26   978  	net_prefetch(xdp->data_meta);
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   979  	/* build an skb around the page buffer */
8a11b334ec9b80 Maciej Fijalkowski     2023-01-31   980  	skb = napi_build_skb(xdp->data_hard_start, xdp->frame_sz);
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   981  	if (unlikely(!skb))
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   982  		return NULL;
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   983  
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   984  	/* must to record Rx queue, otherwise OS features such as
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   985  	 * symmetric queue won't work
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   986  	 */
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   987  	skb_record_rx_queue(skb, rx_ring->q_index);
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   988  
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   989  	/* update pointers within the skb to store the data */
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   990  	skb_reserve(skb, xdp->data - xdp->data_hard_start);
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   991  	__skb_put(skb, xdp->data_end - xdp->data);
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   992  	if (metasize)
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   993  		skb_metadata_set(skb, metasize);
aaf27254fdf905 Maciej Fijalkowski     2019-10-24   994  
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31   995  	if (unlikely(xdp_buff_has_frags(xdp)))
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31  @996  		xdp_update_skb_shared_info(skb, nr_frags,
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31   997  					   sinfo->xdp_frags_size,
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31   998  					   nr_frags * xdp->frame_sz,
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31   999  					   xdp_buff_is_frag_pfmemalloc(xdp));
2fba7dc5157b6f Maciej Fijalkowski     2023-01-31  1000  
aaf27254fdf905 Maciej Fijalkowski     2019-10-24  1001  	return skb;
aaf27254fdf905 Maciej Fijalkowski     2019-10-24  1002  }
aaf27254fdf905 Maciej Fijalkowski     2019-10-24  1003  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
