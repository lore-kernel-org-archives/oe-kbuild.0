Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740298;
	b=G21W5beGZaWYi2R4nBjnZ14KmjhvbwZ8WAO5uMrthFIh6pZsOZUrcMxmugXGe4DqEL5B
	 8wUBLv4ALStZTjfQba6JTeCr4yj6PRBcSUbuqM2rZqNaLYZ77aJiTC05w0rQ/ttJzbclX
	 w8P0t5iCyNSMQwSrBWvowRvTDCvU0YEFFuEu7DAF0Hji6httaflCQoUylTXBhzCdTCaD2
	 r2m+bZA6U70t0kgcj5WhSuVObWis7atd7/NcMRW/DbZFULpF0f4Xx8mf2a80/H5lDyhm+
	 4cGXxzvdSMBNq2d0+U/RZQIhZtlNSft3gwbAoEX/zOr4DIwzcPBFoMrqSnZVaffa2+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740298;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=q3pYdR5gVqqkz+BC1YFI1qA7AMij5nW95RoHJYyIRvQ=;
	b=JOy43AOuVtks6cXBrh9OSJrWgRKidg5aMwwkIsEt7cHHbl26Ipod3ohXwftX+F/ugV4D
	 bJsu1kwsCVd2PcaM0OJfRpsZR7nOzVzJR/+ZHEeKoddQnoWd52SOVjNPnr0LvGJoUdEBM
	 xPuznR2fqfQ2Xwos+FGsc5xECyYPy/JxEK2PlPzdlgY1/AZcOZoIPqom5LQD/Kt6jc4PZ
	 PB72a/FoulW4StG4EsWlSxUTGHSh7ai1axKUmz1MbkxkWl2qjFJKU+M8OwXcmD3pMBu1Z
	 LAx3SHraj5iFOxztmyApva1jVOTQTDobEISfSuKcllRcTBWUEUNZlqSe8Q9NmigPxPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q25UY2MF;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE0B606A31D
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 10:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE0B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q25UY2MF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794740297; x=1826276297;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3oe2bPZtpUyFpb/bCSSMIpxgQc/vvxF7cIx4h/JWReQ=;
  b=Q25UY2MFtVxaHtw6blnHYPhyGdEWOi4iDP19D2tTjeYAJu4oYlCpGMQu
   fpd7eJhctC5IsRi7VoJzXve/1fo8AgrBruwpSsuMv2mlvEy2p1Ck6rXod
   nZlrHLcXG/moDEBIBfs29zEJA6mGJ88+yHMyVIi0F8zOGj7uUEP4zMNpN
   D0ue15CFSW8s02xD/4HQtoCtHOgD8fa/rb30NdbSOq4TQSa9i4PkAvo1T
   sOv28wKwcNrWJVrRWnAf/fu+MaD6pmaFWFpjUi1wq9lVUu+C3VEo3e+Xj
   Gq4fjOQ/lraQEvTLnatIR7i/uYP9U5pBxI61aTHkVQGO+1M/iPT/1Y3Ly
   g==;
X-CSE-ConnectionGUID: AFxdVY5dQfmZvscvA0VNWg==
X-CSE-MsgGUID: XC+f/GyfQmeqTkHBmdhp9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3532360"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3532360"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 02:58:16 -0800
X-CSE-ConnectionGUID: Rs6K8QyOSc2syQqO15Af8Q==
X-CSE-MsgGUID: tF+pmsvuQ2KwpBAR3GGCYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9248845"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 15 Nov 2026 02:58:15 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSXw5-0000000029g-01L5;
	Sun, 15 Nov 2026 10:58:13 +0000
Date: Sun, 15 Nov 2026 11:57:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /usr/powerpc64-linux-gnu/include/asm/elf.h:162:9: error:
 unknown type name '__vector128'; did you mean '__vector_quad'?
Message-ID: <202611151142.K6AkPvaS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   23c62304dde29abe92013d85910d03a77dada35d
commit: 9b93f7e3277490f0356309c9b241eeeaa27ba859 tools/getdelays: use the s=
tatic UAPI headers from tools/include/uapi
date:   8 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 8 months ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/=
20261115/202611151142.K6AkPvaS-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261115/202611151142.K6AkPvaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 9b93f7e32774 ("tools/getdelays: use the static UAPI headers from t=
ools/include/uapi")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611151142.K6AkPvaS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from /usr/powerpc64-linux-gnu/include/asm/sigcontext.h:=
14,
                    from /usr/powerpc64-linux-gnu/include/bits/sigcontext.h=
:30,
                    from /usr/powerpc64-linux-gnu/include/signal.h:301,
                    from /usr/powerpc64-linux-gnu/include/sys/wait.h:36,
                    from getdelays.c:25:
>> /usr/powerpc64-linux-gnu/include/asm/elf.h:162:9: error: unknown type na=
me '__vector128'; did you mean '__vector_quad'?
     162 | typedef __vector128 elf_vrreg_t;
         |         ^~~~~~~~~~~
         |         __vector_quad

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
