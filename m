Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3AD3A269
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Nov 2023 17:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BF/nQsok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699638943; x=1731174943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=96XKw7CDKZ08+svwPdqn0JIqw2uAUlWbggevvAk2CWU=;
  b=BF/nQsok0Cp7PP+erYUtXH0Z6H70uUXG9YVTjcOJ6bAArHWKvkpugcNP
   j7ajkaPhzMb3om86NPUp7fslJ7KgJACwdGVKApMq7U5cSPbKdY5WX+JcV
   i0RxKEW2HYT3YgM/Gduzwpe6jasTu1nI6CRgw8CUoQbMzswM9BV4mXQmQ
   7hlGb1o96O7qOfkS7NYeHgRSQc8jjkf2VfOjIXevcA57O23JyoiIbIeje
   UxUz3pEOQnaUTq2r21s9WBsXu79hyp4v7y36GlCMLtowMBI/CVOYfbDgQ
   Fquskv9efU1XjI0g7FpAuhKLj8Q/HBthtEFi7sooqiduTMJIPPebKX318
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="393087812"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="393087812"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 09:55:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="937221331"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="937221331"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Nov 2023 09:55:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1VjH-0009nR-10;
	Fri, 10 Nov 2023 17:55:39 +0000
Date: Sat, 11 Nov 2023 01:55:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/block/drbd/drbd_receiver.c:4066:17: sparse:    struct
 fifo_buffer *
Message-ID: <202311110117.fn4VxFm9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/block/drbd/drbd_receiver.c:4066:17: sparse:    struct fifo_buffer *"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Joel Fernandes (Google)" <joel@joelfernandes.org>
CC: "Paul E. McKenney" <paulmck@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89cdf9d556016a54ff6ddd62324aa5ec790c05cc
commit: 423a86a610cad121742ebe698ef98a3b4c87b5dd rcu: Add sparse check to rcu_assign_pointer()
date:   4 years, 10 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 4 years, 10 months ago
config: i386-randconfig-062-20230914 (https://download.01.org/0day-ci/archive/20231111/202311110117.fn4VxFm9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110117.fn4VxFm9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311110117.fn4VxFm9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/block/drbd/drbd_receiver.c:886:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:886:14: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:886:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:1051:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:1051:14: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:1051:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:1443:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:1443:14: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:1443:14: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_receiver.c:1598:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:1598:14: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:1598:14: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_receiver.c:1904:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1904:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1904:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1904:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1904:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1904:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1908:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1908:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1908:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1908:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1908:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1908:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1920:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1920:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1920:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1920:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1920:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:1920:22: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:2168:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2168:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2168:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2168:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2168:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2168:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2168:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2168:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2168:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2168:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2202:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2202:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2202:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2202:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2202:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2202:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2202:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2202:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2202:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2202:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2416:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:2416:22: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:2416:22: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:2426:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:2426:27: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:2426:27: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:2605:24: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:2605:24: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:2605:24: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:2605:24: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:2605:24: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:2605:24: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_receiver.c:2633:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2633:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2633:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2633:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2633:18: sparse: sparse: cast to restricted __be64
   drivers/block/drbd/drbd_receiver.c:2633:18: sparse: sparse: too many warnings
   drivers/block/drbd/drbd_receiver.c:2677:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:2677:14: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:2677:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:2809:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:2809:22: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:2809:22: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_receiver.c:3077:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:3077:23: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:3077:23: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:3153:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:3153:23: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:3153:23: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:3210:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:3210:23: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:3210:23: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:3556:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:3556:14: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:3556:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:3714:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:3714:22: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:3714:22: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:3800:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:3800:9: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:3800:9: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:4055:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:4055:25: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:4055:25: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:4060:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:4060:17: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:4060:17: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_receiver.c:4066:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:4066:17: sparse:    struct fifo_buffer [noderef] <asn:4> *
>> drivers/block/drbd/drbd_receiver.c:4066:17: sparse:    struct fifo_buffer *
   drivers/block/drbd/drbd_receiver.c:4143:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:4143:28: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:4143:28: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_receiver.c:4185:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:4185:25: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:4185:25: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_receiver.c:5972:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:5972:14: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:5972:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:6065:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:6065:37: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:6065:37: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:6162:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:6162:14: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_receiver.c:6162:14: sparse:    struct net_conf *
--
   drivers/block/drbd/drbd_nl.c: note: in included file:
   include/linux/genl_magic_func.h:212:12: sparse: sparse: symbol 'drbd_genl_cmd_to_str' was not declared. Should it be static?
   drivers/block/drbd/drbd_nl.c:467:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:467:33: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:467:33: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_nl.c:704:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:704:38: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:704:38: sparse:    struct net_conf *
   drivers/block/drbd/drbd_nl.c:806:40: sparse: sparse: mixing different enum types:
   drivers/block/drbd/drbd_nl.c:806:40: sparse:    int enum drbd_state_rv
   drivers/block/drbd/drbd_nl.c:806:40: sparse:    unsigned int enum drbd_ret_code
   drivers/block/drbd/drbd_nl.c:808:40: sparse: sparse: mixing different enum types:
   drivers/block/drbd/drbd_nl.c:808:40: sparse:    int enum drbd_state_rv
   drivers/block/drbd/drbd_nl.c:808:40: sparse:    unsigned int enum drbd_ret_code
   drivers/block/drbd/drbd_nl.c:993:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:993:18: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:993:18: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_nl.c:1300:41: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_nl.c:1300:41: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_nl.c:1300:41: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_nl.c:1300:41: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_nl.c:1300:41: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_nl.c:1300:41: sparse: sparse: cast to restricted __be32
   drivers/block/drbd/drbd_nl.c:1360:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:1360:22: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:1360:22: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_nl.c:1659:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:1659:17: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:1659:17: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_nl.c:1669:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:1669:17: sparse:    struct fifo_buffer [noderef] <asn:4> *
>> drivers/block/drbd/drbd_nl.c:1669:17: sparse:    struct fifo_buffer *
   drivers/block/drbd/drbd_nl.c:1892:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:1892:14: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:1892:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_nl.c:2151:39: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:2151:39: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:2151:39: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_nl.c:2159:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:2159:13: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:2159:13: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_nl.c:2341:50: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:2341:50: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:2341:50: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_nl.c:2364:45: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:2364:45: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:2364:45: sparse:    struct net_conf *
   drivers/block/drbd/drbd_nl.c:2509:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:2509:9: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:2509:9: sparse:    struct net_conf *
   drivers/block/drbd/drbd_nl.c:2672:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:2672:9: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:2672:9: sparse:    struct net_conf *
   drivers/block/drbd/drbd_nl.c:2824:27: sparse: sparse: mixing different enum types:
   drivers/block/drbd/drbd_nl.c:2904:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:2904:18: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:2904:18: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_nl.c:2944:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:2944:17: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:2944:17: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_nl.c:3488:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:3488:33: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:3488:33: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_nl.c:3613:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:3613:28: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:3613:28: sparse:    struct net_conf *
   drivers/block/drbd/drbd_nl.c:3826:29: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:3826:29: sparse:    struct disk_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:3826:29: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_nl.c:3832:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:3832:22: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:3832:22: sparse:    struct net_conf *
   drivers/block/drbd/drbd_nl.c:4023:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_nl.c:4023:38: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_nl.c:4023:38: sparse:    struct net_conf *
   drivers/block/drbd/drbd_nl.c:463:9: sparse: sparse: context imbalance in 'highest_fencing_policy' - different lock contexts for basic block
   drivers/block/drbd/drbd_nl.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
   arch/x86/include/asm/bitops.h:116:37: sparse: sparse: cast truncates bits from constant value (ffffff7f becomes 7f)
   arch/x86/include/asm/bitops.h:116:37: sparse: sparse: cast truncates bits from constant value (ffffff7f becomes 7f)
   drivers/block/drbd/drbd_nl.c:2206:9: sparse: sparse: context imbalance in 'drbd_adm_attach' - different lock contexts for basic block
   arch/x86/include/asm/bitops.h:116:37: sparse: sparse: cast truncates bits from constant value (ffffff7f becomes 7f)
   drivers/block/drbd/drbd_nl.c: note: in included file:
   drivers/block/drbd/drbd_int.h:2189:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_int.h:2189:14: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_int.h:2189:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_int.h:792:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_int.h:792:24: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_int.h:792:24: sparse:    struct net_conf *
   drivers/block/drbd/drbd_int.h:792:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_int.h:792:24: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_int.h:792:24: sparse:    struct net_conf *
   drivers/block/drbd/drbd_int.h:792:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_int.h:792:24: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_int.h:792:24: sparse:    struct net_conf *
   drivers/block/drbd/drbd_int.h:792:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_int.h:792:24: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_int.h:792:24: sparse:    struct net_conf *
   drivers/block/drbd/drbd_int.h:792:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_int.h:792:24: sparse:    struct net_conf [noderef] <asn:4> *
   drivers/block/drbd/drbd_int.h:792:24: sparse:    struct net_conf *

vim +4066 drivers/block/drbd/drbd_receiver.c

4a76b1612f35d8 Andreas Gruenbacher 2011-03-25  3889  
bde89a9e151b48 Andreas Gruenbacher 2011-05-30  3890  static int receive_SyncParam(struct drbd_connection *connection, struct packet_info *pi)
4a76b1612f35d8 Andreas Gruenbacher 2011-03-25  3891  {
9f4fe9ad206028 Andreas Gruenbacher 2011-08-09  3892  	struct drbd_peer_device *peer_device;
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  3893  	struct drbd_device *device;
e658983af6e623 Andreas Gruenbacher 2011-03-30  3894  	struct p_rs_param_95 *p;
b411b3637fa71f Philipp Reisner     2009-09-25  3895  	unsigned int header_size, data_size, exp_max_sz;
3d0e63754fa47d Kees Cook           2018-08-06  3896  	struct crypto_shash *verify_tfm = NULL;
3d0e63754fa47d Kees Cook           2018-08-06  3897  	struct crypto_shash *csums_tfm = NULL;
2ec91e0e29a3f1 Philipp Reisner     2011-05-03  3898  	struct net_conf *old_net_conf, *new_net_conf = NULL;
813472ced7fac7 Philipp Reisner     2011-05-03  3899  	struct disk_conf *old_disk_conf = NULL, *new_disk_conf = NULL;
bde89a9e151b48 Andreas Gruenbacher 2011-05-30  3900  	const int apv = connection->agreed_pro_version;
813472ced7fac7 Philipp Reisner     2011-05-03  3901  	struct fifo_buffer *old_plan = NULL, *new_plan = NULL;
778f271dfe7a71 Philipp Reisner     2010-07-06  3902  	int fifo_size = 0;
82bc01940ac914 Andreas Gruenbacher 2011-03-17  3903  	int err;
b411b3637fa71f Philipp Reisner     2009-09-25  3904  
9f4fe9ad206028 Andreas Gruenbacher 2011-08-09  3905  	peer_device = conn_peer_device(connection, pi->vnr);
9f4fe9ad206028 Andreas Gruenbacher 2011-08-09  3906  	if (!peer_device)
bde89a9e151b48 Andreas Gruenbacher 2011-05-30  3907  		return config_unknown_volume(connection, pi);
9f4fe9ad206028 Andreas Gruenbacher 2011-08-09  3908  	device = peer_device->device;
b411b3637fa71f Philipp Reisner     2009-09-25  3909  
b411b3637fa71f Philipp Reisner     2009-09-25  3910  	exp_max_sz  = apv <= 87 ? sizeof(struct p_rs_param)
b411b3637fa71f Philipp Reisner     2009-09-25  3911  		    : apv == 88 ? sizeof(struct p_rs_param)
b411b3637fa71f Philipp Reisner     2009-09-25  3912  					+ SHARED_SECRET_MAX
8e26f9ccb9be00 Philipp Reisner     2010-07-06  3913  		    : apv <= 94 ? sizeof(struct p_rs_param_89)
8e26f9ccb9be00 Philipp Reisner     2010-07-06  3914  		    : /* apv >= 95 */ sizeof(struct p_rs_param_95);
b411b3637fa71f Philipp Reisner     2009-09-25  3915  
e28572167cfd88 Andreas Gruenbacher 2011-03-25  3916  	if (pi->size > exp_max_sz) {
d01801710265cf Andreas Gruenbacher 2011-07-03  3917  		drbd_err(device, "SyncParam packet too long: received %u, expected <= %u bytes\n",
e28572167cfd88 Andreas Gruenbacher 2011-03-25  3918  		    pi->size, exp_max_sz);
82bc01940ac914 Andreas Gruenbacher 2011-03-17  3919  		return -EIO;
b411b3637fa71f Philipp Reisner     2009-09-25  3920  	}
b411b3637fa71f Philipp Reisner     2009-09-25  3921  
b411b3637fa71f Philipp Reisner     2009-09-25  3922  	if (apv <= 88) {
e658983af6e623 Andreas Gruenbacher 2011-03-30  3923  		header_size = sizeof(struct p_rs_param);
e28572167cfd88 Andreas Gruenbacher 2011-03-25  3924  		data_size = pi->size - header_size;
8e26f9ccb9be00 Philipp Reisner     2010-07-06  3925  	} else if (apv <= 94) {
e658983af6e623 Andreas Gruenbacher 2011-03-30  3926  		header_size = sizeof(struct p_rs_param_89);
e28572167cfd88 Andreas Gruenbacher 2011-03-25  3927  		data_size = pi->size - header_size;
0b0ba1efc7b887 Andreas Gruenbacher 2011-06-27  3928  		D_ASSERT(device, data_size == 0);
8e26f9ccb9be00 Philipp Reisner     2010-07-06  3929  	} else {
e658983af6e623 Andreas Gruenbacher 2011-03-30  3930  		header_size = sizeof(struct p_rs_param_95);
e28572167cfd88 Andreas Gruenbacher 2011-03-25  3931  		data_size = pi->size - header_size;
0b0ba1efc7b887 Andreas Gruenbacher 2011-06-27  3932  		D_ASSERT(device, data_size == 0);
b411b3637fa71f Philipp Reisner     2009-09-25  3933  	}
b411b3637fa71f Philipp Reisner     2009-09-25  3934  
b411b3637fa71f Philipp Reisner     2009-09-25  3935  	/* initialize verify_alg and csums_alg */
e658983af6e623 Andreas Gruenbacher 2011-03-30  3936  	p = pi->data;
b411b3637fa71f Philipp Reisner     2009-09-25  3937  	memset(p->verify_alg, 0, 2 * SHARED_SECRET_MAX);
b411b3637fa71f Philipp Reisner     2009-09-25  3938  
9f4fe9ad206028 Andreas Gruenbacher 2011-08-09  3939  	err = drbd_recv_all(peer_device->connection, p, header_size);
82bc01940ac914 Andreas Gruenbacher 2011-03-17  3940  	if (err)
82bc01940ac914 Andreas Gruenbacher 2011-03-17  3941  		return err;
b411b3637fa71f Philipp Reisner     2009-09-25  3942  
0500813fe0c9a6 Andreas Gruenbacher 2011-07-07  3943  	mutex_lock(&connection->resource->conf_update);
9f4fe9ad206028 Andreas Gruenbacher 2011-08-09  3944  	old_net_conf = peer_device->connection->net_conf;
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  3945  	if (get_ldev(device)) {
daeda1cca91d58 Philipp Reisner     2011-05-03  3946  		new_disk_conf = kzalloc(sizeof(struct disk_conf), GFP_KERNEL);
daeda1cca91d58 Philipp Reisner     2011-05-03  3947  		if (!new_disk_conf) {
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  3948  			put_ldev(device);
0500813fe0c9a6 Andreas Gruenbacher 2011-07-07  3949  			mutex_unlock(&connection->resource->conf_update);
d01801710265cf Andreas Gruenbacher 2011-07-03  3950  			drbd_err(device, "Allocation of new disk_conf failed\n");
daeda1cca91d58 Philipp Reisner     2011-05-03  3951  			return -ENOMEM;
f399002e68e626 Lars Ellenberg      2011-03-23  3952  		}
b411b3637fa71f Philipp Reisner     2009-09-25  3953  
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  3954  		old_disk_conf = device->ldev->disk_conf;
daeda1cca91d58 Philipp Reisner     2011-05-03  3955  		*new_disk_conf = *old_disk_conf;
b411b3637fa71f Philipp Reisner     2009-09-25  3956  
6394b9358e6187 Andreas Gruenbacher 2011-05-11  3957  		new_disk_conf->resync_rate = be32_to_cpu(p->resync_rate);
813472ced7fac7 Philipp Reisner     2011-05-03  3958  	}
b411b3637fa71f Philipp Reisner     2009-09-25  3959  
b411b3637fa71f Philipp Reisner     2009-09-25  3960  	if (apv >= 88) {
b411b3637fa71f Philipp Reisner     2009-09-25  3961  		if (apv == 88) {
5de738272e38f7 Philipp Reisner     2012-03-28  3962  			if (data_size > SHARED_SECRET_MAX || data_size == 0) {
d01801710265cf Andreas Gruenbacher 2011-07-03  3963  				drbd_err(device, "verify-alg of wrong size, "
5de738272e38f7 Philipp Reisner     2012-03-28  3964  					"peer wants %u, accepting only up to %u byte\n",
b411b3637fa71f Philipp Reisner     2009-09-25  3965  					data_size, SHARED_SECRET_MAX);
813472ced7fac7 Philipp Reisner     2011-05-03  3966  				err = -EIO;
813472ced7fac7 Philipp Reisner     2011-05-03  3967  				goto reconnect;
b411b3637fa71f Philipp Reisner     2009-09-25  3968  			}
b411b3637fa71f Philipp Reisner     2009-09-25  3969  
9f4fe9ad206028 Andreas Gruenbacher 2011-08-09  3970  			err = drbd_recv_all(peer_device->connection, p->verify_alg, data_size);
813472ced7fac7 Philipp Reisner     2011-05-03  3971  			if (err)
813472ced7fac7 Philipp Reisner     2011-05-03  3972  				goto reconnect;
b411b3637fa71f Philipp Reisner     2009-09-25  3973  			/* we expect NUL terminated string */
b411b3637fa71f Philipp Reisner     2009-09-25  3974  			/* but just in case someone tries to be evil */
0b0ba1efc7b887 Andreas Gruenbacher 2011-06-27  3975  			D_ASSERT(device, p->verify_alg[data_size-1] == 0);
b411b3637fa71f Philipp Reisner     2009-09-25  3976  			p->verify_alg[data_size-1] = 0;
b411b3637fa71f Philipp Reisner     2009-09-25  3977  
b411b3637fa71f Philipp Reisner     2009-09-25  3978  		} else /* apv >= 89 */ {
b411b3637fa71f Philipp Reisner     2009-09-25  3979  			/* we still expect NUL terminated strings */
b411b3637fa71f Philipp Reisner     2009-09-25  3980  			/* but just in case someone tries to be evil */
0b0ba1efc7b887 Andreas Gruenbacher 2011-06-27  3981  			D_ASSERT(device, p->verify_alg[SHARED_SECRET_MAX-1] == 0);
0b0ba1efc7b887 Andreas Gruenbacher 2011-06-27  3982  			D_ASSERT(device, p->csums_alg[SHARED_SECRET_MAX-1] == 0);
b411b3637fa71f Philipp Reisner     2009-09-25  3983  			p->verify_alg[SHARED_SECRET_MAX-1] = 0;
b411b3637fa71f Philipp Reisner     2009-09-25  3984  			p->csums_alg[SHARED_SECRET_MAX-1] = 0;
b411b3637fa71f Philipp Reisner     2009-09-25  3985  		}
b411b3637fa71f Philipp Reisner     2009-09-25  3986  
2ec91e0e29a3f1 Philipp Reisner     2011-05-03  3987  		if (strcmp(old_net_conf->verify_alg, p->verify_alg)) {
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  3988  			if (device->state.conn == C_WF_REPORT_PARAMS) {
d01801710265cf Andreas Gruenbacher 2011-07-03  3989  				drbd_err(device, "Different verify-alg settings. me=\"%s\" peer=\"%s\"\n",
2ec91e0e29a3f1 Philipp Reisner     2011-05-03  3990  				    old_net_conf->verify_alg, p->verify_alg);
b411b3637fa71f Philipp Reisner     2009-09-25  3991  				goto disconnect;
b411b3637fa71f Philipp Reisner     2009-09-25  3992  			}
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  3993  			verify_tfm = drbd_crypto_alloc_digest_safe(device,
b411b3637fa71f Philipp Reisner     2009-09-25  3994  					p->verify_alg, "verify-alg");
b411b3637fa71f Philipp Reisner     2009-09-25  3995  			if (IS_ERR(verify_tfm)) {
b411b3637fa71f Philipp Reisner     2009-09-25  3996  				verify_tfm = NULL;
b411b3637fa71f Philipp Reisner     2009-09-25  3997  				goto disconnect;
b411b3637fa71f Philipp Reisner     2009-09-25  3998  			}
b411b3637fa71f Philipp Reisner     2009-09-25  3999  		}
b411b3637fa71f Philipp Reisner     2009-09-25  4000  
2ec91e0e29a3f1 Philipp Reisner     2011-05-03  4001  		if (apv >= 89 && strcmp(old_net_conf->csums_alg, p->csums_alg)) {
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  4002  			if (device->state.conn == C_WF_REPORT_PARAMS) {
d01801710265cf Andreas Gruenbacher 2011-07-03  4003  				drbd_err(device, "Different csums-alg settings. me=\"%s\" peer=\"%s\"\n",
2ec91e0e29a3f1 Philipp Reisner     2011-05-03  4004  				    old_net_conf->csums_alg, p->csums_alg);
b411b3637fa71f Philipp Reisner     2009-09-25  4005  				goto disconnect;
b411b3637fa71f Philipp Reisner     2009-09-25  4006  			}
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  4007  			csums_tfm = drbd_crypto_alloc_digest_safe(device,
b411b3637fa71f Philipp Reisner     2009-09-25  4008  					p->csums_alg, "csums-alg");
b411b3637fa71f Philipp Reisner     2009-09-25  4009  			if (IS_ERR(csums_tfm)) {
b411b3637fa71f Philipp Reisner     2009-09-25  4010  				csums_tfm = NULL;
b411b3637fa71f Philipp Reisner     2009-09-25  4011  				goto disconnect;
b411b3637fa71f Philipp Reisner     2009-09-25  4012  			}
b411b3637fa71f Philipp Reisner     2009-09-25  4013  		}
b411b3637fa71f Philipp Reisner     2009-09-25  4014  
813472ced7fac7 Philipp Reisner     2011-05-03  4015  		if (apv > 94 && new_disk_conf) {
daeda1cca91d58 Philipp Reisner     2011-05-03  4016  			new_disk_conf->c_plan_ahead = be32_to_cpu(p->c_plan_ahead);
daeda1cca91d58 Philipp Reisner     2011-05-03  4017  			new_disk_conf->c_delay_target = be32_to_cpu(p->c_delay_target);
daeda1cca91d58 Philipp Reisner     2011-05-03  4018  			new_disk_conf->c_fill_target = be32_to_cpu(p->c_fill_target);
daeda1cca91d58 Philipp Reisner     2011-05-03  4019  			new_disk_conf->c_max_rate = be32_to_cpu(p->c_max_rate);
778f271dfe7a71 Philipp Reisner     2010-07-06  4020  
daeda1cca91d58 Philipp Reisner     2011-05-03  4021  			fifo_size = (new_disk_conf->c_plan_ahead * 10 * SLEEP_TIME) / HZ;
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  4022  			if (fifo_size != device->rs_plan_s->size) {
813472ced7fac7 Philipp Reisner     2011-05-03  4023  				new_plan = fifo_alloc(fifo_size);
813472ced7fac7 Philipp Reisner     2011-05-03  4024  				if (!new_plan) {
d01801710265cf Andreas Gruenbacher 2011-07-03  4025  					drbd_err(device, "kmalloc of fifo_buffer failed");
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  4026  					put_ldev(device);
778f271dfe7a71 Philipp Reisner     2010-07-06  4027  					goto disconnect;
778f271dfe7a71 Philipp Reisner     2010-07-06  4028  				}
778f271dfe7a71 Philipp Reisner     2010-07-06  4029  			}
8e26f9ccb9be00 Philipp Reisner     2010-07-06  4030  		}
b411b3637fa71f Philipp Reisner     2009-09-25  4031  
91fd4dad64ce7a Philipp Reisner     2011-04-20  4032  		if (verify_tfm || csums_tfm) {
2ec91e0e29a3f1 Philipp Reisner     2011-05-03  4033  			new_net_conf = kzalloc(sizeof(struct net_conf), GFP_KERNEL);
2ec91e0e29a3f1 Philipp Reisner     2011-05-03  4034  			if (!new_net_conf) {
d01801710265cf Andreas Gruenbacher 2011-07-03  4035  				drbd_err(device, "Allocation of new net_conf failed\n");
91fd4dad64ce7a Philipp Reisner     2011-04-20  4036  				goto disconnect;
91fd4dad64ce7a Philipp Reisner     2011-04-20  4037  			}
91fd4dad64ce7a Philipp Reisner     2011-04-20  4038  
2ec91e0e29a3f1 Philipp Reisner     2011-05-03  4039  			*new_net_conf = *old_net_conf;
91fd4dad64ce7a Philipp Reisner     2011-04-20  4040  
b411b3637fa71f Philipp Reisner     2009-09-25  4041  			if (verify_tfm) {
2ec91e0e29a3f1 Philipp Reisner     2011-05-03  4042  				strcpy(new_net_conf->verify_alg, p->verify_alg);
2ec91e0e29a3f1 Philipp Reisner     2011-05-03  4043  				new_net_conf->verify_alg_len = strlen(p->verify_alg) + 1;
3d0e63754fa47d Kees Cook           2018-08-06  4044  				crypto_free_shash(peer_device->connection->verify_tfm);
9f4fe9ad206028 Andreas Gruenbacher 2011-08-09  4045  				peer_device->connection->verify_tfm = verify_tfm;
d01801710265cf Andreas Gruenbacher 2011-07-03  4046  				drbd_info(device, "using verify-alg: \"%s\"\n", p->verify_alg);
b411b3637fa71f Philipp Reisner     2009-09-25  4047  			}
b411b3637fa71f Philipp Reisner     2009-09-25  4048  			if (csums_tfm) {
2ec91e0e29a3f1 Philipp Reisner     2011-05-03  4049  				strcpy(new_net_conf->csums_alg, p->csums_alg);
2ec91e0e29a3f1 Philipp Reisner     2011-05-03  4050  				new_net_conf->csums_alg_len = strlen(p->csums_alg) + 1;
3d0e63754fa47d Kees Cook           2018-08-06  4051  				crypto_free_shash(peer_device->connection->csums_tfm);
9f4fe9ad206028 Andreas Gruenbacher 2011-08-09  4052  				peer_device->connection->csums_tfm = csums_tfm;
d01801710265cf Andreas Gruenbacher 2011-07-03  4053  				drbd_info(device, "using csums-alg: \"%s\"\n", p->csums_alg);
b411b3637fa71f Philipp Reisner     2009-09-25  4054  			}
bde89a9e151b48 Andreas Gruenbacher 2011-05-30  4055  			rcu_assign_pointer(connection->net_conf, new_net_conf);
778f271dfe7a71 Philipp Reisner     2010-07-06  4056  		}
b411b3637fa71f Philipp Reisner     2009-09-25  4057  	}
b411b3637fa71f Philipp Reisner     2009-09-25  4058  
813472ced7fac7 Philipp Reisner     2011-05-03  4059  	if (new_disk_conf) {
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  4060  		rcu_assign_pointer(device->ldev->disk_conf, new_disk_conf);
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  4061  		put_ldev(device);
813472ced7fac7 Philipp Reisner     2011-05-03  4062  	}
813472ced7fac7 Philipp Reisner     2011-05-03  4063  
813472ced7fac7 Philipp Reisner     2011-05-03  4064  	if (new_plan) {
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  4065  		old_plan = device->rs_plan_s;
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03 @4066  		rcu_assign_pointer(device->rs_plan_s, new_plan);
778f271dfe7a71 Philipp Reisner     2010-07-06  4067  	}
daeda1cca91d58 Philipp Reisner     2011-05-03  4068  
0500813fe0c9a6 Andreas Gruenbacher 2011-07-07  4069  	mutex_unlock(&connection->resource->conf_update);
daeda1cca91d58 Philipp Reisner     2011-05-03  4070  	synchronize_rcu();
daeda1cca91d58 Philipp Reisner     2011-05-03  4071  	if (new_net_conf)
daeda1cca91d58 Philipp Reisner     2011-05-03  4072  		kfree(old_net_conf);
daeda1cca91d58 Philipp Reisner     2011-05-03  4073  	kfree(old_disk_conf);
813472ced7fac7 Philipp Reisner     2011-05-03  4074  	kfree(old_plan);
daeda1cca91d58 Philipp Reisner     2011-05-03  4075  
82bc01940ac914 Andreas Gruenbacher 2011-03-17  4076  	return 0;
b411b3637fa71f Philipp Reisner     2009-09-25  4077  
813472ced7fac7 Philipp Reisner     2011-05-03  4078  reconnect:
813472ced7fac7 Philipp Reisner     2011-05-03  4079  	if (new_disk_conf) {
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  4080  		put_ldev(device);
813472ced7fac7 Philipp Reisner     2011-05-03  4081  		kfree(new_disk_conf);
813472ced7fac7 Philipp Reisner     2011-05-03  4082  	}
0500813fe0c9a6 Andreas Gruenbacher 2011-07-07  4083  	mutex_unlock(&connection->resource->conf_update);
813472ced7fac7 Philipp Reisner     2011-05-03  4084  	return -EIO;
813472ced7fac7 Philipp Reisner     2011-05-03  4085  
b411b3637fa71f Philipp Reisner     2009-09-25  4086  disconnect:
813472ced7fac7 Philipp Reisner     2011-05-03  4087  	kfree(new_plan);
813472ced7fac7 Philipp Reisner     2011-05-03  4088  	if (new_disk_conf) {
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  4089  		put_ldev(device);
813472ced7fac7 Philipp Reisner     2011-05-03  4090  		kfree(new_disk_conf);
813472ced7fac7 Philipp Reisner     2011-05-03  4091  	}
0500813fe0c9a6 Andreas Gruenbacher 2011-07-07  4092  	mutex_unlock(&connection->resource->conf_update);
b411b3637fa71f Philipp Reisner     2009-09-25  4093  	/* just for completeness: actually not needed,
b411b3637fa71f Philipp Reisner     2009-09-25  4094  	 * as this is not reached if csums_tfm was ok. */
3d0e63754fa47d Kees Cook           2018-08-06  4095  	crypto_free_shash(csums_tfm);
b411b3637fa71f Philipp Reisner     2009-09-25  4096  	/* but free the verify_tfm again, if csums_tfm did not work out */
3d0e63754fa47d Kees Cook           2018-08-06  4097  	crypto_free_shash(verify_tfm);
9f4fe9ad206028 Andreas Gruenbacher 2011-08-09  4098  	conn_request_state(peer_device->connection, NS(conn, C_DISCONNECTING), CS_HARD);
82bc01940ac914 Andreas Gruenbacher 2011-03-17  4099  	return -EIO;
b411b3637fa71f Philipp Reisner     2009-09-25  4100  }
b411b3637fa71f Philipp Reisner     2009-09-25  4101  

:::::: The code at line 4066 was first introduced by commit
:::::: b30ab7913b0a7b1d3b1091c8cb3abb1a9f1e0824 drbd: Rename "mdev" to "device"

:::::: TO: Andreas Gruenbacher <agruen@linbit.com>
:::::: CC: Philipp Reisner <philipp.reisner@linbit.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
