Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B8810E6
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Feb 2023 03:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675396172; x=1706932172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h0O69a8kBJywusscSyM5PDicVxJpd5MyzOXafgmEfnk=;
  b=SmYN63CM9d98QXgB7L5izd3alhkoEWvJj+uZyqJGC9+Fs71uejUhw9/u
   vZvLUwveIgiEJz84ktoP0zEcUEbkJ5D3+TS7ZAmse32Dd8xWSoyGJz6Nw
   UldwprMXfswEhgs9VJJbw1rSOVyjzp9jigElk8h7eMF6jzcrUjExpsL77
   x8NvdRDT4ftpzlWCU8oQ/L7r6yl/Bfj2X8pZ57LQkhaW4t9b25YTjOKwA
   Oae0++6xs/Q09AUOXJlPvq6eEoa50pObh0sQ5lgMrU2Vq8RpXBzkeIef9
   4eZeqKk5g84JI7Ab/m4YfcZJiS89nWwu6b5JpDDoKeuu/9mpPzmRNGmRr
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="414858673"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="414858673"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 19:49:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="754320372"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="754320372"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2023 19:49:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNn4s-000040-2I;
	Fri, 03 Feb 2023 03:49:30 +0000
Date: Fri, 3 Feb 2023 11:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/l2tp/l2tp_core.c:1481 l2tp_tunnel_register() warn: missing error
 code 'ret'
Message-ID: <202302031144.yY6UaRcD-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Cong Wang <cong.wang@bytedance.com>
CC: Guillaume Nault <gnault@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66a87fff1a87c260452f5a57123891ca5258c449
commit: c4d48a58f32c5972174a1d01c33b296fe378cce0 l2tp: convert l2tp_tunnel_list to idr
date:   3 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 weeks ago
config: powerpc-randconfig-m031-20230202 (https://download.01.org/0day-ci/archive/20230203/202302031144.yY6UaRcD-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
net/l2tp/l2tp_core.c:1481 l2tp_tunnel_register() warn: missing error code 'ret'

vim +/ret +1481 net/l2tp/l2tp_core.c

6b9f34239b00e6 Guillaume Nault 2018-04-10  1455  
6b9f34239b00e6 Guillaume Nault 2018-04-10  1456  int l2tp_tunnel_register(struct l2tp_tunnel *tunnel, struct net *net,
6b9f34239b00e6 Guillaume Nault 2018-04-10  1457  			 struct l2tp_tunnel_cfg *cfg)
6b9f34239b00e6 Guillaume Nault 2018-04-10  1458  {
c4d48a58f32c59 Cong Wang       2023-01-13  1459  	struct l2tp_net *pn = l2tp_pernet(net);
c4d48a58f32c59 Cong Wang       2023-01-13  1460  	u32 tunnel_id = tunnel->tunnel_id;
6b9f34239b00e6 Guillaume Nault 2018-04-10  1461  	struct socket *sock;
6b9f34239b00e6 Guillaume Nault 2018-04-10  1462  	struct sock *sk;
6b9f34239b00e6 Guillaume Nault 2018-04-10  1463  	int ret;
6b9f34239b00e6 Guillaume Nault 2018-04-10  1464  
c4d48a58f32c59 Cong Wang       2023-01-13  1465  	spin_lock_bh(&pn->l2tp_tunnel_idr_lock);
c4d48a58f32c59 Cong Wang       2023-01-13  1466  	ret = idr_alloc_u32(&pn->l2tp_tunnel_idr, NULL, &tunnel_id, tunnel_id,
c4d48a58f32c59 Cong Wang       2023-01-13  1467  			    GFP_ATOMIC);
c4d48a58f32c59 Cong Wang       2023-01-13  1468  	spin_unlock_bh(&pn->l2tp_tunnel_idr_lock);
c4d48a58f32c59 Cong Wang       2023-01-13  1469  	if (ret)
c4d48a58f32c59 Cong Wang       2023-01-13  1470  		return ret == -ENOSPC ? -EEXIST : ret;
c4d48a58f32c59 Cong Wang       2023-01-13  1471  
6b9f34239b00e6 Guillaume Nault 2018-04-10  1472  	if (tunnel->fd < 0) {
6b9f34239b00e6 Guillaume Nault 2018-04-10  1473  		ret = l2tp_tunnel_sock_create(net, tunnel->tunnel_id,
6b9f34239b00e6 Guillaume Nault 2018-04-10  1474  					      tunnel->peer_tunnel_id, cfg,
6b9f34239b00e6 Guillaume Nault 2018-04-10  1475  					      &sock);
6b9f34239b00e6 Guillaume Nault 2018-04-10  1476  		if (ret < 0)
6b9f34239b00e6 Guillaume Nault 2018-04-10  1477  			goto err;
6b9f34239b00e6 Guillaume Nault 2018-04-10  1478  	} else {
6b9f34239b00e6 Guillaume Nault 2018-04-10  1479  		sock = sockfd_lookup(tunnel->fd, &ret);
6b9f34239b00e6 Guillaume Nault 2018-04-10  1480  		if (!sock)
6b9f34239b00e6 Guillaume Nault 2018-04-10 @1481  			goto err;
b68777d54fac21 Jakub Sitnicki  2022-11-14  1482  	}
b68777d54fac21 Jakub Sitnicki  2022-11-14  1483  
b68777d54fac21 Jakub Sitnicki  2022-11-14  1484  	sk = sock->sk;
af295e854a4e38 Jakub Sitnicki  2022-11-21  1485  	write_lock_bh(&sk->sk_callback_lock);
b68777d54fac21 Jakub Sitnicki  2022-11-14  1486  	ret = l2tp_validate_socket(sk, net, tunnel->encap);
6b9f34239b00e6 Guillaume Nault 2018-04-10  1487  	if (ret < 0)
af295e854a4e38 Jakub Sitnicki  2022-11-21  1488  		goto err_inval_sock;
af295e854a4e38 Jakub Sitnicki  2022-11-21  1489  	rcu_assign_sk_user_data(sk, tunnel);
af295e854a4e38 Jakub Sitnicki  2022-11-21  1490  	write_unlock_bh(&sk->sk_callback_lock);
6b9f34239b00e6 Guillaume Nault 2018-04-10  1491  
69e16d01d1de4f Gong, Sishuai   2021-04-27  1492  	sock_hold(sk);
69e16d01d1de4f Gong, Sishuai   2021-04-27  1493  	tunnel->sock = sk;
c4d48a58f32c59 Cong Wang       2023-01-13  1494  	tunnel->l2tp_net = net;
69e16d01d1de4f Gong, Sishuai   2021-04-27  1495  
c4d48a58f32c59 Cong Wang       2023-01-13  1496  	spin_lock_bh(&pn->l2tp_tunnel_idr_lock);
c4d48a58f32c59 Cong Wang       2023-01-13  1497  	idr_replace(&pn->l2tp_tunnel_idr, tunnel, tunnel->tunnel_id);
c4d48a58f32c59 Cong Wang       2023-01-13  1498  	spin_unlock_bh(&pn->l2tp_tunnel_idr_lock);
6b9f34239b00e6 Guillaume Nault 2018-04-10  1499  
6b9f34239b00e6 Guillaume Nault 2018-04-10  1500  	if (tunnel->encap == L2TP_ENCAPTYPE_UDP) {
6b9f34239b00e6 Guillaume Nault 2018-04-10  1501  		struct udp_tunnel_sock_cfg udp_cfg = {
6b9f34239b00e6 Guillaume Nault 2018-04-10  1502  			.sk_user_data = tunnel,
6b9f34239b00e6 Guillaume Nault 2018-04-10  1503  			.encap_type = UDP_ENCAP_L2TPINUDP,
6b9f34239b00e6 Guillaume Nault 2018-04-10  1504  			.encap_rcv = l2tp_udp_encap_recv,
6b9f34239b00e6 Guillaume Nault 2018-04-10  1505  			.encap_destroy = l2tp_udp_encap_destroy,
6b9f34239b00e6 Guillaume Nault 2018-04-10  1506  		};
6b9f34239b00e6 Guillaume Nault 2018-04-10  1507  
6b9f34239b00e6 Guillaume Nault 2018-04-10  1508  		setup_udp_tunnel_sock(net, sock, &udp_cfg);
6b9f34239b00e6 Guillaume Nault 2018-04-10  1509  	}
6b9f34239b00e6 Guillaume Nault 2018-04-10  1510  
6b9f34239b00e6 Guillaume Nault 2018-04-10  1511  	tunnel->old_sk_destruct = sk->sk_destruct;
6b9f34239b00e6 Guillaume Nault 2018-04-10  1512  	sk->sk_destruct = &l2tp_tunnel_destruct;
6b9f34239b00e6 Guillaume Nault 2018-04-10  1513  	lockdep_set_class_and_name(&sk->sk_lock.slock, &l2tp_socket_class,
6b9f34239b00e6 Guillaume Nault 2018-04-10  1514  				   "l2tp_sock");
6b9f34239b00e6 Guillaume Nault 2018-04-10  1515  	sk->sk_allocation = GFP_ATOMIC;
6b9f34239b00e6 Guillaume Nault 2018-04-10  1516  
6b7bdcd7ca01d8 Tom Parkin      2020-08-22  1517  	trace_register_tunnel(tunnel);
6b7bdcd7ca01d8 Tom Parkin      2020-08-22  1518  
6b9f34239b00e6 Guillaume Nault 2018-04-10  1519  	if (tunnel->fd >= 0)
6b9f34239b00e6 Guillaume Nault 2018-04-10  1520  		sockfd_put(sock);
6b9f34239b00e6 Guillaume Nault 2018-04-10  1521  
6b9f34239b00e6 Guillaume Nault 2018-04-10  1522  	return 0;
6b9f34239b00e6 Guillaume Nault 2018-04-10  1523  
af295e854a4e38 Jakub Sitnicki  2022-11-21  1524  err_inval_sock:
af295e854a4e38 Jakub Sitnicki  2022-11-21  1525  	write_unlock_bh(&sk->sk_callback_lock);
af295e854a4e38 Jakub Sitnicki  2022-11-21  1526  
f6cd651b056ffd Guillaume Nault 2018-04-10  1527  	if (tunnel->fd < 0)
f6cd651b056ffd Guillaume Nault 2018-04-10  1528  		sock_release(sock);
f6cd651b056ffd Guillaume Nault 2018-04-10  1529  	else
6b9f34239b00e6 Guillaume Nault 2018-04-10  1530  		sockfd_put(sock);
6b9f34239b00e6 Guillaume Nault 2018-04-10  1531  err:
c4d48a58f32c59 Cong Wang       2023-01-13  1532  	l2tp_tunnel_remove(net, tunnel);
6b9f34239b00e6 Guillaume Nault 2018-04-10  1533  	return ret;
6b9f34239b00e6 Guillaume Nault 2018-04-10  1534  }
6b9f34239b00e6 Guillaume Nault 2018-04-10  1535  EXPORT_SYMBOL_GPL(l2tp_tunnel_register);
6b9f34239b00e6 Guillaume Nault 2018-04-10  1536  

:::::: The code at line 1481 was first introduced by commit
:::::: 6b9f34239b00e6956a267abed2bc559ede556ad6 l2tp: fix races in tunnel creation

:::::: TO: Guillaume Nault <g.nault@alphalink.fr>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
