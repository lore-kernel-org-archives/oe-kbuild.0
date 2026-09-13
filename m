Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2122433BBAF
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Sep 2026 20:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789331265; cv=none; b=SDBQx7kr2pGXVNJjLWuEv0ZZ9LRX0lnbmZGH5wjh3X/U/V/ySUKVChsrkukqck/jCUAeWmUvFy1dDh0XTse9HAn90e97W+VHoTh4pPqSD+ScWHaUE6Q+QgdpzAq3uU5Kd8UhbWKqUMgi+YtFTs1knpsKVP3v0tsLaYCUXOYHFzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789331265; c=relaxed/simple;
	bh=OqAot0hVBXime7STcw1iKyEeOPfxtjhg20oCQsjj0RA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sk36se8cH089yfsoXsWvRY4WK3smaQJivB0/EsVrIHfdyeHeTAikDd1GkIKJ6/QKMmyeFVAbvyiiwsE1lZmkYb59QMl7sx6y6b3bc51LrxpPJMT/1g3HK6PeEp06Di0t/ThvTV0BK1oQulCRcKQ+a6m5AirApBNu9GG4w9hk0eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F3C/6EqW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3C/6EqW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789331262; x=1820867262;
  h=date:from:to:cc:subject:message-id;
  bh=OqAot0hVBXime7STcw1iKyEeOPfxtjhg20oCQsjj0RA=;
  b=F3C/6EqW9ddhea2HWcFmeVGAYqHRQ3R/nLWl4h90mo5gpZ8ohz0yWbJh
   b0dMsYfDfGfJScGJGibcM8ey6Cm03fiwsGDX4cJNJMNNVud/sYJf/lRmD
   Hn+cj6BhsV03F2E4d4LybqSoOoItqkmtVAwO+v/d+bPUw4kB4kNiexzvy
   XDnqwOh/29PsGZ1bur/wioBLf8tGcBGIy2o2q+ylUFIfSwr11TJZhqb4f
   lA0fQDwrXGkqFDNxOYdHpuqKN4TXJM736Y0hhxXbbVYSCBhKLL3ipzbUX
   lM7WzW7MqbxEEm54fqhu4O9SohKSqCIAthYnwC8iaTLftbkt4kPylHbRD
   A==;
X-CSE-ConnectionGUID: XVGFDrCPTH2bdJdzoiNUcg==
X-CSE-MsgGUID: L1L21epyTy6VapClHGcxtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89907490"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89907490"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 13:27:41 -0700
X-CSE-ConnectionGUID: 8HwMSGJzTg27QGjIUCsX5g==
X-CSE-MsgGUID: Imzh3R1/SE6zodXot1uTdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="690028"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 13 Sep 2026 13:27:39 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5qnY-000000001hb-2esw;
	Sun, 13 Sep 2026 20:27:36 +0000
Date: Sun, 13 Sep 2026 22:27:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ppp/ppp_synctty.c:469 ppp_sync_txmunge() warn:
 variable dereferenced before check 'skb' (see line 443)
Message-ID: <202609132245.txZXoUxc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Qingfang Deng <qingfang.deng@linux.dev>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Eric Dumazet <edumazet@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d681d7ef617ef83d6a4de36e5cb4418ef602e122
commit: 8aaeb56aff2a557a88f83ae866da2c91ad247e59 ppp_synctty: ensure a writeable skb header
date:   4 days ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20260913 (https://download.01.org/0day-ci/archive/20260913/202609132245.txZXoUxc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 8aaeb56aff2a ("ppp_synctty: ensure a writeable skb header")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609132245.txZXoUxc-lkp@intel.com/

smatch warnings:
drivers/net/ppp/ppp_synctty.c:469 ppp_sync_txmunge() warn: variable dereferenced before check 'skb' (see line 443)

vim +/skb +469 drivers/net/ppp/ppp_synctty.c

^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  426  
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  427  /*
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  428   * Procedures for encapsulation and framing.
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  429   */
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  430  
3c582b30bc2592 drivers/net/ppp_synctty.c     Stephen Hemminger 2008-01-23  431  static struct sk_buff*
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  432  ppp_sync_txmunge(struct syncppp *ap, struct sk_buff *skb)
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  433  {
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  434  	int proto;
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  435  	unsigned char *data;
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  436  	int islcp;
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  437  
aabc6596ffb377 drivers/net/ppp/ppp_synctty.c Arnaud Lecomte    2025-04-08  438  	/* Ensure we can safely access protocol field and LCP code */
aabc6596ffb377 drivers/net/ppp/ppp_synctty.c Arnaud Lecomte    2025-04-08  439  	if (!pskb_may_pull(skb, 3)) {
aabc6596ffb377 drivers/net/ppp/ppp_synctty.c Arnaud Lecomte    2025-04-08  440  		kfree_skb(skb);
aabc6596ffb377 drivers/net/ppp/ppp_synctty.c Arnaud Lecomte    2025-04-08  441  		return NULL;
aabc6596ffb377 drivers/net/ppp/ppp_synctty.c Arnaud Lecomte    2025-04-08  442  	}
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16 @443  	data  = skb->data;
96545aeb7b4457 drivers/net/ppp_synctty.c     Changli Gao       2011-01-06  444  	proto = get_unaligned_be16(data);
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  445  
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  446  	/* LCP packets with codes between 1 (configure-request)
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  447  	 * and 7 (code-reject) must be sent as though no options
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  448  	 * have been negotiated.
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  449  	 */
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  450  	islcp = proto == PPP_LCP && 1 <= data[2] && data[2] <= 7;
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  451  
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  452  	/* compress protocol field if option enabled */
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  453  	if (data[0] == 0 && (ap->flags & SC_COMP_PROT) && !islcp)
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  454  		skb_pull(skb,1);
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  455  
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  456  	/* prepend address/control fields if necessary */
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  457  	if ((ap->flags & SC_COMP_AC) == 0 || islcp) {
8aaeb56aff2a55 drivers/net/ppp/ppp_synctty.c Qingfang Deng     2026-09-08  458  		if (skb_cow_head(skb, 2)) {
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  459  			kfree_skb(skb);
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  460  			return NULL;
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  461  		}
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  462  		skb_push(skb,2);
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  463  		skb->data[0] = PPP_ALLSTATIONS;
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  464  		skb->data[1] = PPP_UI;
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  465  	}
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  466  
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  467  	ap->last_xmit = jiffies;
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  468  
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16 @469  	if (skb && ap->flags & SC_LOG_OUTPKT)
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  470  		ppp_print_buffer ("send buffer", skb->data, skb->len);
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  471  
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  472  	return skb;
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  473  }
^1da177e4c3f41 drivers/net/ppp_synctty.c     Linus Torvalds    2005-04-16  474  

:::::: The code at line 469 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
