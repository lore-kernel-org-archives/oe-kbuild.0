Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D233246E3
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069302; cv=none; b=VZFov3bWIBpyoVJ/JcoDa/3WgkOZLWXpUM/MiZzoe1g6Adat0kyUF7BwxU3gC8TaUlnGs81xHPrL7bZd5vq0dbPxlYIEPXVpUoFCwu6gEypAo6szrlujJYKuXMwn+8Uqh4Ed/eVaXjREdWkz+xNYraPHxDLRpzuWgiMQKSbvrdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069302; c=relaxed/simple;
	bh=0CDyUjQ7YeUrGFPQcI0VbD9n4WULgxclZpGGrMQshPA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pzYFzLY3/8xVieR+dpB2O33vA89qTbDk1LMnpuY7FHB0d1v/VJGItcAtKmLHUYBD1oKEOLSvc6o0wvUcr9tbZy6JKV9yFcUtnPErXcKaEmVwdImxSiwyg296vdxrb0z7avKtNTmFLaMELAjwn7Hz/MRoHo1frBBwFHKEyb12Lio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAv27bqB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAv27bqB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069301; x=1794605301;
  h=date:from:to:subject:message-id:mime-version;
  bh=0CDyUjQ7YeUrGFPQcI0VbD9n4WULgxclZpGGrMQshPA=;
  b=HAv27bqBKLP+gQqEtxtXl2OeVCX6Nl0YWvqgGqQy1dL3C2Ile5s4eXST
   vgHOXP29GSK7xEz0n3r/rFo1cCLRC3YeD6dqbvoDKvpqCVXv20u5A4Tag
   vUZ3dxiy0BXd4koGysFDnTKI8UFj6CUrG7R4FR+Z0eFc7Ptp4rE1JPvB3
   Qr+ypGsfbB98zN0cK7ilPxJtR7r4/eC14NHwPLBo5tOphQLPpAVORM4aP
   BCKTUc/dniN8Q8ZXoaUGp0deSCQNHLHIbF0hdQfTEGsRDilDqwTMBgcc0
   /eHGkC9NHqHgj6TyUnydNIWKPa6RnNNqEGgmbbDG+lbjOeMJILL8dsB+8
   A==;
X-CSE-ConnectionGUID: yPTtXqsPQ3WczipuiEgHtA==
X-CSE-MsgGUID: 35+UE9gTS36+thBV9Q1Omw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90637518"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="90637518"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:28:17 -0800
X-CSE-ConnectionGUID: kQH4M5EnQYCHvQjRw2rEhw==
X-CSE-MsgGUID: azhpxzJ2QQqsqf8WV9w03Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="190035933"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2025 13:28:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJerW-0000000019z-2Bgb
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:28:14 +0000
Date: Thu, 13 Nov 2025 22:27:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 589/867] checkpatch: ERROR:SPACING:
 spaces required around that '|=' (ctx:VxW)
Message-ID: <202511131944.RRNFEDAW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: 0bf6463036f1c78e92e685375fb25b4071ee68a5 [589/867] bcachefs: data_update_opts.ptrs_io_error
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131944.RRNFEDAW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131944.RRNFEDAW-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: spaces required around that '|=' (ctx:VxW)
#28: FILE: fs/bcachefs/data/read.c:287:
+				update_opts.ptrs_io_error|= ptr_bit;
 				                         ^

ERROR:SPACING: spaces required around that '|=' (ctx:VxW)
#29: FILE: fs/bcachefs/data/read.c:288:
+				update_opts.ptrs_rewrite|= ptr_bit;
 				                        ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
