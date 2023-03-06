Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC44C7E
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Mar 2023 09:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678096559; x=1709632559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1dWWPp5u263a+qgiyNiToZTaXxDOBM9gjwOePitMjFY=;
  b=iE71ZSKGu6+oZINuP3sj+vQH91qMppXnpAPPPZ1ZAgP6k6SLkknivs7e
   TE4jztokqXtzoyW7H7lJSrqg4GLftwotCfjramPwprwqWxlAfrCeEDBjG
   mE3I3PZxczi6+LC3zW7e77mtdfdLQKCnDWTXEhlAjsYFhh1bnwLO6PUiP
   MnZBAmZ0fCLF1hv85JZdgD5lBIxayjSJFA9t5JrG4PgokPLK/pHj/4BrQ
   2b20BfLSiM51WEcS4P14+zVRAQQVGPLJ1V60SF/MxogozTxhYIMa8Fl8L
   q98ElE016my2B9bGV/9tFxa//T3jtDAyBaMBdBFZTQc6whQbU/mfqpGA7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="337032362"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="337032362"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 01:55:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="744993976"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="744993976"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2023 01:55:57 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ7ZU-0000Dn-2i;
	Mon, 06 Mar 2023 09:55:56 +0000
Date: Mon, 6 Mar 2023 17:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cel:topic-rpc-with-tls-upcall 1/18] net/handshake/netlink.c:187
 handshake_nl_accept_doit() error: uninitialized symbol 'req'.
Message-ID: <202303061707.ICwrtQsr-lkp@intel.com>
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
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-with-tls-upcall
head:   88897fb973ffb2448e3452ca4e9283908bd257f6
commit: d166e9ec5e3800de085444eca5883ce1738f6cb3 [1/18] net/handshake: Create a NETLINK service for handling handshake requests
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230306/202303061707.ICwrtQsr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303061707.ICwrtQsr-lkp@intel.com/

smatch warnings:
net/handshake/netlink.c:187 handshake_nl_accept_doit() error: uninitialized symbol 'req'.
net/handshake/netlink.c:240 handshake_nl_done_doit() error: uninitialized symbol 'req'.
net/handshake/request.c:193 handshake_complete() warn: test_and_set_bit() takes a bit number
net/handshake/request.c:236 handshake_req_cancel() warn: test_and_set_bit() takes a bit number

vim +/req +187 net/handshake/netlink.c

d166e9ec5e3800 Chuck Lever 2023-02-19  141  
d166e9ec5e3800 Chuck Lever 2023-02-19  142  static int handshake_nl_accept_doit(struct sk_buff *skb, struct genl_info *gi)
d166e9ec5e3800 Chuck Lever 2023-02-19  143  {
d166e9ec5e3800 Chuck Lever 2023-02-19  144  	struct nlattr *tb[HANDSHAKE_A_ACCEPT_MAX + 1];
d166e9ec5e3800 Chuck Lever 2023-02-19  145  	struct net *net = sock_net(skb->sk);
d166e9ec5e3800 Chuck Lever 2023-02-19  146  	struct handshake_req *pos, *req;
d166e9ec5e3800 Chuck Lever 2023-02-19  147  	int fd, err;
d166e9ec5e3800 Chuck Lever 2023-02-19  148  
d166e9ec5e3800 Chuck Lever 2023-02-19  149  	err = -EINVAL;
d166e9ec5e3800 Chuck Lever 2023-02-19  150  	if (genlmsg_parse(nlmsg_hdr(skb), &handshake_genl_family, tb,
d166e9ec5e3800 Chuck Lever 2023-02-19  151  			  HANDSHAKE_A_ACCEPT_HANDLER_CLASS,
d166e9ec5e3800 Chuck Lever 2023-02-19  152  			  handshake_accept_nl_policy, NULL))
d166e9ec5e3800 Chuck Lever 2023-02-19  153  		goto out_status;
d166e9ec5e3800 Chuck Lever 2023-02-19  154  	if (!tb[HANDSHAKE_A_ACCEPT_HANDLER_CLASS])
d166e9ec5e3800 Chuck Lever 2023-02-19  155  		goto out_status;
d166e9ec5e3800 Chuck Lever 2023-02-19  156  
d166e9ec5e3800 Chuck Lever 2023-02-19  157  	req = NULL;
d166e9ec5e3800 Chuck Lever 2023-02-19  158  	spin_lock(&net->hs_lock);
d166e9ec5e3800 Chuck Lever 2023-02-19  159  	list_for_each_entry(pos, &net->hs_requests, hr_list) {
d166e9ec5e3800 Chuck Lever 2023-02-19  160  		if (pos->hr_proto->hp_handler_class !=
d166e9ec5e3800 Chuck Lever 2023-02-19  161  		    nla_get_u32(tb[HANDSHAKE_A_ACCEPT_HANDLER_CLASS]))
d166e9ec5e3800 Chuck Lever 2023-02-19  162  			continue;
d166e9ec5e3800 Chuck Lever 2023-02-19  163  		__remove_pending_locked(net, pos);
d166e9ec5e3800 Chuck Lever 2023-02-19  164  		req = pos;
d166e9ec5e3800 Chuck Lever 2023-02-19  165  		break;
d166e9ec5e3800 Chuck Lever 2023-02-19  166  	}
d166e9ec5e3800 Chuck Lever 2023-02-19  167  	spin_unlock(&net->hs_lock);
d166e9ec5e3800 Chuck Lever 2023-02-19  168  	if (!req)
d166e9ec5e3800 Chuck Lever 2023-02-19  169  		goto out_status;
d166e9ec5e3800 Chuck Lever 2023-02-19  170  
d166e9ec5e3800 Chuck Lever 2023-02-19  171  	fd = handshake_dup(req->hr_sock);
d166e9ec5e3800 Chuck Lever 2023-02-19  172  	if (fd < 0) {
d166e9ec5e3800 Chuck Lever 2023-02-19  173  		err = fd;
d166e9ec5e3800 Chuck Lever 2023-02-19  174  		goto out_complete;
d166e9ec5e3800 Chuck Lever 2023-02-19  175  	}
d166e9ec5e3800 Chuck Lever 2023-02-19  176  	err = req->hr_proto->hp_accept(req, gi, fd);
d166e9ec5e3800 Chuck Lever 2023-02-19  177  	if (err)
d166e9ec5e3800 Chuck Lever 2023-02-19  178  		goto out_complete;
d166e9ec5e3800 Chuck Lever 2023-02-19  179  
d166e9ec5e3800 Chuck Lever 2023-02-19  180  	trace_handshake_cmd_accept(net, req, req->hr_sock, fd);
d166e9ec5e3800 Chuck Lever 2023-02-19  181  	return 0;
d166e9ec5e3800 Chuck Lever 2023-02-19  182  
d166e9ec5e3800 Chuck Lever 2023-02-19  183  out_complete:
d166e9ec5e3800 Chuck Lever 2023-02-19  184  	handshake_complete(req, -EIO, NULL);
d166e9ec5e3800 Chuck Lever 2023-02-19  185  	fput(req->hr_sock->file);
d166e9ec5e3800 Chuck Lever 2023-02-19  186  out_status:
d166e9ec5e3800 Chuck Lever 2023-02-19 @187  	trace_handshake_cmd_accept_err(net, req, NULL, err);
d166e9ec5e3800 Chuck Lever 2023-02-19  188  	return handshake_status_reply(skb, gi, err);
d166e9ec5e3800 Chuck Lever 2023-02-19  189  }
d166e9ec5e3800 Chuck Lever 2023-02-19  190  
d166e9ec5e3800 Chuck Lever 2023-02-19  191  static const struct nla_policy
d166e9ec5e3800 Chuck Lever 2023-02-19  192  handshake_done_nl_policy[HANDSHAKE_A_DONE_MAX + 1] = {
d166e9ec5e3800 Chuck Lever 2023-02-19  193  	[HANDSHAKE_A_DONE_SOCKFD] = { .type = NLA_U32, },
d166e9ec5e3800 Chuck Lever 2023-02-19  194  	[HANDSHAKE_A_DONE_STATUS] = { .type = NLA_U32, },
d166e9ec5e3800 Chuck Lever 2023-02-19  195  	[HANDSHAKE_A_DONE_REMOTE_AUTH] = { .type = NLA_U32, },
d166e9ec5e3800 Chuck Lever 2023-02-19  196  };
d166e9ec5e3800 Chuck Lever 2023-02-19  197  
d166e9ec5e3800 Chuck Lever 2023-02-19  198  static int handshake_nl_done_doit(struct sk_buff *skb, struct genl_info *gi)
d166e9ec5e3800 Chuck Lever 2023-02-19  199  {
d166e9ec5e3800 Chuck Lever 2023-02-19  200  	struct nlattr *tb[HANDSHAKE_A_DONE_MAX + 1];
d166e9ec5e3800 Chuck Lever 2023-02-19  201  	struct net *net = sock_net(skb->sk);
d166e9ec5e3800 Chuck Lever 2023-02-19  202  	struct socket *sock = NULL;
d166e9ec5e3800 Chuck Lever 2023-02-19  203  	struct handshake_req *req;
d166e9ec5e3800 Chuck Lever 2023-02-19  204  	int fd, status, err;
d166e9ec5e3800 Chuck Lever 2023-02-19  205  
d166e9ec5e3800 Chuck Lever 2023-02-19  206  	err = genlmsg_parse(nlmsg_hdr(skb), &handshake_genl_family, tb,
d166e9ec5e3800 Chuck Lever 2023-02-19  207  			    HANDSHAKE_A_DONE_MAX, handshake_done_nl_policy,
d166e9ec5e3800 Chuck Lever 2023-02-19  208  			    NULL);
d166e9ec5e3800 Chuck Lever 2023-02-19  209  	if (err || !tb[HANDSHAKE_A_DONE_SOCKFD]) {
d166e9ec5e3800 Chuck Lever 2023-02-19  210  		err = -EINVAL;
d166e9ec5e3800 Chuck Lever 2023-02-19  211  		goto out_status;
d166e9ec5e3800 Chuck Lever 2023-02-19  212  	}
d166e9ec5e3800 Chuck Lever 2023-02-19  213  
d166e9ec5e3800 Chuck Lever 2023-02-19  214  	fd = nla_get_u32(tb[HANDSHAKE_A_DONE_SOCKFD]);
d166e9ec5e3800 Chuck Lever 2023-02-19  215  
d166e9ec5e3800 Chuck Lever 2023-02-19  216  	err = 0;
d166e9ec5e3800 Chuck Lever 2023-02-19  217  	sock = sockfd_lookup(fd, &err);
d166e9ec5e3800 Chuck Lever 2023-02-19  218  	if (err) {
d166e9ec5e3800 Chuck Lever 2023-02-19  219  		err = -EBADF;
d166e9ec5e3800 Chuck Lever 2023-02-19  220  		goto out_status;
d166e9ec5e3800 Chuck Lever 2023-02-19  221  	}
d166e9ec5e3800 Chuck Lever 2023-02-19  222  
d166e9ec5e3800 Chuck Lever 2023-02-19  223  	req = sock->sk->sk_handshake_req;
d166e9ec5e3800 Chuck Lever 2023-02-19  224  	if (!req) {
d166e9ec5e3800 Chuck Lever 2023-02-19  225  		err = -EBUSY;
d166e9ec5e3800 Chuck Lever 2023-02-19  226  		goto out_status;
d166e9ec5e3800 Chuck Lever 2023-02-19  227  	}
d166e9ec5e3800 Chuck Lever 2023-02-19  228  
d166e9ec5e3800 Chuck Lever 2023-02-19  229  	trace_handshake_cmd_done(net, req, sock, fd);
d166e9ec5e3800 Chuck Lever 2023-02-19  230  
d166e9ec5e3800 Chuck Lever 2023-02-19  231  	status = -EIO;
d166e9ec5e3800 Chuck Lever 2023-02-19  232  	if (tb[HANDSHAKE_A_DONE_STATUS])
d166e9ec5e3800 Chuck Lever 2023-02-19  233  		status = nla_get_u32(tb[HANDSHAKE_A_DONE_STATUS]);
d166e9ec5e3800 Chuck Lever 2023-02-19  234  
d166e9ec5e3800 Chuck Lever 2023-02-19  235  	handshake_complete(req, status, tb);
d166e9ec5e3800 Chuck Lever 2023-02-19  236  	fput(sock->file);
d166e9ec5e3800 Chuck Lever 2023-02-19  237  	return 0;
d166e9ec5e3800 Chuck Lever 2023-02-19  238  
d166e9ec5e3800 Chuck Lever 2023-02-19  239  out_status:
d166e9ec5e3800 Chuck Lever 2023-02-19 @240  	trace_handshake_cmd_done_err(net, req, sock, err);
d166e9ec5e3800 Chuck Lever 2023-02-19  241  	return 0;
d166e9ec5e3800 Chuck Lever 2023-02-19  242  }
d166e9ec5e3800 Chuck Lever 2023-02-19  243  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
