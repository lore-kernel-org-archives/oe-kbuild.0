Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3F21862
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Mar 2026 21:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774129182; cv=none; b=lzbmsG1mR4HLpFmmNuC1pbSYZDhyCSeHkaChMQUBtkNA49bkoocqA3ngOY6P9/EUXSnojaKOrH2tlUUw7gjWfThnRXcyyELyP2k3lN6hD5ue73BBvnRFstUtqavj3FHGaKJR3KR5mcHfZ15CYlTSYOixmtDPSwdiS2nE8QnyEUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774129182; c=relaxed/simple;
	bh=sN+HfrJUAxwdogOlIBnJOWwX6R6Ua5hyPPp8Dgv2fw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BTkdA/nXjlEFNi6hjrE288CyTzstoZCs+cKmjpKvK8ahnng0/Tcp3mp/fb8XA7w9ivw2OhiIVPH0s85vld23HWzASYFQxWkKGOXEbz+CydHrz/rvF90rjkDzZqUddXTKOu4xg7Rx1ygB6Gt4xBI45qrtiDWqd5sGQPUBTPxxc2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEKapQ/Z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEKapQ/Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774129181; x=1805665181;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sN+HfrJUAxwdogOlIBnJOWwX6R6Ua5hyPPp8Dgv2fw0=;
  b=iEKapQ/Zrxu/q2LvxWirBTEQlA7GTWOTqRjh95in5jP3nizX3v1w3LoQ
   rrcec14le1kPEx4LoFZYTty1U+GO6lx7RBsIrT+KfCxNJFpqFnbdhdvi4
   /6fvLhwI1ayY8f1xUtysHtfAlGnDyRjIv/ebbcUoFCdOz0s71QFa/y9FM
   GGT9zIOzvf+5T3N0cer6YnkE180BuUR5253e+QdKSWqva07yLBpWTsbRG
   RqZFYYHFpKno8RLsk0rfJTBOiyBCRjMubWrBTJw3FZT5uK3bl1wrlMpEz
   rQYlB55xeMlX5zQS4qAHm9gBkPA9pdb67xBsYrT6EaS2DeNR8mooEcYbJ
   A==;
X-CSE-ConnectionGUID: MJnwuc3vSzCKh3U00wXN4g==
X-CSE-MsgGUID: UeJRrpFbSyGmVGO1UbopQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="86548960"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="86548960"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 14:39:40 -0700
X-CSE-ConnectionGUID: rZFJtLBXQu6wh7GrvDI3BQ==
X-CSE-MsgGUID: c4b91LaXQ+S9g4MkgDM5ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="247576690"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 21 Mar 2026 14:39:39 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w442j-000000006Cn-0Mki;
	Sat, 21 Mar 2026 21:39:37 +0000
Date: Sat, 21 Mar 2026 22:39:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-nonmm-unstable 103/137]
 /usr/powerpc64-linux-gnu/include/asm/elf.h:162:9: error: unknown type name
 '__vector128'; did you mean '__vector_quad'?
Message-ID: <202603212248.cTl2Vjkg-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonm=
m-unstable
head:   6a51a0eb3913d377159312f052c3fe7da8e77f90
commit: a02ffa14bcc04589db937bd865938cb736be151c [103/137] tools/getdelays:=
 use the static UAPI headers from tools/include/uapi
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/=
20260321/202603212248.cTl2Vjkg-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260321/202603212248.cTl2Vjkg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603212248.cTl2Vjkg-lkp@intel.com/

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
