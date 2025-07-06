Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BED435972
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Jul 2025 09:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751793455; cv=none; b=aSEylQF6xZOxTGxJsYipxql5yRl2o5R1ikUnEwJVYZI59Qy4ng/t0oE7Q/vhIbV8cwFZGBlq/mlYmy7TqdhvxdgfnpCtk9djfyBrMoGwM4uiDWmPy5bd+sOS2HFCWKVvhN7k6ny9GvVsGcZUCPOAMY7yIXb1YesCKz3HL6/ZBDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751793455; c=relaxed/simple;
	bh=ex9o8ztVpwtJveCet8QO9FVhseVZtK790pgE/SSIrqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ls7WVMIAmf6BSv/SdTjS1t4x0GOT/aqx+aTn0wMDgHy4cac/0HAkif4zU6XhR7FlgyuK1XuZb4C4OnXeNpANwBXSLNqtMCB0smAopdi0sPZf9a02I7WcyUDX1YwxSKEXy1vBN5osSukhzOdE1YSBP+zVotANaCpu0VJprNLyuOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjfsnV2R; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjfsnV2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751793453; x=1783329453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ex9o8ztVpwtJveCet8QO9FVhseVZtK790pgE/SSIrqs=;
  b=gjfsnV2RyIovFtFp10T+Blol5P8Umdmco6ZhC0U3HtBqx1bsgZsAOKMw
   QDEMFzUPS5Zes3bnfQfPhnj5tEHxt5l8zFSHkkDkMMPtuJ41OnzSmMhZU
   GBKiMU7ccuBwsuULXxEQMeb7bpqtQJAc/M9tw//YiyAf8IvCgVQwMLxe2
   2+7JLiiKuGYGZECpdKQ4w6hf02PrQt+Oiow+gZP4oKqTxnaEA8obIW/Nn
   ZLV8orJcSmfhSf1WeerWs6/DOtAX9mUhmxQuImCedEIMgDhNkAU9D5DHY
   gs4JLBpAzQM6PmrkB3wmFiFm6nqCeDRP6Xru54Ei6O69xkUfZJhIFqVHT
   A==;
X-CSE-ConnectionGUID: PCgnspX0Q9CM+SfRx2QnDw==
X-CSE-MsgGUID: QwaB2Ro0QEyjQ6xrJZA1zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="54159303"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="54159303"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 02:17:33 -0700
X-CSE-ConnectionGUID: YRDIb1TaSW+N9IrcofdSiQ==
X-CSE-MsgGUID: c4scLu2WQW2YXJn9FXtRHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="155089766"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Jul 2025 02:17:32 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYLV3-0004zP-02;
	Sun, 06 Jul 2025 09:17:29 +0000
Date: Sun, 6 Jul 2025 17:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v13 nf-next 1/3] netfilter: utils: nf_checksum(_partial)
 correct data!=networkheader
Message-ID: <202507061710.RCwA4Kjw-lkp@intel.com>
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
In-Reply-To: <20250704191135.1815969-2-ericwouds@gmail.com>
References: <20250704191135.1815969-2-ericwouds@gmail.com>
TO: Eric Woudstra <ericwouds@gmail.com>
TO: Pablo Neira Ayuso <pablo@netfilter.org>
TO: Jozsef Kadlecsik <kadlec@netfilter.org>
TO: Nikolay Aleksandrov <razor@blackwall.org>
TO: Ido Schimmel <idosch@nvidia.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Simon Horman <horms@kernel.org>
CC: netfilter-devel@vger.kernel.org
CC: bridge@lists.linux.dev
CC: Eric Woudstra <ericwouds@gmail.com>

Hi Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on netfilter-nf/main]
[also build test WARNING on horms-ipvs/master linus/master v6.16-rc4 next-20250704]
[cannot apply to nf-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Woudstra/netfilter-utils-nf_checksum-_partial-correct-data-networkheader/20250705-031418
base:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git main
patch link:    https://lore.kernel.org/r/20250704191135.1815969-2-ericwouds%40gmail.com
patch subject: [PATCH v13 nf-next 1/3] netfilter: utils: nf_checksum(_partial) correct data!=networkheader
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-r071-20250706 (https://download.01.org/0day-ci/archive/20250706/202507061710.RCwA4Kjw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507061710.RCwA4Kjw-lkp@intel.com/

smatch warnings:
net/netfilter/utils.c:131 nf_checksum() warn: signedness bug returning '(-12)'
net/netfilter/utils.c:155 nf_checksum_partial() warn: signedness bug returning '(-12)'

vim +131 net/netfilter/utils.c

ebee5a50d0b7cd Florian Westphal  2018-06-25  122  
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  123  __sum16 nf_checksum(struct sk_buff *skb, unsigned int hook,
ebee5a50d0b7cd Florian Westphal  2018-06-25  124  		    unsigned int dataoff, u8 protocol,
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  125  		    unsigned short family)
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  126  {
39644744ee13d9 Eric Woudstra     2025-07-04  127  	unsigned int nhpull = skb_network_header(skb) - skb->data;
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  128  	__sum16 csum = 0;
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  129  
39644744ee13d9 Eric Woudstra     2025-07-04  130  	if (!pskb_may_pull(skb, nhpull))
39644744ee13d9 Eric Woudstra     2025-07-04 @131  		return -ENOMEM;
39644744ee13d9 Eric Woudstra     2025-07-04  132  	__skb_pull(skb, nhpull);
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  133  	switch (family) {
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  134  	case AF_INET:
39644744ee13d9 Eric Woudstra     2025-07-04  135  		csum = nf_ip_checksum(skb, hook, dataoff - nhpull, protocol);
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  136  		break;
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  137  	case AF_INET6:
39644744ee13d9 Eric Woudstra     2025-07-04  138  		csum = nf_ip6_checksum(skb, hook, dataoff - nhpull, protocol);
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  139  		break;
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  140  	}
39644744ee13d9 Eric Woudstra     2025-07-04  141  	__skb_push(skb, nhpull);
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  142  
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  143  	return csum;
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  144  }
ef71fe27ec2f16 Pablo Neira Ayuso 2017-11-27  145  EXPORT_SYMBOL_GPL(nf_checksum);
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  146  
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  147  __sum16 nf_checksum_partial(struct sk_buff *skb, unsigned int hook,
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  148  			    unsigned int dataoff, unsigned int len,
ebee5a50d0b7cd Florian Westphal  2018-06-25  149  			    u8 protocol, unsigned short family)
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  150  {
39644744ee13d9 Eric Woudstra     2025-07-04  151  	unsigned int nhpull = skb_network_header(skb) - skb->data;
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  152  	__sum16 csum = 0;
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  153  
39644744ee13d9 Eric Woudstra     2025-07-04  154  	if (!pskb_may_pull(skb, nhpull))
39644744ee13d9 Eric Woudstra     2025-07-04 @155  		return -ENOMEM;
39644744ee13d9 Eric Woudstra     2025-07-04  156  	__skb_pull(skb, nhpull);
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  157  	switch (family) {
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  158  	case AF_INET:
39644744ee13d9 Eric Woudstra     2025-07-04  159  		csum = nf_ip_checksum_partial(skb, hook, dataoff - nhpull,
39644744ee13d9 Eric Woudstra     2025-07-04  160  					      len, protocol);
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  161  		break;
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  162  	case AF_INET6:
39644744ee13d9 Eric Woudstra     2025-07-04  163  		csum = nf_ip6_checksum_partial(skb, hook, dataoff - nhpull,
39644744ee13d9 Eric Woudstra     2025-07-04  164  					       len, protocol);
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  165  		break;
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  166  	}
39644744ee13d9 Eric Woudstra     2025-07-04  167  	__skb_push(skb, nhpull);
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  168  
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  169  	return csum;
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  170  }
f7dcbe2f36a660 Pablo Neira Ayuso 2017-12-20  171  EXPORT_SYMBOL_GPL(nf_checksum_partial);
3f87c08c615f56 Pablo Neira Ayuso 2017-11-27  172  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
