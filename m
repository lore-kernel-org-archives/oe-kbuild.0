Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6DF8F5C
	for <oe-kbuild@lists.linux.dev>; Sun, 25 May 2025 08:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748161830; cv=none; b=pEgYlys7KkVD4G4k+axf1VyTVNcM80SZH89XXpHoaafCnnDnzElrAKn+Ko8wHH+b14HpyUeeqt2kQjdoO+7H6TxIBDEebNj7jzDVFmGGAbPvdykRAtJxIGZvf3K/ECP4Q1coIZfYVMtwEzvdgS3yMso8qYyKfRlC/c/0bS+Jm24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748161830; c=relaxed/simple;
	bh=zylh1Bm7qB7N6T7ZXTQ56Oj635Rz5kakW2ygRVxlNMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N4v5xn6mdZtORlu2fatdoS/UKLpLG2I+4d5Q4cu/FuiBhntSZB+Z6kZyVuQ4p2YOkGdtPVX78sGDcHEdG/uolQCWOcTXRFNSt77tjyoAiLZ0u2lGFqX22WoK+PoMuvEF6ecsZmw8dEGaGjWWtsuJaaC2/NqB2dDyumWBDd7A44k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D2TiDZB7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2TiDZB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748161828; x=1779697828;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zylh1Bm7qB7N6T7ZXTQ56Oj635Rz5kakW2ygRVxlNMI=;
  b=D2TiDZB7xaZ4nyrr6/w9ezeLV+XXSK9/JMoI390VQOUEBtxF+ys2T5yR
   0EawxAk649qILajyLFryZmwKX4Q8Bh5GivtZKUe5pDTCwA2SbjCJtfP6f
   GNjtzlog997k1nfNSSraB11DkLYBxC8Y6N4YQeqTUFJjTKxPiZXsIO25x
   jM09djvPb1WNQ51uKGX3Z3A73melaF79JHqjD+WgTG3sYoN+ROaZemL2G
   fZmZK1fH7MWm4PE9dTvX4sSoOSgcaNB7lX8LRBOVCYumpeU8UlqU2CR5X
   SqoWxYM5WxURb+T5CQUa9PVKw0xR1V4wI/r+/QIHFcgvv7S2WHD1l2Jxs
   g==;
X-CSE-ConnectionGUID: 8vWAtVXKS+eSwwKYOlJ9RQ==
X-CSE-MsgGUID: jfpZxGaYR0a27nejnvWJQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="53963446"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="53963446"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 01:30:28 -0700
X-CSE-ConnectionGUID: saS/eEUpT3aiMxakUkGHHA==
X-CSE-MsgGUID: 55D8sp2xQ4+Nt715Lp6kOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="172805633"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 May 2025 01:30:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ6kS-000RhS-1I;
	Sun, 25 May 2025 08:30:24 +0000
Date: Sun, 25 May 2025 16:30:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 3/5] net: bridge: mcast: check if snooping is
 enabled for active state
Message-ID: <202505251623.Hwyj2Nam-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250522195952.29265-4-linus.luessing@c0d3.blue>
References: <20250522195952.29265-4-linus.luessing@c0d3.blue>
TO: "Linus Lüssing" <linus.luessing@c0d3.blue>
TO: bridge@lists.linux.dev
CC: netdev@vger.kernel.org
CC: openwrt-devel@lists.openwrt.org
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: Nikolay Aleksandrov <razor@blackwall.org>
CC: Ido Schimmel <idosch@nvidia.com>
CC: Ivan Vecera <ivecera@redhat.com>
CC: Jiri Pirko <jiri@resnulli.us>
CC: Vladimir Oltean <olteanv@gmail.com>
CC: Andrew Lunn <andrew@lunn.ch>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Simon Horman <horms@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Eric Dumazet <edumazet@google.com>
CC: "David S . Miller" <davem@davemloft.net>
CC: Kuniyuki Iwashima <kuniyu@amazon.com>
CC: Stanislav Fomichev <sdf@fomichev.me>
CC: Xiao Liang <shaw.leon@gmail.com>
CC: Markus Stockhausen <markus.stockhausen@gmx.de>
CC: Jan Hoffmann <jan.christian.hoffmann@gmail.com>
CC: Birger Koblitz <git@birger-koblitz.de>
CC: "Bjørn Mork" <bjorn@mork.no>
CC: "Linus Lüssing" <linus.luessing@c0d3.blue>

Hi Linus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on linus/master v6.15-rc7 next-20250523]
[cannot apply to net-next/main horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-L-ssing/net-bridge-mcast-explicitly-track-active-state/20250523-040914
base:   net/main
patch link:    https://lore.kernel.org/r/20250522195952.29265-4-linus.luessing%40c0d3.blue
patch subject: [PATCH net-next 3/5] net: bridge: mcast: check if snooping is enabled for active state
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: parisc-randconfig-r072-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251623.Hwyj2Nam-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505251623.Hwyj2Nam-lkp@intel.com/

smatch warnings:
net/bridge/br_multicast.c:1416 br_multicast_toggle_enabled() error: uninitialized symbol 'old'.

vim +/old +1416 net/bridge/br_multicast.c

8ef2a9a5985499 YOSHIFUJI Hideaki 2010-04-18  1406  
f9230cbb1d35c0 Linus Lüssing     2025-05-22  1407  static int br_multicast_toggle_enabled(struct net_bridge *br, bool on,
f9230cbb1d35c0 Linus Lüssing     2025-05-22  1408  				       struct netlink_ext_ack *extack)
f9230cbb1d35c0 Linus Lüssing     2025-05-22  1409  {
f9230cbb1d35c0 Linus Lüssing     2025-05-22  1410  	int err, old;
f9230cbb1d35c0 Linus Lüssing     2025-05-22  1411  
f9230cbb1d35c0 Linus Lüssing     2025-05-22  1412  	br_opt_toggle(br, BROPT_MULTICAST_ENABLED, on);
f9230cbb1d35c0 Linus Lüssing     2025-05-22  1413  
f9230cbb1d35c0 Linus Lüssing     2025-05-22  1414  	err = br_multicast_update_active(&br->multicast_ctx, extack);
f9230cbb1d35c0 Linus Lüssing     2025-05-22  1415  	if (err && err != -EOPNOTSUPP) {
f9230cbb1d35c0 Linus Lüssing     2025-05-22 @1416  		br_opt_toggle(br, BROPT_MULTICAST_ENABLED, old);
f9230cbb1d35c0 Linus Lüssing     2025-05-22  1417  		return err;
f9230cbb1d35c0 Linus Lüssing     2025-05-22  1418  	}
f9230cbb1d35c0 Linus Lüssing     2025-05-22  1419  
f9230cbb1d35c0 Linus Lüssing     2025-05-22  1420  	return 0;
f9230cbb1d35c0 Linus Lüssing     2025-05-22  1421  }
f9230cbb1d35c0 Linus Lüssing     2025-05-22  1422  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
