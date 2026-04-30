Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B138227B94
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 02:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777515693; cv=none; b=gLehwJofXmYarOpg9t+PibJaJfzMFBZQUpAc2DrVGt5J4TqiG+b+3B3DRQxTsTRj7mk90GseN44g2ZIrDw70MQzzmODbOr1aAcWsmQbkobZlP17yzX5XX+YLxSKgJlM/YqeClpQ/p6nfaQ6bar84NgER2q2khTbkphyK44vYDTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777515693; c=relaxed/simple;
	bh=VyWTDDPRzQrqxzTkrKnjA3saffY+AxNFz31PLTXG5cs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XcW80T50uDo6VopRrTjNW4x0HoGz4LYDtGqhc3MdJN1PBygYdB6FkZWzYI0welNTtu4Qw353D3o7V6LqfVnD9f7Pw/hjvPfdjjyedJzT5RI/lizLi6hv1RZPVauu9ELUQ0g++WsbA/Bj6DA/zV1hB+JQSInyD42HGnqLv3UjYk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OyoeUXPv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OyoeUXPv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777515691; x=1809051691;
  h=date:from:to:cc:subject:message-id;
  bh=VyWTDDPRzQrqxzTkrKnjA3saffY+AxNFz31PLTXG5cs=;
  b=OyoeUXPvCFEGWgGTrwnMplg6SMSevdxNw9JolBuxqk0WKIQBv2IGdFfi
   6RhsoDF1tLXGysoi1iY1NcBW8cdhx2FDNzFB4Em0oCDi2bg417QkTFnne
   yggYGqYFWlvkTNXrM+FmPB6gQw+DqTeWiT5nwvdNYpun9aMpJ5I1d1wU3
   lrhZDxVeK6Bv1L6E2TWYEupRryYgDQEnidmXWzEDbhDKynbxdMfMIPtl0
   PE6uMHbPnm1q1SRHtsrn+fLoeCty6PGvoJSNGwIaMaQEFIXyq79IptAUK
   oaSGO3oR0LpICNWxV3WDvygGGI6BQRqRYFTAd2Bia8xH3jU8wD7K2vF+L
   Q==;
X-CSE-ConnectionGUID: EMWjj+wjSXue50fwXUYwkA==
X-CSE-MsgGUID: e1XE+PCXTXWjg9yN2mXt5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="65988941"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="65988941"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 19:21:31 -0700
X-CSE-ConnectionGUID: 2KKzTQ9+RmaPPPghcBL9cg==
X-CSE-MsgGUID: 7ZDTJ/lfTmWaVruIv1jdtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="234472142"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 29 Apr 2026 19:21:30 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIH1r-000000004hx-3jnS;
	Thu, 30 Apr 2026 02:21:27 +0000
Date: Thu, 30 Apr 2026 04:20:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: net/core/filter.c:12452 function parameter '__skb'
 not described in 'bpf_icmp_send_unreach'
Message-ID: <202604300432.0LEemGgY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mahe Tardy <mahe.tardy@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Mahe-Tardy/net-move-netfilter-nf_reject_fill_skb_dst-to-core-ipv4/20260422-023045
head:   d72fd33db9e989d2176eb7258628541a79b12f25
commit: 14ac641ff7c1cd265cdc9e9336c21600ce31a718 bpf: add bpf_icmp_send_unreach kfunc
date:   8 days ago
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260430/202604300432.0LEemGgY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300432.0LEemGgY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604300432.0LEemGgY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: net/core/filter.c:12452 function parameter '__skb' not described in 'bpf_icmp_send_unreach'
>> Warning: net/core/filter.c:12452 function parameter '__skb' not described in 'bpf_icmp_send_unreach'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
