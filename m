Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F379863AA
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Dec 2023 07:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBpSCPWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703748716; x=1735284716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BeUBmlwHAXDmJTpVbhfW2qt6Sat8XLIBHfV8mF3KcYs=;
  b=LBpSCPWkSoX9vL4D5cs8g4Fj/V3phNh39rwH+aZHKArEjhmQZhQPndPE
   ZmOcpX5v2oEPD9IbiozwbdOaqhLG4A5lCXxifgAlbMSlU78PGYVsdtqEk
   DrdyX5oMofYKGg6zPIer0Rmv6gkQccjxWBHxwasWql+fEEkfSwd69pkP1
   SyHXAQJA2YDzFKm/A5TYQ9j27ssg4Hq6T3PKgQn7rB8utSZOl/MVURMbZ
   UvFajvjlJZub77VfrnlFh3X1Ks2GNslReyGZicyGkAncT6Go2IYGTnU0g
   bT6PD4y0jmbzZOuSyd6MzNVbL5d/DhN3ZGVR3LpJJiVCvpMDNrHRs+uZm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3819763"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="3819763"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 23:31:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="844373242"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="844373242"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 27 Dec 2023 23:31:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIkrv-000GCz-2d;
	Thu, 28 Dec 2023 07:31:51 +0000
Date: Thu, 28 Dec 2023 15:31:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 ipsec-next 1/2] xfrm: introduce forwarding of ICMP
 Error messages
Message-ID: <202312281547.Rj8UyMLw-lkp@intel.com>
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
In-Reply-To: <224967daf3e2fea76e9d3e8c0ce88d573fa05303.1703164284.git.antony.antony@secunet.com>
References: <224967daf3e2fea76e9d3e8c0ce88d573fa05303.1703164284.git.antony.antony@secunet.com>
TO: Antony Antony <antony.antony@secunet.com>
TO: Steffen Klassert <steffen.klassert@secunet.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Antony Antony <antony.antony@secunet.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: devel@linux-ipsec.org
CC: netdev@vger.kernel.org

Hi Antony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on net/main linus/master v6.7-rc7 next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Antony-Antony/xfrm-fix-source-address-in-icmp-error-generation-from-IPsec-gateway/20231222-182750
base:   net-next/main
patch link:    https://lore.kernel.org/r/224967daf3e2fea76e9d3e8c0ce88d573fa05303.1703164284.git.antony.antony%40secunet.com
patch subject: [PATCH v4 ipsec-next 1/2] xfrm: introduce forwarding of ICMP Error messages
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20231228 (https://download.01.org/0day-ci/archive/20231228/202312281547.Rj8UyMLw-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312281547.Rj8UyMLw-lkp@intel.com/

smatch warnings:
net/xfrm/xfrm_policy.c:3708 __xfrm_policy_check() error: testing array offset 'dir' after use.

vim +/dir +3708 net/xfrm/xfrm_policy.c

94b702cd72d496d Antony Antony     2023-12-21  3628  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3629  int __xfrm_policy_check(struct sock *sk, int dir, struct sk_buff *skb,
^1da177e4c3f415 Linus Torvalds    2005-04-16  3630  			unsigned short family)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3631  {
f6e1e25d703c0a9 Alexey Dobriyan   2008-11-25  3632  	struct net *net = dev_net(skb->dev);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3633  	struct xfrm_policy *pol;
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3634  	struct xfrm_policy *pols[XFRM_POLICY_TYPE_MAX];
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3635  	int npols = 0;
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3636  	int xfrm_nr;
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3637  	int pi;
d5422efe680fc55 Herbert Xu        2007-12-12  3638  	int reverse;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3639  	struct flowi fl;
df0ba92a99ca757 Masahide NAKAMURA 2006-08-23  3640  	int xerr_idx = -1;
bc56b33404599ed Benedict Wong     2018-07-19  3641  	const struct xfrm_if_cb *ifcb;
2294be0f11e22b6 Florian Westphal  2018-12-18  3642  	struct sec_path *sp;
bc56b33404599ed Benedict Wong     2018-07-19  3643  	u32 if_id = 0;
bc56b33404599ed Benedict Wong     2018-07-19  3644  
bc56b33404599ed Benedict Wong     2018-07-19  3645  	rcu_read_lock();
bc56b33404599ed Benedict Wong     2018-07-19  3646  	ifcb = xfrm_if_get_cb();
bc56b33404599ed Benedict Wong     2018-07-19  3647  
bc56b33404599ed Benedict Wong     2018-07-19  3648  	if (ifcb) {
abc340b38ba25cd Eyal Birger       2022-08-26  3649  		struct xfrm_if_decode_session_result r;
abc340b38ba25cd Eyal Birger       2022-08-26  3650  
abc340b38ba25cd Eyal Birger       2022-08-26  3651  		if (ifcb->decode_session(skb, family, &r)) {
abc340b38ba25cd Eyal Birger       2022-08-26  3652  			if_id = r.if_id;
abc340b38ba25cd Eyal Birger       2022-08-26  3653  			net = r.net;
660899ddf06ae8b Tobias Brunner    2019-02-18  3654  		}
bc56b33404599ed Benedict Wong     2018-07-19  3655  	}
bc56b33404599ed Benedict Wong     2018-07-19  3656  	rcu_read_unlock();
^1da177e4c3f415 Linus Torvalds    2005-04-16  3657  
d5422efe680fc55 Herbert Xu        2007-12-12  3658  	reverse = dir & ~XFRM_POLICY_MASK;
d5422efe680fc55 Herbert Xu        2007-12-12  3659  	dir &= XFRM_POLICY_MASK;
d5422efe680fc55 Herbert Xu        2007-12-12  3660  
2b1dc6285c3f6e6 Florian Westphal  2023-10-04  3661  	if (__xfrm_decode_session(net, skb, &fl, family, reverse) < 0) {
59c9940ed0ef026 Alexey Dobriyan   2008-11-25  3662  		XFRM_INC_STATS(net, LINUX_MIB_XFRMINHDRERROR);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3663  		return 0;
0aa647746e5602e Masahide NAKAMURA 2007-12-20  3664  	}
0aa647746e5602e Masahide NAKAMURA 2007-12-20  3665  
eb9c7ebe6980c41 Patrick McHardy   2006-01-06  3666  	nf_nat_decode_session(skb, &fl, family);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3667  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3668  	/* First, check used SA against their selectors. */
2294be0f11e22b6 Florian Westphal  2018-12-18  3669  	sp = skb_sec_path(skb);
2294be0f11e22b6 Florian Westphal  2018-12-18  3670  	if (sp) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3671  		int i;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3672  
2294be0f11e22b6 Florian Westphal  2018-12-18  3673  		for (i = sp->len - 1; i >= 0; i--) {
2294be0f11e22b6 Florian Westphal  2018-12-18  3674  			struct xfrm_state *x = sp->xvec[i];
94b702cd72d496d Antony Antony     2023-12-21  3675  			int ret = 0;
94b702cd72d496d Antony Antony     2023-12-21  3676  
0aa647746e5602e Masahide NAKAMURA 2007-12-20  3677  			if (!xfrm_selector_match(&x->sel, &fl, family)) {
94b702cd72d496d Antony Antony     2023-12-21  3678  				ret = true;
94b702cd72d496d Antony Antony     2023-12-21  3679  				if (x->props.flags & XFRM_STATE_ICMP &&
94b702cd72d496d Antony Antony     2023-12-21  3680  				    xfrm_selector_inner_icmp_match(skb, family, &x->sel, &fl))
94b702cd72d496d Antony Antony     2023-12-21  3681  					ret = false;
94b702cd72d496d Antony Antony     2023-12-21  3682  				if (ret) {
59c9940ed0ef026 Alexey Dobriyan   2008-11-25  3683  					XFRM_INC_STATS(net, LINUX_MIB_XFRMINSTATEMISMATCH);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3684  					return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3685  				}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3686  			}
0aa647746e5602e Masahide NAKAMURA 2007-12-20  3687  		}
94b702cd72d496d Antony Antony     2023-12-21  3688  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3689  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3690  	pol = NULL;
bd5eb35f16a9c55 Eric Dumazet      2015-12-07  3691  	sk = sk_to_full_sk(sk);
3bccfbc7a7ba408 Venkat Yekkirala  2006-10-05  3692  	if (sk && sk->sk_policy[dir]) {
bc56b33404599ed Benedict Wong     2018-07-19  3693  		pol = xfrm_sk_policy_lookup(sk, dir, &fl, family, if_id);
0aa647746e5602e Masahide NAKAMURA 2007-12-20  3694  		if (IS_ERR(pol)) {
59c9940ed0ef026 Alexey Dobriyan   2008-11-25  3695  			XFRM_INC_STATS(net, LINUX_MIB_XFRMINPOLERROR);
3bccfbc7a7ba408 Venkat Yekkirala  2006-10-05  3696  			return 0;
3bccfbc7a7ba408 Venkat Yekkirala  2006-10-05  3697  		}
0aa647746e5602e Masahide NAKAMURA 2007-12-20  3698  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3699  
86dc8ee0b2c524d Florian Westphal  2017-07-17  3700  	if (!pol)
bc56b33404599ed Benedict Wong     2018-07-19  3701  		pol = xfrm_policy_lookup(net, &fl, family, dir, if_id);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3702  
0aa647746e5602e Masahide NAKAMURA 2007-12-20  3703  	if (IS_ERR(pol)) {
59c9940ed0ef026 Alexey Dobriyan   2008-11-25  3704  		XFRM_INC_STATS(net, LINUX_MIB_XFRMINPOLERROR);
134b0fc544ba062 James Morris      2006-10-05  3705  		return 0;
0aa647746e5602e Masahide NAKAMURA 2007-12-20  3706  	}
134b0fc544ba062 James Morris      2006-10-05  3707  
94b702cd72d496d Antony Antony     2023-12-21 @3708  	if (!pol && dir == XFRM_POLICY_FWD)
94b702cd72d496d Antony Antony     2023-12-21  3709  		pol = xfrm_in_fwd_icmp(skb, &fl, family, if_id);
94b702cd72d496d Antony Antony     2023-12-21  3710  
df0ba92a99ca757 Masahide NAKAMURA 2006-08-23  3711  	if (!pol) {
b58b1f563ab7895 Nicolas Dichtel   2022-03-14  3712  		if (net->xfrm.policy_default[dir] == XFRM_USERPOLICY_BLOCK) {
2d151d39073aff4 Steffen Klassert  2021-07-18  3713  			XFRM_INC_STATS(net, LINUX_MIB_XFRMINNOPOLS);
2d151d39073aff4 Steffen Klassert  2021-07-18  3714  			return 0;
2d151d39073aff4 Steffen Klassert  2021-07-18  3715  		}
2d151d39073aff4 Steffen Klassert  2021-07-18  3716  
2294be0f11e22b6 Florian Westphal  2018-12-18  3717  		if (sp && secpath_has_nontransport(sp, 0, &xerr_idx)) {
df0ba92a99ca757 Masahide NAKAMURA 2006-08-23  3718  			xfrm_secpath_reject(xerr_idx, skb, &fl);
59c9940ed0ef026 Alexey Dobriyan   2008-11-25  3719  			XFRM_INC_STATS(net, LINUX_MIB_XFRMINNOPOLS);
df0ba92a99ca757 Masahide NAKAMURA 2006-08-23  3720  			return 0;
df0ba92a99ca757 Masahide NAKAMURA 2006-08-23  3721  		}
df0ba92a99ca757 Masahide NAKAMURA 2006-08-23  3722  		return 1;
df0ba92a99ca757 Masahide NAKAMURA 2006-08-23  3723  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3724  
0a9e5794b21e2d1 Eric Dumazet      2023-01-26  3725  	/* This lockless write can happen from different cpus. */
0a9e5794b21e2d1 Eric Dumazet      2023-01-26  3726  	WRITE_ONCE(pol->curlft.use_time, ktime_get_real_seconds());
^1da177e4c3f415 Linus Torvalds    2005-04-16  3727  
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3728  	pols[0] = pol;
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3729  	npols++;
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3730  #ifdef CONFIG_XFRM_SUB_POLICY
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3731  	if (pols[0]->type != XFRM_POLICY_TYPE_MAIN) {
f6e1e25d703c0a9 Alexey Dobriyan   2008-11-25  3732  		pols[1] = xfrm_policy_lookup_bytype(net, XFRM_POLICY_TYPE_MAIN,
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3733  						    &fl, family,
bc56b33404599ed Benedict Wong     2018-07-19  3734  						    XFRM_POLICY_IN, if_id);
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3735  		if (pols[1]) {
0aa647746e5602e Masahide NAKAMURA 2007-12-20  3736  			if (IS_ERR(pols[1])) {
59c9940ed0ef026 Alexey Dobriyan   2008-11-25  3737  				XFRM_INC_STATS(net, LINUX_MIB_XFRMINPOLERROR);
9c9cb23e00ddf45 Xin Xiong         2022-07-24  3738  				xfrm_pol_put(pols[0]);
134b0fc544ba062 James Morris      2006-10-05  3739  				return 0;
0aa647746e5602e Masahide NAKAMURA 2007-12-20  3740  			}
0a9e5794b21e2d1 Eric Dumazet      2023-01-26  3741  			/* This write can happen from different cpus. */
0a9e5794b21e2d1 Eric Dumazet      2023-01-26  3742  			WRITE_ONCE(pols[1]->curlft.use_time,
0a9e5794b21e2d1 Eric Dumazet      2023-01-26  3743  				   ktime_get_real_seconds());
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3744  			npols++;
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3745  		}
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3746  	}
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3747  #endif
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3748  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3749  	if (pol->action == XFRM_POLICY_ALLOW) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3750  		static struct sec_path dummy;
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3751  		struct xfrm_tmpl *tp[XFRM_MAX_DEPTH];
41a49cc3c02ace5 Masahide NAKAMURA 2006-08-23  3752  		struct xfrm_tmpl *stp[XFRM_MAX_DEPTH];
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3753  		struct xfrm_tmpl **tpp = tp;
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3754  		int ti = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3755  		int i, k;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3756  
2294be0f11e22b6 Florian Westphal  2018-12-18  3757  		sp = skb_sec_path(skb);
2294be0f11e22b6 Florian Westphal  2018-12-18  3758  		if (!sp)
^1da177e4c3f415 Linus Torvalds    2005-04-16  3759  			sp = &dummy;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3760  
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3761  		for (pi = 0; pi < npols; pi++) {
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3762  			if (pols[pi] != pol &&
0aa647746e5602e Masahide NAKAMURA 2007-12-20  3763  			    pols[pi]->action != XFRM_POLICY_ALLOW) {
59c9940ed0ef026 Alexey Dobriyan   2008-11-25  3764  				XFRM_INC_STATS(net, LINUX_MIB_XFRMINPOLBLOCK);
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3765  				goto reject;
0aa647746e5602e Masahide NAKAMURA 2007-12-20  3766  			}
0aa647746e5602e Masahide NAKAMURA 2007-12-20  3767  			if (ti + pols[pi]->xfrm_nr >= XFRM_MAX_DEPTH) {
59c9940ed0ef026 Alexey Dobriyan   2008-11-25  3768  				XFRM_INC_STATS(net, LINUX_MIB_XFRMINBUFFERERROR);
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3769  				goto reject_error;
0aa647746e5602e Masahide NAKAMURA 2007-12-20  3770  			}
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3771  			for (i = 0; i < pols[pi]->xfrm_nr; i++)
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3772  				tpp[ti++] = &pols[pi]->xfrm_vec[i];
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3773  		}
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3774  		xfrm_nr = ti;
2d151d39073aff4 Steffen Klassert  2021-07-18  3775  
41a49cc3c02ace5 Masahide NAKAMURA 2006-08-23  3776  		if (npols > 1) {
3aaf3915a31aac8 Florian Westphal  2019-05-03  3777  			xfrm_tmpl_sort(stp, tpp, xfrm_nr, family);
41a49cc3c02ace5 Masahide NAKAMURA 2006-08-23  3778  			tpp = stp;
41a49cc3c02ace5 Masahide NAKAMURA 2006-08-23  3779  		}
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3780  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3781  		/* For each tunnel xfrm, find the first matching tmpl.
^1da177e4c3f415 Linus Torvalds    2005-04-16  3782  		 * For each tmpl before that, find corresponding xfrm.
^1da177e4c3f415 Linus Torvalds    2005-04-16  3783  		 * Order is _important_. Later we will implement
^1da177e4c3f415 Linus Torvalds    2005-04-16  3784  		 * some barriers, but at the moment barriers
^1da177e4c3f415 Linus Torvalds    2005-04-16  3785  		 * are implied between each two transformations.
1f8b6df6a997a43 Benedict Wong     2023-05-10  3786  		 * Upon success, marks secpath entries as having been
1f8b6df6a997a43 Benedict Wong     2023-05-10  3787  		 * verified to allow them to be skipped in future policy
1f8b6df6a997a43 Benedict Wong     2023-05-10  3788  		 * checks (e.g. nested tunnels).
^1da177e4c3f415 Linus Torvalds    2005-04-16  3789  		 */
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3790  		for (i = xfrm_nr-1, k = 0; i >= 0; i--) {
8680407b6f8f5fb Benedict Wong     2023-05-10  3791  			k = xfrm_policy_ok(tpp[i], sp, k, family, if_id);
df0ba92a99ca757 Masahide NAKAMURA 2006-08-23  3792  			if (k < 0) {
d1d9facfd1b326e James Morris      2006-09-01  3793  				if (k < -1)
d1d9facfd1b326e James Morris      2006-09-01  3794  					/* "-2 - errored_index" returned */
d1d9facfd1b326e James Morris      2006-09-01  3795  					xerr_idx = -(2+k);
59c9940ed0ef026 Alexey Dobriyan   2008-11-25  3796  				XFRM_INC_STATS(net, LINUX_MIB_XFRMINTMPLMISMATCH);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3797  				goto reject;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3798  			}
df0ba92a99ca757 Masahide NAKAMURA 2006-08-23  3799  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3800  
0aa647746e5602e Masahide NAKAMURA 2007-12-20  3801  		if (secpath_has_nontransport(sp, k, &xerr_idx)) {
59c9940ed0ef026 Alexey Dobriyan   2008-11-25  3802  			XFRM_INC_STATS(net, LINUX_MIB_XFRMINTMPLMISMATCH);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3803  			goto reject;
0aa647746e5602e Masahide NAKAMURA 2007-12-20  3804  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3805  
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3806  		xfrm_pols_put(pols, npols);
1f8b6df6a997a43 Benedict Wong     2023-05-10  3807  		sp->verified_cnt = k;
1f8b6df6a997a43 Benedict Wong     2023-05-10  3808  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3809  		return 1;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3810  	}
59c9940ed0ef026 Alexey Dobriyan   2008-11-25  3811  	XFRM_INC_STATS(net, LINUX_MIB_XFRMINPOLBLOCK);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3812  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3813  reject:
df0ba92a99ca757 Masahide NAKAMURA 2006-08-23  3814  	xfrm_secpath_reject(xerr_idx, skb, &fl);
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3815  reject_error:
4e81bb8336a0ac5 Masahide NAKAMURA 2006-08-23  3816  	xfrm_pols_put(pols, npols);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3817  	return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3818  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  3819  EXPORT_SYMBOL(__xfrm_policy_check);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3820  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
