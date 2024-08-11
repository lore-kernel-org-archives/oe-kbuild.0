Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE5CF4FB
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 06:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723358476; cv=none; b=o9uiXtTdLEid5fSLxK/DRCmxJktPNxJiOQNH2gLBiz6NRhbpNbE1r/ovGjDjpMJ+3iue/f5p6x8mDh1J2OF3hwd+5OqlUrxeOJXkZrPlmAGjTVH56UnKBJa0KuNq8M+UA0hxSIVz8eQSgda6woicbW7b28aNmaU+oo4cagVhNjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723358476; c=relaxed/simple;
	bh=v7up5lj5DGCi++2H+OWEFnPdpZ2SSY7+U5kbt8/+bac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f3DpvX+Nb++SvXMocZ+5hchOAG27KVjRG3zerZ7ai8GrlLqTqIothcG6Mv6driJiNQ83p4YtR4viaktoTe+q6DWpKi6yn2IbCU6D0nTmIStVy6rJkOEquNEesqbOUaANA/xMsR8SYKFBMvRjHGHM6246rYJhx0lUtG2t2kF/uRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NeMzUwYN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NeMzUwYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723358474; x=1754894474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v7up5lj5DGCi++2H+OWEFnPdpZ2SSY7+U5kbt8/+bac=;
  b=NeMzUwYNhn346tFxr4DyVDLFQjRow+PGXezG6J9Sqci2A8eGcb9VU8H9
   42YESTW91pEiucO/uIQXqLWDKLc51BPjJ6QbhAH37tLYOvNBA6fEv0E9w
   ILpTEQR/dCJiWWTnjUmATgEB9t3qD9Qs3yPo6tqYd/nG9T5GJ6cM2cHKl
   N3a6Qyd4/Zo7phav2VBnXvAW8MdTq7GHzSqAXm8Qd0VOhDgJ/xdU7Um6w
   2VA40WZQj9+QGxNU1N9WyvhndBwKWwfCCIwGVvQOxX/XnZ/numFGjO6lR
   0F2vKJ6Pl6inRHk9xy7nkRyYojzK4GsmohWJnC7c1FNnPdtqLIZGOlRrI
   A==;
X-CSE-ConnectionGUID: nKvdo0HDRgOXapE+tbuhhA==
X-CSE-MsgGUID: z7GqTXHDRsSlzVFMfYBzFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21648770"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="21648770"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 23:41:13 -0700
X-CSE-ConnectionGUID: aps3tI96SOmzo3NpVrG/BQ==
X-CSE-MsgGUID: sJRIpn48R9esRq6Ff6+Rxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="62887798"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 10 Aug 2024 23:41:11 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd2GL-000AeN-10;
	Sun, 11 Aug 2024 06:41:09 +0000
Date: Sun, 11 Aug 2024 14:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 4/9] l2tp: add tunnel/session get_next helpers
Message-ID: <202408111407.HtON8jqa-lkp@intel.com>
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
In-Reply-To: <4067ff5019040bf8ee2bd3c06db9e3d27ca39ded.1722856576.git.jchapman@katalix.com>
References: <4067ff5019040bf8ee2bd3c06db9e3d27ca39ded.1722856576.git.jchapman@katalix.com>
TO: James Chapman <jchapman@katalix.com>

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Chapman/documentation-networking-update-l2tp-docs/20240805-194031
base:   net-next/main
patch link:    https://lore.kernel.org/r/4067ff5019040bf8ee2bd3c06db9e3d27ca39ded.1722856576.git.jchapman%40katalix.com
patch subject: [PATCH net-next 4/9] l2tp: add tunnel/session get_next helpers
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: microblaze-randconfig-r073-20240810 (https://download.01.org/0day-ci/archive/20240811/202408111407.HtON8jqa-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408111407.HtON8jqa-lkp@intel.com/

New smatch warnings:
net/l2tp/l2tp_core.c:400 l2tp_v2_session_get_next() error: we previously assumed 'tunnel' could be null (see line 393)

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: uninitialized symbol 'sp'.
net/l2tp/l2tp_core.c:1694 l2tp_tunnel_register() warn: missing error code 'ret'

vim +/tunnel +400 net/l2tp/l2tp_core.c

fd558d186df2c1 James Chapman 2010-04-02  371  
1506ceb77b949f James Chapman 2024-08-05  372  static struct l2tp_session *l2tp_v2_session_get_next(const struct net *net, u16 tid, unsigned long *key)
1506ceb77b949f James Chapman 2024-08-05  373  {
1506ceb77b949f James Chapman 2024-08-05  374  	struct l2tp_net *pn = l2tp_pernet(net);
1506ceb77b949f James Chapman 2024-08-05  375  	struct l2tp_session *session = NULL;
1506ceb77b949f James Chapman 2024-08-05  376  
1506ceb77b949f James Chapman 2024-08-05  377  	/* Start searching within the range of the tid */
1506ceb77b949f James Chapman 2024-08-05  378  	if (*key == 0)
1506ceb77b949f James Chapman 2024-08-05  379  		*key = l2tp_v2_session_key(tid, 0);
1506ceb77b949f James Chapman 2024-08-05  380  
1506ceb77b949f James Chapman 2024-08-05  381  	rcu_read_lock_bh();
1506ceb77b949f James Chapman 2024-08-05  382  again:
1506ceb77b949f James Chapman 2024-08-05  383  	session = idr_get_next_ul(&pn->l2tp_v2_session_idr, key);
1506ceb77b949f James Chapman 2024-08-05  384  	if (session) {
1506ceb77b949f James Chapman 2024-08-05  385  		struct l2tp_tunnel *tunnel = READ_ONCE(session->tunnel);
1506ceb77b949f James Chapman 2024-08-05  386  
1506ceb77b949f James Chapman 2024-08-05  387  		/* ignore sessions with id 0 as they are internal for pppol2tp */
1506ceb77b949f James Chapman 2024-08-05  388  		if (session->session_id == 0) {
1506ceb77b949f James Chapman 2024-08-05  389  			(*key)++;
1506ceb77b949f James Chapman 2024-08-05  390  			goto again;
1506ceb77b949f James Chapman 2024-08-05  391  		}
1506ceb77b949f James Chapman 2024-08-05  392  
1506ceb77b949f James Chapman 2024-08-05 @393  		if (tunnel && tunnel->tunnel_id == tid &&
1506ceb77b949f James Chapman 2024-08-05  394  		    refcount_inc_not_zero(&session->ref_count)) {
1506ceb77b949f James Chapman 2024-08-05  395  			rcu_read_unlock_bh();
1506ceb77b949f James Chapman 2024-08-05  396  			return session;
1506ceb77b949f James Chapman 2024-08-05  397  		}
1506ceb77b949f James Chapman 2024-08-05  398  
1506ceb77b949f James Chapman 2024-08-05  399  		(*key)++;
1506ceb77b949f James Chapman 2024-08-05 @400  		if (tunnel->tunnel_id == tid)
1506ceb77b949f James Chapman 2024-08-05  401  			goto again;
1506ceb77b949f James Chapman 2024-08-05  402  	}
1506ceb77b949f James Chapman 2024-08-05  403  	rcu_read_unlock_bh();
1506ceb77b949f James Chapman 2024-08-05  404  
1506ceb77b949f James Chapman 2024-08-05  405  	return NULL;
1506ceb77b949f James Chapman 2024-08-05  406  }
1506ceb77b949f James Chapman 2024-08-05  407  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
