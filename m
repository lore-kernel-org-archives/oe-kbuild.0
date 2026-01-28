Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE7E342CB0
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 23:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769644676; cv=none; b=WX+ygFC/+6CIYKEXnLZXe0XdrdKhkqu/BfI3Ni5KplDi9GXdhAth8M0ggHQCFMtMsCfLEJbF+4mYIVaIAQFObToj4YOXCp8zN4hizkYOYUCG79EaGxktf1P8K+d4QIOfwrbZB0xcICAnbvo1DeGKhKjgzFJOA/ZdnBFKo6bClBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769644676; c=relaxed/simple;
	bh=158/LLeI5lY44M2cDfYS6BTNJV1WWsuDiumbNE+VMCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hr7eeLGH7aaT689J42QNnJYZIy8swXvVIOlwGRaE3lYye3gwptTzVMXggtuo8LD/gZOl6njX/U+X5S/AYnsSq/g6Qw2yEdX2BqFR41P70lCwY4EaDMajiZDvLbnnuBbabUDuqfZJ5rWdgICC9dyxN40Lb9uq23N460xwRo363YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNrMUaMF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNrMUaMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769644675; x=1801180675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=158/LLeI5lY44M2cDfYS6BTNJV1WWsuDiumbNE+VMCU=;
  b=LNrMUaMFJC2y0rh5/fVAUsOkH+Atfd4hT6kgeuZuWF0n74yHjG6ccB7m
   SPxdp33Bbs1IbeMpLfdyYeaoatKf+5JOjpws03FEkegwjalMLz6qA/aDV
   OIK/V3lPZsmAjb9sF8o09PRamI1GZnoVHNP5V50i5FEMC59sGxH5lYXxe
   ah9UALjzVKxX+SK3haZKJhPAkraYJVdSHVXFgD+oFboTYikgctu0lUGBF
   Z6IQZYPgYFySgpybntMnPcj+HvyY0r1gqLGLjJP0ntUXmXAI45RzVbgnu
   Ou526RDsMl3XGXB9CiQCDbFqRew5KELVJy/rrmsr/Du2SAyiLXtBsegmE
   g==;
X-CSE-ConnectionGUID: MtJ9JdQ5S4+lskQ0KWWs1w==
X-CSE-MsgGUID: iD5wPunuQma6vmDYV2ieOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81600615"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81600615"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 15:57:53 -0800
X-CSE-ConnectionGUID: gB2dTL4RTGmewiAvm7VXwg==
X-CSE-MsgGUID: b5uiDe6PT52KA5I9jNbi/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="231341543"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2026 15:57:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlFPx-00000000avA-2GKt;
	Wed, 28 Jan 2026 23:57:49 +0000
Date: Thu, 29 Jan 2026 07:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v1] icmp: fix ip_rt_bug race in
 icmp_route_lookup reverse path
Message-ID: <202601290724.4TPPHx86-lkp@intel.com>
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
In-Reply-To: <20260128090523.356953-1-jiayuan.chen@linux.dev>
References: <20260128090523.356953-1-jiayuan.chen@linux.dev>
TO: Jiayuan Chen <jiayuan.chen@linux.dev>
TO: netdev@vger.kernel.org
CC: Jiayuan Chen <jiayuan.chen@shopee.com>
CC: syzbot+e738404dcd14b620923c@syzkaller.appspotmail.com
CC: David Ahern <dsahern@kernel.org>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: linux-kernel@vger.kernel.org

Hi Jiayuan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiayuan-Chen/icmp-fix-ip_rt_bug-race-in-icmp_route_lookup-reverse-path/20260128-170826
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260128090523.356953-1-jiayuan.chen%40linux.dev
patch subject: [PATCH net-next v1] icmp: fix ip_rt_bug race in icmp_route_lookup reverse path
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-141-20260129 (https://download.01.org/0day-ci/archive/20260129/202601290724.4TPPHx86-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601290724.4TPPHx86-lkp@intel.com/

smatch warnings:
net/ipv4/icmp.c:604 icmp_route_lookup() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +604 net/ipv4/icmp.c

e1e84eb58eb494 Mathieu Desnoyers   2020-10-12  485  
913c83a610bb7d Guillaume Nault     2024-10-01  486  static struct rtable *icmp_route_lookup(struct net *net, struct flowi4 *fl4,
77968b78242ee2 David S. Miller     2011-05-08  487  					struct sk_buff *skb_in,
913c83a610bb7d Guillaume Nault     2024-10-01  488  					const struct iphdr *iph, __be32 saddr,
913c83a610bb7d Guillaume Nault     2024-10-01  489  					dscp_t dscp, u32 mark, int type,
913c83a610bb7d Guillaume Nault     2024-10-01  490  					int code, struct icmp_bxm *param)
f6d460cf0ed16d David S. Miller     2011-03-01  491  {
e1e84eb58eb494 Mathieu Desnoyers   2020-10-12  492  	struct net_device *route_lookup_dev;
05d6d492097c55 Eric Dumazet        2024-04-29  493  	struct dst_entry *dst, *dst2;
f6d460cf0ed16d David S. Miller     2011-03-01  494  	struct rtable *rt, *rt2;
415b3334a21aa6 David S. Miller     2011-07-22  495  	struct flowi4 fl4_dec;
f6d460cf0ed16d David S. Miller     2011-03-01  496  	int err;
f6d460cf0ed16d David S. Miller     2011-03-01  497  
77968b78242ee2 David S. Miller     2011-05-08  498  	memset(fl4, 0, sizeof(*fl4));
c86af46b9c7af2 Gustavo A. R. Silva 2026-01-05  499  	fl4->daddr = (param->replyopts.opt.srr ?
c86af46b9c7af2 Gustavo A. R. Silva 2026-01-05  500  		      param->replyopts.opt.faddr : iph->saddr);
77968b78242ee2 David S. Miller     2011-05-08  501  	fl4->saddr = saddr;
e110861f86094c Lorenzo Colitti     2014-05-13  502  	fl4->flowi4_mark = mark;
e2d118a1cb5e60 Lorenzo Colitti     2016-11-04  503  	fl4->flowi4_uid = sock_net_uid(net, NULL);
1bec9d0c0046fe Guillaume Nault     2025-08-25  504  	fl4->flowi4_dscp = dscp;
77968b78242ee2 David S. Miller     2011-05-08  505  	fl4->flowi4_proto = IPPROTO_ICMP;
77968b78242ee2 David S. Miller     2011-05-08  506  	fl4->fl4_icmp_type = type;
77968b78242ee2 David S. Miller     2011-05-08  507  	fl4->fl4_icmp_code = code;
e1e84eb58eb494 Mathieu Desnoyers   2020-10-12  508  	route_lookup_dev = icmp_get_route_lookup_dev(skb_in);
e1e84eb58eb494 Mathieu Desnoyers   2020-10-12  509  	fl4->flowi4_oif = l3mdev_master_ifindex(route_lookup_dev);
613d09b30f8b58 David Ahern         2015-08-13  510  
3df98d79215ace Paul Moore          2020-09-27  511  	security_skb_classify_flow(skb_in, flowi4_to_flowi_common(fl4));
3abd1ade6765e8 David Ahern         2017-05-25  512  	rt = ip_route_output_key_hash(net, fl4, skb_in);
b23dd4fe42b455 David S. Miller     2011-03-02  513  	if (IS_ERR(rt))
b23dd4fe42b455 David S. Miller     2011-03-02  514  		return rt;
f6d460cf0ed16d David S. Miller     2011-03-01  515  
f6d460cf0ed16d David S. Miller     2011-03-01  516  	/* No need to clone since we're just using its address. */
f6d460cf0ed16d David S. Miller     2011-03-01  517  	rt2 = rt;
f6d460cf0ed16d David S. Miller     2011-03-01  518  
05d6d492097c55 Eric Dumazet        2024-04-29  519  	dst = xfrm_lookup(net, &rt->dst,
77968b78242ee2 David S. Miller     2011-05-08  520  			  flowi4_to_flowi(fl4), NULL, 0);
05d6d492097c55 Eric Dumazet        2024-04-29  521  	rt = dst_rtable(dst);
05d6d492097c55 Eric Dumazet        2024-04-29  522  	if (!IS_ERR(dst)) {
f6d460cf0ed16d David S. Miller     2011-03-01  523  		if (rt != rt2)
f6d460cf0ed16d David S. Miller     2011-03-01  524  			return rt;
c44daa7e3c7322 Dong Chenchen       2024-11-27  525  		if (inet_addr_type_dev_table(net, route_lookup_dev,
c44daa7e3c7322 Dong Chenchen       2024-11-27  526  					     fl4->daddr) == RTN_LOCAL)
c44daa7e3c7322 Dong Chenchen       2024-11-27  527  			return rt;
05d6d492097c55 Eric Dumazet        2024-04-29  528  	} else if (PTR_ERR(dst) == -EPERM) {
f6d460cf0ed16d David S. Miller     2011-03-01  529  		rt = NULL;
05d6d492097c55 Eric Dumazet        2024-04-29  530  	} else {
452edd598f6052 David S. Miller     2011-03-02  531  		return rt;
05d6d492097c55 Eric Dumazet        2024-04-29  532  	}
2b1dc6285c3f6e Florian Westphal    2023-10-04  533  	err = xfrm_decode_session_reverse(net, skb_in, flowi4_to_flowi(&fl4_dec), AF_INET);
f6d460cf0ed16d David S. Miller     2011-03-01  534  	if (err)
f6d460cf0ed16d David S. Miller     2011-03-01  535  		goto relookup_failed;
f6d460cf0ed16d David S. Miller     2011-03-01  536  
e1e84eb58eb494 Mathieu Desnoyers   2020-10-12  537  	if (inet_addr_type_dev_table(net, route_lookup_dev,
30bbaa19500559 David Ahern         2015-08-13  538  				     fl4_dec.saddr) == RTN_LOCAL) {
415b3334a21aa6 David S. Miller     2011-07-22  539  		rt2 = __ip_route_output_key(net, &fl4_dec);
b23dd4fe42b455 David S. Miller     2011-03-02  540  		if (IS_ERR(rt2))
b23dd4fe42b455 David S. Miller     2011-03-02  541  			err = PTR_ERR(rt2);
f6d460cf0ed16d David S. Miller     2011-03-01  542  	} else {
9d6ec938019c6b David S. Miller     2011-03-12  543  		struct flowi4 fl4_2 = {};
f6d460cf0ed16d David S. Miller     2011-03-01  544  		unsigned long orefdst;
f6d460cf0ed16d David S. Miller     2011-03-01  545  
415b3334a21aa6 David S. Miller     2011-07-22  546  		fl4_2.daddr = fl4_dec.saddr;
9d6ec938019c6b David S. Miller     2011-03-12  547  		rt2 = ip_route_output_key(net, &fl4_2);
b23dd4fe42b455 David S. Miller     2011-03-02  548  		if (IS_ERR(rt2)) {
b23dd4fe42b455 David S. Miller     2011-03-02  549  			err = PTR_ERR(rt2);
f6d460cf0ed16d David S. Miller     2011-03-01  550  			goto relookup_failed;
b23dd4fe42b455 David S. Miller     2011-03-02  551  		}
f6d460cf0ed16d David S. Miller     2011-03-01  552  		/* Ugh! */
e97e6a1830ddb5 Stanislav Fomichev  2025-08-18  553  		orefdst = skb_dstref_steal(skb_in);
415b3334a21aa6 David S. Miller     2011-07-22  554  		err = ip_route_input(skb_in, fl4_dec.daddr, fl4_dec.saddr,
50038bf38e6577 Menglong Dong       2024-11-07  555  				     dscp, rt2->dst.dev) ? -EINVAL : 0;
f6d460cf0ed16d David S. Miller     2011-03-01  556  
f6d460cf0ed16d David S. Miller     2011-03-01  557  		dst_release(&rt2->dst);
f6d460cf0ed16d David S. Miller     2011-03-01  558  		rt2 = skb_rtable(skb_in);
e97e6a1830ddb5 Stanislav Fomichev  2025-08-18  559  		/* steal dst entry from skb_in, don't drop refcnt */
e97e6a1830ddb5 Stanislav Fomichev  2025-08-18  560  		skb_dstref_steal(skb_in);
e97e6a1830ddb5 Stanislav Fomichev  2025-08-18  561  		skb_dstref_restore(skb_in, orefdst);
fb56f93cae5c6b Jiayuan Chen        2026-01-28  562  
fb56f93cae5c6b Jiayuan Chen        2026-01-28  563  		/*
fb56f93cae5c6b Jiayuan Chen        2026-01-28  564  		 * At this point, fl4_dec.daddr should NOT be local (we
fb56f93cae5c6b Jiayuan Chen        2026-01-28  565  		 * checked fl4_dec.saddr above). However, a race condition
fb56f93cae5c6b Jiayuan Chen        2026-01-28  566  		 * may occur if the address is added to the interface
fb56f93cae5c6b Jiayuan Chen        2026-01-28  567  		 * concurrently. In that case, ip_route_input() returns a
fb56f93cae5c6b Jiayuan Chen        2026-01-28  568  		 * LOCAL route with dst.output=ip_rt_bug, which must not
fb56f93cae5c6b Jiayuan Chen        2026-01-28  569  		 * be used for output.
fb56f93cae5c6b Jiayuan Chen        2026-01-28  570  		 */
fb56f93cae5c6b Jiayuan Chen        2026-01-28  571  		if (!err && rt2 && rt2->rt_type == RTN_LOCAL) {
fb56f93cae5c6b Jiayuan Chen        2026-01-28  572  			net_warn_ratelimited("%s: detected local route for %pI4 "
fb56f93cae5c6b Jiayuan Chen        2026-01-28  573  					     "during ICMP error handling (src %pI4), "
fb56f93cae5c6b Jiayuan Chen        2026-01-28  574  					     "possible address race\n",
fb56f93cae5c6b Jiayuan Chen        2026-01-28  575  					     __func__, &fl4_dec.daddr, &fl4_dec.saddr);
fb56f93cae5c6b Jiayuan Chen        2026-01-28  576  			dst_release(&rt2->dst);
fb56f93cae5c6b Jiayuan Chen        2026-01-28  577  			err = -EINVAL;
fb56f93cae5c6b Jiayuan Chen        2026-01-28  578  		}
f6d460cf0ed16d David S. Miller     2011-03-01  579  	}
f6d460cf0ed16d David S. Miller     2011-03-01  580  
f6d460cf0ed16d David S. Miller     2011-03-01  581  	if (err)
f6d460cf0ed16d David S. Miller     2011-03-01  582  		goto relookup_failed;
f6d460cf0ed16d David S. Miller     2011-03-01  583  
05d6d492097c55 Eric Dumazet        2024-04-29  584  	dst2 = xfrm_lookup(net, &rt2->dst, flowi4_to_flowi(&fl4_dec), NULL,
9d6ec938019c6b David S. Miller     2011-03-12  585  			   XFRM_LOOKUP_ICMP);
05d6d492097c55 Eric Dumazet        2024-04-29  586  	rt2 = dst_rtable(dst2);
05d6d492097c55 Eric Dumazet        2024-04-29  587  	if (!IS_ERR(dst2)) {
f6d460cf0ed16d David S. Miller     2011-03-01  588  		dst_release(&rt->dst);
415b3334a21aa6 David S. Miller     2011-07-22  589  		memcpy(fl4, &fl4_dec, sizeof(*fl4));
f6d460cf0ed16d David S. Miller     2011-03-01  590  		rt = rt2;
05d6d492097c55 Eric Dumazet        2024-04-29  591  	} else if (PTR_ERR(dst2) == -EPERM) {
452edd598f6052 David S. Miller     2011-03-02  592  		if (rt)
452edd598f6052 David S. Miller     2011-03-02  593  			dst_release(&rt->dst);
452edd598f6052 David S. Miller     2011-03-02  594  		return rt2;
452edd598f6052 David S. Miller     2011-03-02  595  	} else {
05d6d492097c55 Eric Dumazet        2024-04-29  596  		err = PTR_ERR(dst2);
452edd598f6052 David S. Miller     2011-03-02  597  		goto relookup_failed;
f6d460cf0ed16d David S. Miller     2011-03-01  598  	}
f6d460cf0ed16d David S. Miller     2011-03-01  599  	return rt;
f6d460cf0ed16d David S. Miller     2011-03-01  600  
f6d460cf0ed16d David S. Miller     2011-03-01  601  relookup_failed:
f6d460cf0ed16d David S. Miller     2011-03-01  602  	if (rt)
f6d460cf0ed16d David S. Miller     2011-03-01  603  		return rt;
f6d460cf0ed16d David S. Miller     2011-03-01 @604  	return ERR_PTR(err);
f6d460cf0ed16d David S. Miller     2011-03-01  605  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  606  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
