Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B187DA66
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 05:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772861446; cv=none; b=GE1gTyZxapbUIb6HsrJiIZZPdvamwOxAxID80ByA6N576hSSOGmxGGh7U1f8NQI9pB07uebXcxk838410W7q40YDNTJlGVL70XQGPQod+R+FHs5HudXOUBTEXzqRTfk+eMNx6TH7350DFLx389oSXIuaUjLng4hV4PCb79niFxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772861446; c=relaxed/simple;
	bh=vYld59k0Wj30lDIjHD5nJWI2x9nlgqqLuwx4zg2IT1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XvnyW5KGOUrt0Zr82JY3nzL+AWdSkHapP0quBXPJmeLODooBB/GX7FaO0UAhGpJwFURBPex7ohduZvU3obKv2HlhGDX/50oDpHxyst4qx0ui90u/9fy1Kirk/5OWueeEjqCobk+6fXjCzpZwrwL9VP/1Mpvv2Y1i7IEoSg9KC3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5Jb0/vM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5Jb0/vM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772861445; x=1804397445;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vYld59k0Wj30lDIjHD5nJWI2x9nlgqqLuwx4zg2IT1w=;
  b=F5Jb0/vM728g4eLfsSva+tJ5zu6Qxalu5wNUJrr435zvxLSUUFwDWRFI
   z5CQlSrVH9NvEK7jH32j4+6JKAyywNPUgPmzlJhn8tqTNp0ESK+9SJPKN
   a93y8B0gEBc0eyFGR1gAPbDIasoR85BAxxPgooRMhkpABtA7JRBx3dDPD
   CozeSXzw5Zm1XLpQmvehDluySVwFF/S6msT+F67vcvwElAYTDGzBRsAit
   l4txtQR/TJu+RBgJ1/+VMSn6aLbSbwUoF2P6n85FS81K9YLnSqnUgIkJ5
   BDbwWxKBzArX8jtqtrcrtYw7fdASCXPTFXhFJXgzlAZheWZmpOYUfkusS
   g==;
X-CSE-ConnectionGUID: L3sVN0o0SK6d/ZHDAOYPUw==
X-CSE-MsgGUID: 37oJCTYMSwKHHqkNtfK8FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73870490"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="73870490"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 21:30:45 -0800
X-CSE-ConnectionGUID: Mooqek+DTkiFNTnieECTEA==
X-CSE-MsgGUID: AmvesFa5Qz+hWZsTaGKbmA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Mar 2026 21:30:43 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vykFN-000000001ib-1Jvl;
	Sat, 07 Mar 2026 05:30:41 +0000
Date: Sat, 07 Mar 2026 13:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-uapi-c 5/5] m68k-linux-gcc:
 error: language c++ not recognized
Message-ID: <202603071306.IwOuetzN-lkp@intel.com>
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
head:   0e24d72b7819b3a5142507d142a909f647b9f550
commit: 0e24d72b7819b3a5142507d142a909f647b9f550 [5/5] kbuild: uapi: also t=
est UAPI headers against C++ compilers
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260307=
/202603071306.IwOuetzN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260307/202603071306.IwOuetzN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603071306.IwOuetzN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> m68k-linux-gcc: error: language c++ not recognized
>> m68k-linux-gcc: error: language c++ not recognized

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
