Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8B1192B7D
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 00:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768437037; cv=none; b=Muqw0locSU3vogf677EIVr2C/7yEyG4OmjTOFWrvr4vQjqVSwbLPo+e/YDAdHculixX4yQoJhW5lmqPhHBeMr/nLwAQoigdoNK27f2pW5muzhkPvFn7U8Uskkbl1fZeMPXo5SwpCZOZowooTMN0XMzBq0rvg7Wk26b86ZWI1IDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768437037; c=relaxed/simple;
	bh=wTWjP36ankXIPLOZKxI0cF5i9T+U5Ym1Imh+gVItUl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Bj5Xct9OhcLX2lI8nRfNF4T1DkPZjFL9/4JACfxGZys64tEi2txnl9ofQgZBjnk6g3H0DFyUklAIR3RE5y9F304VxjjUqyOY/xmiToBMoXGglSxV0lCLZAVR9832wxW63FP+BnK6LMtCzDdvDXX9j4ZrG73l8F4MJnpS/K6n3XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZdO245z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZdO245z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768437036; x=1799973036;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wTWjP36ankXIPLOZKxI0cF5i9T+U5Ym1Imh+gVItUl8=;
  b=PZdO245z1dSacaRcZfNhBqkfUJXK5kUwAWVeBZdweKX71oPiM6GgOMVk
   JM+Kbri4Dkum359ABzIOfa9dBLXDrkxE3h0Y+K4rAXpr/iYoTEfI9DV6u
   jnjCYd73TwAl7i4y5ZtXJZt3GcSPohczMhQVVHPGIrt35fJOat/2G01on
   yiXr1rSoTgu56LzkzMMrCGTLxs4cn4piHLzOsK+aRBBEx0CQo/5pbGWSZ
   Y6wepN3vFCdim8j1AxCDPsJ5bPBjZ9fjsrAk/8wiyGxvh9xaM2AFpZHlJ
   agm4ZKTRMbTwC6qM+TCNDkbYc6tqFvAiEONxKmsfj2cTn5tJXcLIc+Zs7
   Q==;
X-CSE-ConnectionGUID: bS2s8wrQRQuuHUlTf0JQww==
X-CSE-MsgGUID: CKntCc9xRhmWRhdibFWoeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="68954584"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="68954584"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 16:30:35 -0800
X-CSE-ConnectionGUID: lX/PPlfNSiqxs2GdeQRM+g==
X-CSE-MsgGUID: ziHGSk+DS5+XjJouip27Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204846179"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jan 2026 16:30:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgBFv-00000000HFe-1rFW;
	Thu, 15 Jan 2026 00:30:31 +0000
Date: Thu, 15 Jan 2026 08:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/panfrost/panfrost_drv.c:748
 show_file_jm_ctxs() warn: iterator 'i' not incremented
Message-ID: <202601150807.ulAha2kj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Boris Brezillon <bbrezillon@kernel.org>
CC: Steven Price <steven.price@arm.com>
CC: "Adri=C3=A1n Larumbe" <adrian.larumbe@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   944aacb68baf7624ab8d277d0ebf07f025ca137c
commit: d41c79838c47bc822534cd53628fe5e0f8ad2424 drm/panfrost: Display list=
 of device JM contexts over debugfs
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r073-20260115 (https://download.01.org/0day-ci/arc=
hive/20260115/202601150807.ulAha2kj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601150807.ulAha2kj-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panfrost/panfrost_drv.c:748 show_file_jm_ctxs() warn: itera=
tor 'i' not incremented

vim +/i +748 drivers/gpu/drm/panfrost/panfrost_drv.c

d41c79838c47bc Boris Brezillon 2025-09-17  740 =20
d41c79838c47bc Boris Brezillon 2025-09-17  741  static int show_file_jm_ctx=
s(struct panfrost_file_priv *pfile,
d41c79838c47bc Boris Brezillon 2025-09-17  742  			     struct seq_file *m)
d41c79838c47bc Boris Brezillon 2025-09-17  743  {
d41c79838c47bc Boris Brezillon 2025-09-17  744  	struct panfrost_jm_ctx *jm=
_ctx;
d41c79838c47bc Boris Brezillon 2025-09-17  745  	unsigned long i;
d41c79838c47bc Boris Brezillon 2025-09-17  746 =20
d41c79838c47bc Boris Brezillon 2025-09-17  747  	xa_lock(&pfile->jm_ctxs);
d41c79838c47bc Boris Brezillon 2025-09-17 @748  	xa_for_each(&pfile->jm_ctx=
s, i, jm_ctx) {
d41c79838c47bc Boris Brezillon 2025-09-17  749  		jm_ctx =3D panfrost_jm_ct=
x_get(jm_ctx);
d41c79838c47bc Boris Brezillon 2025-09-17  750  		xa_unlock(&pfile->jm_ctxs=
);
d41c79838c47bc Boris Brezillon 2025-09-17  751  		show_panfrost_jm_ctx(jm_c=
tx, i, m);
d41c79838c47bc Boris Brezillon 2025-09-17  752  		panfrost_jm_ctx_put(jm_ct=
x);
d41c79838c47bc Boris Brezillon 2025-09-17  753  		xa_lock(&pfile->jm_ctxs);
d41c79838c47bc Boris Brezillon 2025-09-17  754  	}
d41c79838c47bc Boris Brezillon 2025-09-17  755  	xa_unlock(&pfile->jm_ctxs);
d41c79838c47bc Boris Brezillon 2025-09-17  756 =20
d41c79838c47bc Boris Brezillon 2025-09-17  757  	return 0;
d41c79838c47bc Boris Brezillon 2025-09-17  758  }
d41c79838c47bc Boris Brezillon 2025-09-17  759 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
