Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F88B186E2A
	for <oe-kbuild@lists.linux.dev>; Thu, 30 May 2024 13:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717077542; cv=none; b=S5FxTa3bmwt2ZGhRdnvATG+c8Zd11R2GTDL1mMPiYDnh8AgL3sJRo7NHHKstputvYNwnEuglgGSFNmjymoj580OWEKWu5wTjMGeZ1yKlAZCEnSbG/38eXKR2HbmjVn7MZLskBy8AG7sqZvcNxVAuYPEsfWFub4dO2ZQtH4PXiEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717077542; c=relaxed/simple;
	bh=D9CRX50AoUCl9ms7+IxvPqP38yU5pYw8qwlpkS2hSM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=glV1pDm3pfgwO8GOCw+bomPm+nMVUgi+rSFb9Ol66ATMtkIo90WeBG23jrOrUJTxMDucTwqo/11ioMZGyAX8PL+Nf5AnEsldXh046UwxrcrtGfPTfwByfrBHYYry/2QfS6TE2RfAux4fEGOxBxlIHsvpT6q/+poyz/9v/8NXXiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXkHwt6V; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXkHwt6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717077541; x=1748613541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D9CRX50AoUCl9ms7+IxvPqP38yU5pYw8qwlpkS2hSM0=;
  b=LXkHwt6VWwog25ebt7EFf3q3jCBYvZn7CCAwMkkBxmzaR8JEzyFxtN2E
   PQOp53aKDAcPRp+rz+T5igkUN3H9fyKaLxi8iLMaNc1YeWQYUIrXPOM7K
   SE6dbD68gVpSSYayDG19zXAF7omefZp3S62vv7n/nMVXGg0r9vRjo8TC5
   T+6dkpQ1+NoI9gNFIUZGJsqAPCXEjAOcpMKHEMJ+QcHOpNhgBDf28RSsg
   LJqbv0ijxaYiVJfar4uAwusX7hZTXLBg6D2jcUDUFWthFjvXUbZ19SkxB
   kDPiMQQEefxXTBVQu71pu0EZLOcdsri09+0bidGmwuJwrAYC+gyN0u7Pf
   w==;
X-CSE-ConnectionGUID: skIsrgcERsKvUW/dBwGDAw==
X-CSE-MsgGUID: E3c1NpD/QSaDZn7mzqPL5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13438997"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="13438997"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 06:59:00 -0700
X-CSE-ConnectionGUID: 1xWpnsMqRPCX4xFRr17qlQ==
X-CSE-MsgGUID: 74sC2qH1RaGgwKbso066nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="58994056"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 May 2024 06:58:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCgIy-000FU6-1k;
	Thu, 30 May 2024 13:58:56 +0000
Date: Thu, 30 May 2024 21:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:openEuler-1.0-LTS 22031/22588] net/tipc/udp_media.c:775
 cleanup_bearer() warn: variable dereferenced before check 'ub->ubsock' (see
 line 774)
Message-ID: <202405302145.ELvG0wIM-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Ziyang Xuan <william.xuanziyang@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   03933bd11a64b94203f2cbe30ae71061807872fb
commit: f147e8f44610a18cff2d6db47d5e7bcad58a59a5 [22031/22588] tipc: wait and exit until all work queues are done
:::::: branch date: 2 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-161-20240530 (https://download.01.org/0day-ci/archive/20240530/202405302145.ELvG0wIM-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405302145.ELvG0wIM-lkp@intel.com/

smatch warnings:
net/tipc/udp_media.c:775 cleanup_bearer() warn: variable dereferenced before check 'ub->ubsock' (see line 774)
net/tipc/udp_media.c:796 tipc_udp_disable() error: we previously assumed 'ub->ubsock' could be null (see line 791)

vim +775 net/tipc/udp_media.c

d0f91938bede20 Erik Hugne   2015-03-05  762  
d0f91938bede20 Erik Hugne   2015-03-05  763  /* cleanup_bearer - break the socket/bearer association */
d0f91938bede20 Erik Hugne   2015-03-05  764  static void cleanup_bearer(struct work_struct *work)
d0f91938bede20 Erik Hugne   2015-03-05  765  {
d0f91938bede20 Erik Hugne   2015-03-05  766  	struct udp_bearer *ub = container_of(work, struct udp_bearer, work);
ef20cd4dd16339 Richard Alpe 2016-08-26  767  	struct udp_replicast *rcast, *tmp;
ef20cd4dd16339 Richard Alpe 2016-08-26  768  
ef20cd4dd16339 Richard Alpe 2016-08-26  769  	list_for_each_entry_safe(rcast, tmp, &ub->rcast.list, list) {
ef20cd4dd16339 Richard Alpe 2016-08-26  770  		list_del_rcu(&rcast->list);
ef20cd4dd16339 Richard Alpe 2016-08-26  771  		kfree_rcu(rcast, rcu);
ef20cd4dd16339 Richard Alpe 2016-08-26  772  	}
d0f91938bede20 Erik Hugne   2015-03-05  773  
f147e8f44610a1 Xin Long     2024-04-02 @774  	atomic_dec(&tipc_net(sock_net(ub->ubsock->sk))->wq_count);
d0f91938bede20 Erik Hugne   2015-03-05 @775  	if (ub->ubsock)
d0f91938bede20 Erik Hugne   2015-03-05  776  		udp_tunnel_sock_release(ub->ubsock);
d0f91938bede20 Erik Hugne   2015-03-05  777  	synchronize_net();
d0f91938bede20 Erik Hugne   2015-03-05  778  	kfree(ub);
d0f91938bede20 Erik Hugne   2015-03-05  779  }
d0f91938bede20 Erik Hugne   2015-03-05  780  
d0f91938bede20 Erik Hugne   2015-03-05  781  /* tipc_udp_disable - detach bearer from socket */
d0f91938bede20 Erik Hugne   2015-03-05  782  static void tipc_udp_disable(struct tipc_bearer *b)
d0f91938bede20 Erik Hugne   2015-03-05  783  {
d0f91938bede20 Erik Hugne   2015-03-05  784  	struct udp_bearer *ub;
d0f91938bede20 Erik Hugne   2015-03-05  785  
d0f91938bede20 Erik Hugne   2015-03-05  786  	ub = rcu_dereference_rtnl(b->media_ptr);
d0f91938bede20 Erik Hugne   2015-03-05  787  	if (!ub) {
d0f91938bede20 Erik Hugne   2015-03-05  788  		pr_err("UDP bearer instance not found\n");
d0f91938bede20 Erik Hugne   2015-03-05  789  		return;
d0f91938bede20 Erik Hugne   2015-03-05  790  	}
d0f91938bede20 Erik Hugne   2015-03-05 @791  	if (ub->ubsock)
d0f91938bede20 Erik Hugne   2015-03-05  792  		sock_set_flag(ub->ubsock->sk, SOCK_DEAD);
d0f91938bede20 Erik Hugne   2015-03-05  793  	RCU_INIT_POINTER(ub->bearer, NULL);
d0f91938bede20 Erik Hugne   2015-03-05  794  
d0f91938bede20 Erik Hugne   2015-03-05  795  	/* sock_release need to be done outside of rtnl lock */
f147e8f44610a1 Xin Long     2024-04-02 @796  	atomic_inc(&tipc_net(sock_net(ub->ubsock->sk))->wq_count);
d0f91938bede20 Erik Hugne   2015-03-05  797  	INIT_WORK(&ub->work, cleanup_bearer);
d0f91938bede20 Erik Hugne   2015-03-05  798  	schedule_work(&ub->work);
d0f91938bede20 Erik Hugne   2015-03-05  799  }
d0f91938bede20 Erik Hugne   2015-03-05  800  

:::::: The code at line 775 was first introduced by commit
:::::: d0f91938bede204a343473792529e0db7d599836 tipc: add ip/udp media type

:::::: TO: Erik Hugne <erik.hugne@ericsson.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
