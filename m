Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6814412B74
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Jul 2023 13:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689772859; x=1721308859;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jhztZBZAzeZGM/FozG9zqBdJmOnzggxCtnd0EqHPwws=;
  b=I5tKhLpJ4vmZTAp70Ln7wFQkDtJPJp9AOYgqt7CHWyJmyp6kXadYmYvW
   xKXQR4dRcLGGbmo9tpuKEent2yicbh4tACnjoCnXyE23euXS8kHVyMRqA
   8NEyAUiviUlUgtBtAxOz4oqHGYM5OPy/XHL2Ups4/82fTWNXCpIW3G2io
   ZzWVn+yTsbpw8LFn909r2ioq36g3+fU5I2KP3CMYQE482CPpx1spyY4Gt
   MuN9c7vWgczDBcRchzNwMPerIw8LB35m+CRqr4DazZXe0sct2UgToiDJ/
   05oNVJbh7aZMZp+j5Hedf7beaU+zvaqdTk8UcCWvBlEDsfuCueNK4/FVK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="397318876"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="397318876"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 06:20:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="848052868"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="848052868"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Jul 2023 06:20:52 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM76p-0004uT-2Q;
	Wed, 19 Jul 2023 13:20:51 +0000
Date: Wed, 19 Jul 2023 21:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [net-next] net: add sysctl accept_ra_min_rtr_lft
Message-ID: <202307192116.N4bDjayg-lkp@intel.com>
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
In-Reply-To: <20230718213709.688186-1-prohr@google.com>
References: <20230718213709.688186-1-prohr@google.com>
TO: Patrick Rohr <prohr@google.com>
TO: "David S . Miller" <davem@davemloft.net>
CC: Linux Network Development Mailing List <netdev@vger.kernel.org>
CC: Patrick Rohr <prohr@google.com>
CC: "Maciej Żenczykowski" <maze@google.com>
CC: Lorenzo Colitti <lorenzo@google.com>

Hi Patrick,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Patrick-Rohr/net-add-sysctl-accept_ra_min_rtr_lft/20230719-053943
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230718213709.688186-1-prohr%40google.com
patch subject: [net-next] net: add sysctl accept_ra_min_rtr_lft
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-m001-20230717 (https://download.01.org/0day-ci/archive/20230719/202307192116.N4bDjayg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192116.N4bDjayg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307192116.N4bDjayg-lkp@intel.com/

smatch warnings:
net/ipv6/ndisc.c:1501 ndisc_router_discovery() error: uninitialized symbol 'lifetime'.

vim +/lifetime +1501 net/ipv6/ndisc.c

fadf6bf0606913 Templin, Fred L          2008-03-11  1307  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1308  	if (in6_dev->if_flags & IF_RS_SENT) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1309  		/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1310  		 *	flag that an RA was received after an RS was sent
^1da177e4c3f41 Linus Torvalds           2005-04-16  1311  		 *	out on this interface.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1312  		 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  1313  		in6_dev->if_flags |= IF_RA_RCVD;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1314  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1315  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1316  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1317  	 * Remember the managed/otherconf flags from most recently
^1da177e4c3f41 Linus Torvalds           2005-04-16  1318  	 * received RA message (RFC 2462) -- yoshfuji
^1da177e4c3f41 Linus Torvalds           2005-04-16  1319  	 */
a394eef562d781 Marius Tomaschewski      2015-08-31  1320  	old_if_flags = in6_dev->if_flags;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1321  	in6_dev->if_flags = (in6_dev->if_flags & ~(IF_RA_MANAGED |
^1da177e4c3f41 Linus Torvalds           2005-04-16  1322  				IF_RA_OTHERCONF)) |
^1da177e4c3f41 Linus Torvalds           2005-04-16  1323  				(ra_msg->icmph.icmp6_addrconf_managed ?
^1da177e4c3f41 Linus Torvalds           2005-04-16  1324  					IF_RA_MANAGED : 0) |
^1da177e4c3f41 Linus Torvalds           2005-04-16  1325  				(ra_msg->icmph.icmp6_addrconf_other ?
^1da177e4c3f41 Linus Torvalds           2005-04-16  1326  					IF_RA_OTHERCONF : 0);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1327  
a394eef562d781 Marius Tomaschewski      2015-08-31  1328  	if (old_if_flags != in6_dev->if_flags)
2053aeb69a5322 Marius Tomaschewski      2015-09-01  1329  		send_ifinfo_notify = true;
a394eef562d781 Marius Tomaschewski      2015-08-31  1330  
f2a762d8a97032 Ben Greear               2014-06-25  1331  	if (!in6_dev->cnf.accept_ra_defrtr) {
f2a762d8a97032 Ben Greear               2014-06-25  1332  		ND_PRINTK(2, info,
f2a762d8a97032 Ben Greear               2014-06-25  1333  			  "RA: %s, defrtr is false for dev: %s\n",
f2a762d8a97032 Ben Greear               2014-06-25  1334  			  __func__, skb->dev->name);
65f5c7c1143fb8 YOSHIFUJI Hideaki        2006-03-20  1335  		goto skip_defrtr;
f2a762d8a97032 Ben Greear               2014-06-25  1336  	}
65f5c7c1143fb8 YOSHIFUJI Hideaki        2006-03-20  1337  
d9333196572985 Ben Greear               2014-06-25  1338  	/* Do not accept RA with source-addr found on local machine unless
d9333196572985 Ben Greear               2014-06-25  1339  	 * accept_ra_from_local is set to true.
d9333196572985 Ben Greear               2014-06-25  1340  	 */
afb1d4b59311a8 David Ahern              2018-04-17  1341  	net = dev_net(in6_dev->dev);
b6428817190c54 Li RongQing              2014-07-10  1342  	if (!in6_dev->cnf.accept_ra_from_local &&
afb1d4b59311a8 David Ahern              2018-04-17  1343  	    ipv6_chk_addr(net, &ipv6_hdr(skb)->saddr, in6_dev->dev, 0)) {
f2a762d8a97032 Ben Greear               2014-06-25  1344  		ND_PRINTK(2, info,
d9333196572985 Ben Greear               2014-06-25  1345  			  "RA from local address detected on dev: %s: default router ignored\n",
d9333196572985 Ben Greear               2014-06-25  1346  			  skb->dev->name);
9f56220fad0d13 Andreas Hofmeister       2011-10-24  1347  		goto skip_defrtr;
f2a762d8a97032 Ben Greear               2014-06-25  1348  	}
9f56220fad0d13 Andreas Hofmeister       2011-10-24  1349  
ebacaaa0fdf440 YOSHIFUJI Hideaki        2006-03-20  1350  #ifdef CONFIG_IPV6_ROUTER_PREF
ebacaaa0fdf440 YOSHIFUJI Hideaki        2006-03-20  1351  	pref = ra_msg->icmph.icmp6_router_pref;
ebacaaa0fdf440 YOSHIFUJI Hideaki        2006-03-20  1352  	/* 10b is handled as if it were 00b (medium) */
930d6ff2e2a5f1 YOSHIFUJI Hideaki        2006-03-20  1353  	if (pref == ICMPV6_ROUTER_PREF_INVALID ||
6d5b78cdd5a176 YOSHIFUJI Hideaki        2007-06-22  1354  	    !in6_dev->cnf.accept_ra_rtr_pref)
ebacaaa0fdf440 YOSHIFUJI Hideaki        2006-03-20  1355  		pref = ICMPV6_ROUTER_PREF_MEDIUM;
ebacaaa0fdf440 YOSHIFUJI Hideaki        2006-03-20  1356  #endif
f88d8ea67fbdba David Ahern              2019-06-03  1357  	/* routes added from RAs do not use nexthop objects */
afb1d4b59311a8 David Ahern              2018-04-17  1358  	rt = rt6_get_dflt_router(net, &ipv6_hdr(skb)->saddr, skb->dev);
eb857186eb7719 David S. Miller          2012-01-27  1359  	if (rt) {
1cf844c747d542 David Ahern              2019-05-22  1360  		neigh = ip6_neigh_lookup(&rt->fib6_nh->fib_nh_gw6,
1cf844c747d542 David Ahern              2019-05-22  1361  					 rt->fib6_nh->fib_nh_dev, NULL,
f8a1b43b709d8e David Ahern              2018-04-17  1362  					  &ipv6_hdr(skb)->saddr);
eb857186eb7719 David S. Miller          2012-01-27  1363  		if (!neigh) {
675418d5187785 Joe Perches              2012-05-16  1364  			ND_PRINTK(0, err,
675418d5187785 Joe Perches              2012-05-16  1365  				  "RA: %s got default router without neighbour\n",
eb857186eb7719 David S. Miller          2012-01-27  1366  				  __func__);
93531c6743157d David Ahern              2018-04-17  1367  			fib6_info_release(rt);
2f326d9d9ff46f Eric Dumazet             2023-02-16  1368  			return reason;
eb857186eb7719 David S. Miller          2012-01-27  1369  		}
eb857186eb7719 David S. Miller          2012-01-27  1370  	}
6b2e04bc240fe9 Praveen Chaudhary        2021-01-25  1371  	/* Set default route metric as specified by user */
6b2e04bc240fe9 Praveen Chaudhary        2021-01-25  1372  	defrtr_usr_metric = in6_dev->cnf.ra_defrtr_metric;
6b2e04bc240fe9 Praveen Chaudhary        2021-01-25  1373  	/* delete the route if lifetime is 0 or if metric needs change */
6b2e04bc240fe9 Praveen Chaudhary        2021-01-25  1374  	if (rt && (lifetime == 0 || rt->fib6_metric != defrtr_usr_metric)) {
11dd74b338bf83 Roopa Prabhu             2020-04-27  1375  		ip6_del_rt(net, rt, false);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1376  		rt = NULL;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1377  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1378  
6b2e04bc240fe9 Praveen Chaudhary        2021-01-25  1379  	ND_PRINTK(3, info, "RA: rt: %p  lifetime: %d, metric: %d, for dev: %s\n",
6b2e04bc240fe9 Praveen Chaudhary        2021-01-25  1380  		  rt, lifetime, defrtr_usr_metric, skb->dev->name);
63159f29be1df7 Ian Morris               2015-03-29  1381  	if (!rt && lifetime) {
f2a762d8a97032 Ben Greear               2014-06-25  1382  		ND_PRINTK(3, info, "RA: adding default router\n");
^1da177e4c3f41 Linus Torvalds           2005-04-16  1383  
7396ba87f1edf5 Xin Xiong                2022-08-13  1384  		if (neigh)
7396ba87f1edf5 Xin Xiong                2022-08-13  1385  			neigh_release(neigh);
7396ba87f1edf5 Xin Xiong                2022-08-13  1386  
afb1d4b59311a8 David Ahern              2018-04-17  1387  		rt = rt6_add_dflt_router(net, &ipv6_hdr(skb)->saddr,
6b2e04bc240fe9 Praveen Chaudhary        2021-01-25  1388  					 skb->dev, pref, defrtr_usr_metric);
63159f29be1df7 Ian Morris               2015-03-29  1389  		if (!rt) {
675418d5187785 Joe Perches              2012-05-16  1390  			ND_PRINTK(0, err,
675418d5187785 Joe Perches              2012-05-16  1391  				  "RA: %s failed to add default route\n",
0dc47877a3de00 Harvey Harrison          2008-03-05  1392  				  __func__);
2f326d9d9ff46f Eric Dumazet             2023-02-16  1393  			return reason;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1394  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1395  
1cf844c747d542 David Ahern              2019-05-22  1396  		neigh = ip6_neigh_lookup(&rt->fib6_nh->fib_nh_gw6,
1cf844c747d542 David Ahern              2019-05-22  1397  					 rt->fib6_nh->fib_nh_dev, NULL,
f8a1b43b709d8e David Ahern              2018-04-17  1398  					  &ipv6_hdr(skb)->saddr);
63159f29be1df7 Ian Morris               2015-03-29  1399  		if (!neigh) {
675418d5187785 Joe Perches              2012-05-16  1400  			ND_PRINTK(0, err,
675418d5187785 Joe Perches              2012-05-16  1401  				  "RA: %s got default router without neighbour\n",
0dc47877a3de00 Harvey Harrison          2008-03-05  1402  				  __func__);
93531c6743157d David Ahern              2018-04-17  1403  			fib6_info_release(rt);
2f326d9d9ff46f Eric Dumazet             2023-02-16  1404  			return reason;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1405  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1406  		neigh->flags |= NTF_ROUTER;
806c37ddcf2866 Kalash Nainwal           2022-02-10  1407  	} else if (rt && IPV6_EXTRACT_PREF(rt->fib6_flags) != pref) {
806c37ddcf2866 Kalash Nainwal           2022-02-10  1408  		struct nl_info nlinfo = {
806c37ddcf2866 Kalash Nainwal           2022-02-10  1409  			.nl_net = net,
806c37ddcf2866 Kalash Nainwal           2022-02-10  1410  		};
93c2fb253d177a David Ahern              2018-04-18  1411  		rt->fib6_flags = (rt->fib6_flags & ~RTF_PREF_MASK) | RTF_PREF(pref);
806c37ddcf2866 Kalash Nainwal           2022-02-10  1412  		inet6_rt_notify(RTM_NEWROUTE, rt, &nlinfo, NLM_F_REPLACE);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1413  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1414  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1415  	if (rt)
14895687d36805 David Ahern              2018-04-17  1416  		fib6_set_expires(rt, jiffies + (HZ * lifetime));
8013d1d7eafb05 Hangbin Liu              2015-07-30  1417  	if (in6_dev->cnf.accept_ra_min_hop_limit < 256 &&
8013d1d7eafb05 Hangbin Liu              2015-07-30  1418  	    ra_msg->icmph.icmp6_hop_limit) {
8013d1d7eafb05 Hangbin Liu              2015-07-30  1419  		if (in6_dev->cnf.accept_ra_min_hop_limit <= ra_msg->icmph.icmp6_hop_limit) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1420  			in6_dev->cnf.hop_limit = ra_msg->icmph.icmp6_hop_limit;
d4ead6b34b67fd David Ahern              2018-04-17  1421  			fib6_metric_set(rt, RTAX_HOPLIMIT,
defb3519a64141 David S. Miller          2010-12-08  1422  					ra_msg->icmph.icmp6_hop_limit);
8013d1d7eafb05 Hangbin Liu              2015-07-30  1423  		} else {
8013d1d7eafb05 Hangbin Liu              2015-07-30  1424  			ND_PRINTK(2, warn, "RA: Got route advertisement with lower hop_limit than minimum\n");
8013d1d7eafb05 Hangbin Liu              2015-07-30  1425  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1426  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1427  
65f5c7c1143fb8 YOSHIFUJI Hideaki        2006-03-20  1428  skip_defrtr:
65f5c7c1143fb8 YOSHIFUJI Hideaki        2006-03-20  1429  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1430  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1431  	 *	Update Reachable Time and Retrans Timer
^1da177e4c3f41 Linus Torvalds           2005-04-16  1432  	 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  1433  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1434  	if (in6_dev->nd_parms) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1435  		unsigned long rtime = ntohl(ra_msg->retrans_timer);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1436  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1437  		if (rtime && rtime/1000 < MAX_SCHEDULE_TIMEOUT/HZ) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1438  			rtime = (rtime*HZ)/1000;
19e16d220f0adb Hangbin Liu              2020-04-01  1439  			if (rtime < HZ/100)
19e16d220f0adb Hangbin Liu              2020-04-01  1440  				rtime = HZ/100;
1f9248e5606afc Jiri Pirko               2013-12-07  1441  			NEIGH_VAR_SET(in6_dev->nd_parms, RETRANS_TIME, rtime);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1442  			in6_dev->tstamp = jiffies;
2053aeb69a5322 Marius Tomaschewski      2015-09-01  1443  			send_ifinfo_notify = true;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1444  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1445  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1446  		rtime = ntohl(ra_msg->reachable_time);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1447  		if (rtime && rtime/1000 < MAX_SCHEDULE_TIMEOUT/(3*HZ)) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1448  			rtime = (rtime*HZ)/1000;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1449  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1450  			if (rtime < HZ/10)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1451  				rtime = HZ/10;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1452  
1f9248e5606afc Jiri Pirko               2013-12-07  1453  			if (rtime != NEIGH_VAR(in6_dev->nd_parms, BASE_REACHABLE_TIME)) {
1f9248e5606afc Jiri Pirko               2013-12-07  1454  				NEIGH_VAR_SET(in6_dev->nd_parms,
1f9248e5606afc Jiri Pirko               2013-12-07  1455  					      BASE_REACHABLE_TIME, rtime);
1f9248e5606afc Jiri Pirko               2013-12-07  1456  				NEIGH_VAR_SET(in6_dev->nd_parms,
1f9248e5606afc Jiri Pirko               2013-12-07  1457  					      GC_STALETIME, 3 * rtime);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1458  				in6_dev->nd_parms->reachable_time = neigh_rand_reach_time(rtime);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1459  				in6_dev->tstamp = jiffies;
2053aeb69a5322 Marius Tomaschewski      2015-09-01  1460  				send_ifinfo_notify = true;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1461  			}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1462  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1463  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1464  
fadf6bf0606913 Templin, Fred L          2008-03-11  1465  skip_linkparms:
fadf6bf0606913 Templin, Fred L          2008-03-11  1466  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1467  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1468  	 *	Process options.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1469  	 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  1470  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1471  	if (!neigh)
0660e03f6b18f1 Arnaldo Carvalho de Melo 2007-04-25  1472  		neigh = __neigh_lookup(&nd_tbl, &ipv6_hdr(skb)->saddr,
^1da177e4c3f41 Linus Torvalds           2005-04-16  1473  				       skb->dev, 1);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1474  	if (neigh) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1475  		u8 *lladdr = NULL;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1476  		if (ndopts.nd_opts_src_lladdr) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1477  			lladdr = ndisc_opt_addr_data(ndopts.nd_opts_src_lladdr,
^1da177e4c3f41 Linus Torvalds           2005-04-16  1478  						     skb->dev);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1479  			if (!lladdr) {
675418d5187785 Joe Perches              2012-05-16  1480  				ND_PRINTK(2, warn,
675418d5187785 Joe Perches              2012-05-16  1481  					  "RA: invalid link-layer address length\n");
^1da177e4c3f41 Linus Torvalds           2005-04-16  1482  				goto out;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1483  			}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1484  		}
f997c55c1dc884 Alexander Aring          2016-06-15  1485  		ndisc_update(skb->dev, neigh, lladdr, NUD_STALE,
^1da177e4c3f41 Linus Torvalds           2005-04-16  1486  			     NEIGH_UPDATE_F_WEAK_OVERRIDE|
^1da177e4c3f41 Linus Torvalds           2005-04-16  1487  			     NEIGH_UPDATE_F_OVERRIDE|
^1da177e4c3f41 Linus Torvalds           2005-04-16  1488  			     NEIGH_UPDATE_F_OVERRIDE_ISROUTER|
f997c55c1dc884 Alexander Aring          2016-06-15  1489  			     NEIGH_UPDATE_F_ISROUTER,
f997c55c1dc884 Alexander Aring          2016-06-15  1490  			     NDISC_ROUTER_ADVERTISEMENT, &ndopts);
2f326d9d9ff46f Eric Dumazet             2023-02-16  1491  		reason = SKB_CONSUMED;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1492  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1493  
f2a762d8a97032 Ben Greear               2014-06-25  1494  	if (!ipv6_accept_ra(in6_dev)) {
f2a762d8a97032 Ben Greear               2014-06-25  1495  		ND_PRINTK(2, info,
f2a762d8a97032 Ben Greear               2014-06-25  1496  			  "RA: %s, accept_ra is false for dev: %s\n",
f2a762d8a97032 Ben Greear               2014-06-25  1497  			  __func__, skb->dev->name);
31ce8c71a3bdab David Ward               2009-08-29  1498  		goto out;
f2a762d8a97032 Ben Greear               2014-06-25  1499  	}
31ce8c71a3bdab David Ward               2009-08-29  1500  
7727e386c184ab Patrick Rohr             2023-07-18 @1501  	if (lifetime != 0 && lifetime < in6_dev->cnf.accept_ra_min_rtr_lft) {
7727e386c184ab Patrick Rohr             2023-07-18  1502  		ND_PRINTK(2, info,
7727e386c184ab Patrick Rohr             2023-07-18  1503  			  "RA: router lifetime (%ds) is too short: %s\n",
7727e386c184ab Patrick Rohr             2023-07-18  1504  			  lifetime, skb->dev->name);
7727e386c184ab Patrick Rohr             2023-07-18  1505  		goto out;
7727e386c184ab Patrick Rohr             2023-07-18  1506  	}
7727e386c184ab Patrick Rohr             2023-07-18  1507  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
