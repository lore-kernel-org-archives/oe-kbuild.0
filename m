Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAB54430
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Dec 2024 01:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734659602; cv=none; b=lQ82kv9cJRQCiEs8n1+f6koJyXXJAGx/f3NuV0MEsnH/opeOX6wGCWyIaiHNsJO2Wu5/NyhTt0nLAnKwzUnHiluPadkAD8jAYx0wScGmeeB12eI3bqOQzkhVYr78eNQ2V0hUbQkRDO0/lh6K8oPZADJ+T80yfjFMG3kKBLLtUvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734659602; c=relaxed/simple;
	bh=/gLOFL/Ds6mGzAxwd9TR8YoXtfMLAXRboU0nfqLCgr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cAEDZZYj6no/q7NDSY/4JERsQR0OgpMZTDDOAITyXqMTAm+zlFFkRmGumqTqjOxZu7hvue+O1kBezBspz7j8+jUU0rHmuKVeR4o+7Tviaxv1G5vraS8+pDkGbBCu0/E0vBx/JO22qhxXmbhUhJq2isNBmoqGIprqh5qwX8BBuf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxvPfG3b; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxvPfG3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734659600; x=1766195600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/gLOFL/Ds6mGzAxwd9TR8YoXtfMLAXRboU0nfqLCgr0=;
  b=ZxvPfG3bI3Vv6T+QyYs14pUKS/BBfz2RxQsXJ7bwwG3eOyS2a3jwDOM4
   h+y3u4m1hRPNAidpOhh9tjewEAkdTXF0O2zv6ynKKvrpTS6yXUp5FdZAG
   JJQQSXaKKLxbaw35zosN3FIGSgKNJcj/RX0SvHfauQdtW0eZP+PCgh/Wu
   qRuWGmrH/GaJLq+ZHFdh9JxBQFzriCgE2YNOOQecRO+VvVBZndvIGkOty
   EBEkHGcEaIZgCeq/ZyRuvzGc68kjmYnqudknVJBQ4lecAOIFBuL3HUKH9
   de3iJBIFDblsccuDd2Okj3ECcX+6eyq/c/DDHZqXcuKIWf6p4T4N4vhXe
   Q==;
X-CSE-ConnectionGUID: kbC01xnCQsqM4jgWvAWPTQ==
X-CSE-MsgGUID: Yy1Y8g68RlalPz6CIr/PJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35090801"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="35090801"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 17:53:18 -0800
X-CSE-ConnectionGUID: 3+VSqLnERgWnVoORumrJHQ==
X-CSE-MsgGUID: sWceieoxTsCWrJMhOn4ZEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="103249420"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Dec 2024 17:53:18 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOSCZ-0000fv-0k;
	Fri, 20 Dec 2024 01:53:15 +0000
Date: Fri, 20 Dec 2024 09:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH bpf-next v2 2/5] net/smc: Introduce generic hook smc_ops
Message-ID: <202412200930.lPFOgV73-lkp@intel.com>
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
In-Reply-To: <20241210040404.10606-3-alibuda@linux.alibaba.com>
References: <20241210040404.10606-3-alibuda@linux.alibaba.com>
TO: "D. Wythe" <alibuda@linux.alibaba.com>
TO: kgraul@linux.ibm.com
TO: wenjia@linux.ibm.com
TO: jaka@linux.ibm.com
TO: ast@kernel.org
TO: daniel@iogearbox.net
TO: andrii@kernel.org
TO: martin.lau@linux.dev
TO: pabeni@redhat.com
TO: song@kernel.org
TO: sdf@google.com
TO: haoluo@google.com
TO: yhs@fb.com
TO: edumazet@google.com
TO: john.fastabend@gmail.com
TO: kpsingh@kernel.org
TO: jolsa@kernel.org
TO: guwen@linux.alibaba.com
CC: kuba@kernel.org
CC: davem@davemloft.net
CC: netdev@vger.kernel.org
CC: linux-s390@vger.kernel.org
CC: linux-rdma@vger.kernel.org
CC: bpf@vger.kernel.org

Hi Wythe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/D-Wythe/bpf-export-necessary-sympols-for-modules-with-struct_ops/20241210-121321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20241210040404.10606-3-alibuda%40linux.alibaba.com
patch subject: [PATCH bpf-next v2 2/5] net/smc: Introduce generic hook smc_ops
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: i386-randconfig-r072-20241220 (https://download.01.org/0day-ci/archive/20241220/202412200930.lPFOgV73-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412200930.lPFOgV73-lkp@intel.com/

smatch warnings:
net/smc/smc_sysctl.c:73 proc_smc_ops() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl.procname
net/smc/smc_sysctl.c:73 proc_smc_ops() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : tbl.proc_handler

vim +73 net/smc/smc_sysctl.c

61ca13a8c2666a D. Wythe 2024-12-10  66  
61ca13a8c2666a D. Wythe 2024-12-10  67  static int proc_smc_ops(const struct ctl_table *ctl, int write,
61ca13a8c2666a D. Wythe 2024-12-10  68  			void *buffer, size_t *lenp, loff_t *ppos)
61ca13a8c2666a D. Wythe 2024-12-10  69  {
61ca13a8c2666a D. Wythe 2024-12-10  70  	struct net *net = container_of(ctl->data, struct net,
61ca13a8c2666a D. Wythe 2024-12-10  71  				       smc.ops);
61ca13a8c2666a D. Wythe 2024-12-10  72  	char val[SMC_OPS_NAME_MAX];
61ca13a8c2666a D. Wythe 2024-12-10 @73  	struct ctl_table tbl = {
61ca13a8c2666a D. Wythe 2024-12-10  74  		.data = val,
61ca13a8c2666a D. Wythe 2024-12-10  75  		.maxlen = SMC_OPS_NAME_MAX,
61ca13a8c2666a D. Wythe 2024-12-10  76  	};
61ca13a8c2666a D. Wythe 2024-12-10  77  	struct smc_ops *ops;
61ca13a8c2666a D. Wythe 2024-12-10  78  	int ret;
61ca13a8c2666a D. Wythe 2024-12-10  79  
61ca13a8c2666a D. Wythe 2024-12-10  80  	rcu_read_lock();
61ca13a8c2666a D. Wythe 2024-12-10  81  	ops = rcu_dereference(net->smc.ops);
61ca13a8c2666a D. Wythe 2024-12-10  82  	if (ops)
61ca13a8c2666a D. Wythe 2024-12-10  83  		memcpy(val, ops->name, sizeof(ops->name));
61ca13a8c2666a D. Wythe 2024-12-10  84  	else
61ca13a8c2666a D. Wythe 2024-12-10  85  		val[0] = '\0';
61ca13a8c2666a D. Wythe 2024-12-10  86  	rcu_read_unlock();
61ca13a8c2666a D. Wythe 2024-12-10  87  
61ca13a8c2666a D. Wythe 2024-12-10  88  	ret = proc_dostring(&tbl, write, buffer, lenp, ppos);
61ca13a8c2666a D. Wythe 2024-12-10  89  	if (ret)
61ca13a8c2666a D. Wythe 2024-12-10  90  		return ret;
61ca13a8c2666a D. Wythe 2024-12-10  91  
61ca13a8c2666a D. Wythe 2024-12-10  92  	if (write)
61ca13a8c2666a D. Wythe 2024-12-10  93  		ret = smc_net_replace_smc_ops(net, val);
61ca13a8c2666a D. Wythe 2024-12-10  94  	return ret;
61ca13a8c2666a D. Wythe 2024-12-10  95  }
61ca13a8c2666a D. Wythe 2024-12-10  96  #endif /* CONFIG_SMC_OPS */
61ca13a8c2666a D. Wythe 2024-12-10  97  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
