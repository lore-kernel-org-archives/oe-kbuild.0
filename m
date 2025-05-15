Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CE210E5
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747307077; cv=none; b=JpMj2L9I3S6C9ruePrv3QtDl39s6f4eC0wcBLI9hD5m67AW1xzi4afnWiaMSa83OfcimukCixB9nIiscGiMgFtts/DCNkc/qle+57fdr5C0YpnGn4TGNIyocAdStdAeUp6SV12T+tmdTLGcod1j2Bpp9gxmEbLpsjo1csWJaHPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747307077; c=relaxed/simple;
	bh=1zXZDf3rkjI+gweAuB1pWlf6MX2sEJ+19C3vFWbXUS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nshjdfkUye1D8XxtwzHUHFDrtA0r4X3pWiGvT69BR+oxuKlkkaK0Da/yuC3riEm3Me9PBAbV9xRg4wZSk3lmyxTm2QDt2PAjOJkXMiBusMCux1z2TRwEgTWmdX/SH3qzWGPW2o55zZ2UAIzSpTGfF4UDxs3ou3qXOzEMcuSDtn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aF2CJs39; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aF2CJs39"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747307075; x=1778843075;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1zXZDf3rkjI+gweAuB1pWlf6MX2sEJ+19C3vFWbXUS4=;
  b=aF2CJs39BVlbQr1k4hgHojUe13DTAxem5EWPpeoiowd2Bkqe3ga3Xs75
   nA/gYdDZWq6LjjcuT07Bm2+4QaE47O9wt2Ft6HG7q5DIi59KF4zt9lPL9
   h65Eu7SoJflRBADsKWxAVwOgg2xX9Ox56YyKNodixoiw0W/fMp5FYgtN7
   Xc6BreGZrQ+yxOWIN8j6WI7+KoCzAHJfj7Jct13bxKdlJOSTYmS6L92ke
   78Zssm5MxqoNHj0PANqlZ67yB/WYmdORKTLh2exC9zh6FzZjvGQ5CW0MB
   vWz+K7Ft5lBVjGpzyWWm5k4GCwPahCM2uyv4qSV24A3LGtohMijo9JhOv
   g==;
X-CSE-ConnectionGUID: AjdUvKHLTg264R8fbvr/QA==
X-CSE-MsgGUID: km7DOHIGQBK9eWLZOlZT+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60573545"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60573545"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:04:31 -0700
X-CSE-ConnectionGUID: HPAgJqqeRHKAJ9uZMk/hDQ==
X-CSE-MsgGUID: G6cZvJikRLaYU+KJ5WQ6Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143444365"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 May 2025 04:04:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFWO3-000IIR-21;
	Thu, 15 May 2025 11:04:27 +0000
Date: Thu, 15 May 2025 19:04:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 net-next 5/7] Revert "ipv6: Factorise
 ip6_route_multipath_add()."
Message-ID: <202505151832.8LKeQ1aJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250514201943.74456-6-kuniyu@amazon.com>
References: <20250514201943.74456-6-kuniyu@amazon.com>
TO: Kuniyuki Iwashima <kuniyu@amazon.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: David Ahern <dsahern@kernel.org>
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Kuniyuki Iwashima <kuniyu@amazon.com>

Hi Kuniyuki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/ipv6-Remove-rcu_read_lock-in-fib6_get_table/20250515-042623
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250514201943.74456-6-kuniyu%40amazon.com
patch subject: [PATCH v1 net-next 5/7] Revert "ipv6: Factorise ip6_route_multipath_add()."
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-161-20250515 (https://download.01.org/0day-ci/archive/20250515/202505151832.8LKeQ1aJ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505151832.8LKeQ1aJ-lkp@intel.com/

New smatch warnings:
net/ipv6/route.c:5584 ip6_route_multipath_add() error: uninitialized symbol 'err'.

Old smatch warnings:
net/ipv6/route.c:3471 ip6_route_check_nh() error: we previously assumed '_dev' could be null (see line 3431)
net/ipv6/route.c:5878 rt6_fill_node() error: we previously assumed 'dst' could be null (see line 5863)

vim +/err +5584 net/ipv6/route.c

0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5413  
333c430167c21b David Ahern          2017-05-21  5414  static int ip6_route_multipath_add(struct fib6_config *cfg,
333c430167c21b David Ahern          2017-05-21  5415  				   struct netlink_ext_ack *extack)
51ebd3181572af Nicolas Dichtel      2012-10-22  5416  {
8d1c802b2815ed David Ahern          2018-04-17  5417  	struct fib6_info *rt_notif = NULL, *rt_last = NULL;
3b1137fe74829e David Ahern          2017-02-02  5418  	struct nl_info *info = &cfg->fc_nlinfo;
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5419  	struct rt6_nh *nh, *nh_safe;
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5420  	struct fib6_config r_cfg;
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5421  	struct rtnexthop *rtnh;
71c0efb6d12f4c Kuniyuki Iwashima    2025-04-17  5422  	LIST_HEAD(rt6_nh_list);
71c0efb6d12f4c Kuniyuki Iwashima    2025-04-17  5423  	struct rt6_nh *err_nh;
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5424  	struct fib6_info *rt;
3b1137fe74829e David Ahern          2017-02-02  5425  	__u16 nlflags;
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5426  	int remaining;
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5427  	int attrlen;
71c0efb6d12f4c Kuniyuki Iwashima    2025-04-17  5428  	int replace;
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5429  	int nhn = 0;
71c0efb6d12f4c Kuniyuki Iwashima    2025-04-17  5430  	int err;
71c0efb6d12f4c Kuniyuki Iwashima    2025-04-17  5431  
71c0efb6d12f4c Kuniyuki Iwashima    2025-04-17  5432  	replace = (cfg->fc_nlinfo.nlh &&
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5433  		   (cfg->fc_nlinfo.nlh->nlmsg_flags & NLM_F_REPLACE));
51ebd3181572af Nicolas Dichtel      2012-10-22  5434  
3b1137fe74829e David Ahern          2017-02-02  5435  	nlflags = replace ? NLM_F_REPLACE : NLM_F_CREATE;
3b1137fe74829e David Ahern          2017-02-02  5436  	if (info->nlh && info->nlh->nlmsg_flags & NLM_F_APPEND)
3b1137fe74829e David Ahern          2017-02-02  5437  		nlflags |= NLM_F_APPEND;
3b1137fe74829e David Ahern          2017-02-02  5438  
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5439  	remaining = cfg->fc_mp_len;
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5440  	rtnh = (struct rtnexthop *)cfg->fc_mp;
398958ae48f44b Ido Schimmel         2018-01-09  5441  
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5442  	/* Parse a Multipath Entry and build a list (rt6_nh_list) of
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5443  	 * fib6_info structs per nexthop
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5444  	 */
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5445  	while (rtnh_ok(rtnh, remaining)) {
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5446  		memcpy(&r_cfg, cfg, sizeof(*cfg));
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5447  		if (rtnh->rtnh_ifindex)
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5448  			r_cfg.fc_ifindex = rtnh->rtnh_ifindex;
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5449  
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5450  		attrlen = rtnh_attrlen(rtnh);
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5451  		if (attrlen > 0) {
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5452  			struct nlattr *nla, *attrs = rtnh_attrs(rtnh);
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5453  
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5454  			nla = nla_find(attrs, attrlen, RTA_GATEWAY);
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5455  			if (nla) {
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5456  				r_cfg.fc_gateway = nla_get_in6_addr(nla);
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5457  				r_cfg.fc_flags |= RTF_GATEWAY;
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5458  			}
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5459  
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5460  			r_cfg.fc_encap = nla_find(attrs, attrlen, RTA_ENCAP);
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5461  			nla = nla_find(attrs, attrlen, RTA_ENCAP_TYPE);
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5462  			if (nla)
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5463  				r_cfg.fc_encap_type = nla_get_u16(nla);
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5464  		}
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5465  
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5466  		r_cfg.fc_flags |= (rtnh->rtnh_flags & RTNH_F_ONLINK);
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5467  		rt = ip6_route_info_create(&r_cfg, GFP_KERNEL, extack);
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5468  		if (IS_ERR(rt)) {
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5469  			err = PTR_ERR(rt);
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5470  			rt = NULL;
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5471  			goto cleanup;
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5472  		}
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5473  
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5474  		err = ip6_route_info_create_nh(rt, &r_cfg, extack);
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5475  		if (err) {
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5476  			rt = NULL;
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5477  			goto cleanup;
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5478  		}
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5479  
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5480  		rt->fib6_nh->fib_nh_weight = rtnh->rtnh_hops + 1;
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5481  
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5482  		err = ip6_route_info_append(&rt6_nh_list, rt, &r_cfg);
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5483  		if (err) {
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5484  			fib6_info_release(rt);
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5485  			goto cleanup;
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5486  		}
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5487  
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5488  		rtnh = rtnh_next(rtnh, &remaining);
34f2e495246771 Kuniyuki Iwashima    2025-05-14  5489  	}
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5490  
3b1137fe74829e David Ahern          2017-02-02  5491  	/* for add and replace send one notification with all nexthops.
3b1137fe74829e David Ahern          2017-02-02  5492  	 * Skip the notification in fib6_add_rt2node and send one with
3b1137fe74829e David Ahern          2017-02-02  5493  	 * the full route when done
3b1137fe74829e David Ahern          2017-02-02  5494  	 */
3b1137fe74829e David Ahern          2017-02-02  5495  	info->skip_notify = 1;
3b1137fe74829e David Ahern          2017-02-02  5496  
ebee3cad835f7f Ido Schimmel         2019-06-18  5497  	/* For add and replace, send one notification with all nexthops. For
ebee3cad835f7f Ido Schimmel         2019-06-18  5498  	 * append, send one notification with all appended nexthops.
ebee3cad835f7f Ido Schimmel         2019-06-18  5499  	 */
ebee3cad835f7f Ido Schimmel         2019-06-18  5500  	info->skip_notify_kernel = 1;
ebee3cad835f7f Ido Schimmel         2019-06-18  5501  
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5502  	err_nh = NULL;
5a1ccff5c65aa5 Kuniyuki Iwashima    2025-04-17  5503  	list_for_each_entry(nh, &rt6_nh_list, list) {
8d1c802b2815ed David Ahern          2018-04-17  5504  		err = __ip6_ins_rt(nh->fib6_info, info, extack);
3b1137fe74829e David Ahern          2017-02-02  5505  
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5506  		if (err) {
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5507  			if (replace && nhn)
a5a82d841186d1 Jakub Kicinski       2019-01-14  5508  				NL_SET_ERR_MSG_MOD(extack,
a5a82d841186d1 Jakub Kicinski       2019-01-14  5509  						   "multipath route replace failed (check consistency of installed routes)");
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5510  			err_nh = nh;
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5511  			goto add_errout;
51ebd3181572af Nicolas Dichtel      2012-10-22  5512  		}
685f7d53126459 Eric Dumazet         2024-03-03  5513  		/* save reference to last route successfully inserted */
685f7d53126459 Eric Dumazet         2024-03-03  5514  		rt_last = nh->fib6_info;
685f7d53126459 Eric Dumazet         2024-03-03  5515  
685f7d53126459 Eric Dumazet         2024-03-03  5516  		/* save reference to first route for notification */
685f7d53126459 Eric Dumazet         2024-03-03  5517  		if (!rt_notif)
685f7d53126459 Eric Dumazet         2024-03-03  5518  			rt_notif = nh->fib6_info;
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5519  
1a72418bd7f0ed Nicolas Dichtel      2012-11-01  5520  		/* Because each route is added like a single route we remove
27596472473a02 Michal Kubeček       2015-05-18  5521  		 * these flags after the first nexthop: if there is a collision,
27596472473a02 Michal Kubeček       2015-05-18  5522  		 * we have already failed to add the first nexthop:
27596472473a02 Michal Kubeček       2015-05-18  5523  		 * fib6_add_rt2node() has rejected it; when replacing, old
27596472473a02 Michal Kubeček       2015-05-18  5524  		 * nexthops have been replaced by first new, the rest should
27596472473a02 Michal Kubeček       2015-05-18  5525  		 * be added to it.
1a72418bd7f0ed Nicolas Dichtel      2012-11-01  5526  		 */
864db232dc7036 Muhammad Usama Anjum 2021-04-09  5527  		if (cfg->fc_nlinfo.nlh) {
27596472473a02 Michal Kubeček       2015-05-18  5528  			cfg->fc_nlinfo.nlh->nlmsg_flags &= ~(NLM_F_EXCL |
27596472473a02 Michal Kubeček       2015-05-18  5529  							     NLM_F_REPLACE);
afecdb376bd81d Benjamin Poirier     2020-02-12  5530  			cfg->fc_nlinfo.nlh->nlmsg_flags |= NLM_F_CREATE;
864db232dc7036 Muhammad Usama Anjum 2021-04-09  5531  		}
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5532  		nhn++;
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5533  	}
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5534  
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5535  	/* An in-kernel notification should only be sent in case the new
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5536  	 * multipath route is added as the first route in the node, or if
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5537  	 * it was appended to it. We pass 'rt_notif' since it is the first
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5538  	 * sibling and might allow us to skip some checks in the replace case.
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5539  	 */
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5540  	if (ip6_route_mpath_should_notify(rt_notif)) {
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5541  		enum fib_event_type fib_event;
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5542  
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5543  		if (rt_notif->fib6_nsiblings != nhn - 1)
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5544  			fib_event = FIB_EVENT_ENTRY_APPEND;
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5545  		else
caafb2509fac14 Ido Schimmel         2019-12-23  5546  			fib_event = FIB_EVENT_ENTRY_REPLACE;
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5547  
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5548  		err = call_fib6_multipath_entry_notifiers(info->nl_net,
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5549  							  fib_event, rt_notif,
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5550  							  nhn - 1, extack);
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5551  		if (err) {
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5552  			/* Delete all the siblings that were just added */
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5553  			err_nh = NULL;
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5554  			goto add_errout;
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5555  		}
0ee0f47c26b2f9 Ido Schimmel         2019-12-23  5556  	}
ebee3cad835f7f Ido Schimmel         2019-06-18  5557  
3b1137fe74829e David Ahern          2017-02-02  5558  	/* success ... tell user about new route */
3b1137fe74829e David Ahern          2017-02-02  5559  	ip6_route_mpath_notify(rt_notif, rt_last, info, nlflags);
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5560  	goto cleanup;
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5561  
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5562  add_errout:
3b1137fe74829e David Ahern          2017-02-02  5563  	/* send notification for routes that were added so that
3b1137fe74829e David Ahern          2017-02-02  5564  	 * the delete notifications sent by ip6_route_del are
3b1137fe74829e David Ahern          2017-02-02  5565  	 * coherent
3b1137fe74829e David Ahern          2017-02-02  5566  	 */
3b1137fe74829e David Ahern          2017-02-02  5567  	if (rt_notif)
3b1137fe74829e David Ahern          2017-02-02  5568  		ip6_route_mpath_notify(rt_notif, rt_last, info, nlflags);
3b1137fe74829e David Ahern          2017-02-02  5569  
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5570  	/* Delete routes that were already added */
5a1ccff5c65aa5 Kuniyuki Iwashima    2025-04-17  5571  	list_for_each_entry(nh, &rt6_nh_list, list) {
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5572  		if (err_nh == nh)
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5573  			break;
333c430167c21b David Ahern          2017-05-21  5574  		ip6_route_del(&nh->r_cfg, extack);
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5575  	}
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5576  
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5577  cleanup:
5a1ccff5c65aa5 Kuniyuki Iwashima    2025-04-17  5578  	list_for_each_entry_safe(nh, nh_safe, &rt6_nh_list, list) {
8d1c802b2815ed David Ahern          2018-04-17  5579  		fib6_info_release(nh->fib6_info);
5a1ccff5c65aa5 Kuniyuki Iwashima    2025-04-17  5580  		list_del(&nh->list);
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5581  		kfree(nh);
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5582  	}
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5583  
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08 @5584  	return err;
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5585  }
6b9ea5a64ed5ee Roopa Prabhu         2015-09-08  5586  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
