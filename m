Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4913F4ED
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Sep 2024 03:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726024050; cv=none; b=mGmINi9sh9gxEu1+GElrqGj2B+bPbzLnQhfFz6ePU+JImYW+sGtLwMb/fO3SJCz6gBY5tz5Y6WqVbmR9vjG8/u4Pi2PUlo8Wh4WAZucvYsrgY8R5u6vu0GSmK7P+FykfZpeGDrvQIBxQnX4qpHzdKBRCkQgVhmLwk/6oZhLE3ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726024050; c=relaxed/simple;
	bh=3hQwMu6ENP5tCgonNlBccwzDH7v82QhtOQWALJhjNQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nMW39t73xEn6CX0wIwetQbNUrOpED+ck6J3LR63eM4qogwXmLJgJWSPOxp3p7r3Xd9a0z8djHCwHEmg9JMNQ0pYypTAKJlCoKmed47rQdmOnQ6+hbO3l2FP3Qx8PaoojWEZLdG8j+hG5mXMLjCnN1mmccxgKdhr5GXdbw+NKebg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKBC0qoD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKBC0qoD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726024048; x=1757560048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3hQwMu6ENP5tCgonNlBccwzDH7v82QhtOQWALJhjNQM=;
  b=AKBC0qoDMm46Wcza60CCzFJgVSD9jwTamYuXnQlhgboY0V6wMBdrN6Jm
   0r42051WcwtoYPthMk+bk6EvueZbb8JcYR4HdF8SkHwEMFx0KIVGnDF9v
   BgJUYM6rYGithQ+viBVgVhfuIpICMOSa2hS5jHKtP8sTnhW174vDtYJV3
   ZT3O3aLgYbyNtvmAy5ANVrnjvTUd9ldc+ycIn++aDOy2oJqsl7BEcIGvy
   MIkFLVS+t+ng43PZnj6ydYnA5CxgVkO6qfm3wzEY5T8UZ/xe1NLePUx9A
   VaKI3MTy9PBvepbeFcUPpFYncGHzd5jsumTKsdnfgyy9KbbhpfhmU6BbZ
   Q==;
X-CSE-ConnectionGUID: AFi+LYeSQBKzvWwNPSOTgA==
X-CSE-MsgGUID: 5koGkrvSSWu3+7I5Z2duiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42281557"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="42281557"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 20:07:26 -0700
X-CSE-ConnectionGUID: UKewzt+USF6qT0VD/8l0Lg==
X-CSE-MsgGUID: Ai71dKPjRQSX3vYO3tsWRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="67283715"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Sep 2024 20:07:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soDhS-0002yk-0J;
	Wed, 11 Sep 2024 03:07:22 +0000
Date: Wed, 11 Sep 2024 11:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-4.4.y-st 1480/2602] net/netfilter/xt_sctp.c:152:23:
 warning: comparison between signed and unsigned integer expressions
Message-ID: <202409111129.y8YCkOji-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "cip tree"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
TO: Pavel Machek <pavel@denx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st
head:   c18783f114b390babddc2dde4162ae03709497b2
commit: ad14bd8357a265ce12ebe9698db3c66ab8110bc5 [1480/2602] netfilter: xt_sctp: validate the flag_info count
:::::: branch date: 5 days ago
:::::: commit date: 11 months ago
config: arm-randconfig-002-20240907 (https://download.01.org/0day-ci/archive/20240911/202409111129.y8YCkOji-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111129.y8YCkOji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409111129.y8YCkOji-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/netdevice.h: In function 'netif_msg_init':
   include/linux/netdevice.h:3310:37: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >= (sizeof(u32) * 8))
                                        ^~
   In file included from include/net/rtnetlink.h:5:0,
                    from include/net/sch_generic.h:12,
                    from include/linux/filter.h:16,
                    from include/net/sock.h:62,
                    from include/net/inet_sock.h:27,
                    from include/net/ip.h:30,
                    from net/netfilter/xt_sctp.c:4:
   include/net/netlink.h: In function 'nlmsg_ok':
   include/net/netlink.h:337:18: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      nlh->nlmsg_len <= remaining);
                     ^~
   include/net/netlink.h: In function 'nlmsg_parse':
   include/net/netlink.h:372:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen))
                        ^
   include/net/netlink.h: In function 'nlmsg_validate':
   include/net/netlink.h:405:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen))
                        ^
   In file included from include/net/sch_generic.h:12:0,
                    from include/linux/filter.h:16,
                    from include/net/sock.h:62,
                    from include/net/inet_sock.h:27,
                    from include/net/ip.h:30,
                    from net/netfilter/xt_sctp.c:4:
   include/net/rtnetlink.h: In function 'rtnl_msg_family':
   include/net/rtnetlink.h:20:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (nlmsg_len(nlh) >= sizeof(struct rtgenmsg))
                        ^~
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/list.h:4,
                    from include/linux/module.h:9,
                    from net/netfilter/xt_sctp.c:2:
   include/net/sch_generic.h: In function 'qdisc_cb_private_validate':
   include/net/sch_generic.h:267:33: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     BUILD_BUG_ON(sizeof(qcb->data) < sz);
                                    ^
   include/linux/compiler.h:493:19: note: in definition of macro '__compiletime_assert'
      bool __cond = !(condition);    \
                      ^~~~~~~~~
   include/linux/compiler.h:513:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/bug.h:50:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bug.h:74:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/net/sch_generic.h:267:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(sizeof(qcb->data) < sz);
     ^~~~~~~~~~~~
   In file included from include/net/sock.h:62:0,
                    from include/net/inet_sock.h:27,
                    from include/net/ip.h:30,
                    from net/netfilter/xt_sctp.c:4:
   include/linux/filter.h: In function 'bpf_needs_clear_a':
   include/linux/filter.h:517:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (first->k == SKF_AD_OFF + SKF_AD_ALU_XOR_X)
                   ^~
   In file included from include/net/inet_sock.h:27:0,
                    from include/net/ip.h:30,
                    from net/netfilter/xt_sctp.c:4:
   include/net/sock.h: In function 'skb_do_copy_data_nocache':
   include/net/sock.h:1859:54: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (csum_and_copy_from_iter(to, copy, &csum, from) != copy)
                                                         ^~
   include/net/sock.h:1863:46: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (copy_from_iter_nocache(to, copy, from) != copy)
                                                 ^~
   include/net/sock.h:1865:44: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     } else if (copy_from_iter(to, copy, from) != copy)
                                               ^~
   In file included from include/linux/tcp.h:23:0,
                    from include/linux/ipv6.h:72,
                    from include/net/ipv6.h:16,
                    from include/net/inetpeer.h:15,
                    from include/net/route.h:28,
                    from include/net/ip.h:31,
                    from net/netfilter/xt_sctp.c:4:
   include/net/inet_connection_sock.h: In function 'inet_csk_reqsk_queue_is_full':
   include/net/inet_connection_sock.h:294:38: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return inet_csk_reqsk_queue_len(sk) >= sk->sk_max_ack_backlog;
                                         ^~
   In file included from include/net/sctp/structs.h:88:0,
                    from include/net/sctp/sctp.h:76,
                    from net/netfilter/xt_sctp.c:6:
   include/net/sctp/ulpevent.h: In function 'sctp_ulpevent_type_enabled':
   include/net/sctp/ulpevent.h:147:13: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (offset >= sizeof(struct sctp_event_subscribe))
                ^~
   net/netfilter/xt_sctp.c: In function 'sctp_mt_check':
>> net/netfilter/xt_sctp.c:152:23: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (info->flag_count > ARRAY_SIZE(info->flag_info))
                          ^


vim +152 net/netfilter/xt_sctp.c

2bf074825403e0 net/netfilter/xt_sctp.c       Shan Wei             2010-06-09   @6  #include <net/sctp/sctp.h>
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16    7  #include <linux/sctp.h>
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16    8  
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12    9  #include <linux/netfilter/x_tables.h>
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12   10  #include <linux/netfilter/xt_sctp.h>
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   11  #include <linux/netfilter_ipv4/ip_tables.h>
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12   12  #include <linux/netfilter_ipv6/ip6_tables.h>
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12   13  
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12   14  MODULE_LICENSE("GPL");
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12   15  MODULE_AUTHOR("Kiran Kumar Immidi");
2ae15b64e6a160 net/netfilter/xt_sctp.c       Jan Engelhardt       2008-01-14   16  MODULE_DESCRIPTION("Xtables: SCTP protocol packet match");
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12   17  MODULE_ALIAS("ipt_sctp");
73aaf9355b71d2 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-10-11   18  MODULE_ALIAS("ip6t_sctp");
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   19  
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   20  #define SCCHECK(cond, option, flag, invflag) (!((flag) & (option)) \
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   21  					      || (!!((invflag) & (option)) ^ (cond)))
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   22  
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   23  static bool
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12   24  match_flags(const struct xt_sctp_flag_info *flag_info,
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   25  	    const int flag_count,
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   26  	    u_int8_t chunktype,
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   27  	    u_int8_t chunkflags)
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   28  {
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   29  	int i;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   30  
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   31  	for (i = 0; i < flag_count; i++)
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   32  		if (flag_info[i].chunktype == chunktype)
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   33  			return (chunkflags & flag_info[i].flag_mask) == flag_info[i].flag;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   34  
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   35  	return true;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   36  }
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   37  
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   38  static inline bool
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   39  match_packet(const struct sk_buff *skb,
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12   40  	     unsigned int offset,
009e8c965fd72a net/netfilter/xt_sctp.c       Li Zefan             2007-10-18   41  	     const struct xt_sctp_info *info,
cff533ac12494f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   42  	     bool *hotdrop)
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   43  {
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   44  	u_int32_t chunkmapcopy[256 / sizeof (u_int32_t)];
3cf93c96af7adf net/netfilter/xt_sctp.c       Jan Engelhardt       2008-04-14   45  	const sctp_chunkhdr_t *sch;
3cf93c96af7adf net/netfilter/xt_sctp.c       Jan Engelhardt       2008-04-14   46  	sctp_chunkhdr_t _sch;
009e8c965fd72a net/netfilter/xt_sctp.c       Li Zefan             2007-10-18   47  	int chunk_match_type = info->chunk_match_type;
009e8c965fd72a net/netfilter/xt_sctp.c       Li Zefan             2007-10-18   48  	const struct xt_sctp_flag_info *flag_info = info->flag_info;
009e8c965fd72a net/netfilter/xt_sctp.c       Li Zefan             2007-10-18   49  	int flag_count = info->flag_count;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   50  
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   51  #ifdef DEBUG
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   52  	int i = 0;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   53  #endif
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   54  
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   55  	if (chunk_match_type == SCTP_CHUNK_MATCH_ALL)
009e8c965fd72a net/netfilter/xt_sctp.c       Li Zefan             2007-10-18   56  		SCTP_CHUNKMAP_COPY(chunkmapcopy, info->chunkmap);
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   57  
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   58  	do {
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   59  		sch = skb_header_pointer(skb, offset, sizeof(_sch), &_sch);
d3dcd4efe2ad1a net/netfilter/xt_sctp.c       Patrick McHardy      2006-06-19   60  		if (sch == NULL || sch->length == 0) {
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   61  			pr_debug("Dropping invalid SCTP packet.\n");
cff533ac12494f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   62  			*hotdrop = true;
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   63  			return false;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   64  		}
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   65  #ifdef DEBUG
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   66  		pr_debug("Chunk num: %d\toffset: %d\ttype: %d\tlength: %d"
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   67  			 "\tflags: %x\n",
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   68  			 ++i, offset, sch->type, htons(sch->length),
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   69  			 sch->flags);
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   70  #endif
2bf074825403e0 net/netfilter/xt_sctp.c       Shan Wei             2010-06-09   71  		offset += WORD_ROUND(ntohs(sch->length));
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   72  
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   73  		pr_debug("skb->len: %d\toffset: %d\n", skb->len, offset);
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   74  
009e8c965fd72a net/netfilter/xt_sctp.c       Li Zefan             2007-10-18   75  		if (SCTP_CHUNKMAP_IS_SET(info->chunkmap, sch->type)) {
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   76  			switch (chunk_match_type) {
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   77  			case SCTP_CHUNK_MATCH_ANY:
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   78  				if (match_flags(flag_info, flag_count,
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   79  					sch->type, sch->flags)) {
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   80  					return true;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   81  				}
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   82  				break;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   83  
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   84  			case SCTP_CHUNK_MATCH_ALL:
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   85  				if (match_flags(flag_info, flag_count,
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   86  				    sch->type, sch->flags))
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   87  					SCTP_CHUNKMAP_CLEAR(chunkmapcopy, sch->type);
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   88  				break;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   89  
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   90  			case SCTP_CHUNK_MATCH_ONLY:
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   91  				if (!match_flags(flag_info, flag_count,
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   92  				    sch->type, sch->flags))
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   93  					return false;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   94  				break;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   95  			}
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   96  		} else {
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   97  			switch (chunk_match_type) {
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   98  			case SCTP_CHUNK_MATCH_ONLY:
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   99  				return false;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  100  			}
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  101  		}
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  102  	} while (offset < skb->len);
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  103  
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  104  	switch (chunk_match_type) {
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  105  	case SCTP_CHUNK_MATCH_ALL:
d4e2675a61890a net/netfilter/xt_sctp.c       Qu Haoran            2009-02-09  106  		return SCTP_CHUNKMAP_IS_CLEAR(chunkmapcopy);
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  107  	case SCTP_CHUNK_MATCH_ANY:
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  108  		return false;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  109  	case SCTP_CHUNK_MATCH_ONLY:
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  110  		return true;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  111  	}
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  112  
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  113  	/* This will never be reached, but required to stop compiler whine */
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  114  	return false;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  115  }
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  116  
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  117  static bool
62fc8051083a33 net/netfilter/xt_sctp.c       Jan Engelhardt       2009-07-07  118  sctp_mt(const struct sk_buff *skb, struct xt_action_param *par)
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  119  {
f7108a20dee44e net/netfilter/xt_sctp.c       Jan Engelhardt       2008-10-08  120  	const struct xt_sctp_info *info = par->matchinfo;
3cf93c96af7adf net/netfilter/xt_sctp.c       Jan Engelhardt       2008-04-14  121  	const sctp_sctphdr_t *sh;
3cf93c96af7adf net/netfilter/xt_sctp.c       Jan Engelhardt       2008-04-14  122  	sctp_sctphdr_t _sh;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  123  
f7108a20dee44e net/netfilter/xt_sctp.c       Jan Engelhardt       2008-10-08  124  	if (par->fragoff != 0) {
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18  125  		pr_debug("Dropping non-first fragment.. FIXME\n");
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  126  		return false;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  127  	}
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  128  
f7108a20dee44e net/netfilter/xt_sctp.c       Jan Engelhardt       2008-10-08  129  	sh = skb_header_pointer(skb, par->thoff, sizeof(_sh), &_sh);
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  130  	if (sh == NULL) {
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18  131  		pr_debug("Dropping evil TCP offset=0 tinygram.\n");
b4ba26119b0605 net/netfilter/xt_sctp.c       Jan Engelhardt       2009-07-07  132  		par->hotdrop = true;
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  133  		return false;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  134  	}
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18  135  	pr_debug("spt: %d\tdpt: %d\n", ntohs(sh->source), ntohs(sh->dest));
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  136  
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  137  	return  SCCHECK(ntohs(sh->source) >= info->spts[0]
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  138  			&& ntohs(sh->source) <= info->spts[1],
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12  139  			XT_SCTP_SRC_PORTS, info->flags, info->invflags)
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  140  		&& SCCHECK(ntohs(sh->dest) >= info->dpts[0]
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  141  			&& ntohs(sh->dest) <= info->dpts[1],
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12  142  			XT_SCTP_DEST_PORTS, info->flags, info->invflags)
f7108a20dee44e net/netfilter/xt_sctp.c       Jan Engelhardt       2008-10-08  143  		&& SCCHECK(match_packet(skb, par->thoff + sizeof(sctp_sctphdr_t),
b4ba26119b0605 net/netfilter/xt_sctp.c       Jan Engelhardt       2009-07-07  144  					info, &par->hotdrop),
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12  145  			   XT_SCTP_CHUNK_TYPES, info->flags, info->invflags);
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  146  }
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  147  
b0f38452ff73da net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-19  148  static int sctp_mt_check(const struct xt_mtchk_param *par)
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12  149  {
9b4fce7a3508a9 net/netfilter/xt_sctp.c       Jan Engelhardt       2008-10-08  150  	const struct xt_sctp_info *info = par->matchinfo;
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12  151  
ad14bd8357a265 net/netfilter/xt_sctp.c       Wander Lairson Costa 2023-08-28 @152  	if (info->flag_count > ARRAY_SIZE(info->flag_info))
ad14bd8357a265 net/netfilter/xt_sctp.c       Wander Lairson Costa 2023-08-28  153  		return -EINVAL;
9f5673174161cc net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  154  	if (info->flags & ~XT_SCTP_VALID_FLAGS)
bd414ee605ff3a net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  155  		return -EINVAL;
9f5673174161cc net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  156  	if (info->invflags & ~XT_SCTP_VALID_FLAGS)
bd414ee605ff3a net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  157  		return -EINVAL;
9f5673174161cc net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  158  	if (info->invflags & ~info->flags)
bd414ee605ff3a net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  159  		return -EINVAL;
9f5673174161cc net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  160  	if (!(info->flags & XT_SCTP_CHUNK_TYPES))
bd414ee605ff3a net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  161  		return 0;
9f5673174161cc net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  162  	if (info->chunk_match_type & (SCTP_CHUNK_MATCH_ALL |
9f5673174161cc net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  163  	    SCTP_CHUNK_MATCH_ANY | SCTP_CHUNK_MATCH_ONLY))
bd414ee605ff3a net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  164  		return 0;
bd414ee605ff3a net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  165  	return -EINVAL;
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12  166  }
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12  167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
