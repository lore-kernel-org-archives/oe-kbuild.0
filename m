Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659F43148A1
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 13:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766755496; cv=none; b=JTQdoD9hnJEdzkMPGjrbrrOFicmwjuP0GoOfYVDqLLNdneXESuvE9qoZECsO7f1jxhK8zTnVSmQiWJMLZT6j6pmVpw+4OQgWvW2Ywf0bH4IV9UATrUUGEt3Cnt/GOJA9AGXyLtYcWwcYHrAPUB/kfB4KGa1Rw6lkL8Z1bw6Bg6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766755496; c=relaxed/simple;
	bh=ZAUTR9XvRbgOZzDivvbGVTpi5PqKG1BHwlGlDrgD4/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rRqt8epABWIjFWBDW/2b4TAV2BcSs/DAf7Hb1/Ltt4dxr+AnUspPzvJXgTaJY4S8+jqB8Xm65mTyUvVqBpwXiBK50vJCounyUw1yMCfu3sBbnZKUBy/jXh0dx0UmvMLHWLgf+jwsE2BuPZsAchr42T70ryxb4vk5jt0q2U5vD1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uqtr5wxN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uqtr5wxN"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so3624794f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 05:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766755492; x=1767360292; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F87IS3iylQokVU+2pjsDepRitThtv2zuDVe3yXzYQwI=;
        b=uqtr5wxN2KgPpRRWQeOThHboFtGoFzy0ivB7ksPGKyDCLUYSUa5B7wjUGLizUj2bYX
         7fsu2zzTWJnTmpfa0lRNYkv+WJhEI1o/NzwW6FDJ7z67VdduX5u1+B4Ysxk/lAe0WMG2
         OgOvN3+B0VuIYjeBmVcC26Tr2id9lLD57i9rEpkpy2Q6haEaL9+Lg2LrfFq21X3gojh5
         XugwsbC2TR3aEQVm5dHLsENqG2BAojUFCB1CTvW20d4KjGfIucGV+UDQ4dthACFUJ0Dw
         TBUf5Pq1vVWnRsaI5G2/qfrf6cmUdEggKdkor0zA2Vp3JtdLNORkSLJim5zl906e3B0N
         8EPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766755492; x=1767360292;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F87IS3iylQokVU+2pjsDepRitThtv2zuDVe3yXzYQwI=;
        b=u5DcoImNekiP3rKxyAhyolVTEx+0A1jKneE1Fok8mXyi9bAqM7iKpvDPL5SFtZsIxk
         FXv/HTCipYW9pWO7ErhS8d6cSVR/xNd+2kLFhNZ0PbbLya3IWfyCo4w0aMYGc7ct1RKd
         MynhxPfPKna9KBsgPduxsdHsEp4RBfUAVZwUohnMjDl2HjTFHKv6aygEVznZfi1EHO/C
         R351onz52+6p4uNNDMf1EhN6xWeKCVw123lt+PE7p8yOV0sYlshk6rVrf9/AcecFvJQJ
         QYP9yj7uhJfD2CGe4Kwu7PGOkNSJnpAKhics681UKyguzs0BjbT5I41uT4lGSuafv4Gk
         TAxg==
X-Gm-Message-State: AOJu0YxwNG8snqJngaJIx8QT1tlBXz9CuZ268X9x196Zw6ebzyR8DCd/
	TRY+SvF9x1/h/LrLLLxTYhFIlKiEbG2HaBqNlKKnycA21OCAnSJInYUu3Zre1lb6hDsN8wTZ6wb
	VTlwj
X-Gm-Gg: AY/fxX5yKymkPAFKfB8TQ9Jx1e/lVYlPua3MnmNRTBk7+yO5Hmt5Ipd5Z0MEV9APWws
	b/C+nuvguE9X0IAt7bZn2jmpUedeGauObhMHtYZVm1KTdg/zfxVnxWJVVtI1jmYolnt0SAynHBN
	8pX9c6+YWXpppu1uzZ6x7ZA0I/X2E0sijwK8j5keVSDf+oZeAd9Vsjdxwj5gjtQsXI7+Y3NdC7a
	VicxPCk0uzMb90EyCq0u21q/YHDcXZRH4VJUMmaMhkI6IPYEYcOoGSWxJoi8mpV4QG8FOeSee98
	aXMDJTIOiCCOJc+XUjiKWStcNA7gX4kgQe7izwi0oH5HRQ8m9cPmXNaPzVuqRwBJ8c1M19wI22+
	rXW3y5oTrSCq/5a7RJyUTe9PzxrjpEYjlYbgaWOeZcGrBN80rMG1rsS+q1882IdFagUw1gE8WN2
	ESZW6iUUUnydNxL7fL
X-Google-Smtp-Source: AGHT+IG/GAUONLgFmj9qBtdgXwFmwb2W9cDiTV6era8/LAkBXKJpxz5M2fXHxdnBsjVNoYo3lhUYaA==
X-Received: by 2002:a5d:64e7:0:b0:430:f463:b6ae with SMTP id ffacd0b85a97d-4324e50c890mr30733909f8f.53.1766755492318;
        Fri, 26 Dec 2025 05:24:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43264613923sm29833103f8f.26.2025.12.26.05.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 05:24:51 -0800 (PST)
Date: Fri, 26 Dec 2025 16:24:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, pr-hung <bkedx0000@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [selinuxproject-selinux:pr/77 2/2] net/rds/connection.c:258
 __rds_conn_create() error: double free of 'conn->c_path' (line 257)
Message-ID: <202512262015.x4szvwi9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251226132449.2q1fyc24GG4bb-pO-8UmZ9Qdq91c_8ouUS-o_TANYYA@z>

tree:   https://github.com/SELinuxProject/selinux-kernel pr/77
head:   0e5359f86c799b98c5df0807be314821cc662040
commit: 0e5359f86c799b98c5df0807be314821cc662040 [2/2] Fix potential vulnerability in cloned code (net/rds/connection.c)
config: xtensa-randconfig-r073-20251226 (https://download.01.org/0day-ci/archive/20251226/202512262015.x4szvwi9-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512262015.x4szvwi9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
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
net/rds/connection.c:517 rds_conn_destroy() warn: mixing irq and irqsave

vim +258 net/rds/connection.c

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

Double free.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

