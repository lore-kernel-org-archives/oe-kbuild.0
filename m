Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF84AD23
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 12:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732968082; cv=none; b=tvyWayYF1oNEU0zkJFNhqn4eQPaTA3FOwGBDDepLclqsdPJKPOhBTZZRQCE3fFtAG94/JKFaTi8BuWyWo+hxQtpbgj83DY1MdA9vYwFzLV/sSpQEa2KUq8vkzDEpRF++t6fMN6MHTYRQmRYnNUfkga10pN/19IfqBfmeV+eF26k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732968082; c=relaxed/simple;
	bh=clYCLo3Wr7UaSqR5A2Dmhav1hhxnvKiamZUOWdPAHrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eDpWDfA8obpsPyzCmwovpqbctWRSz7t2wFUSawRXO5j8fJqS792x+6xbhotxnbh8RiIyUAZG70zOe+iVThR8pKgeRZJrkB8bvyfsE3Zm/bGmjdzuE7CjLRFeauACw+dr3Kj8K1W35NqMBEYc8y7oMxTF+O91d/REKMeAYf/g9kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJOvogML; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJOvogML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732968080; x=1764504080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=clYCLo3Wr7UaSqR5A2Dmhav1hhxnvKiamZUOWdPAHrQ=;
  b=mJOvogMLepAliYSjm5TSJrdWclbfVFqUP8myPzfuXgy7SaBubApiyuq+
   DpSvFQgM36JWb5xb5PbEVGvZSKQxltpd8zQ1ZmBxOn9k3mansG1NcO9GP
   f6uak+bw/zZuUda1y2iy5jCSSkAnINnnSxbz8kuu+RW3burN4SFN/KNgd
   ogoYU4+fxu1cfTxWd3RmEt+xuKUG8Y1CFGq0W2aV91mR4V/V3ATh9mHnn
   I10tkdBEt0BjyxV6nIGoBhElhL7b6quuaTbwkzvFWonUSAJrocp3sYURx
   cUCzkHA7fpQ2QMzOud+tj0emvTx7/o/6tkfqQsMr9qwbpyUyCjjismIMA
   w==;
X-CSE-ConnectionGUID: 8/HVkQ23QxK1utoLZ8ZhgA==
X-CSE-MsgGUID: D8/qqKWsTFCwEkntyVP4FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="44559029"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="44559029"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 04:01:17 -0800
X-CSE-ConnectionGUID: A16oJhxVQ66C7NcLJGOefA==
X-CSE-MsgGUID: hug++up9RYqRJKGn6jFa4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="92769202"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 30 Nov 2024 04:01:16 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHM9n-0000dz-2q;
	Sat, 30 Nov 2024 12:01:05 +0000
Date: Sat, 30 Nov 2024 20:00:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/nfs/client.c:304:4-10: preceding lock on line 302
Message-ID: <202411301920.L3DvyrWV-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Benjamin Coddington <bcodding@redhat.com>
CC: Anna Schumaker <Anna.Schumaker@Netapp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2ba9f676d0a2e408aef14d679984c26373bf37b7
commit: c260121a97a3e4df6536edbc2f26e166eff370ce NFS: Fix a double unlock from nfs_match,get_client
date:   6 years ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 years ago
config: i386-randconfig-053-20241119 (https://download.01.org/0day-ci/archive/20241130/202411301920.L3DvyrWV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411301920.L3DvyrWV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/nfs/client.c:304:4-10: preceding lock on line 302

vim +304 fs/nfs/client.c

24c8dbbb5f7771 David Howells              2006-08-22  277  
24c8dbbb5f7771 David Howells              2006-08-22  278  /*
c81468a1a76692 Trond Myklebust            2007-12-14  279   * Find an nfs_client on the list that matches the initialisation data
c81468a1a76692 Trond Myklebust            2007-12-14  280   * that is supplied.
24c8dbbb5f7771 David Howells              2006-08-22  281   */
c81468a1a76692 Trond Myklebust            2007-12-14  282  static struct nfs_client *nfs_match_client(const struct nfs_client_initdata *data)
24c8dbbb5f7771 David Howells              2006-08-22  283  {
24c8dbbb5f7771 David Howells              2006-08-22  284  	struct nfs_client *clp;
d7371c41b0cda7 Ian Dall                   2009-03-10  285  	const struct sockaddr *sap = data->addr;
6b13168b36b6a7 Stanislav Kinsbursky       2012-01-23  286  	struct nfs_net *nn = net_generic(data->net, nfs_net_id);
950a578c6128c2 Roberto Bergantinos Corpas 2019-04-25  287  	int error;
24c8dbbb5f7771 David Howells              2006-08-22  288  
c156618e15101a Scott Mayhew               2017-12-05  289  again:
6b13168b36b6a7 Stanislav Kinsbursky       2012-01-23  290  	list_for_each_entry(clp, &nn->nfs_client_list, cl_share_link) {
d7371c41b0cda7 Ian Dall                   2009-03-10  291  	        const struct sockaddr *clap = (struct sockaddr *)&clp->cl_addr;
c81468a1a76692 Trond Myklebust            2007-12-14  292  		/* Don't match clients that failed to initialise properly */
c81468a1a76692 Trond Myklebust            2007-12-14  293  		if (clp->cl_cons_state < 0)
c81468a1a76692 Trond Myklebust            2007-12-14  294  			continue;
c81468a1a76692 Trond Myklebust            2007-12-14  295  
c156618e15101a Scott Mayhew               2017-12-05  296  		/* If a client is still initializing then we need to wait */
c156618e15101a Scott Mayhew               2017-12-05  297  		if (clp->cl_cons_state > NFS_CS_READY) {
c156618e15101a Scott Mayhew               2017-12-05  298  			refcount_inc(&clp->cl_count);
c156618e15101a Scott Mayhew               2017-12-05  299  			spin_unlock(&nn->nfs_client_lock);
950a578c6128c2 Roberto Bergantinos Corpas 2019-04-25  300  			error = nfs_wait_client_init_complete(clp);
c156618e15101a Scott Mayhew               2017-12-05  301  			nfs_put_client(clp);
c260121a97a3e4 Benjamin Coddington        2019-05-09 @302  			spin_lock(&nn->nfs_client_lock);
950a578c6128c2 Roberto Bergantinos Corpas 2019-04-25  303  			if (error < 0)
950a578c6128c2 Roberto Bergantinos Corpas 2019-04-25 @304  				return ERR_PTR(error);
c156618e15101a Scott Mayhew               2017-12-05  305  			goto again;
c156618e15101a Scott Mayhew               2017-12-05  306  		}
c156618e15101a Scott Mayhew               2017-12-05  307  
c81468a1a76692 Trond Myklebust            2007-12-14  308  		/* Different NFS versions cannot share the same nfs_client */
ab7017a3a0a64b Bryan Schumaker            2012-07-30  309  		if (clp->rpc_ops != data->nfs_mod->rpc_ops)
c81468a1a76692 Trond Myklebust            2007-12-14  310  			continue;
c81468a1a76692 Trond Myklebust            2007-12-14  311  
59dca3b28cb915 Trond Myklebust            2008-01-03  312  		if (clp->cl_proto != data->proto)
59dca3b28cb915 Trond Myklebust            2008-01-03  313  			continue;
5aae4a9ae0dd55 Benny Halevy               2009-04-01  314  		/* Match nfsv4 minorversion */
5aae4a9ae0dd55 Benny Halevy               2009-04-01  315  		if (clp->cl_minorversion != data->minorversion)
5aae4a9ae0dd55 Benny Halevy               2009-04-01  316  			continue;
c81468a1a76692 Trond Myklebust            2007-12-14  317  		/* Match the full socket address */
d8efa4e62505f5 Anna Schumaker             2015-07-13  318  		if (!rpc_cmp_addr_port(sap, clap))
04ea1b3e6d8ed4 Andy Adamson               2016-09-09  319  			/* Match all xprt_switch full socket addresses */
8ef3295530ddc9 Petr Vandrovec             2016-11-07  320  			if (IS_ERR(clp->cl_rpcclient) ||
8ef3295530ddc9 Petr Vandrovec             2016-11-07  321                              !rpc_clnt_xprt_switch_has_addr(clp->cl_rpcclient,
04ea1b3e6d8ed4 Andy Adamson               2016-09-09  322  							   sap))
c81468a1a76692 Trond Myklebust            2007-12-14  323  				continue;
c81468a1a76692 Trond Myklebust            2007-12-14  324  
212bf41d88c06a Elena Reshetova            2017-10-20  325  		refcount_inc(&clp->cl_count);
24c8dbbb5f7771 David Howells              2006-08-22  326  		return clp;
24c8dbbb5f7771 David Howells              2006-08-22  327  	}
c81468a1a76692 Trond Myklebust            2007-12-14  328  	return NULL;
c81468a1a76692 Trond Myklebust            2007-12-14  329  }
24c8dbbb5f7771 David Howells              2006-08-22  330  

:::::: The code at line 304 was first introduced by commit
:::::: 950a578c6128c2886e295b9c7ecb0b6b22fcc92b NFS: make nfs_match_client killable

:::::: TO: Roberto Bergantinos Corpas <rbergant@redhat.com>
:::::: CC: Anna Schumaker <Anna.Schumaker@Netapp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
