Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C85D13790B
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 02:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729564812; cv=none; b=B/lnCdy1HOQwP41DUwp2VmHCL656R7JqYj2QtHaFGy2NE3BQzr/PFw0f06OpRZSHo4U1OcMcziJDPG2sEd7cSxTZPxt9w1sTSm6pM0uDiUroRVX/oNkL3Yt4OBc9PRIy8QaP5rXjtRywHQLxUV6oLGogtdTuo0mHNQDoujD32c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729564812; c=relaxed/simple;
	bh=tbWXfOUY6RTRkbPiG9mRFKr+L4DlltM5F94fQxnuUu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p/eeJzjToTg7VtorZVhLhUcZoD2geZkxjudEkozgfD4NR4QbKclrizn03zIL4zGYxUEpkS0WxWP4gP8mmtiIMz2bbO2K6qMPDXb9XIyykQeOFsM9mWplxogBJb4oop4gKe4Ubn5U8meMZt+tBVNVakLha9LDljyysd2Ujv6TY/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QplH2c88; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QplH2c88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729564809; x=1761100809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tbWXfOUY6RTRkbPiG9mRFKr+L4DlltM5F94fQxnuUu8=;
  b=QplH2c881mfg0MDhBoOtyoDfsLmi0KPqVccpKv2FR2C+s/cHyfJoT7uX
   UKtdXUBdeHr9UIxR+cgGkkg9jWo/VVQszjKufk+GA4vlLSJdlrTlrmolm
   0Y2Iyu1CxBUM+sYYM2YRI0johHOAaWpC1+YbpFnW25JTSF693tKCvXmrI
   UUio2Fm36c2oJbcEi38KTMXkrhcb+dtLNyQR8U0m8l1iRJyI7GCLK1Wx6
   rHQ5OK5cYED85zYEgy7liDeevk43EYz6Yk911+IhsPayTwZupVrBOVxJL
   PDag2qDaN2oVksya3kxb8PsQo5wEslHPOO15/2GcuswIiP54pp/+caKAe
   w==;
X-CSE-ConnectionGUID: VVPex5g1Sr+h0k2N11Selw==
X-CSE-MsgGUID: w3163gbYTryNfsYH+ehwXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="28528838"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="28528838"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 19:40:08 -0700
X-CSE-ConnectionGUID: 3gZBl/7lR8uACzPJ4iuQhw==
X-CSE-MsgGUID: xNiV8H7dTWOjYR2u4Bvz7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="79290558"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Oct 2024 19:40:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t34oX-000Sws-0Q;
	Tue, 22 Oct 2024 02:40:05 +0000
Date: Tue, 22 Oct 2024 10:39:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [Intel-wired-lan] [PATCH v2 net 4/4] ixgbevf: Fix passing 0 to
 ERR_PTR in ixgbevf_run_xdp()
Message-ID: <202410221024.A8xUlHZf-lkp@intel.com>
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
In-Reply-To: <20241018023734.1912166-5-yuehaibing@huawei.com>
References: <20241018023734.1912166-5-yuehaibing@huawei.com>
TO: Yue Haibing <yuehaibing@huawei.com>

Hi Yue,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Yue-Haibing/igc-Fix-passing-0-to-ERR_PTR-in-igc_xdp_run_prog/20241018-102304
base:   net/main
patch link:    https://lore.kernel.org/r/20241018023734.1912166-5-yuehaibing%40huawei.com
patch subject: [Intel-wired-lan] [PATCH v2 net 4/4] ixgbevf: Fix passing 0 to ERR_PTR in ixgbevf_run_xdp()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-r072-20241021 (https://download.01.org/0day-ci/archive/20241022/202410221024.A8xUlHZf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410221024.A8xUlHZf-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:1168 ixgbevf_clean_rx_irq() error: uninitialized symbol 'xdp_res'.

Old smatch warnings:
drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:1597 ixgbevf_request_msix_irqs() warn: 'entry->vector' from request_irq() not released on lines: 1597.

vim +/xdp_res +1168 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c

21092e9ce8b139 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1110  
08e50a20ed05fb drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Jacob Keller           2013-09-21  1111  static int ixgbevf_clean_rx_irq(struct ixgbevf_q_vector *q_vector,
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1112  				struct ixgbevf_ring *rx_ring,
fa71ae270a9af0 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Alexander Duyck        2012-05-11  1113  				int budget)
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1114  {
43b5169d8355cc drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Lorenzo Bianconi       2020-12-22  1115  	unsigned int total_rx_bytes = 0, total_rx_packets = 0, frame_sz = 0;
21092e9ce8b139 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1116  	struct ixgbevf_adapter *adapter = q_vector->adapter;
bafa578fdfb2e9 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1117  	u16 cleaned_count = ixgbevf_desc_unused(rx_ring);
bad17234ba702a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-21  1118  	struct sk_buff *skb = rx_ring->skb;
efecfd5f803d59 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1119  	bool xdp_xmit = false;
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1120  	struct xdp_buff xdp;
57047ee64d6cf0 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Yue Haibing            2024-10-18  1121  	int xdp_res;
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1122  
81f3c6283cff03 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Jesper Dangaard Brouer 2020-05-14  1123  	/* Frame size depend on rx_ring setup when PAGE_SIZE=4K */
81f3c6283cff03 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Jesper Dangaard Brouer 2020-05-14  1124  #if (PAGE_SIZE < 8192)
43b5169d8355cc drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Lorenzo Bianconi       2020-12-22  1125  	frame_sz = ixgbevf_rx_frame_truesize(rx_ring, 0);
81f3c6283cff03 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Jesper Dangaard Brouer 2020-05-14  1126  #endif
43b5169d8355cc drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Lorenzo Bianconi       2020-12-22  1127  	xdp_init_buff(&xdp, frame_sz, &rx_ring->xdp_rxq);
81f3c6283cff03 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Jesper Dangaard Brouer 2020-05-14  1128  
6622402a72580a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1129  	while (likely(total_rx_packets < budget)) {
925f5690ff5d5a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2018-01-30  1130  		struct ixgbevf_rx_buffer *rx_buffer;
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1131  		union ixgbe_adv_rx_desc *rx_desc;
925f5690ff5d5a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2018-01-30  1132  		unsigned int size;
b97fe3b1aff819 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1133  
0579eefca75304 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1134  		/* return some buffers to hardware, one at a time is too slow */
0579eefca75304 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1135  		if (cleaned_count >= IXGBEVF_RX_BUFFER_WRITE) {
0579eefca75304 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1136  			ixgbevf_alloc_rx_buffers(rx_ring, cleaned_count);
0579eefca75304 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1137  			cleaned_count = 0;
0579eefca75304 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1138  		}
0579eefca75304 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1139  
bad17234ba702a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-21  1140  		rx_desc = IXGBEVF_RX_DESC(rx_ring, rx_ring->next_to_clean);
925f5690ff5d5a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2018-01-30  1141  		size = le16_to_cpu(rx_desc->wb.upper.length);
925f5690ff5d5a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2018-01-30  1142  		if (!size)
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1143  			break;
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1144  
0579eefca75304 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1145  		/* This memory barrier is needed to keep us from reading
0579eefca75304 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1146  		 * any other fields out of the rx_desc until we know the
0579eefca75304 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1147  		 * RXD_STAT_DD bit is set
0579eefca75304 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1148  		 */
0579eefca75304 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1149  		rmb();
ec62fe264110a0 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1150  
925f5690ff5d5a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2018-01-30  1151  		rx_buffer = ixgbevf_get_rx_buffer(rx_ring, size);
925f5690ff5d5a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2018-01-30  1152  
bad17234ba702a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-21  1153  		/* retrieve a buffer from the ring */
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1154  		if (!skb) {
be9df4aff65f18 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Lorenzo Bianconi       2020-12-22  1155  			unsigned int offset = ixgbevf_rx_offset(rx_ring);
be9df4aff65f18 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Lorenzo Bianconi       2020-12-22  1156  			unsigned char *hard_start;
be9df4aff65f18 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Lorenzo Bianconi       2020-12-22  1157  
be9df4aff65f18 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Lorenzo Bianconi       2020-12-22  1158  			hard_start = page_address(rx_buffer->page) +
be9df4aff65f18 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Lorenzo Bianconi       2020-12-22  1159  				     rx_buffer->page_offset - offset;
be9df4aff65f18 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Lorenzo Bianconi       2020-12-22  1160  			xdp_prepare_buff(&xdp, hard_start, offset, size, true);
81f3c6283cff03 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Jesper Dangaard Brouer 2020-05-14  1161  #if (PAGE_SIZE > 4096)
81f3c6283cff03 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Jesper Dangaard Brouer 2020-05-14  1162  			/* At larger PAGE_SIZE, frame_sz depend on len size */
81f3c6283cff03 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Jesper Dangaard Brouer 2020-05-14  1163  			xdp.frame_sz = ixgbevf_rx_frame_truesize(rx_ring, size);
81f3c6283cff03 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Jesper Dangaard Brouer 2020-05-14  1164  #endif
57047ee64d6cf0 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Yue Haibing            2024-10-18  1165  			xdp_res = ixgbevf_run_xdp(adapter, rx_ring, &xdp);
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1166  		}
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1167  
57047ee64d6cf0 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Yue Haibing            2024-10-18 @1168  		if (xdp_res) {
57047ee64d6cf0 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Yue Haibing            2024-10-18  1169  			if (xdp_res == IXGBEVF_XDP_TX) {
efecfd5f803d59 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1170  				xdp_xmit = true;
21092e9ce8b139 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1171  				ixgbevf_rx_buffer_flip(rx_ring, rx_buffer,
21092e9ce8b139 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1172  						       size);
efecfd5f803d59 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1173  			} else {
21092e9ce8b139 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1174  				rx_buffer->pagecnt_bias++;
efecfd5f803d59 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1175  			}
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1176  			total_rx_packets++;
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1177  			total_rx_bytes += size;
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1178  		} else if (skb) {
925f5690ff5d5a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2018-01-30  1179  			ixgbevf_add_rx_frag(rx_ring, rx_buffer, skb, size);
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1180  		} else if (ring_uses_build_skb(rx_ring)) {
6d9c02171a8081 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2018-01-30  1181  			skb = ixgbevf_build_skb(rx_ring, rx_buffer,
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1182  						&xdp, rx_desc);
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1183  		} else {
925f5690ff5d5a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2018-01-30  1184  			skb = ixgbevf_construct_skb(rx_ring, rx_buffer,
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1185  						    &xdp, rx_desc);
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1186  		}
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1187  
bad17234ba702a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-21  1188  		/* exit if we failed to retrieve a buffer */
57047ee64d6cf0 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Yue Haibing            2024-10-18  1189  		if (!xdp_res && !skb) {
2a35efe582116a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2017-12-11  1190  			rx_ring->rx_stats.alloc_rx_buff_failed++;
925f5690ff5d5a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2018-01-30  1191  			rx_buffer->pagecnt_bias++;
bad17234ba702a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-21  1192  			break;
2a35efe582116a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2017-12-11  1193  		}
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1194  
c7aec59657b60f drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1195  		ixgbevf_put_rx_buffer(rx_ring, rx_buffer, skb);
b97fe3b1aff819 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1196  		cleaned_count++;
b97fe3b1aff819 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1197  
bad17234ba702a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-21  1198  		/* fetch next buffer in frame if non-eop */
bad17234ba702a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-21  1199  		if (ixgbevf_is_non_eop(rx_ring, rx_desc))
0579eefca75304 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1200  			continue;
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1201  
bad17234ba702a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-21  1202  		/* verify the packet layout is correct */
57047ee64d6cf0 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Yue Haibing            2024-10-18  1203  		if (xdp_res || ixgbevf_cleanup_headers(rx_ring, rx_desc, skb)) {
bad17234ba702a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-21  1204  			skb = NULL;
0579eefca75304 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1205  			continue;
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1206  		}
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1207  
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1208  		/* probably a little skewed due to removing CRC */
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1209  		total_rx_bytes += skb->len;
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1210  
815cccbf10b271 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c John Fastabend         2012-10-24  1211  		/* Workaround hardware that can't do proper VEPA multicast
815cccbf10b271 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c John Fastabend         2012-10-24  1212  		 * source pruning.
815cccbf10b271 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c John Fastabend         2012-10-24  1213  		 */
bd9d55929df54b drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Florian Fainelli       2014-02-28  1214  		if ((skb->pkt_type == PACKET_BROADCAST ||
bd9d55929df54b drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Florian Fainelli       2014-02-28  1215  		     skb->pkt_type == PACKET_MULTICAST) &&
095e2617cee0e0 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-01-17  1216  		    ether_addr_equal(rx_ring->netdev->dev_addr,
7367d0b573d149 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Joe Perches            2013-09-01  1217  				     eth_hdr(skb)->h_source)) {
815cccbf10b271 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c John Fastabend         2012-10-24  1218  			dev_kfree_skb_irq(skb);
0579eefca75304 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1219  			continue;
815cccbf10b271 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c John Fastabend         2012-10-24  1220  		}
815cccbf10b271 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c John Fastabend         2012-10-24  1221  
dff80520335ac7 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1222  		/* populate checksum, VLAN, and protocol */
dff80520335ac7 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1223  		ixgbevf_process_skb_fields(rx_ring, rx_desc, skb);
dff80520335ac7 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1224  
dff80520335ac7 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1225  		ixgbevf_rx_skb(q_vector, skb);
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1226  
bad17234ba702a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-21  1227  		/* reset skb pointer */
bad17234ba702a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-21  1228  		skb = NULL;
bad17234ba702a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-21  1229  
0579eefca75304 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1230  		/* update budget accounting */
6622402a72580a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1231  		total_rx_packets++;
6622402a72580a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-08  1232  	}
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1233  
bad17234ba702a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-21  1234  	/* place incomplete frames back on ring for completion */
bad17234ba702a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-21  1235  	rx_ring->skb = skb;
bad17234ba702a drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-11-21  1236  
efecfd5f803d59 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1237  	if (xdp_xmit) {
efecfd5f803d59 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1238  		struct ixgbevf_ring *xdp_ring =
efecfd5f803d59 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1239  			adapter->xdp_ring[rx_ring->queue_index];
efecfd5f803d59 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1240  
efecfd5f803d59 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1241  		/* Force memory writes to complete before letting h/w
efecfd5f803d59 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1242  		 * know there are new descriptors to fetch.
efecfd5f803d59 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1243  		 */
efecfd5f803d59 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1244  		wmb();
efecfd5f803d59 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1245  		ixgbevf_write_tail(xdp_ring, xdp_ring->next_to_use);
efecfd5f803d59 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1246  	}
efecfd5f803d59 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Tony Nguyen            2018-03-16  1247  
4197aa7bb81877 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Eric Dumazet           2011-06-22  1248  	u64_stats_update_begin(&rx_ring->syncp);
095e2617cee0e0 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-01-17  1249  	rx_ring->stats.packets += total_rx_packets;
095e2617cee0e0 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Emil Tantilov          2014-01-17  1250  	rx_ring->stats.bytes += total_rx_bytes;
4197aa7bb81877 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Eric Dumazet           2011-06-22  1251  	u64_stats_update_end(&rx_ring->syncp);
ac6ed8f00aca7d drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Greg Rose              2012-08-31  1252  	q_vector->rx.total_packets += total_rx_packets;
ac6ed8f00aca7d drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Greg Rose              2012-08-31  1253  	q_vector->rx.total_bytes += total_rx_bytes;
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1254  
08e50a20ed05fb drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c Jacob Keller           2013-09-21  1255  	return total_rx_packets;
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1256  }
92915f71201b43 drivers/net/ixgbevf/ixgbevf_main.c                Greg Rose              2010-01-09  1257  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
