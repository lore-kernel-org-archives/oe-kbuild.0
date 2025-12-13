Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC7F3B8D4B
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 16:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765641847; cv=none; b=qz7dw9b7bVKE1cAiMd6p5oHLK7FQnr1Ip58z06BlhZXwRVqA3nnZsBUh+Js89gbwIU07eG6QTAWFGLGxxGb+Xnt9+I3upUnO4jfObDH36f8reoSCY2HmSGv38NPHAbUJefqef6z3CcEvzc9ABx+izHxLhqZsLq2dXWQehukhE0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765641847; c=relaxed/simple;
	bh=CNXW9ZRHp/d+c/3RrXwLhoQZpcIDhquUmw46YBw6+gw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KpHP/S7ijNKVPffOH29RF8oIi13V/yNFNNy/tmtT/+MnHzi41SWCksznIzRtulUUvW5afymsORKRgTg/XYVCiJhCucol1Z7Iv7gVt0pB1NrGqkEFEgjHezsP2bqUkK/0SoYEqOgHkJlKfEEzAt2fN/aJUCQZ7eIZTgw0gDhChp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htyaBkCC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htyaBkCC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765641839; x=1797177839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CNXW9ZRHp/d+c/3RrXwLhoQZpcIDhquUmw46YBw6+gw=;
  b=htyaBkCCbuOHhLX3hQ0nXslXWdWA4GOT3QLxGnNb1hS0Y2uBEDVAitf8
   GEid36Xb0uU63pQbHsZmKAwvxXXb7U4bHTp+o2BgTc9b32k0afv1/9T7a
   Tni/UH2HIz0IRGrEh0l3MeQCVTPnYruWDB2n4SKdjXIMezt4le70T79aY
   MjN3qYiHgqWD9S5gLrSS/7wJX/Q4sVRx31k6V2qtfi2Uo0ntVKhX1k8Ra
   npBY9KRmVj5UJYwZdBeWKWY/qPuZcx4aYMCDXAhopG3WHWs6hwPHRW47c
   lhwlkbiEi1ZtkC8Qi00FKCc5yOVPUhjx4AOXSGsb5oJvp8BMvFeNL15ac
   A==;
X-CSE-ConnectionGUID: PouANMpmS6OYdJfBqXkyjw==
X-CSE-MsgGUID: Lq8XEGbeR0SogDCFTXRtgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67655585"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67655585"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 08:03:58 -0800
X-CSE-ConnectionGUID: fdVnpbqSRbe1YFqyaQ79BQ==
X-CSE-MsgGUID: vGDWDiehQ5KYfCpMa+zvUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196613679"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 08:03:57 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUS66-000000007r3-0Los;
	Sat, 13 Dec 2025 16:03:54 +0000
Date: Sun, 14 Dec 2025 00:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse:
 directive in macro's argument list
Message-ID: <202512140058.HoEtI1Wv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: Danilo Krummrich <dakr@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 77f183d151bda791ac26ee479b6542ccd35acdac drm/nouveau: Avoid multiple -Wflex-array-member-not-at-end warnings
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
config: sparc64-randconfig-r133-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140058.HoEtI1Wv-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140058.HoEtI1Wv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512140058.HoEtI1Wv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/nouveau/nvif/client.c: note: in included file:
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nvif/object.c: note: in included file:
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/nvif/object.c:202:41: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void * @@
   drivers/gpu/drm/nouveau/nvif/object.c:202:41: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/object.c:202:41: sparse:     got void *
--
   drivers/gpu/drm/nouveau/nvkm/core/ioctl.c: note: in included file:
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c: note: in included file:
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.c: note: in included file:
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_debugfs.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_debugfs.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_led.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_led.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_nvif.c: note: in included file:
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_bo0039.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:62:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:62:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:62:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:86:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:86:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:106:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:106:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:107:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:107:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nouveau_vga.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_drm.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/nouveau_drm.c:407:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:407:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:408:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:408:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:408:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:408:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:412:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:412:33: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nouveau_hwmon.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_mem.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_bo5039.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:63:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:63:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:63:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:63:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:63:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:63:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:63:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:63:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:80:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:80:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:85:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:85:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:85:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:85:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:85:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:85:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:85:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:85:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:102:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:102:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:106:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:106:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:106:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:126:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:126:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:146:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:146:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:147:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:147:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:147:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:147:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nouveau_prime.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_sched.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_ttm.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_bo.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_gem.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/nouveau_gem.c:884:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_gem.c:885:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_gem.c:917:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_gem.c:918:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_gem.c:920:33: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nouveau_exec.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_vmm.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_display.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_gem.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv04/cursor.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_sgdma.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv04/dac.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv04/dfp.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_uvmm.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_connector.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv04/disp.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv04/arb.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_bios.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/lut.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_dp.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv04/crtc.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1137:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1137:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1222:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1222:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1223:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1223:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1224:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1224:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1225:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1225:17: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv04/tvnv04.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/core507d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/core507d.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/core507d.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/core507d.c:49:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/core507d.c:49:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/core507d.c:49:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/core507d.c:90:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/core507d.c:90:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/core507d.c:95:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/core507d.c:95:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/core507d.c:97:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/core507d.c:97:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/core507d.c:139:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/core507d.c:139:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv04/overlay.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/core827d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/crc907d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/crc907d.c:64:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crc907d.c:64:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crc907d.c:65:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crc907d.c:65:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crc907d.c:67:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crc907d.c:67:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crc907d.c:68:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crc907d.c:68:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crc907d.c:84:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crc907d.c:84:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/core907d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv04/tvnv17.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/core.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/pior507d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/pior507d.c:45:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/pior507d.c:45:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/corec57d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/corec57d.c:39:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec57d.c:39:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec57d.c:42:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec57d.c:42:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec57d.c:42:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec57d.c:50:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec57d.c:50:17: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv04/hw.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:44:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:44:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:61:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:61:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:69:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:69:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:74:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:74:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:137:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:137:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:140:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:140:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:140:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:149:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:149:17: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/dac507d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/dac507d.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/dac507d.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/dac507d.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/crcc37d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/crcc37d.c:44:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc37d.c:44:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc37d.c:45:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc37d.c:45:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc37d.c:47:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc37d.c:47:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc37d.c:48:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc37d.c:48:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc37d.c:63:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc37d.c:63:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/core917d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/dac907d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/dac907d.c:38:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/dac907d.c:38:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/sor907d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/sor907d.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/sor907d.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/crc.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/sorc37d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/sorc37d.c:38:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/sorc37d.c:38:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/head.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c:40:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c:40:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c:41:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c:41:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c:44:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c:44:17: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/sor507d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/sor507d.c:45:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/sor507d.c:45:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/disp.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/disp.c:138:31: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/gpu/drm/nouveau/dispnv50/disp.c:187:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/disp.c:201:31: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/gpu/drm/nouveau/dispnv50/disp.c:261:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *bgn @@     got void [noderef] __iomem *ptr @@
--
   drivers/gpu/drm/nouveau/dispnv50/wimm.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/head507d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:39:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:39:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:58:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:58:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:90:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:90:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:118:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:118:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:132:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:132:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:149:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:149:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:149:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:198:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:198:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:215:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:215:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:215:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:215:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:215:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:233:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:233:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:288:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:288:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:303:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:303:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:303:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:356:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:356:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:356:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:365:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:365:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:365:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:365:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:365:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:365:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:365:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:365:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:393:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:393:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:410:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:410:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:416:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:416:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:420:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:420:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:420:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:55:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:55:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:74:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:74:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:95:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:95:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:114:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:114:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:118:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:118:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:132:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:132:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:132:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:148:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:148:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:149:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:149:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:171:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:171:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:185:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:185:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:185:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:185:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:220:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:220:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:220:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:220:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:220:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:237:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:237:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:238:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:238:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:240:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:240:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:243:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:243:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:247:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:247:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:264:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:264:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:268:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc37d.c:268:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c:40:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c:40:9: sparse: sparse: dubious: !x & y
   drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c:40:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c:55:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c:55:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/head827d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:39:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:39:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:58:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:58:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:58:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:69:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:69:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:83:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:83:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:86:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:86:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:86:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:86:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:86:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:104:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:104:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:123:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:123:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:137:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:137:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:137:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:145:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:145:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/base827c.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:37:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:37:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:44:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:44:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:44:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:51:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:51:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:51:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:59:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:59:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:59:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:59:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:59:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base827c.c:59:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:48:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:48:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:48:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:61:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:61:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:74:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:74:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:74:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:74:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:103:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:103:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:103:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:103:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:103:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:103:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:103:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:103:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:148:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:148:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:152:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:152:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:165:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:165:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:170:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:170:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:170:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:170:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:170:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:192:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:192:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:192:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:193:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:193:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:195:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:195:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:199:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:199:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:203:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:203:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:218:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:218:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:231:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:231:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:231:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:248:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:248:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:261:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:261:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:261:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:261:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:261:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:277:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:277:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:277:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:281:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:281:9: sparse: sparse: dubious: !x & y
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:281:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/head917d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/head917d.c:40:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head917d.c:40:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head917d.c:73:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head917d.c:73:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head917d.c:88:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head917d.c:88:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head917d.c:88:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head917d.c:98:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head917d.c:98:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/curs.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:46:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:46:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:46:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:46:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:46:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:64:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:64:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:64:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:65:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:65:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:71:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:71:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:95:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:95:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:95:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:108:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:108:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:108:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:121:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:121:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:134:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:134:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:134:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c:134:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/ovly.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/base.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/wndw.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:39:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:39:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:68:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:68:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:89:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:89:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:106:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:106:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:229:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:229:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:230:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:230:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:232:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:232:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:235:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:235:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:239:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:239:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/curs507a.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/oimm.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/cursc37a.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/base917c.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/oimm507b.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:38:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:38:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:43:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:43:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:43:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:43:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:43:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:60:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:60:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:60:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:61:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:61:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:63:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:63:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:71:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c:71:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/base507c.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:57:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:57:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:61:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:61:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:74:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:74:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:78:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:78:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:81:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:81:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:81:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:88:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:88:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:88:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:96:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:96:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:98:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:98:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:98:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:98:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:127:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:127:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:141:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:141:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:167:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:167:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:180:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:180:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:180:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:204:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:204:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:217:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:217:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:217:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:217:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:217:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/curs907a.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/head907d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:46:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:46:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:46:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:87:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:87:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:148:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:148:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:162:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:162:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:167:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:167:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:181:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:181:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:181:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:191:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:191:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:205:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:205:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:219:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:219:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:222:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:222:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:222:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:222:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:222:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:240:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:240:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:256:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:256:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:259:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:259:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:273:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:273:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:273:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:281:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:281:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:333:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:333:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:333:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:333:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:333:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:333:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:333:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:358:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:358:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:363:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:363:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:363:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:363:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:388:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:388:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:394:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:394:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:398:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:398:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:398:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:398:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/base907c.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:37:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:37:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:74:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:74:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:77:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:77:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:80:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:80:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:93:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:93:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:93:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:93:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:102:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:102:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:165:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:165:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:179:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:179:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:179:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:179:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:64:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:64:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:68:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:68:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:70:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:70:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:73:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:73:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:45:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:45:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:47:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:47:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:50:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:50:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:52:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:52:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:52:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:52:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nv10_fence.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/nv10_fence.c:35:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct nvif_push *push @@     got struct nvif_push [noderef] __rcu * @@
   drivers/gpu/drm/nouveau/nv10_fence.c:35:40: sparse:     expected struct nvif_push *push
   drivers/gpu/drm/nouveau/nv10_fence.c:35:40: sparse:     got struct nvif_push [noderef] __rcu *
   drivers/gpu/drm/nouveau/nv10_fence.c:38:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv10_fence.c:38:17: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nv04_fence.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/nv04_fence.c:45:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv04_fence.c:45:17: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/ovly917e.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, ...):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:38:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:38:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:47:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:47:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:49:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:49:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:49:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:49:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nouveau_dma.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_fence.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/nouveau_fence.c:433:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct nouveau_channel [noderef] __rcu *channel @@     got struct nouveau_channel *chan @@
   drivers/gpu/drm/nouveau/nouveau_fence.c:433:24: sparse:     expected struct nouveau_channel [noderef] __rcu *channel
   drivers/gpu/drm/nouveau/nouveau_fence.c:433:24: sparse:     got struct nouveau_channel *chan
--
   drivers/gpu/drm/nouveau/nv50_fence.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nouveau_chan.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/nouveau_chan.c:134:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *bgn @@     got void [noderef] __iomem *ptr @@
   drivers/gpu/drm/nouveau/nouveau_chan.c:134:37: sparse:     expected unsigned int [usertype] *bgn
   drivers/gpu/drm/nouveau/nouveau_chan.c:134:37: sparse:     got void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nouveau_chan.c:182:44: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void *virtual @@
   drivers/gpu/drm/nouveau/nouveau_chan.c:182:44: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nouveau_chan.c:182:44: sparse:     got void *virtual
   drivers/gpu/drm/nouveau/nouveau_chan.c:466:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_chan.c:480:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_chan.c:480:17: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nv17_fence.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/nv17_fence.c:57:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv17_fence.c:57:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv17_fence.c:57:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv17_fence.c:57:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv17_fence.c:57:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv17_fence.c:65:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv17_fence.c:65:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv17_fence.c:65:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv17_fence.c:65:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv17_fence.c:65:17: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nouveau_abi16.c: note: in included file:
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
--
   drivers/gpu/drm/nouveau/nv84_fence.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/nv84_fence.c:41:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:41:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:64:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:64:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:88:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct nouveau_channel *chan @@     got struct nouveau_channel [noderef] __rcu *channel @@
   drivers/gpu/drm/nouveau/nv84_fence.c:88:45: sparse:     expected struct nouveau_channel *chan
   drivers/gpu/drm/nouveau/nv84_fence.c:88:45: sparse:     got struct nouveau_channel [noderef] __rcu *channel
--
   drivers/gpu/drm/nouveau/nvc0_fence.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
>> drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/nvc0_fence.c:40:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvc0_fence.c:40:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvc0_fence.c:40:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvc0_fence.c:40:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvc0_fence.c:40:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvc0_fence.c:40:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvc0_fence.c:63:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvc0_fence.c:63:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvc0_fence.c:63:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvc0_fence.c:63:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvc0_fence.c:63:17: sparse: sparse: cast removes address space '__iomem' of expression

vim +9 drivers/gpu/drm/nouveau/include/nvif/ioctl.h

8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10   4  
8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10   5  struct nvif_ioctl_v0 {
77f183d151bda7 drivers/gpu/drm/nouveau/include/nvif/ioctl.h Gustavo A. R. Silva 2025-02-12   6  	/* New members MUST be added within the struct_group() macro below. */
77f183d151bda7 drivers/gpu/drm/nouveau/include/nvif/ioctl.h Gustavo A. R. Silva 2025-02-12   7  	struct_group_tagged(nvif_ioctl_v0_hdr, __hdr,
8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10   8  		__u8  version;
8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10  @9  #define NVIF_IOCTL_V0_SCLASS                                               0x01
8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10  10  #define NVIF_IOCTL_V0_NEW                                                  0x02
8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10  11  #define NVIF_IOCTL_V0_DEL                                                  0x03
8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10  12  #define NVIF_IOCTL_V0_MTHD                                                 0x04
8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10  13  #define NVIF_IOCTL_V0_MAP                                                  0x07
8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10  14  #define NVIF_IOCTL_V0_UNMAP                                                0x08
8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10  15  		__u8  type;
bf81df9be28657 drivers/gpu/drm/nouveau/include/nvif/ioctl.h Ben Skeggs          2015-08-20  16  		__u8  pad02[4];
bf81df9be28657 drivers/gpu/drm/nouveau/include/nvif/ioctl.h Ben Skeggs          2015-08-20  17  #define NVIF_IOCTL_V0_OWNER_NVIF                                           0x00
bf81df9be28657 drivers/gpu/drm/nouveau/include/nvif/ioctl.h Ben Skeggs          2015-08-20  18  #define NVIF_IOCTL_V0_OWNER_ANY                                            0xff
bf81df9be28657 drivers/gpu/drm/nouveau/include/nvif/ioctl.h Ben Skeggs          2015-08-20  19  		__u8  owner;
8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10  20  #define NVIF_IOCTL_V0_ROUTE_NVIF                                           0x00
8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10  21  #define NVIF_IOCTL_V0_ROUTE_HIDDEN                                         0xff
8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10  22  		__u8  route;
8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10  23  		__u64 token;
bf81df9be28657 drivers/gpu/drm/nouveau/include/nvif/ioctl.h Ben Skeggs          2015-08-20  24  		__u64 object;
77f183d151bda7 drivers/gpu/drm/nouveau/include/nvif/ioctl.h Gustavo A. R. Silva 2025-02-12  25  	);
8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10  26  	__u8  data[];		/* ioctl data (below) */
8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10  27  };
77f183d151bda7 drivers/gpu/drm/nouveau/include/nvif/ioctl.h Gustavo A. R. Silva 2025-02-12  28  static_assert(offsetof(struct nvif_ioctl_v0, data) == sizeof(struct nvif_ioctl_v0_hdr),
77f183d151bda7 drivers/gpu/drm/nouveau/include/nvif/ioctl.h Gustavo A. R. Silva 2025-02-12  29  	      "struct member likely outside of struct_group()");
8ec2a6ec6e229d drivers/gpu/drm/nouveau/nvif/ioctl.h         Ben Skeggs          2014-08-10  30  

:::::: The code at line 9 was first introduced by commit
:::::: 8ec2a6ec6e229d67b19737f9b603eef478fa955d drm/nouveau/core: import ioctl/event interfaces

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
