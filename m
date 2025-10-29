Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A72D2DAFBE
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 02:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761705860; cv=none; b=Ls5zXlWNdms2zZXhAnd5LQj3RLgwWUofQEvE1EBUr8QKXKPbz+Y8+9tcVFQx8B1yhQXQtIRqfPKsktiaF7I1PVzsTcG3DZOMINe2UgIJdIwO9t5l6xSkzK/TFc8mPZWPKlQAFZfUBZWwGr1G+OFx98Cllp5qP/QVUgHyLY7t9MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761705860; c=relaxed/simple;
	bh=POu00ct8593NFyNmzw8T9vTP8CzHyNElwJ0sO+8hMK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X4fpKlqpkpGx79MzD3sa8Q+O47co5+in37gDJ7QOU3g+kZrMZ3v/glvLGvqlC+hFC1uJqSQ+aHSYsWYfpO7/ZRL81GRaONNDlqbgkP0Lec3zikOyZTJW6MaMwflE4QhLYyxfce5uEnUTjmR/2TDa9T2JMkTEqlP8LL/GtK4Z7Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6AoN7cn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6AoN7cn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761705858; x=1793241858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=POu00ct8593NFyNmzw8T9vTP8CzHyNElwJ0sO+8hMK4=;
  b=W6AoN7cnSthf+SipKDkI5vf09P8tJVSlp4LBujHEIY5t6oRpztrjH3dn
   XFiC+GUARBnbhUVRVT2uRT/gxUc8AysXfWQ6bWEBXAASYfxp4qP42EoNo
   vw37uP7HpXQQBTpHXLj6IzWoXGIYWiMBhF9rxKK6YwAeqjLIty98rn4UZ
   4Vj9ybS86qRde2JEqDRCMk1Y6ucRMDbUIZlFvmwyQwLaSOOVBgK+HfnI0
   8xvs6j9y/OVOcE81teIdxbRO0dFVg9QFLYRrLdjRtdqhNIAX+9XKonLqc
   nKlSEJTY1Tn+d61AAYgLbR0s3dwuN8x3vU1BiPHO7YH6zvSHVvs+UqVVP
   w==;
X-CSE-ConnectionGUID: kyoAAOIxQYq6BFxehg82XQ==
X-CSE-MsgGUID: Kezh13hfSL+dmu6ZHT3Qug==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81239480"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="81239480"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 19:44:18 -0700
X-CSE-ConnectionGUID: x425QVzCSXiFeRkVSqVStQ==
X-CSE-MsgGUID: uNC1BE49TxOLOkUgBq5VBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="190661530"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Oct 2025 19:44:16 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDwAY-000K4Q-0d;
	Wed, 29 Oct 2025 02:44:14 +0000
Date: Wed, 29 Oct 2025 10:43:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vireshk:virtio/msg-xen 12/16] net/vmw_vsock/af_vsock.c:2292
 vsock_connectible_sendmsg() warn: inconsistent returns 'sk'.
Message-ID: <202510291001.CGX6PpWu-lkp@intel.com>
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
head:   27143c677cd93a347826a8702540f4b7cdb0d14e
commit: 8d1fc26e2f13344cd4d4f0552d6f0eaaade83913 [12/16] vsock: Add memory sharing support
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-161-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291001.CGX6PpWu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510291001.CGX6PpWu-lkp@intel.com/

smatch warnings:
net/vmw_vsock/af_vsock.c:2292 vsock_connectible_sendmsg() warn: inconsistent returns 'sk'.

vim +/sk +2292 net/vmw_vsock/af_vsock.c

8d1fc26e2f1334 Viresh Kumar       2025-10-15  2078  
a9e29e5511b9e6 Arseny Krasnov     2021-06-11  2079  static int vsock_connectible_sendmsg(struct socket *sock, struct msghdr *msg,
1b784140474e4f Ying Xue           2015-03-02  2080  				     size_t len)
d021c344051af9 Andy King          2013-02-06  2081  {
d021c344051af9 Andy King          2013-02-06  2082  	struct sock *sk;
d021c344051af9 Andy King          2013-02-06  2083  	struct vsock_sock *vsk;
fe502c4a38d97e Stefano Garzarella 2019-11-14  2084  	const struct vsock_transport *transport;
d021c344051af9 Andy King          2013-02-06  2085  	ssize_t total_written;
d021c344051af9 Andy King          2013-02-06  2086  	long timeout;
d021c344051af9 Andy King          2013-02-06  2087  	int err;
d021c344051af9 Andy King          2013-02-06  2088  	struct vsock_transport_send_notify_data send_data;
499fde662f1957 WANG Cong          2017-05-19  2089  	DEFINE_WAIT_FUNC(wait, woken_wake_function);
d021c344051af9 Andy King          2013-02-06  2090  
d021c344051af9 Andy King          2013-02-06  2091  	sk = sock->sk;
d021c344051af9 Andy King          2013-02-06  2092  	vsk = vsock_sk(sk);
d021c344051af9 Andy King          2013-02-06  2093  	total_written = 0;
d021c344051af9 Andy King          2013-02-06  2094  	err = 0;
d021c344051af9 Andy King          2013-02-06  2095  
d021c344051af9 Andy King          2013-02-06  2096  	if (msg->msg_flags & MSG_OOB)
d021c344051af9 Andy King          2013-02-06  2097  		return -EOPNOTSUPP;
d021c344051af9 Andy King          2013-02-06  2098  
d021c344051af9 Andy King          2013-02-06  2099  	lock_sock(sk);
d021c344051af9 Andy King          2013-02-06  2100  
c518adafa39f37 Alexander Popov    2021-02-01  2101  	transport = vsk->transport;
c518adafa39f37 Alexander Popov    2021-02-01  2102  
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2103  	/* Scan ancillary for SOL_VSOCK/SCM_VSOCK_SHMEM */
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2104  	if (msg->msg_controllen) {
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2105  		struct cmsghdr *cmsg;
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2106  
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2107  		/* Check transport hook */
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2108  		if (!transport || !transport->send_shmem)
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2109  			return -EOPNOTSUPP;
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2110  
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2111  		for (cmsg = CMSG_FIRSTHDR(msg); cmsg; cmsg = CMSG_NXTHDR(msg, cmsg)) {
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2112  			if (cmsg->cmsg_level == SOL_VSOCK &&
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2113  			    cmsg->cmsg_type == SCM_VSOCK_SHMEM) {
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2114  				struct vsock_shmem_desc desc;
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2115  				struct file *file;
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2116  				void *old;
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2117  
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2118  				if (cmsg->cmsg_len < CMSG_LEN(sizeof(desc)))
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2119  					return -EINVAL;
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2120  
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2121  				memcpy(&desc, CMSG_DATA(cmsg), sizeof(desc));
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2122  
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2123  				if (desc.fd < 0)
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2124  					return -EINVAL;
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2125  
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2126  				file = fget(desc.fd);
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2127  				if (!file) {
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2128  					err = -EBADF;
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2129  					goto out;
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2130  				}
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2131  
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2132  				/* publish FD's file by token */
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2133  				old = xa_store(&vsock_shmem_xa,
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2134  						(unsigned long)desc.token, file,
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2135  						GFP_KERNEL);
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2136  				if (xa_is_err(old)) {
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2137  					fput(file);
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2138  					err = xa_err(old);
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2139  					goto out;
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2140  				}
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2141  
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2142  				/* Token used previously ? */
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2143  				if (old)
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2144  					fput(old);
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2145  
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2146  				/* Receiver will create its own fd; do not leak sender's fd */
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2147  				desc.fd = -1;
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2148  
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2149  				/* send SHMEM control pkt (out-of-band) */
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2150  				err = vsk->transport->send_shmem(vsk, &desc);
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2151  				if (err < 0)
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2152  					goto out;
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2153  			}
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2154  		}
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2155  	}
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2156  
8cb48554ad822f Arseny Krasnov     2021-06-11  2157  	/* Callers should not provide a destination with connection oriented
8cb48554ad822f Arseny Krasnov     2021-06-11  2158  	 * sockets.
8cb48554ad822f Arseny Krasnov     2021-06-11  2159  	 */
d021c344051af9 Andy King          2013-02-06  2160  	if (msg->msg_namelen) {
3b4477d2dcf270 Stefan Hajnoczi    2017-10-05  2161  		err = sk->sk_state == TCP_ESTABLISHED ? -EISCONN : -EOPNOTSUPP;
d021c344051af9 Andy King          2013-02-06  2162  		goto out;
d021c344051af9 Andy King          2013-02-06  2163  	}
d021c344051af9 Andy King          2013-02-06  2164  
d021c344051af9 Andy King          2013-02-06  2165  	/* Send data only if both sides are not shutdown in the direction. */
d021c344051af9 Andy King          2013-02-06  2166  	if (sk->sk_shutdown & SEND_SHUTDOWN ||
d021c344051af9 Andy King          2013-02-06  2167  	    vsk->peer_shutdown & RCV_SHUTDOWN) {
d021c344051af9 Andy King          2013-02-06  2168  		err = -EPIPE;
d021c344051af9 Andy King          2013-02-06  2169  		goto out;
d021c344051af9 Andy King          2013-02-06  2170  	}
d021c344051af9 Andy King          2013-02-06  2171  
c0cfa2d8a788fc Stefano Garzarella 2019-11-14  2172  	if (!transport || sk->sk_state != TCP_ESTABLISHED ||
d021c344051af9 Andy King          2013-02-06  2173  	    !vsock_addr_bound(&vsk->local_addr)) {
d021c344051af9 Andy King          2013-02-06  2174  		err = -ENOTCONN;
d021c344051af9 Andy King          2013-02-06  2175  		goto out;
d021c344051af9 Andy King          2013-02-06  2176  	}
d021c344051af9 Andy King          2013-02-06  2177  
d021c344051af9 Andy King          2013-02-06  2178  	if (!vsock_addr_bound(&vsk->remote_addr)) {
d021c344051af9 Andy King          2013-02-06  2179  		err = -EDESTADDRREQ;
d021c344051af9 Andy King          2013-02-06  2180  		goto out;
d021c344051af9 Andy King          2013-02-06  2181  	}
d021c344051af9 Andy King          2013-02-06  2182  
5fbfc7d2433439 Arseniy Krasnov    2023-10-10  2183  	if (msg->msg_flags & MSG_ZEROCOPY &&
5fbfc7d2433439 Arseniy Krasnov    2023-10-10  2184  	    !vsock_msgzerocopy_allow(transport)) {
5fbfc7d2433439 Arseniy Krasnov    2023-10-10  2185  		err = -EOPNOTSUPP;
5fbfc7d2433439 Arseniy Krasnov    2023-10-10  2186  		goto out;
5fbfc7d2433439 Arseniy Krasnov    2023-10-10  2187  	}
5fbfc7d2433439 Arseniy Krasnov    2023-10-10  2188  
d021c344051af9 Andy King          2013-02-06  2189  	/* Wait for room in the produce queue to enqueue our user's data. */
d021c344051af9 Andy King          2013-02-06  2190  	timeout = sock_sndtimeo(sk, msg->msg_flags & MSG_DONTWAIT);
d021c344051af9 Andy King          2013-02-06  2191  
d021c344051af9 Andy King          2013-02-06  2192  	err = transport->notify_send_init(vsk, &send_data);
d021c344051af9 Andy King          2013-02-06  2193  	if (err < 0)
d021c344051af9 Andy King          2013-02-06  2194  		goto out;
d021c344051af9 Andy King          2013-02-06  2195  
d021c344051af9 Andy King          2013-02-06  2196  	while (total_written < len) {
d021c344051af9 Andy King          2013-02-06  2197  		ssize_t written;
d021c344051af9 Andy King          2013-02-06  2198  
499fde662f1957 WANG Cong          2017-05-19  2199  		add_wait_queue(sk_sleep(sk), &wait);
d021c344051af9 Andy King          2013-02-06  2200  		while (vsock_stream_has_space(vsk) == 0 &&
d021c344051af9 Andy King          2013-02-06  2201  		       sk->sk_err == 0 &&
d021c344051af9 Andy King          2013-02-06  2202  		       !(sk->sk_shutdown & SEND_SHUTDOWN) &&
d021c344051af9 Andy King          2013-02-06  2203  		       !(vsk->peer_shutdown & RCV_SHUTDOWN)) {
d021c344051af9 Andy King          2013-02-06  2204  
d021c344051af9 Andy King          2013-02-06  2205  			/* Don't wait for non-blocking sockets. */
d021c344051af9 Andy King          2013-02-06  2206  			if (timeout == 0) {
d021c344051af9 Andy King          2013-02-06  2207  				err = -EAGAIN;
499fde662f1957 WANG Cong          2017-05-19  2208  				remove_wait_queue(sk_sleep(sk), &wait);
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2209  				goto out_err;
d021c344051af9 Andy King          2013-02-06  2210  			}
d021c344051af9 Andy King          2013-02-06  2211  
d021c344051af9 Andy King          2013-02-06  2212  			err = transport->notify_send_pre_block(vsk, &send_data);
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2213  			if (err < 0) {
499fde662f1957 WANG Cong          2017-05-19  2214  				remove_wait_queue(sk_sleep(sk), &wait);
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2215  				goto out_err;
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2216  			}
d021c344051af9 Andy King          2013-02-06  2217  
d021c344051af9 Andy King          2013-02-06  2218  			release_sock(sk);
499fde662f1957 WANG Cong          2017-05-19  2219  			timeout = wait_woken(&wait, TASK_INTERRUPTIBLE, timeout);
d021c344051af9 Andy King          2013-02-06  2220  			lock_sock(sk);
d021c344051af9 Andy King          2013-02-06  2221  			if (signal_pending(current)) {
d021c344051af9 Andy King          2013-02-06  2222  				err = sock_intr_errno(timeout);
499fde662f1957 WANG Cong          2017-05-19  2223  				remove_wait_queue(sk_sleep(sk), &wait);
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2224  				goto out_err;
d021c344051af9 Andy King          2013-02-06  2225  			} else if (timeout == 0) {
d021c344051af9 Andy King          2013-02-06  2226  				err = -EAGAIN;
499fde662f1957 WANG Cong          2017-05-19  2227  				remove_wait_queue(sk_sleep(sk), &wait);
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2228  				goto out_err;
d021c344051af9 Andy King          2013-02-06  2229  			}
d021c344051af9 Andy King          2013-02-06  2230  		}
499fde662f1957 WANG Cong          2017-05-19  2231  		remove_wait_queue(sk_sleep(sk), &wait);
d021c344051af9 Andy King          2013-02-06  2232  
d021c344051af9 Andy King          2013-02-06  2233  		/* These checks occur both as part of and after the loop
d021c344051af9 Andy King          2013-02-06  2234  		 * conditional since we need to check before and after
d021c344051af9 Andy King          2013-02-06  2235  		 * sleeping.
d021c344051af9 Andy King          2013-02-06  2236  		 */
d021c344051af9 Andy King          2013-02-06  2237  		if (sk->sk_err) {
d021c344051af9 Andy King          2013-02-06  2238  			err = -sk->sk_err;
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2239  			goto out_err;
d021c344051af9 Andy King          2013-02-06  2240  		} else if ((sk->sk_shutdown & SEND_SHUTDOWN) ||
d021c344051af9 Andy King          2013-02-06  2241  			   (vsk->peer_shutdown & RCV_SHUTDOWN)) {
d021c344051af9 Andy King          2013-02-06  2242  			err = -EPIPE;
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2243  			goto out_err;
d021c344051af9 Andy King          2013-02-06  2244  		}
d021c344051af9 Andy King          2013-02-06  2245  
d021c344051af9 Andy King          2013-02-06  2246  		err = transport->notify_send_pre_enqueue(vsk, &send_data);
d021c344051af9 Andy King          2013-02-06  2247  		if (err < 0)
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2248  			goto out_err;
d021c344051af9 Andy King          2013-02-06  2249  
d021c344051af9 Andy King          2013-02-06  2250  		/* Note that enqueue will only write as many bytes as are free
d021c344051af9 Andy King          2013-02-06  2251  		 * in the produce queue, so we don't need to ensure len is
d021c344051af9 Andy King          2013-02-06  2252  		 * smaller than the queue size.  It is the caller's
d021c344051af9 Andy King          2013-02-06  2253  		 * responsibility to check how many bytes we were able to send.
d021c344051af9 Andy King          2013-02-06  2254  		 */
d021c344051af9 Andy King          2013-02-06  2255  
fbe70c480796d9 Arseny Krasnov     2021-06-11  2256  		if (sk->sk_type == SOCK_SEQPACKET) {
fbe70c480796d9 Arseny Krasnov     2021-06-11  2257  			written = transport->seqpacket_enqueue(vsk,
fbe70c480796d9 Arseny Krasnov     2021-06-11  2258  						msg, len - total_written);
fbe70c480796d9 Arseny Krasnov     2021-06-11  2259  		} else {
fbe70c480796d9 Arseny Krasnov     2021-06-11  2260  			written = transport->stream_enqueue(vsk,
fbe70c480796d9 Arseny Krasnov     2021-06-11  2261  					msg, len - total_written);
fbe70c480796d9 Arseny Krasnov     2021-06-11  2262  		}
c43170b7e1571e Bobby Eshleman     2023-01-10  2263  
d021c344051af9 Andy King          2013-02-06  2264  		if (written < 0) {
c43170b7e1571e Bobby Eshleman     2023-01-10  2265  			err = written;
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2266  			goto out_err;
d021c344051af9 Andy King          2013-02-06  2267  		}
d021c344051af9 Andy King          2013-02-06  2268  
d021c344051af9 Andy King          2013-02-06  2269  		total_written += written;
d021c344051af9 Andy King          2013-02-06  2270  
d021c344051af9 Andy King          2013-02-06  2271  		err = transport->notify_send_post_enqueue(
d021c344051af9 Andy King          2013-02-06  2272  				vsk, written, &send_data);
d021c344051af9 Andy King          2013-02-06  2273  		if (err < 0)
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2274  			goto out_err;
d021c344051af9 Andy King          2013-02-06  2275  
d021c344051af9 Andy King          2013-02-06  2276  	}
d021c344051af9 Andy King          2013-02-06  2277  
f7f9b5e7f8eccf Claudio Imbrenda   2016-03-22  2278  out_err:
fbe70c480796d9 Arseny Krasnov     2021-06-11  2279  	if (total_written > 0) {
fbe70c480796d9 Arseny Krasnov     2021-06-11  2280  		/* Return number of written bytes only if:
fbe70c480796d9 Arseny Krasnov     2021-06-11  2281  		 * 1) SOCK_STREAM socket.
fbe70c480796d9 Arseny Krasnov     2021-06-11  2282  		 * 2) SOCK_SEQPACKET socket when whole buffer is sent.
fbe70c480796d9 Arseny Krasnov     2021-06-11  2283  		 */
fbe70c480796d9 Arseny Krasnov     2021-06-11  2284  		if (sk->sk_type == SOCK_STREAM || total_written == len)
d021c344051af9 Andy King          2013-02-06  2285  			err = total_written;
fbe70c480796d9 Arseny Krasnov     2021-06-11  2286  	}
d021c344051af9 Andy King          2013-02-06  2287  out:
8ecf0cedc08a3a Arseniy Krasnov    2023-09-11  2288  	if (sk->sk_type == SOCK_STREAM)
8ecf0cedc08a3a Arseniy Krasnov    2023-09-11  2289  		err = sk_stream_error(sk, msg->msg_flags, err);
8ecf0cedc08a3a Arseniy Krasnov    2023-09-11  2290  
d021c344051af9 Andy King          2013-02-06  2291  	release_sock(sk);
d021c344051af9 Andy King          2013-02-06 @2292  	return err;
d021c344051af9 Andy King          2013-02-06  2293  }
d021c344051af9 Andy King          2013-02-06  2294  

:::::: The code at line 2292 was first introduced by commit
:::::: d021c344051af91f42c5ba9fdedc176740cbd238 VSOCK: Introduce VM Sockets

:::::: TO: Andy King <acking@vmware.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
