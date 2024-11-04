Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC4D1CB318
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 18:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730743355; cv=none; b=jxssB28d5AaS8fBxY/pewLd4aE3v2sR6rktSE8gqWiWC42aL47GstSlTuLs3JPxIBLTL7ro0YeAZzrKF6toZaVVHXQrW/a8pEb4aGqOSGqQKeN6fHwR0yGaxp8We93q3YHuAcfmvSSmKhRTL31mBwupBnv3fcGliqfLQg1Ih6Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730743355; c=relaxed/simple;
	bh=yiVl1s+zNH7dW39I1ewG1GMclpdbO2ybvKsg0FMo3sA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dIV79cXKkTIez7yE2yKdG5fOpWfn6u8nIbPf0qZGS0g7U/XpNnD0CvdkL1jEYNoFwQzLZKw+y87RSWuSXC2ZZyVQrqO5U5pWKV6fYGBHAnvkSG3/XelJoe1yPJ3oj7Au44FERR+gDdS743V+NYFQIRDCj3Bl9NRnqbc0vbeB0g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOAJDC1e; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOAJDC1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730743353; x=1762279353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yiVl1s+zNH7dW39I1ewG1GMclpdbO2ybvKsg0FMo3sA=;
  b=HOAJDC1ejY0wS/Kcy50Gxut/vEA0ysBYsozFRC9XtHBj4+CnVwkEispL
   M1/fThCdtVChQHFb0Q5bEweRLQbWRz/3r26i/aDoZhcaHUP27X1WjUE1/
   keqVBFa3uRLkBjFKuBA//3B+qf9MZHP7QIr90yQduqlN3Yqmyh3pMoOGR
   NrWqwKCEk7UVoSJT1ltAkK7kyZPQ9wT2TQZ8SCOavPy7fJVmkeAGJu7/Q
   QjRVsKIN6mHLvgpnMmKEZAi5TIbePte+Q1rkfbHfWTOpxZxLA58HWSGMz
   uMdgwNPWgKF88fwCVt/IQicZg8H55fyAx6B6psmPHpqZ3pd7o9RSn7laV
   Q==;
X-CSE-ConnectionGUID: WgrlEGXRQd+Q/E3fEmQsVA==
X-CSE-MsgGUID: 3Rgrl/n1TpWAQr7adPBGMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30307902"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30307902"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 10:02:31 -0800
X-CSE-ConnectionGUID: S6R4+HtZRje1mKLNJ4SsbQ==
X-CSE-MsgGUID: 1EHOSZl7Siy25wUZrKik1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="87669013"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2024 10:02:29 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t81PG-000l65-1i;
	Mon, 04 Nov 2024 18:02:26 +0000
Date: Tue, 5 Nov 2024 02:01:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2350/2350] net/rxrpc/sendmsg.c:471
 rxrpc_send_data() error: uninitialized symbol 'skb'.
Message-ID: <202411050217.vVYcKY88-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Zheng Zengkai <zhengzengkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   7435f796ba0cdd99338403d56a92dec9c0f89730
commit: 5a5d74ffcd49103d4781651bdb6a3e5175551dd6 [2350/2350] rxrpc: Fix locking in rxrpc's sendmsg
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 11 months ago
config: x86_64-randconfig-161-20241103 (https://download.01.org/0day-ci/archive/20241105/202411050217.vVYcKY88-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411050217.vVYcKY88-lkp@intel.com/

New smatch warnings:
net/rxrpc/sendmsg.c:471 rxrpc_send_data() error: uninitialized symbol 'skb'.

Old smatch warnings:
net/rxrpc/sendmsg.c:818 rxrpc_kernel_send_data() warn: argument 2 to %lu specifier is cast from pointer
net/rxrpc/sendmsg.c:818 rxrpc_kernel_send_data() warn: argument 3 to %lx specifier is cast from pointer
net/rxrpc/sendmsg.c:818 rxrpc_kernel_send_data() warn: argument 5 to %lu specifier is cast from pointer
net/rxrpc/sendmsg.c:818 rxrpc_kernel_send_data() warn: argument 6 to %lx specifier is cast from pointer
net/rxrpc/sendmsg.c:819 rxrpc_kernel_send_data() warn: argument 2 to %lu specifier is cast from pointer
net/rxrpc/sendmsg.c:819 rxrpc_kernel_send_data() warn: argument 3 to %lx specifier is cast from pointer
net/rxrpc/sendmsg.c:819 rxrpc_kernel_send_data() warn: argument 5 to %lu specifier is cast from pointer
net/rxrpc/sendmsg.c:819 rxrpc_kernel_send_data() warn: argument 6 to %lx specifier is cast from pointer

vim +/skb +471 net/rxrpc/sendmsg.c

0b58b8a18be4932 David Howells 2016-09-02  281  
0b58b8a18be4932 David Howells 2016-09-02  282  /*
0b58b8a18be4932 David Howells 2016-09-02  283   * send data through a socket
0b58b8a18be4932 David Howells 2016-09-02  284   * - must be called in process context
540b1c48c37ac0a David Howells 2017-02-27  285   * - The caller holds the call user access mutex, but not the socket lock.
0b58b8a18be4932 David Howells 2016-09-02  286   */
0b58b8a18be4932 David Howells 2016-09-02  287  static int rxrpc_send_data(struct rxrpc_sock *rx,
0b58b8a18be4932 David Howells 2016-09-02  288  			   struct rxrpc_call *call,
e833251ad813168 David Howells 2017-08-29  289  			   struct msghdr *msg, size_t len,
5a5d74ffcd49103 David Howells 2022-12-02  290  			   rxrpc_notify_end_tx_t notify_end_tx,
5a5d74ffcd49103 David Howells 2022-12-02  291  			   bool *_dropped_lock)
0b58b8a18be4932 David Howells 2016-09-02  292  {
0b58b8a18be4932 David Howells 2016-09-02  293  	struct rxrpc_skb_priv *sp;
0b58b8a18be4932 David Howells 2016-09-02  294  	struct sk_buff *skb;
0b58b8a18be4932 David Howells 2016-09-02  295  	struct sock *sk = &rx->sk;
5a5d74ffcd49103 David Howells 2022-12-02  296  	enum rxrpc_call_state state;
0b58b8a18be4932 David Howells 2016-09-02  297  	long timeo;
5a5d74ffcd49103 David Howells 2022-12-02  298  	bool more = msg->msg_flags & MSG_MORE;
5a5d74ffcd49103 David Howells 2022-12-02  299  	int ret, copied = 0;
0b58b8a18be4932 David Howells 2016-09-02  300  
0b58b8a18be4932 David Howells 2016-09-02  301  	timeo = sock_sndtimeo(sk, msg->msg_flags & MSG_DONTWAIT);
0b58b8a18be4932 David Howells 2016-09-02  302  
0b58b8a18be4932 David Howells 2016-09-02  303  	/* this should be in poll */
0b58b8a18be4932 David Howells 2016-09-02  304  	sk_clear_bit(SOCKWQ_ASYNC_NOSPACE, sk);
0b58b8a18be4932 David Howells 2016-09-02  305  
5a5d74ffcd49103 David Howells 2022-12-02  306  reload:
5a5d74ffcd49103 David Howells 2022-12-02  307  	ret = -EPIPE;
639f181f0ee20d3 David Howells 2020-07-20  308  	if (sk->sk_shutdown & SEND_SHUTDOWN)
5a5d74ffcd49103 David Howells 2022-12-02  309  		goto maybe_error;
5a5d74ffcd49103 David Howells 2022-12-02  310  	state = READ_ONCE(call->state);
5a5d74ffcd49103 David Howells 2022-12-02  311  	ret = -ESHUTDOWN;
5a5d74ffcd49103 David Howells 2022-12-02  312  	if (state >= RXRPC_CALL_COMPLETE)
5a5d74ffcd49103 David Howells 2022-12-02  313  		goto maybe_error;
5a5d74ffcd49103 David Howells 2022-12-02  314  	ret = -EPROTO;
5a5d74ffcd49103 David Howells 2022-12-02  315  	if (state != RXRPC_CALL_CLIENT_SEND_REQUEST &&
5a5d74ffcd49103 David Howells 2022-12-02  316  	    state != RXRPC_CALL_SERVER_ACK_REQUEST &&
5a5d74ffcd49103 David Howells 2022-12-02  317  	    state != RXRPC_CALL_SERVER_SEND_REPLY)
5a5d74ffcd49103 David Howells 2022-12-02  318  		goto maybe_error;
0b58b8a18be4932 David Howells 2016-09-02  319  
5a5d74ffcd49103 David Howells 2022-12-02  320  	ret = -EMSGSIZE;
e754eba685aac2a David Howells 2017-06-07  321  	if (call->tx_total_len != -1) {
5a5d74ffcd49103 David Howells 2022-12-02  322  		if (len - copied > call->tx_total_len)
5a5d74ffcd49103 David Howells 2022-12-02  323  			goto maybe_error;
5a5d74ffcd49103 David Howells 2022-12-02  324  		if (!more && len - copied != call->tx_total_len)
5a5d74ffcd49103 David Howells 2022-12-02  325  			goto maybe_error;
e754eba685aac2a David Howells 2017-06-07  326  	}
e754eba685aac2a David Howells 2017-06-07  327  
0b58b8a18be4932 David Howells 2016-09-02  328  	skb = call->tx_pending;
0b58b8a18be4932 David Howells 2016-09-02  329  	call->tx_pending = NULL;
987db9f7cd1e77e David Howells 2019-08-19  330  	rxrpc_see_skb(skb, rxrpc_skb_seen);
0b58b8a18be4932 David Howells 2016-09-02  331  
0b58b8a18be4932 David Howells 2016-09-02  332  	do {
7aa51da7c88d42c David Howells 2016-09-22  333  		/* Check to see if there's a ping ACK to reply to. */
7aa51da7c88d42c David Howells 2016-09-22  334  		if (call->ackr_reason == RXRPC_ACK_PING_RESPONSE)
bd1fdf8cfdf3fdb David Howells 2017-11-24  335  			rxrpc_send_ack_packet(call, false, NULL);
7aa51da7c88d42c David Howells 2016-09-22  336  
0b58b8a18be4932 David Howells 2016-09-02  337  		if (!skb) {
0b58b8a18be4932 David Howells 2016-09-02  338  			size_t size, chunk, max, space;
0b58b8a18be4932 David Howells 2016-09-02  339  
0b58b8a18be4932 David Howells 2016-09-02  340  			_debug("alloc");
0b58b8a18be4932 David Howells 2016-09-02  341  
5a5d74ffcd49103 David Howells 2022-12-02  342  			if (!rxrpc_check_tx_space(call, NULL))
5a5d74ffcd49103 David Howells 2022-12-02  343  				goto wait_for_space;
0b58b8a18be4932 David Howells 2016-09-02  344  
182f50562490e58 David Howells 2016-09-17  345  			max = RXRPC_JUMBO_DATALEN;
0b58b8a18be4932 David Howells 2016-09-02  346  			max -= call->conn->security_size;
0b58b8a18be4932 David Howells 2016-09-02  347  			max &= ~(call->conn->size_align - 1UL);
0b58b8a18be4932 David Howells 2016-09-02  348  
0b58b8a18be4932 David Howells 2016-09-02  349  			chunk = max;
0b58b8a18be4932 David Howells 2016-09-02  350  			if (chunk > msg_data_left(msg) && !more)
0b58b8a18be4932 David Howells 2016-09-02  351  				chunk = msg_data_left(msg);
0b58b8a18be4932 David Howells 2016-09-02  352  
0b58b8a18be4932 David Howells 2016-09-02  353  			space = chunk + call->conn->size_align;
0b58b8a18be4932 David Howells 2016-09-02  354  			space &= ~(call->conn->size_align - 1UL);
0b58b8a18be4932 David Howells 2016-09-02  355  
5a924b8951f835b David Howells 2016-09-22  356  			size = space + call->conn->security_size;
0b58b8a18be4932 David Howells 2016-09-02  357  
0b58b8a18be4932 David Howells 2016-09-02  358  			_debug("SIZE: %zu/%zu/%zu", chunk, space, size);
0b58b8a18be4932 David Howells 2016-09-02  359  
0b58b8a18be4932 David Howells 2016-09-02  360  			/* create a buffer that we can retain until it's ACK'd */
0b58b8a18be4932 David Howells 2016-09-02  361  			skb = sock_alloc_send_skb(
0b58b8a18be4932 David Howells 2016-09-02  362  				sk, size, msg->msg_flags & MSG_DONTWAIT, &ret);
0b58b8a18be4932 David Howells 2016-09-02  363  			if (!skb)
0b58b8a18be4932 David Howells 2016-09-02  364  				goto maybe_error;
0b58b8a18be4932 David Howells 2016-09-02  365  
b311e68420aa520 David Howells 2019-08-19  366  			sp = rxrpc_skb(skb);
b311e68420aa520 David Howells 2019-08-19  367  			sp->rx_flags |= RXRPC_SKB_TX_BUFFER;
987db9f7cd1e77e David Howells 2019-08-19  368  			rxrpc_new_skb(skb, rxrpc_skb_new);
0b58b8a18be4932 David Howells 2016-09-02  369  
0b58b8a18be4932 David Howells 2016-09-02  370  			_debug("ALLOC SEND %p", skb);
0b58b8a18be4932 David Howells 2016-09-02  371  
0b58b8a18be4932 David Howells 2016-09-02  372  			ASSERTCMP(skb->mark, ==, 0);
0b58b8a18be4932 David Howells 2016-09-02  373  
5a924b8951f835b David Howells 2016-09-22  374  			_debug("HS: %u", call->conn->security_size);
5a924b8951f835b David Howells 2016-09-22  375  			skb_reserve(skb, call->conn->security_size);
5a924b8951f835b David Howells 2016-09-22  376  			skb->len += call->conn->security_size;
0b58b8a18be4932 David Howells 2016-09-02  377  
0b58b8a18be4932 David Howells 2016-09-02  378  			sp->remain = chunk;
0b58b8a18be4932 David Howells 2016-09-02  379  			if (sp->remain > skb_tailroom(skb))
0b58b8a18be4932 David Howells 2016-09-02  380  				sp->remain = skb_tailroom(skb);
0b58b8a18be4932 David Howells 2016-09-02  381  
0b58b8a18be4932 David Howells 2016-09-02  382  			_net("skb: hr %d, tr %d, hl %d, rm %d",
0b58b8a18be4932 David Howells 2016-09-02  383  			       skb_headroom(skb),
0b58b8a18be4932 David Howells 2016-09-02  384  			       skb_tailroom(skb),
0b58b8a18be4932 David Howells 2016-09-02  385  			       skb_headlen(skb),
0b58b8a18be4932 David Howells 2016-09-02  386  			       sp->remain);
0b58b8a18be4932 David Howells 2016-09-02  387  
0b58b8a18be4932 David Howells 2016-09-02  388  			skb->ip_summed = CHECKSUM_UNNECESSARY;
0b58b8a18be4932 David Howells 2016-09-02  389  		}
0b58b8a18be4932 David Howells 2016-09-02  390  
0b58b8a18be4932 David Howells 2016-09-02  391  		_debug("append");
0b58b8a18be4932 David Howells 2016-09-02  392  		sp = rxrpc_skb(skb);
0b58b8a18be4932 David Howells 2016-09-02  393  
0b58b8a18be4932 David Howells 2016-09-02  394  		/* append next segment of data to the current buffer */
0b58b8a18be4932 David Howells 2016-09-02  395  		if (msg_data_left(msg) > 0) {
0b58b8a18be4932 David Howells 2016-09-02  396  			int copy = skb_tailroom(skb);
0b58b8a18be4932 David Howells 2016-09-02  397  			ASSERTCMP(copy, >, 0);
0b58b8a18be4932 David Howells 2016-09-02  398  			if (copy > msg_data_left(msg))
0b58b8a18be4932 David Howells 2016-09-02  399  				copy = msg_data_left(msg);
0b58b8a18be4932 David Howells 2016-09-02  400  			if (copy > sp->remain)
0b58b8a18be4932 David Howells 2016-09-02  401  				copy = sp->remain;
0b58b8a18be4932 David Howells 2016-09-02  402  
0b58b8a18be4932 David Howells 2016-09-02  403  			_debug("add");
0b58b8a18be4932 David Howells 2016-09-02  404  			ret = skb_add_data(skb, &msg->msg_iter, copy);
0b58b8a18be4932 David Howells 2016-09-02  405  			_debug("added");
0b58b8a18be4932 David Howells 2016-09-02  406  			if (ret < 0)
0b58b8a18be4932 David Howells 2016-09-02  407  				goto efault;
0b58b8a18be4932 David Howells 2016-09-02  408  			sp->remain -= copy;
0b58b8a18be4932 David Howells 2016-09-02  409  			skb->mark += copy;
0b58b8a18be4932 David Howells 2016-09-02  410  			copied += copy;
e754eba685aac2a David Howells 2017-06-07  411  			if (call->tx_total_len != -1)
e754eba685aac2a David Howells 2017-06-07  412  				call->tx_total_len -= copy;
0b58b8a18be4932 David Howells 2016-09-02  413  		}
0b58b8a18be4932 David Howells 2016-09-02  414  
e122d845a01ece2 David Howells 2019-01-10  415  		/* check for the far side aborting the call or a network error
e122d845a01ece2 David Howells 2019-01-10  416  		 * occurring */
e122d845a01ece2 David Howells 2019-01-10  417  		if (call->state == RXRPC_CALL_COMPLETE)
e122d845a01ece2 David Howells 2019-01-10  418  			goto call_terminated;
e122d845a01ece2 David Howells 2019-01-10  419  
0b58b8a18be4932 David Howells 2016-09-02  420  		/* add the packet to the send queue if it's now full */
0b58b8a18be4932 David Howells 2016-09-02  421  		if (sp->remain <= 0 ||
0b58b8a18be4932 David Howells 2016-09-02  422  		    (msg_data_left(msg) == 0 && !more)) {
0b58b8a18be4932 David Howells 2016-09-02  423  			struct rxrpc_connection *conn = call->conn;
0b58b8a18be4932 David Howells 2016-09-02  424  			uint32_t seq;
0b58b8a18be4932 David Howells 2016-09-02  425  			size_t pad;
0b58b8a18be4932 David Howells 2016-09-02  426  
0b58b8a18be4932 David Howells 2016-09-02  427  			/* pad out if we're using security */
0b58b8a18be4932 David Howells 2016-09-02  428  			if (conn->security_ix) {
0b58b8a18be4932 David Howells 2016-09-02  429  				pad = conn->security_size + skb->mark;
0b58b8a18be4932 David Howells 2016-09-02  430  				pad = conn->size_align - pad;
0b58b8a18be4932 David Howells 2016-09-02  431  				pad &= conn->size_align - 1;
0b58b8a18be4932 David Howells 2016-09-02  432  				_debug("pad %zu", pad);
0b58b8a18be4932 David Howells 2016-09-02  433  				if (pad)
b080db585384b9f Johannes Berg 2017-06-16  434  					skb_put_zero(skb, pad);
0b58b8a18be4932 David Howells 2016-09-02  435  			}
0b58b8a18be4932 David Howells 2016-09-02  436  
248f219cb8bcbfb David Howells 2016-09-08  437  			seq = call->tx_top + 1;
0b58b8a18be4932 David Howells 2016-09-02  438  
0b58b8a18be4932 David Howells 2016-09-02  439  			sp->hdr.seq	= seq;
0b58b8a18be4932 David Howells 2016-09-02  440  			sp->hdr._rsvd	= 0;
0b58b8a18be4932 David Howells 2016-09-02  441  			sp->hdr.flags	= conn->out_clientflag;
5a924b8951f835b David Howells 2016-09-22  442  
0b58b8a18be4932 David Howells 2016-09-02  443  			if (msg_data_left(msg) == 0 && !more)
0b58b8a18be4932 David Howells 2016-09-02  444  				sp->hdr.flags |= RXRPC_LAST_PACKET;
248f219cb8bcbfb David Howells 2016-09-08  445  			else if (call->tx_top - call->tx_hard_ack <
248f219cb8bcbfb David Howells 2016-09-08  446  				 call->tx_winsize)
0b58b8a18be4932 David Howells 2016-09-02  447  				sp->hdr.flags |= RXRPC_MORE_PACKETS;
0b58b8a18be4932 David Howells 2016-09-02  448  
91fcfbe8852edb9 David Howells 2019-10-07  449  			ret = call->security->secure_packet(
5a924b8951f835b David Howells 2016-09-22  450  				call, skb, skb->mark, skb->head);
0b58b8a18be4932 David Howells 2016-09-02  451  			if (ret < 0)
0b58b8a18be4932 David Howells 2016-09-02  452  				goto out;
0b58b8a18be4932 David Howells 2016-09-02  453  
8e8715aaa905f65 Marc Dionne   2019-04-12  454  			ret = rxrpc_queue_packet(rx, call, skb,
e833251ad813168 David Howells 2017-08-29  455  						 !msg_data_left(msg) && !more,
e833251ad813168 David Howells 2017-08-29  456  						 notify_end_tx);
8e8715aaa905f65 Marc Dionne   2019-04-12  457  			/* Should check for failure here */
0b58b8a18be4932 David Howells 2016-09-02  458  			skb = NULL;
0b58b8a18be4932 David Howells 2016-09-02  459  		}
0b58b8a18be4932 David Howells 2016-09-02  460  	} while (msg_data_left(msg) > 0);
0b58b8a18be4932 David Howells 2016-09-02  461  
0b58b8a18be4932 David Howells 2016-09-02  462  success:
0b58b8a18be4932 David Howells 2016-09-02  463  	ret = copied;
504deca5022022a David Howells 2022-09-29  464  	if (READ_ONCE(call->state) == RXRPC_CALL_COMPLETE) {
504deca5022022a David Howells 2022-09-29  465  		read_lock_bh(&call->state_lock);
504deca5022022a David Howells 2022-09-29  466  		if (call->error < 0)
504deca5022022a David Howells 2022-09-29  467  			ret = call->error;
504deca5022022a David Howells 2022-09-29  468  		read_unlock_bh(&call->state_lock);
504deca5022022a David Howells 2022-09-29  469  	}
0b58b8a18be4932 David Howells 2016-09-02  470  out:
0b58b8a18be4932 David Howells 2016-09-02 @471  	call->tx_pending = skb;
0b58b8a18be4932 David Howells 2016-09-02  472  	_leave(" = %d", ret);
0b58b8a18be4932 David Howells 2016-09-02  473  	return ret;
0b58b8a18be4932 David Howells 2016-09-02  474  
e122d845a01ece2 David Howells 2019-01-10  475  call_terminated:
987db9f7cd1e77e David Howells 2019-08-19  476  	rxrpc_free_skb(skb, rxrpc_skb_freed);
e122d845a01ece2 David Howells 2019-01-10  477  	_leave(" = %d", call->error);
e122d845a01ece2 David Howells 2019-01-10  478  	return call->error;
e122d845a01ece2 David Howells 2019-01-10  479  
0b58b8a18be4932 David Howells 2016-09-02  480  maybe_error:
0b58b8a18be4932 David Howells 2016-09-02  481  	if (copied)
0b58b8a18be4932 David Howells 2016-09-02  482  		goto success;
0b58b8a18be4932 David Howells 2016-09-02  483  	goto out;
0b58b8a18be4932 David Howells 2016-09-02  484  
0b58b8a18be4932 David Howells 2016-09-02  485  efault:
0b58b8a18be4932 David Howells 2016-09-02  486  	ret = -EFAULT;
0b58b8a18be4932 David Howells 2016-09-02  487  	goto out;
5a5d74ffcd49103 David Howells 2022-12-02  488  
5a5d74ffcd49103 David Howells 2022-12-02  489  wait_for_space:
5a5d74ffcd49103 David Howells 2022-12-02  490  	ret = -EAGAIN;
5a5d74ffcd49103 David Howells 2022-12-02  491  	if (msg->msg_flags & MSG_DONTWAIT)
5a5d74ffcd49103 David Howells 2022-12-02  492  		goto maybe_error;
5a5d74ffcd49103 David Howells 2022-12-02  493  	mutex_unlock(&call->user_mutex);
5a5d74ffcd49103 David Howells 2022-12-02  494  	*_dropped_lock = true;
5a5d74ffcd49103 David Howells 2022-12-02  495  	ret = rxrpc_wait_for_tx_window(rx, call, &timeo,
5a5d74ffcd49103 David Howells 2022-12-02  496  				       msg->msg_flags & MSG_WAITALL);
5a5d74ffcd49103 David Howells 2022-12-02  497  	if (ret < 0)
5a5d74ffcd49103 David Howells 2022-12-02  498  		goto maybe_error;
5a5d74ffcd49103 David Howells 2022-12-02  499  	if (call->interruptibility == RXRPC_INTERRUPTIBLE) {
5a5d74ffcd49103 David Howells 2022-12-02  500  		if (mutex_lock_interruptible(&call->user_mutex) < 0) {
5a5d74ffcd49103 David Howells 2022-12-02  501  			ret = sock_intr_errno(timeo);
5a5d74ffcd49103 David Howells 2022-12-02  502  			goto maybe_error;
5a5d74ffcd49103 David Howells 2022-12-02  503  		}
5a5d74ffcd49103 David Howells 2022-12-02  504  	} else {
5a5d74ffcd49103 David Howells 2022-12-02  505  		mutex_lock(&call->user_mutex);
5a5d74ffcd49103 David Howells 2022-12-02  506  	}
5a5d74ffcd49103 David Howells 2022-12-02  507  	*_dropped_lock = false;
5a5d74ffcd49103 David Howells 2022-12-02  508  	goto reload;
0b58b8a18be4932 David Howells 2016-09-02  509  }
df423a4af125f5b David Howells 2016-09-02  510  

:::::: The code at line 471 was first introduced by commit
:::::: 0b58b8a18be4932849ec88a820b08345c6528ea5 rxrpc: Split sendmsg from packet transmission code

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
