Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F972C11D6
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Feb 2026 16:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770394146; cv=none; b=a8p+NESspyGvLurHRZtAMpjdzanD+kX5A2OUKNmZqvO61JvgY1X2+3f9opDznwXhJNrvWT9JNYXsaSc4S8IodfcCSv5YwOTGIDu3vb6AdDgqpXW+RUH24vpzLtmynintUySNUm5Y6NJftiMVxQ5aZhSJb6G8guqOWqS7/pKdzEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770394146; c=relaxed/simple;
	bh=n8ZPNkCPv9x2gPK/113tBgTE6Medek5X2u9TzBs5PeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iRWiu57dp+btpCvv51RaJnRMg9l6KVKpRvNisng6gTJLQ7gDKJO2W+tTSp1iEhPN4BbbeYZSJff8jwrh5fA5XCoT++pHvu5z/CP9EO8hRb14J8H6o7BcLJPzwcTbxtVeyvon6dur+kxCb9AGIW/r8lXOpsa9nG5pabd4j75l8ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IF52/+MN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IF52/+MN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770394146; x=1801930146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n8ZPNkCPv9x2gPK/113tBgTE6Medek5X2u9TzBs5PeE=;
  b=IF52/+MNGLAtH5sJx17wBwA+i+iTBUUOmuPDJ9rVU025YMFbLUyroRfH
   C8cjorQcxiryOBdXpGHJKdru1lxd0bUPJjhkLkdjbY3pWfIpEGK0lH+X3
   oUvIMZPZYHON/paG9108VxIg8Qh04+Km4poweapjYlnpW6S6whV6hFmUI
   Q2gLU89h12hqRgM+HOY+VwVqqAtg+hn/1FviPa2sjUG+dWs9f8gK61uPX
   8twyxgfKugfNG29Nba2P8fzIWx6YuGbntOpVRqGslHhn0sAMhLAmZZ6tc
   I4OYcqTBEWw9gtTK9gfbSrxxeDvVIeAHxjU8bnQIikSkBZz+nEYK9V8Fx
   Q==;
X-CSE-ConnectionGUID: /caPOI+CTfez4BZObguxaA==
X-CSE-MsgGUID: F80mZNPcRLyF4XaJdebeeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71638999"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="71638999"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 08:09:06 -0800
X-CSE-ConnectionGUID: 0ZEtMAZvSmiJ1P72PgCaCw==
X-CSE-MsgGUID: /KfzvIvSTXO00rmJ+/2xEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215880508"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2026 08:09:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voOOD-00000000ksu-2qVy;
	Fri, 06 Feb 2026 16:09:01 +0000
Date: Sat, 7 Feb 2026 00:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next] ipv6: do not use skb_header_pointer() in
 icmpv6_filter()
Message-ID: <202602070031.mVXyY4B6-lkp@intel.com>
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
In-Reply-To: <20260205211909.4115285-1-edumazet@google.com>
References: <20260205211909.4115285-1-edumazet@google.com>
TO: Eric Dumazet <edumazet@google.com>
TO: "David S . Miller" <davem@davemloft.net>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: David Ahern <dsahern@kernel.org>
CC: Kuniyuki Iwashima <kuniyu@google.com>
CC: netdev@vger.kernel.org
CC: eric.dumazet@gmail.com
CC: Eric Dumazet <edumazet@google.com>

Hi Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/ipv6-do-not-use-skb_header_pointer-in-icmpv6_filter/20260206-052215
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260205211909.4115285-1-edumazet%40google.com
patch subject: [PATCH net-next] ipv6: do not use skb_header_pointer() in icmpv6_filter()
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-161-20260206 (https://download.01.org/0day-ci/archive/20260207/202602070031.mVXyY4B6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602070031.mVXyY4B6-lkp@intel.com/

smatch warnings:
net/ipv6/raw.c:110 icmpv6_filter() warn: potential spectre issue 'data' [r]

vim +/data +110 net/ipv6/raw.c

^1da177e4c3f41 Linus Torvalds     2005-04-16   88  
^1da177e4c3f41 Linus Torvalds     2005-04-16   89  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16   90   *	0 - deliver
^1da177e4c3f41 Linus Torvalds     2005-04-16   91   *	1 - block
^1da177e4c3f41 Linus Torvalds     2005-04-16   92   */
65ae4f7e222cd3 Eric Dumazet       2026-02-05   93  static int icmpv6_filter(const struct sock *sk, struct sk_buff *skb)
^1da177e4c3f41 Linus Torvalds     2005-04-16   94  {
1b05c4b50edbdd Eric Dumazet       2012-09-25   95  	const struct icmp6hdr *hdr;
65ae4f7e222cd3 Eric Dumazet       2026-02-05   96  	const __u32 *data;
65ae4f7e222cd3 Eric Dumazet       2026-02-05   97  	unsigned int type;
^1da177e4c3f41 Linus Torvalds     2005-04-16   98  
d1c53c8e870cde Werner Almesberger 2013-08-02   99  	/* We require only the four bytes of the ICMPv6 header, not any
d1c53c8e870cde Werner Almesberger 2013-08-02  100  	 * additional bytes of message body in "struct icmp6hdr".
d1c53c8e870cde Werner Almesberger 2013-08-02  101  	 */
65ae4f7e222cd3 Eric Dumazet       2026-02-05  102  	if (!pskb_may_pull(skb, ICMPV6_HDRLEN))
65ae4f7e222cd3 Eric Dumazet       2026-02-05  103  		return 1;
65ae4f7e222cd3 Eric Dumazet       2026-02-05  104  
65ae4f7e222cd3 Eric Dumazet       2026-02-05  105  	hdr = (struct icmp6hdr *)skb->data;
65ae4f7e222cd3 Eric Dumazet       2026-02-05  106  	type = hdr->icmp6_type;
65ae4f7e222cd3 Eric Dumazet       2026-02-05  107  
65ae4f7e222cd3 Eric Dumazet       2026-02-05  108  	data = &raw6_sk(sk)->filter.data[0];
^1da177e4c3f41 Linus Torvalds     2005-04-16  109  
1b05c4b50edbdd Eric Dumazet       2012-09-25 @110  	return (data[type >> 5] & (1U << (type & 31))) != 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  111  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  112  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
