Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ADF2C08DC
	for <oe-kbuild@lists.linux.dev>; Mon, 11 May 2026 05:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778478877; cv=none; b=mo+uQI5DH2HCjUuqQh8/VXDJaPaimg7HP46j4DBw6rj4nag14LdAJ+BI3sEjHtSK4Bk9/t7s2zAoW9glq8dSZOMpYAfL2/bqEbKZu7m+l/vl4DXPbN088gSf8LArXPMn+ZUK0ODnQWSoCXwebjZgGUYKOfb0Y2Emd3/wC//7fto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778478877; c=relaxed/simple;
	bh=dZr1deMMIn+1WQCXvi2p01CKYzV6AvCFo8uSG0R5oZs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XJ7+ptIcIg8yrc+VGNDmLw20W6rlntjUtr6CdcCQOujsopdDxsbgS4yAdeDyGXpBDv1mR0XKopWDuMfMDiZ/RFUsOxABi4ffw3RrSEruz8mh2/RT19JIH2lwr/jyEcnxAok/7aF1m+VhhNhhXrHi94mJTOAz+Pb/0Pt84Z8rKY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2qEN2S5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2qEN2S5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778478874; x=1810014874;
  h=date:from:to:cc:subject:message-id;
  bh=dZr1deMMIn+1WQCXvi2p01CKYzV6AvCFo8uSG0R5oZs=;
  b=I2qEN2S521ZB9HpiIAnUhyPJvtZDy5TSlb1LQ+zUG1jwY6GMbgpefZH5
   LboebezRTDAy4IdBfJR6lOxKvc5NTHLP9s+czj9VYuhxN8F3+oFfuv23Z
   A8h2kE/3YutIs2XjgL+cSLfDQsychbW8m3vEuq339PpABjfUys1Ht8hmz
   2YQXZ511y4GRmlvAUVDDuZ27CO3uGrCKHzMOMnJTpJcvrOLNBYwDzXsII
   4DkmdyvJviTgc0tJVRJW7w8fdMVKcGde5fADYl8rj7Tf59XFSPEq4p+xV
   QdHUHa0AA+jQThctRzqaBAxS48/+cRo99/JIzZZ5mTo+vomk6/Exvz2YJ
   A==;
X-CSE-ConnectionGUID: NY4eX1C/R7WtW0xG4CH+lA==
X-CSE-MsgGUID: ALtKZGaLQo677vD3v6yBgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="104817910"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="104817910"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 22:54:34 -0700
X-CSE-ConnectionGUID: xMYyfxHLTciICehl5vdBAw==
X-CSE-MsgGUID: NMkS7zp0T5iBEWyZpvEbDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="275493291"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 May 2026 22:54:32 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMJb4-000000000DN-0157;
	Mon, 11 May 2026 05:54:30 +0000
Date: Mon, 11 May 2026 13:53:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12063/13385] net/ipv4/icmp.c:597
 icmp_route_lookup() warn: passing zero to 'ERR_PTR'
Message-ID: <202605111349.dQpYN8JD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiayuan Chen <jiayuan.chen@shopee.com>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: 81b84de32bb27ae1ae2eb9acf0420e9d0d14bf00 [12063/13385] xfrm: fix ip_rt_bug race in icmp_route_lookup reverse path
:::::: branch date: 3 days ago
:::::: commit date: 3 months ago
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260511/202605111349.dQpYN8JD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605111349.dQpYN8JD-lkp@intel.com/

smatch warnings:
net/ipv4/icmp.c:597 icmp_route_lookup() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +597 net/ipv4/icmp.c

e1e84eb58eb494b Mathieu Desnoyers  2020-10-12  480  
913c83a610bb7dd Guillaume Nault    2024-10-01  481  static struct rtable *icmp_route_lookup(struct net *net, struct flowi4 *fl4,
77968b78242ee25 David S. Miller    2011-05-08  482  					struct sk_buff *skb_in,
913c83a610bb7dd Guillaume Nault    2024-10-01  483  					const struct iphdr *iph, __be32 saddr,
913c83a610bb7dd Guillaume Nault    2024-10-01  484  					dscp_t dscp, u32 mark, int type,
913c83a610bb7dd Guillaume Nault    2024-10-01  485  					int code, struct icmp_bxm *param)
f6d460cf0ed16d3 David S. Miller    2011-03-01  486  {
e1e84eb58eb494b Mathieu Desnoyers  2020-10-12  487  	struct net_device *route_lookup_dev;
05d6d492097c55f Eric Dumazet       2024-04-29  488  	struct dst_entry *dst, *dst2;
f6d460cf0ed16d3 David S. Miller    2011-03-01  489  	struct rtable *rt, *rt2;
415b3334a21aa67 David S. Miller    2011-07-22  490  	struct flowi4 fl4_dec;
f6d460cf0ed16d3 David S. Miller    2011-03-01  491  	int err;
f6d460cf0ed16d3 David S. Miller    2011-03-01  492  
77968b78242ee25 David S. Miller    2011-05-08  493  	memset(fl4, 0, sizeof(*fl4));
77968b78242ee25 David S. Miller    2011-05-08  494  	fl4->daddr = (param->replyopts.opt.opt.srr ?
77968b78242ee25 David S. Miller    2011-05-08  495  		      param->replyopts.opt.opt.faddr : iph->saddr);
77968b78242ee25 David S. Miller    2011-05-08  496  	fl4->saddr = saddr;
e110861f86094cd Lorenzo Colitti    2014-05-13  497  	fl4->flowi4_mark = mark;
e2d118a1cb5e60d Lorenzo Colitti    2016-11-04  498  	fl4->flowi4_uid = sock_net_uid(net, NULL);
1bec9d0c0046fe4 Guillaume Nault    2025-08-25  499  	fl4->flowi4_dscp = dscp;
77968b78242ee25 David S. Miller    2011-05-08  500  	fl4->flowi4_proto = IPPROTO_ICMP;
77968b78242ee25 David S. Miller    2011-05-08  501  	fl4->fl4_icmp_type = type;
77968b78242ee25 David S. Miller    2011-05-08  502  	fl4->fl4_icmp_code = code;
e1e84eb58eb494b Mathieu Desnoyers  2020-10-12  503  	route_lookup_dev = icmp_get_route_lookup_dev(skb_in);
e1e84eb58eb494b Mathieu Desnoyers  2020-10-12  504  	fl4->flowi4_oif = l3mdev_master_ifindex(route_lookup_dev);
613d09b30f8b589 David Ahern        2015-08-13  505  
3df98d79215ace1 Paul Moore         2020-09-27  506  	security_skb_classify_flow(skb_in, flowi4_to_flowi_common(fl4));
3abd1ade6765e8e David Ahern        2017-05-25  507  	rt = ip_route_output_key_hash(net, fl4, skb_in);
b23dd4fe42b455a David S. Miller    2011-03-02  508  	if (IS_ERR(rt))
b23dd4fe42b455a David S. Miller    2011-03-02  509  		return rt;
f6d460cf0ed16d3 David S. Miller    2011-03-01  510  
f6d460cf0ed16d3 David S. Miller    2011-03-01  511  	/* No need to clone since we're just using its address. */
f6d460cf0ed16d3 David S. Miller    2011-03-01  512  	rt2 = rt;
f6d460cf0ed16d3 David S. Miller    2011-03-01  513  
05d6d492097c55f Eric Dumazet       2024-04-29  514  	dst = xfrm_lookup(net, &rt->dst,
77968b78242ee25 David S. Miller    2011-05-08  515  			  flowi4_to_flowi(fl4), NULL, 0);
05d6d492097c55f Eric Dumazet       2024-04-29  516  	rt = dst_rtable(dst);
05d6d492097c55f Eric Dumazet       2024-04-29  517  	if (!IS_ERR(dst)) {
f6d460cf0ed16d3 David S. Miller    2011-03-01  518  		if (rt != rt2)
f6d460cf0ed16d3 David S. Miller    2011-03-01  519  			return rt;
c44daa7e3c73229 Dong Chenchen      2024-11-27  520  		if (inet_addr_type_dev_table(net, route_lookup_dev,
c44daa7e3c73229 Dong Chenchen      2024-11-27  521  					     fl4->daddr) == RTN_LOCAL)
c44daa7e3c73229 Dong Chenchen      2024-11-27  522  			return rt;
05d6d492097c55f Eric Dumazet       2024-04-29  523  	} else if (PTR_ERR(dst) == -EPERM) {
f6d460cf0ed16d3 David S. Miller    2011-03-01  524  		rt = NULL;
05d6d492097c55f Eric Dumazet       2024-04-29  525  	} else {
452edd598f60522 David S. Miller    2011-03-02  526  		return rt;
05d6d492097c55f Eric Dumazet       2024-04-29  527  	}
2b1dc6285c3f6e6 Florian Westphal   2023-10-04  528  	err = xfrm_decode_session_reverse(net, skb_in, flowi4_to_flowi(&fl4_dec), AF_INET);
f6d460cf0ed16d3 David S. Miller    2011-03-01  529  	if (err)
f6d460cf0ed16d3 David S. Miller    2011-03-01  530  		goto relookup_failed;
f6d460cf0ed16d3 David S. Miller    2011-03-01  531  
e1e84eb58eb494b Mathieu Desnoyers  2020-10-12  532  	if (inet_addr_type_dev_table(net, route_lookup_dev,
30bbaa19500559d David Ahern        2015-08-13  533  				     fl4_dec.saddr) == RTN_LOCAL) {
415b3334a21aa67 David S. Miller    2011-07-22  534  		rt2 = __ip_route_output_key(net, &fl4_dec);
b23dd4fe42b455a David S. Miller    2011-03-02  535  		if (IS_ERR(rt2))
b23dd4fe42b455a David S. Miller    2011-03-02  536  			err = PTR_ERR(rt2);
f6d460cf0ed16d3 David S. Miller    2011-03-01  537  	} else {
9d6ec938019c6b1 David S. Miller    2011-03-12  538  		struct flowi4 fl4_2 = {};
f6d460cf0ed16d3 David S. Miller    2011-03-01  539  		unsigned long orefdst;
f6d460cf0ed16d3 David S. Miller    2011-03-01  540  
415b3334a21aa67 David S. Miller    2011-07-22  541  		fl4_2.daddr = fl4_dec.saddr;
9d6ec938019c6b1 David S. Miller    2011-03-12  542  		rt2 = ip_route_output_key(net, &fl4_2);
b23dd4fe42b455a David S. Miller    2011-03-02  543  		if (IS_ERR(rt2)) {
b23dd4fe42b455a David S. Miller    2011-03-02  544  			err = PTR_ERR(rt2);
f6d460cf0ed16d3 David S. Miller    2011-03-01  545  			goto relookup_failed;
b23dd4fe42b455a David S. Miller    2011-03-02  546  		}
f6d460cf0ed16d3 David S. Miller    2011-03-01  547  		/* Ugh! */
e97e6a1830ddb58 Stanislav Fomichev 2025-08-18  548  		orefdst = skb_dstref_steal(skb_in);
415b3334a21aa67 David S. Miller    2011-07-22  549  		err = ip_route_input(skb_in, fl4_dec.daddr, fl4_dec.saddr,
50038bf38e6577a Menglong Dong      2024-11-07  550  				     dscp, rt2->dst.dev) ? -EINVAL : 0;
f6d460cf0ed16d3 David S. Miller    2011-03-01  551  
f6d460cf0ed16d3 David S. Miller    2011-03-01  552  		dst_release(&rt2->dst);
f6d460cf0ed16d3 David S. Miller    2011-03-01  553  		rt2 = skb_rtable(skb_in);
e97e6a1830ddb58 Stanislav Fomichev 2025-08-18  554  		/* steal dst entry from skb_in, don't drop refcnt */
e97e6a1830ddb58 Stanislav Fomichev 2025-08-18  555  		skb_dstref_steal(skb_in);
e97e6a1830ddb58 Stanislav Fomichev 2025-08-18  556  		skb_dstref_restore(skb_in, orefdst);
81b84de32bb27ae Jiayuan Chen       2026-02-06  557  
81b84de32bb27ae Jiayuan Chen       2026-02-06  558  		/*
81b84de32bb27ae Jiayuan Chen       2026-02-06  559  		 * At this point, fl4_dec.daddr should NOT be local (we
81b84de32bb27ae Jiayuan Chen       2026-02-06  560  		 * checked fl4_dec.saddr above). However, a race condition
81b84de32bb27ae Jiayuan Chen       2026-02-06  561  		 * may occur if the address is added to the interface
81b84de32bb27ae Jiayuan Chen       2026-02-06  562  		 * concurrently. In that case, ip_route_input() returns a
81b84de32bb27ae Jiayuan Chen       2026-02-06  563  		 * LOCAL route with dst.output=ip_rt_bug, which must not
81b84de32bb27ae Jiayuan Chen       2026-02-06  564  		 * be used for output.
81b84de32bb27ae Jiayuan Chen       2026-02-06  565  		 */
81b84de32bb27ae Jiayuan Chen       2026-02-06  566  		if (!err && rt2 && rt2->rt_type == RTN_LOCAL) {
81b84de32bb27ae Jiayuan Chen       2026-02-06  567  			net_warn_ratelimited("detected local route for %pI4 during ICMP sending, src %pI4\n",
81b84de32bb27ae Jiayuan Chen       2026-02-06  568  					     &fl4_dec.daddr, &fl4_dec.saddr);
81b84de32bb27ae Jiayuan Chen       2026-02-06  569  			dst_release(&rt2->dst);
81b84de32bb27ae Jiayuan Chen       2026-02-06  570  			err = -EINVAL;
81b84de32bb27ae Jiayuan Chen       2026-02-06  571  		}
f6d460cf0ed16d3 David S. Miller    2011-03-01  572  	}
f6d460cf0ed16d3 David S. Miller    2011-03-01  573  
f6d460cf0ed16d3 David S. Miller    2011-03-01  574  	if (err)
f6d460cf0ed16d3 David S. Miller    2011-03-01  575  		goto relookup_failed;
f6d460cf0ed16d3 David S. Miller    2011-03-01  576  
05d6d492097c55f Eric Dumazet       2024-04-29  577  	dst2 = xfrm_lookup(net, &rt2->dst, flowi4_to_flowi(&fl4_dec), NULL,
9d6ec938019c6b1 David S. Miller    2011-03-12  578  			   XFRM_LOOKUP_ICMP);
05d6d492097c55f Eric Dumazet       2024-04-29  579  	rt2 = dst_rtable(dst2);
05d6d492097c55f Eric Dumazet       2024-04-29  580  	if (!IS_ERR(dst2)) {
f6d460cf0ed16d3 David S. Miller    2011-03-01  581  		dst_release(&rt->dst);
415b3334a21aa67 David S. Miller    2011-07-22  582  		memcpy(fl4, &fl4_dec, sizeof(*fl4));
f6d460cf0ed16d3 David S. Miller    2011-03-01  583  		rt = rt2;
05d6d492097c55f Eric Dumazet       2024-04-29  584  	} else if (PTR_ERR(dst2) == -EPERM) {
452edd598f60522 David S. Miller    2011-03-02  585  		if (rt)
452edd598f60522 David S. Miller    2011-03-02  586  			dst_release(&rt->dst);
452edd598f60522 David S. Miller    2011-03-02  587  		return rt2;
452edd598f60522 David S. Miller    2011-03-02  588  	} else {
05d6d492097c55f Eric Dumazet       2024-04-29  589  		err = PTR_ERR(dst2);
452edd598f60522 David S. Miller    2011-03-02  590  		goto relookup_failed;
f6d460cf0ed16d3 David S. Miller    2011-03-01  591  	}
f6d460cf0ed16d3 David S. Miller    2011-03-01  592  	return rt;
f6d460cf0ed16d3 David S. Miller    2011-03-01  593  
f6d460cf0ed16d3 David S. Miller    2011-03-01  594  relookup_failed:
f6d460cf0ed16d3 David S. Miller    2011-03-01  595  	if (rt)
f6d460cf0ed16d3 David S. Miller    2011-03-01  596  		return rt;
f6d460cf0ed16d3 David S. Miller    2011-03-01 @597  	return ERR_PTR(err);
f6d460cf0ed16d3 David S. Miller    2011-03-01  598  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  599  

:::::: The code at line 597 was first introduced by commit
:::::: f6d460cf0ed16d35aec48f823685e7a0e0283d84 ipv4: Make icmp route lookup code a bit clearer.

:::::: TO: David S. Miller <davem@davemloft.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
