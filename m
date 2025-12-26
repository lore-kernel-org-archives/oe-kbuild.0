Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5688288C86
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766751082; cv=none; b=WNpBNyaxjALzlwryvQLagaSxOZ55B74w6uiKYyUcDSotlaZ+T5sFO6x4yZP+zuAFsNQ+54eEx4NdkayjeJhsIoC8tTpEjBdCYDUDMLXyhdp/hLgdPzqkR7UnF2hcuMXz6PtDRAE0a7cJuKC3k1h1WqGXOzlkW69fU8Gl5cNvaW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766751082; c=relaxed/simple;
	bh=nLyk9tVXNQAJelrz5FcdUx0x2Nw1PGDMs/ZRRYNK7fI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MZVbhrMj1taHS5S03L8KRmvBGCCUFj6J+LrdU6dyL15Ws2kaLsFZsBZ7Ynm1gqkzr80r1G1bWysIHB7tgzz66BQJ4v92fVpOr2+fKH2i3MTkSxOS0xnVyuRtqpY2UDJFyU0D3VanMs7OSKmc5hMx7cqXl2Di0vIp5Ez2qzASBms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlDzcs56; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlDzcs56"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766751080; x=1798287080;
  h=date:from:to:cc:subject:message-id;
  bh=nLyk9tVXNQAJelrz5FcdUx0x2Nw1PGDMs/ZRRYNK7fI=;
  b=DlDzcs56G4sTZGrAyDQxFu1OmbQw3BM/FptbBZreRcfcRknrcrkNVY1M
   SP85F3NfntNxk9uyfZHWVLfCR3hr3DNUT6rNzjnSFCqweRHtFjJwdotHP
   yHhFbAcYUGh6eeibjbVUAzck+Ke0CAMIleRRyir9N8lv3bNZZ8Oe2FPrp
   9Fn0fDF1kCm2FbYdH4iqHD0b6fDZmuWatc2BvRcLjHRyjfCf58e2vQNkU
   U00jGsr694XC3fwlaCTy0/J1hahc2MlxX5idnK4+ueu/l7u09TDsRUIx0
   BklGtbFyh2/VMnW7jwd+OcC7XC/SzEjlsDxCOY7yeQxBZJocJYUVAV+7N
   A==;
X-CSE-ConnectionGUID: ifiGhRUsTJujgLTi6x7nzA==
X-CSE-MsgGUID: pe9pIQCFQ4Gk5MIHWoIMEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68666371"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="68666371"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 04:11:19 -0800
X-CSE-ConnectionGUID: LD0AO1w9SpSqIS0/xE3mBA==
X-CSE-MsgGUID: XYAXBaLjStmqXWQkEW942Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="204514792"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Dec 2025 04:11:18 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ6f5-0000000051P-29WO;
	Fri, 26 Dec 2025 12:11:15 +0000
Date: Fri, 26 Dec 2025 20:11:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [selinuxproject-selinux:pr/77 2/2] net/rds/connection.c:258
 __rds_conn_create() error: double free of 'conn->c_path' (line 257)
Message-ID: <202512262015.x4szvwi9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "pr-hung" <bkedx0000@gmail.com>

tree:   https://github.com/SELinuxProject/selinux-kernel pr/77
head:   0e5359f86c799b98c5df0807be314821cc662040
commit: 0e5359f86c799b98c5df0807be314821cc662040 [2/2] Fix potential vulnerability in cloned code (net/rds/connection.c)
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: xtensa-randconfig-r073-20251226 (https://download.01.org/0day-ci/archive/20251226/202512262015.x4szvwi9-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512262015.x4szvwi9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512262015.x4szvwi9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[1]: *** [Makefile:248: __sub-make] Error 2
>> make[1]: Target '__all' not remade because of errors.
--
>> make[2]: *** [Makefile:1242: vmlinux] Error 2
>> make[2]: Target '__all' not remade because of errors.
--
>> Documentation/.renames.txt: warning: ignored by one of the .gitignore files
--
>> make[3]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
>> make[3]: Target '__default' not remade because of errors.
--
>> Warning: drivers/leds/leds-lm3692x.c:119 struct member 'boost_ctrl' not described in 'lm3692x_led'
>> Warning: drivers/leds/leds-lm3692x.c:119 struct member 'brightness_ctrl' not described in 'lm3692x_led'
>> Warning: drivers/leds/leds-lm3692x.c:119 struct member 'enabled' not described in 'lm3692x_led'
--
>> Warning: net/ipv4/tcp_lp.c:121 function parameter 'ack' not described in 'tcp_lp_cong_avoid'
>> Warning: net/ipv4/tcp_lp.c:121 function parameter 'acked' not described in 'tcp_lp_cong_avoid'
>> Warning: net/ipv4/tcp_lp.c:271 function parameter 'sample' not described in 'tcp_lp_pkts_acked'
--
>> Warning: block/partitions/aix.c:80 function parameter 'state' not described in 'read_lba'
>> Warning: block/partitions/aix.c:80 function parameter 'lba' not described in 'read_lba'
>> Warning: block/partitions/aix.c:80 function parameter 'buffer' not described in 'read_lba'
>> Warning: block/partitions/aix.c:80 function parameter 'count' not described in 'read_lba'
>> Warning: block/partitions/aix.c:113 function parameter 'state' not described in 'alloc_pvd'
>> Warning: block/partitions/aix.c:113 function parameter 'lba' not described in 'alloc_pvd'
>> Warning: block/partitions/aix.c:138 function parameter 'state' not described in 'alloc_lvn'
>> Warning: block/partitions/aix.c:138 function parameter 'lba' not described in 'alloc_lvn'
--
>> Warning: drivers/virtio/virtio_ring.c:3174 function parameter 'vaddr' not described in 'virtqueue_map_free_coherent'
--
>> Warning: drivers/tty/n_hdlc.c:139 struct member 'write_work' not described in 'n_hdlc'
>> Warning: drivers/tty/n_hdlc.c:139 struct member 'tty_for_write_work' not described in 'n_hdlc'
--
>> Warning: drivers/tty/n_gsm.c:4175 function parameter 'dlci' not described in 'gsm_modem_send_initial_msc'
--
>> drivers/char/applicom.c: In function 'ac_register_board':
>> drivers/char/applicom.c:130:32: warning: variable 'byte_reset_it' set but not used [-Wunused-but-set-variable]
>>   130 |         volatile unsigned char byte_reset_it;
>>       |                                ^~~~~~~~~~~~~
>> drivers/char/applicom.c: In function 'ac_read':
>> drivers/char/applicom.c:542:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
>>   542 |         int ret = 0;
>>       |             ^~~
>> drivers/char/applicom.c: In function 'ac_ioctl':
>> drivers/char/applicom.c:705:32: warning: variable 'byte_reset_it' set but not used [-Wunused-but-set-variable]
>>   705 |         volatile unsigned char byte_reset_it;
>>       |                                ^~~~~~~~~~~~~
..

New smatch warnings:
net/rds/connection.c:258 __rds_conn_create() error: double free of 'conn->c_path' (line 257)

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting
net/rds/connection.c:517 rds_conn_destroy() warn: mixing irq and irqsave

vim +258 net/rds/connection.c

1c5113cf796bb7 Sowmini Varadhan  2016-06-13  152  
00e0f34c616603 Andy Grover       2009-02-24  153  /*
00e0f34c616603 Andy Grover       2009-02-24  154   * There is only every one 'conn' for a given pair of addresses in the
00e0f34c616603 Andy Grover       2009-02-24  155   * system at a time.  They contain messages to be retransmitted and so
00e0f34c616603 Andy Grover       2009-02-24  156   * span the lifetime of the actual underlying transport connections.
00e0f34c616603 Andy Grover       2009-02-24  157   *
00e0f34c616603 Andy Grover       2009-02-24  158   * For now they are not garbage collected once they're created.  They
00e0f34c616603 Andy Grover       2009-02-24  159   * are torn down as the module is removed, if ever.
00e0f34c616603 Andy Grover       2009-02-24  160   */
d5a8ac28a7ff2f Sowmini Varadhan  2015-08-05  161  static struct rds_connection *__rds_conn_create(struct net *net,
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  162  						const struct in6_addr *laddr,
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  163  						const struct in6_addr *faddr,
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  164  						struct rds_transport *trans,
3eb450367d0823 Santosh Shilimkar 2018-10-23  165  						gfp_t gfp, u8 tos,
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  166  						int is_outgoing,
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  167  						int dev_if)
00e0f34c616603 Andy Grover       2009-02-24  168  {
cb24405e67e56c Andy Grover       2009-07-17  169  	struct rds_connection *conn, *parent = NULL;
00e0f34c616603 Andy Grover       2009-02-24  170  	struct hlist_head *head = rds_conn_bucket(laddr, faddr);
5adb5bc65f93e5 Zach Brown        2010-07-23  171  	struct rds_transport *loop_trans;
00e0f34c616603 Andy Grover       2009-02-24  172  	unsigned long flags;
5916e2c1554f3e Sowmini Varadhan  2016-07-14  173  	int ret, i;
840df162b3eb3e Sowmini Varadhan  2017-08-02  174  	int npaths = (trans->t_mp_capable ? RDS_MPATH_WORKERS : 1);
00e0f34c616603 Andy Grover       2009-02-24  175  
bcf50ef2ce3c5d Chris Mason       2010-05-11  176  	rcu_read_lock();
3eb450367d0823 Santosh Shilimkar 2018-10-23  177  	conn = rds_conn_lookup(net, head, laddr, faddr, trans, tos, dev_if);
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  178  	if (conn &&
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  179  	    conn->c_loopback &&
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  180  	    conn->c_trans != &rds_loop_transport &&
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  181  	    ipv6_addr_equal(laddr, faddr) &&
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  182  	    !is_outgoing) {
00e0f34c616603 Andy Grover       2009-02-24  183  		/* This is a looped back IB connection, and we're
00e0f34c616603 Andy Grover       2009-02-24  184  		 * called by the code handling the incoming connect.
00e0f34c616603 Andy Grover       2009-02-24  185  		 * We need a second connection object into which we
00e0f34c616603 Andy Grover       2009-02-24  186  		 * can stick the other QP. */
00e0f34c616603 Andy Grover       2009-02-24  187  		parent = conn;
00e0f34c616603 Andy Grover       2009-02-24  188  		conn = parent->c_passive;
00e0f34c616603 Andy Grover       2009-02-24  189  	}
bcf50ef2ce3c5d Chris Mason       2010-05-11  190  	rcu_read_unlock();
00e0f34c616603 Andy Grover       2009-02-24  191  	if (conn)
00e0f34c616603 Andy Grover       2009-02-24  192  		goto out;
00e0f34c616603 Andy Grover       2009-02-24  193  
05a178ecdc7396 Wei Yongjun       2009-04-09  194  	conn = kmem_cache_zalloc(rds_conn_slab, gfp);
8690bfa17aea4c Andy Grover       2010-01-12  195  	if (!conn) {
00e0f34c616603 Andy Grover       2009-02-24  196  		conn = ERR_PTR(-ENOMEM);
00e0f34c616603 Andy Grover       2009-02-24  197  		goto out;
00e0f34c616603 Andy Grover       2009-02-24  198  	}
840df162b3eb3e Sowmini Varadhan  2017-08-02  199  	conn->c_path = kcalloc(npaths, sizeof(struct rds_conn_path), gfp);
840df162b3eb3e Sowmini Varadhan  2017-08-02  200  	if (!conn->c_path) {
840df162b3eb3e Sowmini Varadhan  2017-08-02  201  		kmem_cache_free(rds_conn_slab, conn);
840df162b3eb3e Sowmini Varadhan  2017-08-02  202  		conn = ERR_PTR(-ENOMEM);
840df162b3eb3e Sowmini Varadhan  2017-08-02  203  		goto out;
840df162b3eb3e Sowmini Varadhan  2017-08-02  204  	}
00e0f34c616603 Andy Grover       2009-02-24  205  
00e0f34c616603 Andy Grover       2009-02-24  206  	INIT_HLIST_NODE(&conn->c_hash_node);
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  207  	conn->c_laddr = *laddr;
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  208  	conn->c_isv6 = !ipv6_addr_v4mapped(laddr);
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  209  	conn->c_faddr = *faddr;
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  210  	conn->c_dev_if = dev_if;
3eb450367d0823 Santosh Shilimkar 2018-10-23  211  	conn->c_tos = tos;
e65d4d96334e3f Ka-Cheong Poon    2018-07-30  212  
e65d4d96334e3f Ka-Cheong Poon    2018-07-30  213  #if IS_ENABLED(CONFIG_IPV6)
1e2b44e78eead7 Ka-Cheong Poon    2018-07-23  214  	/* If the local address is link local, set c_bound_if to be the
1e2b44e78eead7 Ka-Cheong Poon    2018-07-23  215  	 * index used for this connection.  Otherwise, set it to 0 as
1e2b44e78eead7 Ka-Cheong Poon    2018-07-23  216  	 * the socket is not bound to an interface.  c_bound_if is used
1e2b44e78eead7 Ka-Cheong Poon    2018-07-23  217  	 * to look up a socket when a packet is received
1e2b44e78eead7 Ka-Cheong Poon    2018-07-23  218  	 */
1e2b44e78eead7 Ka-Cheong Poon    2018-07-23  219  	if (ipv6_addr_type(laddr) & IPV6_ADDR_LINKLOCAL)
1e2b44e78eead7 Ka-Cheong Poon    2018-07-23  220  		conn->c_bound_if = dev_if;
1e2b44e78eead7 Ka-Cheong Poon    2018-07-23  221  	else
e65d4d96334e3f Ka-Cheong Poon    2018-07-30  222  #endif
1e2b44e78eead7 Ka-Cheong Poon    2018-07-23  223  		conn->c_bound_if = 0;
00e0f34c616603 Andy Grover       2009-02-24  224  
1c5113cf796bb7 Sowmini Varadhan  2016-06-13  225  	rds_conn_net_set(conn, net);
00e0f34c616603 Andy Grover       2009-02-24  226  
00e0f34c616603 Andy Grover       2009-02-24  227  	ret = rds_cong_get_maps(conn);
00e0f34c616603 Andy Grover       2009-02-24  228  	if (ret) {
840df162b3eb3e Sowmini Varadhan  2017-08-02  229  		kfree(conn->c_path);
00e0f34c616603 Andy Grover       2009-02-24  230  		kmem_cache_free(rds_conn_slab, conn);
00e0f34c616603 Andy Grover       2009-02-24  231  		conn = ERR_PTR(ret);
00e0f34c616603 Andy Grover       2009-02-24  232  		goto out;
00e0f34c616603 Andy Grover       2009-02-24  233  	}
00e0f34c616603 Andy Grover       2009-02-24  234  
00e0f34c616603 Andy Grover       2009-02-24  235  	/*
00e0f34c616603 Andy Grover       2009-02-24  236  	 * This is where a connection becomes loopback.  If *any* RDS sockets
00e0f34c616603 Andy Grover       2009-02-24  237  	 * can bind to the destination address then we'd rather the messages
00e0f34c616603 Andy Grover       2009-02-24  238  	 * flow through loopback rather than either transport.
00e0f34c616603 Andy Grover       2009-02-24  239  	 */
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  240  	loop_trans = rds_trans_get_preferred(net, faddr, conn->c_dev_if);
5adb5bc65f93e5 Zach Brown        2010-07-23  241  	if (loop_trans) {
5adb5bc65f93e5 Zach Brown        2010-07-23  242  		rds_trans_put(loop_trans);
00e0f34c616603 Andy Grover       2009-02-24  243  		conn->c_loopback = 1;
aced3ce57cd37b Rao Shoaib        2021-05-21  244  		if (trans->t_prefer_loopback) {
aced3ce57cd37b Rao Shoaib        2021-05-21  245  			if (likely(is_outgoing)) {
aced3ce57cd37b Rao Shoaib        2021-05-21  246  				/* "outgoing" connection to local address.
aced3ce57cd37b Rao Shoaib        2021-05-21  247  				 * Protocol says it wants the connection
aced3ce57cd37b Rao Shoaib        2021-05-21  248  				 * handled by the loopback transport.
aced3ce57cd37b Rao Shoaib        2021-05-21  249  				 * This is what TCP does.
00e0f34c616603 Andy Grover       2009-02-24  250  				 */
00e0f34c616603 Andy Grover       2009-02-24  251  				trans = &rds_loop_transport;
aced3ce57cd37b Rao Shoaib        2021-05-21  252  			} else {
aced3ce57cd37b Rao Shoaib        2021-05-21  253  				/* No transport currently in use
aced3ce57cd37b Rao Shoaib        2021-05-21  254  				 * should end up here, but if it
aced3ce57cd37b Rao Shoaib        2021-05-21  255  				 * does, reset/destroy the connection.
aced3ce57cd37b Rao Shoaib        2021-05-21  256  				 */
5f9562ebe710c3 Hangyu Hua        2021-12-14 @257  				kfree(conn->c_path);
0e5359f86c799b pr-hung           2025-12-26 @258  				kfree(conn->c_path);
aced3ce57cd37b Rao Shoaib        2021-05-21  259  				kmem_cache_free(rds_conn_slab, conn);
aced3ce57cd37b Rao Shoaib        2021-05-21  260  				conn = ERR_PTR(-EOPNOTSUPP);
aced3ce57cd37b Rao Shoaib        2021-05-21  261  				goto out;
aced3ce57cd37b Rao Shoaib        2021-05-21  262  			}
00e0f34c616603 Andy Grover       2009-02-24  263  		}
00e0f34c616603 Andy Grover       2009-02-24  264  	}
00e0f34c616603 Andy Grover       2009-02-24  265  
00e0f34c616603 Andy Grover       2009-02-24  266  	conn->c_trans = trans;
00e0f34c616603 Andy Grover       2009-02-24  267  
5916e2c1554f3e Sowmini Varadhan  2016-07-14  268  	init_waitqueue_head(&conn->c_hs_waitq);
840df162b3eb3e Sowmini Varadhan  2017-08-02  269  	for (i = 0; i < npaths; i++) {
5916e2c1554f3e Sowmini Varadhan  2016-07-14  270  		__rds_conn_path_init(conn, &conn->c_path[i],
5916e2c1554f3e Sowmini Varadhan  2016-07-14  271  				     is_outgoing);
5916e2c1554f3e Sowmini Varadhan  2016-07-14  272  		conn->c_path[i].cp_index = i;
5916e2c1554f3e Sowmini Varadhan  2016-07-14  273  	}
ebeeb1ad9b8adc Sowmini Varadhan  2018-02-03  274  	rcu_read_lock();
ebeeb1ad9b8adc Sowmini Varadhan  2018-02-03  275  	if (rds_destroy_pending(conn))
ebeeb1ad9b8adc Sowmini Varadhan  2018-02-03  276  		ret = -ENETDOWN;
ebeeb1ad9b8adc Sowmini Varadhan  2018-02-03  277  	else
d4014d8cc6dfa9 Sowmini Varadhan  2018-02-13  278  		ret = trans->conn_alloc(conn, GFP_ATOMIC);
00e0f34c616603 Andy Grover       2009-02-24  279  	if (ret) {
ebeeb1ad9b8adc Sowmini Varadhan  2018-02-03  280  		rcu_read_unlock();
840df162b3eb3e Sowmini Varadhan  2017-08-02  281  		kfree(conn->c_path);
00e0f34c616603 Andy Grover       2009-02-24  282  		kmem_cache_free(rds_conn_slab, conn);
00e0f34c616603 Andy Grover       2009-02-24  283  		conn = ERR_PTR(ret);
00e0f34c616603 Andy Grover       2009-02-24  284  		goto out;
00e0f34c616603 Andy Grover       2009-02-24  285  	}
00e0f34c616603 Andy Grover       2009-02-24  286  
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  287  	rdsdebug("allocated conn %p for %pI6c -> %pI6c over %s %s\n",
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  288  		 conn, laddr, faddr,
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  289  		 strnlen(trans->t_name, sizeof(trans->t_name)) ?
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  290  		 trans->t_name : "[unknown]", is_outgoing ? "(outgoing)" : "");
00e0f34c616603 Andy Grover       2009-02-24  291  
cb24405e67e56c Andy Grover       2009-07-17  292  	/*
cb24405e67e56c Andy Grover       2009-07-17  293  	 * Since we ran without holding the conn lock, someone could
cb24405e67e56c Andy Grover       2009-07-17  294  	 * have created the same conn (either normal or passive) in the
cb24405e67e56c Andy Grover       2009-07-17  295  	 * interim. We check while holding the lock. If we won, we complete
cb24405e67e56c Andy Grover       2009-07-17  296  	 * init and return our conn. If we lost, we rollback and return the
cb24405e67e56c Andy Grover       2009-07-17  297  	 * other one.
cb24405e67e56c Andy Grover       2009-07-17  298  	 */
00e0f34c616603 Andy Grover       2009-02-24  299  	spin_lock_irqsave(&rds_conn_lock, flags);
cb24405e67e56c Andy Grover       2009-07-17  300  	if (parent) {
cb24405e67e56c Andy Grover       2009-07-17  301  		/* Creating passive conn */
cb24405e67e56c Andy Grover       2009-07-17  302  		if (parent->c_passive) {
1c5113cf796bb7 Sowmini Varadhan  2016-06-13  303  			trans->conn_free(conn->c_path[0].cp_transport_data);
840df162b3eb3e Sowmini Varadhan  2017-08-02  304  			kfree(conn->c_path);
cb24405e67e56c Andy Grover       2009-07-17  305  			kmem_cache_free(rds_conn_slab, conn);
cb24405e67e56c Andy Grover       2009-07-17  306  			conn = parent->c_passive;
00e0f34c616603 Andy Grover       2009-02-24  307  		} else {
00e0f34c616603 Andy Grover       2009-02-24  308  			parent->c_passive = conn;
cb24405e67e56c Andy Grover       2009-07-17  309  			rds_cong_add_conn(conn);
cb24405e67e56c Andy Grover       2009-07-17  310  			rds_conn_count++;
00e0f34c616603 Andy Grover       2009-02-24  311  		}
cb24405e67e56c Andy Grover       2009-07-17  312  	} else {
cb24405e67e56c Andy Grover       2009-07-17  313  		/* Creating normal conn */
cb24405e67e56c Andy Grover       2009-07-17  314  		struct rds_connection *found;
00e0f34c616603 Andy Grover       2009-02-24  315  
eee2fa6ab32251 Ka-Cheong Poon    2018-07-23  316  		found = rds_conn_lookup(net, head, laddr, faddr, trans,
3eb450367d0823 Santosh Shilimkar 2018-10-23  317  					tos, dev_if);
cb24405e67e56c Andy Grover       2009-07-17  318  		if (found) {
1c5113cf796bb7 Sowmini Varadhan  2016-06-13  319  			struct rds_conn_path *cp;
1c5113cf796bb7 Sowmini Varadhan  2016-06-13  320  			int i;
1c5113cf796bb7 Sowmini Varadhan  2016-06-13  321  
840df162b3eb3e Sowmini Varadhan  2017-08-02  322  			for (i = 0; i < npaths; i++) {
1c5113cf796bb7 Sowmini Varadhan  2016-06-13  323  				cp = &conn->c_path[i];
02105b2ccdd634 Sowmini Varadhan  2016-06-30  324  				/* The ->conn_alloc invocation may have
02105b2ccdd634 Sowmini Varadhan  2016-06-30  325  				 * allocated resource for all paths, so all
02105b2ccdd634 Sowmini Varadhan  2016-06-30  326  				 * of them may have to be freed here.
02105b2ccdd634 Sowmini Varadhan  2016-06-30  327  				 */
02105b2ccdd634 Sowmini Varadhan  2016-06-30  328  				if (cp->cp_transport_data)
1c5113cf796bb7 Sowmini Varadhan  2016-06-13  329  					trans->conn_free(cp->cp_transport_data);
1c5113cf796bb7 Sowmini Varadhan  2016-06-13  330  			}
840df162b3eb3e Sowmini Varadhan  2017-08-02  331  			kfree(conn->c_path);
00e0f34c616603 Andy Grover       2009-02-24  332  			kmem_cache_free(rds_conn_slab, conn);
cb24405e67e56c Andy Grover       2009-07-17  333  			conn = found;
00e0f34c616603 Andy Grover       2009-02-24  334  		} else {
905dd4184e0732 Sowmini Varadhan  2016-11-16  335  			conn->c_my_gen_num = rds_gen_num;
905dd4184e0732 Sowmini Varadhan  2016-11-16  336  			conn->c_peer_gen_num = 0;
bcf50ef2ce3c5d Chris Mason       2010-05-11  337  			hlist_add_head_rcu(&conn->c_hash_node, head);
00e0f34c616603 Andy Grover       2009-02-24  338  			rds_cong_add_conn(conn);
00e0f34c616603 Andy Grover       2009-02-24  339  			rds_conn_count++;
00e0f34c616603 Andy Grover       2009-02-24  340  		}
cb24405e67e56c Andy Grover       2009-07-17  341  	}
00e0f34c616603 Andy Grover       2009-02-24  342  	spin_unlock_irqrestore(&rds_conn_lock, flags);
ebeeb1ad9b8adc Sowmini Varadhan  2018-02-03  343  	rcu_read_unlock();
00e0f34c616603 Andy Grover       2009-02-24  344  
00e0f34c616603 Andy Grover       2009-02-24  345  out:
00e0f34c616603 Andy Grover       2009-02-24  346  	return conn;
00e0f34c616603 Andy Grover       2009-02-24  347  }
00e0f34c616603 Andy Grover       2009-02-24  348  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
