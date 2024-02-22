Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AFC101C2
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Feb 2024 07:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708586536; cv=none; b=Ph4KbYmYmB9tAVYyZjgG3EeAq2arWyU8L8oFgStkFCj76MmgVF3IQxa4X8+RoIV3EoMlCBqw8A2kNkHwSZUXpaJ7l8J3dkrdSjAVEPv0Kdz9bhNBatmNDcSB5J4zpr6rTGPGFFqBy3tzMX+PmIdv+LwaWBqz1gZRItLhe37E+EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708586536; c=relaxed/simple;
	bh=o8Mj+ms1DNXA5b4lkt/EUD4YmaH/TksGAsnm+uQYZb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2a3BaTpD3i6RSd0oO3Fx4iV1/HheKHuUdek7gy3hISDhqGIndLkqMIjLj0ybSiUjRfD2BG/U2uXpeCq6d3k741pSvLzm8NYE65diZukfmZVnW3MXaWqaxqfBA7XH3z2feCj4gzN0ItwHmHC05mXxRhREbmGLJlN5gHdrA5U9KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKs0iRgk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKs0iRgk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708586533; x=1740122533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o8Mj+ms1DNXA5b4lkt/EUD4YmaH/TksGAsnm+uQYZb8=;
  b=FKs0iRgkvNNf35cMZUzY+1g5hCeXBHGfI4vzohaYlcbMjkc9FptprRam
   xAdSyIVHQasNi2/tBaCqHV4ehn7l/w2eVHB4m+cq3fugZYDRMBkThR9FG
   qD40KCrROjiz7c2j0Q9j+DDWsJWxX1adKe6JqchVeZW5mP9jn3G1zHCkO
   SIKg/NsrOHgsVzjNGhWU2pre+PofVNd+Inrr/bMRQx6JEQVJBzVsuzJKx
   w9J5rwL+rkUmI7Ce2L6RCwlFxtQ8ImntsX/XtekuecZnaqdGfDJm9TT7X
   5FPTJzuw1LrEgakf+rjrMMcwIXFWauB2XKSK8vSba5t7bJnSotSwntqtW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="20223583"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="20223583"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 23:22:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5343787"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 21 Feb 2024 23:22:10 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd3PD-000656-0p;
	Thu, 22 Feb 2024 07:22:07 +0000
Date: Thu, 22 Feb 2024 15:16:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 9/9] ASoC: cs-amp-lib: Add KUnit test for calibration
 helpers
Message-ID: <202402221544.okaeWC1f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: ld.lld: error: undefined symbol: efi_status_to_err"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240221150507.1039979-10-rf@opensource.cirrus.com>
References: <20240221150507.1039979-10-rf@opensource.cirrus.com>
TO: Richard Fitzgerald <rf@opensource.cirrus.com>
TO: broonie@kernel.org
TO: tiwai@suse.com
CC: linux-sound@vger.kernel.org
CC: alsa-devel@alsa-project.org
CC: linux-kernel@vger.kernel.org
CC: patches@opensource.cirrus.com
CC: Richard Fitzgerald <rf@opensource.cirrus.com>

Hi Richard,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.8-rc5 next-20240221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Fitzgerald/ASoC-wm_adsp-Fix-missing-mutex_lock-in-wm_adsp_write_ctl/20240221-230851
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240221150507.1039979-10-rf%40opensource.cirrus.com
patch subject: [PATCH 9/9] ASoC: cs-amp-lib: Add KUnit test for calibration helpers
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: hexagon-randconfig-r123-20240222 (https://download.01.org/0day-ci/archive/20240222/202402221544.okaeWC1f-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce: (https://download.01.org/0day-ci/archive/20240222/202402221544.okaeWC1f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402221544.okaeWC1f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: efi_status_to_err
   >>> referenced by cs-amp-lib.c
   >>>               sound/soc/codecs/cs-amp-lib.o:(cs_amp_get_efi_calibration_data) in archive vmlinux.a
   >>> referenced by cs-amp-lib.c
   >>>               sound/soc/codecs/cs-amp-lib.o:(cs_amp_get_efi_calibration_data) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
