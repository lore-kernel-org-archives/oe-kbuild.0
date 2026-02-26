Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E066E355F51
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Feb 2026 18:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772130588; cv=none; b=pXZIscKbyrSaFGqaibBXuVtFgKpJRQ3FPeVPstd0AYv6WaxB/xzqH2LfuunJDDCZu7lwEoAKGmEtS7ZPkUdkA4OK2JyUiAEMPtKALuw3a72GWCOHRAuAQHi+KCma+YDvBa7q+MnoX7Wgy8OoWGRZSBDAq5DnrlAagKfY1P3nQiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772130588; c=relaxed/simple;
	bh=FwjOoUB9FZOPQzq2iyHfi8PFVmWrCzlhpvKM+CggC04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TKwxRi9fsSmlr9L08K3SOtQqF6fAG7DJ+B0Hsy693iDwRQ+/GKHeS9kGwXobZToGnd84WvLnx1FQS7XRUuIikSKb5KjzLSocOJy08JBldOMhOFD9UPE4K74s4avuwF46g0F0nvYi6uDS25/t+ZrI19+YqN/hboypPKxH0CYOccw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdjJtKwZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdjJtKwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772130587; x=1803666587;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FwjOoUB9FZOPQzq2iyHfi8PFVmWrCzlhpvKM+CggC04=;
  b=RdjJtKwZl5QmNZ1526Umc9lG69SyjXMAbYV431NApUXhBX/XgruVuNey
   IffXBiaVlH9pL4YOCjX5S1Na3k4mSUGfNuLrKRq8BRKxWRBspoQSNq+4N
   x7+NUJXFzZJn6fKG+zugLjuENEzcAEIKEfAMOLOmvvkB+AQCmrKy5QbNM
   HwhYDXTb4+mrlPRuawLKHGAxbJ1dgiP3dXGwTu1Mpwq8ssAVbeD18L90M
   yA2lAbC5Rb53+M+A2TBw23/IQlOZaEVYSD+ztC7Ki1rTQT2WBOKilUcR/
   jfKGC7REU+49M56XH1oT9oAUNhNOzF0EHgiATQ83CwXjbNSWRlM8jLUGC
   Q==;
X-CSE-ConnectionGUID: u14RKlJFR8uaVLFD4MeQqA==
X-CSE-MsgGUID: Z/0JOKGSQPGY4A2OcP35fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="76813783"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="76813783"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 10:29:47 -0800
X-CSE-ConnectionGUID: 1ZlkAkSwQK6OWzcgLKXJ+A==
X-CSE-MsgGUID: 3IGo1JEPTnCi4/POvx8fCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="254422906"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Feb 2026 10:29:46 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvg6k-000000009lZ-00hD;
	Thu, 26 Feb 2026 18:29:20 +0000
Date: Fri, 27 Feb 2026 02:27:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-uapi-c 14/14] hppa-linux-gcc:
 error: language c++ not recognized
Message-ID: <202602270242.mUIiRMAW-lkp@intel.com>
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
inux.git b4/kbuild-uapi-c
head:   1e1a3922df39a1658944046f53511884864e1347
commit: 1e1a3922df39a1658944046f53511884864e1347 [14/14] x
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: parisc-randconfig-002-20260226 (https://download.01.org/0day-ci/arc=
hive/20260227/202602270242.mUIiRMAW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260227/202602270242.mUIiRMAW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602270242.mUIiRMAW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-gcc: error: language c++ not recognized
>> hppa-linux-gcc: error: language c++ not recognized

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
