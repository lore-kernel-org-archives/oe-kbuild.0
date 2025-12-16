Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7682DECC2
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 22:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765923685; cv=none; b=hYItSUbVFm9QIJj/lWY83gWiOw7w1a4r+HCjUmFk1WizVIEpZ1D1Z6Nq/+WfEu3P9JXROJn+i2E7AerEpbBFAAX3b5ZriBMeLjxrMD20n4rzfYdDKYdb61M/Yc+VMJdGRqepK5HpKZGTmd6+2SZucwyyEo1Dm4J2G94S7LLXfX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765923685; c=relaxed/simple;
	bh=HYdtfX83aRZ4PiYZ8EiSq5Tpx/bJ6h+Zhy5IkOh7FMU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BEYQ/jKZTIEX57VvlVx6BgRh3BSVWPH4qbuDOh7TUj2b/pysQDwLM2hAJn0BMygfbLypyBwgEgNzWOsBuG1785NO3AdECnb98UbPsxIYRkUncWIH4/I9qgomkpOQYIKKprxQPUoi+5wzHymQwUAonzYzwCswxHn1i1RU1PtF090=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QIjqZE5o; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIjqZE5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765923685; x=1797459685;
  h=date:from:to:subject:message-id:mime-version;
  bh=HYdtfX83aRZ4PiYZ8EiSq5Tpx/bJ6h+Zhy5IkOh7FMU=;
  b=QIjqZE5oZRBNDwFcOIUxuXj/9VnGmNn3VX7kz+XA0X53aEUIOeu4Jiii
   Z5rIB4eqs3Xc/g/dstoF8FuMUx+LYdWeeO2PgR/U4nSbsoZcp+7OnJiKe
   97aAyh5BwA+tyNuWtpo/SRS1yxDkhh1FGUR5XCEnaAVohW0CjzdN60YQc
   U8c08XO0BTDrN9r1+1MWxKOZef7f1+W3idbpVlwDMKACvDVMavMTQofbr
   wTxdx3TDDxxNUU05tZvR8Ig7OhQzdJ/rWTkKN4UZyNuBOPFT/gAUddYTd
   9CZbnRN7fva/LOTGjr56jAGG2wulRmyR+Pc29ecIma+7L4jgtVptfA0Gu
   w==;
X-CSE-ConnectionGUID: rKlgw7YVRt2YVo4YIL88dw==
X-CSE-MsgGUID: QUV/nRehRyalBKjg/VAxVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67893538"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="67893538"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 14:21:24 -0800
X-CSE-ConnectionGUID: XQCVtJSrRWCIqEJ6iR0J5w==
X-CSE-MsgGUID: B+nhvFxATzuFPZxb7PDYnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="229206776"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 16 Dec 2025 14:21:23 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVdQ1-000000003Gg-1Ohr
	for oe-kbuild@lists.linux.dev;
	Tue, 16 Dec 2025 22:21:21 +0000
Date: Tue, 16 Dec 2025 23:21:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH RESEND] x86/asm/32: Modernize _memcpy()
Message-ID: <202512162334.CPLeignA-lkp@intel.com>
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
In-Reply-To: <20251216103750.229347-1-ubizjak@gmail.com>
References: <20251216103750.229347-1-ubizjak@gmail.com>
TO: Uros Bizjak <ubizjak@gmail.com>
TO: x86@kernel.org
TO: linux-kernel@vger.kernel.org

Hi Uros,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/x86-asm-32-Modernize-_memcpy/20251216-183922
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20251216103750.229347-1-ubizjak%40gmail.com
patch subject: [PATCH RESEND] x86/asm/32: Modernize _memcpy()
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251216/202512162334.CPLeignA-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: ''
#35: 
to:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
