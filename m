Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE8011CB4
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Jul 2023 15:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689779828; x=1721315828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SIrJ/vL99F5i94NZlMzL3pt2YQ1hHbPbnNy69eTDZA0=;
  b=nhoHTyR1yFw7ugjQSeU3t7fJ0MroDdeCiAIzms5DxQnh1MjAJLL5g8vY
   dWl0pNngMHVT7RpdutUwy61t+ssfpoJaeZAK8Q3Osejy6FyuUeb+18qin
   cpNedcALz+I+cO07/nCYZ+NoZmSReacPZr53vKEwBwxXUTWd7VZjzK4pK
   o6FqlkgYBOgJ9Wwl3f6rmZsJHYz/iYJIfTF/MU5jb6mh7GDnIlSKAAAxl
   3kLq81+OHFh8CNO9HkzwNlh59uL/coViuWXGCYTEe/OIbC4nGMb80QvgO
   /dErUEAcHaPyz6wGil1xLWVBjo/4lbDng3E3H/fAs1FNRm3W4vEswl9jv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="351359408"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="351359408"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 08:17:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="837741588"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="837741588"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2023 08:17:06 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM8vG-00052z-08;
	Wed, 19 Jul 2023 15:17:02 +0000
Date: Wed, 19 Jul 2023 23:16:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ardb:acomp-zswap-cleanup 4/21] net/xfrm/xfrm_ipcomp.c:258
 ipcomp_free_reqs() warn: iterator used outside loop: 'pos'
Message-ID: <202307192356.By9AmaYX-lkp@intel.com>
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
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git acomp-zswap-cleanup
head:   d0a9c8530b6b8659bc8b126638f5d2c907cfe5ee
commit: 0e06a41b2635783fddeff405a37a0d6e7a997815 [4/21] net: ipcomp: Migrate to acomp API from deprecated comp API
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-m021-20230717 (https://download.01.org/0day-ci/archive/20230719/202307192356.By9AmaYX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192356.By9AmaYX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307192356.By9AmaYX-lkp@intel.com/

smatch warnings:
net/xfrm/xfrm_ipcomp.c:258 ipcomp_free_reqs() warn: iterator used outside loop: 'pos'

vim +/pos +258 net/xfrm/xfrm_ipcomp.c

6fccab671f2f0a Herbert Xu     2008-07-25  245  
0e06a41b263578 Ard Biesheuvel 2023-07-14  246  static void ipcomp_free_reqs(struct acomp_req * __percpu *reqs)
6fccab671f2f0a Herbert Xu     2008-07-25  247  {
0e06a41b263578 Ard Biesheuvel 2023-07-14  248  	struct ipcomp_reqs *pos;
6fccab671f2f0a Herbert Xu     2008-07-25  249  	int cpu;
6fccab671f2f0a Herbert Xu     2008-07-25  250  
0e06a41b263578 Ard Biesheuvel 2023-07-14  251  	list_for_each_entry(pos, &ipcomp_reqs_list, list) {
0e06a41b263578 Ard Biesheuvel 2023-07-14  252  		if (pos->reqs == reqs)
6fccab671f2f0a Herbert Xu     2008-07-25  253  			break;
6fccab671f2f0a Herbert Xu     2008-07-25  254  	}
6fccab671f2f0a Herbert Xu     2008-07-25  255  
0e06a41b263578 Ard Biesheuvel 2023-07-14  256  	WARN_ON(list_entry_is_head(pos, &ipcomp_reqs_list, list));
6fccab671f2f0a Herbert Xu     2008-07-25  257  
6fccab671f2f0a Herbert Xu     2008-07-25 @258  	if (--pos->users)
6fccab671f2f0a Herbert Xu     2008-07-25  259  		return;
6fccab671f2f0a Herbert Xu     2008-07-25  260  
6fccab671f2f0a Herbert Xu     2008-07-25  261  	list_del(&pos->list);
6fccab671f2f0a Herbert Xu     2008-07-25  262  	kfree(pos);
6fccab671f2f0a Herbert Xu     2008-07-25  263  
0e06a41b263578 Ard Biesheuvel 2023-07-14  264  	if (!reqs)
6fccab671f2f0a Herbert Xu     2008-07-25  265  		return;
6fccab671f2f0a Herbert Xu     2008-07-25  266  
6fccab671f2f0a Herbert Xu     2008-07-25  267  	for_each_possible_cpu(cpu) {
0e06a41b263578 Ard Biesheuvel 2023-07-14  268  		struct acomp_req *req = *per_cpu_ptr(reqs, cpu);
0e06a41b263578 Ard Biesheuvel 2023-07-14  269  
0e06a41b263578 Ard Biesheuvel 2023-07-14  270  		if (req) {
0e06a41b263578 Ard Biesheuvel 2023-07-14  271  			struct crypto_acomp *acomp = crypto_acomp_reqtfm(req);
0e06a41b263578 Ard Biesheuvel 2023-07-14  272  
0e06a41b263578 Ard Biesheuvel 2023-07-14  273  			acomp_request_free(req);
0e06a41b263578 Ard Biesheuvel 2023-07-14  274  			crypto_free_acomp(acomp);
6fccab671f2f0a Herbert Xu     2008-07-25  275  		}
0e06a41b263578 Ard Biesheuvel 2023-07-14  276  	}
0e06a41b263578 Ard Biesheuvel 2023-07-14  277  	free_percpu(reqs);
6fccab671f2f0a Herbert Xu     2008-07-25  278  }
6fccab671f2f0a Herbert Xu     2008-07-25  279  

:::::: The code at line 258 was first introduced by commit
:::::: 6fccab671f2f0a24b799f29a4ec878f62d34656c ipsec: ipcomp - Merge IPComp implementations

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
