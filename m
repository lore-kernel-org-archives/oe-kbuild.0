Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2883944C68
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Jun 2024 05:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717651805; cv=none; b=dcMzc6LRKn7UN5mXPUyu1ymI8CdI7eHxzpPNy12gwaYn0Xo2yZ58/jDmk14iJSeE8XEWa6BXUe0t6zH4hG1pe2folU3JXPRFHgBKCdcxLbS+chgu3NzXMx6RwSk+dxZ2hl+r1E7eiM6nyuOMHefn5PCo8M6VvgYTDq4sfrheHR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717651805; c=relaxed/simple;
	bh=P0WScf3AEKufxo7lgfPxaaFWml/youNY6FokZ5sPhG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EYXyRcBTEwPTnGyA9Lj7ewesLTO4S2wTO2PLkpp+Kt8YBfnosyTjc2Ocw+00VmH/T5jt+j9Tc1vv3TGVzJWW7UkhyggEjefMQo6CxvaxaCD4yUsI/FWIC4jey0aatMEfPTJFCX5VXCbFRFMSD/LkQzd++fmpAMTPdvWHLTnDc3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwDwxUFe; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwDwxUFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717651804; x=1749187804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P0WScf3AEKufxo7lgfPxaaFWml/youNY6FokZ5sPhG4=;
  b=cwDwxUFeByz/fS/69Z26cdfoESuJc4bKiVlXttWoXpEaV3xG4MJ8bvpg
   mwEAqxItu0i0upR+rJFRoXVRMie7ceOVwvVAbttTYDvVWy9Bul5J+6J3F
   iUuaz/isBh9vqJ1tpchOdCpNAYEqu7zTwaUic/uClr4lxpWtm36YvoS1V
   MPfd5HtGX355e7GYa9oCcJYDT4E4UBEe9icsHM96V4AughI436qufwFJC
   /Q1J8Z/nk3TUAs8fjzJ56YJAp3zCnld7HNgXWF/PwXNLTbBdtWQGpEmQU
   DwSAMSDBzc+qfwDpr6CfZRqzCnXZDTnhC5yz23dFgfQ46bCGsKerhXvAP
   Q==;
X-CSE-ConnectionGUID: 8MOZByrcQoSO9uggJMc2rw==
X-CSE-MsgGUID: 1c20Q8LJR8uQUAsiYC6v8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14430589"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="14430589"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 22:30:03 -0700
X-CSE-ConnectionGUID: bAcQYTjoQ7qAWTPt7AE82Q==
X-CSE-MsgGUID: ucEZ8hRWSx6oJpKIHxc2ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="68657005"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Jun 2024 22:30:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF5hH-0002ho-11;
	Thu, 06 Jun 2024 05:29:59 +0000
Date: Thu, 6 Jun 2024 13:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/3] net: core: Implement dstats-type stats collections
Message-ID: <202406061253.ZgaLHWWp-lkp@intel.com>
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
In-Reply-To: <20240605-dstats-v1-2-1024396e1670@codeconstruct.com.au>
References: <20240605-dstats-v1-2-1024396e1670@codeconstruct.com.au>
TO: Jeremy Kerr <jk@codeconstruct.com.au>
TO: David Ahern <dsahern@kernel.org>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>

Hi Jeremy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 32f88d65f01bf6f45476d7edbe675e44fb9e1d58]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Kerr/net-core-vrf-Change-pcpu_dstat-fields-to-u64_stats_t/20240605-143942
base:   32f88d65f01bf6f45476d7edbe675e44fb9e1d58
patch link:    https://lore.kernel.org/r/20240605-dstats-v1-2-1024396e1670%40codeconstruct.com.au
patch subject: [PATCH 2/3] net: core: Implement dstats-type stats collections
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: x86_64-randconfig-161-20240606 (https://download.01.org/0day-ci/archive/20240606/202406061253.ZgaLHWWp-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406061253.ZgaLHWWp-lkp@intel.com/

smatch warnings:
net/core/dev.c:10871 dev_fetch_dstats() error: uninitialized symbol 'dstats'.

vim +/dstats +10871 net/core/dev.c

a18394269fc8727 Heiner Kallweit 2020-11-07  10851  
85bc70c64e8362d Jeremy Kerr     2024-06-05  10852  /**
85bc70c64e8362d Jeremy Kerr     2024-06-05  10853   *	dev_fetch_dstats - collate per-cpu network dstats statistics
85bc70c64e8362d Jeremy Kerr     2024-06-05  10854   *	@s: place to store stats
85bc70c64e8362d Jeremy Kerr     2024-06-05  10855   *	@dstats: per-cpu network stats to read from
85bc70c64e8362d Jeremy Kerr     2024-06-05  10856   *
85bc70c64e8362d Jeremy Kerr     2024-06-05  10857   *	Read per-cpu network statistics from dev->dstats and populate the
85bc70c64e8362d Jeremy Kerr     2024-06-05  10858   *	related fields in @s.
85bc70c64e8362d Jeremy Kerr     2024-06-05  10859   */
85bc70c64e8362d Jeremy Kerr     2024-06-05  10860  void dev_fetch_dstats(struct rtnl_link_stats64 *s,
85bc70c64e8362d Jeremy Kerr     2024-06-05  10861  		      const struct pcpu_dstats __percpu *dstats)
85bc70c64e8362d Jeremy Kerr     2024-06-05  10862  {
85bc70c64e8362d Jeremy Kerr     2024-06-05  10863  	int cpu;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10864  
85bc70c64e8362d Jeremy Kerr     2024-06-05  10865  	for_each_possible_cpu(cpu) {
85bc70c64e8362d Jeremy Kerr     2024-06-05  10866  		u64 rx_packets, rx_bytes, rx_drops;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10867  		u64 tx_packets, tx_bytes, tx_drops;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10868  		const struct pcpu_dstats *dstats;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10869  		unsigned int start;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10870  
85bc70c64e8362d Jeremy Kerr     2024-06-05 @10871  		dstats = per_cpu_ptr(dstats, cpu);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10872  		do {
85bc70c64e8362d Jeremy Kerr     2024-06-05  10873  			start = u64_stats_fetch_begin(&dstats->syncp);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10874  			rx_packets = u64_stats_read(&dstats->rx_packets);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10875  			rx_bytes   = u64_stats_read(&dstats->rx_bytes);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10876  			rx_drops   = u64_stats_read(&dstats->rx_drops);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10877  			tx_packets = u64_stats_read(&dstats->tx_packets);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10878  			tx_bytes   = u64_stats_read(&dstats->tx_bytes);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10879  			tx_drops   = u64_stats_read(&dstats->tx_drops);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10880  		} while (u64_stats_fetch_retry(&dstats->syncp, start));
85bc70c64e8362d Jeremy Kerr     2024-06-05  10881  
85bc70c64e8362d Jeremy Kerr     2024-06-05  10882  		s->rx_packets += rx_packets;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10883  		s->rx_bytes   += rx_bytes;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10884  		s->rx_dropped += rx_drops;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10885  		s->tx_packets += tx_packets;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10886  		s->tx_bytes   += tx_bytes;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10887  		s->tx_dropped += tx_drops;
85bc70c64e8362d Jeremy Kerr     2024-06-05  10888  	}
85bc70c64e8362d Jeremy Kerr     2024-06-05  10889  }
85bc70c64e8362d Jeremy Kerr     2024-06-05  10890  EXPORT_SYMBOL_GPL(dev_fetch_dstats);
85bc70c64e8362d Jeremy Kerr     2024-06-05  10891  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
