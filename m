Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9BB23EA97
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 06:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777702110; cv=none; b=adlk+L1QyKpt30F7UT8hLxclQ7HzrD0Yo33DilQk1LbSKLN/HR+rfaHDru/GmG5bfhI6/qwHNGsTGOHXeBORBy0EVFT7IQ7UcJ0Y7udohGbEgUnMIuzW4UZjF9t5oCf8AJ1OkJ4UuiBStoGxn/3v4FQEx7DiPAspZNjNWZ09/60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777702110; c=relaxed/simple;
	bh=MrFvPuUjGqakvuiM8FiD2ktNqiFTaBrMIlsv9VJkDBk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HVqQ6pA0DzZuWbYqFzYWqmiG156sDKJKT+AlAWTENDlifQbbCJ3m59QCYb/BojOm75xjzdnW32YqCtaHg1uMc15J4plyS0jKB/jsPzulILZC7ydlIo72IXDA3npFdax6rE+qV1i6/Ah8w0M+HalVTSH0ZdOJiB9+ZP5vmE+2vlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A78S9EJJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A78S9EJJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777702109; x=1809238109;
  h=date:from:to:cc:subject:message-id;
  bh=MrFvPuUjGqakvuiM8FiD2ktNqiFTaBrMIlsv9VJkDBk=;
  b=A78S9EJJEs5hczA4yDmXt5vsYoH1uzDGvycwSUqM1a8o6liup0Q35L5R
   JLu3GaI/3NiKr2YoYbkswhyQ763EWJdbyHpO177sFrLQdkWEXKw6gCz/H
   4GNUTFhx/+HDlXYabbC8c1mKbp4kDxVdZBCjc2FpbbCSuzJO88oyj94SB
   JGEaLN02JFlC4O12K35jxuqh3UmrtENuKz5SmvgP8DQ8aj2BBdO4E3x2M
   cNnWNmB1YpXZVYvdo7sIZIvtmOd5BNIPQGNblfhwI2jiy+A65Y96veZiD
   Fi9PvBY277MwN4ZjFdN71LXm41ul1+TPkgoSr//zCIfnDUhBivpn4a82N
   g==;
X-CSE-ConnectionGUID: eGckwbMQQ+Cn+Q1zJRPNzw==
X-CSE-MsgGUID: PyZR2gpkSl6s6sPC0zjVUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78705881"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="78705881"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 23:08:29 -0700
X-CSE-ConnectionGUID: AAsStY38T+CObUB6S+aPJg==
X-CSE-MsgGUID: GaSFbm8lQyWNI4XD4zczgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="230444461"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 May 2026 23:08:27 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ3Wb-000000001CD-0lXO;
	Sat, 02 May 2026 06:08:25 +0000
Date: Sat, 02 May 2026 14:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying
 to use reserved word 'while' as identifier
Message-ID: <202605021323.GO8KTzdC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved word 'while' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f1a5e78a55ebf2b05777fd5eb738038ddae609d6
commit: 80dcf0a7832a5acde0f0701a4dc7b586fc8bcc88 xor: pass the entire operation to the low-level ops
date:   4 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-r132-20260502 (https://download.01.org/0day-ci/archive/20260502/202605021323.GO8KTzdC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021323.GO8KTzdC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 80dcf0a7832a ("xor: pass the entire operation to the low-level ops")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605021323.GO8KTzdC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/raid/xor/arm64/xor-neon.c: note: in included file (through lib/raid/xor/xor_impl.h):
   include/linux/minmax.h:279:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:279:1: sparse: sparse: got }
   include/linux/minmax.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:284:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c: note: in included file:
   lib/raid/xor/xor_impl.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/xor_impl.h:14:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:19:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:19:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:48:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:48:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:86:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:86:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:133:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:133:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:178:26: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:178:26: sparse: sparse: got eor3
   lib/raid/xor/arm64/xor-neon.c:185:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/xor/arm64/xor-neon.c:185:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:185:16: sparse: sparse: got res
   lib/raid/xor/arm64/xor-neon.c:186:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:186:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:196:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:196:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:199:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:199:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:199:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:211:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:211:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:212:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:212:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:213:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:213:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:214:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:214:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:216:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:216:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:217:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:217:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:218:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:218:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:219:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:219:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:220:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:220:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:232:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:232:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:235:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:235:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:235:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:253:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:253:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:254:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:254:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:255:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:255:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:256:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:256:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:258:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:258:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:259:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:259:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:260:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:260:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:261:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:261:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:262:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:262:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:263:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:263:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:277:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:277:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:280:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:280:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:280:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:298:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:298:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:299:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:299:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:300:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:300:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:301:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:301:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:303:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:303:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:304:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:304:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:305:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:305:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:306:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:306:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:307:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:307:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:308:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:308:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:309:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:309:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got >
>> lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved word 'while' as identifier
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got !
>> lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ) in nested declarator
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got <
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got ==
>> lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved word 'if' as identifier
>> lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved word 'else' as identifier
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got if
>> lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved word 'else' as identifier
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got if
>> lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved word 'else' as identifier
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got __xor_eor3_5
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got -=
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c: note: in included file (through arch/arm64/include/asm/neon-intrinsics.h):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3131:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3131:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3138:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3138:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3145:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3145:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3152:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3152:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3159:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3159:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3166:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3166:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3173:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3173:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3180:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3180:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3187:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3187:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3194:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3194:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3201:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3201:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3208:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3208:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3215:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3215:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3222:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3222:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3231:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3231:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3238:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3238:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3245:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3245:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3252:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3252:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3259:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3259:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3266:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3266:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3273:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3273:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3280:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3280:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3287:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3287:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3294:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3294:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3301:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3301:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3308:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3308:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3315:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3315:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3322:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3322:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6099:10: sparse: sparse: undefined identifier '__index'

vim +/while +311 lib/raid/xor/arm64/xor-neon.c

80dcf0a7832a5a Christoph Hellwig 2026-03-27  310  
80dcf0a7832a5a Christoph Hellwig 2026-03-27 @311  __DO_XOR_BLOCKS(eor3_inner, __xor_neon_2, __xor_eor3_3, __xor_eor3_4,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
