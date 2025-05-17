Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B474C1DF973
	for <oe-kbuild@lists.linux.dev>; Sat, 17 May 2025 18:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747507211; cv=none; b=iPrdFYbjlZxv0OoKLsDFSG9iOdhYpKVYnsssUirH1M+8ZcpHwAhUA2HUxkcTQM+tJ+MVU1oqP0oo4YEt1S5+CcgzUWj/AHM7FrRl3ns76vS4K1sAVry3JeDqI1Xkb6JTjvTzbh8kAyqBc5G6mw5Qja9L4Qjmdx52wTYv4J6LYzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747507211; c=relaxed/simple;
	bh=V0pLvdci9AK0jnfqLQUF3uGSIzRaW6W5dg1DcYQdH3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ppRC6ugoKGAhOEeWoiPhwuIRfTE9goHT7qfdj5NvJt8v+3cAjFuoT5LM/1us2jqa+YcCDKPNwPEnH6611b20YyoJhTBIsAwwfv4HrTJLO9vtjyBVd8Gk/sCeDSdI59oZfjmqR+EgTQ7bdRmjuunHw92a+32uA46S0aCtN7Et0yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kj1atsK1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kj1atsK1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747507209; x=1779043209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V0pLvdci9AK0jnfqLQUF3uGSIzRaW6W5dg1DcYQdH3c=;
  b=kj1atsK1iyrexfKoA696LaPvclw0iAAbbp+L2n1AdQ2cV9zD63ZxN3u2
   QAanQ6wqgFUBEnJXZvdoEvzS8HJ+QNJ4PiCUTBcLaPyDUi0mQhy3CgHD1
   uG9GrCIbt+FkekorBQk7pz3fbwfI/T4EZH2YX76eF+4AC7ItExyf7zmBC
   CQp4TAZjKcEyf23DrRRhEkGM7PecE/FFkupwsOfxYOSbouv8qO4Nb3LSc
   7zOA9fuDKc2osYYfBhF5AQMUX5NVLkJQ21wk3/piD+qXo85iKceAkktze
   ay9NUZWq9eT2s+Y4nps+MyEe4TdkbTaO+BTIRW/q4SL8YVCC+JS0TQyfC
   g==;
X-CSE-ConnectionGUID: bz7mMqRZRUKd5wsur6f9Zg==
X-CSE-MsgGUID: 5E6Ob+R3TCWudiMhiqPNFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="53129135"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="53129135"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 11:40:08 -0700
X-CSE-ConnectionGUID: 5Ct7MX0ZRIa0lcNrulpoAA==
X-CSE-MsgGUID: TiNr49VPTKKj40KFke7QFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="138890990"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 May 2025 11:40:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGMS4-000KLT-1z;
	Sat, 17 May 2025 18:40:04 +0000
Date: Sun, 18 May 2025 02:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kees:dev/v6.15-rc4/famnae 5/17] include/net/ip.h:54:1: sparse:
 sparse: directive in macro's argument list
Message-ID: <202505180222.nO5S5lDP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/net/ip.h:54:1: sparse: sparse: directive in macro's argument list"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kees Cook <kees@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v6.15-rc4/famnae
head:   285522439aeea637ff1ae3f98148865b4351ccd8
commit: 834821798f7b4c6006676903a3a07f154ea6f2ba [5/17] ip: Explicitly overlap struct inet_skb_parm with struct ip_options
:::::: branch date: 23 hours ago
:::::: commit date: 24 hours ago
config: alpha-randconfig-r132-20250517 (https://download.01.org/0day-ci/archive/20250518/202505180222.nO5S5lDP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250518/202505180222.nO5S5lDP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505180222.nO5S5lDP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/sqpoll.c: note: in included file (through include/net/busy_poll.h, io_uring/napi.h):
>> include/net/ip.h:54:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:55:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:56:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:57:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:58:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:59:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:60:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:61:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:62:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:63:1: sparse: sparse: directive in macro's argument list
   io_uring/sqpoll.c: note: in included file (through io_uring/io_uring.h):
   include/linux/io_uring_types.h:201:37: sparse: sparse: array of flexible structures
   io_uring/sqpoll.c:42:9: sparse: sparse: context imbalance in 'io_sq_thread_unpark' - wrong count at exit
   io_uring/sqpoll.c:54:9: sparse: sparse: context imbalance in 'io_sq_thread_park' - wrong count at exit
--
   io_uring/register.c: note: in included file (through include/net/busy_poll.h, io_uring/napi.h):
>> include/net/ip.h:54:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:55:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:56:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:57:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:58:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:59:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:60:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:61:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:62:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:63:1: sparse: sparse: directive in macro's argument list
   io_uring/register.c: note: in included file:
   include/linux/io_uring_types.h:201:37: sparse: sparse: array of flexible structures
--
   io_uring/napi.c: note: in included file (through include/net/busy_poll.h, io_uring/napi.h):
>> include/net/ip.h:54:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:55:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:56:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:57:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:58:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:59:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:60:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:61:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:62:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:63:1: sparse: sparse: directive in macro's argument list
   io_uring/napi.c:84:12: sparse: sparse: context imbalance in '__io_napi_del_id' - wrong count at exit
   io_uring/napi.c:116:9: sparse: sparse: context imbalance in '__io_napi_remove_stale' - wrong count at exit
   io_uring/napi.c: note: in included file (through io_uring/io_uring.h):
   include/linux/io_uring_types.h:201:37: sparse: sparse: array of flexible structures
   io_uring/napi.c:263:27: sparse: sparse: context imbalance in 'io_napi_free' - wrong count at exit
--
   io_uring/poll.c: note: in included file (through include/net/busy_poll.h, io_uring/napi.h):
>> include/net/ip.h:54:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:55:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:56:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:57:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:58:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:59:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:60:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:61:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:62:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:63:1: sparse: sparse: directive in macro's argument list
   io_uring/poll.c:426:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:426:40: sparse:     expected int mask
   io_uring/poll.c:426:40: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:262:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t @@
   io_uring/poll.c:262:38: sparse:     expected signed int [usertype] res
   io_uring/poll.c:262:38: sparse:     got restricted __poll_t
   io_uring/poll.c:276:21: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:284:56: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:283:66: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/poll.c:283:66: sparse:     expected restricted __poll_t [usertype] val
   io_uring/poll.c:283:66: sparse:     got unsigned int
   io_uring/poll.c:283:52: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got unsigned short @@
   io_uring/poll.c:283:52: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/poll.c:283:52: sparse:     got unsigned short
   io_uring/poll.c:286:51: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:286:51: sparse:     expected signed int [usertype] res
   io_uring/poll.c:286:51: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:287:53: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:287:53: sparse:     expected signed int [usertype] res
   io_uring/poll.c:287:53: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:337:71: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:337:65: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/poll.c:337:65: sparse:     expected restricted __poll_t [usertype] val
   io_uring/poll.c:337:65: sparse:     got unsigned int
   io_uring/poll.c:614:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/poll.c:614:40: sparse:     expected int mask
   io_uring/poll.c:614:40: sparse:     got restricted __poll_t [assigned] [usertype] mask
   io_uring/poll.c:677:45: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:677:43: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got unsigned int @@
   io_uring/poll.c:677:43: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/poll.c:677:43: sparse:     got unsigned int
   io_uring/poll.c:711:38: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/poll.c:711:38: sparse:     expected int mask
   io_uring/poll.c:711:38: sparse:     got restricted __poll_t [assigned] [usertype] mask
   io_uring/poll.c:711:55: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int events @@     got restricted __poll_t [usertype] events @@
   io_uring/poll.c:711:55: sparse:     expected int events
   io_uring/poll.c:711:55: sparse:     got restricted __poll_t [usertype] events
   io_uring/poll.c:831:24: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:831:24: sparse:    left side has type unsigned int
   io_uring/poll.c:831:24: sparse:    right side has type restricted __poll_t
   io_uring/poll.c:833:24: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:833:24: sparse:    left side has type unsigned int
   io_uring/poll.c:833:24: sparse:    right side has type restricted __poll_t
   io_uring/poll.c:835:55: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:834:29: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:834:38: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got unsigned int @@
   io_uring/poll.c:834:38: sparse:     expected restricted __poll_t
   io_uring/poll.c:834:38: sparse:     got unsigned int
   io_uring/poll.c:895:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [addressable] [assigned] [usertype] result_mask @@
   io_uring/poll.c:895:40: sparse:     expected signed int [usertype] res
   io_uring/poll.c:895:40: sparse:     got restricted __poll_t [addressable] [assigned] [usertype] result_mask
   io_uring/poll.c:926:38: sparse: sparse: invalid assignment: &=
   io_uring/poll.c:926:38: sparse:    left side has type restricted __poll_t
   io_uring/poll.c:926:38: sparse:    right side has type int
   io_uring/poll.c:927:52: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:927:38: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:927:38: sparse:    left side has type restricted __poll_t
   io_uring/poll.c:927:38: sparse:    right side has type unsigned int
--
   io_uring/io_uring.c: note: in included file (through include/net/busy_poll.h, io_uring/napi.h):
>> include/net/ip.h:54:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:55:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:56:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:57:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:58:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:59:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:60:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:61:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:62:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:63:1: sparse: sparse: directive in macro's argument list
   io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
   include/linux/io_uring_types.h:201:37: sparse: sparse: array of flexible structures
   io_uring/io_uring.c:608:17: sparse: sparse: context imbalance in '__io_submit_flush_completions' - different lock contexts for basic block

vim +54 include/net/ip.h

^1da177e4c3f41 Linus Torvalds       2005-04-16  46  
fd2c3ef761fbc5 Eric Dumazet         2009-11-03  47  struct inet_skb_parm {
0b922b7a829c06 David Ahern          2016-05-10  48  	int			iif;
834821798f7b4c Kees Cook            2025-05-15  49  	TRAILING_OVERLAP(
834821798f7b4c Kees Cook            2025-05-15  50  		/* Compiled IP options		*/
834821798f7b4c Kees Cook            2025-05-15  51  		struct ip_options, opt, __data,
a04a480d4392ea David Ahern          2016-10-16  52  		u16		flags;
^1da177e4c3f41 Linus Torvalds       2005-04-16  53  
df4d92549f23e1 Hannes Frederic Sowa 2015-01-23 @54  #define IPSKB_FORWARDED		BIT(0)
df4d92549f23e1 Hannes Frederic Sowa 2015-01-23  55  #define IPSKB_XFRM_TUNNEL_SIZE	BIT(1)
df4d92549f23e1 Hannes Frederic Sowa 2015-01-23  56  #define IPSKB_XFRM_TRANSFORMED	BIT(2)
df4d92549f23e1 Hannes Frederic Sowa 2015-01-23  57  #define IPSKB_FRAG_COMPLETE	BIT(3)
df4d92549f23e1 Hannes Frederic Sowa 2015-01-23  58  #define IPSKB_REROUTED		BIT(4)
df4d92549f23e1 Hannes Frederic Sowa 2015-01-23  59  #define IPSKB_DOREDIRECT	BIT(5)
d6b915e29f4ade Florian Westphal     2015-05-22  60  #define IPSKB_FRAG_PMTU		BIT(6)
9ee6c5dc816aa8 Lance Richardson     2016-11-02  61  #define IPSKB_L3SLAVE		BIT(7)
e6175a2ed1f18b Eyal Birger          2022-05-13  62  #define IPSKB_NOPOLICY		BIT(8)
6ac66cb03ae306 Sriram Yagnaraman    2023-08-31  63  #define IPSKB_MULTIPATH		BIT(9)
5f2d04f1f9b526 Patrick McHardy      2012-08-26  64  
5f2d04f1f9b526 Patrick McHardy      2012-08-26  65  		u16		frag_max_size;
834821798f7b4c Kees Cook            2025-05-15  66  	);
^1da177e4c3f41 Linus Torvalds       2005-04-16  67  };
834821798f7b4c Kees Cook            2025-05-15  68  TRAILING_OVERLAP_ASSERT(struct inet_skb_parm, opt.__data, flags);
^1da177e4c3f41 Linus Torvalds       2005-04-16  69  

:::::: The code at line 54 was first introduced by commit
:::::: df4d92549f23e1c037e83323aff58a21b3de7fe0 ipv4: try to cache dst_entries which would cause a redirect

:::::: TO: Hannes Frederic Sowa <hannes@stressinduktion.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
