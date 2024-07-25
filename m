Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D571D19CD0F
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jul 2024 14:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721918364; cv=none; b=nbutMGcASSsGSoMSMcGvo0MsKLvYiAtxaxi6pEUh7JwMDNo6/RO7MQAXdaO6zJm6bkxkK/YGip2tQaMD+rtkZ5ohwoeziKuF30/41wuQX5CibHSgbcV/2mRhO77w/eht/lS/sJUYAtRx8sxvZcqf3cN4Lsk9FtlGRfyMKnDWBpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721918364; c=relaxed/simple;
	bh=TzLDsp0DIaVF9w3PGdkyc4uEfAWWbjV8JH5Vbsc3vEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nzHzHI//J6pLXarS+/bWBSeoJCSngTI6p+VPoYxzidTJhJLy/54RKMVH+0ZHs/b6ib8kuhpKnmJoa6fMGiDh2sbKuqoMQdfTQMGsjV2wjn1u/PKYjsXyFy1KH5LvWGwQfCyt72CMESNVe7opjmgpxmCeIvdf0qwxc8YgOSxt974=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CG/gjwCi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CG/gjwCi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721918362; x=1753454362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TzLDsp0DIaVF9w3PGdkyc4uEfAWWbjV8JH5Vbsc3vEg=;
  b=CG/gjwCijMJ3aK+AvnmvskR9vuEdebmZh/MoESmD7EY5P+ky0kROJ8BS
   unGS27wJVdMgcjZ+AAHI8FO58Q46sCfSD5kMavh7lbmUJ9Vsir4+VX1kH
   JgXZ/lbD/VCTZ0fTZHwCzOVnpc/qh2yuKdQjFZZMu8+6Je6OhuFRFwfKX
   rQmGta703F2bDPAUtkuH92yExlx7QLSYr4b4p/H1HkIPI1MvcRrdVywDX
   ZL1UYNMR2oaUPdsVVdgHbBJXCUwIAPXS6DFKoid5wN2f78UlBgJziQRzi
   EZKffxUrUbQWYXQhjfqSLgiW0vO3A2+hF7iL5h3P9a4Did/e35FuPL5tQ
   Q==;
X-CSE-ConnectionGUID: nTFClxsSRsi+ZljHaUvX5w==
X-CSE-MsgGUID: pPtX6tnAQfuIpxhLyiUYRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19811767"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; 
   d="scan'208";a="19811767"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 07:38:45 -0700
X-CSE-ConnectionGUID: ls8zV5G1RJCwzqzTaFzHnA==
X-CSE-MsgGUID: yi9JK6sfSH6b4UkqXRnLlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; 
   d="scan'208";a="52864075"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Jul 2024 07:38:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWzbc-000oBV-0F;
	Thu, 25 Jul 2024 14:38:08 +0000
Date: Thu, 25 Jul 2024 22:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/7] compiler.h: Add __if_constexpr(expr, if_const,
 if_not_const)
Message-ID: <202407252226.jrsGK9nO-lkp@intel.com>
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
In-Reply-To: <9751d18defea406fa698630637d8e7db@AcuMS.aculab.com>
References: <9751d18defea406fa698630637d8e7db@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Linus Torvalds'" <torvalds@linuxfoundation.org>
CC: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
CC: "'Christoph Hellwig'" <hch@infradead.org>
CC: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
CC: "'Dan Carpenter'" <dan.carpenter@linaro.org>
CC: "'Arnd Bergmann'" <arnd@kernel.org>
CC: "'Jason@zx2c4.com'" <Jason@zx2c4.com>
CC: "'pedro.falcato@gmail.com'" <pedro.falcato@gmail.com>
CC: "'Mateusz Guzik'" <mjguzik@gmail.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v6.10 next-20240725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Put-all-the-clamp-definitions-together/20240724-224832
base:   linux/master
patch link:    https://lore.kernel.org/r/9751d18defea406fa698630637d8e7db%40AcuMS.aculab.com
patch subject: [PATCH 3/7] compiler.h: Add __if_constexpr(expr, if_const, if_not_const)
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: i386-randconfig-141-20240725 (https://download.01.org/0day-ci/archive/20240725/202407252226.jrsGK9nO-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407252226.jrsGK9nO-lkp@intel.com/

smatch warnings:
net/ipv4/ip_tunnel.c:248 __ip_tunnel_create() error: strcpy() 'ops->kind' too large for 'name' (1010102 vs 16)
mm/memcontrol.c:1565 mem_cgroup_get_max() warn: unsigned 'swap' is never less than zero.
mm/memcontrol.c:1569 mem_cgroup_get_max() warn: unsigned '(null)' is never less than zero.

vim +248 net/ipv4/ip_tunnel.c

c5441932145563 Pravin B Shelar   2013-03-25  230  
c5441932145563 Pravin B Shelar   2013-03-25  231  static struct net_device *__ip_tunnel_create(struct net *net,
c5441932145563 Pravin B Shelar   2013-03-25  232  					     const struct rtnl_link_ops *ops,
117aef12a7b1b7 Alexander Lobakin 2024-03-27  233  					     struct ip_tunnel_parm_kern *parms)
c5441932145563 Pravin B Shelar   2013-03-25  234  {
c5441932145563 Pravin B Shelar   2013-03-25  235  	int err;
c5441932145563 Pravin B Shelar   2013-03-25  236  	struct ip_tunnel *tunnel;
c5441932145563 Pravin B Shelar   2013-03-25  237  	struct net_device *dev;
c5441932145563 Pravin B Shelar   2013-03-25  238  	char name[IFNAMSIZ];
c5441932145563 Pravin B Shelar   2013-03-25  239  
c5441932145563 Pravin B Shelar   2013-03-25  240  	err = -E2BIG;
9cb726a212a82c Eric Dumazet      2018-04-05  241  	if (parms->name[0]) {
9cb726a212a82c Eric Dumazet      2018-04-05  242  		if (!dev_valid_name(parms->name))
9cb726a212a82c Eric Dumazet      2018-04-05  243  			goto failed;
512b2dc48e8b01 XueBing Chen      2022-07-11  244  		strscpy(name, parms->name, IFNAMSIZ);
9cb726a212a82c Eric Dumazet      2018-04-05  245  	} else {
9cb726a212a82c Eric Dumazet      2018-04-05  246  		if (strlen(ops->kind) > (IFNAMSIZ - 3))
c5441932145563 Pravin B Shelar   2013-03-25  247  			goto failed;
000ade8016400d Sultan Alsawaf    2018-06-06 @248  		strcpy(name, ops->kind);
000ade8016400d Sultan Alsawaf    2018-06-06  249  		strcat(name, "%d");
c5441932145563 Pravin B Shelar   2013-03-25  250  	}
c5441932145563 Pravin B Shelar   2013-03-25  251  
c5441932145563 Pravin B Shelar   2013-03-25  252  	ASSERT_RTNL();
c835a677331495 Tom Gundersen     2014-07-14  253  	dev = alloc_netdev(ops->priv_size, name, NET_NAME_UNKNOWN, ops->setup);
c5441932145563 Pravin B Shelar   2013-03-25  254  	if (!dev) {
c5441932145563 Pravin B Shelar   2013-03-25  255  		err = -ENOMEM;
c5441932145563 Pravin B Shelar   2013-03-25  256  		goto failed;
c5441932145563 Pravin B Shelar   2013-03-25  257  	}
c5441932145563 Pravin B Shelar   2013-03-25  258  	dev_net_set(dev, net);
c5441932145563 Pravin B Shelar   2013-03-25  259  
c5441932145563 Pravin B Shelar   2013-03-25  260  	dev->rtnl_link_ops = ops;
c5441932145563 Pravin B Shelar   2013-03-25  261  
c5441932145563 Pravin B Shelar   2013-03-25  262  	tunnel = netdev_priv(dev);
c5441932145563 Pravin B Shelar   2013-03-25  263  	tunnel->parms = *parms;
5e6700b3bf98fe Nicolas Dichtel   2013-06-26  264  	tunnel->net = net;
c5441932145563 Pravin B Shelar   2013-03-25  265  
c5441932145563 Pravin B Shelar   2013-03-25  266  	err = register_netdevice(dev);
c5441932145563 Pravin B Shelar   2013-03-25  267  	if (err)
c5441932145563 Pravin B Shelar   2013-03-25  268  		goto failed_free;
c5441932145563 Pravin B Shelar   2013-03-25  269  
c5441932145563 Pravin B Shelar   2013-03-25  270  	return dev;
c5441932145563 Pravin B Shelar   2013-03-25  271  
c5441932145563 Pravin B Shelar   2013-03-25  272  failed_free:
c5441932145563 Pravin B Shelar   2013-03-25  273  	free_netdev(dev);
c5441932145563 Pravin B Shelar   2013-03-25  274  failed:
c5441932145563 Pravin B Shelar   2013-03-25  275  	return ERR_PTR(err);
c5441932145563 Pravin B Shelar   2013-03-25  276  }
c5441932145563 Pravin B Shelar   2013-03-25  277  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
