Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F3626A0B9
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 05:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765950314; cv=none; b=gGG0PFIdOQWL94uhYJq6qH3iujtO6F9+v5li0P6j5RZCXa0zI5HFgXA/V/gMBGXzYmSyBJVK0gTeedTqZpfNYXxUNSgYMVVF63KpmZL0NH9CAJhV7YXrBl9pIegr7ysm1aLzVPdSqHKAI3K/B5KOK7o+NYxn/5+4L5fVC8d6yoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765950314; c=relaxed/simple;
	bh=u4Uo/7sfKgClc3Qe/PuWjDOoBVL2cEPkI32PgevYd/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uP8+d41nCjvY3fwXrd3qcBG8hda3cm19y9KidjlZA0E3qS05Ia6j337w15vmiEP+s6Dn1m9XC6LyPmCK1aMSQJUBtMHqmLLlQxf6U+NQZjrD8wY7JLtheao53tk1wFlnkGcIEnhR4tUQPfYAvAj3/4KOW/mLyNA9uMcQqouTYOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ez7CuMfe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ez7CuMfe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765950313; x=1797486313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u4Uo/7sfKgClc3Qe/PuWjDOoBVL2cEPkI32PgevYd/A=;
  b=ez7CuMfel6frV41DwegRbU45EkliMytluBM0NOiTYRwjhgsWdgHV4I0P
   nbskz5i5uYKt7eEK43L61eCDolyYgx+gxnmBPyJMpbXP9jYd0TKhw36j9
   nkFypCAn1KiE5OSoTnPaEfTuhmy5eFJr2aIEnUdhwj4eoXe/TgkBrM1Zv
   ktIxhxqEhbA4QFhyDN/bhTcK2o/230HE+uvtq5GfCb7GTaqNVrWhUd5wx
   HPGeafx3SvXG6J6EqE9KgFbB8LNCeyQFAX2oDbDPpKoUH9iKWNHXxHX0C
   NCWIXNevMGOQi98HElKyjEX5ouEVMEyZ2sZJO/+Q6iWehlrQ3C2F4K80J
   g==;
X-CSE-ConnectionGUID: c6RXDOyuScuhFlDN3/1p3Q==
X-CSE-MsgGUID: wsYJZ/ivQq+n0bxsdONqgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78592136"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="78592136"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 21:45:12 -0800
X-CSE-ConnectionGUID: 7chdlSVWT/+oUO2YO5Gl1g==
X-CSE-MsgGUID: NfV1EnxGRF2Nz+BPhhYO8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="198212201"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Dec 2025 21:45:11 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVkLV-0000000003X-18wa;
	Wed, 17 Dec 2025 05:45:09 +0000
Date: Wed, 17 Dec 2025 13:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1396/2012]
 drivers/gpu/drm/sitronix/st7571.c:916:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202512171345.LlY2dSAC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/sitronix/st7571.c:916:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Marcus Folkesson <marcus.folkesson@gmail.com>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   12b95d29eb979e5c4f4f31bb05817bc935c52050
commit: b362de167daf2f1e42a6d5ea2d4e51e8d9d031fd [1396/2012] drm/sitronix/st7571: split up the driver into a common and an i2c part
:::::: branch date: 2 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-r111-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171345.LlY2dSAC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171345.LlY2dSAC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512171345.LlY2dSAC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/sitronix/st7571.c:916:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7571.c:916:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpu/drm/sitronix/st7571.c:917:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7571.c:917:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/drm/sitronix/st7571.c:918:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7571.c:918:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpu/drm/sitronix/st7571.c:918:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7571.c:918:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +916 drivers/gpu/drm/sitronix/st7571.c

b362de167daf2f Marcus Folkesson 2025-12-15  915  
b362de167daf2f Marcus Folkesson 2025-12-15 @916  MODULE_AUTHOR("Marcus Folkesson <marcus.folkesson@gmail.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
