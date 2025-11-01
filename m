Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF65228689F
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Nov 2025 09:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761988892; cv=none; b=s0obcL6p5W8kZwMYH96ssT7rQqgzRL1h8qAWIndcb1FjzDwZqYuqMQIyfscgJQQSXa4K+6YTB6D9BuOja68ePMh+ifFq6uzIK3s/NnknJFNoIBRd7KatHO3Yw5Rr8pwVjxTVMD5yqfL1mNWRuyf1TR/rdo0JIDtN9ZQvHS38fJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761988892; c=relaxed/simple;
	bh=zIJokIZ9UZ5DO/0eONZKLnIZp6ZCzWjtAzEw2kRwAZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ck6HYEN3CyoNVzYTRVRqGomBqKMz1WPxXoeZf6fDHN+GCdyonMr8ER9siLa7BcBV15ZSpgg6uQcqiuZOxKkmzOVGbmRqa7kvqWRowCyJDC0j3210eIZrl0aDY5PUjpYL66DvdRV+UZFE02/xBmAN77UbfL+SZ+nGkH3IXOVPlUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJrKQjHb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJrKQjHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761988890; x=1793524890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zIJokIZ9UZ5DO/0eONZKLnIZp6ZCzWjtAzEw2kRwAZQ=;
  b=mJrKQjHbxb4Bvdw9PZPoIpLlsQSGSvSQxWenPCX1Y0SWW/T+pqgHphdi
   uwziVQSVdkA0huE7qa8NLGXQ3jQZoJWYNj12N3iKh8JO9yfWNS0zADMO5
   5EPoDrj7Ui06xttYY1+x3Wa0zHBU0I1R7x1Cdx4mhY6dPB6ejYxma1vD0
   8EnIMie00HTAHglXOrk12k5T4/Kktz/9ui5N5tD/wiDp4RGDmUnhi94rJ
   2Om6dp0Uf0u6K6SyqG6vfsud8/lfP7o3pqilLCOyeqs+QltJaCFbVSwc2
   fOgEr9DB6Jp4cXW+8JUpTVFkNbtkqFUmwuyzvN7uSwPXfk1SmCTx/MaIL
   w==;
X-CSE-ConnectionGUID: JXJh6p1gSQWu5g4v2WW5dg==
X-CSE-MsgGUID: sucH45+cRj+DU6s2CLv5kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75590020"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="75590020"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 02:21:30 -0700
X-CSE-ConnectionGUID: yhWqZpbQTTyVAWPzY1zzLQ==
X-CSE-MsgGUID: qbG/y03dSee1tTEPgwfk4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="186884301"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Nov 2025 02:21:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF7nJ-000O4j-0L;
	Sat, 01 Nov 2025 09:21:09 +0000
Date: Sat, 1 Nov 2025 17:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vireshk:virtio/msg-xen 9/17] net/vmw_vsock/af_vsock.c:2164
 vsock_connectible_sendmsg() warn: passing a valid pointer to 'PTR_ERR'
Message-ID: <202511011754.hK4vDkZ2-lkp@intel.com>
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
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   cdc52122313863bdce40a9403e5ccf7ca915fc36
commit: 49768ad0eb9d67ed71368ca9295185dd000674a1 [9/17] vsock: Add memory sharing support
:::::: branch date: 4 hours ago
:::::: commit date: 23 hours ago
config: powerpc-randconfig-r071-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011754.hK4vDkZ2-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511011754.hK4vDkZ2-lkp@intel.com/

smatch warnings:
net/vmw_vsock/af_vsock.c:2164 vsock_connectible_sendmsg() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +2164 net/vmw_vsock/af_vsock.c

49768ad0eb9d67 Viresh Kumar       2025-10-15  2082  
a9e29e5511b9e6 Arseny Krasnov     2021-06-11  2083  static int vsock_connectible_sendmsg(struct socket *sock, struct msghdr *msg,
1b784140474e4f Ying Xue           2015-03-02  2084  				     size_t len)
d021c344051af9 Andy King          2013-02-06  2085  {
d021c344051af9 Andy King          2013-02-06  2086  	struct sock *sk;
d021c344051af9 Andy King          2013-02-06  2087  	struct vsock_sock *vsk;
fe502c4a38d97e Stefano Garzarella 2019-11-14  2088  	const struct vsock_transport *transport;
d021c344051af9 Andy King          2013-02-06  2089  	ssize_t total_written;
d021c344051af9 Andy King          2013-02-06  2090  	long timeout;
d021c344051af9 Andy King          2013-02-06  2091  	int err;
d021c344051af9 Andy King          2013-02-06  2092  	struct vsock_transport_send_notify_data send_data;
499fde662f1957 WANG Cong          2017-05-19  2093  	DEFINE_WAIT_FUNC(wait, woken_wake_function);
d021c344051af9 Andy King          2013-02-06  2094  
d021c344051af9 Andy King          2013-02-06  2095  	sk = sock->sk;
d021c344051af9 Andy King          2013-02-06  2096  	vsk = vsock_sk(sk);
d021c344051af9 Andy King          2013-02-06  2097  	total_written = 0;
d021c344051af9 Andy King          2013-02-06  2098  	err = 0;
d021c344051af9 Andy King          2013-02-06  2099  
d021c344051af9 Andy King          2013-02-06  2100  	if (msg->msg_flags & MSG_OOB)
d021c344051af9 Andy King          2013-02-06  2101  		return -EOPNOTSUPP;
d021c344051af9 Andy King          2013-02-06  2102  
d021c344051af9 Andy King          2013-02-06  2103  	lock_sock(sk);
d021c344051af9 Andy King          2013-02-06  2104  
c518adafa39f37 Alexander Popov    2021-02-01  2105  	transport = vsk->transport;
c518adafa39f37 Alexander Popov    2021-02-01  2106  
49768ad0eb9d67 Viresh Kumar       2025-10-15  2107  	/* Scan ancillary for SOL_VSOCK/SCM_VSOCK_SHMEM */
49768ad0eb9d67 Viresh Kumar       2025-10-15  2108  	if (msg->msg_controllen) {
49768ad0eb9d67 Viresh Kumar       2025-10-15  2109  		struct cmsghdr *cmsg;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2110  
49768ad0eb9d67 Viresh Kumar       2025-10-15  2111  		/* Check transport hook */
49768ad0eb9d67 Viresh Kumar       2025-10-15  2112  		if (!transport || !transport->send_shmem) {
49768ad0eb9d67 Viresh Kumar       2025-10-15  2113  			err = -EOPNOTSUPP;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2114  			goto out;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2115  		}
49768ad0eb9d67 Viresh Kumar       2025-10-15  2116  
49768ad0eb9d67 Viresh Kumar       2025-10-15  2117  		for (cmsg = CMSG_FIRSTHDR(msg); cmsg; cmsg = CMSG_NXTHDR(msg, cmsg)) {
49768ad0eb9d67 Viresh Kumar       2025-10-15  2118  			if (cmsg->cmsg_level == SOL_VSOCK &&
49768ad0eb9d67 Viresh Kumar       2025-10-15  2119  			    cmsg->cmsg_type == SCM_VSOCK_SHMEM) {
49768ad0eb9d67 Viresh Kumar       2025-10-15  2120  				struct vsock_shmem_desc desc = {};
49768ad0eb9d67 Viresh Kumar       2025-10-15  2121  				struct file *file;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2122  				void *old;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2123  				int fd;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2124  
49768ad0eb9d67 Viresh Kumar       2025-10-15  2125  				if (cmsg->cmsg_len < CMSG_LEN(sizeof(fd))) {
49768ad0eb9d67 Viresh Kumar       2025-10-15  2126  					err = -EINVAL;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2127  					goto out;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2128  				}
49768ad0eb9d67 Viresh Kumar       2025-10-15  2129  
49768ad0eb9d67 Viresh Kumar       2025-10-15  2130  				memcpy(&fd, CMSG_DATA(cmsg), sizeof(fd));
49768ad0eb9d67 Viresh Kumar       2025-10-15  2131  				if (fd < 0) {
49768ad0eb9d67 Viresh Kumar       2025-10-15  2132  					err = -EINVAL;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2133  					goto out;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2134  				}
49768ad0eb9d67 Viresh Kumar       2025-10-15  2135  
49768ad0eb9d67 Viresh Kumar       2025-10-15  2136  				desc.fd = fd;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2137  
49768ad0eb9d67 Viresh Kumar       2025-10-15  2138  				/* Loopback-only: published file */
49768ad0eb9d67 Viresh Kumar       2025-10-15  2139  				if (vsk->transport == transport_local) {
49768ad0eb9d67 Viresh Kumar       2025-10-15  2140  					file = fget(fd);
49768ad0eb9d67 Viresh Kumar       2025-10-15  2141  					if (!file) {
49768ad0eb9d67 Viresh Kumar       2025-10-15  2142  						err = -EBADF;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2143  						goto out;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2144  					}
49768ad0eb9d67 Viresh Kumar       2025-10-15  2145  
49768ad0eb9d67 Viresh Kumar       2025-10-15  2146  					/* publish FD's file by token */
49768ad0eb9d67 Viresh Kumar       2025-10-15  2147  					old = xa_store(&vsock_shmem_xa,
49768ad0eb9d67 Viresh Kumar       2025-10-15  2148  						       (unsigned long)fd, file,
49768ad0eb9d67 Viresh Kumar       2025-10-15  2149  						       GFP_KERNEL);
49768ad0eb9d67 Viresh Kumar       2025-10-15  2150  					if (xa_is_err(old)) {
49768ad0eb9d67 Viresh Kumar       2025-10-15  2151  						fput(file);
49768ad0eb9d67 Viresh Kumar       2025-10-15  2152  						err = xa_err(old);
49768ad0eb9d67 Viresh Kumar       2025-10-15  2153  						goto out;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2154  					}
49768ad0eb9d67 Viresh Kumar       2025-10-15  2155  
49768ad0eb9d67 Viresh Kumar       2025-10-15  2156  					/* Token used previously ? */
49768ad0eb9d67 Viresh Kumar       2025-10-15  2157  					if (old)
49768ad0eb9d67 Viresh Kumar       2025-10-15  2158  						fput(old);
49768ad0eb9d67 Viresh Kumar       2025-10-15  2159  				} else {
49768ad0eb9d67 Viresh Kumar       2025-10-15  2160  					/* The fd must belong to a dma-buf */
49768ad0eb9d67 Viresh Kumar       2025-10-15  2161  					struct dma_buf *dbuf = dma_buf_get(fd);
49768ad0eb9d67 Viresh Kumar       2025-10-15  2162  
49768ad0eb9d67 Viresh Kumar       2025-10-15  2163  					if (IS_ERR(dbuf) || !dbuf->ops->shmem) {
49768ad0eb9d67 Viresh Kumar       2025-10-15 @2164  						err = PTR_ERR(dbuf);
49768ad0eb9d67 Viresh Kumar       2025-10-15  2165  						goto out;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2166  					}
49768ad0eb9d67 Viresh Kumar       2025-10-15  2167  
49768ad0eb9d67 Viresh Kumar       2025-10-15  2168  					err = dbuf->ops->shmem(dbuf, &desc);
49768ad0eb9d67 Viresh Kumar       2025-10-15  2169  					if (err)
49768ad0eb9d67 Viresh Kumar       2025-10-15  2170  						goto out;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2171  				}
49768ad0eb9d67 Viresh Kumar       2025-10-15  2172  
49768ad0eb9d67 Viresh Kumar       2025-10-15  2173  				/* send SHMEM control pkt (out-of-band) */
49768ad0eb9d67 Viresh Kumar       2025-10-15  2174  				err = vsk->transport->send_shmem(vsk, &desc);
49768ad0eb9d67 Viresh Kumar       2025-10-15  2175  				if (err < 0)
49768ad0eb9d67 Viresh Kumar       2025-10-15  2176  					goto out;
49768ad0eb9d67 Viresh Kumar       2025-10-15  2177  			}
49768ad0eb9d67 Viresh Kumar       2025-10-15  2178  		}
49768ad0eb9d67 Viresh Kumar       2025-10-15  2179  	}
49768ad0eb9d67 Viresh Kumar       2025-10-15  2180  
8cb48554ad822f Arseny Krasnov     2021-06-11  2181  	/* Callers should not provide a destination with connection oriented
8cb48554ad822f Arseny Krasnov     2021-06-11  2182  	 * sockets.
8cb48554ad822f Arseny Krasnov     2021-06-11  2183  	 */
d021c344051af9 Andy King          2013-02-06  2184  	if (msg->msg_namelen) {
3b4477d2dcf270 Stefan Hajnoczi    2017-10-05  2185  		err = sk->sk_state == TCP_ESTABLISHED ? -EISCONN : -EOPNOTSUPP;
d021c344051af9 Andy King          2013-02-06  2186  		goto out;
d021c344051af9 Andy King          2013-02-06  2187  	}
d021c344051af9 Andy King          2013-02-06  2188  
d021c344051af9 Andy King          2013-02-06  2189  	/* Send data only if both sides are not shutdown in the direction. */
d021c344051af9 Andy King          2013-02-06  2190  	if (sk->sk_shutdown & SEND_SHUTDOWN ||
d021c344051af9 Andy King          2013-02-06  2191  	    vsk->peer_shutdown & RCV_SHUTDOWN) {
d021c344051af9 Andy King          2013-02-06  2192  		err = -EPIPE;
d021c344051af9 Andy King          2013-02-06  2193  		goto out;
d021c344051af9 Andy King          2013-02-06  2194  	}
d021c344051af9 Andy King          2013-02-06  2195  
c0cfa2d8a788fc Stefano Garzarella 2019-11-14  2196  	if (!transport || sk->sk_state != TCP_ESTABLISHED ||
d021c344051af9 Andy King          2013-02-06  2197  	    !vsock_addr_bound(&vsk->local_addr)) {
d021c344051af9 Andy King          2013-02-06  2198  		err = -ENOTCONN;
d021c344051af9 Andy King          2013-02-06  2199  		goto out;
d021c344051af9 Andy King          2013-02-06  2200  	}
d021c344051af9 Andy King          2013-02-06  2201  
d021c344051af9 Andy King          2013-02-06  2202  	if (!vsock_addr_bound(&vsk->remote_addr)) {
d021c344051af9 Andy King          2013-02-06  2203  		err = -EDESTADDRREQ;
d021c344051af9 Andy King          2013-02-06  2204  		goto out;
d021c344051af9 Andy King          2013-02-06  2205  	}
d021c344051af9 Andy King          2013-02-06  2206  
5fbfc7d2433439 Arseniy Krasnov    2023-10-10  2207  	if (msg->msg_flags & MSG_ZEROCOPY &&
5fbfc7d2433439 Arseniy Krasnov    2023-10-10  2208  	    !vsock_msgzerocopy_allow(transport)) {
5fbfc7d2433439 Arseniy Krasnov    2023-10-10  2209  		err = -EOPNOTSUPP;
5fbfc7d2433439 Arseniy Krasnov    2023-10-10  2210  		goto out;
5fbfc7d2433439 Arseniy Krasnov    2023-10-10  2211  	}
5fbfc7d2433439 Arseniy Krasnov    2023-10-10  2212  
d021c344051af9 Andy King          2013-02-06  2213  	/* Wait for room in the produce queue to enqueue our user's data. */
d021c344051af9 Andy King          2013-02-06  2214  	timeout = sock_sndtimeo(sk, msg->msg_flags & MSG_DONTWAIT);
d021c344051af9 Andy King          2013-02-06  2215  
d021c344051af9 Andy King          2013-02-06  2216  	err = transport->notify_send_init(vsk, &send_data);
d021c344051af9 Andy King          2013-02-06  2217  	if (err < 0)
d021c344051af9 Andy King          2013-02-06  2218  		goto out;
d021c344051af9 Andy King          2013-02-06  2219  
d021c344051af9 Andy King          2013-02-06  2220  	while (total_written < len) {
d021c344051af9 Andy King          2013-02-06  2221  		ssize_t written;
d021c344051af9 Andy King          2013-02-06  2222  
499fde662f1957 WANG Cong          2017-05-19  2223  		add_wait_queue(sk_sleep(sk), &wait);
d021c344051af9 Andy King          2013-02-06  2224  		while (vsock_stream_has_space(vsk) == 0 &&
d021c344051af9 Andy King          2013-02-06  2225  		       sk->sk_err == 0 &&
d021c344051af9 Andy King          2013-02-06  2226  		       !(sk->sk_shutdown & SEND_SHUTDOWN) &&
d021c344051af9 Andy King          2013-02-06  2227  		       !(vsk->peer_shutdown & RCV_SHUTDOWN)) {
d021c344051af9 Andy King          2013-02-06  2228  
d021c344051af9 Andy King          2013-02-06  2229  			/* Don't wait for non-blocking sockets. */
d021c344051af9 Andy King          2013-02-06  2230  			if (timeout == 0) {
d021c344051af9 Andy King          2013-02-06  2231  				err = -EAGAIN;
499fde662f1957 WANG Cong          2017-05-19  2232  				remove_wait_queue(sk_sleep(sk), &wait);
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2233  				goto out_err;
d021c344051af9 Andy King          2013-02-06  2234  			}
d021c344051af9 Andy King          2013-02-06  2235  
d021c344051af9 Andy King          2013-02-06  2236  			err = transport->notify_send_pre_block(vsk, &send_data);
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2237  			if (err < 0) {
499fde662f1957 WANG Cong          2017-05-19  2238  				remove_wait_queue(sk_sleep(sk), &wait);
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2239  				goto out_err;
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2240  			}
d021c344051af9 Andy King          2013-02-06  2241  
d021c344051af9 Andy King          2013-02-06  2242  			release_sock(sk);
499fde662f1957 WANG Cong          2017-05-19  2243  			timeout = wait_woken(&wait, TASK_INTERRUPTIBLE, timeout);
d021c344051af9 Andy King          2013-02-06  2244  			lock_sock(sk);
d021c344051af9 Andy King          2013-02-06  2245  			if (signal_pending(current)) {
d021c344051af9 Andy King          2013-02-06  2246  				err = sock_intr_errno(timeout);
499fde662f1957 WANG Cong          2017-05-19  2247  				remove_wait_queue(sk_sleep(sk), &wait);
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2248  				goto out_err;
d021c344051af9 Andy King          2013-02-06  2249  			} else if (timeout == 0) {
d021c344051af9 Andy King          2013-02-06  2250  				err = -EAGAIN;
499fde662f1957 WANG Cong          2017-05-19  2251  				remove_wait_queue(sk_sleep(sk), &wait);
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2252  				goto out_err;
d021c344051af9 Andy King          2013-02-06  2253  			}
d021c344051af9 Andy King          2013-02-06  2254  		}
499fde662f1957 WANG Cong          2017-05-19  2255  		remove_wait_queue(sk_sleep(sk), &wait);
d021c344051af9 Andy King          2013-02-06  2256  
d021c344051af9 Andy King          2013-02-06  2257  		/* These checks occur both as part of and after the loop
d021c344051af9 Andy King          2013-02-06  2258  		 * conditional since we need to check before and after
d021c344051af9 Andy King          2013-02-06  2259  		 * sleeping.
d021c344051af9 Andy King          2013-02-06  2260  		 */
d021c344051af9 Andy King          2013-02-06  2261  		if (sk->sk_err) {
d021c344051af9 Andy King          2013-02-06  2262  			err = -sk->sk_err;
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2263  			goto out_err;
d021c344051af9 Andy King          2013-02-06  2264  		} else if ((sk->sk_shutdown & SEND_SHUTDOWN) ||
d021c344051af9 Andy King          2013-02-06  2265  			   (vsk->peer_shutdown & RCV_SHUTDOWN)) {
d021c344051af9 Andy King          2013-02-06  2266  			err = -EPIPE;
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2267  			goto out_err;
d021c344051af9 Andy King          2013-02-06  2268  		}
d021c344051af9 Andy King          2013-02-06  2269  
d021c344051af9 Andy King          2013-02-06  2270  		err = transport->notify_send_pre_enqueue(vsk, &send_data);
d021c344051af9 Andy King          2013-02-06  2271  		if (err < 0)
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2272  			goto out_err;
d021c344051af9 Andy King          2013-02-06  2273  
d021c344051af9 Andy King          2013-02-06  2274  		/* Note that enqueue will only write as many bytes as are free
d021c344051af9 Andy King          2013-02-06  2275  		 * in the produce queue, so we don't need to ensure len is
d021c344051af9 Andy King          2013-02-06  2276  		 * smaller than the queue size.  It is the caller's
d021c344051af9 Andy King          2013-02-06  2277  		 * responsibility to check how many bytes we were able to send.
d021c344051af9 Andy King          2013-02-06  2278  		 */
d021c344051af9 Andy King          2013-02-06  2279  
fbe70c480796d9 Arseny Krasnov     2021-06-11  2280  		if (sk->sk_type == SOCK_SEQPACKET) {
fbe70c480796d9 Arseny Krasnov     2021-06-11  2281  			written = transport->seqpacket_enqueue(vsk,
fbe70c480796d9 Arseny Krasnov     2021-06-11  2282  						msg, len - total_written);
fbe70c480796d9 Arseny Krasnov     2021-06-11  2283  		} else {
fbe70c480796d9 Arseny Krasnov     2021-06-11  2284  			written = transport->stream_enqueue(vsk,
fbe70c480796d9 Arseny Krasnov     2021-06-11  2285  					msg, len - total_written);
fbe70c480796d9 Arseny Krasnov     2021-06-11  2286  		}
c43170b7e1571e Bobby Eshleman     2023-01-10  2287  
d021c344051af9 Andy King          2013-02-06  2288  		if (written < 0) {
c43170b7e1571e Bobby Eshleman     2023-01-10  2289  			err = written;
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2290  			goto out_err;
d021c344051af9 Andy King          2013-02-06  2291  		}
d021c344051af9 Andy King          2013-02-06  2292  
d021c344051af9 Andy King          2013-02-06  2293  		total_written += written;
d021c344051af9 Andy King          2013-02-06  2294  
d021c344051af9 Andy King          2013-02-06  2295  		err = transport->notify_send_post_enqueue(
d021c344051af9 Andy King          2013-02-06  2296  				vsk, written, &send_data);
d021c344051af9 Andy King          2013-02-06  2297  		if (err < 0)
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2298  			goto out_err;
d021c344051af9 Andy King          2013-02-06  2299  
d021c344051af9 Andy King          2013-02-06  2300  	}
d021c344051af9 Andy King          2013-02-06  2301  
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2302  out_err:
fbe70c480796d9 Arseny Krasnov     2021-06-11  2303  	if (total_written > 0) {
fbe70c480796d9 Arseny Krasnov     2021-06-11  2304  		/* Return number of written bytes only if:
fbe70c480796d9 Arseny Krasnov     2021-06-11  2305  		 * 1) SOCK_STREAM socket.
fbe70c480796d9 Arseny Krasnov     2021-06-11  2306  		 * 2) SOCK_SEQPACKET socket when whole buffer is sent.
fbe70c480796d9 Arseny Krasnov     2021-06-11  2307  		 */
fbe70c480796d9 Arseny Krasnov     2021-06-11  2308  		if (sk->sk_type == SOCK_STREAM || total_written == len)
d021c344051af9 Andy King          2013-02-06  2309  			err = total_written;
fbe70c480796d9 Arseny Krasnov     2021-06-11  2310  	}
d021c344051af9 Andy King          2013-02-06  2311  out:
8ecf0cedc08a3a Arseniy Krasnov    2023-09-11  2312  	if (sk->sk_type == SOCK_STREAM)
8ecf0cedc08a3a Arseniy Krasnov    2023-09-11  2313  		err = sk_stream_error(sk, msg->msg_flags, err);
8ecf0cedc08a3a Arseniy Krasnov    2023-09-11  2314  
d021c344051af9 Andy King          2013-02-06  2315  	release_sock(sk);
d021c344051af9 Andy King          2013-02-06  2316  	return err;
d021c344051af9 Andy King          2013-02-06  2317  }
d021c344051af9 Andy King          2013-02-06  2318  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
