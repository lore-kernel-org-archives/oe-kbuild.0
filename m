Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE6F158DA3
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693765; cv=none; b=EIaUGS9bMb62qpJk4TQaUfzy+fXZBeifQQYCFw3zH2h5L25YcQID61xL772V5UDC+GfaD39fiId0hN9titQ4cpFnkgnruAc2nf8YX8GAKYsJlkxUZwZpknG5wtT6UiyrHxaTFRKJf2AZzAcBx6VU74eWjVl7PJOlim9SG69fuqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693765; c=relaxed/simple;
	bh=PN07q+trs+isPUqwHRnIybZM1NfZOXlvJJUclkn04Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CiEL6ckL6Db05k1mbi5sUP/jfwHqhs09/MNU5wbfsaq/0bQkxrT1B7UTresvrplTr99wt6OfX+bfTgZhK/rlgpYg1Z/eO1iQUmPqM3dy+OpsyrF4ETC7LsMyCJZf8JEcSs0VT1m5Q9rFNIta8usObs18zx8TMC/OzCOCmHVd65Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDgbYOsq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDgbYOsq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720693761; x=1752229761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PN07q+trs+isPUqwHRnIybZM1NfZOXlvJJUclkn04Gg=;
  b=FDgbYOsqIiJAY2x9iydmFr2yMPiIpnEqbR2n2vM6zSLhvWicbAjm4H7+
   +KktdQ3wpRulrbPaG2NDZyj+5ouRHJr5gDFpHYRCErnIM+0+gs4GwQgJS
   HN94Bd+c7dRIeiMCXK8gojFyTJPI5FF9JeJgJUVp5Z03M8pD7UpLwgG7c
   eOQHEDCc4lr/WJlWeVHee7pvhiinNk8dxoFH0zN15c+wOIUmJ/L3ff++m
   uOr0AvFKXPR8mnPxmtFihWGULiRAgMapwdzbKUI13faMMUJEDbhGz8M9I
   Sv3Cy0thqX7DWCpQevS1qiqQvJ5xi8NCh3DMcb0u6a6KUl2BjnS6c9810
   Q==;
X-CSE-ConnectionGUID: oGXKePWgSlOrY7nnKBSoiw==
X-CSE-MsgGUID: B4MUD+OQQ9mRa4nuoZoR1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="28663443"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="28663443"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 03:29:21 -0700
X-CSE-ConnectionGUID: mrmYic27QGepiRgg9/UOZA==
X-CSE-MsgGUID: nXMaZ3yESJ+L5NLKwYjAow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="48409120"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jul 2024 03:29:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRr37-000Z9m-1W;
	Thu, 11 Jul 2024 10:29:17 +0000
Date: Thu, 11 Jul 2024 18:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gustavoars:testing/WFAMNAE-next20240621-CbC 1/11]
 include/linux/tty_buffer.h:40:27: warning: structure containing a flexible
 array member is not at the end of another structure
Message-ID: <202407111807.R0HzhFNt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: LKML <linux-kernel@vger.kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/WFAMNAE-next20240621-CbC
head:   30867ef8ad076c11ed274d76f99e8bb0346790af
commit: 18c8dad6dac24de88b5379ad4e367e50d06a96ec [1/11] Makefile: Enable -Wflex-array-member-not-at-end globally
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240711/202407111807.R0HzhFNt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111807.R0HzhFNt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407111807.R0HzhFNt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/tty_port.h:8,
                    from include/linux/tty.h:11,
                    from fs/open.c:14:
>> include/linux/tty_buffer.h:40:27: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      40 |         struct tty_buffer sentinel;
         |                           ^~~~~~~~
   In file included from include/linux/security.h:35,
                    from fs/open.c:19:
   include/linux/bpf.h:2002:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
    2002 |         struct bpf_prog_array hdr;
         |                               ^~~
--
   In file included from include/linux/tty_port.h:8,
                    from include/linux/tty.h:11,
                    from fs/char_dev.c:24:
>> include/linux/tty_buffer.h:40:27: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      40 |         struct tty_buffer sentinel;
         |                           ^~~~~~~~
--
   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:62,
                    from fs/exec.c:42:
   include/linux/bpf.h:2002:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
    2002 |         struct bpf_prog_array hdr;
         |                               ^~~
   In file included from arch/openrisc/include/asm/tlb.h:24,
                    from fs/exec.c:74:
>> include/asm-generic/tlb.h:351:33: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
     351 |         struct mmu_gather_batch local;
         |                                 ^~~~~
--
   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from fs/select.c:22:
   include/linux/bpf.h:2002:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
    2002 |         struct bpf_prog_array hdr;
         |                               ^~~
   In file included from include/net/scm.h:13,
                    from include/linux/netlink.h:9,
                    from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:45,
                    from include/net/busy_poll.h:15,
                    from fs/select.c:33:
>> include/net/compat.h:33:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      33 |         struct sockaddr rt_dst;         /* target address               */
         |                         ^~~~~~
   include/net/compat.h:34:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      34 |         struct sockaddr rt_gateway;     /* gateway addr (RTF_GATEWAY)   */
         |                         ^~~~~~~~~~
   include/net/compat.h:35:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      35 |         struct sockaddr rt_genmask;     /* target network mask (IP)     */
         |                         ^~~~~~~~~~
   In file included from include/net/ip.h:29,
                    from include/net/busy_poll.h:18:
>> include/net/inet_sock.h:64:33: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      64 |         struct ip_options_rcu   opt;
         |                                 ^~~
   In file included from include/linux/if_arp.h:23,
                    from include/net/arp.h:6,
                    from include/net/route.h:28,
                    from include/net/ip.h:30:
>> include/uapi/linux/if_arp.h:118:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
     118 |         struct sockaddr arp_pa;         /* protocol address              */
         |                         ^~~~~~
   include/uapi/linux/if_arp.h:119:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
     119 |         struct sockaddr arp_ha;         /* hardware address              */
         |                         ^~~~~~
   include/uapi/linux/if_arp.h:121:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
     121 |         struct sockaddr arp_netmask;    /* netmask (only for proxy arps) */
         |                         ^~~~~~~~~~~
   include/uapi/linux/if_arp.h:126:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
     126 |         struct sockaddr arp_pa;         /* protocol address              */
         |                         ^~~~~~
   include/uapi/linux/if_arp.h:127:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
     127 |         struct sockaddr arp_ha;         /* hardware address              */
         |                         ^~~~~~
   In file included from include/net/route.h:33:
>> include/uapi/linux/route.h:33:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      33 |         struct sockaddr rt_dst;         /* target address               */
         |                         ^~~~~~
   include/uapi/linux/route.h:34:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      34 |         struct sockaddr rt_gateway;     /* gateway addr (RTF_GATEWAY)   */
         |                         ^~~~~~~~~~
   include/uapi/linux/route.h:35:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      35 |         struct sockaddr rt_genmask;     /* target network mask (IP)     */
         |                         ^~~~~~~~~~
>> include/net/ip.h:48:33: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      48 |         struct ip_options       opt;            /* Compiled IP options          */
         |                                 ^~~
--
   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from fs/file.c:10:
   include/linux/bpf.h:2002:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
    2002 |         struct bpf_prog_array hdr;
         |                               ^~~
   In file included from include/net/scm.h:13,
                    from include/linux/netlink.h:9,
                    from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:45,
                    from include/net/sock.h:46,
                    from fs/file.c:23:
>> include/net/compat.h:33:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      33 |         struct sockaddr rt_dst;         /* target address               */
         |                         ^~~~~~
   include/net/compat.h:34:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      34 |         struct sockaddr rt_gateway;     /* gateway addr (RTF_GATEWAY)   */
         |                         ^~~~~~~~~~
   include/net/compat.h:35:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      35 |         struct sockaddr rt_genmask;     /* target network mask (IP)     */
         |                         ^~~~~~~~~~
--
   In file included from include/linux/security.h:35,
                    from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from fs/namespace.c:11:
   include/linux/bpf.h:2002:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
    2002 |         struct bpf_prog_array hdr;
         |                               ^~~
>> fs/namespace.c:4747:26: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
    4747 |         struct statmount sm;
         |                          ^~
--
   In file included from include/linux/security.h:35,
                    from kernel/fork.c:52:
   include/linux/bpf.h:2002:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
    2002 |         struct bpf_prog_array hdr;
         |                               ^~~
   In file included from include/linux/tty_port.h:8,
                    from include/linux/tty.h:11,
                    from kernel/fork.c:80:
>> include/linux/tty_buffer.h:40:27: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      40 |         struct tty_buffer sentinel;
         |                           ^~~~~~~~
--
   In file included from include/linux/security.h:35,
                    from kernel/sysctl.c:32:
   include/linux/bpf.h:2002:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
    2002 |         struct bpf_prog_array hdr;
         |                               ^~~
   In file included from include/net/scm.h:13,
                    from include/linux/netlink.h:9,
                    from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:45,
                    from include/linux/if_vlan.h:10,
                    from include/linux/filter.h:21,
                    from kernel/sysctl.c:35:
>> include/net/compat.h:33:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      33 |         struct sockaddr rt_dst;         /* target address               */
         |                         ^~~~~~
   include/net/compat.h:34:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      34 |         struct sockaddr rt_gateway;     /* gateway addr (RTF_GATEWAY)   */
         |                         ^~~~~~~~~~
   include/net/compat.h:35:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      35 |         struct sockaddr rt_genmask;     /* target network mask (IP)     */
         |                         ^~~~~~~~~~
   In file included from include/net/inet_connection_sock.h:21,
                    from include/linux/tcp.h:20,
                    from include/linux/ipv6.h:101,
                    from include/net/ipv6.h:12,
                    from include/linux/sunrpc/clnt.h:29,
                    from include/linux/nfs_fs.h:32,
                    from kernel/sysctl.c:53:
>> include/net/inet_sock.h:64:33: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      64 |         struct ip_options_rcu   opt;
         |                                 ^~~
--
   In file included from include/linux/security.h:35,
                    from include/net/scm.h:9,
                    from include/linux/netlink.h:9,
                    from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:45,
                    from include/net/sock.h:46,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:101,
                    from include/net/addrconf.h:61,
                    from lib/vsprintf.c:41:
   include/linux/bpf.h:2002:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
    2002 |         struct bpf_prog_array hdr;
         |                               ^~~
   In file included from include/net/scm.h:13:
>> include/net/compat.h:33:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      33 |         struct sockaddr rt_dst;         /* target address               */
         |                         ^~~~~~
   include/net/compat.h:34:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      34 |         struct sockaddr rt_gateway;     /* gateway addr (RTF_GATEWAY)   */
         |                         ^~~~~~~~~~
   include/net/compat.h:35:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      35 |         struct sockaddr rt_genmask;     /* target network mask (IP)     */
         |                         ^~~~~~~~~~
   In file included from include/net/inet_connection_sock.h:21,
                    from include/linux/tcp.h:20:
>> include/net/inet_sock.h:64:33: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      64 |         struct ip_options_rcu   opt;
         |                                 ^~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1683:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1683 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
--
   In file included from include/linux/security.h:35,
                    from include/net/scm.h:9,
                    from include/linux/netlink.h:9,
                    from include/linux/ethtool.h:19,
                    from include/linux/phy.h:16,
                    from drivers/base/property.c:16:
   include/linux/bpf.h:2002:31: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
    2002 |         struct bpf_prog_array hdr;
         |                               ^~~
   In file included from include/net/scm.h:13:
>> include/net/compat.h:33:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      33 |         struct sockaddr rt_dst;         /* target address               */
         |                         ^~~~~~
   include/net/compat.h:34:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      34 |         struct sockaddr rt_gateway;     /* gateway addr (RTF_GATEWAY)   */
         |                         ^~~~~~~~~~
   include/net/compat.h:35:25: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
      35 |         struct sockaddr rt_genmask;     /* target network mask (IP)     */
         |                         ^~~~~~~~~~
>> include/linux/ethtool.h:170:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
     170 |         struct ethtool_link_settings base;
         |                                      ^~~~
--
   In file included from arch/openrisc/include/asm/tlb.h:24,
                    from arch/openrisc/mm/init.c:33:
>> include/asm-generic/tlb.h:351:33: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
     351 |         struct mmu_gather_batch local;
         |                                 ^~~~~


vim +40 include/linux/tty_buffer.h

8d29e0024437ae Jiri Slaby 2021-07-23  34  
8d29e0024437ae Jiri Slaby 2021-07-23  35  struct tty_bufhead {
8d29e0024437ae Jiri Slaby 2021-07-23  36  	struct tty_buffer *head;	/* Queue head */
8d29e0024437ae Jiri Slaby 2021-07-23  37  	struct work_struct work;
8d29e0024437ae Jiri Slaby 2021-07-23  38  	struct mutex	   lock;
8d29e0024437ae Jiri Slaby 2021-07-23  39  	atomic_t	   priority;
8d29e0024437ae Jiri Slaby 2021-07-23 @40  	struct tty_buffer sentinel;
8d29e0024437ae Jiri Slaby 2021-07-23  41  	struct llist_head free;		/* Free queue head */
8d29e0024437ae Jiri Slaby 2021-07-23  42  	atomic_t	   mem_used;    /* In-use buffers excluding free list */
8d29e0024437ae Jiri Slaby 2021-07-23  43  	int		   mem_limit;
8d29e0024437ae Jiri Slaby 2021-07-23  44  	struct tty_buffer *tail;	/* Active buffer */
8d29e0024437ae Jiri Slaby 2021-07-23  45  };
8d29e0024437ae Jiri Slaby 2021-07-23  46  

:::::: The code at line 40 was first introduced by commit
:::::: 8d29e0024437ae9184ae24f817ef0fda80b8cd3c tty: move tty_buffer definitions to new tty_buffer.h

:::::: TO: Jiri Slaby <jslaby@suse.cz>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
