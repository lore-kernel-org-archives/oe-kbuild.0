Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF2119005E
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jun 2026 04:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780892681; cv=none; b=vCWmNFXnXpX96Xdm5MEQMpeUZBQMy52OkvIORoPd6D+1Oqd2/6rHfEGDaIhie9IAOsFpBD9xySlXpXylW16ZLWicb1WCsgTgu5Vohl80OKfOeqiTn/XCkcWa2MfEnsMDfeB6jSbtP+i2a4x4qHYhwF5cQSNYw3eogMDN4bQqSBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780892681; c=relaxed/simple;
	bh=aG5OSVyHPaEL6LfayP0CRRlIGMKmJZtawV/l1E8Nmr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=vEl8EQ0Cqv3hvOJd0nict6gCMlCU1HZMQigK1b2nhrPFq4SkQjTEGG3OkWs6kx9Q/RfeyR4KaT5OsyGl2WPnckYfxbAFqtXE0hlsGRqEctHCqlwpzSAtgBJrb6qU6mv9VaQBPyieIDRvBazSdfVL3k0pq+1zmtYChFd3aIs763I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HX9QK6La; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HX9QK6La"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780892679; x=1812428679;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aG5OSVyHPaEL6LfayP0CRRlIGMKmJZtawV/l1E8Nmr0=;
  b=HX9QK6La3CbBu05np8240QdttPpX3WeiNtJJvOgbBC1xyNQgqFDptj13
   CQRbnNHBKVE5ZbTDybzhr+hWTqnPNVQimgGbDWhI3dahK1umhj6AYvkJw
   iAC/FGYcedH1BYjo+dRPus54XqKRwT5EVaAszbQS3AnV5+FYnt3pUJt5x
   Akxdk3oq21wxzqCGi/gpIsUz7htqlscoV2Zl7VapZ5DL6E8WON1PzueQ/
   IWcUzwaHsbU1yKlxmStSRAC9+Ce4Ou2YTPbxrxBmLM/OQLuZl+tqJjsJX
   ZX3+XlO4soCSnDrmiz4Sof7xTQjjm+u7e+3ZIKG2dca/QoUzdifPEKVu3
   A==;
X-CSE-ConnectionGUID: +um9Vy71R3G1uKI9Lu8Ijw==
X-CSE-MsgGUID: 1ydSstrhTpe8VZDaGdEzeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85507193"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="85507193"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 21:24:38 -0700
X-CSE-ConnectionGUID: fIb9KrQ3TT66bzwHO5SWDQ==
X-CSE-MsgGUID: tXQm4i4LRf2+PJHBIt/OUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="247280976"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Jun 2026 21:24:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWRXP-00000000INs-1L9x;
	Mon, 08 Jun 2026 04:24:35 +0000
Date: Mon, 08 Jun 2026 12:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/vdso-arch-clockmodes 3/4] find:
 'arch/nios2/include/generated/uapi/asm': No such file or directory
Message-ID: <202606081250.ZzfeYaKZ-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-arch-clockmodes
head:   9a949a63a8b066c75c8a6efa28cda2b3e7fecb19
commit: ff6270d723df5895f0242fe7843afed8b5836bd2 [3/4] recursive
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-r064-20260608 (https://download.01.org/0day-ci/arc=
hive/20260608/202606081250.ZzfeYaKZ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260608/202606081250.ZzfeYaKZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606081250.ZzfeYaKZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> find: 'arch/nios2/include/generated/uapi/asm': No such file or directory
>> find: 'arch/nios2/include/generated/asm': No such file or directory

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
