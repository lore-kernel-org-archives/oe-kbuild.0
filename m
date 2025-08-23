Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4757224AE6
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Aug 2025 23:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755992940; cv=none; b=MjoO84QtbMCiT+gVj/DOepVwxffA4lftfY/Pe7eZYTEdmnb+Ob1ecM8D0rRyxAVpun/BrF5zSip4wGK+h6kv7FHl4uqf8LBTmbhQWmfvenqMjGuDFnuQBzuUBFxQdA0y82yEmk4l7hpHEtUQ82VDXWeH1HOake5/6CkpgfpU9Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755992940; c=relaxed/simple;
	bh=MILnGwIVBOiiNSP0MLgT5eZLKSFyXh0RU/bOPp3WTWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SCriGIs1XARAy+GEpjjG58yfsaJmrGsmojJgCSPSbCzBNSs1URb8eIzObMJaxlEMOd4mUiWZv5Vx5pKQYja/IS/sFTSu1hNi2sBPt7fgrmL7KiRXSYTt67wDg15LK3qC+vCfP77NJYcnCpr5lC10dFU58JHvKHMjWO0N+cqspJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zab4MVFj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zab4MVFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755992939; x=1787528939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MILnGwIVBOiiNSP0MLgT5eZLKSFyXh0RU/bOPp3WTWg=;
  b=Zab4MVFjn7+gYYw7UHddknr31YYRfr1FNZzFXd+MN1XbOx+rye9sGhuK
   Y71TmOI+X7SrmDt0PKaXEQrDTIYX7pX7DpClXEWPIbkxnQJrQJiMwQte0
   ZiuWwcsTUWOBO2NK5+Zt7SOfejpvqfSVKV/IGdBtuUIgXFjhztf5mnMfs
   1nj6zE4Bw6vUwnaD6CtypouKiZP7/sTJfku7xFf0A0jqze3AXr1BPLfF7
   hVsTPc76Y08Dc/clrYz0IKnX51vvHOHP5ur6E8DLxHc6Lk1e+/Y7YCFqf
   r//dlK6zDhkX8w7v9cgjQJPg4BwQJf0mHj6mNnmoY39a/JbvwU1kCXnvr
   A==;
X-CSE-ConnectionGUID: TeaKlSsXQsCtJCxMulabvg==
X-CSE-MsgGUID: aM/dzPqLQs2WQwA/e/C3IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="75706949"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="75706949"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 16:48:58 -0700
X-CSE-ConnectionGUID: o5qNE347Rb22GTa/qPBMtQ==
X-CSE-MsgGUID: UihcHk0CQbqX1S4c5LcLvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="174267792"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Aug 2025 16:48:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upxyR-000Mf1-1p;
	Sat, 23 Aug 2025 23:48:48 +0000
Date: Sun, 24 Aug 2025 07:48:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 6/6] drm/ast: Put AST_DRAM_ constants into enum
 ast_dram_layout
Message-ID: <202508240748.TUAvbluX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250822132846.25376-7-tzimmermann@suse.de>
References: <20250822132846.25376-7-tzimmermann@suse.de>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: jfalempe@redhat.com
TO: airlied@redhat.com
TO: maarten.lankhorst@linux.intel.com
TO: mripard@kernel.org
TO: airlied@gmail.com
TO: simona@ffwll.ch
CC: dri-devel@lists.freedesktop.org
CC: Thomas Zimmermann <tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-ast-Do-not-print-DRAM-info/20250822-213333
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250822132846.25376-7-tzimmermann%40suse.de
patch subject: [PATCH 6/6] drm/ast: Put AST_DRAM_ constants into enum ast_dram_layout
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: i386-randconfig-141-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240748.TUAvbluX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508240748.TUAvbluX-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ast/ast_2100.c:63 ast_2100_get_dram_layout_p2a() error: uninitialized symbol 'dram_layout'.

vim +/dram_layout +63 drivers/gpu/drm/ast/ast_2100.c

1be08550e6e72e Thomas Zimmermann 2025-07-06  33  
b59465efc7cb88 Thomas Zimmermann 2025-08-22  34  /*
b59465efc7cb88 Thomas Zimmermann 2025-08-22  35   * DRAM type
b59465efc7cb88 Thomas Zimmermann 2025-08-22  36   */
b59465efc7cb88 Thomas Zimmermann 2025-08-22  37  
334d62edac4c5b Thomas Zimmermann 2025-08-22  38  static enum ast_dram_layout ast_2100_get_dram_layout_p2a(struct ast_device *ast)
b59465efc7cb88 Thomas Zimmermann 2025-08-22  39  {
b59465efc7cb88 Thomas Zimmermann 2025-08-22  40  	u32 mcr_cfg;
334d62edac4c5b Thomas Zimmermann 2025-08-22  41  	enum ast_dram_layout dram_layout;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  42  
b59465efc7cb88 Thomas Zimmermann 2025-08-22  43  	ast_write32(ast, 0xf004, 0x1e6e0000);
b59465efc7cb88 Thomas Zimmermann 2025-08-22  44  	ast_write32(ast, 0xf000, 0x1);
b59465efc7cb88 Thomas Zimmermann 2025-08-22  45  	mcr_cfg = ast_read32(ast, 0x10004);
b59465efc7cb88 Thomas Zimmermann 2025-08-22  46  
b59465efc7cb88 Thomas Zimmermann 2025-08-22  47  	switch (mcr_cfg & 0x0c) {
b59465efc7cb88 Thomas Zimmermann 2025-08-22  48  	case 0:
b59465efc7cb88 Thomas Zimmermann 2025-08-22  49  	case 4:
334d62edac4c5b Thomas Zimmermann 2025-08-22  50  		dram_layout = AST_DRAM_512Mx16;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  51  		break;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  52  	case 8:
b59465efc7cb88 Thomas Zimmermann 2025-08-22  53  		if (mcr_cfg & 0x40)
334d62edac4c5b Thomas Zimmermann 2025-08-22  54  			dram_layout = AST_DRAM_1Gx16;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  55  		else
334d62edac4c5b Thomas Zimmermann 2025-08-22  56  			dram_layout = AST_DRAM_512Mx32;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  57  		break;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  58  	case 0xc:
334d62edac4c5b Thomas Zimmermann 2025-08-22  59  		dram_layout = AST_DRAM_1Gx32;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  60  		break;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  61  	}
b59465efc7cb88 Thomas Zimmermann 2025-08-22  62  
334d62edac4c5b Thomas Zimmermann 2025-08-22 @63  	return dram_layout;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  64  }
b59465efc7cb88 Thomas Zimmermann 2025-08-22  65  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
