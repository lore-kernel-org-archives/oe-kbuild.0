Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A3C345CAE
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 20:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762373681; cv=none; b=kmRYgd5zNSNiXz3C3DY7KlJXkahKpd+hIVWfVI7lHyugBKu4ikBRws0Xc239kHb3hwlqUkkhXDm4HXlgFFNVLK+CjzeCQ8tUHZSxRkkBK4Tcsfcz2dJcdPM8tXf39GkkTHgIqjMGX8CCKEPQwRbXUpaXb6AZG2K5PPveVTB9Pso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762373681; c=relaxed/simple;
	bh=Vxu4Sc9M8LI+s1pHHEE9v+ZAMN7wKOsDLO+KqPL8fx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JDedOGOyVpiI7qEQC8gz39QIXmmxCdbIq0lDfxIziliXEFRx/9mbqtXEbC0xpA5+HAGeAvnc3wkPMubsK+ZsmJTa+o8EeJI6nxV3cYEV4ffAKPgIP9sEluXRsMtekoiPRUAWzDxelMrGsOUO6qAMuDvi9JNouPrNQ9PMq1F0Ak0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JCjWnfim; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCjWnfim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762373680; x=1793909680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vxu4Sc9M8LI+s1pHHEE9v+ZAMN7wKOsDLO+KqPL8fx8=;
  b=JCjWnfim7kmlMJw/40xTCHlV1fNAAAhiE+RzOtH4wNR7FkjN77EwAVKd
   EckQbysPlGXrQ5E/6OPu2Hp+DdsFnAs5Hf+JzMyERdfsWGaCAWXCMhKdo
   Z3AjgwJYlond1VSNJoPxlfR/E3o7WvZDZUQuBcoxNaoH2CdKDd0JCxl3y
   ULWDvv3KZSn+oNBiYjz7C1iaDVpAc9//kpGKRhbFiSiFeeyFok21evPGV
   OYvcmXB45gze3vLrETYZoYqQfTpcI9onDWsrPUZVaCYIRWF94zO1B35ph
   QWqm8jct53ErH1GVjZscCP3nlLB+tGzgcSuQ/G60GBwHcNKUj41M9iiVN
   w==;
X-CSE-ConnectionGUID: 7dU32H6XSY+JQEEi5VWbdA==
X-CSE-MsgGUID: jBcqmEo4Qg6HuTHQYQh9eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="74791603"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="74791603"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 12:14:39 -0800
X-CSE-ConnectionGUID: BVQoKLNpTbGqsgFbVMcE9Q==
X-CSE-MsgGUID: bAAXQI2NQseQezg734bLtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="218207801"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Nov 2025 12:14:38 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGjtr-000T5E-0x;
	Wed, 05 Nov 2025 20:14:35 +0000
Date: Thu, 6 Nov 2025 04:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v6 3/6] net: devmem: prepare for autorelease rx
 token management
Message-ID: <202511060352.2kPPX3xE-lkp@intel.com>
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
In-Reply-To: <20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-3-ea98cf4d40b3@meta.com>
References: <20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-3-ea98cf4d40b3@meta.com>
TO: Bobby Eshleman <bobbyeshleman@gmail.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Simon Horman <horms@kernel.org>
TO: Kuniyuki Iwashima <kuniyu@google.com>
TO: Willem de Bruijn <willemb@google.com>
TO: Neal Cardwell <ncardwell@google.com>
TO: David Ahern <dsahern@kernel.org>
TO: Arnd Bergmann <arnd@arndb.de>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Andrew Lunn <andrew+netdev@lunn.ch>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: Mina Almasry <almasrymina@google.com>
CC: linux-kernel@vger.kernel.org
CC: linux-arch@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: Stanislav Fomichev <sdf@fomichev.me>
CC: Bobby Eshleman <bobbyeshleman@meta.com>

Hi Bobby,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 255d75ef029f33f75fcf5015052b7302486f7ad2]

url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/net-devmem-rename-tx_vec-to-vec-in-dmabuf-binding/20251105-092703
base:   255d75ef029f33f75fcf5015052b7302486f7ad2
patch link:    https://lore.kernel.org/r/20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-3-ea98cf4d40b3%40meta.com
patch subject: [PATCH net-next v6 3/6] net: devmem: prepare for autorelease rx token management
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: nios2-randconfig-r071-20251105 (https://download.01.org/0day-ci/archive/20251106/202511060352.2kPPX3xE-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511060352.2kPPX3xE-lkp@intel.com/

New smatch warnings:
net/ipv4/tcp.c:2626 tcp_recvmsg_dmabuf() error: uninitialized symbol 'refs'.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.
net/ipv4/tcp.c:2479 tcp_xa_pool_refill() error: uninitialized symbol 'err'.
net/ipv4/tcp.c:2661 tcp_recvmsg_dmabuf() error: uninitialized symbol 'refs'.
net/ipv4/tcp.c:2827 tcp_recvmsg_locked() error: uninitialized symbol 'peek_seq'.

vim +/refs +2626 net/ipv4/tcp.c

8f0b3cc9a4c102 Mina Almasry       2024-09-10  2481  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2482  /* On error, returns the -errno. On success, returns number of bytes sent to the
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2483   * user. May not consume all of @remaining_len.
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2484   */
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2485  static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *skb,
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2486  			      unsigned int offset, struct msghdr *msg,
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2487  			      int remaining_len)
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2488  {
45aa39492cf4dd Bobby Eshleman     2025-11-04  2489  	struct net_devmem_dmabuf_binding *binding = NULL;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2490  	struct dmabuf_cmsg dmabuf_cmsg = { 0 };
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2491  	struct tcp_xa_pool tcp_xa_pool;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2492  	unsigned int start;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2493  	int i, copy, n;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2494  	int sent = 0;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2495  	int err = 0;
45aa39492cf4dd Bobby Eshleman     2025-11-04  2496  	int refs;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2497  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2498  	tcp_xa_pool.max = 0;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2499  	tcp_xa_pool.idx = 0;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2500  	do {
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2501  		start = skb_headlen(skb);
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2502  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2503  		if (skb_frags_readable(skb)) {
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2504  			err = -ENODEV;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2505  			goto out;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2506  		}
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2507  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2508  		/* Copy header. */
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2509  		copy = start - offset;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2510  		if (copy > 0) {
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2511  			copy = min(copy, remaining_len);
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2512  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2513  			n = copy_to_iter(skb->data + offset, copy,
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2514  					 &msg->msg_iter);
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2515  			if (n != copy) {
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2516  				err = -EFAULT;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2517  				goto out;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2518  			}
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2519  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2520  			offset += copy;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2521  			remaining_len -= copy;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2522  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2523  			/* First a dmabuf_cmsg for # bytes copied to user
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2524  			 * buffer.
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2525  			 */
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2526  			memset(&dmabuf_cmsg, 0, sizeof(dmabuf_cmsg));
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2527  			dmabuf_cmsg.frag_size = copy;
18912c520674ec Stanislav Fomichev 2025-02-24  2528  			err = put_cmsg_notrunc(msg, SOL_SOCKET,
18912c520674ec Stanislav Fomichev 2025-02-24  2529  					       SO_DEVMEM_LINEAR,
18912c520674ec Stanislav Fomichev 2025-02-24  2530  					       sizeof(dmabuf_cmsg),
18912c520674ec Stanislav Fomichev 2025-02-24  2531  					       &dmabuf_cmsg);
18912c520674ec Stanislav Fomichev 2025-02-24  2532  			if (err)
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2533  				goto out;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2534  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2535  			sent += copy;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2536  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2537  			if (remaining_len == 0)
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2538  				goto out;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2539  		}
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2540  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2541  		/* after that, send information of dmabuf pages through a
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2542  		 * sequence of cmsg
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2543  		 */
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2544  		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2545  			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2546  			struct net_iov *niov;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2547  			u64 frag_offset;
45aa39492cf4dd Bobby Eshleman     2025-11-04  2548  			u32 token;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2549  			int end;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2550  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2551  			/* !skb_frags_readable() should indicate that ALL the
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2552  			 * frags in this skb are dmabuf net_iovs. We're checking
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2553  			 * for that flag above, but also check individual frags
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2554  			 * here. If the tcp stack is not setting
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2555  			 * skb_frags_readable() correctly, we still don't want
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2556  			 * to crash here.
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2557  			 */
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2558  			if (!skb_frag_net_iov(frag)) {
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2559  				net_err_ratelimited("Found non-dmabuf skb with net_iov");
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2560  				err = -ENODEV;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2561  				goto out;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2562  			}
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2563  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2564  			niov = skb_frag_net_iov(frag);
69e39537b66232 Pavel Begunkov     2025-02-04  2565  			if (!net_is_devmem_iov(niov)) {
69e39537b66232 Pavel Begunkov     2025-02-04  2566  				err = -ENODEV;
69e39537b66232 Pavel Begunkov     2025-02-04  2567  				goto out;
69e39537b66232 Pavel Begunkov     2025-02-04  2568  			}
69e39537b66232 Pavel Begunkov     2025-02-04  2569  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2570  			end = start + skb_frag_size(frag);
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2571  			copy = end - offset;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2572  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2573  			if (copy > 0) {
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2574  				copy = min(copy, remaining_len);
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2575  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2576  				frag_offset = net_iov_virtual_addr(niov) +
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2577  					      skb_frag_off(frag) + offset -
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2578  					      start;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2579  				dmabuf_cmsg.frag_offset = frag_offset;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2580  				dmabuf_cmsg.frag_size = copy;
45aa39492cf4dd Bobby Eshleman     2025-11-04  2581  
45aa39492cf4dd Bobby Eshleman     2025-11-04  2582  				binding = net_devmem_iov_binding(niov);
45aa39492cf4dd Bobby Eshleman     2025-11-04  2583  
45aa39492cf4dd Bobby Eshleman     2025-11-04  2584  				if (!sk->sk_devmem_info.binding)
45aa39492cf4dd Bobby Eshleman     2025-11-04  2585  					sk->sk_devmem_info.binding = binding;
45aa39492cf4dd Bobby Eshleman     2025-11-04  2586  
45aa39492cf4dd Bobby Eshleman     2025-11-04  2587  				if (sk->sk_devmem_info.binding != binding) {
45aa39492cf4dd Bobby Eshleman     2025-11-04  2588  					err = -EFAULT;
45aa39492cf4dd Bobby Eshleman     2025-11-04  2589  					goto out;
45aa39492cf4dd Bobby Eshleman     2025-11-04  2590  				}
45aa39492cf4dd Bobby Eshleman     2025-11-04  2591  
45aa39492cf4dd Bobby Eshleman     2025-11-04  2592  				if (sk->sk_devmem_info.autorelease) {
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2593  					err = tcp_xa_pool_refill(sk, &tcp_xa_pool,
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2594  								 skb_shinfo(skb)->nr_frags - i);
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2595  					if (err)
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2596  						goto out;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2597  
45aa39492cf4dd Bobby Eshleman     2025-11-04  2598  					dmabuf_cmsg.frag_token =
45aa39492cf4dd Bobby Eshleman     2025-11-04  2599  						tcp_xa_pool.tokens[tcp_xa_pool.idx];
45aa39492cf4dd Bobby Eshleman     2025-11-04  2600  				} else {
45aa39492cf4dd Bobby Eshleman     2025-11-04  2601  					token = net_iov_virtual_addr(niov) >> PAGE_SHIFT;
45aa39492cf4dd Bobby Eshleman     2025-11-04  2602  					dmabuf_cmsg.frag_token = token;
45aa39492cf4dd Bobby Eshleman     2025-11-04  2603  				}
45aa39492cf4dd Bobby Eshleman     2025-11-04  2604  
45aa39492cf4dd Bobby Eshleman     2025-11-04  2605  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2606  				/* Will perform the exchange later */
297d389e9e5bd4 Pavel Begunkov     2025-02-04  2607  				dmabuf_cmsg.dmabuf_id = net_devmem_iov_binding_id(niov);
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2608  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2609  				offset += copy;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2610  				remaining_len -= copy;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2611  
18912c520674ec Stanislav Fomichev 2025-02-24  2612  				err = put_cmsg_notrunc(msg, SOL_SOCKET,
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2613  						       SO_DEVMEM_DMABUF,
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2614  						       sizeof(dmabuf_cmsg),
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2615  						       &dmabuf_cmsg);
18912c520674ec Stanislav Fomichev 2025-02-24  2616  				if (err)
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2617  					goto out;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2618  
45aa39492cf4dd Bobby Eshleman     2025-11-04  2619  				if (sk->sk_devmem_info.autorelease) {
45aa39492cf4dd Bobby Eshleman     2025-11-04  2620  					atomic_long_inc(&niov->pp_ref_count);
45aa39492cf4dd Bobby Eshleman     2025-11-04  2621  					tcp_xa_pool.netmems[tcp_xa_pool.idx++] =
45aa39492cf4dd Bobby Eshleman     2025-11-04  2622  						skb_frag_netmem(frag);
45aa39492cf4dd Bobby Eshleman     2025-11-04  2623  				} else {
45aa39492cf4dd Bobby Eshleman     2025-11-04  2624  					if (atomic_inc_return(&niov->uref) == 1)
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2625  						atomic_long_inc(&niov->pp_ref_count);
45aa39492cf4dd Bobby Eshleman     2025-11-04 @2626  					refs++;
45aa39492cf4dd Bobby Eshleman     2025-11-04  2627  				}
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2628  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2629  				sent += copy;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2630  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2631  				if (remaining_len == 0)
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2632  					goto out;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2633  			}
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2634  			start = end;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2635  		}
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2636  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2637  		tcp_xa_pool_commit(sk, &tcp_xa_pool);
45aa39492cf4dd Bobby Eshleman     2025-11-04  2638  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2639  		if (!remaining_len)
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2640  			goto out;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2641  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2642  		/* if remaining_len is not satisfied yet, we need to go to the
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2643  		 * next frag in the frag_list to satisfy remaining_len.
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2644  		 */
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2645  		skb = skb_shinfo(skb)->frag_list ?: skb->next;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2646  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2647  		offset = offset - start;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2648  	} while (skb);
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2649  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2650  	if (remaining_len) {
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2651  		err = -EFAULT;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2652  		goto out;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2653  	}
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2654  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2655  out:
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2656  	tcp_xa_pool_commit(sk, &tcp_xa_pool);
45aa39492cf4dd Bobby Eshleman     2025-11-04  2657  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2658  	if (!sent)
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2659  		sent = err;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2660  
45aa39492cf4dd Bobby Eshleman     2025-11-04  2661  	if (refs > 0)
45aa39492cf4dd Bobby Eshleman     2025-11-04  2662  		atomic_add(refs, &sk->sk_devmem_info.outstanding_urefs);
45aa39492cf4dd Bobby Eshleman     2025-11-04  2663  
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2664  	return sent;
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2665  }
8f0b3cc9a4c102 Mina Almasry       2024-09-10  2666  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
