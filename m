Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50268278E6A
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Jul 2025 09:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753348332; cv=none; b=aeeRXQrqBXgIgWL9w098srDAN8cany9b7i1Ci35UnX3jv6P2nn0+r8R9yN5x+5ZmxJOyNDxuz1myOjC9/CW8K0imZhtpsULYIXBjadL4KN8tYEBT34YKvnXevzqyCXKUvpQwraH6sggf8j9MX8xyWdbkJ8wchZhnaiBHyTTbrf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753348332; c=relaxed/simple;
	bh=XFWa9r5hcu2ksWamlg1HkLENPT60euawLOvQIg+bKOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u/NG98mdfelaO9EKXfDT/n1HSq5JlzDU0zkyo98OIqkZEQU2DR6lR9vD0e2uQmlCM3sVmurIbqXY9fYbW/3SagvHlhzEzA8Ybvhz07VcSeasZynC9uclJTa3x9cFsVYQKq4T5DaH+YvX3fHdHdKLcWONe7tv3sto5ac4BMW7kak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGiBQwV5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGiBQwV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753348328; x=1784884328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XFWa9r5hcu2ksWamlg1HkLENPT60euawLOvQIg+bKOA=;
  b=YGiBQwV581mNmDC1e0lUtwMP6/ZTIt1hQcD8oE2lzmZCb1KJFu5dKZCB
   NVo3VTE5zr9xlfNuhf4gPzv3kIupyafNRUykeHKpedo/RhixJaII0W+aD
   t7G3B4gtYlgWbjCNzyMY3boNja32AhSi3Rmf4i9/laOEFsj+WxLdTWV8W
   4iQs2d4usYRXUnfPU5wrTx327GmZxDPouKU3SUtYS+rd24PS1TrMLfHrW
   ubGYL1rFdiK5ugkOFpsGLn2OJ8yJrfY7P917Vfj7e78vi5E8v/qkDWoC6
   U2yttrFO7Jbx876fOrbp5hsdJmWpF+kBNZ/+YbDHUa11thTd6JHIPSwd9
   w==;
X-CSE-ConnectionGUID: saAm4KDaTkiBEIX4qfZPeA==
X-CSE-MsgGUID: 7v2h5Ne7TGWINsb4YhPOFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66349622"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="66349622"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 02:12:06 -0700
X-CSE-ConnectionGUID: NsP3I3bSSBS9hszkffcGvg==
X-CSE-MsgGUID: hNCnZ5Q5SiWsgso9VyM/PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="160219176"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Jul 2025 02:12:04 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uerzd-000KGW-19;
	Thu, 24 Jul 2025 09:12:01 +0000
Date: Thu, 24 Jul 2025 17:11:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gustavoars:testing/wfamnae-next20250723 14/14]
 include/net/ip.h:53:1: sparse: sparse: directive in macro's argument list
Message-ID: <202507241726.sSdc7F3m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/net/ip.h:53:1: sparse: sparse: directive in macro's argument list"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: LKML <linux-kernel@vger.kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250723
head:   49c6b94fa76fb9af574157e2c2b25f7894a744f4
commit: 49c6b94fa76fb9af574157e2c2b25f7894a744f4 [14/14] treewide-TRAILING_OVERLAP: Avoid -Wflex-array-member-not-at-end warnings
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: m68k-randconfig-r122-20250724 (https://download.01.org/0day-ci/archive/20250724/202507241726.sSdc7F3m-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250724/202507241726.sSdc7F3m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507241726.sSdc7F3m-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/freescale/fec_main.c: note: in included file:
>> include/net/ip.h:53:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:54:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:55:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:56:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:57:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:58:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:59:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:60:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:61:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:62:1: sparse: sparse: directive in macro's argument list
   include/net/ip.h:63:1: sparse: sparse: directive in macro's argument list

vim +53 include/net/ip.h

^1da177e4c3f41 Linus Torvalds       2005-04-16  46  
fd2c3ef761fbc5 Eric Dumazet         2009-11-03  47  struct inet_skb_parm {
0b922b7a829c06 David Ahern          2016-05-10  48  	int			iif;
49c6b94fa76fb9 Gustavo A. R. Silva  2025-07-01  49  	TRAILING_OVERLAP(struct ip_options, opt, __data,
49c6b94fa76fb9 Gustavo A. R. Silva  2025-07-01  50  			 		/* Compiled IP options		*/
a04a480d4392ea David Ahern          2016-10-16  51  			 u16			flags;
^1da177e4c3f41 Linus Torvalds       2005-04-16  52  
df4d92549f23e1 Hannes Frederic Sowa 2015-01-23 @53  #define IPSKB_FORWARDED		BIT(0)
df4d92549f23e1 Hannes Frederic Sowa 2015-01-23  54  #define IPSKB_XFRM_TUNNEL_SIZE	BIT(1)
df4d92549f23e1 Hannes Frederic Sowa 2015-01-23  55  #define IPSKB_XFRM_TRANSFORMED	BIT(2)
df4d92549f23e1 Hannes Frederic Sowa 2015-01-23  56  #define IPSKB_FRAG_COMPLETE	BIT(3)
df4d92549f23e1 Hannes Frederic Sowa 2015-01-23  57  #define IPSKB_REROUTED		BIT(4)
df4d92549f23e1 Hannes Frederic Sowa 2015-01-23  58  #define IPSKB_DOREDIRECT	BIT(5)
d6b915e29f4ade Florian Westphal     2015-05-22  59  #define IPSKB_FRAG_PMTU		BIT(6)
9ee6c5dc816aa8 Lance Richardson     2016-11-02  60  #define IPSKB_L3SLAVE		BIT(7)
e6175a2ed1f18b Eyal Birger          2022-05-13  61  #define IPSKB_NOPOLICY		BIT(8)
6ac66cb03ae306 Sriram Yagnaraman    2023-08-31  62  #define IPSKB_MULTIPATH		BIT(9)
35bec72a24ace5 Petr Machata         2025-06-17  63  #define IPSKB_MCROUTE		BIT(10)
5f2d04f1f9b526 Patrick McHardy      2012-08-26  64  
5f2d04f1f9b526 Patrick McHardy      2012-08-26  65  	u16			frag_max_size;
49c6b94fa76fb9 Gustavo A. R. Silva  2025-07-01  66  	);};
^1da177e4c3f41 Linus Torvalds       2005-04-16  67  

:::::: The code at line 53 was first introduced by commit
:::::: df4d92549f23e1c037e83323aff58a21b3de7fe0 ipv4: try to cache dst_entries which would cause a redirect

:::::: TO: Hannes Frederic Sowa <hannes@stressinduktion.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
