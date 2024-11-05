Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E3C1FE0F4
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 06:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730788637; cv=none; b=ATWOm05wXbwagSZZ5oM2ZcLmAQIGqFFnxs06Sly3eDUfsRsFQK4/SnFC6CesDBqD7kcZIf0anPIb1MUPONdx8SESmy+x81qaq6KL544xxCzRaQyXLOoack1L6IjHJuV0N5TvxCkb+f3yWXBBzmre3YWdkOjONJ+kA0PreoBhJwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730788637; c=relaxed/simple;
	bh=Su8aAtaBzY4C/hqUzePCMSSGK724DpLmH+I5a9kuKo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jRUL2BznXdrZd+TEPWIQMpTVDEDmqHZouNXnCoSKvyfWtxWdNin6BDB4nYZGDduWOR3GQJ0aMQBz14QhDZ1gBTSZ1eN2cfRbeE5w636NhKxW9adimQVRaMqVuazT6ll9ykGGgygw/RSpWhw6aVH5YwvPYXEaySs+ziaV5F60EvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DijaQAPU; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DijaQAPU"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5ceb75f9631so5064320a12.0
        for <oe-kbuild@lists.linux.dev>; Mon, 04 Nov 2024 22:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730788632; x=1731393432; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+WNu6vxL2kci2KEk4ZBb4bzXNQGNWCDr/n1sXNjfCCk=;
        b=DijaQAPUuAyt3D9h/UCs0whw+kRUt5JPGx0vPgby3aonttBdVkp0zNfQZ/1LlGojri
         rPAXy8a7bLVD6m9IFLb2ORbGtdvo7+Mp5sbBkaFtKIZG9o8ldeBALU93A/pF5OeMUNS+
         8R0Qb06Z7ujLGHZ9cxzIwbO3o82jQQ1HU58HP/WEZ6XZq2vzoJfuD5E8Lutpzu95pxVZ
         ZogW3MGibh7YKAnxz6C6WJrFhGdzgbm8T2Rzb5A9kVNko5LYBMYrEdiZ6NXx/5aJSBFH
         DmWtLu71T5/+FKdvAx81TtlqG1tawJwjdksp/x/eZJImXxsohGkgRDPE+/2WQctrOSXO
         lKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730788632; x=1731393432;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WNu6vxL2kci2KEk4ZBb4bzXNQGNWCDr/n1sXNjfCCk=;
        b=wq7NhJP1ETmR4DOpOGjUHf4uezBqLzLVQIYb2kjIhOGIda4OHg9O7/trJyIw4xZLnW
         JdQbOSxYEHaHn4H2BQXnrA4CgFGaJS74i78pjeghDFCzLL5zMyb4WURDIgB/fDnTto37
         ulZNMQ4SDySTLj5hFqD4DEIlw9dtt5spja35w1c6SmbZehgLl4m4bqIeS5p+bJMV51Cl
         FatnzVS2xa4kZChcwS1jB8OHb5cjkzMLBp1yitTrWsL6QX+Kr8qZWdpj3lREvXULPPNv
         tAc1jBPd7DyhAqEiUOPWTEXLpT09ju1uyObCqyvoTBROhST6gxJvLW4VlGsDR+cEsO0j
         SYPw==
X-Gm-Message-State: AOJu0YwhZ87pFfoXrxfzqqsuvrRK38BgwblATV5XrqEc1PIkRde5lqjB
	XJ8iwEQy/FYzkr6DBnMb6fwmNkcAF6hT17hc7oUywHo28/J4CnekYv80Hx0izhNn74QHpxQhMs6
	wmXSN9w==
X-Google-Smtp-Source: AGHT+IEw0TjNJQYuD9PXpUhLi54N1/pbpRHrodKx9NromPzYVShSWicHZCGTAC+gdLH11vbeEKw6gQ==
X-Received: by 2002:a05:6402:5112:b0:5ca:151a:b84c with SMTP id 4fb4d7f45d1cf-5cbbf8cb79amr25866641a12.18.1730788632417;
        Mon, 04 Nov 2024 22:37:12 -0800 (PST)
Received: from localhost ([77.241.232.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6ab082bsm835298a12.29.2024.11.04.22.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 22:37:12 -0800 (PST)
Date: Tue, 5 Nov 2024 09:37:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Zheng Zengkai <zhengzengkai@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2350/2350] net/rxrpc/sendmsg.c:471
 rxrpc_send_data() error: uninitialized symbol 'skb'.
Message-ID: <a93550a2-91bb-45e9-9297-682212268d94@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   7435f796ba0cdd99338403d56a92dec9c0f89730
commit: 5a5d74ffcd49103d4781651bdb6a3e5175551dd6 [2350/2350] rxrpc: Fix locking in rxrpc's sendmsg
config: x86_64-randconfig-161-20241103 (https://download.01.org/0day-ci/archive/20241105/202411050217.vVYcKY88-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411050217.vVYcKY88-lkp@intel.com/

New smatch warnings:
net/rxrpc/sendmsg.c:471 rxrpc_send_data() error: uninitialized symbol 'skb'.

vim +/skb +471 net/rxrpc/sendmsg.c

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

STEP 1: We hit this goto.  copied is false.

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

STEP 3: skb is uninitialized

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

STEP 2: goto out

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

