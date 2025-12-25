Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC613A1E9D
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 05:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766639023; cv=none; b=FNibASwbHwqUoMXHOBWyc+iHmKEkS5m3XWJCcZuaQF/U1zUoz0+mN89u6ovbb7l4lYzISuVSCJ/E5spS7xR+kR1EM+7ATbaDENKzY7htkMuI8li1uvDSLelPytK1ESy4d4d9dUUjLTex5mIASfG6Hqm9c5ViJrsa3wkBZ6wc15I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766639023; c=relaxed/simple;
	bh=wYJV6H7t4yPCYtwnmge+BsxEKyqJYC+ctfHotTsFwj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mGXkbxee0NgvwDPhhkN4qkqU0ZNYyLdEdG0kNPUr4uCKTt9h8I/whYopzux3mM7Nt0yb8rtbAL+xg4Ev0wLONQ5uS3Kp7q0R6ju+6FPEucX6cMLHdIx1wb8418UqiQRXVnMskD7I7hYDo32lJIiclRYr9PTJ/4GbfNNyGhxcmx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=abOPFSHg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="abOPFSHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766639021; x=1798175021;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wYJV6H7t4yPCYtwnmge+BsxEKyqJYC+ctfHotTsFwj0=;
  b=abOPFSHgVa61t4n5unglOi1B6pkpOhwGND4oHsoZ7erQXylnnXS75ebB
   tWr3v5jQib+bY9CRrXMUO+Zem5CXevlc7noi9v5P/e848Tz9eyJBHbrK4
   xYe5Lrn7e+uWukep/v1oNQlVTcL4rc1VAgy2lzrhU2WWH2znwNpjbtlwH
   iNILXk1uT0iGgRJN4xTt3sXYXLDawSPiAOg2p0QPi6BcxD0y7oucOVyUv
   umjjkqQR9rZWRNJ9qiXs4p3h4hSlGcsnO4jJZnn/hgIJ738lXIKwPHsMC
   u1Uq1dIbvtgwRrfz565oGM1XgQ8akmjioGFS/oFCNVXVT+7jPXMIkWFW1
   Q==;
X-CSE-ConnectionGUID: D6i7iiGFTnybjqihl5uh5A==
X-CSE-MsgGUID: NYTkZ4O0QP2WxFRFiBCH0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="56018449"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="56018449"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 21:03:40 -0800
X-CSE-ConnectionGUID: yfcPp2GwSYeMm578MfgZrQ==
X-CSE-MsgGUID: /mecf2oYT2alHXWHa4J+HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="199297963"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Dec 2025 21:03:38 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYdVg-000000003lp-2O0t;
	Thu, 25 Dec 2025 05:03:36 +0000
Date: Thu, 25 Dec 2025 13:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: security/landlock/errata.h:43:5: sparse: sparse: not a
 function <noident>
Message-ID: <202512251330.F0LDBO90-lkp@intel.com>
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
head:   ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1
commit: 15383a0d63dbcd63dc7e8d9ec1bf3a0f7ebf64ac landlock: Add the errata i=
nterface
date:   9 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 9 months ago
config: mips-randconfig-r121-20251225 (https://download.01.org/0day-ci/arch=
ive/20251225/202512251330.F0LDBO90-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251225/202512251330.F0LDBO90-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512251330.F0LDBO90-lkp@intel.com/

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

15383a0d63dbcd Micka=C3=ABl Sala=C3=BCn 2025-03-18  41 =20
15383a0d63dbcd Micka=C3=ABl Sala=C3=BCn 2025-03-18  42  #define LANDLOCK_ER=
RATA_ABI 1
15383a0d63dbcd Micka=C3=ABl Sala=C3=BCn 2025-03-18 @43  #if __has_include("=
errata/abi-1.h")
15383a0d63dbcd Micka=C3=ABl Sala=C3=BCn 2025-03-18  44  #include "errata/ab=
i-1.h"
15383a0d63dbcd Micka=C3=ABl Sala=C3=BCn 2025-03-18  45  #endif
15383a0d63dbcd Micka=C3=ABl Sala=C3=BCn 2025-03-18  46  #undef LANDLOCK_ERR=
ATA_ABI
15383a0d63dbcd Micka=C3=ABl Sala=C3=BCn 2025-03-18  47 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
