Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB6A3B2AA
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 23:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768780652; cv=none; b=qe6ojvDSm2XcrUZPU3w2m91P/+SRgCvWZPA0jLkhqtnJYZYJBRnX7BFijbUA8j+/5Xjr/GIc5sP3/AhQOjf2Beoxl3FWL62b2MjxeBq5pHoysOxPVD7I/UbpRPazxjDlIN0zZoMceEs84JFa7fEe2Cf4Z2UBjCt11QPsOjyJ9dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768780652; c=relaxed/simple;
	bh=5wylP8CLdA/CETWxfffF2WVFRIyi3Fzo0H6OJ2s1ECk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IDiFOqQh7bs04sT2amp7NaPe/A96peKutxfeLuzY40bkDgcEJX/Yv1c901Hq0hZUqNTFGlfm//0r9vummqsfDsOi+6KExqC+GFqF/p9bSyx2vLqBIInHZ0QMbD9l27ze9HZ5OvCWMd5LExow5tQmogMx1lFa3oRLaj/9yIKjnSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRY7uT/F; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRY7uT/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768780650; x=1800316650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5wylP8CLdA/CETWxfffF2WVFRIyi3Fzo0H6OJ2s1ECk=;
  b=mRY7uT/F0mEKZRTaywnbFcVbHKfVSwZuR0XoaZbH4yn7/JZ2Q9aLpp7W
   hvyhiP7NexOuZnGZ7V0+65dSXgJC+Mh4sJoQLzXMwTa6me2xRNhuOEoZv
   lF55lJz4HRoJE+lbMm7PPyG20VyvaZNzo8T0Z0x+eAmuC+j0r9hcHEQWS
   qp+fr+0z3o+Rt8RjrwTZ7XR+K3DUwETQNy2YgSyvSFHNy0Op7nWegqS9R
   essiJrs2WaPb1b7qMaGbJHSBURCcn2T0nvnYeGEiBDPXox+dROdPrdlj6
   Wfk9YTWbWevHTeYempfArRh4npEcbr0UmPV0QTVhVmHLF1cyNLYNpNhEc
   Q==;
X-CSE-ConnectionGUID: WgqhuYIdRf6BU/EkOs7ggQ==
X-CSE-MsgGUID: a0XBDO+cSsSZDGN1o/qcSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="92664356"
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="92664356"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 15:57:29 -0800
X-CSE-ConnectionGUID: 1+C2naP0R4+Aho1Q8dMrEQ==
X-CSE-MsgGUID: K23OVMaLRnicPmFidpgQEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="210731420"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Jan 2026 15:57:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhce5-00000000NIb-2KKh;
	Sun, 18 Jan 2026 23:57:25 +0000
Date: Mon, 19 Jan 2026 07:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH ipsec-next v2 4/4] xfrm: add XFRM_MSG_MIGRATE_STATE for
 single SA migration
Message-ID: <202601190605.ZVkgcUYl-lkp@intel.com>
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
In-Reply-To: <951cb30ac3866c6075bc7359d0997dbffc3ce6da.1768679141.git.antony.antony@secunet.com>
References: <951cb30ac3866c6075bc7359d0997dbffc3ce6da.1768679141.git.antony.antony@secunet.com>
TO: Antony Antony <antony.antony@secunet.com>
TO: Antony Antony <antony.antony@secunet.com>
TO: Steffen Klassert <steffen.klassert@secunet.com>
TO: Herbert Xu <herbert@gondor.apana.org.au>
TO: netdev@vger.kernel.org
CC: "David S . Miller" <davem@davemloft.net>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Chiachang Wang <chiachangwang@google.com>
CC: Yan Yan <evitayan@google.com>
CC: devel@linux-ipsec.org
CC: Simon Horman <horms@kernel.org>
CC: Paul Moore <paul@paul-moore.com>
CC: Stephen Smalley <stephen.smalley.work@gmail.com>
CC: Ondrej Mosnacek <omosnace@redhat.com>
CC: linux-kernel@vger.kernel.org
CC: selinux@vger.kernel.org

Hi Antony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on klassert-ipsec-next/master]
[also build test WARNING on klassert-ipsec/master pcmoore-selinux/next linus/master v6.19-rc5 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Antony-Antony/xfrm-remove-redundant-assignments/20260118-041031
base:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next.git master
patch link:    https://lore.kernel.org/r/951cb30ac3866c6075bc7359d0997dbffc3ce6da.1768679141.git.antony.antony%40secunet.com
patch subject: [PATCH ipsec-next v2 4/4] xfrm: add XFRM_MSG_MIGRATE_STATE for single SA migration
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: hexagon-randconfig-r072-20260118 (https://download.01.org/0day-ci/archive/20260119/202601190605.ZVkgcUYl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601190605.ZVkgcUYl-lkp@intel.com/

New smatch warnings:
net/xfrm/xfrm_user.c:3299 xfrm_do_migrate_state() warn: missing error code? 'err'

Old smatch warnings:
net/xfrm/xfrm_user.c:1024 xfrm_add_sa() warn: missing error code? 'err'
net/xfrm/xfrm_user.c:2248 xfrm_add_policy() warn: missing error code? 'err'
net/xfrm/xfrm_user.c:3018 xfrm_add_acquire() warn: missing error code 'err'

vim +/err +3299 net/xfrm/xfrm_user.c

d3019c1db87425 Antony Antony 2026-01-17  3239  
d3019c1db87425 Antony Antony 2026-01-17  3240  static int xfrm_do_migrate_state(struct sk_buff *skb, struct nlmsghdr *nlh,
d3019c1db87425 Antony Antony 2026-01-17  3241  				 struct nlattr **attrs, struct netlink_ext_ack *extack)
d3019c1db87425 Antony Antony 2026-01-17  3242  {
d3019c1db87425 Antony Antony 2026-01-17  3243  	int err = -ESRCH;
d3019c1db87425 Antony Antony 2026-01-17  3244  	struct xfrm_state *x;
d3019c1db87425 Antony Antony 2026-01-17  3245  	struct net *net = sock_net(skb->sk);
d3019c1db87425 Antony Antony 2026-01-17  3246  	struct xfrm_encap_tmpl *encap = NULL;
d3019c1db87425 Antony Antony 2026-01-17  3247  	struct xfrm_user_offload *xuo = NULL;
d3019c1db87425 Antony Antony 2026-01-17  3248  	struct xfrm_migrate m = { .old_saddr.a4 = 0,};
d3019c1db87425 Antony Antony 2026-01-17  3249  	struct xfrm_user_migrate_state *um = nlmsg_data(nlh);
d3019c1db87425 Antony Antony 2026-01-17  3250  
d3019c1db87425 Antony Antony 2026-01-17  3251  	if (!um->id.spi) {
d3019c1db87425 Antony Antony 2026-01-17  3252  		NL_SET_ERR_MSG(extack, "Invalid SPI 0x0");
d3019c1db87425 Antony Antony 2026-01-17  3253  		return -EINVAL;
d3019c1db87425 Antony Antony 2026-01-17  3254  	}
d3019c1db87425 Antony Antony 2026-01-17  3255  
d3019c1db87425 Antony Antony 2026-01-17  3256  	err = copy_from_user_migrate_state(&m, um);
d3019c1db87425 Antony Antony 2026-01-17  3257  	if (err)
d3019c1db87425 Antony Antony 2026-01-17  3258  		return err;
d3019c1db87425 Antony Antony 2026-01-17  3259  
d3019c1db87425 Antony Antony 2026-01-17  3260  	x = xfrm_user_state_lookup(net, &um->id, attrs, &err);
d3019c1db87425 Antony Antony 2026-01-17  3261  
d3019c1db87425 Antony Antony 2026-01-17  3262  	if (x) {
d3019c1db87425 Antony Antony 2026-01-17  3263  		struct xfrm_state *xc;
d3019c1db87425 Antony Antony 2026-01-17  3264  
d3019c1db87425 Antony Antony 2026-01-17  3265  		if (!x->dir) {
d3019c1db87425 Antony Antony 2026-01-17  3266  			NL_SET_ERR_MSG(extack, "State direction is invalid");
d3019c1db87425 Antony Antony 2026-01-17  3267  			err = -EINVAL;
d3019c1db87425 Antony Antony 2026-01-17  3268  			goto error;
d3019c1db87425 Antony Antony 2026-01-17  3269  		}
d3019c1db87425 Antony Antony 2026-01-17  3270  
d3019c1db87425 Antony Antony 2026-01-17  3271  		if (attrs[XFRMA_ENCAP]) {
d3019c1db87425 Antony Antony 2026-01-17  3272  			encap = kmemdup(nla_data(attrs[XFRMA_ENCAP]),
d3019c1db87425 Antony Antony 2026-01-17  3273  					sizeof(*encap), GFP_KERNEL);
d3019c1db87425 Antony Antony 2026-01-17  3274  			if (!encap) {
d3019c1db87425 Antony Antony 2026-01-17  3275  				err = -ENOMEM;
d3019c1db87425 Antony Antony 2026-01-17  3276  				goto error;
d3019c1db87425 Antony Antony 2026-01-17  3277  			}
d3019c1db87425 Antony Antony 2026-01-17  3278  		}
d3019c1db87425 Antony Antony 2026-01-17  3279  		if (attrs[XFRMA_OFFLOAD_DEV]) {
d3019c1db87425 Antony Antony 2026-01-17  3280  			xuo = kmemdup(nla_data(attrs[XFRMA_OFFLOAD_DEV]),
d3019c1db87425 Antony Antony 2026-01-17  3281  				      sizeof(*xuo), GFP_KERNEL);
d3019c1db87425 Antony Antony 2026-01-17  3282  			if (!xuo) {
d3019c1db87425 Antony Antony 2026-01-17  3283  				err = -ENOMEM;
d3019c1db87425 Antony Antony 2026-01-17  3284  				goto error;
d3019c1db87425 Antony Antony 2026-01-17  3285  			}
d3019c1db87425 Antony Antony 2026-01-17  3286  		}
d3019c1db87425 Antony Antony 2026-01-17  3287  		xc = xfrm_state_migrate(x, &m, encap, net, xuo, extack);
d3019c1db87425 Antony Antony 2026-01-17  3288  		if (xc) {
d3019c1db87425 Antony Antony 2026-01-17  3289  			xfrm_state_delete(x);
d3019c1db87425 Antony Antony 2026-01-17  3290  			xfrm_send_migrate_state(um, encap, xuo);
d3019c1db87425 Antony Antony 2026-01-17  3291  			err = 0;
d3019c1db87425 Antony Antony 2026-01-17  3292  		} else {
d3019c1db87425 Antony Antony 2026-01-17  3293  			if (extack && !extack->_msg)
d3019c1db87425 Antony Antony 2026-01-17  3294  				NL_SET_ERR_MSG(extack, "State migration clone failed");
d3019c1db87425 Antony Antony 2026-01-17  3295  			err = -EINVAL;
d3019c1db87425 Antony Antony 2026-01-17  3296  		}
d3019c1db87425 Antony Antony 2026-01-17  3297  	} else {
d3019c1db87425 Antony Antony 2026-01-17  3298  		NL_SET_ERR_MSG(extack, "Can not find state");
d3019c1db87425 Antony Antony 2026-01-17 @3299  		return err;
d3019c1db87425 Antony Antony 2026-01-17  3300  	}
d3019c1db87425 Antony Antony 2026-01-17  3301  error:
d3019c1db87425 Antony Antony 2026-01-17  3302  	xfrm_state_put(x);
d3019c1db87425 Antony Antony 2026-01-17  3303  	kfree(encap);
d3019c1db87425 Antony Antony 2026-01-17  3304  	kfree(xuo);
d3019c1db87425 Antony Antony 2026-01-17  3305  	return err;
d3019c1db87425 Antony Antony 2026-01-17  3306  }
d3019c1db87425 Antony Antony 2026-01-17  3307  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
