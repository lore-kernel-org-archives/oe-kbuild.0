Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7117F0
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Mar 2023 02:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677637202; x=1709173202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g+XSIol1xLnRSJoxemKoT5LodJglM5sieFvIipXMAWA=;
  b=UGqSskEJs8pBLqCwT0kM/t8a6uQDS63u/8Ioui/WpYO8yGXJX6dBTkpZ
   fkhg6nFGuJLovk9sZLzwW9uuAHkPzLUXtVLIuMDXZVn6Ir0ljh0NmYX62
   ibc1a8z0iX4fHuT1CtLS+wnyqqvy+TfDW1OIxVWhSo4eS0plLgzOf524v
   shBBHT/LJFCMt8jzBzs8vCoG7nqz8slSWc1/lH+ZgOFe0agJYHJ//YUhP
   EGvxSVWb+ARJo7AUDDXOXT/JlpvpCO8vRP6pwOhqWNKy9GVSLJZzCZHPf
   hr7jYVXqZxJsOSZUpE7GqcDeAYZ7qO+h1Eyk/v3qEFTMnNku489JqmTQZ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="361877327"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="361877327"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 18:20:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="763414441"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="763414441"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Feb 2023 18:20:00 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXC4V-0005oB-30;
	Wed, 01 Mar 2023 02:19:59 +0000
Date: Wed, 1 Mar 2023 10:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/intel/ice/ice_txrx.c:996 ice_build_skb() error:
 uninitialized symbol 'nr_frags'.
Message-ID: <202303011056.xTbuZ77z-lkp@intel.com>
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
head:   c0927a7a5391f7d8e593e5e50ead7505a23cadf9
commit: 2fba7dc5157b6f85dbf1b8e26e63a724db1f3d79 ice: Add support for XDP multi-buffer on Rx side
date:   4 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-m001-20230227 (https://download.01.org/0day-ci/archive/20230301/202303011056.xTbuZ77z-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303011056.xTbuZ77z-lkp@intel.com/

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
