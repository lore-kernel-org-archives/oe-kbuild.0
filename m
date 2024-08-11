Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDF03715E
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 09:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723370110; cv=none; b=qKskqYcduBk8ZWLEGYim+HJBsvlhC54LrJVWZ9p3ksvbdJ/BB+ibP6XJzzEBXTZSq+iz9g69arIlVTfmGkMu7NQXvb5CCSlFVeIYpeVqJm6gZFwqelgboLQfJ7J0GnxNVzByBfXjYg8XDV0FLZSH6H+hOLPPXEIKoZhfG40dOmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723370110; c=relaxed/simple;
	bh=Fv1izMLSwqnQuXA85NrDSpWY5BiVI9UYrlZ12gW/UJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c69+T1AMHo+Y3Yfsy2Gnbp/S1Oxyz67pMAbvT85LtNtIUaZLCTHYozUFGZM2hq0LQISQx8rF5W4dUUALm2ZZQtt+HKfOtepgv/do1t4UIy4jyQbj5HTGvpc8wJOYIPAkVeOb+6+JTbtbRyBYtDpDxYePrzcKs5OfZmbdHUIeo+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ErM38uoj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErM38uoj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723370108; x=1754906108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fv1izMLSwqnQuXA85NrDSpWY5BiVI9UYrlZ12gW/UJ0=;
  b=ErM38uojqmCYs4V7vlbhEYzniZbILEwbwinu8UZiy6VGRoag97tPLHw5
   eOOVxo1yh6kfp4VZCbpMNQZg8dcHrtyyQtRkFMe8bmvV5OwMEt7mUYNdy
   gUUkHiy6VtdChIac+TdIl8P1o1rBfXK7Cd46eKv0e0SYHBrWpSU5ko7Go
   I0gOoEF0UCC3hjgQU75WbmeaYbASecYQkzBZfPXhT5JFWI5BzfnVPZsc0
   3ZjwpDptDVeSqyq5k7A09c8f2odqoqN0xTTpMgEg+E1foV5Vwc/Dvgv8V
   zVG+PzaKl/3gc11+s/Z3OIfQMjLacMhmJyQFkErdZkTiGZgusrTMe/mW7
   w==;
X-CSE-ConnectionGUID: iEOsOj9LTyO7LyfvGgN9dw==
X-CSE-MsgGUID: qEcWp+jnSPmZ+yrIvDjG1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21621073"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="21621073"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 02:55:07 -0700
X-CSE-ConnectionGUID: ra50hoeRSnK9prEAc4EhSg==
X-CSE-MsgGUID: XLRN+FccSsW+VacrD5q91Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="62815574"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 11 Aug 2024 02:55:07 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd5Hu-000AkC-39;
	Sun, 11 Aug 2024 09:54:59 +0000
Date: Sun, 11 Aug 2024 17:54:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 6/9] l2tp: improve tunnel/session refcount
 helpers
Message-ID: <202408111739.2jgm4aa6-lkp@intel.com>
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
In-Reply-To: <a56dadfdfbcdb6d5c248374d65781524b01e9345.1722856576.git.jchapman@katalix.com>
References: <a56dadfdfbcdb6d5c248374d65781524b01e9345.1722856576.git.jchapman@katalix.com>
TO: James Chapman <jchapman@katalix.com>

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Chapman/documentation-networking-update-l2tp-docs/20240805-194031
base:   net-next/main
patch link:    https://lore.kernel.org/r/a56dadfdfbcdb6d5c248374d65781524b01e9345.1722856576.git.jchapman%40katalix.com
patch subject: [PATCH net-next 6/9] l2tp: improve tunnel/session refcount helpers
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: microblaze-randconfig-r073-20240810 (https://download.01.org/0day-ci/archive/20240811/202408111739.2jgm4aa6-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408111739.2jgm4aa6-lkp@intel.com/

New smatch warnings:
net/l2tp/l2tp_ppp.c:671 pppol2tp_tunnel_get() warn: address of NULL pointer 'tunnel'

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: uninitialized symbol 'sp'.

vim +/tunnel +671 net/l2tp/l2tp_ppp.c

789141b215fc50 Guillaume Nault 2018-08-03  635  
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  636  static struct l2tp_tunnel *pppol2tp_tunnel_get(struct net *net,
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  637  					       const struct l2tp_connect_info *info,
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  638  					       bool *new_tunnel)
fd558d186df2c1 James Chapman   2010-04-02  639  {
fd558d186df2c1 James Chapman   2010-04-02  640  	struct l2tp_tunnel *tunnel;
a408194aa050f9 Guillaume Nault 2018-06-26  641  	int error;
eb1c28c05894a4 Guillaume Nault 2018-04-23  642  
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  643  	*new_tunnel = false;
fd558d186df2c1 James Chapman   2010-04-02  644  
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  645  	tunnel = l2tp_tunnel_get(net, info->tunnel_id);
309795f4bec2d6 James Chapman   2010-04-02  646  
e0d4435f93905f James Chapman   2010-04-02  647  	/* Special case: create tunnel context if session_id and
e0d4435f93905f James Chapman   2010-04-02  648  	 * peer_session_id is 0. Otherwise look up tunnel using supplied
fd558d186df2c1 James Chapman   2010-04-02  649  	 * tunnel id.
fd558d186df2c1 James Chapman   2010-04-02  650  	 */
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  651  	if (!info->session_id && !info->peer_session_id) {
0febc7b3cd17bd Tom Parkin      2020-07-23  652  		if (!tunnel) {
309795f4bec2d6 James Chapman   2010-04-02  653  			struct l2tp_tunnel_cfg tcfg = {
309795f4bec2d6 James Chapman   2010-04-02  654  				.encap = L2TP_ENCAPTYPE_UDP,
309795f4bec2d6 James Chapman   2010-04-02  655  			};
3e1bc8bf974e2d Guillaume Nault 2018-06-13  656  
3e1bc8bf974e2d Guillaume Nault 2018-06-13  657  			/* Prevent l2tp_tunnel_register() from trying to set up
3e1bc8bf974e2d Guillaume Nault 2018-06-13  658  			 * a kernel socket.
3e1bc8bf974e2d Guillaume Nault 2018-06-13  659  			 */
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  660  			if (info->fd < 0)
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  661  				return ERR_PTR(-EBADF);
3e1bc8bf974e2d Guillaume Nault 2018-06-13  662  
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  663  			error = l2tp_tunnel_create(info->fd,
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  664  						   info->version,
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  665  						   info->tunnel_id,
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  666  						   info->peer_tunnel_id, &tcfg,
a408194aa050f9 Guillaume Nault 2018-06-26  667  						   &tunnel);
fd558d186df2c1 James Chapman   2010-04-02  668  			if (error < 0)
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  669  				return ERR_PTR(error);
6b9f34239b00e6 Guillaume Nault 2018-04-10  670  
490f10d900fb43 James Chapman   2024-08-05 @671  			refcount_inc(&tunnel->ref_count);
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  672  			error = l2tp_tunnel_register(tunnel, net, &tcfg);
6b9f34239b00e6 Guillaume Nault 2018-04-10  673  			if (error < 0) {
6b9f34239b00e6 Guillaume Nault 2018-04-10  674  				kfree(tunnel);
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  675  				return ERR_PTR(error);
6b9f34239b00e6 Guillaume Nault 2018-04-10  676  			}
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  677  
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  678  			*new_tunnel = true;
309795f4bec2d6 James Chapman   2010-04-02  679  		}
fd558d186df2c1 James Chapman   2010-04-02  680  	} else {
fd558d186df2c1 James Chapman   2010-04-02  681  		/* Error if we can't find the tunnel */
0febc7b3cd17bd Tom Parkin      2020-07-23  682  		if (!tunnel)
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  683  			return ERR_PTR(-ENOENT);
fd558d186df2c1 James Chapman   2010-04-02  684  
fd558d186df2c1 James Chapman   2010-04-02  685  		/* Error if socket is not prepped */
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  686  		if (!tunnel->sock) {
490f10d900fb43 James Chapman   2024-08-05  687  			l2tp_tunnel_put(tunnel);
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  688  			return ERR_PTR(-ENOENT);
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  689  		}
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  690  	}
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  691  
9ca5e7ecab064f Shigeru Yoshida 2023-02-17  692  	return tunnel;
fd558d186df2c1 James Chapman   2010-04-02  693  }
fd558d186df2c1 James Chapman   2010-04-02  694  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
