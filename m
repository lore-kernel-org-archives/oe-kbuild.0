Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B19D37D
	for <oe-kbuild@lists.linux.dev>; Sat, 27 May 2023 02:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685154172; x=1716690172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PtvceMz2/wmWrBxf8Va1SV1SLBUE8/41a5cpmultjDw=;
  b=kq1or7JXu3G0wYVOLUX4OXoj4OWcf+TUxd2oRe9t7VAg+cvm2MRKVymF
   H4CWWatXY5AhGM6RFMQ+MIVM9FYILO1Kc0YbvjZ9kntXcKqKp87hjxDxw
   NRRJ9HkbimRf6nQvgzQYEeD5oaNeMAkUeGnKl+7eFlS7G6N0HVteHjr0Z
   fy1sHac1ieGBh2TxYkOJOtw18yfoOas7srQlGqtSlvL+24bxUDBDToITV
   1VGTDheCgQTI5x01WLSuDr1j8MjVZirZ3TYu2lS02M7XYKdaLWtS0vlEW
   qy9GiHNX5cBZBRS5Iac0tZqqRLxtwiffYSjd6Ok7yrd1YomwqSZApyZce
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="354364672"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="354364672"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 19:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="775271105"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="775271105"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 May 2023 19:22:49 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2jZx-000Jis-1D;
	Sat, 27 May 2023 02:22:49 +0000
Date: Sat, 27 May 2023 10:22:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [mkl-can-next:bcm 3/3] net/can/bcm.c:1327 bcm_sendmsg() warn:
 bitwise AND condition is false here
Message-ID: <202305271026.THIYEmYX-lkp@intel.com>
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
CC: linux-can@vger.kernel.org
TO: "Marc Kleine-Budde" <mkl@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git bcm
head:   78f1f58dba2bfcafe5affbedd074a0a84dea2dc6
commit: 78f1f58dba2bfcafe5affbedd074a0a84dea2dc6 [3/3] can: bcm: add support for MSG_CMSG_COMPAT
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021-20230525 (https://download.01.org/0day-ci/archive/20230527/202305271026.THIYEmYX-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305271026.THIYEmYX-lkp@intel.com/

New smatch warnings:
net/can/bcm.c:1327 bcm_sendmsg() warn: bitwise AND condition is false here
net/can/bcm.c:1719 bcm_recvmsg() warn: bitwise AND condition is false here

Old smatch warnings:
net/can/bcm.c:1205 bcm_rx_setup() warn: is 'op->frames' large enough for 'struct canfd_frame'? 0

vim +1327 net/can/bcm.c

ffd980f976e7fd Oliver Hartkopp   2007-11-16  1311  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1312  /*
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1313   * bcm_sendmsg - process BCM commands (opcodes) from the userspace
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1314   */
1b784140474e4f Ying Xue          2015-03-02  1315  static int bcm_sendmsg(struct socket *sock, struct msghdr *msg, size_t size)
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1316  {
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1317  	struct sock *sk = sock->sk;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1318  	struct bcm_sock *bo = bcm_sk(sk);
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1319  	int ifindex = bo->ifindex; /* default ifindex for this bcm_op */
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1320  	struct bcm_msg_head msg_head;
b3cfa83eaa4ae2 Marc Kleine-Budde 2023-05-18  1321  	int cfsiz, msg_head_size;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1322  	int ret; /* read bytes or error codes as return value */
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1323  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1324  	if (!bo->bound)
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1325  		return -ENOTCONN;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1326  
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18 @1327  	if (msg->msg_flags & MSG_CMSG_COMPAT) {
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1328  		struct bcm_msg_head_compat msg_head_compat;
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1329  
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1330  		msg_head_size = sizeof(msg_head_compat);
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1331  
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1332  		/* check for valid message length from userspace */
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1333  		if (size < msg_head_size)
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1334  			return -EINVAL;
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1335  
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1336  		/* read message head information */
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1337  		ret = memcpy_from_msg(&msg_head_compat, msg, msg_head_size);
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1338  		if (ret < 0)
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1339  			return ret;
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1340  
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1341  		msg_head.opcode = msg_head_compat.opcode;
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1342  		msg_head.flags = msg_head_compat.flags;
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1343  		msg_head.count = msg_head_compat.count;
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1344  		msg_head.ival1.tv_sec = msg_head_compat.ival1.tv_sec;
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1345  		msg_head.ival1.tv_usec = msg_head_compat.ival1.tv_usec;
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1346  		msg_head.ival2.tv_sec = msg_head_compat.ival2.tv_sec;
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1347  		msg_head.ival2.tv_usec = msg_head_compat.ival2.tv_usec;
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1348  		msg_head.can_id = msg_head_compat.can_id;
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1349  		msg_head.nframes = msg_head_compat.nframes;
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1350  	} else {
b3cfa83eaa4ae2 Marc Kleine-Budde 2023-05-18  1351  		msg_head_size = sizeof(msg_head);
b3cfa83eaa4ae2 Marc Kleine-Budde 2023-05-18  1352  
7f2d38eb7a42be Oliver Hartkopp   2008-07-05  1353  		/* check for valid message length from userspace */
b3cfa83eaa4ae2 Marc Kleine-Budde 2023-05-18  1354  		if (size < msg_head_size)
2b5f5f5dc11421 Oliver Hartkopp   2016-06-17  1355  			return -EINVAL;
2b5f5f5dc11421 Oliver Hartkopp   2016-06-17  1356  
2b5f5f5dc11421 Oliver Hartkopp   2016-06-17  1357  		/* read message head information */
b3cfa83eaa4ae2 Marc Kleine-Budde 2023-05-18  1358  		ret = memcpy_from_msg((u8 *)&msg_head, msg, msg_head_size);
2b5f5f5dc11421 Oliver Hartkopp   2016-06-17  1359  		if (ret < 0)
2b5f5f5dc11421 Oliver Hartkopp   2016-06-17  1360  			return ret;
78f1f58dba2bfc Marc Kleine-Budde 2023-05-18  1361  	}
2b5f5f5dc11421 Oliver Hartkopp   2016-06-17  1362  
6f3b911d5f29b9 Oliver Hartkopp   2016-06-17  1363  	cfsiz = CFSIZ(msg_head.flags);
b3cfa83eaa4ae2 Marc Kleine-Budde 2023-05-18  1364  	if ((size - msg_head_size) % cfsiz)
7f2d38eb7a42be Oliver Hartkopp   2008-07-05  1365  		return -EINVAL;
7f2d38eb7a42be Oliver Hartkopp   2008-07-05  1366  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1367  	/* check for alternative ifindex for this bcm_op */
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1368  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1369  	if (!ifindex && msg->msg_name) {
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1370  		/* no bound device as default => check msg_name */
342dfc306fb321 Steffen Hurrle    2014-01-17  1371  		DECLARE_SOCKADDR(struct sockaddr_can *, addr, msg->msg_name);
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1372  
9e9714742fb704 Oliver Hartkopp   2021-03-25  1373  		if (msg->msg_namelen < BCM_MIN_NAMELEN)
5e5073280379d3 Kurt Van Dijck    2011-01-15  1374  			return -EINVAL;
5e5073280379d3 Kurt Van Dijck    2011-01-15  1375  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1376  		if (addr->can_family != AF_CAN)
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1377  			return -EINVAL;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1378  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1379  		/* ifindex from sendto() */
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1380  		ifindex = addr->can_ifindex;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1381  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1382  		if (ifindex) {
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1383  			struct net_device *dev;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1384  
384317ef4187f5 Oliver Hartkopp   2017-04-25  1385  			dev = dev_get_by_index(sock_net(sk), ifindex);
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1386  			if (!dev)
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1387  				return -ENODEV;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1388  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1389  			if (dev->type != ARPHRD_CAN) {
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1390  				dev_put(dev);
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1391  				return -ENODEV;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1392  			}
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1393  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1394  			dev_put(dev);
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1395  		}
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1396  	}
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1397  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1398  	lock_sock(sk);
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1399  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1400  	switch (msg_head.opcode) {
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1401  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1402  	case TX_SETUP:
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1403  		ret = bcm_tx_setup(&msg_head, msg, ifindex, sk);
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1404  		break;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1405  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1406  	case RX_SETUP:
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1407  		ret = bcm_rx_setup(&msg_head, msg, ifindex, sk);
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1408  		break;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1409  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1410  	case TX_DELETE:
2b5f5f5dc11421 Oliver Hartkopp   2016-06-17  1411  		if (bcm_delete_tx_op(&bo->tx_ops, &msg_head, ifindex))
1194c6955f0c82 Marc Kleine-Budde 2023-05-18  1412  			ret = 0;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1413  		else
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1414  			ret = -EINVAL;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1415  		break;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1416  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1417  	case RX_DELETE:
2b5f5f5dc11421 Oliver Hartkopp   2016-06-17  1418  		if (bcm_delete_rx_op(&bo->rx_ops, &msg_head, ifindex))
1194c6955f0c82 Marc Kleine-Budde 2023-05-18  1419  			ret = 0;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1420  		else
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1421  			ret = -EINVAL;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1422  		break;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1423  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1424  	case TX_READ:
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1425  		/* reuse msg_head for the reply to TX_READ */
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1426  		msg_head.opcode  = TX_STATUS;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1427  		ret = bcm_read_op(&bo->tx_ops, &msg_head, ifindex);
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1428  		break;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1429  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1430  	case RX_READ:
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1431  		/* reuse msg_head for the reply to RX_READ */
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1432  		msg_head.opcode  = RX_STATUS;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1433  		ret = bcm_read_op(&bo->rx_ops, &msg_head, ifindex);
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1434  		break;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1435  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1436  	case TX_SEND:
72c8a89ad2e4de Oliver Hartkopp   2016-06-17  1437  		/* we need exactly one CAN frame behind the msg head */
b3cfa83eaa4ae2 Marc Kleine-Budde 2023-05-18  1438  		if ((msg_head.nframes != 1) || (size != cfsiz + msg_head_size))
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1439  			ret = -EINVAL;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1440  		else
6f3b911d5f29b9 Oliver Hartkopp   2016-06-17  1441  			ret = bcm_tx_send(msg, ifindex, sk, cfsiz);
b3cfa83eaa4ae2 Marc Kleine-Budde 2023-05-18  1442  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1443  		break;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1444  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1445  	default:
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1446  		ret = -EINVAL;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1447  		break;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1448  	}
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1449  
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1450  	release_sock(sk);
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1451  
1194c6955f0c82 Marc Kleine-Budde 2023-05-18  1452  	if (ret < 0)
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1453  		return ret;
1194c6955f0c82 Marc Kleine-Budde 2023-05-18  1454  
b3cfa83eaa4ae2 Marc Kleine-Budde 2023-05-18  1455  	return ret + msg_head_size;
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1456  }
ffd980f976e7fd Oliver Hartkopp   2007-11-16  1457  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
