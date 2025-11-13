Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4673009F1
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 06:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763015914; cv=none; b=LNdCqXJjxH7Vt15IblO578Fs3Ed36QXl7klauGYzZ+CO1vyOpejpjaixqNHm9hqWf4TL8Ft98beTHgBXtE2qTAbaGjvdeG/W+nTHgyxr8xvZnu4I5L1yjQWPIRAflLlrlYcunFve8BZWFd3Kh5SkoLYT3Jwfex8SwNoClke2Pm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763015914; c=relaxed/simple;
	bh=VTq7BGeCxjHGhTKq8a42oAMhipferpRyms3GWAKy9T8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AzkgYbieWKLviz30PJ2gVUjKEpu4tGpATN8weLCFEikBhglDi91xK0LNKO501BOMh2h3jlUsNxhUQwrd7feZiivPVyaz+TbQuAQgCHD6dVKoDcsnKlxlBEPZmYVNpeIld0t2ln8CTbUJZ9Am5hjguayE04JQAE7NEbp7TzEK3dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OivVaALy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OivVaALy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763015912; x=1794551912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VTq7BGeCxjHGhTKq8a42oAMhipferpRyms3GWAKy9T8=;
  b=OivVaALybkyrnOS+MsE8rtiF3u1bxw6cJd3hGzRdIYkY3DsNDGesdF6X
   1obEheyM6DnUZXQQFsCCC0AW6HJbagNE4KuLTnuaCiyjEpqGCjhPFR+ui
   xw4lTFWKelr2gluUIwHz3Ysz67XQ4B4NexENUjyKHai2hrJPn8R6Fpmqk
   X60hWrQ3aGP5xINSkKxm/n5ocTprh8FUiAIbdbcENXfbsa+G2YvyGUqqB
   LQYfG7p5KcD3zB4ey8mQimxsCjuHaq7bOrCpaL/0Knir935ibOYq73uws
   u7K8qM7XAVhNigvJfZBexKnTxLBkKk3WRzHSwFezTx0/k/xxr2YTMzqVa
   A==;
X-CSE-ConnectionGUID: C46D20ciQYeoesKDJf2HuA==
X-CSE-MsgGUID: oQrDLSnNTMmkdibFO4q4VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65125357"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65125357"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 22:38:32 -0800
X-CSE-ConnectionGUID: 4O05IpgvTD2ZPxH12mCQOQ==
X-CSE-MsgGUID: LYq2vcJySKSi5zlYtEaLMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="193677532"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Nov 2025 22:38:30 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJQyS-0004yx-1v;
	Thu, 13 Nov 2025 06:38:28 +0000
Date: Thu, 13 Nov 2025 14:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [net-next 12/12] bng_en: Query firmware for statistics and
 accumulate
Message-ID: <202511131404.HRlY9uYn-lkp@intel.com>
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
In-Reply-To: <20251111205829.97579-13-bhargava.marreddy@broadcom.com>
References: <20251111205829.97579-13-bhargava.marreddy@broadcom.com>
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
CC: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>

Hi Bhargava,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Bhargava-Marreddy/bng_en-Query-PHY-and-report-link-status/20251112-050616
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251111205829.97579-13-bhargava.marreddy%40broadcom.com
patch subject: [net-next 12/12] bng_en: Query firmware for statistics and accumulate
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-161-20251113 (https://download.01.org/0day-ci/archive/20251113/202511131404.HRlY9uYn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511131404.HRlY9uYn-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/broadcom/bnge/bnge_netdev.c:337 bnge_accumulate_all_stats() error: uninitialized symbol 'ring0_stats'.

Old smatch warnings:
drivers/net/ethernet/broadcom/bnge/bnge_netdev.c:2551 bnge_request_irq() warn: 'irq->vector' from request_irq() not released on lines: 2551.

vim +/ring0_stats +337 drivers/net/ethernet/broadcom/bnge/bnge_netdev.c

b209a64e2c958b Bhargava Marreddy 2025-11-12  320  
b209a64e2c958b Bhargava Marreddy 2025-11-12  321  static void bnge_accumulate_all_stats(struct bnge_dev *bd)
b209a64e2c958b Bhargava Marreddy 2025-11-12  322  {
b209a64e2c958b Bhargava Marreddy 2025-11-12  323  	struct bnge_net *bn = netdev_priv(bd->netdev);
b209a64e2c958b Bhargava Marreddy 2025-11-12  324  	struct bnge_stats_mem *ring0_stats;
b209a64e2c958b Bhargava Marreddy 2025-11-12  325  	int i;
b209a64e2c958b Bhargava Marreddy 2025-11-12  326  
b209a64e2c958b Bhargava Marreddy 2025-11-12  327  	for (i = 0; i < bd->nq_nr_rings; i++) {
b209a64e2c958b Bhargava Marreddy 2025-11-12  328  		struct bnge_napi *bnapi = bn->bnapi[i];
b209a64e2c958b Bhargava Marreddy 2025-11-12  329  		struct bnge_nq_ring_info *nqr;
b209a64e2c958b Bhargava Marreddy 2025-11-12  330  		struct bnge_stats_mem *stats;
b209a64e2c958b Bhargava Marreddy 2025-11-12  331  
b209a64e2c958b Bhargava Marreddy 2025-11-12  332  		nqr = &bnapi->nq_ring;
b209a64e2c958b Bhargava Marreddy 2025-11-12  333  		stats = &nqr->stats;
b209a64e2c958b Bhargava Marreddy 2025-11-12  334  		if (!i)
b209a64e2c958b Bhargava Marreddy 2025-11-12  335  			ring0_stats = stats;
b209a64e2c958b Bhargava Marreddy 2025-11-12  336  		__bnge_accumulate_stats(stats->hw_stats, stats->sw_stats,
b209a64e2c958b Bhargava Marreddy 2025-11-12 @337  					ring0_stats->hw_masks,
b209a64e2c958b Bhargava Marreddy 2025-11-12  338  					ring0_stats->len / 8);
b209a64e2c958b Bhargava Marreddy 2025-11-12  339  	}
b209a64e2c958b Bhargava Marreddy 2025-11-12  340  	if (bn->flags & BNGE_FLAG_PORT_STATS) {
b209a64e2c958b Bhargava Marreddy 2025-11-12  341  		struct bnge_stats_mem *stats = &bn->port_stats;
b209a64e2c958b Bhargava Marreddy 2025-11-12  342  		__le64 *hw_stats = stats->hw_stats;
b209a64e2c958b Bhargava Marreddy 2025-11-12  343  		u64 *sw_stats = stats->sw_stats;
b209a64e2c958b Bhargava Marreddy 2025-11-12  344  		u64 *masks = stats->hw_masks;
b209a64e2c958b Bhargava Marreddy 2025-11-12  345  		int cnt;
b209a64e2c958b Bhargava Marreddy 2025-11-12  346  
b209a64e2c958b Bhargava Marreddy 2025-11-12  347  		cnt = sizeof(struct rx_port_stats) / 8;
b209a64e2c958b Bhargava Marreddy 2025-11-12  348  		__bnge_accumulate_stats(hw_stats, sw_stats, masks, cnt);
b209a64e2c958b Bhargava Marreddy 2025-11-12  349  
b209a64e2c958b Bhargava Marreddy 2025-11-12  350  		hw_stats += BNGE_TX_PORT_STATS_BYTE_OFFSET / 8;
b209a64e2c958b Bhargava Marreddy 2025-11-12  351  		sw_stats += BNGE_TX_PORT_STATS_BYTE_OFFSET / 8;
b209a64e2c958b Bhargava Marreddy 2025-11-12  352  		masks += BNGE_TX_PORT_STATS_BYTE_OFFSET / 8;
b209a64e2c958b Bhargava Marreddy 2025-11-12  353  		cnt = sizeof(struct tx_port_stats) / 8;
b209a64e2c958b Bhargava Marreddy 2025-11-12  354  		__bnge_accumulate_stats(hw_stats, sw_stats, masks, cnt);
b209a64e2c958b Bhargava Marreddy 2025-11-12  355  	}
b209a64e2c958b Bhargava Marreddy 2025-11-12  356  	if (bn->flags & BNGE_FLAG_PORT_STATS_EXT) {
b209a64e2c958b Bhargava Marreddy 2025-11-12  357  		bnge_accumulate_stats(&bn->rx_port_stats_ext);
b209a64e2c958b Bhargava Marreddy 2025-11-12  358  		bnge_accumulate_stats(&bn->tx_port_stats_ext);
b209a64e2c958b Bhargava Marreddy 2025-11-12  359  	}
b209a64e2c958b Bhargava Marreddy 2025-11-12  360  }
b209a64e2c958b Bhargava Marreddy 2025-11-12  361  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
