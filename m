Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376B77E
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Jan 2023 07:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673506852; x=1705042852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PieX38z7AnOlv1/5g3kSI7dc7MKKuvPE9MIsZeF8Ups=;
  b=krpAPqQGugPnluVsXiD6bWpkMGbUQ6XzzmS/85AEHlrRt8pehmnCS1is
   HWy9Nbfz3/CBX06aAvAVgya95H15P6SGdobatD4fTHa2xfsevsIN5eoMq
   A04GLCqgZwQF0Kv7lZ5tSInDo98gBQ2YjgMiQIK5YIzfRDhxBQ84JyjaC
   SzhxClektMSI/LAudUp1Pn+uZehVaNzdjhdDMaWIc3g0ZHu72wFP6inyM
   8khhF9MYmKCkEl3zN/sVEFeNkpwjjrLOc2YzbuIadxOeer1oxZzA+ZPrh
   eYWQOhVPuuC0rWmMz4Dz6ut5xfEbI1b2g9o0pv4Ai6VPQEFOQ7HSitKb0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="325654402"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="325654402"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 23:00:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607688625"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="607688625"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Jan 2023 23:00:49 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pFrZs-0009u4-1r;
	Thu, 12 Jan 2023 07:00:46 +0000
Date: Thu, 12 Jan 2023 15:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2183/4441] net/rxrpc/recvmsg.c:384:10: warning:
 Local variable 'len' shadows outer argument [shadowArgument]
Message-ID: <202301121446.F37ZBSRO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/rxrpc/recvmsg.c:384:10: warning: Local variable 'len' shadows outer argument [shadowArgument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a093b2893c711d82622a9ab27da4f1172821336
commit: 93368b6bd58ac49d804fdc9ab041a6dc89ebf1cc [2183/4441] rxrpc: Move call state changes from recvmsg to I/O thread
:::::: branch date: 4 hours ago
:::::: commit date: 6 days ago
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 93368b6bd58ac49d804fdc9ab041a6dc89ebf1cc
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> net/rxrpc/rxkad.c:341:10: warning: Local variable 'buf' shadows outer variable [shadowVariable]
     __be32 buf[2];
            ^
   net/rxrpc/rxkad.c:341:10: note: Shadowed declaration
     __be32 buf[2];
            ^
   net/rxrpc/rxkad.c:341:10: note: Shadow variable
     __be32 buf[2];
            ^
   net/rxrpc/rxkad.c:557:10: warning: Local variable 'buf' shadows outer variable [shadowVariable]
     __be32 buf[2];
            ^
   net/rxrpc/rxkad.c:557:10: note: Shadowed declaration
     __be32 buf[2];
            ^
   net/rxrpc/rxkad.c:557:10: note: Shadow variable
     __be32 buf[2];
            ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/rxrpc/recvmsg.c:384:10: warning: Local variable 'len' shadows outer argument [shadowArgument]
     size_t len = sizeof(call->dest_srx);
            ^
   net/rxrpc/recvmsg.c:278:67: note: Shadowed declaration
   int rxrpc_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
                                                                     ^
   net/rxrpc/recvmsg.c:384:10: note: Shadow variable
     size_t len = sizeof(call->dest_srx);
            ^
--
>> net/rxrpc/sendmsg.c:197:2: warning: Syntax Error: AST broken, 'txb' doesn't have a parent. [internalAstError]
    ASSERTCMP(txb->seq, ==, call->tx_prepared + 1);
    ^
--
>> net/rxrpc/rxkad.c:801:6: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]
    ret = key_validate(conn->key);
        ^
   net/rxrpc/rxkad.c:793:10: note: ret is initialized
    int ret = -EPROTO;
            ^
   net/rxrpc/rxkad.c:801:6: note: ret is overwritten
    ret = key_validate(conn->key);
        ^

vim +/len +384 net/rxrpc/recvmsg.c

17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  272  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  273  /*
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  274   * Receive a message from an RxRPC socket
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  275   * - we need to be careful about two or more threads calling recvmsg
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  276   *   simultaneously
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  277   */
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  278  int rxrpc_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  279  		  int flags)
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  280  {
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  281  	struct rxrpc_call *call;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  282  	struct rxrpc_sock *rx = rxrpc_sk(sock->sk);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  283  	struct list_head *l;
0e50d999903c00 net/rxrpc/recvmsg.c    David Howells 2022-12-24  284  	unsigned int call_debug_id = 0;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  285  	size_t copied = 0;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  286  	long timeo;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  287  	int ret;
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  288  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  289  	DEFINE_WAIT(wait);
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  290  
0e50d999903c00 net/rxrpc/recvmsg.c    David Howells 2022-12-24  291  	trace_rxrpc_recvmsg(0, rxrpc_recvmsg_enter, 0);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  292  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  293  	if (flags & (MSG_OOB | MSG_TRUNC))
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  294  		return -EOPNOTSUPP;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  295  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  296  	timeo = sock_rcvtimeo(&rx->sk, flags & MSG_DONTWAIT);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  297  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  298  try_again:
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  299  	lock_sock(&rx->sk);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  300  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  301  	/* Return immediately if a client socket has no outstanding calls */
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  302  	if (RB_EMPTY_ROOT(&rx->calls) &&
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  303  	    list_empty(&rx->recvmsg_q) &&
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  304  	    rx->sk.sk_state != RXRPC_SERVER_LISTENING) {
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  305  		release_sock(&rx->sk);
639f181f0ee20d net/rxrpc/recvmsg.c    David Howells 2020-07-20  306  		return -EAGAIN;
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  307  	}
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  308  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  309  	if (list_empty(&rx->recvmsg_q)) {
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  310  		ret = -EWOULDBLOCK;
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  311  		if (timeo == 0) {
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  312  			call = NULL;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  313  			goto error_no_call;
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  314  		}
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  315  
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  316  		release_sock(&rx->sk);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  317  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  318  		/* Wait for something to happen */
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  319  		prepare_to_wait_exclusive(sk_sleep(&rx->sk), &wait,
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  320  					  TASK_INTERRUPTIBLE);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  321  		ret = sock_error(&rx->sk);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  322  		if (ret)
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  323  			goto wait_error;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  324  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  325  		if (list_empty(&rx->recvmsg_q)) {
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  326  			if (signal_pending(current))
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  327  				goto wait_interrupted;
0e50d999903c00 net/rxrpc/recvmsg.c    David Howells 2022-12-24  328  			trace_rxrpc_recvmsg(0, rxrpc_recvmsg_wait, 0);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  329  			timeo = schedule_timeout(timeo);
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  330  		}
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  331  		finish_wait(sk_sleep(&rx->sk), &wait);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  332  		goto try_again;
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  333  	}
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  334  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  335  	/* Find the next call and dequeue it if we're not just peeking.  If we
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  336  	 * do dequeue it, that comes with a ref that we will need to release.
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  337  	 */
3dd9c8b5f09fd2 net/rxrpc/recvmsg.c    David Howells 2020-01-24  338  	write_lock(&rx->recvmsg_lock);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  339  	l = rx->recvmsg_q.next;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  340  	call = list_entry(l, struct rxrpc_call, recvmsg_link);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  341  	if (!(flags & MSG_PEEK))
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  342  		list_del_init(&call->recvmsg_link);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  343  	else
cb0fc0c9722c0c net/rxrpc/recvmsg.c    David Howells 2022-10-21  344  		rxrpc_get_call(call, rxrpc_call_get_recvmsg);
3dd9c8b5f09fd2 net/rxrpc/recvmsg.c    David Howells 2020-01-24  345  	write_unlock(&rx->recvmsg_lock);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  346  
0e50d999903c00 net/rxrpc/recvmsg.c    David Howells 2022-12-24  347  	call_debug_id = call->debug_id;
0e50d999903c00 net/rxrpc/recvmsg.c    David Howells 2022-12-24  348  	trace_rxrpc_recvmsg(call_debug_id, rxrpc_recvmsg_dequeue, 0);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  349  
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  350  	/* We're going to drop the socket lock, so we need to lock the call
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  351  	 * against interference by sendmsg.
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  352  	 */
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  353  	if (!mutex_trylock(&call->user_mutex)) {
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  354  		ret = -EWOULDBLOCK;
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  355  		if (flags & MSG_DONTWAIT)
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  356  			goto error_requeue_call;
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  357  		ret = -ERESTARTSYS;
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  358  		if (mutex_lock_interruptible(&call->user_mutex) < 0)
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  359  			goto error_requeue_call;
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  360  	}
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  361  
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  362  	release_sock(&rx->sk);
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  363  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  364  	if (test_bit(RXRPC_CALL_RELEASED, &call->flags))
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  365  		BUG();
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  366  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  367  	if (test_bit(RXRPC_CALL_HAS_USERID, &call->flags)) {
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  368  		if (flags & MSG_CMSG_COMPAT) {
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  369  			unsigned int id32 = call->user_call_ID;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  370  
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  371  			ret = put_cmsg(msg, SOL_RXRPC, RXRPC_USER_CALL_ID,
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  372  				       sizeof(unsigned int), &id32);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  373  		} else {
a16b8d0cf2ec1e net/rxrpc/recvmsg.c    David Howells 2018-02-15  374  			unsigned long idl = call->user_call_ID;
a16b8d0cf2ec1e net/rxrpc/recvmsg.c    David Howells 2018-02-15  375  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  376  			ret = put_cmsg(msg, SOL_RXRPC, RXRPC_USER_CALL_ID,
a16b8d0cf2ec1e net/rxrpc/recvmsg.c    David Howells 2018-02-15  377  				       sizeof(unsigned long), &idl);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  378  		}
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  379  		if (ret < 0)
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  380  			goto error_unlock_call;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  381  	}
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  382  
65550098c1c4db net/rxrpc/recvmsg.c    David Howells 2020-07-29  383  	if (msg->msg_name && call->peer) {
f3441d4125fc98 net/rxrpc/recvmsg.c    David Howells 2022-10-20 @384  		size_t len = sizeof(call->dest_srx);
68d6d1ae5c0429 net/rxrpc/recvmsg.c    David Howells 2017-06-05  385  
f3441d4125fc98 net/rxrpc/recvmsg.c    David Howells 2022-10-20  386  		memcpy(msg->msg_name, &call->dest_srx, len);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  387  		msg->msg_namelen = len;
f5c17aaeb2aee9 net/rxrpc/recvmsg.c    David Howells 2016-08-30  388  	}
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  389  
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  390  	ret = rxrpc_recvmsg_data(sock, call, msg, &msg->msg_iter, len,
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  391  				 flags, &copied);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  392  	if (ret == -EAGAIN)
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  393  		ret = 0;
93368b6bd58ac4 net/rxrpc/recvmsg.c    David Howells 2022-10-26  394  	if (ret == -EIO)
93368b6bd58ac4 net/rxrpc/recvmsg.c    David Howells 2022-10-26  395  		goto call_failed;
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  396  	if (ret < 0)
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  397  		goto error_unlock_call;
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  398  
93368b6bd58ac4 net/rxrpc/recvmsg.c    David Howells 2022-10-26  399  	if (rxrpc_call_is_complete(call) &&
93368b6bd58ac4 net/rxrpc/recvmsg.c    David Howells 2022-10-26  400  	    skb_queue_empty(&call->recvmsg_queue))
93368b6bd58ac4 net/rxrpc/recvmsg.c    David Howells 2022-10-26  401  		goto call_complete;
93368b6bd58ac4 net/rxrpc/recvmsg.c    David Howells 2022-10-26  402  	if (rxrpc_call_has_failed(call))
93368b6bd58ac4 net/rxrpc/recvmsg.c    David Howells 2022-10-26  403  		goto call_failed;
93368b6bd58ac4 net/rxrpc/recvmsg.c    David Howells 2022-10-26  404  
93368b6bd58ac4 net/rxrpc/recvmsg.c    David Howells 2022-10-26  405  	rxrpc_notify_socket(call);
93368b6bd58ac4 net/rxrpc/recvmsg.c    David Howells 2022-10-26  406  	goto not_yet_complete;
93368b6bd58ac4 net/rxrpc/recvmsg.c    David Howells 2022-10-26  407  
93368b6bd58ac4 net/rxrpc/recvmsg.c    David Howells 2022-10-26  408  call_failed:
93368b6bd58ac4 net/rxrpc/recvmsg.c    David Howells 2022-10-26  409  	rxrpc_purge_queue(&call->recvmsg_queue);
93368b6bd58ac4 net/rxrpc/recvmsg.c    David Howells 2022-10-26  410  call_complete:
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  411  	ret = rxrpc_recvmsg_term(call, msg);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  412  	if (ret < 0)
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  413  		goto error_unlock_call;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  414  	if (!(flags & MSG_PEEK))
8d94aa381dab19 net/rxrpc/recvmsg.c    David Howells 2016-09-07  415  		rxrpc_release_call(rx, call);
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  416  	msg->msg_flags |= MSG_EOR;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  417  	ret = 1;
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  418  
93368b6bd58ac4 net/rxrpc/recvmsg.c    David Howells 2022-10-26  419  not_yet_complete:
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  420  	if (ret == 0)
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  421  		msg->msg_flags |= MSG_MORE;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  422  	else
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  423  		msg->msg_flags &= ~MSG_MORE;
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  424  	ret = copied;
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  425  
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  426  error_unlock_call:
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  427  	mutex_unlock(&call->user_mutex);
cb0fc0c9722c0c net/rxrpc/recvmsg.c    David Howells 2022-10-21  428  	rxrpc_put_call(call, rxrpc_call_put_recvmsg);
0e50d999903c00 net/rxrpc/recvmsg.c    David Howells 2022-12-24  429  	trace_rxrpc_recvmsg(call_debug_id, rxrpc_recvmsg_return, ret);
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  430  	return ret;
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  431  
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  432  error_requeue_call:
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  433  	if (!(flags & MSG_PEEK)) {
3dd9c8b5f09fd2 net/rxrpc/recvmsg.c    David Howells 2020-01-24  434  		write_lock(&rx->recvmsg_lock);
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  435  		list_add(&call->recvmsg_link, &rx->recvmsg_q);
3dd9c8b5f09fd2 net/rxrpc/recvmsg.c    David Howells 2020-01-24  436  		write_unlock(&rx->recvmsg_lock);
0e50d999903c00 net/rxrpc/recvmsg.c    David Howells 2022-12-24  437  		trace_rxrpc_recvmsg(call_debug_id, rxrpc_recvmsg_requeue, 0);
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  438  	} else {
cb0fc0c9722c0c net/rxrpc/recvmsg.c    David Howells 2022-10-21  439  		rxrpc_put_call(call, rxrpc_call_put_recvmsg);
540b1c48c37ac0 net/rxrpc/recvmsg.c    David Howells 2017-02-27  440  	}
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  441  error_no_call:
248f219cb8bcbf net/rxrpc/recvmsg.c    David Howells 2016-09-08  442  	release_sock(&rx->sk);
6dce3c20ac429e net/rxrpc/recvmsg.c    Eric Dumazet  2019-02-04  443  error_trace:
0e50d999903c00 net/rxrpc/recvmsg.c    David Howells 2022-12-24  444  	trace_rxrpc_recvmsg(call_debug_id, rxrpc_recvmsg_return, ret);
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  445  	return ret;
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  446  
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  447  wait_interrupted:
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  448  	ret = sock_intr_errno(timeo);
17926a79320afa net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  449  wait_error:
4a4771a58e13b4 net/rxrpc/ar-recvmsg.c Eric Dumazet  2010-04-25  450  	finish_wait(sk_sleep(&rx->sk), &wait);
849979051cbc93 net/rxrpc/recvmsg.c    David Howells 2016-09-17  451  	call = NULL;
6dce3c20ac429e net/rxrpc/recvmsg.c    Eric Dumazet  2019-02-04  452  	goto error_trace;
d001648ec7cf8b net/rxrpc/recvmsg.c    David Howells 2016-08-30  453  }
651350d10f93be net/rxrpc/ar-recvmsg.c David Howells 2007-04-26  454  

:::::: The code at line 384 was first introduced by commit
:::::: f3441d4125fc98995858550a5521b8d7daf0504a rxrpc: Copy client call parameters into rxrpc_call earlier

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
