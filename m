Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE151B6D08
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 23:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729034581; cv=none; b=qmc5kWsOVEUgg+3zUZ373rGTnruOYsxMEV8moYktLpU6+BDul5tDfe75HACRelsdskthmwMJ9ukjteoirqm5qd3qokdO3pb3DMczAopnHmMmOyl1m+j1o20g281umbLjvpOI7o00JlfAEfEY35SbD3DqpckLtS8iplriBA8+pNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729034581; c=relaxed/simple;
	bh=TZaQsR9t9pCzXA1Ke1PpYmCq1lTApr/BCOCr1e2XY2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gpi19rTXQM5bKmou7DFHQtDgI9q5boRjtw1ab4TsNQmIkfxdr2be39DtpgTO+IRqLuET3ZCOczuwuhkZpW1uNePnVfPitHVKM3jfmFCt+sRwDU+UVWYbWnY8nMP00oAM7HN2whT5WbUvrY+3W6zosvFowwMskGcWiZsijkDPO3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/wIpdA6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/wIpdA6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729034579; x=1760570579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TZaQsR9t9pCzXA1Ke1PpYmCq1lTApr/BCOCr1e2XY2Y=;
  b=i/wIpdA6lOKo25i+4yTKFLFwEQ02YdMGHGXMXiETutjQEa+6jjXd1MW9
   79BNBXYCUTVIVT0qHc4CeeZY8k7xI9j89tIW3MEvJZR0Q+gUP7sbpW3DE
   qVMwwkYi/CEYJeOyI5UtpeOcJ7ppx2cLaSQR6cA4Jf8FZFQwARqqzsoKr
   QsVTWRD6ktf+UZYAOQDFnNqJ6Y1Hf+XhDoSSkHscJ3KWZzSUbpFwv5us1
   RlDVlcxtMrVanOlLqhj8AW3DoysFim+OUWLzI0a82oEPONSDWw0D4rlh3
   HpQAebkuXwCkxmC64qP3B460zAVGqcFXcHuhcLyrIpsKynkHuoRNB9wjX
   Q==;
X-CSE-ConnectionGUID: mGvHWuYNSO6DGQ2BdmwhFw==
X-CSE-MsgGUID: UzScSd7cTbGuzgsTrlsS/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28556083"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28556083"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 16:22:58 -0700
X-CSE-ConnectionGUID: XmaeWia2QvKVXVt6Mtk6uw==
X-CSE-MsgGUID: SMUD9K+4SaSXybyyndI10Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="78114252"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Oct 2024 16:22:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0qsQ-000K2X-2R;
	Tue, 15 Oct 2024 23:22:54 +0000
Date: Wed, 16 Oct 2024 07:22:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: internal error: arch/alpha/kernel/core_marvel.c:815 SQL error #2:
 near "and": syntax error
Message-ID: <202410160738.B065pMU1-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
commit: a4184174be36369c3af8d937e165f28a43ef1e02 alpha: drop pre-EV56 support
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: alpha-randconfig-r071-20241016 (https://download.01.org/0day-ci/archive/20241016/202410160738.B065pMU1-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410160738.B065pMU1-lkp@intel.com/

New smatch warnings:
internal error: arch/alpha/kernel/core_marvel.c:815 SQL error #2: near "and": syntax error
internal error: arch/alpha/kernel/core_marvel.c:815 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

Old smatch warnings:
arch/alpha/kernel/core_marvel.c:614 marvel_pci_tbi() warn: statement has no effect 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
