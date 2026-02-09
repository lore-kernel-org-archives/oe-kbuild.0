Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF791D6193
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Feb 2026 03:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770606217; cv=none; b=iXdCwu24JUcQXlZuYCOaXhA7R2q9CBMk37Q3WJmD+os7NN4t+Lb5xKfG49ZXWYybUIkaOJGnbO1b2j6fJfIvjBCocvnVmaxb/byUWaiS/S1qG5PufWQW+AeKUEkzjnJ5RoAYZNjIufCNYNI1C4b1ZKyzIBl3olpkhHDW6z0k1ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770606217; c=relaxed/simple;
	bh=LAz5tSq5adwiplCqN3VH2AR80/ObjEDNHERis21x14A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WK9PhbwRtzcbLh/QZShsW36GfZATbpYOx12ihNGZNmJLwOcTVClhAeROJ+hQ7SWTc8aUNtuP8zUySNnsU87aZc2mgFE2pftUF3jjCKyceAz8YDYZPRQUSPLxiza9pKAhfDd/FQEOKXgZdtzmj98M/3YcbVy6m1luO6S02M5ZYpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lA+l7C+d; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lA+l7C+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770606217; x=1802142217;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LAz5tSq5adwiplCqN3VH2AR80/ObjEDNHERis21x14A=;
  b=lA+l7C+d5dYTfySV3vljKhlVxasxnSJAL4wTSNjmcAZkWv/3q2wx5GmM
   YLDVhljFWwve1dd5P+vQvFdMlcXot9xq+QKtqm29VEDTO/971be/ruFRU
   IkTz3YaAbQOOqamsXXyMm5A3rCZNjcAwsa/5XwfmJvWHB8pvv5slGtY+g
   vnfJdt9BWXvd/DcS61B0w2CHrwA6EIKq0BgTRzkl45UhZjqoY5G/672wX
   oO7RUMl/RMEbHmTGk97T8lwaLdi6o47hr8bAEbgP+b5c0CVTATcQdhZgH
   1VtnIN0OB02uiG3c2CdeHbkhJDNObfzVuLCPaB1JpqZEFEyk7UBnyLBLR
   w==;
X-CSE-ConnectionGUID: 8VQNektFQ3KGOsqW4/y91w==
X-CSE-MsgGUID: Nubun36RS1ihzMm8KBTjvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="89131344"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="89131344"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 19:03:37 -0800
X-CSE-ConnectionGUID: 8ZARHMGvRIO5H1247/piyQ==
X-CSE-MsgGUID: zuTPbmyfSniuixBedOTTwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="249081502"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Feb 2026 19:03:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpHYj-00000000mXA-11bh;
	Mon, 09 Feb 2026 03:03:33 +0000
Date: Mon, 09 Feb 2026 11:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: security/landlock/errata.h:43:5: sparse: sparse: not a
 function <noident>
Message-ID: <202602091106.blEZkohy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence static check warning: security/=
landlock/errata.h:43:5: sparse: sparse: not a function <noident>"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Micka=C3=ABl Sala=C3=BCn" <mic@digikod.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
commit: 15383a0d63dbcd63dc7e8d9ec1bf3a0f7ebf64ac landlock: Add the errata i=
nterface
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-r111-20260209 (https://download.01.org/0day-ci/arch=
ive/20260209/202602091106.blEZkohy-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 9.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260209/202602091106.blEZkohy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602091106.blEZkohy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   security/landlock/setup.c: note: in included file:
>> security/landlock/errata.h:43:5: sparse: sparse: not a function <noident>
   security/landlock/errata.h:43:5: sparse: sparse: bad constant expression=
 type
   security/landlock/errata.h:49:5: sparse: sparse: not a function <noident>
   security/landlock/errata.h:49:5: sparse: sparse: bad constant expression=
 type
   security/landlock/errata.h:55:5: sparse: sparse: not a function <noident>
   security/landlock/errata.h:55:5: sparse: sparse: bad constant expression=
 type
   security/landlock/errata.h:61:5: sparse: sparse: not a function <noident>
   security/landlock/errata.h:61:5: sparse: sparse: bad constant expression=
 type

vim +43 security/landlock/errata.h

15383a0d63dbcd6 Micka=C3=ABl Sala=C3=BCn 2025-03-18  41 =20
15383a0d63dbcd6 Micka=C3=ABl Sala=C3=BCn 2025-03-18  42  #define LANDLOCK_E=
RRATA_ABI 1
15383a0d63dbcd6 Micka=C3=ABl Sala=C3=BCn 2025-03-18 @43  #if __has_include(=
"errata/abi-1.h")
15383a0d63dbcd6 Micka=C3=ABl Sala=C3=BCn 2025-03-18  44  #include "errata/a=
bi-1.h"
15383a0d63dbcd6 Micka=C3=ABl Sala=C3=BCn 2025-03-18  45  #endif
15383a0d63dbcd6 Micka=C3=ABl Sala=C3=BCn 2025-03-18  46  #undef LANDLOCK_ER=
RATA_ABI
15383a0d63dbcd6 Micka=C3=ABl Sala=C3=BCn 2025-03-18  47 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
