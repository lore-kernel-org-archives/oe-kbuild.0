Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1508B22329
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Feb 2024 16:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708706883; cv=none; b=Ab06d8klavBtN7+LdjTF7eHec89TfJM0K80hi2/tYMFpVCJtNlTdr9OWTp9s08TJjKrgB9W57SRUsgOyd8txPnX9ICe6UJe9o0Lmhm3E8P3A/uRF1fu9TlnM/QNu17jE3NzvaP8ZslTzGktArYdmdB1xSKtpxPNxqHQtVf5QYnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708706883; c=relaxed/simple;
	bh=+5OgkSFeeiOokM6WICntP6E2Ly8QOw2Ytp8fEIBN8Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GebEMW1Mk7Iz2f/NAsj7DEedob5QXgedRaPy3DsAyaiZep9iltVo9v/ytCB6/FD12srSI+xuYsJOIV77tOURIKZBjiuX4p5dpmhDVTVuH7goFLHkYZzwC6smIT3odzXmqKn0UjgoyinYEKZ0JK/X3Hgz1BY+Aa18PbrB7UsoGzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IovqkYzE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IovqkYzE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708706882; x=1740242882;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+5OgkSFeeiOokM6WICntP6E2Ly8QOw2Ytp8fEIBN8Mo=;
  b=IovqkYzEyVEAFNl+3pYYu48FiaI17VOZUfAbsj0OR84aHS6qJBn3u1l+
   ZN7x1tr5QP5UEBz/WN38InRFjXeD0Skj4FN2JkFL5cl+5EFbewcjvVW8+
   98Ct+tXlIof0NH+78lPs9O5UHUwutuRm5H5MnRpWtGJq+L42GooLWqGTJ
   rXp+GBEB43tPSB2zPrLb8c68DeNuL+XUGGMwzYZ12IeLC22SLwRSsxmWd
   HubE24aBZpuhMP/j0g+FOU2wh0lthL2xjgtUKdSz1WL/YmATsX5zMhHmC
   7hd/pYCkDub5VIVtifXqTUIYnhzc5WEiqMW4g7DPW1Di+FNN0JlznR6Y7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="5977548"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5977548"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 08:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="10732069"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Feb 2024 08:48:00 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdYhf-0007h6-11;
	Fri, 23 Feb 2024 16:47:33 +0000
Date: Sat, 24 Feb 2024 00:47:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/intel/i40e/i40e_txrx.c:2256 i40e_build_skb()
 error: uninitialized symbol 'sinfo'.
Message-ID: <202402240052.3o8elldC-lkp@intel.com>
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
TO: Tirthendu Sarkar <tirthendu.sarkar@intel.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffd2cb6b718e189e7e2d5d0c19c25611f92e061a
commit: 83014323c642b8faa2d64a5f303b41c019322478 i40e: handle multi-buffer packets that are shrunk by xdp prog
date:   4 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-r081-20240223 (https://download.01.org/0day-ci/archive/20240224/202402240052.3o8elldC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402240052.3o8elldC-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/intel/i40e/i40e_txrx.c:2256 i40e_build_skb() error: uninitialized symbol 'sinfo'.

Old smatch warnings:
drivers/net/ethernet/intel/i40e/i40e_txrx_common.h:79 i40e_arm_wb() warn: replace divide condition 'j / 4' with 'j >= 4'
drivers/net/ethernet/intel/i40e/i40e_txrx.c:2197 i40e_construct_skb() error: uninitialized symbol 'sinfo'.
drivers/net/ethernet/intel/i40e/i40e_txrx.c:2255 i40e_build_skb() error: uninitialized symbol 'nr_frags'.

vim +/sinfo +2256 drivers/net/ethernet/intel/i40e/i40e_txrx.c

a0cfc3130eef54 Alexander Duyck  2017-03-14  2214  
f8b45b74cc6229 Alexander Duyck  2017-04-05  2215  /**
f8b45b74cc6229 Alexander Duyck  2017-04-05  2216   * i40e_build_skb - Build skb around an existing buffer
f8b45b74cc6229 Alexander Duyck  2017-04-05  2217   * @rx_ring: Rx descriptor ring to transact packets on
0c8493d90b6bb0 Björn Töpel      2017-05-24  2218   * @xdp: xdp_buff pointing to the data
f8b45b74cc6229 Alexander Duyck  2017-04-05  2219   *
f8b45b74cc6229 Alexander Duyck  2017-04-05  2220   * This function builds an skb around an existing Rx buffer, taking care
f8b45b74cc6229 Alexander Duyck  2017-04-05  2221   * to set up the skb correctly and avoid any memcpy overhead.
f8b45b74cc6229 Alexander Duyck  2017-04-05  2222   */
f8b45b74cc6229 Alexander Duyck  2017-04-05  2223  static struct sk_buff *i40e_build_skb(struct i40e_ring *rx_ring,
83014323c642b8 Tirthendu Sarkar 2024-01-24  2224  				      struct xdp_buff *xdp)
f8b45b74cc6229 Alexander Duyck  2017-04-05  2225  {
cc5b114dcf986b Daniel Borkmann  2018-05-28  2226  	unsigned int metasize = xdp->data - xdp->data_meta;
83014323c642b8 Tirthendu Sarkar 2024-01-24  2227  	struct skb_shared_info *sinfo;
f8b45b74cc6229 Alexander Duyck  2017-04-05  2228  	struct sk_buff *skb;
83014323c642b8 Tirthendu Sarkar 2024-01-24  2229  	u32 nr_frags;
f8b45b74cc6229 Alexander Duyck  2017-04-05  2230  
cc5b114dcf986b Daniel Borkmann  2018-05-28  2231  	/* Prefetch first cache line of first page. If xdp->data_meta
cc5b114dcf986b Daniel Borkmann  2018-05-28  2232  	 * is unused, this points exactly as xdp->data, otherwise we
cc5b114dcf986b Daniel Borkmann  2018-05-28  2233  	 * likely have a consumer accessing first few bytes of meta
cc5b114dcf986b Daniel Borkmann  2018-05-28  2234  	 * data, and then actual data.
cc5b114dcf986b Daniel Borkmann  2018-05-28  2235  	 */
f468f21b7af0fa Tariq Toukan     2020-08-26  2236  	net_prefetch(xdp->data_meta);
f468f21b7af0fa Tariq Toukan     2020-08-26  2237  
83014323c642b8 Tirthendu Sarkar 2024-01-24  2238  	if (unlikely(xdp_buff_has_frags(xdp))) {
83014323c642b8 Tirthendu Sarkar 2024-01-24  2239  		sinfo = xdp_get_shared_info_from_buff(xdp);
83014323c642b8 Tirthendu Sarkar 2024-01-24  2240  		nr_frags = sinfo->nr_frags;
83014323c642b8 Tirthendu Sarkar 2024-01-24  2241  	}
83014323c642b8 Tirthendu Sarkar 2024-01-24  2242  
f8b45b74cc6229 Alexander Duyck  2017-04-05  2243  	/* build an skb around the page buffer */
2bc0de9aca3ebd Tirthendu Sarkar 2023-03-10  2244  	skb = napi_build_skb(xdp->data_hard_start, xdp->frame_sz);
f8b45b74cc6229 Alexander Duyck  2017-04-05  2245  	if (unlikely(!skb))
f8b45b74cc6229 Alexander Duyck  2017-04-05  2246  		return NULL;
f8b45b74cc6229 Alexander Duyck  2017-04-05  2247  
f8b45b74cc6229 Alexander Duyck  2017-04-05  2248  	/* update pointers within the skb to store the data */
c51818d5b79330 Daniel Borkmann  2018-06-19  2249  	skb_reserve(skb, xdp->data - xdp->data_hard_start);
cc5b114dcf986b Daniel Borkmann  2018-05-28  2250  	__skb_put(skb, xdp->data_end - xdp->data);
cc5b114dcf986b Daniel Borkmann  2018-05-28  2251  	if (metasize)
cc5b114dcf986b Daniel Borkmann  2018-05-28  2252  		skb_metadata_set(skb, metasize);
f8b45b74cc6229 Alexander Duyck  2017-04-05  2253  
e213ced19befc0 Tirthendu Sarkar 2023-03-10  2254  	if (unlikely(xdp_buff_has_frags(xdp))) {
e213ced19befc0 Tirthendu Sarkar 2023-03-10  2255  		xdp_update_skb_shared_info(skb, nr_frags,
e213ced19befc0 Tirthendu Sarkar 2023-03-10 @2256  					   sinfo->xdp_frags_size,
e213ced19befc0 Tirthendu Sarkar 2023-03-10  2257  					   nr_frags * xdp->frame_sz,
e213ced19befc0 Tirthendu Sarkar 2023-03-10  2258  					   xdp_buff_is_frag_pfmemalloc(xdp));
f8b45b74cc6229 Alexander Duyck  2017-04-05  2259  
e213ced19befc0 Tirthendu Sarkar 2023-03-10  2260  		i40e_process_rx_buffs(rx_ring, I40E_XDP_PASS, xdp);
1a557afc4dd59b Jesse Brandeburg 2016-04-20  2261  	} else {
e213ced19befc0 Tirthendu Sarkar 2023-03-10  2262  		struct i40e_rx_buffer *rx_buffer;
e213ced19befc0 Tirthendu Sarkar 2023-03-10  2263  
e213ced19befc0 Tirthendu Sarkar 2023-03-10  2264  		rx_buffer = i40e_rx_bi(rx_ring, rx_ring->next_to_clean);
e213ced19befc0 Tirthendu Sarkar 2023-03-10  2265  		/* buffer is used by skb, update page_offset */
e213ced19befc0 Tirthendu Sarkar 2023-03-10  2266  		i40e_rx_buffer_flip(rx_buffer, xdp->frame_sz);
1a557afc4dd59b Jesse Brandeburg 2016-04-20  2267  	}
e213ced19befc0 Tirthendu Sarkar 2023-03-10  2268  
e213ced19befc0 Tirthendu Sarkar 2023-03-10  2269  	return skb;
6d7aad1da2791c Björn Töpel      2018-08-28  2270  }
1a557afc4dd59b Jesse Brandeburg 2016-04-20  2271  

:::::: The code at line 2256 was first introduced by commit
:::::: e213ced19befc09d6d6913799053b67896596cd1 i40e: add support for XDP multi-buffer Rx

:::::: TO: Tirthendu Sarkar <tirthendu.sarkar@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
