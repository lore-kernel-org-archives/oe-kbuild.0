Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751B815A6
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Aug 2023 02:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691201287; x=1722737287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y3AHCmkIC8MhQXU6lWKoWKFAksp0p4CESiZbSKvm4YE=;
  b=FkntOY7WyFyemZvuwyLk0T81pBFt856d3Xnn79/Ri8MQjA6RB7B79x6y
   Wws7a7QPjSRKUCe6EJXTTOuJT5aztQlsgC6PqoLasT1a4XVhaeUOs90mT
   9C080tHt3FlnixcAvQyiitD6ZvsTgiSZy0NokjiT9pfjvSx58iPWfRMbD
   5G3ACtWHHOHjMu7bODNOex9JMhFWfb0GPOumv77faBPkdB7My2IafTzhD
   waBsuTjrjida/RCKQPuS6xS15legWktSwdeN6Q7IHYXiJxGvMmoTHyD7q
   JMy0PIv4nCwINcHSyMH1QGipjcXesSuukry1gIacaR9Ik4vT4Ks/r6lCk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="355210988"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="355210988"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 19:08:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="854013576"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="854013576"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Aug 2023 19:08:05 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS6i4-0003Fd-1h;
	Sat, 05 Aug 2023 02:08:04 +0000
Date: Sat, 5 Aug 2023 10:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC net-next v2 3/7] net: openvswitch: add explicit drop action
Message-ID: <202308050917.fxeoCp4f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230801151649.744695-4-amorenoz@redhat.com>
References: <20230801151649.744695-4-amorenoz@redhat.com>
TO: Adrian Moreno <amorenoz@redhat.com>

Hi Adrian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Moreno/net-openvswitch-add-datapath-flow-drop-reason/20230801-232241
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230801151649.744695-4-amorenoz%40redhat.com
patch subject: [RFC net-next v2 3/7] net: openvswitch: add explicit drop action
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: um-randconfig-r091-20230730 (https://download.01.org/0day-ci/archive/20230805/202308050917.fxeoCp4f-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050917.fxeoCp4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308050917.fxeoCp4f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/openvswitch/actions.c:1494:47: sparse: sparse: mixing different enum types:
>> net/openvswitch/actions.c:1494:47: sparse:    unsigned int enum ovs_drop_reason
>> net/openvswitch/actions.c:1494:47: sparse:    unsigned int enum skb_drop_reason

vim +1494 net/openvswitch/actions.c

744676e777207f Matteo Croce    2020-02-15  1285  
ccb1352e76cff0 Jesse Gross     2011-10-25  1286  /* Execute a list of actions against 'skb'. */
ccb1352e76cff0 Jesse Gross     2011-10-25  1287  static int do_execute_actions(struct datapath *dp, struct sk_buff *skb,
2ff3e4e4868675 Pravin B Shelar 2014-09-15  1288  			      struct sw_flow_key *key,
651887b0c22cff Simon Horman    2014-07-21  1289  			      const struct nlattr *attr, int len)
ccb1352e76cff0 Jesse Gross     2011-10-25  1290  {
ccb1352e76cff0 Jesse Gross     2011-10-25  1291  	const struct nlattr *a;
ccb1352e76cff0 Jesse Gross     2011-10-25  1292  	int rem;
ccb1352e76cff0 Jesse Gross     2011-10-25  1293  
ccb1352e76cff0 Jesse Gross     2011-10-25  1294  	for (a = attr, rem = len; rem > 0;
ccb1352e76cff0 Jesse Gross     2011-10-25  1295  	     a = nla_next(a, &rem)) {
ccb1352e76cff0 Jesse Gross     2011-10-25  1296  		int err = 0;
ccb1352e76cff0 Jesse Gross     2011-10-25  1297  
c4ab7b56be0f6f Aaron Conole    2021-06-22  1298  		if (trace_ovs_do_execute_action_enabled())
c4ab7b56be0f6f Aaron Conole    2021-06-22  1299  			trace_ovs_do_execute_action(dp, skb, key, a, rem);
c4ab7b56be0f6f Aaron Conole    2021-06-22  1300  
d6647a78fa3e11 Adrian Moreno   2023-08-01  1301  		/* Actions that rightfully have to consume the skb should do it
d6647a78fa3e11 Adrian Moreno   2023-08-01  1302  		 * and return directly.
d6647a78fa3e11 Adrian Moreno   2023-08-01  1303  		 */
5b8784aaf29be2 andy zhou       2017-01-27  1304  		switch (nla_type(a)) {
5b8784aaf29be2 andy zhou       2017-01-27  1305  		case OVS_ACTION_ATTR_OUTPUT: {
5b8784aaf29be2 andy zhou       2017-01-27  1306  			int port = nla_get_u32(a);
5b8784aaf29be2 andy zhou       2017-01-27  1307  			struct sk_buff *clone;
738967b8bf57e5 Andy Zhou       2014-09-08  1308  
5b8784aaf29be2 andy zhou       2017-01-27  1309  			/* Every output action needs a separate clone
5b8784aaf29be2 andy zhou       2017-01-27  1310  			 * of 'skb', In case the output action is the
5b8784aaf29be2 andy zhou       2017-01-27  1311  			 * last action, cloning can be avoided.
5b8784aaf29be2 andy zhou       2017-01-27  1312  			 */
5b8784aaf29be2 andy zhou       2017-01-27  1313  			if (nla_is_last(a, rem)) {
5b8784aaf29be2 andy zhou       2017-01-27  1314  				do_output(dp, skb, port, key);
5b8784aaf29be2 andy zhou       2017-01-27  1315  				/* 'skb' has been used for output.
5b8784aaf29be2 andy zhou       2017-01-27  1316  				 */
5b8784aaf29be2 andy zhou       2017-01-27  1317  				return 0;
ccb1352e76cff0 Jesse Gross     2011-10-25  1318  			}
ccb1352e76cff0 Jesse Gross     2011-10-25  1319  
5b8784aaf29be2 andy zhou       2017-01-27  1320  			clone = skb_clone(skb, GFP_ATOMIC);
5b8784aaf29be2 andy zhou       2017-01-27  1321  			if (clone)
5b8784aaf29be2 andy zhou       2017-01-27  1322  				do_output(dp, clone, port, key);
5b8784aaf29be2 andy zhou       2017-01-27  1323  			OVS_CB(skb)->cutlen = 0;
ccb1352e76cff0 Jesse Gross     2011-10-25  1324  			break;
5b8784aaf29be2 andy zhou       2017-01-27  1325  		}
ccb1352e76cff0 Jesse Gross     2011-10-25  1326  
f2a4d086ed4c58 William Tu      2016-06-10  1327  		case OVS_ACTION_ATTR_TRUNC: {
f2a4d086ed4c58 William Tu      2016-06-10  1328  			struct ovs_action_trunc *trunc = nla_data(a);
f2a4d086ed4c58 William Tu      2016-06-10  1329  
f2a4d086ed4c58 William Tu      2016-06-10  1330  			if (skb->len > trunc->max_len)
f2a4d086ed4c58 William Tu      2016-06-10  1331  				OVS_CB(skb)->cutlen = skb->len - trunc->max_len;
f2a4d086ed4c58 William Tu      2016-06-10  1332  			break;
f2a4d086ed4c58 William Tu      2016-06-10  1333  		}
f2a4d086ed4c58 William Tu      2016-06-10  1334  
ccb1352e76cff0 Jesse Gross     2011-10-25  1335  		case OVS_ACTION_ATTR_USERSPACE:
f2a4d086ed4c58 William Tu      2016-06-10  1336  			output_userspace(dp, skb, key, a, attr,
f2a4d086ed4c58 William Tu      2016-06-10  1337  						     len, OVS_CB(skb)->cutlen);
f2a4d086ed4c58 William Tu      2016-06-10  1338  			OVS_CB(skb)->cutlen = 0;
d6647a78fa3e11 Adrian Moreno   2023-08-01  1339  			if (nla_is_last(a, rem)) {
d6647a78fa3e11 Adrian Moreno   2023-08-01  1340  				consume_skb(skb);
d6647a78fa3e11 Adrian Moreno   2023-08-01  1341  				return 0;
d6647a78fa3e11 Adrian Moreno   2023-08-01  1342  			}
ccb1352e76cff0 Jesse Gross     2011-10-25  1343  			break;
ccb1352e76cff0 Jesse Gross     2011-10-25  1344  
971427f353f3c4 Andy Zhou       2014-09-15  1345  		case OVS_ACTION_ATTR_HASH:
971427f353f3c4 Andy Zhou       2014-09-15  1346  			execute_hash(skb, key, a);
971427f353f3c4 Andy Zhou       2014-09-15  1347  			break;
971427f353f3c4 Andy Zhou       2014-09-15  1348  
f66b53fdbb22ce Martin Varghese 2019-12-21  1349  		case OVS_ACTION_ATTR_PUSH_MPLS: {
f66b53fdbb22ce Martin Varghese 2019-12-21  1350  			struct ovs_action_push_mpls *mpls = nla_data(a);
f66b53fdbb22ce Martin Varghese 2019-12-21  1351  
f66b53fdbb22ce Martin Varghese 2019-12-21  1352  			err = push_mpls(skb, key, mpls->mpls_lse,
f66b53fdbb22ce Martin Varghese 2019-12-21  1353  					mpls->mpls_ethertype, skb->mac_len);
25cd9ba0abc074 Simon Horman    2014-10-06  1354  			break;
f66b53fdbb22ce Martin Varghese 2019-12-21  1355  		}
f66b53fdbb22ce Martin Varghese 2019-12-21  1356  		case OVS_ACTION_ATTR_ADD_MPLS: {
f66b53fdbb22ce Martin Varghese 2019-12-21  1357  			struct ovs_action_add_mpls *mpls = nla_data(a);
f66b53fdbb22ce Martin Varghese 2019-12-21  1358  			__u16 mac_len = 0;
f66b53fdbb22ce Martin Varghese 2019-12-21  1359  
f66b53fdbb22ce Martin Varghese 2019-12-21  1360  			if (mpls->tun_flags & OVS_MPLS_L3_TUNNEL_FLAG_MASK)
f66b53fdbb22ce Martin Varghese 2019-12-21  1361  				mac_len = skb->mac_len;
25cd9ba0abc074 Simon Horman    2014-10-06  1362  
f66b53fdbb22ce Martin Varghese 2019-12-21  1363  			err = push_mpls(skb, key, mpls->mpls_lse,
f66b53fdbb22ce Martin Varghese 2019-12-21  1364  					mpls->mpls_ethertype, mac_len);
f66b53fdbb22ce Martin Varghese 2019-12-21  1365  			break;
f66b53fdbb22ce Martin Varghese 2019-12-21  1366  		}
25cd9ba0abc074 Simon Horman    2014-10-06  1367  		case OVS_ACTION_ATTR_POP_MPLS:
fff06c36a25632 Pravin B Shelar 2014-11-06  1368  			err = pop_mpls(skb, key, nla_get_be16(a));
25cd9ba0abc074 Simon Horman    2014-10-06  1369  			break;
25cd9ba0abc074 Simon Horman    2014-10-06  1370  
ccb1352e76cff0 Jesse Gross     2011-10-25  1371  		case OVS_ACTION_ATTR_PUSH_VLAN:
fff06c36a25632 Pravin B Shelar 2014-11-06  1372  			err = push_vlan(skb, key, nla_data(a));
ccb1352e76cff0 Jesse Gross     2011-10-25  1373  			break;
ccb1352e76cff0 Jesse Gross     2011-10-25  1374  
ccb1352e76cff0 Jesse Gross     2011-10-25  1375  		case OVS_ACTION_ATTR_POP_VLAN:
fff06c36a25632 Pravin B Shelar 2014-11-06  1376  			err = pop_vlan(skb, key);
ccb1352e76cff0 Jesse Gross     2011-10-25  1377  			break;
ccb1352e76cff0 Jesse Gross     2011-10-25  1378  
bef7f7567a104a andy zhou       2017-03-20  1379  		case OVS_ACTION_ATTR_RECIRC: {
bef7f7567a104a andy zhou       2017-03-20  1380  			bool last = nla_is_last(a, rem);
bef7f7567a104a andy zhou       2017-03-20  1381  
bef7f7567a104a andy zhou       2017-03-20  1382  			err = execute_recirc(dp, skb, key, a, last);
bef7f7567a104a andy zhou       2017-03-20  1383  			if (last) {
971427f353f3c4 Andy Zhou       2014-09-15  1384  				/* If this is the last action, the skb has
971427f353f3c4 Andy Zhou       2014-09-15  1385  				 * been consumed or freed.
971427f353f3c4 Andy Zhou       2014-09-15  1386  				 * Return immediately.
971427f353f3c4 Andy Zhou       2014-09-15  1387  				 */
971427f353f3c4 Andy Zhou       2014-09-15  1388  				return err;
971427f353f3c4 Andy Zhou       2014-09-15  1389  			}
971427f353f3c4 Andy Zhou       2014-09-15  1390  			break;
bef7f7567a104a andy zhou       2017-03-20  1391  		}
971427f353f3c4 Andy Zhou       2014-09-15  1392  
ccb1352e76cff0 Jesse Gross     2011-10-25  1393  		case OVS_ACTION_ATTR_SET:
fff06c36a25632 Pravin B Shelar 2014-11-06  1394  			err = execute_set_action(skb, key, nla_data(a));
ccb1352e76cff0 Jesse Gross     2011-10-25  1395  			break;
ccb1352e76cff0 Jesse Gross     2011-10-25  1396  
83d2b9ba1abca2 Jarno Rajahalme 2015-02-05  1397  		case OVS_ACTION_ATTR_SET_MASKED:
83d2b9ba1abca2 Jarno Rajahalme 2015-02-05  1398  		case OVS_ACTION_ATTR_SET_TO_MASKED:
83d2b9ba1abca2 Jarno Rajahalme 2015-02-05  1399  			err = execute_masked_set_action(skb, key, nla_data(a));
83d2b9ba1abca2 Jarno Rajahalme 2015-02-05  1400  			break;
83d2b9ba1abca2 Jarno Rajahalme 2015-02-05  1401  
798c166173ffb5 andy zhou       2017-03-20  1402  		case OVS_ACTION_ATTR_SAMPLE: {
798c166173ffb5 andy zhou       2017-03-20  1403  			bool last = nla_is_last(a, rem);
798c166173ffb5 andy zhou       2017-03-20  1404  
798c166173ffb5 andy zhou       2017-03-20  1405  			err = sample(dp, skb, key, a, last);
798c166173ffb5 andy zhou       2017-03-20  1406  			if (last)
798c166173ffb5 andy zhou       2017-03-20  1407  				return err;
798c166173ffb5 andy zhou       2017-03-20  1408  
ccb1352e76cff0 Jesse Gross     2011-10-25  1409  			break;
798c166173ffb5 andy zhou       2017-03-20  1410  		}
7f8a436eaa2c3d Joe Stringer    2015-08-26  1411  
7f8a436eaa2c3d Joe Stringer    2015-08-26  1412  		case OVS_ACTION_ATTR_CT:
ec0d043d05e6e3 Joe Stringer    2015-10-06  1413  			if (!is_flow_key_valid(key)) {
ec0d043d05e6e3 Joe Stringer    2015-10-06  1414  				err = ovs_flow_key_update(skb, key);
ec0d043d05e6e3 Joe Stringer    2015-10-06  1415  				if (err)
ec0d043d05e6e3 Joe Stringer    2015-10-06  1416  					return err;
ec0d043d05e6e3 Joe Stringer    2015-10-06  1417  			}
ec0d043d05e6e3 Joe Stringer    2015-10-06  1418  
7f8a436eaa2c3d Joe Stringer    2015-08-26  1419  			err = ovs_ct_execute(ovs_dp_get_net(dp), skb, key,
7f8a436eaa2c3d Joe Stringer    2015-08-26  1420  					     nla_data(a));
7f8a436eaa2c3d Joe Stringer    2015-08-26  1421  
7f8a436eaa2c3d Joe Stringer    2015-08-26  1422  			/* Hide stolen IP fragments from user space. */
74c16618137f15 Joe Stringer    2015-10-25  1423  			if (err)
74c16618137f15 Joe Stringer    2015-10-25  1424  				return err == -EINPROGRESS ? 0 : err;
7f8a436eaa2c3d Joe Stringer    2015-08-26  1425  			break;
91820da6ae8590 Jiri Benc       2016-11-10  1426  
b8226962b1c49c Eric Garver     2017-10-10  1427  		case OVS_ACTION_ATTR_CT_CLEAR:
b8226962b1c49c Eric Garver     2017-10-10  1428  			err = ovs_ct_clear(skb, key);
b8226962b1c49c Eric Garver     2017-10-10  1429  			break;
b8226962b1c49c Eric Garver     2017-10-10  1430  
91820da6ae8590 Jiri Benc       2016-11-10  1431  		case OVS_ACTION_ATTR_PUSH_ETH:
91820da6ae8590 Jiri Benc       2016-11-10  1432  			err = push_eth(skb, key, nla_data(a));
91820da6ae8590 Jiri Benc       2016-11-10  1433  			break;
91820da6ae8590 Jiri Benc       2016-11-10  1434  
91820da6ae8590 Jiri Benc       2016-11-10  1435  		case OVS_ACTION_ATTR_POP_ETH:
91820da6ae8590 Jiri Benc       2016-11-10  1436  			err = pop_eth(skb, key);
91820da6ae8590 Jiri Benc       2016-11-10  1437  			break;
b2d0f5d5dc5353 Yi Yang         2017-11-07  1438  
b2d0f5d5dc5353 Yi Yang         2017-11-07  1439  		case OVS_ACTION_ATTR_PUSH_NSH: {
b2d0f5d5dc5353 Yi Yang         2017-11-07  1440  			u8 buffer[NSH_HDR_MAX_LEN];
b2d0f5d5dc5353 Yi Yang         2017-11-07  1441  			struct nshhdr *nh = (struct nshhdr *)buffer;
b2d0f5d5dc5353 Yi Yang         2017-11-07  1442  
b2d0f5d5dc5353 Yi Yang         2017-11-07  1443  			err = nsh_hdr_from_nlattr(nla_data(a), nh,
b2d0f5d5dc5353 Yi Yang         2017-11-07  1444  						  NSH_HDR_MAX_LEN);
b2d0f5d5dc5353 Yi Yang         2017-11-07  1445  			if (unlikely(err))
b2d0f5d5dc5353 Yi Yang         2017-11-07  1446  				break;
b2d0f5d5dc5353 Yi Yang         2017-11-07  1447  			err = push_nsh(skb, key, nh);
b2d0f5d5dc5353 Yi Yang         2017-11-07  1448  			break;
b2d0f5d5dc5353 Yi Yang         2017-11-07  1449  		}
b2d0f5d5dc5353 Yi Yang         2017-11-07  1450  
b2d0f5d5dc5353 Yi Yang         2017-11-07  1451  		case OVS_ACTION_ATTR_POP_NSH:
b2d0f5d5dc5353 Yi Yang         2017-11-07  1452  			err = pop_nsh(skb, key);
b2d0f5d5dc5353 Yi Yang         2017-11-07  1453  			break;
cd8a6c33693c1b Andy Zhou       2017-11-10  1454  
cd8a6c33693c1b Andy Zhou       2017-11-10  1455  		case OVS_ACTION_ATTR_METER:
cd8a6c33693c1b Andy Zhou       2017-11-10  1456  			if (ovs_meter_execute(dp, skb, key, nla_get_u32(a))) {
cd8a6c33693c1b Andy Zhou       2017-11-10  1457  				consume_skb(skb);
cd8a6c33693c1b Andy Zhou       2017-11-10  1458  				return 0;
cd8a6c33693c1b Andy Zhou       2017-11-10  1459  			}
b233504033dbd6 Yifeng Sun      2018-07-02  1460  			break;
b233504033dbd6 Yifeng Sun      2018-07-02  1461  
b233504033dbd6 Yifeng Sun      2018-07-02  1462  		case OVS_ACTION_ATTR_CLONE: {
b233504033dbd6 Yifeng Sun      2018-07-02  1463  			bool last = nla_is_last(a, rem);
b233504033dbd6 Yifeng Sun      2018-07-02  1464  
b233504033dbd6 Yifeng Sun      2018-07-02  1465  			err = clone(dp, skb, key, a, last);
b233504033dbd6 Yifeng Sun      2018-07-02  1466  			if (last)
b233504033dbd6 Yifeng Sun      2018-07-02  1467  				return err;
b233504033dbd6 Yifeng Sun      2018-07-02  1468  
b233504033dbd6 Yifeng Sun      2018-07-02  1469  			break;
b233504033dbd6 Yifeng Sun      2018-07-02  1470  		}
4d5ec89fc8d14d Numan Siddique  2019-03-26  1471  
4d5ec89fc8d14d Numan Siddique  2019-03-26  1472  		case OVS_ACTION_ATTR_CHECK_PKT_LEN: {
4d5ec89fc8d14d Numan Siddique  2019-03-26  1473  			bool last = nla_is_last(a, rem);
4d5ec89fc8d14d Numan Siddique  2019-03-26  1474  
4d5ec89fc8d14d Numan Siddique  2019-03-26  1475  			err = execute_check_pkt_len(dp, skb, key, a, last);
4d5ec89fc8d14d Numan Siddique  2019-03-26  1476  			if (last)
4d5ec89fc8d14d Numan Siddique  2019-03-26  1477  				return err;
4d5ec89fc8d14d Numan Siddique  2019-03-26  1478  
4d5ec89fc8d14d Numan Siddique  2019-03-26  1479  			break;
4d5ec89fc8d14d Numan Siddique  2019-03-26  1480  		}
744676e777207f Matteo Croce    2020-02-15  1481  
744676e777207f Matteo Croce    2020-02-15  1482  		case OVS_ACTION_ATTR_DEC_TTL:
744676e777207f Matteo Croce    2020-02-15  1483  			err = execute_dec_ttl(skb, key);
a5317f3b06b3af Eelco Chaudron  2021-01-13  1484  			if (err == -EHOSTUNREACH)
a5317f3b06b3af Eelco Chaudron  2021-01-13  1485  				return dec_ttl_exception_handler(dp, skb,
a5317f3b06b3af Eelco Chaudron  2021-01-13  1486  								 key, a);
744676e777207f Matteo Croce    2020-02-15  1487  			break;
7ba915b0774186 Eric Garver     2023-08-01  1488  
7ba915b0774186 Eric Garver     2023-08-01  1489  		case OVS_ACTION_ATTR_DROP: {
7ba915b0774186 Eric Garver     2023-08-01  1490  			enum ovs_drop_reason reason = nla_get_u32(a)
7ba915b0774186 Eric Garver     2023-08-01  1491  				? OVS_DROP_EXPLICIT_ACTION_ERROR
7ba915b0774186 Eric Garver     2023-08-01  1492  				: OVS_DROP_EXPLICIT_ACTION;
7ba915b0774186 Eric Garver     2023-08-01  1493  
7ba915b0774186 Eric Garver     2023-08-01 @1494  			kfree_skb_reason(skb, reason);
7ba915b0774186 Eric Garver     2023-08-01  1495  			return 0;
7ba915b0774186 Eric Garver     2023-08-01  1496  		}
ccb1352e76cff0 Jesse Gross     2011-10-25  1497  		}
ccb1352e76cff0 Jesse Gross     2011-10-25  1498  
ccb1352e76cff0 Jesse Gross     2011-10-25  1499  		if (unlikely(err)) {
8dcf60bc963af6 Adrian Moreno   2023-08-01  1500  			kfree_skb_reason(skb, OVS_DROP_ACTION_ERROR);
ccb1352e76cff0 Jesse Gross     2011-10-25  1501  			return err;
ccb1352e76cff0 Jesse Gross     2011-10-25  1502  		}
ccb1352e76cff0 Jesse Gross     2011-10-25  1503  	}
ccb1352e76cff0 Jesse Gross     2011-10-25  1504  
d6647a78fa3e11 Adrian Moreno   2023-08-01  1505  	kfree_skb_reason(skb, OVS_DROP_FLOW);
ccb1352e76cff0 Jesse Gross     2011-10-25  1506  	return 0;
ccb1352e76cff0 Jesse Gross     2011-10-25  1507  }
ccb1352e76cff0 Jesse Gross     2011-10-25  1508  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
