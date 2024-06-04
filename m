Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E46CEEC8
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jun 2024 15:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717513250; cv=none; b=UP94A0b7niI1lC8oIwd3Qwo3pmfJ1cGeJRntNG9qntdVvYJkffCAmEOs5LyyFJqA6oAxEl0vhgoPG9Sr+OFM6ygG2V225c672oKKT/Qr4nQ4g/VWZFid2xI/afp+h9DmjUmfBn5LJI0t1KqN9TbslmAoQpY/KyQsv5E6PuoJmt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717513250; c=relaxed/simple;
	bh=SoUDNx0VR/i690Ino49xaspZgRdwamfHaUEUEaxbUfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YOZYfoJglzIowNzN3vEhFHmgJP3k/XSEGumGj07boYT7E3Afs83O2ismpiHkSPfCtZX9qlBamTk5kVOh94pWiiyeH1VX4ndAaof2SfSpTt06wVZ3/ZnLPVlZMUc8gteEXfkVl1ZyxbNXPzRpb49vdokq75JDcOggomvYZDjiDEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsDPWda4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsDPWda4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717513248; x=1749049248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SoUDNx0VR/i690Ino49xaspZgRdwamfHaUEUEaxbUfo=;
  b=JsDPWda4u5L3Khlh/8W/OV5ExOMuyU2/rlnecFGIN5Cny9Yp5s4olk86
   RIwD6Ht6wAgpHhvEjtrZ5ZsmcFpVhg6X5YP8+ZFk5TWLghZ+7p+CdWNx1
   ymow9ZB5SgEci5CzTFEN/02gb/3nToptbh4SejeyyzMVi3WnMoz6lkCDV
   m82S/X9LhYmBAjTsR+XfWnkg124bk/mOugIGbs6EfA+5VFcV8CUhInEph
   peXKN6SzH19eDErVInBP64HqLnFH/w5nf9NCxkoJwn5brzLbyJ1CFxz4f
   VsJxQq7gyBF/BYSbbcO6IQul4CmgMEMNjXOjD+qxzU+nT+yCICrqLVwEp
   g==;
X-CSE-ConnectionGUID: Y3lG7a4mSrK+Ig9LJLp6/w==
X-CSE-MsgGUID: 1166wtFsRc6k0ZjK4hxFKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14287792"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="14287792"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 08:00:46 -0700
X-CSE-ConnectionGUID: JjGA0ck7ShyyjXC5BBPVSQ==
X-CSE-MsgGUID: uek4bPzbRWqSUjDca1h8Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="37903268"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 04 Jun 2024 08:00:44 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEVe6-000NON-1g;
	Tue, 04 Jun 2024 15:00:38 +0000
Date: Tue, 4 Jun 2024 22:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:openEuler-1.0-LTS 22031/22706] net/tipc/udp_media.c:775
 cleanup_bearer() warn: variable dereferenced before check 'ub->ubsock' (see
 line 774)
Message-ID: <202406042255.VakKNe5f-lkp@intel.com>
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
head:   c7b6352c0cf60df59185758b5d18a98215a05b1e
commit: f147e8f44610a18cff2d6db47d5e7bcad58a59a5 [22031/22706] tipc: wait and exit until all work queues are done
:::::: branch date: 3 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-161-20240530 (https://download.01.org/0day-ci/archive/20240604/202406042255.VakKNe5f-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406042255.VakKNe5f-lkp@intel.com/

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
