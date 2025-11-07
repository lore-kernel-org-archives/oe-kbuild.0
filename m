Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1407D2B9B9
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Nov 2025 14:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762525167; cv=none; b=iWpi5p4SlpWn4QjH31icG0qSv+UMZwsiya0E6dEqgLNolows1RmGcT+t0JTKHkFy9ve8CQR9ltDQh2iDffI6nMSjxHJpPE/7MOEzXC+DtAaqTipIDUZ9sVDKnjX34CENwqVgSuvRDQ1MGR9yPbTx7nXKqGyX2ZSnvFnYRk/iCCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762525167; c=relaxed/simple;
	bh=SsYh+5gS8t32yTsB/FxMvowrytJyh/bUQzyGxs3egbs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=utLIzgU6AIqrvurLYAfs1J1IilrX/hIGrktae1sjyr4poi22g7+oSmDDjao5zVJPn/8b1bDVlyHZPSmUvBws/d0o3Tr/y9ScToxeiZSGeFdBlbALMHDJbp40r9LxlnwDCYUUFK2I86rw5UJU1R2oWZHU6MELbRCuhnU9V0xw/yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ija0dmgb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ija0dmgb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762525166; x=1794061166;
  h=date:from:to:subject:message-id:mime-version;
  bh=SsYh+5gS8t32yTsB/FxMvowrytJyh/bUQzyGxs3egbs=;
  b=Ija0dmgbfW7UCvVQWQjRN51poune0y7S9pCglVIz4BHhGXyf5dBlKegN
   Hq/HbOdhbtnNaH70s7Iv7maHaaWAgEVtsASrDSOARBhKcOpeGDe3W8IO/
   y9pXs1lgtWMBKVsDYVQxouAA5Funu1jNiQicECmidRosoVdUqUDzmNuCu
   Z/6EWrzPEyAjR0ZoSdQ3CmPJ0eJTsOm91TVttqnPuZRDUMZSckFEg+xsc
   xBtd8VuAa+AjRD7mIwkhErZTjwemx/zQJN8K6OpFeoL296BtOlcNP9M7E
   fthDsE6zqlLFnA+ltaolYEmUnRu5SOeqjSq33p51ZIye9md8lDwt0jdeh
   A==;
X-CSE-ConnectionGUID: AHB9i++cSxeFYK23paLCUQ==
X-CSE-MsgGUID: MhkUnYjwSliR7jFk5oOj5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="68321999"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="68321999"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 06:19:25 -0800
X-CSE-ConnectionGUID: ziZjMRfeSiKU17OITFR4Nw==
X-CSE-MsgGUID: +ppMw/vrQaaPBafJxGMRmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="188313925"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 Nov 2025 06:19:24 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vHNJC-000000003QK-2TeF
	for oe-kbuild@lists.linux.dev;
	Fri, 07 Nov 2025 14:19:22 +0000
Date: Fri, 7 Nov 2025 15:18:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [deller-fbdev:for-next-next-2 2/3] checkpatch: ERROR: space required
 after that ',' (ctx:VxV)
Message-ID: <202511071543.L0MYbmic-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Javier Garcia <rampxxxx@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git for-next-next-2
head:   9c5ce80078876e17cbad3ccbd60209bef590e230
commit: 9b02fd28f4cde93fbf0126f4d3a49b45e7dd06f7 [2/3] fbdev: vga16fb: Request memory region
reproduce: (https://download.01.org/0day-ci/archive/20251107/202511071543.L0MYbmic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511071543.L0MYbmic-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#29: FILE: drivers/video/fbdev/vga16fb.c:1325:
+		dev_err(&dev->dev,"vga16b: cannot reserve video memory at 0x%lx\n",
 		                 ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
