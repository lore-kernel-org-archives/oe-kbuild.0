Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC777B
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Mar 2023 23:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679355075; x=1710891075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GL87gzJsWPSc7P86egv8NjWrmY6exGwrBAYLq0CJZ5k=;
  b=dRuKm1hL35pBUPXNNWnvvhTf/dZYjDWqzUc2Mx7DWVohqbySeNlEH3il
   1ggtvoxXkq9+po3g1jImMCJD82Ie8jXji1LaF9Aw8DdR188BbC4t+zxMn
   Pe529+BqsNa5NEeKvFR5jTNKKnH2+STIhp8oCHD94GJA15N3z6sw6Kurm
   xMmYBg2eY97rbzjP7rhPXcP89mru5yMrXxzT/LLGN2mWYsZUGd/EO8hbJ
   w+ViP6opeQ/jYYeC1S75oZDxkKuCvLwM0UmJzBbkWjvSfmcyzZPq2iR6l
   G4ZgAQKLckWIf7j3p0GosOfIw8GldA3HvIVgNN18WbVufqh2gLN4DPym9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="327176920"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="327176920"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 16:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="631323242"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="631323242"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Mar 2023 16:31:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peOxw-000BP8-2n;
	Mon, 20 Mar 2023 23:31:00 +0000
Date: Tue, 21 Mar 2023 07:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] Bluetooth: Split bt_iso_qos into dedicated structures
Message-ID: <202303210714.6LtgUnaV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/bluetooth/iso.c:1306:17: sparse: sparse: typename in expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230320143608.25399-2-iulia.tanasescu@nxp.com>
References: <20230320143608.25399-2-iulia.tanasescu@nxp.com>
TO: Iulia Tanasescu <iulia.tanasescu@nxp.com>
TO: linux-bluetooth@vger.kernel.org
CC: Iulia Tanasescu <iulia.tanasescu@nxp.com>

Hi Iulia,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on dd41882582a9ab19938598179386b81b793b4a5c]

url:    https://github.com/intel-lab-lkp/linux/commits/Iulia-Tanasescu/Bluetooth-Split-bt_iso_qos-into-dedicated-structures/20230320-223805
base:   dd41882582a9ab19938598179386b81b793b4a5c
patch link:    https://lore.kernel.org/r/20230320143608.25399-2-iulia.tanasescu%40nxp.com
patch subject: [PATCH 1/1] Bluetooth: Split bt_iso_qos into dedicated structures
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230321/202303210714.6LtgUnaV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/656a3f84716d5b683951fe8c2cdc3fd17a09950c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Iulia-Tanasescu/Bluetooth-Split-bt_iso_qos-into-dedicated-structures/20230320-223805
        git checkout 656a3f84716d5b683951fe8c2cdc3fd17a09950c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash net/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303210714.6LtgUnaV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/bluetooth/iso.c:1306:17: sparse: sparse: typename in expression
   net/bluetooth/iso.c:1306:24: sparse: sparse: Expected ; at end of statement
   net/bluetooth/iso.c:1306:24: sparse: sparse: got bt_iso_unicast_qos
   net/bluetooth/iso.c:1337:17: sparse: sparse: typename in expression
   net/bluetooth/iso.c:1337:24: sparse: sparse: Expected ; at end of statement
   net/bluetooth/iso.c:1337:24: sparse: sparse: got bt_iso_bcast_sink_qos
   net/bluetooth/iso.c:1368:17: sparse: sparse: typename in expression
   net/bluetooth/iso.c:1368:24: sparse: sparse: Expected ; at end of statement
   net/bluetooth/iso.c:1368:24: sparse: sparse: got bt_iso_bcast_source_qos
   net/bluetooth/iso.c:1459:17: sparse: sparse: typename in expression
   net/bluetooth/iso.c:1459:24: sparse: sparse: Expected ; at end of statement
   net/bluetooth/iso.c:1459:24: sparse: sparse: got bt_iso_unicast_qos
   net/bluetooth/iso.c:1468:17: sparse: sparse: typename in expression
   net/bluetooth/iso.c:1468:24: sparse: sparse: Expected ; at end of statement
   net/bluetooth/iso.c:1468:24: sparse: sparse: got bt_iso_bcast_sink_qos
   net/bluetooth/iso.c:1477:17: sparse: sparse: typename in expression
   net/bluetooth/iso.c:1477:24: sparse: sparse: Expected ; at end of statement
   net/bluetooth/iso.c:1477:24: sparse: sparse: got bt_iso_bcast_source_qos
   net/bluetooth/iso.c:1306:17: sparse: sparse: undefined identifier 'struct'
   net/bluetooth/iso.c:1314:23: sparse: sparse: undefined identifier 'unicast_qos'
>> net/bluetooth/iso.c:1314:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1314:23: sparse: sparse: undefined identifier 'unicast_qos'
>> net/bluetooth/iso.c:1314:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1314:23: sparse: sparse: undefined identifier 'unicast_qos'
>> net/bluetooth/iso.c:1314:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1314:23: sparse: sparse: undefined identifier 'unicast_qos'
>> net/bluetooth/iso.c:1314:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1314:23: sparse: sparse: undefined identifier 'unicast_qos'
>> net/bluetooth/iso.c:1314:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1315:35: sparse: sparse: undefined identifier 'unicast_qos'
   net/bluetooth/iso.c:1320:17: sparse: sparse: undefined identifier 'unicast_qos'
   net/bluetooth/iso.c:1320:17: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1320:17: sparse: sparse: undefined identifier 'unicast_qos'
   net/bluetooth/iso.c:1320:17: sparse: sparse: undefined identifier 'unicast_qos'
   net/bluetooth/iso.c:1322:40: sparse: sparse: undefined identifier 'unicast_qos'
   net/bluetooth/iso.c:1327:41: sparse: sparse: undefined identifier 'unicast_qos'
   net/bluetooth/iso.c:1332:43: sparse: sparse: undefined identifier 'unicast_qos'
   net/bluetooth/iso.c:1337:17: sparse: sparse: undefined identifier 'struct'
   net/bluetooth/iso.c:1345:23: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1345:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1345:23: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1345:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1345:23: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1345:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1345:23: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1345:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1345:23: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1345:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1346:35: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1351:17: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1351:17: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1351:17: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1351:17: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1353:40: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1358:44: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1363:40: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1368:17: sparse: sparse: undefined identifier 'struct'
   net/bluetooth/iso.c:1376:23: sparse: sparse: undefined identifier 'source_qos'
   net/bluetooth/iso.c:1376:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1376:23: sparse: sparse: undefined identifier 'source_qos'
   net/bluetooth/iso.c:1376:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1376:23: sparse: sparse: undefined identifier 'source_qos'
   net/bluetooth/iso.c:1376:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1376:23: sparse: sparse: undefined identifier 'source_qos'
   net/bluetooth/iso.c:1376:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1376:23: sparse: sparse: undefined identifier 'source_qos'
   net/bluetooth/iso.c:1376:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1377:35: sparse: sparse: undefined identifier 'source_qos'
   net/bluetooth/iso.c:1382:17: sparse: sparse: undefined identifier 'source_qos'
   net/bluetooth/iso.c:1382:17: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1382:17: sparse: sparse: undefined identifier 'source_qos'
   net/bluetooth/iso.c:1382:17: sparse: sparse: undefined identifier 'source_qos'
   net/bluetooth/iso.c:1384:40: sparse: sparse: undefined identifier 'source_qos'
   net/bluetooth/iso.c:1389:46: sparse: sparse: undefined identifier 'source_qos'
   net/bluetooth/iso.c:1394:42: sparse: sparse: undefined identifier 'source_qos'
   net/bluetooth/iso.c:1459:17: sparse: sparse: undefined identifier 'struct'
   net/bluetooth/iso.c:1461:23: sparse: sparse: undefined identifier 'unicast_qos'
   net/bluetooth/iso.c:1461:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1461:23: sparse: sparse: undefined identifier 'unicast_qos'
   net/bluetooth/iso.c:1461:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1461:23: sparse: sparse: undefined identifier 'unicast_qos'
   net/bluetooth/iso.c:1461:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1461:23: sparse: sparse: undefined identifier 'unicast_qos'
   net/bluetooth/iso.c:1461:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1461:23: sparse: sparse: undefined identifier 'unicast_qos'
   net/bluetooth/iso.c:1461:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1462:42: sparse: sparse: undefined identifier 'unicast_qos'
   net/bluetooth/iso.c:1468:17: sparse: sparse: undefined identifier 'struct'
   net/bluetooth/iso.c:1470:23: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1470:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1470:23: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1470:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1470:23: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1470:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1470:23: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1470:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1470:23: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1470:23: sparse: sparse: cast from unknown type
   net/bluetooth/iso.c:1471:42: sparse: sparse: undefined identifier 'sink_qos'
   net/bluetooth/iso.c:1477:17: sparse: sparse: undefined identifier 'struct'
   net/bluetooth/iso.c:1479:23: sparse: sparse: undefined identifier 'source_qos'
>> net/bluetooth/iso.c:1479:23: sparse: sparse: too many errors
--
>> net/bluetooth/hci_conn.c:2095:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] skip @@     got unsigned short [usertype] skip @@
   net/bluetooth/hci_conn.c:2095:18: sparse:     expected restricted __le16 [usertype] skip
   net/bluetooth/hci_conn.c:2095:18: sparse:     got unsigned short [usertype] skip
>> net/bluetooth/hci_conn.c:2096:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] sync_timeout @@     got unsigned short [usertype] sync_timeout @@
   net/bluetooth/hci_conn.c:2096:26: sparse:     expected restricted __le16 [usertype] sync_timeout
   net/bluetooth/hci_conn.c:2096:26: sparse:     got unsigned short [usertype] sync_timeout
>> net/bluetooth/hci_conn.c:2126:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] timeout @@     got unsigned short [usertype] timeout @@
   net/bluetooth/hci_conn.c:2126:24: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] timeout
   net/bluetooth/hci_conn.c:2126:24: sparse:     got unsigned short [usertype] timeout

vim +1306 net/bluetooth/iso.c

656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1275  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1276  static int iso_sock_setsockopt(struct socket *sock, int level, int optname,
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1277  			       sockptr_t optval, unsigned int optlen)
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1278  {
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1279  	struct sock *sk = sock->sk;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1280  	int len, err = 0;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1281  	u32 opt;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1282  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1283  	BT_DBG("sk %p", sk);
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1284  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1285  	lock_sock(sk);
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1286  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1287  	switch (optname) {
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1288  	case BT_DEFER_SETUP:
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1289  		if (sk->sk_state != BT_BOUND && sk->sk_state != BT_LISTEN) {
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1290  			err = -EINVAL;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1291  			break;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1292  		}
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1293  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1294  		if (copy_from_sockptr(&opt, optval, sizeof(u32))) {
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1295  			err = -EFAULT;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1296  			break;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1297  		}
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1298  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1299  		if (opt)
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1300  			set_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags);
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1301  		else
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1302  			clear_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags);
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1303  		break;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1304  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1305  	case BT_ISO_UNICAST_QOS:
656a3f84716d5b6 Iulia Tanasescu        2023-03-20 @1306  		struct bt_iso_unicast_qos unicast_qos;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1307  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1308  		if (sk->sk_state != BT_OPEN && sk->sk_state != BT_BOUND &&
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1309  		    sk->sk_state != BT_CONNECT2) {
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1310  			err = -EINVAL;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1311  			break;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1312  		}
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1313  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20 @1314  		len = min_t(unsigned int, sizeof(unicast_qos), optlen);
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1315  		if (len != sizeof(unicast_qos)) {
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1316  			err = -EINVAL;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1317  			break;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1318  		}
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1319  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1320  		memset(&unicast_qos, 0, sizeof(unicast_qos));
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1321  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1322  		if (copy_from_sockptr(&unicast_qos, optval, len)) {
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1323  			err = -EFAULT;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1324  			break;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1325  		}
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1326  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1327  		if (!check_unicast_qos(&unicast_qos)) {
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1328  			err = -EINVAL;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1329  			break;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1330  		}
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1331  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1332  		iso_pi(sk)->unicast_qos = unicast_qos;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1333  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1334  		break;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1335  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1336  	case BT_ISO_BCAST_SINK_QOS:
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1337  		struct bt_iso_bcast_sink_qos sink_qos;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1338  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1339  		if (sk->sk_state != BT_OPEN && sk->sk_state != BT_BOUND &&
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1340  		    sk->sk_state != BT_CONNECT2) {
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1341  			err = -EINVAL;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1342  			break;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1343  		}
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1344  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1345  		len = min_t(unsigned int, sizeof(sink_qos), optlen);
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1346  		if (len != sizeof(sink_qos)) {
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1347  			err = -EINVAL;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1348  			break;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1349  		}
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1350  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1351  		memset(&sink_qos, 0, sizeof(sink_qos));
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1352  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1353  		if (copy_from_sockptr(&sink_qos, optval, len)) {
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1354  			err = -EFAULT;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1355  			break;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1356  		}
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1357  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1358  		if (!check_bcast_sink_qos(&sink_qos)) {
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1359  			err = -EINVAL;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1360  			break;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1361  		}
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1362  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1363  		iso_pi(sk)->sink_qos = sink_qos;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1364  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1365  		break;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1366  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1367  	case BT_ISO_BCAST_SOURCE_QOS:
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1368  		struct bt_iso_bcast_source_qos source_qos;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1369  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1370  		if (sk->sk_state != BT_OPEN && sk->sk_state != BT_BOUND &&
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1371  		    sk->sk_state != BT_CONNECT2) {
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1372  			err = -EINVAL;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1373  			break;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1374  		}
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1375  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1376  		len = min_t(unsigned int, sizeof(source_qos), optlen);
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1377  		if (len != sizeof(source_qos)) {
164dac9755ac297 Dan Carpenter          2022-07-27  1378  			err = -EINVAL;
164dac9755ac297 Dan Carpenter          2022-07-27  1379  			break;
164dac9755ac297 Dan Carpenter          2022-07-27  1380  		}
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1381  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1382  		memset(&source_qos, 0, sizeof(source_qos));
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1383  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1384  		if (copy_from_sockptr(&source_qos, optval, len)) {
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1385  			err = -EFAULT;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1386  			break;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1387  		}
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1388  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1389  		if (!check_bcast_source_qos(&source_qos)) {
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1390  			err = -EINVAL;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1391  			break;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1392  		}
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1393  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1394  		iso_pi(sk)->source_qos = source_qos;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1395  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1396  		break;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1397  
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1398  	case BT_ISO_BASE:
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1399  		if (sk->sk_state != BT_OPEN && sk->sk_state != BT_BOUND &&
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1400  		    sk->sk_state != BT_CONNECT2) {
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1401  			err = -EINVAL;
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1402  			break;
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1403  		}
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1404  
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1405  		if (optlen > sizeof(iso_pi(sk)->base)) {
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1406  			err = -EOVERFLOW;
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1407  			break;
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1408  		}
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1409  
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1410  		len = min_t(unsigned int, sizeof(iso_pi(sk)->base), optlen);
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1411  
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1412  		if (copy_from_sockptr(iso_pi(sk)->base, optval, len)) {
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1413  			err = -EFAULT;
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1414  			break;
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1415  		}
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1416  
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1417  		iso_pi(sk)->base_len = len;
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1418  
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1419  		break;
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1420  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1421  	default:
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1422  		err = -ENOPROTOOPT;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1423  		break;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1424  	}
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1425  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1426  	release_sock(sk);
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1427  	return err;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1428  }
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1429  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1430  static int iso_sock_getsockopt(struct socket *sock, int level, int optname,
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1431  			       char __user *optval, int __user *optlen)
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1432  {
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1433  	struct sock *sk = sock->sk;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1434  	int len, err = 0;
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1435  	u8 base_len;
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1436  	u8 *base;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1437  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1438  	BT_DBG("sk %p", sk);
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1439  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1440  	if (get_user(len, optlen))
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1441  		return -EFAULT;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1442  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1443  	lock_sock(sk);
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1444  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1445  	switch (optname) {
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1446  	case BT_DEFER_SETUP:
9dfe1727b21927c Luiz Augusto von Dentz 2022-08-03  1447  		if (sk->sk_state == BT_CONNECTED) {
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1448  			err = -EINVAL;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1449  			break;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1450  		}
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1451  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1452  		if (put_user(test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags),
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1453  			     (u32 __user *)optval))
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1454  			err = -EFAULT;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1455  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1456  		break;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1457  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1458  	case BT_ISO_UNICAST_QOS:
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1459  		struct bt_iso_unicast_qos *unicast_qos = iso_sock_get_unicast_qos(sk);
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1460  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1461  		len = min_t(unsigned int, len, sizeof(*unicast_qos));
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1462  		if (copy_to_user(optval, unicast_qos, len))
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1463  			err = -EFAULT;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1464  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1465  		break;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1466  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1467  	case BT_ISO_BCAST_SINK_QOS:
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1468  		struct bt_iso_bcast_sink_qos *sink_qos = iso_sock_get_bcast_sink_qos(sk);
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1469  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1470  		len = min_t(unsigned int, len, sizeof(*sink_qos));
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1471  		if (copy_to_user(optval, sink_qos, len))
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1472  			err = -EFAULT;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1473  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1474  		break;
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1475  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1476  	case BT_ISO_BCAST_SOURCE_QOS:
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1477  		struct bt_iso_bcast_source_qos *source_qos = iso_sock_get_bcast_source_qos(sk);
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1478  
656a3f84716d5b6 Iulia Tanasescu        2023-03-20 @1479  		len = min_t(unsigned int, len, sizeof(*source_qos));
656a3f84716d5b6 Iulia Tanasescu        2023-03-20  1480  		if (copy_to_user(optval, source_qos, len))
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1481  			err = -EFAULT;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1482  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1483  		break;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1484  
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1485  	case BT_ISO_BASE:
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1486  		if (sk->sk_state == BT_CONNECTED) {
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1487  			base_len = iso_pi(sk)->conn->hcon->le_per_adv_data_len;
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1488  			base = iso_pi(sk)->conn->hcon->le_per_adv_data;
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1489  		} else {
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1490  			base_len = iso_pi(sk)->base_len;
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1491  			base = iso_pi(sk)->base;
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1492  		}
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1493  
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1494  		len = min_t(unsigned int, len, base_len);
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1495  		if (copy_to_user(optval, base, len))
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1496  			err = -EFAULT;
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1497  
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1498  		break;
f764a6c2c1e446f Luiz Augusto von Dentz 2022-03-09  1499  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1500  	default:
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1501  		err = -ENOPROTOOPT;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1502  		break;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1503  	}
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1504  
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1505  	release_sock(sk);
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1506  	return err;
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1507  }
ccf74f2390d60a2 Luiz Augusto von Dentz 2020-01-16  1508  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
