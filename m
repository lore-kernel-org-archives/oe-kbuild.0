Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E22D30C608
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jun 2026 19:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782242128; cv=none; b=GRHKdygHcVe4N9fB4f9DaMRoW3Yzga5+tufUZDIaprhLgyBwzf2lHxGru8MKJvvYdYlFK7vjZfGOHhNNSN7cxkJZ6kZJvjuEg1mJWS7BgJzLPynjJpiWbNfjBS9Yskb1aNS+b+/zrvS+/qtIv2rVMifGi8ceCckFPp1jG4QAuRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782242128; c=relaxed/simple;
	bh=ugO8oWU3gz1kMPYoYqoQppJhnuPHpRsiEZFgVWYEO+Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JfXPQJHL7fA37O8B9YeHfomBzNxmwW2C7et/SdID5rBPKBWQwibVjqZORshvzLPo7WR/AtITKFOJ0G4mE8cBbZKTFBiYflEDrgzG8346rKVNwNxDIxOks9mUY7nUgn1Ch46eOWEU6RWZLqYHemGkomIDV9bG7A7CB7uRjPbtJiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHDZl5MW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHDZl5MW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782242116; x=1813778116;
  h=date:from:to:cc:subject:message-id;
  bh=ugO8oWU3gz1kMPYoYqoQppJhnuPHpRsiEZFgVWYEO+Q=;
  b=UHDZl5MW6B7Oh+0XbRW/loCQrr5uqsyJxf7n3OdzJe+NoVoH5qQFZ2Cg
   9Z+gvg4vYSiAFMWxNWkXA50aLd4uY6hMIpe5KZFRa8OFXb3cNzJlZXY8E
   U79S1qXJtc/tfwlBqv77P0mTCl6+pMWKUkJpbmF1+6vA2gYEDJ1CB/kIm
   sXPfdB+o2d9y4by+w+sD/y4PghsEC0FZVqVq1WKTHQ2NTwC0F5SWVL8c6
   TPQL6SDuwg4DPWAFyAhox/suMzdF4cNy/4cb6BwA0q3NkUumyUdUyqT60
   zpZvnChIPxNywCEjpElV6t2IJQsVQvRjxY1qRk4bgQrU1gPh97ln+lIOA
   w==;
X-CSE-ConnectionGUID: xc6SKpMyTAGb3XYaWjVTfg==
X-CSE-MsgGUID: 3yNIH10RQWeZqvtsGxqVMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82999591"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82999591"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 12:15:15 -0700
X-CSE-ConnectionGUID: 6GXJOFYcTki/yOTCjfhQcg==
X-CSE-MsgGUID: OgUi5isUQUGO4TjF0+ns2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="245233414"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jun 2026 12:15:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc6aV-000000002qP-0MG9;
	Tue, 23 Jun 2026 19:15:11 +0000
Date: Wed, 24 Jun 2026 03:14:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/raid/raid6/powerpc/altivec1.c:37:16: sparse: sparse: two
 or more data types in declaration specifiers
Message-ID: <202606240358.275j56R8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: lib/raid/raid6/powerpc/altivec1.c:37:16: sparse: sparse: two or more data types in declaration specifiers"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   502d801f0ab03e4f32f9a33d203154ce84887921
commit: 3626738bc7147d52cb49f3994a9846aa2d34810a raid6: move to lib/raid/
date:   4 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 4 weeks ago
config: powerpc64-randconfig-r131-20260623 (https://download.01.org/0day-ci/archive/20260624/202606240358.275j56R8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240358.275j56R8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3626738bc714 ("raid6: move to lib/raid/")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606240358.275j56R8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17639:9: sparse: sparse: got vec_perm
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17640:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17640:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17698:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17698:16: sparse: sparse: got unsigned
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:23: sparse: sparse: got short
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:25: sparse: sparse: got short
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:23: sparse: sparse: got int
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:25: sparse: sparse: got int
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:35: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:35: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:42: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:42: sparse: sparse: got char
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17708:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17708:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17713:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17713:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17719:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17719:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17725:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17725:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17731:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17731:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17737:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17737:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17743:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17743:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17978:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17978:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17983:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17983:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17988:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17988:26: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17989:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17989:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17995:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17995:26: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17996:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17996:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18001:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18001:24: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18002:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18002:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18007:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18007:24: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18008:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18008:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18013:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18013:25: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18014:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18014:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18218:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18218:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18235:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18235:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18239:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18239:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18243:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18243:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18247:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18247:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18264:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18264:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18268:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18268:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18272:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18272:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18277:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18277:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec1.c:37:16: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/altivec1.c:37:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   lib/raid/raid6/powerpc/altivec1.c:37:23: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:37:23: sparse: sparse: got char
   lib/raid/raid6/powerpc/altivec1.c:46:45: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:46:45: sparse: sparse: got SHLBYTE
   lib/raid/raid6/powerpc/altivec1.c:49:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:49:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec1.c:60:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/powerpc/altivec1.c:60:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:60:27: sparse: sparse: got vec_cmpgt
   lib/raid/raid6/powerpc/altivec1.c:61:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:61:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c:73:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:73:19: sparse: sparse: got wd0
   lib/raid/raid6/powerpc/altivec1.c:74:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:74:19: sparse: sparse: got x1d
   lib/raid/raid6/powerpc/altivec1.c:80:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec1.c:80:17: sparse: sparse: got =
>> lib/raid/raid6/powerpc/altivec1.c:80:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec1.c:80:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:80:25: sparse: sparse: got <
   lib/raid/raid6/powerpc/altivec1.c:80:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:80:37: sparse: sparse: got +=
   lib/raid/raid6/powerpc/altivec1.c:82:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec1.c:82:25: sparse: sparse: got =
   lib/raid/raid6/powerpc/altivec1.c:82:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec1.c:82:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:82:36: sparse: sparse: got >=
   lib/raid/raid6/powerpc/altivec1.c:82:44: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:82:44: sparse: sparse: got --
   lib/raid/raid6/powerpc/altivec1.c:90:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:90:17: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c:92:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec1.c:92:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec1.c:93:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:93:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c:98:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:98:9: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: got {
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: got (
>> lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: got 0
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c:105:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:105:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10107)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684)
   lib/raid/raid6/powerpc/altivec1.c:76:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/powerpc/altivec1.c:77:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec1.c:77:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec1.c:77:9: sparse:    int [addressable] [toplevel] p
--
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17639:9: sparse: sparse: got vec_perm
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17640:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17640:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17698:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17698:16: sparse: sparse: got unsigned
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:23: sparse: sparse: got short
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:25: sparse: sparse: got short
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:23: sparse: sparse: got int
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:25: sparse: sparse: got int
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:35: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:35: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:42: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:42: sparse: sparse: got char
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17708:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17708:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17713:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17713:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17719:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17719:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17725:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17725:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17731:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17731:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17737:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17737:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17743:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17743:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17978:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17978:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17983:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17983:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17988:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17988:26: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17989:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17989:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17995:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17995:26: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17996:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17996:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18001:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18001:24: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18002:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18002:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18007:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18007:24: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18008:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18008:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18013:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18013:25: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18014:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18014:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18218:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18218:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18235:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18235:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18239:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18239:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18243:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18243:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18247:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18247:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18264:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18264:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18268:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18268:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18272:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18272:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18277:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18277:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec8.c:37:16: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/altivec8.c:37:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   lib/raid/raid6/powerpc/altivec8.c:37:23: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:37:23: sparse: sparse: got char
   lib/raid/raid6/powerpc/altivec8.c:46:45: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:46:45: sparse: sparse: got SHLBYTE
   lib/raid/raid6/powerpc/altivec8.c:49:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:49:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec8.c:60:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/powerpc/altivec8.c:60:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:60:27: sparse: sparse: got vec_cmpgt
   lib/raid/raid6/powerpc/altivec8.c:61:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:61:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c:73:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:73:19: sparse: sparse: got wd0
   lib/raid/raid6/powerpc/altivec8.c:74:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:74:19: sparse: sparse: got wd1
   lib/raid/raid6/powerpc/altivec8.c:75:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:75:19: sparse: sparse: got wd2
   lib/raid/raid6/powerpc/altivec8.c:76:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:76:19: sparse: sparse: got wd3
   lib/raid/raid6/powerpc/altivec8.c:77:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:77:19: sparse: sparse: got wd4
   lib/raid/raid6/powerpc/altivec8.c:78:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:78:19: sparse: sparse: got wd5
   lib/raid/raid6/powerpc/altivec8.c:79:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:79:19: sparse: sparse: got wd6
   lib/raid/raid6/powerpc/altivec8.c:80:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:80:19: sparse: sparse: got wd7
   lib/raid/raid6/powerpc/altivec8.c:81:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:81:19: sparse: sparse: got x1d
   lib/raid/raid6/powerpc/altivec8.c:87:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec8.c:87:17: sparse: sparse: got =
>> lib/raid/raid6/powerpc/altivec8.c:87:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec8.c:87:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:87:25: sparse: sparse: got <
   lib/raid/raid6/powerpc/altivec8.c:87:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:87:37: sparse: sparse: got +=
>> lib/raid/raid6/powerpc/altivec8.c:89:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:90:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:91:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:92:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:93:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:94:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:95:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:96:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec8.c:96:25: sparse: sparse: got =
   lib/raid/raid6/powerpc/altivec8.c:96:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec8.c:96:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:96:36: sparse: sparse: got >=
   lib/raid/raid6/powerpc/altivec8.c:96:44: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:96:44: sparse: sparse: got --
   lib/raid/raid6/powerpc/altivec8.c:98:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:99:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:100:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:101:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:102:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:103:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:104:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:153:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:153:17: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c:155:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:155:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:156:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:156:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:157:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:157:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:158:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:158:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:159:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:159:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:160:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:160:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:161:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:161:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:162:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:162:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:163:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:163:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:164:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:164:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:165:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:165:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:166:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:166:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:167:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:167:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:168:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:168:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:169:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:169:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:170:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:170:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c:175:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:175:9: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: got {
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: got (
>> lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: got 0
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c:182:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:182:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10107)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684)
   lib/raid/raid6/powerpc/altivec8.c:83:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/powerpc/altivec8.c:84:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:84:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec8.c:84:9: sparse:    int [addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec8.c:70:12: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec8.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec8.c:85:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:85:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec8.c:85:9: sparse:    int [addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec8.c:70:16: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec8.c:70:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec8.c:89:23: sparse: sparse: undefined identifier 'wp1'
>> lib/raid/raid6/powerpc/altivec8.c:89:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:89:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:90:23: sparse: sparse: undefined identifier 'wp2'
   lib/raid/raid6/powerpc/altivec8.c:90:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:90:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:91:23: sparse: sparse: undefined identifier 'wp3'
   lib/raid/raid6/powerpc/altivec8.c:91:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:91:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:92:23: sparse: sparse: undefined identifier 'wp4'
   lib/raid/raid6/powerpc/altivec8.c:92:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:92:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:93:23: sparse: sparse: undefined identifier 'wp5'
   lib/raid/raid6/powerpc/altivec8.c:93:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:93:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:94:23: sparse: sparse: undefined identifier 'wp6'
   lib/raid/raid6/powerpc/altivec8.c:94:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:94:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:95:23: sparse: sparse: undefined identifier 'wp7'
   lib/raid/raid6/powerpc/altivec8.c:95:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:95:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:98:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:98:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:99:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:99:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:100:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:100:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:101:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:101:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:102:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:102:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:103:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:103:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:104:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:104:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:105:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:106:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:107:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:108:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:109:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:110:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:111:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:112:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:113:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:114:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:115:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:116:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:117:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:118:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:119:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:120:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:121:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:122:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:123:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:124:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:125:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:126:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:127:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:128:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:129:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec8.c:129:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:113)
   lib/raid/raid6/powerpc/altivec8.c:130:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec8.c:130:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:114)
   lib/raid/raid6/powerpc/altivec8.c:131:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec8.c:131:25: sparse: sparse: symbol 'w22' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:115)
   lib/raid/raid6/powerpc/altivec8.c:132:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec8.c:132:25: sparse: sparse: symbol 'w23' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:116)
   lib/raid/raid6/powerpc/altivec8.c:133:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec8.c:133:25: sparse: sparse: symbol 'w24' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:117)
   lib/raid/raid6/powerpc/altivec8.c:134:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec8.c:134:25: sparse: sparse: symbol 'w25' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:118)
   lib/raid/raid6/powerpc/altivec8.c:135:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec8.c:135:25: sparse: sparse: symbol 'w26' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:119)
   lib/raid/raid6/powerpc/altivec8.c:136:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec8.c:136:25: sparse: sparse: symbol 'w27' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:120)
   lib/raid/raid6/powerpc/altivec8.c:137:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:137:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:121)
   lib/raid/raid6/powerpc/altivec8.c:138:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:138:25: sparse: sparse: symbol 'w11' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:122)
   lib/raid/raid6/powerpc/altivec8.c:139:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:139:25: sparse: sparse: symbol 'w12' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:123)
   lib/raid/raid6/powerpc/altivec8.c:140:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:140:25: sparse: sparse: symbol 'w13' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:124)
   lib/raid/raid6/powerpc/altivec8.c:141:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:141:25: sparse: sparse: symbol 'w14' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:125)
   lib/raid/raid6/powerpc/altivec8.c:142:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:142:25: sparse: sparse: symbol 'w15' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:126)
   lib/raid/raid6/powerpc/altivec8.c:143:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:143:25: sparse: sparse: symbol 'w16' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:127)
   lib/raid/raid6/powerpc/altivec8.c:144:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:144:25: sparse: sparse: symbol 'w17' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:128)
   lib/raid/raid6/powerpc/altivec8.c:145:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:146:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:146:25: sparse: sparse: symbol 'wq1' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:89)
   lib/raid/raid6/powerpc/altivec8.c:147:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:147:25: sparse: sparse: symbol 'wq2' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:90)
   lib/raid/raid6/powerpc/altivec8.c:148:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:148:25: sparse: sparse: symbol 'wq3' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:91)
   lib/raid/raid6/powerpc/altivec8.c:149:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:149:25: sparse: sparse: symbol 'wq4' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:92)
   lib/raid/raid6/powerpc/altivec8.c:150:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:150:25: sparse: sparse: symbol 'wq5' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:93)
--
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17639:9: sparse: sparse: got vec_perm
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17640:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17640:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17698:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17698:16: sparse: sparse: got unsigned
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:23: sparse: sparse: got short
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:25: sparse: sparse: got short
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:23: sparse: sparse: got int
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:25: sparse: sparse: got int
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:35: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:35: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:42: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:42: sparse: sparse: got char
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17708:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17708:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17713:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17713:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17719:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17719:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17725:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17725:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17731:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17731:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17737:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17737:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17743:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17743:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17978:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17978:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17983:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17983:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17988:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17988:26: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17989:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17989:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17995:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17995:26: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17996:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17996:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18001:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18001:24: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18002:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18002:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18007:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18007:24: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18008:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18008:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18013:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18013:25: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18014:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18014:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18218:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18218:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18235:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18235:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18239:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18239:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18243:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18243:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18247:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18247:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18264:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18264:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18268:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18268:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18272:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18272:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18277:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18277:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/vpermxor1.c:29:16: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/vpermxor1.c:29:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor1.c:29:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor1.c:29:25: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor1.c:32:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor1.c:32:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor1.c:32:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor1.c:32:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor1.c:35:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor1.c:35:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor1.c:35:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor1.c:35:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor1.c:45:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor1.c:45:19: sparse: sparse: got wp0
>> lib/raid/raid6/powerpc/vpermxor1.c:52:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor1.c:55:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor1.c:63:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor1.c:64:30: sparse: sparse: No right hand side of '*'-expression
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10107)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684)
   lib/raid/raid6/powerpc/vpermxor1.c:45:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:52:17: sparse: sparse: undefined identifier 'wp0'
   lib/raid/raid6/powerpc/vpermxor1.c:52:23: sparse: sparse: undefined identifier 'wq0'
   lib/raid/raid6/powerpc/vpermxor1.c:52:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:52:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:55:25: sparse: sparse: undefined identifier 'wd0'
   lib/raid/raid6/powerpc/vpermxor1.c:55:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:55:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:57:25: sparse: sparse: undefined identifier 'wp0'
--
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17639:9: sparse: sparse: got vec_perm
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17640:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17640:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17698:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17698:16: sparse: sparse: got unsigned
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:23: sparse: sparse: got short
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:25: sparse: sparse: got short
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:23: sparse: sparse: got int
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:25: sparse: sparse: got int
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:35: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:35: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:42: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:42: sparse: sparse: got char
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17708:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17708:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17713:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17713:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17719:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17719:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17725:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17725:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17731:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17731:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17737:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17737:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17743:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17743:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17978:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17978:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17983:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17983:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17988:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17988:26: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17989:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17989:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17995:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17995:26: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17996:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17996:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18001:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18001:24: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18002:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18002:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18007:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18007:24: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18008:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18008:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18013:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18013:25: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18014:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18014:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18218:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18218:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18235:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18235:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18239:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18239:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18243:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18243:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18247:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18247:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18264:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18264:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18268:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18268:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18272:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18272:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18277:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18277:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec4.c:37:16: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/altivec4.c:37:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   lib/raid/raid6/powerpc/altivec4.c:37:23: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:37:23: sparse: sparse: got char
   lib/raid/raid6/powerpc/altivec4.c:46:45: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:46:45: sparse: sparse: got SHLBYTE
   lib/raid/raid6/powerpc/altivec4.c:49:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:49:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec4.c:60:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/powerpc/altivec4.c:60:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:60:27: sparse: sparse: got vec_cmpgt
   lib/raid/raid6/powerpc/altivec4.c:61:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:61:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c:73:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:73:19: sparse: sparse: got wd0
   lib/raid/raid6/powerpc/altivec4.c:74:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:74:19: sparse: sparse: got wd1
   lib/raid/raid6/powerpc/altivec4.c:75:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:75:19: sparse: sparse: got wd2
   lib/raid/raid6/powerpc/altivec4.c:76:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:76:19: sparse: sparse: got wd3
   lib/raid/raid6/powerpc/altivec4.c:77:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:77:19: sparse: sparse: got x1d
   lib/raid/raid6/powerpc/altivec4.c:83:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec4.c:83:17: sparse: sparse: got =
>> lib/raid/raid6/powerpc/altivec4.c:83:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec4.c:83:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:83:25: sparse: sparse: got <
   lib/raid/raid6/powerpc/altivec4.c:83:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:83:37: sparse: sparse: got +=
>> lib/raid/raid6/powerpc/altivec4.c:85:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:86:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:87:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:88:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec4.c:88:25: sparse: sparse: got =
   lib/raid/raid6/powerpc/altivec4.c:88:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec4.c:88:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:88:36: sparse: sparse: got >=
   lib/raid/raid6/powerpc/altivec4.c:88:44: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:88:44: sparse: sparse: got --
   lib/raid/raid6/powerpc/altivec4.c:90:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:91:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:92:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:117:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:117:17: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c:119:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:119:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:120:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:120:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:121:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:121:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:122:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:122:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:123:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:123:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:124:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:124:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:125:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:125:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:126:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:126:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c:131:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:131:9: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: got {
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: got (
>> lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: got 0
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c:138:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:138:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10107)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684)
   lib/raid/raid6/powerpc/altivec4.c:79:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/powerpc/altivec4.c:80:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:80:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:80:9: sparse:    int [addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec4.c:70:12: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec4.c:81:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:81:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:81:9: sparse:    int [addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec4.c:70:16: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:70:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec4.c:85:23: sparse: sparse: undefined identifier 'wp1'
>> lib/raid/raid6/powerpc/altivec4.c:85:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:85:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:86:23: sparse: sparse: undefined identifier 'wp2'
   lib/raid/raid6/powerpc/altivec4.c:86:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:86:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:87:23: sparse: sparse: undefined identifier 'wp3'
   lib/raid/raid6/powerpc/altivec4.c:87:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:87:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:90:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:90:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:91:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:91:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:92:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:92:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:93:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:94:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:95:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:96:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:97:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec4.c:98:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec4.c:99:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec4.c:100:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec4.c:101:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec4.c:102:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec4.c:103:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec4.c:104:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec4.c:105:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec4.c:105:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:97)
   lib/raid/raid6/powerpc/altivec4.c:106:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec4.c:106:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:98)
   lib/raid/raid6/powerpc/altivec4.c:107:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec4.c:107:25: sparse: sparse: symbol 'w22' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:99)
   lib/raid/raid6/powerpc/altivec4.c:108:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec4.c:108:25: sparse: sparse: symbol 'w23' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:100)
   lib/raid/raid6/powerpc/altivec4.c:109:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:109:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:101)
   lib/raid/raid6/powerpc/altivec4.c:110:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:110:25: sparse: sparse: symbol 'w11' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:102)
   lib/raid/raid6/powerpc/altivec4.c:111:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:111:25: sparse: sparse: symbol 'w12' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:103)
   lib/raid/raid6/powerpc/altivec4.c:112:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:112:25: sparse: sparse: symbol 'w13' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:104)
   lib/raid/raid6/powerpc/altivec4.c:113:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:114:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:114:25: sparse: sparse: symbol 'wq1' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:85)
   lib/raid/raid6/powerpc/altivec4.c:115:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:115:25: sparse: sparse: symbol 'wq2' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:86)
   lib/raid/raid6/powerpc/altivec4.c:116:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:116:25: sparse: sparse: symbol 'wq3' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:87)
   lib/raid/raid6/powerpc/altivec4.c:119:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:119:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:120:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:120:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:121:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:121:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:122:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:122:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:123:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:123:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:124:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:124:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:125:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:125:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:136:9: sparse: sparse: symbol 'disable_kernel_altivec' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:136:9: sparse:    int static [signed] [toplevel] disable_kernel_altivec( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] disable_kernel_altivec( ... )
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: symbol 'should_resched' redeclared with different type (different argument counts):
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse:    int static [signed] [toplevel] should_resched( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, include/linux/swait.h, ...):
   include/asm-generic/preempt.h:75:29: sparse: note: previously declared as:
   include/asm-generic/preempt.h:75:29: sparse:    bool static inline [gnu_inline] [toplevel] [unsigned] [unused] should_resched( ... )
   lib/raid/raid6/powerpc/altivec4.c:150:9: sparse: sparse: undefined identifier 'raid6_altivec4_gen_syndrome'
   lib/raid/raid6/powerpc/altivec4.c:152:9: sparse: sparse: undefined identifier 'raid6_have_altivec'
--
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17639:9: sparse: sparse: got vec_perm
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17640:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17640:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17698:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17698:16: sparse: sparse: got unsigned
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:23: sparse: sparse: got short
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:25: sparse: sparse: got short
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:23: sparse: sparse: got int
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:25: sparse: sparse: got int
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:35: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:35: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:42: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:42: sparse: sparse: got char
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17708:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17708:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17713:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17713:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17719:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17719:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17725:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17725:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17731:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17731:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17737:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17737:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17743:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17743:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17978:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17978:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17983:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17983:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17988:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17988:26: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17989:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17989:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17995:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17995:26: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17996:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17996:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18001:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18001:24: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18002:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18002:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18007:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18007:24: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18008:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18008:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18013:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18013:25: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18014:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18014:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18218:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18218:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18235:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18235:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18239:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18239:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18243:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18243:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18247:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18247:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18264:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18264:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18268:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18268:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18272:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18272:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18277:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18277:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/vpermxor4.c:29:16: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/vpermxor4.c:29:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor4.c:29:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor4.c:29:25: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor4.c:32:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor4.c:32:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor4.c:32:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor4.c:32:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor4.c:35:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor4.c:35:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor4.c:35:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor4.c:35:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor4.c:45:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor4.c:45:19: sparse: sparse: got wp0
   lib/raid/raid6/powerpc/vpermxor4.c:46:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor4.c:46:19: sparse: sparse: got wp1
   lib/raid/raid6/powerpc/vpermxor4.c:47:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor4.c:47:19: sparse: sparse: got wp2
   lib/raid/raid6/powerpc/vpermxor4.c:48:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor4.c:48:19: sparse: sparse: got wp3
>> lib/raid/raid6/powerpc/vpermxor4.c:55:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:56:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:57:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:58:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:61:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:62:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:63:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:64:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:81:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:82:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:83:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:84:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:85:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:86:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:87:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:88:30: sparse: sparse: No right hand side of '*'-expression
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10107)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:9: sparse: sparse: undefined identifier '__b'
--
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17639:9: sparse: sparse: got vec_perm
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17640:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17640:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17698:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17698:16: sparse: sparse: got unsigned
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:23: sparse: sparse: got short
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:25: sparse: sparse: got short
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:23: sparse: sparse: got int
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:25: sparse: sparse: got int
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:35: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:35: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:42: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:42: sparse: sparse: got char
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17708:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17708:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17713:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17713:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17719:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17719:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17725:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17725:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17731:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17731:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17737:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17737:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17743:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17743:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17978:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17978:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17983:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17983:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17988:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17988:26: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17989:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17989:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17995:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17995:26: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17996:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17996:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18001:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18001:24: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18002:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18002:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18007:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18007:24: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18008:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18008:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18013:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18013:25: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18014:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18014:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18218:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18218:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18235:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18235:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18239:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18239:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18243:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18243:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18247:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18247:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18264:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18264:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18268:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18268:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18272:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18272:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18277:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18277:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec2.c:37:16: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/altivec2.c:37:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   lib/raid/raid6/powerpc/altivec2.c:37:23: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:37:23: sparse: sparse: got char
   lib/raid/raid6/powerpc/altivec2.c:46:45: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:46:45: sparse: sparse: got SHLBYTE
   lib/raid/raid6/powerpc/altivec2.c:49:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:49:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec2.c:60:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/powerpc/altivec2.c:60:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:60:27: sparse: sparse: got vec_cmpgt
   lib/raid/raid6/powerpc/altivec2.c:61:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:61:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c:73:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:73:19: sparse: sparse: got wd0
   lib/raid/raid6/powerpc/altivec2.c:74:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:74:19: sparse: sparse: got wd1
   lib/raid/raid6/powerpc/altivec2.c:75:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:75:19: sparse: sparse: got x1d
   lib/raid/raid6/powerpc/altivec2.c:81:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec2.c:81:17: sparse: sparse: got =
>> lib/raid/raid6/powerpc/altivec2.c:81:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec2.c:81:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:81:25: sparse: sparse: got <
   lib/raid/raid6/powerpc/altivec2.c:81:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:81:37: sparse: sparse: got +=
>> lib/raid/raid6/powerpc/altivec2.c:83:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec2.c:84:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec2.c:84:25: sparse: sparse: got =
   lib/raid/raid6/powerpc/altivec2.c:84:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec2.c:84:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:84:36: sparse: sparse: got >=
   lib/raid/raid6/powerpc/altivec2.c:84:44: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:84:44: sparse: sparse: got --
   lib/raid/raid6/powerpc/altivec2.c:86:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec2.c:99:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:99:17: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c:101:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec2.c:101:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec2.c:102:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec2.c:102:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec2.c:103:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec2.c:103:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec2.c:104:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:104:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c:109:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:109:9: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: got {
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: got (
>> lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: got 0
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c:116:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:116:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10107)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684)
   lib/raid/raid6/powerpc/altivec2.c:77:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/powerpc/altivec2.c:78:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec2.c:78:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:78:9: sparse:    int [addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec2.c:70:12: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec2.c:79:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec2.c:79:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:79:9: sparse:    int [addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec2.c:70:16: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:70:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec2.c:83:23: sparse: sparse: undefined identifier 'wp1'
>> lib/raid/raid6/powerpc/altivec2.c:83:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec2.c:83:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec2.c:86:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec2.c:86:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec2.c:87:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:88:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:89:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec2.c:90:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec2.c:91:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec2.c:92:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec2.c:93:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec2.c:93:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:89)
   lib/raid/raid6/powerpc/altivec2.c:94:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec2.c:94:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:90)
   lib/raid/raid6/powerpc/altivec2.c:95:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:95:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:91)
   lib/raid/raid6/powerpc/altivec2.c:96:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:96:25: sparse: sparse: symbol 'w11' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:92)
   lib/raid/raid6/powerpc/altivec2.c:97:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:98:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:98:25: sparse: sparse: symbol 'wq1' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:83)
   lib/raid/raid6/powerpc/altivec2.c:101:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:101:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:102:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:102:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:103:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:103:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:114:9: sparse: sparse: symbol 'disable_kernel_altivec' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:114:9: sparse:    int static [signed] [toplevel] disable_kernel_altivec( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] disable_kernel_altivec( ... )
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: symbol 'should_resched' redeclared with different type (different argument counts):
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse:    int static [signed] [toplevel] should_resched( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, include/linux/swait.h, ...):
   include/asm-generic/preempt.h:75:29: sparse: note: previously declared as:
   include/asm-generic/preempt.h:75:29: sparse:    bool static inline [gnu_inline] [toplevel] [unsigned] [unused] should_resched( ... )
   lib/raid/raid6/powerpc/altivec2.c:128:9: sparse: sparse: undefined identifier 'raid6_altivec2_gen_syndrome'
   lib/raid/raid6/powerpc/altivec2.c:130:9: sparse: sparse: undefined identifier 'raid6_have_altivec'
--
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17639:9: sparse: sparse: got vec_perm
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17640:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17640:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17698:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17698:16: sparse: sparse: got unsigned
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:23: sparse: sparse: got short
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:25: sparse: sparse: got short
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:23: sparse: sparse: got int
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:25: sparse: sparse: got int
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:35: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:35: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:42: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:42: sparse: sparse: got char
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17708:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17708:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17713:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17713:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17719:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17719:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17725:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17725:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17731:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17731:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17737:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17737:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17743:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17743:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17978:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17978:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17983:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17983:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17988:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17988:26: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17989:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17989:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17995:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17995:26: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17996:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17996:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18001:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18001:24: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18002:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18002:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18007:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18007:24: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18008:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18008:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18013:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18013:25: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18014:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18014:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18218:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18218:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18235:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18235:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18239:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18239:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18243:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18243:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18247:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18247:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18264:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18264:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18268:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18268:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18272:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18272:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18277:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18277:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/vpermxor2.c:29:16: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/vpermxor2.c:29:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor2.c:29:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor2.c:29:25: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor2.c:32:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor2.c:32:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor2.c:32:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor2.c:32:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor2.c:35:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor2.c:35:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor2.c:35:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor2.c:35:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor2.c:45:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor2.c:45:19: sparse: sparse: got wp0
   lib/raid/raid6/powerpc/vpermxor2.c:46:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor2.c:46:19: sparse: sparse: got wp1
>> lib/raid/raid6/powerpc/vpermxor2.c:53:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:54:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:57:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:58:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:69:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:70:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:71:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:72:30: sparse: sparse: No right hand side of '*'-expression
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10107)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14671)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14677)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14690:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14684)
   lib/raid/raid6/powerpc/vpermxor2.c:45:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:46:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:53:17: sparse: sparse: undefined identifier 'wp0'
   lib/raid/raid6/powerpc/vpermxor2.c:53:23: sparse: sparse: undefined identifier 'wq0'
   lib/raid/raid6/powerpc/vpermxor2.c:53:31: sparse: sparse: undefined identifier 'unative_t'
--
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17639:9: sparse: sparse: got vec_perm
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17640:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17640:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17698:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17698:16: sparse: sparse: got unsigned
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17699:23: sparse: sparse: got short
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17700:25: sparse: sparse: got short
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17701:23: sparse: sparse: got int
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17702:25: sparse: sparse: got int
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17703:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:35: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:35: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:42: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17705:42: sparse: sparse: got char
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17708:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17708:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17713:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17713:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17718:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17719:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17719:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17724:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17725:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17725:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17730:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17731:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17731:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17736:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17737:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17737:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17742:10: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17743:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17743:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17978:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17978:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17983:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17983:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17988:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17988:26: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17989:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17989:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17995:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17995:26: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17996:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:17996:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18001:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18001:24: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18002:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18002:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18007:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18007:24: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18008:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18008:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18013:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18013:25: sparse: sparse: got *
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18014:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18014:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18218:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18218:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18235:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18235:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18239:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18239:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18243:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18243:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18247:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18247:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18264:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18264:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18268:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18268:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18272:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18272:1: sparse: sparse: got }
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18277:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:18277:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/vpermxor8.c:29:16: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/vpermxor8.c:29:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor8.c:29:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor8.c:29:25: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor8.c:32:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor8.c:32:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor8.c:32:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor8.c:32:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor8.c:35:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor8.c:35:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor8.c:35:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor8.c:35:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor8.c:45:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:45:19: sparse: sparse: got wp0
   lib/raid/raid6/powerpc/vpermxor8.c:46:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:46:19: sparse: sparse: got wp1
   lib/raid/raid6/powerpc/vpermxor8.c:47:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:47:19: sparse: sparse: got wp2
   lib/raid/raid6/powerpc/vpermxor8.c:48:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:48:19: sparse: sparse: got wp3
   lib/raid/raid6/powerpc/vpermxor8.c:49:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:49:19: sparse: sparse: got wp4
   lib/raid/raid6/powerpc/vpermxor8.c:50:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:50:19: sparse: sparse: got wp5
   lib/raid/raid6/powerpc/vpermxor8.c:51:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:51:19: sparse: sparse: got wp6
   lib/raid/raid6/powerpc/vpermxor8.c:52:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:52:19: sparse: sparse: got wp7
>> lib/raid/raid6/powerpc/vpermxor8.c:59:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:60:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:61:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:62:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:63:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:64:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:65:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:66:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:69:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:70:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:71:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:72:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:73:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:74:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:75:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:76:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:105:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:106:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:107:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:108:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:109:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:110:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:111:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:112:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:113:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:114:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:115:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:116:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:117:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:118:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:119:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:120:30: sparse: sparse: No right hand side of '*'-expression
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10107)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10116)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10125)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10134)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10143)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10152)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10161)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10241)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10250)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10259)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10268)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10170)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10281)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10290)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:10299)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:22: sparse: sparse: invalid initializer
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14658:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14651)
   /opt/cross/clang-6009708b43/lib/clang/17/include/altivec.h:14664:9: sparse: sparse: undefined identifier '__b'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
