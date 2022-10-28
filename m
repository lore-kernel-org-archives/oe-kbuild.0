Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCFAE822
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Oct 2022 03:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666928106; x=1698464106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nhmOYFN7kVTPJYEDoaPslWmifNvJQZMBOEF/mssbc4Y=;
  b=CSG2YWvmuiFK8CPfq8ZXnQkmHCD5ZhYNvA53mDr3fE3Z5ombH2QYtXjr
   iFr+kQ1Sic+Z6AwqCaXVdsooEZC9ij+0ZnSrl9KE1gc0NMUXSsQ4d2LBR
   APkJyjwoMkPSjDic8AwYHAepSFEHjII4t+u0tG5Zg53WpIdzUXGX2/3Ic
   FYDI0PfVtm2Hw97JSgIxxsfHmbK0ah86UdYlm8FHzm45QpsUhPU1zUoDM
   cI6+8f16edWXSKXNlaNMrvG0qDHqc47dVZzXc/mzutkjQN6Mgrz6DW0E6
   5nDXYozy/EJZM8UfxZ13FqXDd1iC8dM0HL6OhkS4nolCV24sQKkAC6V1Q
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="310097900"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; 
   d="scan'208";a="310097900"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 20:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="775231548"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; 
   d="scan'208";a="775231548"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 27 Oct 2022 20:35:03 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ooG98-0009Rp-1I;
	Fri, 28 Oct 2022 03:35:02 +0000
Date: Fri, 28 Oct 2022 11:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/netlink/af_netlink.c:2502:38: warning: syntax error [syntaxError]
Message-ID: <202210281153.7JJ0CIkV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/netlink/af_netlink.c:2502:38: warning: syntax error [syntaxError]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23758867219c8d84c8363316e6dd2f9fd7ae3049
commit: 710d21fdff9a98d621cd4e64167f3ef8af4e2fd1 netlink: Bounds-check struct nlmsgerr creation
date:   8 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 weeks ago
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 710d21fdff9a98d621cd4e64167f3ef8af4e2fd1
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/netlink/af_netlink.c:2502:38: warning: syntax error [syntaxError]
         ? nlh->nlmsg_len : sizeof(*nlh),
                                        ^
--
>> net/socket.c:586:3: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
     buffer += len;
     ^
>> net/socket.c:2530:2: warning: Address of local auto-variable assigned to a function parameter. [autoVariables]
    msg_sys->msg_name = &address;
    ^
   net/socket.c:2688:2: warning: Address of local auto-variable assigned to a function parameter. [autoVariables]
    msg_sys->msg_name = &addr;
    ^

vim +2502 net/netlink/af_netlink.c

0c95cea24f30eb Jakub Kicinski    2022-08-25  2465  
2d4bc93368f5a0 Johannes Berg     2017-04-12  2466  void netlink_ack(struct sk_buff *in_skb, struct nlmsghdr *nlh, int err,
2d4bc93368f5a0 Johannes Berg     2017-04-12  2467  		 const struct netlink_ext_ack *extack)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2468  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2469  	struct sk_buff *skb;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2470  	struct nlmsghdr *rep;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2471  	struct nlmsgerr *errmsg;
339bf98ffc6a8d Thomas Graf       2006-11-10  2472  	size_t payload = sizeof(*errmsg);
0a6a3a23ea6efd Christophe Ricard 2015-08-28  2473  	struct netlink_sock *nlk = nlk_sk(NETLINK_CB(in_skb).sk);
2d4bc93368f5a0 Johannes Berg     2017-04-12  2474  	unsigned int flags = 0;
0c95cea24f30eb Jakub Kicinski    2022-08-25  2475  	size_t tlvlen;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2476  
0a6a3a23ea6efd Christophe Ricard 2015-08-28  2477  	/* Error messages get the original request appened, unless the user
2d4bc93368f5a0 Johannes Berg     2017-04-12  2478  	 * requests to cap the error message, and get extra error data if
2d4bc93368f5a0 Johannes Berg     2017-04-12  2479  	 * requested.
0a6a3a23ea6efd Christophe Ricard 2015-08-28  2480  	 */
fe2a31d790f81b Michal Kubecek    2020-03-15  2481  	if (err && !(nlk->flags & NETLINK_F_CAP_ACK))
339bf98ffc6a8d Thomas Graf       2006-11-10  2482  		payload += nlmsg_len(nlh);
2d4bc93368f5a0 Johannes Berg     2017-04-12  2483  	else
2d4bc93368f5a0 Johannes Berg     2017-04-12  2484  		flags |= NLM_F_CAPPED;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2485  
0c95cea24f30eb Jakub Kicinski    2022-08-25  2486  	tlvlen = netlink_ack_tlv_len(nlk, err, extack);
2d4bc93368f5a0 Johannes Berg     2017-04-12  2487  	if (tlvlen)
2d4bc93368f5a0 Johannes Berg     2017-04-12  2488  		flags |= NLM_F_ACK_TLVS;
2d4bc93368f5a0 Johannes Berg     2017-04-12  2489  
2d4bc93368f5a0 Johannes Berg     2017-04-12  2490  	skb = nlmsg_new(payload + tlvlen, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2491  	if (!skb) {
a2084f5650624e Johannes Berg     2017-10-16  2492  		NETLINK_CB(in_skb).sk->sk_err = ENOBUFS;
e3ae2365efc142 Alexander Aring   2021-06-27  2493  		sk_error_report(NETLINK_CB(in_skb).sk);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2494  		return;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2495  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2496  
710d21fdff9a98 Kees Cook         2022-09-02  2497  	rep = nlmsg_put(skb, NETLINK_CB(in_skb).portid, nlh->nlmsg_seq,
2d4bc93368f5a0 Johannes Berg     2017-04-12  2498  			NLMSG_ERROR, payload, flags);
bf8b79e444a748 Thomas Graf       2006-08-04  2499  	errmsg = nlmsg_data(rep);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2500  	errmsg->error = err;
710d21fdff9a98 Kees Cook         2022-09-02  2501  	unsafe_memcpy(&errmsg->msg, nlh, payload > sizeof(*errmsg)
710d21fdff9a98 Kees Cook         2022-09-02 @2502  					 ? nlh->nlmsg_len : sizeof(*nlh),
710d21fdff9a98 Kees Cook         2022-09-02  2503  		      /* Bounds checked by the skb layer. */);
2d4bc93368f5a0 Johannes Berg     2017-04-12  2504  
0c95cea24f30eb Jakub Kicinski    2022-08-25  2505  	if (tlvlen)
0c95cea24f30eb Jakub Kicinski    2022-08-25  2506  		netlink_ack_tlv_fill(in_skb, skb, nlh, err, extack);
2d4bc93368f5a0 Johannes Berg     2017-04-12  2507  
2d4bc93368f5a0 Johannes Berg     2017-04-12  2508  	nlmsg_end(skb, rep);
2d4bc93368f5a0 Johannes Berg     2017-04-12  2509  
01757f536ac825 Yajun Deng        2021-07-13  2510  	nlmsg_unicast(in_skb->sk, skb, NETLINK_CB(in_skb).portid);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2511  }
6ac552fdc6e96b Patrick McHardy   2007-12-04  2512  EXPORT_SYMBOL(netlink_ack);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2513  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
