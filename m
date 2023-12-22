Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9501033CFE
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Dec 2023 23:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFqOmBNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703288081; x=1734824081;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5K91faHQo2ZGi0D2bj2HSBG2RByJRvpGWQXNz2kMPHA=;
  b=gFqOmBNxzKjiW40GFRx7zad8s5ZNs5FdLIsOmIFh65ElWr3uVrTE1yEL
   MlxPEMbmEixSSKBz0lgHA5JeET1iH3ILIpPc4zWq7LSsP0paUq8YgUZa+
   5H9yWvCqS+LXNsLy1xpiTb2XCLJrErRJLHXinejotoT6UJXOm4bHol3Op
   rxAzrQKcKF3+3E0JLSWh7+jkNaDYbgSyGgD7N6XhU6Okea7KasvOiPO1T
   0Rb7VN/TheIrWj6u5kwQkNcqoZdCrYFUO3wHc/mA9HE/akAole8SkF5Tg
   qoDjwIDdraiRrEecZ1FXQt0OXOXPeKhrs9mYeya3jNwlt+0rk2ILq2nKf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="14848460"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="14848460"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 15:33:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="780723517"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="780723517"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 22 Dec 2023 15:33:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGp0n-0009zn-0k;
	Fri, 22 Dec 2023 23:33:06 +0000
Date: Sat, 23 Dec 2023 07:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v3 3/3] net: add netmem_ref to skb_frag_t
Message-ID: <202312230726.4XaPn84E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231220214505.2303297-4-almasrymina@google.com>
References: <20231220214505.2303297-4-almasrymina@google.com>
TO: Mina Almasry <almasrymina@google.com>
TO: linux-kernel@vger.kernel.org
TO: netdev@vger.kernel.org
TO: kvm@vger.kernel.org
TO: virtualization@lists.linux.dev
CC: Mina Almasry <almasrymina@google.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Stefano Garzarella <sgarzare@redhat.com>
CC: David Howells <dhowells@redhat.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: "Christian König" <christian.koenig@amd.com>
CC: Shakeel Butt <shakeelb@google.com>
CC: Yunsheng Lin <linyunsheng@huawei.com>
CC: Willem de Bruijn <willemdebruijn.kernel@gmail.com>

Hi Mina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Mina-Almasry/vsock-virtio-use-skb_frag_-helpers/20231222-164637
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231220214505.2303297-4-almasrymina%40google.com
patch subject: [PATCH net-next v3 3/3] net: add netmem_ref to skb_frag_t
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-121-20231223 (https://download.01.org/0day-ci/archive/20231223/202312230726.4XaPn84E-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230726.4XaPn84E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312230726.4XaPn84E-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/netevent.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/netevent.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, include/linux/rtnetlink.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/request_sock.c: note: in included file (through include/linux/skbuff.h, include/linux/tcp.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/request_sock.c: note: in included file (through include/linux/tcp.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/utils.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/inet.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/utils.c: note: in included file (through include/net/net_namespace.h, include/linux/inet.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/secure_seq.c: note: in included file (through include/linux/skbuff.h, include/linux/tcp.h, include/net/tcp.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/secure_seq.c: note: in included file (through include/linux/tcp.h, include/net/tcp.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/net_namespace.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/net_namespace.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, include/linux/rtnetlink.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/stream.c: note: in included file (through include/linux/skbuff.h, include/linux/tcp.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/stream.c: note: in included file (through include/linux/tcp.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/dst.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/dst.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/gen_stats.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/gen_stats.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, include/linux/rtnetlink.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/gen_estimator.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/gen_estimator.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/scm.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/scm.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/datagram.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/inet.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/datagram.c: note: in included file (through include/net/net_namespace.h, include/linux/inet.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/sysctl_net_core.c: note: in included file (through include/linux/skbuff.h, include/linux/filter.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/sysctl_net_core.c: note: in included file (through include/linux/filter.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/dev_addr_lists.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/dev_addr_lists.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
   net/core/dev_addr_lists.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/delay.h, ...):
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *
--
   net/core/flow_dissector.c: note: in included file (through include/linux/skbuff.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/flow_dissector.c: note: in included file:
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/link_watch.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/link_watch.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/tso.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/tso.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, include/linux/if_vlan.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/sock_diag.c: note: in included file (through include/linux/skbuff.h, include/linux/filter.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/sock_diag.c: note: in included file (through include/linux/filter.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/fib_notifier.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/fib_notifier.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, include/linux/rtnetlink.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/netdev-genl-gen.c: note: in included file (through include/linux/skbuff.h, include/linux/netlink.h, include/net/netlink.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/netdev-genl-gen.c: note: in included file (through include/linux/netlink.h, include/net/netlink.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/dev_ioctl.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/dev_ioctl.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/sock_reuseport.c: note: in included file (through include/linux/skbuff.h, include/linux/ip.h, include/net/ip.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/sock_reuseport.c: note: in included file (through include/linux/ip.h, include/net/ip.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/gso.c: note: in included file (through include/linux/skbuff.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/gso.c: note: in included file:
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/flow_offload.c: note: in included file (through include/linux/skbuff.h, include/linux/netlink.h, include/net/flow_offload.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/flow_offload.c: note: in included file (through include/linux/netlink.h, include/net/flow_offload.h, include/net/act_api.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/netdev-genl.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/netdev-genl.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/net-procfs.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/net-procfs.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/xdp.c: note: in included file (through include/linux/skbuff.h, include/linux/filter.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/xdp.c: note: in included file (through include/linux/filter.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/neighbour.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/neighbour.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/gro.c: note: in included file (through include/linux/skbuff.h, include/linux/ip.h, include/net/gro.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/gro.c: note: in included file (through include/linux/ip.h, include/net/gro.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/sock.c: note: in included file (through include/linux/skbuff.h, include/linux/ip.h, include/net/ip.h, include/linux/errqueue.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/sock.c: note: in included file (through include/linux/ip.h, include/net/ip.h, include/linux/errqueue.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/net-sysfs.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/net-sysfs.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/gro_cells.c: note: in included file (through include/linux/skbuff.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/gro_cells.c: note: in included file:
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/ptp_classifier.c: note: in included file (through include/linux/skbuff.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/ptp_classifier.c: note: in included file:
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/of_net.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/etherdevice.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/of_net.c: note: in included file (through include/linux/if_ether.h, include/linux/etherdevice.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/failover.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/etherdevice.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/failover.c: note: in included file (through include/linux/if_ether.h, include/linux/etherdevice.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/dst_cache.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/dst_cache.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, include/net/dst.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/rtnetlink.c: note: in included file (through include/linux/skbuff.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/rtnetlink.c: note: in included file:
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/skbuff.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/inet.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/skbuff.c: note: in included file (through include/net/net_namespace.h, include/linux/inet.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
>> net/core/skbuff.c:848:68: sparse: sparse: invalid modifier
--
   net/core/dev.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/dev.c: note: in included file (through include/linux/if_ether.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/net-traces.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/net-traces.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/core/filter.c: note: in included file (through include/linux/skbuff.h, include/linux/filter.h, include/linux/bpf_verifier.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/core/filter.c: note: in included file (through include/linux/filter.h, include/linux/bpf_verifier.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/common.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/common.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/strset.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/strset.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/wol.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/wol.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/privflags.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/privflags.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/linkstate.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/linkstate.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/rss.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/rss.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/debug.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/debug.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/linkinfo.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/linkinfo.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/bitset.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/bitset.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/linkmodes.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/linkmodes.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/features.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/features.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/netlink.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/netlink.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, include/net/sock.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/rings.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/rings.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/channels.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/channels.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, include/net/sock.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/pause.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/pause.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/eee.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/eee.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/ioctl.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/etherdevice.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/ioctl.c: note: in included file (through include/linux/if_ether.h, include/linux/etherdevice.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/coalesce.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/coalesce.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/tsinfo.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/tsinfo.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/cabletest.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/cabletest.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/linux/phy.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/fec.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/fec.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/tunnels.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/tunnels.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/eeprom.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/eeprom.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/module.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/module.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/plca.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/plca.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/linux/phy.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/phc_vclocks.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/phc_vclocks.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/pse-pd.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/pse-pd.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, net/ethtool/common.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/stats.c: note: in included file (through include/linux/skbuff.h, include/linux/if_ether.h, include/linux/ethtool.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/stats.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/uapi/linux/ethtool_netlink.h, ...):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier
--
   net/ethtool/mm.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h, ...):
>> include/net/netmem.h:28:54: sparse: sparse: invalid modifier
   include/net/netmem.h:36:26: sparse: sparse: invalid modifier
   include/net/netmem.h:38:27: sparse: sparse: invalid modifier
   net/ethtool/mm.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, net/ethtool/common.h):
>> include/linux/skbuff.h:364:20: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2440:57: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2456:67: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2498:54: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2521:52: sparse: sparse: invalid modifier
   include/linux/skbuff.h:2571:68: sparse: sparse: invalid modifier

vim +364 include/linux/skbuff.h

3953c46c3ac7ee Marcelo Ricardo Leitner 2016-06-02  362  
b2e5852793b6eb Mina Almasry            2023-12-20  363  typedef struct skb_frag {
b2e5852793b6eb Mina Almasry            2023-12-20 @364  	netmem_ref netmem;
b2e5852793b6eb Mina Almasry            2023-12-20  365  	unsigned int len;
b2e5852793b6eb Mina Almasry            2023-12-20  366  	unsigned int offset;
b2e5852793b6eb Mina Almasry            2023-12-20  367  } skb_frag_t;
^1da177e4c3f41 Linus Torvalds          2005-04-16  368  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
