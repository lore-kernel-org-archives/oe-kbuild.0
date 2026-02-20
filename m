Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ADA32AAD6
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 04:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771562044; cv=none; b=cMvNXQMQmqnBgVcevQxfpbe/WQbTcWdYxOl8f0JYmDu8R7UawmkhSybCjhGussGiAqC8wJRTkOPgO1wHU5sZXNV2SG1WzZj7M9zsqTfj19hr7MkX2Y+uhAyugDxiD1byThQoW4NWA8I74ZRHbSOLqKBeWGMCy7M5bPsTIswe5WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771562044; c=relaxed/simple;
	bh=sNjqndDk7Rkz1Nf9bRtgKU2icaQFLaz2A6WjVDajqDg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=szALPj6sE5PwmqegS3RP5/3hN6F/nBoYuiFg3WG/NgAFUJ36z1E35WQLbjIg99r2uiVWX676Zjj1Prxp9PvKtWZyCKgCfO20fBFGbnDVZM+WXak6cHWZCTjmsZaeKPLJf9KbWRgBK1390WNkcgIcSiOC0SWx1VmBjwvqT+coKSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F00ZtX4M; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F00ZtX4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771562042; x=1803098042;
  h=date:from:to:cc:subject:message-id;
  bh=sNjqndDk7Rkz1Nf9bRtgKU2icaQFLaz2A6WjVDajqDg=;
  b=F00ZtX4MtM1TgFXEaevAV8a+FajX3V8q52pi3q1FjLh3iPHj+5nhlaSm
   5aErdAM4sLSwa5Jz72OI9cRDE19uWqQleZaEjamsp+xIj9GgvEUWtcTNh
   4pdTHnzpaB9CIJP7UbS5hIUGMOpRjPEl+noclN7T1Jw6ZpfDYByvrgwXH
   uUp1rqbOXRZcO+jwrN+QhpZHj0C7xHhBxMRc5TuUfP6fn8s+0bVoTw/xS
   j0UZ585IUsD5NM1dosmjqEThjOhp7sNXQsK/HnL5WitH8RiFatB1vB2Rg
   oQ6nmFuZZtphPk+dwesk8sTNprbAwd7HnQjfrfSg1xblxEIAh4JOMXVMs
   g==;
X-CSE-ConnectionGUID: BI6Q8lwPSbuoQlC8QsJnXA==
X-CSE-MsgGUID: iJPU+l4yRhKCin1J+tASvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72358749"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="72358749"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 20:34:01 -0800
X-CSE-ConnectionGUID: irMB5o5nQRiy5G8Tc6QefQ==
X-CSE-MsgGUID: izdrPlQ5SUG9b2aBhxDBlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="218472388"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Feb 2026 20:33:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtIDF-000000013ou-1hcD;
	Fri, 20 Feb 2026 04:33:57 +0000
Date: Fri, 20 Feb 2026 12:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hch-misc:xor-improvements 12/25]
 lib/raid/xor/arm64/xor-neon.c:189:9: sparse: sparse: Trying to use reserved
 word 'return' as identifier
Message-ID: <202602201250.z19Ok4Bx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/raid/xor/arm64/xor-neon.c:189:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git xor-improvements
head:   b59ee0f84041aa86ac6b994429874f54186a87d3
commit: 674e5734fea5af8af9d87664d2da763d4aeb35af [12/25] arm64: move the XOR code to lib/raid/
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm64-randconfig-r131-20260220 (https://download.01.org/0day-ci/archive/20260220/202602201250.z19Ok4Bx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602201250.z19Ok4Bx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602201250.z19Ok4Bx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28371:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28371:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28378:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28378:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28385:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28385:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28392:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28392:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28399:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28399:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28406:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28406:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28408:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28408:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28415:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28415:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28417:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28417:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28424:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28424:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28426:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28426:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28433:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28433:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28435:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28435:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28443:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28443:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28451:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28451:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28459:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28459:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28467:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28467:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28475:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28475:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28483:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28483:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28491:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28491:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28499:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28499:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28507:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28507:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28515:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28515:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28523:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28523:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28531:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28531:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28545:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28545:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28552:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28552:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28559:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28559:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28567:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28567:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28575:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28575:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28583:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28583:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28590:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28590:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28598:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28598:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28606:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28606:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28614:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28614:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28623:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28623:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28630:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28630:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28637:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28637:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28646:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28646:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28653:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28653:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28660:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28660:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28667:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28667:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28674:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28674:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28681:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28681:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28688:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:28688:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:18:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:18:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:47:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:47:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:85:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:85:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:132:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:132:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:182:26: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:182:26: sparse: sparse: got eor3
>> lib/raid/xor/arm64/xor-neon.c:189:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/xor/arm64/xor-neon.c:189:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:189:16: sparse: sparse: got res
   lib/raid/xor/arm64/xor-neon.c:190:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:190:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:201:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:201:29: sparse: sparse: got v0
>> lib/raid/xor/arm64/xor-neon.c:204:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:204:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:204:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:216:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:216:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:217:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:217:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:218:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:218:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:219:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:219:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:221:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:221:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:222:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:222:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:223:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:223:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:224:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:224:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:225:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:225:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:238:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:238:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:241:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:241:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:241:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:259:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:259:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:260:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:260:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:261:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:261:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:262:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:262:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:264:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:264:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:265:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:265:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:266:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:266:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:267:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:267:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:268:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:268:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:269:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:269:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:284:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:284:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:287:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:287:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:287:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:305:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:305:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:306:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:306:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:307:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:307:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:308:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:308:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:310:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:310:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:311:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:311:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:312:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:312:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:313:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:313:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:314:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:314:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:315:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:315:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:316:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:316:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:322:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:322:37: sparse: sparse: got .
   lib/raid/xor/arm64/xor-neon.c:323:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:323:37: sparse: sparse: got .
   lib/raid/xor/arm64/xor-neon.c:324:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:324:9: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2636:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2636:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2643:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2643:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2650:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2650:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2657:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2657:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2664:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2664:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2671:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2671:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2678:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2678:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2685:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2685:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2692:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2692:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2699:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2699:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2706:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2706:10: sparse: sparse: bad constant expression type

vim +/return +189 lib/raid/xor/arm64/xor-neon.c

cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  181  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  182  static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  183  {
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  184  	uint64x2_t res;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  185  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  186  	asm(ARM64_ASM_PREAMBLE ".arch_extension sha3\n"
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  187  	    "eor3 %0.16b, %1.16b, %2.16b, %3.16b"
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  188  	    : "=w"(res) : "w"(p), "w"(q), "w"(r));
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13 @189  	return res;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  190  }
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  191  
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05  192  static void xor_arm64_eor3_3(unsigned long bytes,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05  193  	unsigned long * __restrict p1,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05  194  	const unsigned long * __restrict p2,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05  195  	const unsigned long * __restrict p3)
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  196  {
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  197  	uint64_t *dp1 = (uint64_t *)p1;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  198  	uint64_t *dp2 = (uint64_t *)p2;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  199  	uint64_t *dp3 = (uint64_t *)p3;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  200  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  201  	register uint64x2_t v0, v1, v2, v3;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  202  	long lines = bytes / (sizeof(uint64x2_t) * 4);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  203  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13 @204  	do {
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  205  		/* p1 ^= p2 ^ p3 */
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  206  		v0 = eor3(vld1q_u64(dp1 + 0), vld1q_u64(dp2 + 0),
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  207  			  vld1q_u64(dp3 + 0));
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  208  		v1 = eor3(vld1q_u64(dp1 + 2), vld1q_u64(dp2 + 2),
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  209  			  vld1q_u64(dp3 + 2));
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  210  		v2 = eor3(vld1q_u64(dp1 + 4), vld1q_u64(dp2 + 4),
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  211  			  vld1q_u64(dp3 + 4));
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  212  		v3 = eor3(vld1q_u64(dp1 + 6), vld1q_u64(dp2 + 6),
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  213  			  vld1q_u64(dp3 + 6));
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  214  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  215  		/* store */
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  216  		vst1q_u64(dp1 + 0, v0);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  217  		vst1q_u64(dp1 + 2, v1);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  218  		vst1q_u64(dp1 + 4, v2);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  219  		vst1q_u64(dp1 + 6, v3);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  220  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  221  		dp1 += 8;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  222  		dp2 += 8;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  223  		dp3 += 8;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  224  	} while (--lines > 0);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  225  }
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  226  

:::::: The code at line 189 was first introduced by commit
:::::: 2c54b423cf85baed5ad9f9546f6c8ea741774a06 arm64/xor: use EOR3 instructions when available

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
