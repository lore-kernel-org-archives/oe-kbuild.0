Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20305304BAB
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 07:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761722078; cv=none; b=k9SM2T/SXhbFRdI0wczhTaP/OnlNQhjLwMJoJfS6CnvEbsD5v1bNGQRXngIGL0mfVQAYwdGf7VlQzpMYwEJLE0USXdoDT6D6gTlZha+Mm6OcG0sL4gS2iQpqRWu6YdlOUZv6eMay95R0VX7VihjXY2fxaXurXoLRnKDXiM9vfo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761722078; c=relaxed/simple;
	bh=21T4zMNTM/GuzPr7y5pjI/8M5lKuZGEsaCxYEkwGKLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M3757ruKQqlbpCqfESxysUEtwKebGWC2c2wbhfGMQjpZ7akXWSNyfDSP5OET2oJMoH/c5BndXvo72O7SB5Qq6iw/l/ftxKD/5fafhZDrDR4kgCe9LWl3B0jJwY9ZdjrvVxsbI1k5hNhhxLsozjOjQSgU39BMH+MX5/GZo9LcQYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F4X/mGIM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F4X/mGIM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47114a40161so77277925e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 00:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761722074; x=1762326874; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KTb8zGHVLJA1XQbG6Hkwrq9D2TG/lZ5FOaDBIwt+rIk=;
        b=F4X/mGIMvhWBXEtOUuSwE0ltiHS2xPTQJB6lj/TxY9EpB57at1iPBngbzQKJP8EEKU
         Mmvdn4lkcBvwFbNEidgUYyDjWjypTca5GKUZ1wESpyn6d47KIOppp/dq3wMZv/pV3qmF
         AFweOP/m+hTlqhOgp37e4FVFr6wPD2dlUqt9NeQ5cHJM5J2toNGbq9nYw//kswoYyhRP
         xxUTZiMn9M15Ye6Bm5wFegRbvPPYLpjzUSOuwNGxL+FwCfomwKJs+OJHVQ110uteaODc
         oG022KZlL+rzWJdnYnL8RQ3ZrsyvGcfGxiks+NksDwxDEmqDV5KnIKO9f1r8uj2ZJLfU
         4VEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761722074; x=1762326874;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTb8zGHVLJA1XQbG6Hkwrq9D2TG/lZ5FOaDBIwt+rIk=;
        b=DXQgT0Luk9UifzXkCtBQ/MslvS9yq2uWX+T8BaZMyZaPtrSxw1+XbDIeNWYeXM0oaM
         Ij4vEH2UnG12GOVTjgs6kFoDHZALjQxwD1LqvDKKf/izRJ4igWdLeH/75xEW4DB+FXO9
         5l9o9V80Kra/kJrO0PO0R6e7/0gp2XZ/u1As/q2sH1jqBMmmqBbNwLSNKg6AfpMe7cRw
         EDYak1/MN0WL6Duz+ynm6D/SwfROWtCOhkP7W0lSUAzejMo35p36MFffr55gJ7NJK29l
         bA6Gmnm8QS8ftlwPNZaZZ8xMdIYxK3YlyV90gQxAnDHB+SIKQSMduVonofxSLTzAzdM4
         DPnQ==
X-Gm-Message-State: AOJu0Yzo/DqYoK4H72A6ynC6AIllhJ6lBwgT02eJj5Nva20YAIl+gnbJ
	F7szCwOrTgUk/+pL1fVoB9zXAWaqK99qJvEmSIkkepDC83EO7Ft9tCk/s0Fx2ptpkeugediVGxM
	9cP2W
X-Gm-Gg: ASbGncvBHlIiaAnXQgqcv2vw7vCHmZldOIPRrqkucllN6tyiDwkp+V+tGhtvE8FY3oC
	DKP4NdftUQZII/mD4MaC8UmPKsSAlcWAkW+BSffeT7zdX/3dQdWEwO1+sedB9j41Gf3WegILf6Q
	dX7iCSVUIlr7BE+NNBCo3k3LV/SlKGBKgtK9FNeN5K4dxPeJDCGZWJ/PW7ah4p+ITEMgQ6nZxZG
	yZT50XaQr9YdD9mtMM3XtOOiDn4r9tol90dwTk62nWEAzTfeH6HC0Dswas10sHQt1z6Kb9Pj1B3
	wc0/r7u6U7p0KaIW/hDvyRkkovUdPkPFYiTT+wy5/yrS/AjKMt8Ko7tY1tI//jw+/RYFatL7WhX
	rGYlcKXb6QtSfBz7yd2obklyRTQ8DACLcpHaafRNxJ4xxow4OF7XwCPjldOh252XKNa7mTPEYlI
	e+ftqfrR3xE8igA5+t
X-Google-Smtp-Source: AGHT+IGtu5WtocUZXv2UBK0nKtdn7jwm0d4e5ipqliV9zGUC6yY4KMx1Dd37iO+P7xj49ioVCU5ebA==
X-Received: by 2002:a05:600c:1f93:b0:477:ef0:c45f with SMTP id 5b1f17b1804b1-4771e34aa9fmr13152535e9.16.1761722073966;
        Wed, 29 Oct 2025 00:14:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4771e222895sm32785405e9.13.2025.10.29.00.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 00:14:33 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:14:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
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
Message-ID: <20251029071430.yXWDRrnQnBruTL8_I77cSlut9JkT09EvUGSOETVBB1M@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   27143c677cd93a347826a8702540f4b7cdb0d14e
commit: 8d1fc26e2f13344cd4d4f0552d6f0eaaade83913 [12/16] vsock: Add memory sharing support
config: x86_64-randconfig-161-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291001.CGX6PpWu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510291001.CGX6PpWu-lkp@intel.com/

smatch warnings:
net/vmw_vsock/af_vsock.c:2292 vsock_connectible_sendmsg() warn: inconsistent returns 'sk'.

vim +/sk +2292 net/vmw_vsock/af_vsock.c

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
                                                        ^^^^^^^^^^^^^

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

release_sock(sk) before returning?

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

Here too.

8d1fc26e2f1334 Viresh Kumar       2025-10-15  2120  
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2121  				memcpy(&desc, CMSG_DATA(cmsg), sizeof(desc));
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2122  
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2123  				if (desc.fd < 0)
8d1fc26e2f1334 Viresh Kumar       2025-10-15  2124  					return -EINVAL;

Same.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

