Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EA7EA0
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Dec 2023 01:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PcBrndqh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701911571; x=1733447571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RlUVUfvlATHu6cHuAQic4SGjPTpp6B+1EzRE15DYgjk=;
  b=PcBrndqhu8vvsuubplzD7dqyFpneqTKvaSgRauCpLLVX+2Ho5rbx8XU6
   bGMlzcupsoCc8ngorBygbeEn/Rfgv7xP6AwrFfGWw1MmCmr9aqVsrS/wD
   JmEleo7NZnbedwFyLjuRb/FdLQJ+yFAdlJGmguti/6Ze+pzvzDG//1p8G
   O31TTOcTGLbLDV9foqVRnBrh6BgrlLRUkNTmUeRBe/T4UIodutuqk0CSk
   7suPPTjQA6EoGiP0hM8g2OMrjNMj5k0qF/6YnSj4f1kB1xaD7b2s3W2Ip
   27tyf2BW6JL/lPCfW4HkOX3qDWunCXle2q/M1ghV4xEwXS9AKjU2mqlTw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="458477916"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="458477916"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 17:12:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="944840443"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="944840443"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 06 Dec 2023 17:12:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB2wQ-000Bei-25;
	Thu, 07 Dec 2023 01:12:42 +0000
Date: Thu, 7 Dec 2023 09:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] ipvs: add a stateless type of service and a stateless
 Maglev hashing scheduler
Message-ID: <202312070849.i9gwwSH0-lkp@intel.com>
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
In-Reply-To: <20231204152020.472247-1-kndrvt@yandex-team.ru>
References: <20231204152020.472247-1-kndrvt@yandex-team.ru>
TO: Lev Pantiukhin <kndrvt@yandex-team.ru>
CC: mitradir@yandex-team.ru
CC: Lev Pantiukhin <kndrvt@yandex-team.ru>
CC: Simon Horman <horms@verge.net.au>
CC: Julian Anastasov <ja@ssi.bg>
CC: David Ahern <dsahern@kernel.org>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Pablo Neira Ayuso <pablo@netfilter.org>
CC: Jozsef Kadlecsik <kadlec@netfilter.org>
CC: Florian Westphal <fw@strlen.de>
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org
CC: lvs-devel@vger.kernel.org
CC: netfilter-devel@vger.kernel.org
CC: coreteam@netfilter.org

Hi Lev,

kernel test robot noticed the following build warnings:

[auto build test WARNING on horms-ipvs-next/master]
[also build test WARNING on horms-ipvs/master linus/master v6.7-rc4 next-20231206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lev-Pantiukhin/ipvs-add-a-stateless-type-of-service-and-a-stateless-Maglev-hashing-scheduler/20231204-232344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs-next.git master
patch link:    https://lore.kernel.org/r/20231204152020.472247-1-kndrvt%40yandex-team.ru
patch subject: [PATCH] ipvs: add a stateless type of service and a stateless Maglev hashing scheduler
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20231207 (https://download.01.org/0day-ci/archive/20231207/202312070849.i9gwwSH0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070849.i9gwwSH0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312070849.i9gwwSH0-lkp@intel.com/

New smatch warnings:
net/netfilter/ipvs/ip_vs_core.c:545 ip_vs_schedule() error: uninitialized symbol 'need_state'.

Old smatch warnings:
include/net/ip_vs.h:203 ip_vs_dbg_addr() warn: inconsistent indenting
net/netfilter/ipvs/ip_vs_core.c:574 ip_vs_schedule() error: uninitialized symbol 'need_state'.
net/netfilter/ipvs/ip_vs_core.c:751 ip_vs_route_me_harder() warn: inconsistent indenting
net/netfilter/ipvs/ip_vs_core.c:1396 ip_vs_out_hook() warn: inconsistent indenting
net/netfilter/ipvs/ip_vs_core.c:1416 ip_vs_out_hook() warn: inconsistent indenting
net/netfilter/ipvs/ip_vs_core.c:1992 ip_vs_in_hook() warn: inconsistent indenting

vim +/need_state +545 net/netfilter/ipvs/ip_vs_core.c

^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  417  
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  418  
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  419  /*
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  420   *  IPVS main scheduling function
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  421   *  It selects a server according to the virtual service, and
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  422   *  creates a connection entry.
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  423   *  Protocols supported: TCP, UDP
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  424   *
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  425   *  Usage of *ignored
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  426   *
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  427   * 1 :   protocol tried to schedule (eg. on SYN), found svc but the
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  428   *       svc/scheduler decides that this packet should be accepted with
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  429   *       NF_ACCEPT because it must not be scheduled.
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  430   *
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  431   * 0 :   scheduler can not find destination, so try bypass or
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  432   *       return ICMP and then NF_DROP (ip_vs_leave).
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  433   *
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  434   * -1 :  scheduler tried to schedule but fatal error occurred, eg.
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  435   *       ip_vs_conn_new failure (ENOMEM) or ip_vs_sip_fill_param
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  436   *       failure such as missing Call-ID, ENOMEM on skb_linearize
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  437   *       or pe_data. In this case we should return NF_DROP without
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  438   *       any attempts to send ICMP with ip_vs_leave.
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  439   */
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  440  struct ip_vs_conn *
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  441  ip_vs_schedule(struct ip_vs_service *svc, struct sk_buff *skb,
d4383f04d145cc net/netfilter/ipvs/ip_vs_core.c Jesper Dangaard Brouer 2012-09-26  442  	       struct ip_vs_proto_data *pd, int *ignored,
d4383f04d145cc net/netfilter/ipvs/ip_vs_core.c Jesper Dangaard Brouer 2012-09-26  443  	       struct ip_vs_iphdr *iph)
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  444  {
9330419d9aa4f9 net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2011-01-03  445  	struct ip_vs_protocol *pp = pd->pp;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  446  	struct ip_vs_conn *cp = NULL;
ceec4c38168184 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2013-03-22  447  	struct ip_vs_scheduler *sched;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  448  	struct ip_vs_dest *dest;
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  449  	__be16 _ports[2], *pptr, cport, vport;
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  450  	const void *caddr, *vaddr;
3575792e005dc9 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-09-17  451  	unsigned int flags;
b276d504bee439 net/netfilter/ipvs/ip_vs_core.c Lev Pantiukhin         2023-12-04  452  	bool need_state;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  453  
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  454  	*ignored = 1;
2f74713d1436b7 net/netfilter/ipvs/ip_vs_core.c Jesper Dangaard Brouer 2012-09-26  455  	/*
2f74713d1436b7 net/netfilter/ipvs/ip_vs_core.c Jesper Dangaard Brouer 2012-09-26  456  	 * IPv6 frags, only the first hit here.
2f74713d1436b7 net/netfilter/ipvs/ip_vs_core.c Jesper Dangaard Brouer 2012-09-26  457  	 */
6b3d933000cbe5 net/netfilter/ipvs/ip_vs_core.c Gao Feng               2017-11-13  458  	pptr = frag_safe_skb_hp(skb, iph->len, sizeof(_ports), _ports);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  459  	if (pptr == NULL)
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  460  		return NULL;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  461  
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  462  	if (likely(!ip_vs_iph_inverse(iph))) {
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  463  		cport = pptr[0];
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  464  		caddr = &iph->saddr;
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  465  		vport = pptr[1];
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  466  		vaddr = &iph->daddr;
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  467  	} else {
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  468  		cport = pptr[1];
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  469  		caddr = &iph->daddr;
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  470  		vport = pptr[0];
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  471  		vaddr = &iph->saddr;
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  472  	}
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  473  
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  474  	/*
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  475  	 * FTPDATA needs this check when using local real server.
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  476  	 * Never schedule Active FTPDATA connections from real server.
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  477  	 * For LVS-NAT they must be already created. For other methods
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  478  	 * with persistence the connection is created on SYN+ACK.
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  479  	 */
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  480  	if (cport == FTPDATA) {
b0e010c527de74 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  481  		IP_VS_DBG_PKT(12, svc->af, pp, skb, iph->off,
0d79641a96d612 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  482  			      "Not scheduling FTPDATA");
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  483  		return NULL;
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  484  	}
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  485  
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  486  	/*
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  487  	 *    Do not schedule replies from local real server.
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  488  	 */
802c41adcf3be6 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  489  	if ((!skb->dev || skb->dev->flags & IFF_LOOPBACK)) {
802c41adcf3be6 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  490  		iph->hdr_flags ^= IP_VS_HDR_INVERSE;
6ecd754883daff net/netfilter/ipvs/ip_vs_core.c Matteo Croce           2019-01-19  491  		cp = INDIRECT_CALL_1(pp->conn_in_get,
6ecd754883daff net/netfilter/ipvs/ip_vs_core.c Matteo Croce           2019-01-19  492  				     ip_vs_conn_in_get_proto, svc->ipvs,
6ecd754883daff net/netfilter/ipvs/ip_vs_core.c Matteo Croce           2019-01-19  493  				     svc->af, skb, iph);
802c41adcf3be6 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  494  		iph->hdr_flags ^= IP_VS_HDR_INVERSE;
802c41adcf3be6 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  495  
802c41adcf3be6 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  496  		if (cp) {
b0e010c527de74 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  497  			IP_VS_DBG_PKT(12, svc->af, pp, skb, iph->off,
802c41adcf3be6 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  498  				      "Not scheduling reply for existing"
802c41adcf3be6 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  499  				      " connection");
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  500  			__ip_vs_conn_put(cp);
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  501  			return NULL;
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  502  		}
802c41adcf3be6 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  503  	}
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  504  
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  505  	/*
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  506  	 *    Persistent service
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  507  	 */
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  508  	if (svc->flags & IP_VS_SVC_F_PERSISTENT)
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  509  		return ip_vs_sched_persist(svc, skb, cport, vport, ignored,
d4383f04d145cc net/netfilter/ipvs/ip_vs_core.c Jesper Dangaard Brouer 2012-09-26  510  					   iph);
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  511  
190ecd27cd7294 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2010-10-17  512  	*ignored = 0;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  513  
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  514  	/*
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  515  	 *    Non-persistent service
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  516  	 */
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  517  	if (!svc->fwmark && vport != svc->port) {
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  518  		if (!svc->port)
1e3e238e9c4bf9 net/netfilter/ipvs/ip_vs_core.c Hannes Eder            2009-08-02  519  			pr_err("Schedule: port zero only supported "
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  520  			       "in persistent services, "
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  521  			       "check your ipvs configuration\n");
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  522  		return NULL;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  523  	}
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  524  
ceec4c38168184 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2013-03-22  525  	sched = rcu_dereference(svc->scheduler);
05f00505a89acd net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2015-06-29  526  	if (sched) {
05f00505a89acd net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2015-06-29  527  		/* read svc->sched_data after svc->scheduler */
05f00505a89acd net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2015-06-29  528  		smp_rmb();
b276d504bee439 net/netfilter/ipvs/ip_vs_core.c Lev Pantiukhin         2023-12-04  529  		/* we use distinct handler for stateless service */
b276d504bee439 net/netfilter/ipvs/ip_vs_core.c Lev Pantiukhin         2023-12-04  530  		if (svc->flags & IP_VS_SVC_F_STATELESS)
b276d504bee439 net/netfilter/ipvs/ip_vs_core.c Lev Pantiukhin         2023-12-04  531  			dest = sched->schedule_sl(svc, skb, iph, &need_state);
b276d504bee439 net/netfilter/ipvs/ip_vs_core.c Lev Pantiukhin         2023-12-04  532  		else
bba54de5bdd107 net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2013-06-16  533  			dest = sched->schedule(svc, skb, iph);
05f00505a89acd net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2015-06-29  534  	} else {
05f00505a89acd net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2015-06-29  535  		dest = NULL;
05f00505a89acd net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2015-06-29  536  	}
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  537  	if (dest == NULL) {
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  538  		IP_VS_DBG(1, "Schedule: no dest found.\n");
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  539  		return NULL;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  540  	}
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  541  
b276d504bee439 net/netfilter/ipvs/ip_vs_core.c Lev Pantiukhin         2023-12-04  542  	/* We use IP_VS_SVC_F_ONEPACKET flag to create no state */
b276d504bee439 net/netfilter/ipvs/ip_vs_core.c Lev Pantiukhin         2023-12-04  543  	flags = ((svc->flags & IP_VS_SVC_F_ONEPACKET &&
b276d504bee439 net/netfilter/ipvs/ip_vs_core.c Lev Pantiukhin         2023-12-04  544  		  iph->protocol == IPPROTO_UDP) ||
b276d504bee439 net/netfilter/ipvs/ip_vs_core.c Lev Pantiukhin         2023-12-04 @545  		 (svc->flags & IP_VS_SVC_F_STATELESS && !need_state))
b276d504bee439 net/netfilter/ipvs/ip_vs_core.c Lev Pantiukhin         2023-12-04  546  		? IP_VS_CONN_F_ONE_PACKET : 0;
26ec037f9841e4 net/netfilter/ipvs/ip_vs_core.c Nick Chalk             2010-06-22  547  
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  548  	/*
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  549  	 *    Create a connection entry.
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  550  	 */
f11017ec2d1859 net/netfilter/ipvs/ip_vs_core.c Simon Horman           2010-08-22  551  	{
f11017ec2d1859 net/netfilter/ipvs/ip_vs_core.c Simon Horman           2010-08-22  552  		struct ip_vs_conn_param p;
6e67e586e7289c net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2011-01-03  553  
3109d2f2d1fe06 net/netfilter/ipvs/ip_vs_core.c Eric W. Biederman      2015-09-21  554  		ip_vs_conn_fill_param(svc->ipvs, svc->af, iph->protocol,
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  555  				      caddr, cport, vaddr, vport, &p);
ba38528aae6ee2 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2014-09-09  556  		cp = ip_vs_conn_new(&p, dest->af, &dest->addr,
ee78378f976488 net/netfilter/ipvs/ip_vs_core.c Alex Gartrell          2015-08-26  557  				    dest->port ? dest->port : vport,
0e051e683ba4ac net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  558  				    flags, dest, skb->mark);
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  559  		if (!cp) {
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  560  			*ignored = -1;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  561  			return NULL;
f11017ec2d1859 net/netfilter/ipvs/ip_vs_core.c Simon Horman           2010-08-22  562  		}
a5959d53d6048a net/netfilter/ipvs/ip_vs_core.c Hans Schillstrom       2010-11-19  563  	}
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  564  
cd17f9ed099ed2 net/ipv4/ipvs/ip_vs_core.c      Julius Volz            2008-09-02  565  	IP_VS_DBG_BUF(6, "Schedule fwd:%c c:%s:%u v:%s:%u "
cd17f9ed099ed2 net/ipv4/ipvs/ip_vs_core.c      Julius Volz            2008-09-02  566  		      "d:%s:%u conn->flags:%X conn->refcnt:%d\n",
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  567  		      ip_vs_fwd_tag(cp),
f18ae7206eaebf net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2014-09-09  568  		      IP_VS_DBG_ADDR(cp->af, &cp->caddr), ntohs(cp->cport),
f18ae7206eaebf net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2014-09-09  569  		      IP_VS_DBG_ADDR(cp->af, &cp->vaddr), ntohs(cp->vport),
f18ae7206eaebf net/netfilter/ipvs/ip_vs_core.c Julian Anastasov       2014-09-09  570  		      IP_VS_DBG_ADDR(cp->daf, &cp->daddr), ntohs(cp->dport),
b54ab92b84b616 net/netfilter/ipvs/ip_vs_core.c Reshetova, Elena       2017-03-16  571  		      cp->flags, refcount_read(&cp->refcnt));
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  572  
b276d504bee439 net/netfilter/ipvs/ip_vs_core.c Lev Pantiukhin         2023-12-04  573  	if (!(svc->flags & IP_VS_SVC_F_STATELESS) ||
b276d504bee439 net/netfilter/ipvs/ip_vs_core.c Lev Pantiukhin         2023-12-04  574  	    (svc->flags & IP_VS_SVC_F_STATELESS && need_state)) {
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  575  		ip_vs_conn_stats(cp, svc);
b276d504bee439 net/netfilter/ipvs/ip_vs_core.c Lev Pantiukhin         2023-12-04  576  	}
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  577  	return cp;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  578  }
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_core.c      Linus Torvalds         2005-04-16  579  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
