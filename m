Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7342F32
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Jul 2023 23:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688254406; x=1719790406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t9+E1XcVBHQ5ROHTEfpW7fG8FYhexwhnJfnRhyWj7Nk=;
  b=h9cmtqCGsd741efu+UJumKiXA9ioOZLjpbMsl3P9/H6iOZ4ZT5mOZ6ul
   +YnUOTi24hR7fFmmGMuf0wfoqLNDonS5GUgyWSspES+zxZeeSx7cTwWic
   Cql45PbHl0MsJi8smOf6hSibx0BmAK8wEfWVaJbBvM6g+fG0VBEY6hSgv
   Hnduf8phB/d++PztNlqjynHewlkSn8iLo39fCTVSHjFkPs+mD6vI3AZqA
   Fs+6DSoENFnHZaycIPE+OhI/0xTjWMA90vIYQJVnNutL+93Bp3xX9mhAW
   BeKr3go+P9cClhoaP64dkXsRjLm8Opphl3VI9BIDqr2EAbUqD+rrmiYcN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="393378273"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="393378273"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 16:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="712167299"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="712167299"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Jul 2023 16:33:23 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFk5j-000GKX-0W;
	Sat, 01 Jul 2023 23:33:23 +0000
Date: Sun, 2 Jul 2023 07:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next 2/2] net: openvswitch: add drop action
Message-ID: <202307020716.nFswEOPl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/openvswitch/actions.c:1483:25: sparse: sparse: typename in expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230629203005.2137107-3-eric@garver.life>
References: <20230629203005.2137107-3-eric@garver.life>
TO: Eric Garver <eric@garver.life>
TO: netdev@vger.kernel.org
CC: dev@openvswitch.org
CC: Pravin B Shelar <pshelar@ovn.org>
CC: Ilya Maximets <i.maximets@ovn.org>

Hi Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Garver/net-openvswitch-add-drop-reasons/20230630-043307
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230629203005.2137107-3-eric%40garver.life
patch subject: [PATCH net-next 2/2] net: openvswitch: add drop action
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc-randconfig-r081-20230702 (https://download.01.org/0day-ci/archive/20230702/202307020716.nFswEOPl-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230702/202307020716.nFswEOPl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307020716.nFswEOPl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/openvswitch/actions.c:1483:25: sparse: sparse: typename in expression
   net/openvswitch/actions.c:1483:29: sparse: sparse: Expected ; at end of statement
   net/openvswitch/actions.c:1483:29: sparse: sparse: got reason
   net/openvswitch/actions.c:1483:25: sparse: sparse: undefined identifier 'u32'
   net/openvswitch/actions.c:1485:25: sparse: sparse: undefined identifier 'reason'
   net/openvswitch/actions.c:1488:29: sparse: sparse: undefined identifier 'reason'
   net/openvswitch/actions.c:1491:47: sparse: sparse: undefined identifier 'reason'

vim +1483 net/openvswitch/actions.c

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
5b8784aaf29be2 andy zhou       2017-01-27  1301  		switch (nla_type(a)) {
5b8784aaf29be2 andy zhou       2017-01-27  1302  		case OVS_ACTION_ATTR_OUTPUT: {
5b8784aaf29be2 andy zhou       2017-01-27  1303  			int port = nla_get_u32(a);
5b8784aaf29be2 andy zhou       2017-01-27  1304  			struct sk_buff *clone;
738967b8bf57e5 Andy Zhou       2014-09-08  1305  
5b8784aaf29be2 andy zhou       2017-01-27  1306  			/* Every output action needs a separate clone
5b8784aaf29be2 andy zhou       2017-01-27  1307  			 * of 'skb', In case the output action is the
5b8784aaf29be2 andy zhou       2017-01-27  1308  			 * last action, cloning can be avoided.
5b8784aaf29be2 andy zhou       2017-01-27  1309  			 */
5b8784aaf29be2 andy zhou       2017-01-27  1310  			if (nla_is_last(a, rem)) {
5b8784aaf29be2 andy zhou       2017-01-27  1311  				do_output(dp, skb, port, key);
5b8784aaf29be2 andy zhou       2017-01-27  1312  				/* 'skb' has been used for output.
5b8784aaf29be2 andy zhou       2017-01-27  1313  				 */
5b8784aaf29be2 andy zhou       2017-01-27  1314  				return 0;
ccb1352e76cff0 Jesse Gross     2011-10-25  1315  			}
ccb1352e76cff0 Jesse Gross     2011-10-25  1316  
5b8784aaf29be2 andy zhou       2017-01-27  1317  			clone = skb_clone(skb, GFP_ATOMIC);
5b8784aaf29be2 andy zhou       2017-01-27  1318  			if (clone)
5b8784aaf29be2 andy zhou       2017-01-27  1319  				do_output(dp, clone, port, key);
5b8784aaf29be2 andy zhou       2017-01-27  1320  			OVS_CB(skb)->cutlen = 0;
ccb1352e76cff0 Jesse Gross     2011-10-25  1321  			break;
5b8784aaf29be2 andy zhou       2017-01-27  1322  		}
ccb1352e76cff0 Jesse Gross     2011-10-25  1323  
f2a4d086ed4c58 William Tu      2016-06-10  1324  		case OVS_ACTION_ATTR_TRUNC: {
f2a4d086ed4c58 William Tu      2016-06-10  1325  			struct ovs_action_trunc *trunc = nla_data(a);
f2a4d086ed4c58 William Tu      2016-06-10  1326  
f2a4d086ed4c58 William Tu      2016-06-10  1327  			if (skb->len > trunc->max_len)
f2a4d086ed4c58 William Tu      2016-06-10  1328  				OVS_CB(skb)->cutlen = skb->len - trunc->max_len;
f2a4d086ed4c58 William Tu      2016-06-10  1329  			break;
f2a4d086ed4c58 William Tu      2016-06-10  1330  		}
f2a4d086ed4c58 William Tu      2016-06-10  1331  
ccb1352e76cff0 Jesse Gross     2011-10-25  1332  		case OVS_ACTION_ATTR_USERSPACE:
f2a4d086ed4c58 William Tu      2016-06-10  1333  			output_userspace(dp, skb, key, a, attr,
f2a4d086ed4c58 William Tu      2016-06-10  1334  						     len, OVS_CB(skb)->cutlen);
f2a4d086ed4c58 William Tu      2016-06-10  1335  			OVS_CB(skb)->cutlen = 0;
ccb1352e76cff0 Jesse Gross     2011-10-25  1336  			break;
ccb1352e76cff0 Jesse Gross     2011-10-25  1337  
971427f353f3c4 Andy Zhou       2014-09-15  1338  		case OVS_ACTION_ATTR_HASH:
971427f353f3c4 Andy Zhou       2014-09-15  1339  			execute_hash(skb, key, a);
971427f353f3c4 Andy Zhou       2014-09-15  1340  			break;
971427f353f3c4 Andy Zhou       2014-09-15  1341  
f66b53fdbb22ce Martin Varghese 2019-12-21  1342  		case OVS_ACTION_ATTR_PUSH_MPLS: {
f66b53fdbb22ce Martin Varghese 2019-12-21  1343  			struct ovs_action_push_mpls *mpls = nla_data(a);
f66b53fdbb22ce Martin Varghese 2019-12-21  1344  
f66b53fdbb22ce Martin Varghese 2019-12-21  1345  			err = push_mpls(skb, key, mpls->mpls_lse,
f66b53fdbb22ce Martin Varghese 2019-12-21  1346  					mpls->mpls_ethertype, skb->mac_len);
25cd9ba0abc074 Simon Horman    2014-10-06  1347  			break;
f66b53fdbb22ce Martin Varghese 2019-12-21  1348  		}
f66b53fdbb22ce Martin Varghese 2019-12-21  1349  		case OVS_ACTION_ATTR_ADD_MPLS: {
f66b53fdbb22ce Martin Varghese 2019-12-21  1350  			struct ovs_action_add_mpls *mpls = nla_data(a);
f66b53fdbb22ce Martin Varghese 2019-12-21  1351  			__u16 mac_len = 0;
f66b53fdbb22ce Martin Varghese 2019-12-21  1352  
f66b53fdbb22ce Martin Varghese 2019-12-21  1353  			if (mpls->tun_flags & OVS_MPLS_L3_TUNNEL_FLAG_MASK)
f66b53fdbb22ce Martin Varghese 2019-12-21  1354  				mac_len = skb->mac_len;
25cd9ba0abc074 Simon Horman    2014-10-06  1355  
f66b53fdbb22ce Martin Varghese 2019-12-21  1356  			err = push_mpls(skb, key, mpls->mpls_lse,
f66b53fdbb22ce Martin Varghese 2019-12-21  1357  					mpls->mpls_ethertype, mac_len);
f66b53fdbb22ce Martin Varghese 2019-12-21  1358  			break;
f66b53fdbb22ce Martin Varghese 2019-12-21  1359  		}
25cd9ba0abc074 Simon Horman    2014-10-06  1360  		case OVS_ACTION_ATTR_POP_MPLS:
fff06c36a25632 Pravin B Shelar 2014-11-06  1361  			err = pop_mpls(skb, key, nla_get_be16(a));
25cd9ba0abc074 Simon Horman    2014-10-06  1362  			break;
25cd9ba0abc074 Simon Horman    2014-10-06  1363  
ccb1352e76cff0 Jesse Gross     2011-10-25  1364  		case OVS_ACTION_ATTR_PUSH_VLAN:
fff06c36a25632 Pravin B Shelar 2014-11-06  1365  			err = push_vlan(skb, key, nla_data(a));
ccb1352e76cff0 Jesse Gross     2011-10-25  1366  			break;
ccb1352e76cff0 Jesse Gross     2011-10-25  1367  
ccb1352e76cff0 Jesse Gross     2011-10-25  1368  		case OVS_ACTION_ATTR_POP_VLAN:
fff06c36a25632 Pravin B Shelar 2014-11-06  1369  			err = pop_vlan(skb, key);
ccb1352e76cff0 Jesse Gross     2011-10-25  1370  			break;
ccb1352e76cff0 Jesse Gross     2011-10-25  1371  
bef7f7567a104a andy zhou       2017-03-20  1372  		case OVS_ACTION_ATTR_RECIRC: {
bef7f7567a104a andy zhou       2017-03-20  1373  			bool last = nla_is_last(a, rem);
bef7f7567a104a andy zhou       2017-03-20  1374  
bef7f7567a104a andy zhou       2017-03-20  1375  			err = execute_recirc(dp, skb, key, a, last);
bef7f7567a104a andy zhou       2017-03-20  1376  			if (last) {
971427f353f3c4 Andy Zhou       2014-09-15  1377  				/* If this is the last action, the skb has
971427f353f3c4 Andy Zhou       2014-09-15  1378  				 * been consumed or freed.
971427f353f3c4 Andy Zhou       2014-09-15  1379  				 * Return immediately.
971427f353f3c4 Andy Zhou       2014-09-15  1380  				 */
971427f353f3c4 Andy Zhou       2014-09-15  1381  				return err;
971427f353f3c4 Andy Zhou       2014-09-15  1382  			}
971427f353f3c4 Andy Zhou       2014-09-15  1383  			break;
bef7f7567a104a andy zhou       2017-03-20  1384  		}
971427f353f3c4 Andy Zhou       2014-09-15  1385  
ccb1352e76cff0 Jesse Gross     2011-10-25  1386  		case OVS_ACTION_ATTR_SET:
fff06c36a25632 Pravin B Shelar 2014-11-06  1387  			err = execute_set_action(skb, key, nla_data(a));
ccb1352e76cff0 Jesse Gross     2011-10-25  1388  			break;
ccb1352e76cff0 Jesse Gross     2011-10-25  1389  
83d2b9ba1abca2 Jarno Rajahalme 2015-02-05  1390  		case OVS_ACTION_ATTR_SET_MASKED:
83d2b9ba1abca2 Jarno Rajahalme 2015-02-05  1391  		case OVS_ACTION_ATTR_SET_TO_MASKED:
83d2b9ba1abca2 Jarno Rajahalme 2015-02-05  1392  			err = execute_masked_set_action(skb, key, nla_data(a));
83d2b9ba1abca2 Jarno Rajahalme 2015-02-05  1393  			break;
83d2b9ba1abca2 Jarno Rajahalme 2015-02-05  1394  
798c166173ffb5 andy zhou       2017-03-20  1395  		case OVS_ACTION_ATTR_SAMPLE: {
798c166173ffb5 andy zhou       2017-03-20  1396  			bool last = nla_is_last(a, rem);
798c166173ffb5 andy zhou       2017-03-20  1397  
798c166173ffb5 andy zhou       2017-03-20  1398  			err = sample(dp, skb, key, a, last);
798c166173ffb5 andy zhou       2017-03-20  1399  			if (last)
798c166173ffb5 andy zhou       2017-03-20  1400  				return err;
798c166173ffb5 andy zhou       2017-03-20  1401  
ccb1352e76cff0 Jesse Gross     2011-10-25  1402  			break;
798c166173ffb5 andy zhou       2017-03-20  1403  		}
7f8a436eaa2c3d Joe Stringer    2015-08-26  1404  
7f8a436eaa2c3d Joe Stringer    2015-08-26  1405  		case OVS_ACTION_ATTR_CT:
ec0d043d05e6e3 Joe Stringer    2015-10-06  1406  			if (!is_flow_key_valid(key)) {
ec0d043d05e6e3 Joe Stringer    2015-10-06  1407  				err = ovs_flow_key_update(skb, key);
ec0d043d05e6e3 Joe Stringer    2015-10-06  1408  				if (err)
ec0d043d05e6e3 Joe Stringer    2015-10-06  1409  					return err;
ec0d043d05e6e3 Joe Stringer    2015-10-06  1410  			}
ec0d043d05e6e3 Joe Stringer    2015-10-06  1411  
7f8a436eaa2c3d Joe Stringer    2015-08-26  1412  			err = ovs_ct_execute(ovs_dp_get_net(dp), skb, key,
7f8a436eaa2c3d Joe Stringer    2015-08-26  1413  					     nla_data(a));
7f8a436eaa2c3d Joe Stringer    2015-08-26  1414  
7f8a436eaa2c3d Joe Stringer    2015-08-26  1415  			/* Hide stolen IP fragments from user space. */
74c16618137f15 Joe Stringer    2015-10-25  1416  			if (err)
74c16618137f15 Joe Stringer    2015-10-25  1417  				return err == -EINPROGRESS ? 0 : err;
7f8a436eaa2c3d Joe Stringer    2015-08-26  1418  			break;
91820da6ae8590 Jiri Benc       2016-11-10  1419  
b8226962b1c49c Eric Garver     2017-10-10  1420  		case OVS_ACTION_ATTR_CT_CLEAR:
b8226962b1c49c Eric Garver     2017-10-10  1421  			err = ovs_ct_clear(skb, key);
b8226962b1c49c Eric Garver     2017-10-10  1422  			break;
b8226962b1c49c Eric Garver     2017-10-10  1423  
91820da6ae8590 Jiri Benc       2016-11-10  1424  		case OVS_ACTION_ATTR_PUSH_ETH:
91820da6ae8590 Jiri Benc       2016-11-10  1425  			err = push_eth(skb, key, nla_data(a));
91820da6ae8590 Jiri Benc       2016-11-10  1426  			break;
91820da6ae8590 Jiri Benc       2016-11-10  1427  
91820da6ae8590 Jiri Benc       2016-11-10  1428  		case OVS_ACTION_ATTR_POP_ETH:
91820da6ae8590 Jiri Benc       2016-11-10  1429  			err = pop_eth(skb, key);
91820da6ae8590 Jiri Benc       2016-11-10  1430  			break;
b2d0f5d5dc5353 Yi Yang         2017-11-07  1431  
b2d0f5d5dc5353 Yi Yang         2017-11-07  1432  		case OVS_ACTION_ATTR_PUSH_NSH: {
b2d0f5d5dc5353 Yi Yang         2017-11-07  1433  			u8 buffer[NSH_HDR_MAX_LEN];
b2d0f5d5dc5353 Yi Yang         2017-11-07  1434  			struct nshhdr *nh = (struct nshhdr *)buffer;
b2d0f5d5dc5353 Yi Yang         2017-11-07  1435  
b2d0f5d5dc5353 Yi Yang         2017-11-07  1436  			err = nsh_hdr_from_nlattr(nla_data(a), nh,
b2d0f5d5dc5353 Yi Yang         2017-11-07  1437  						  NSH_HDR_MAX_LEN);
b2d0f5d5dc5353 Yi Yang         2017-11-07  1438  			if (unlikely(err))
b2d0f5d5dc5353 Yi Yang         2017-11-07  1439  				break;
b2d0f5d5dc5353 Yi Yang         2017-11-07  1440  			err = push_nsh(skb, key, nh);
b2d0f5d5dc5353 Yi Yang         2017-11-07  1441  			break;
b2d0f5d5dc5353 Yi Yang         2017-11-07  1442  		}
b2d0f5d5dc5353 Yi Yang         2017-11-07  1443  
b2d0f5d5dc5353 Yi Yang         2017-11-07  1444  		case OVS_ACTION_ATTR_POP_NSH:
b2d0f5d5dc5353 Yi Yang         2017-11-07  1445  			err = pop_nsh(skb, key);
b2d0f5d5dc5353 Yi Yang         2017-11-07  1446  			break;
cd8a6c33693c1b Andy Zhou       2017-11-10  1447  
cd8a6c33693c1b Andy Zhou       2017-11-10  1448  		case OVS_ACTION_ATTR_METER:
cd8a6c33693c1b Andy Zhou       2017-11-10  1449  			if (ovs_meter_execute(dp, skb, key, nla_get_u32(a))) {
cd8a6c33693c1b Andy Zhou       2017-11-10  1450  				consume_skb(skb);
cd8a6c33693c1b Andy Zhou       2017-11-10  1451  				return 0;
cd8a6c33693c1b Andy Zhou       2017-11-10  1452  			}
b233504033dbd6 Yifeng Sun      2018-07-02  1453  			break;
b233504033dbd6 Yifeng Sun      2018-07-02  1454  
b233504033dbd6 Yifeng Sun      2018-07-02  1455  		case OVS_ACTION_ATTR_CLONE: {
b233504033dbd6 Yifeng Sun      2018-07-02  1456  			bool last = nla_is_last(a, rem);
b233504033dbd6 Yifeng Sun      2018-07-02  1457  
b233504033dbd6 Yifeng Sun      2018-07-02  1458  			err = clone(dp, skb, key, a, last);
b233504033dbd6 Yifeng Sun      2018-07-02  1459  			if (last)
b233504033dbd6 Yifeng Sun      2018-07-02  1460  				return err;
b233504033dbd6 Yifeng Sun      2018-07-02  1461  
b233504033dbd6 Yifeng Sun      2018-07-02  1462  			break;
b233504033dbd6 Yifeng Sun      2018-07-02  1463  		}
4d5ec89fc8d14d Numan Siddique  2019-03-26  1464  
4d5ec89fc8d14d Numan Siddique  2019-03-26  1465  		case OVS_ACTION_ATTR_CHECK_PKT_LEN: {
4d5ec89fc8d14d Numan Siddique  2019-03-26  1466  			bool last = nla_is_last(a, rem);
4d5ec89fc8d14d Numan Siddique  2019-03-26  1467  
4d5ec89fc8d14d Numan Siddique  2019-03-26  1468  			err = execute_check_pkt_len(dp, skb, key, a, last);
4d5ec89fc8d14d Numan Siddique  2019-03-26  1469  			if (last)
4d5ec89fc8d14d Numan Siddique  2019-03-26  1470  				return err;
4d5ec89fc8d14d Numan Siddique  2019-03-26  1471  
4d5ec89fc8d14d Numan Siddique  2019-03-26  1472  			break;
4d5ec89fc8d14d Numan Siddique  2019-03-26  1473  		}
744676e777207f Matteo Croce    2020-02-15  1474  
744676e777207f Matteo Croce    2020-02-15  1475  		case OVS_ACTION_ATTR_DEC_TTL:
744676e777207f Matteo Croce    2020-02-15  1476  			err = execute_dec_ttl(skb, key);
a5317f3b06b3af Eelco Chaudron  2021-01-13  1477  			if (err == -EHOSTUNREACH)
a5317f3b06b3af Eelco Chaudron  2021-01-13  1478  				return dec_ttl_exception_handler(dp, skb,
a5317f3b06b3af Eelco Chaudron  2021-01-13  1479  								 key, a);
744676e777207f Matteo Croce    2020-02-15  1480  			break;
9220faeba2f627 Eric Garver     2023-06-29  1481  
9220faeba2f627 Eric Garver     2023-06-29  1482  		case OVS_ACTION_ATTR_DROP:
9220faeba2f627 Eric Garver     2023-06-29 @1483  			u32 reason = nla_get_u32(a);
9220faeba2f627 Eric Garver     2023-06-29  1484  
9220faeba2f627 Eric Garver     2023-06-29  1485  			reason |= SKB_DROP_REASON_SUBSYS_OPENVSWITCH <<
9220faeba2f627 Eric Garver     2023-06-29  1486  					SKB_DROP_REASON_SUBSYS_SHIFT;
9220faeba2f627 Eric Garver     2023-06-29  1487  
9220faeba2f627 Eric Garver     2023-06-29  1488  			if (reason == OVS_XLATE_OK)
9220faeba2f627 Eric Garver     2023-06-29  1489  				break;
9220faeba2f627 Eric Garver     2023-06-29  1490  
9220faeba2f627 Eric Garver     2023-06-29  1491  			kfree_skb_reason(skb, reason);
9220faeba2f627 Eric Garver     2023-06-29  1492  			return 0;
ccb1352e76cff0 Jesse Gross     2011-10-25  1493  		}
ccb1352e76cff0 Jesse Gross     2011-10-25  1494  
ccb1352e76cff0 Jesse Gross     2011-10-25  1495  		if (unlikely(err)) {
ccb1352e76cff0 Jesse Gross     2011-10-25  1496  			kfree_skb(skb);
ccb1352e76cff0 Jesse Gross     2011-10-25  1497  			return err;
ccb1352e76cff0 Jesse Gross     2011-10-25  1498  		}
ccb1352e76cff0 Jesse Gross     2011-10-25  1499  	}
ccb1352e76cff0 Jesse Gross     2011-10-25  1500  
ccb1352e76cff0 Jesse Gross     2011-10-25  1501  	consume_skb(skb);
ccb1352e76cff0 Jesse Gross     2011-10-25  1502  	return 0;
ccb1352e76cff0 Jesse Gross     2011-10-25  1503  }
ccb1352e76cff0 Jesse Gross     2011-10-25  1504  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
