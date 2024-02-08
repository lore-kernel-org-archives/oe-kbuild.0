Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5F72C6B5
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Feb 2024 04:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707365310; cv=none; b=mX1MhKuYX4H2L843UR6eD4ygVX2CS/6+tibKEmdBg4REd5C0D/DmlZdXQcgJOhTt3775xucNBsSolX9O/LE9cX3i7L3eRjlLrGeFecAIWLKsEsQZ204P1wMQemcMTcu0sbRxRNnxNttDssNXJbSLoyyyhtet0kg3xTpLV4B/IJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707365310; c=relaxed/simple;
	bh=htxpLOzS0CsWiNoPAxTdS/7utQsvn5CzwdpX2ummOv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qnbVJ45dkupW7veHeV8qie9/MlltU0GHmcS4+FcFi5zg19hTjnEO0kzzr5/drWaELrha/SyL1OSv/imqOAdpsEmPth4/rLWxADoNhq1bKpILtzyriPph6Pkj0EA1kBB3qFF4YmsikLNGrcThffd/wyTSoMwt/xxI5QATkHZEHeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsB5sAGs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsB5sAGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707365309; x=1738901309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=htxpLOzS0CsWiNoPAxTdS/7utQsvn5CzwdpX2ummOv4=;
  b=BsB5sAGsQlSgElhxfB0nESi+VqAWKGCgucAuQNGVEcJe1taTDFWATaKT
   7Er0ms2aHDtGmS41pazaJDcSxM6l4quBocijKI81t7/vkqaB4fcGfA1lX
   pElv6KJDudxCheL6JIft8X55wAQpFZE6zA+YWc5thBpTur5fTuyTCFtEp
   qI7P7kaiS+nLwVo4xBu7cTPGu92UFJgEEu5S9yJRTtruGS0PlBrLP2dVk
   kRDX7C/M3DzUfooarbwnhppSuvP73wS0cRohRe0DgM8pL2lxd+mLeKQzF
   kPYJFIumU5RHYVxycnlew+OLi1uuW+sopeewbQMD094r4ryRuFs0XNZ/F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="11775893"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="11775893"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 20:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1531961"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Feb 2024 20:08:24 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXvi3-0003LI-2a;
	Thu, 08 Feb 2024 04:08:23 +0000
Date: Thu, 8 Feb 2024 12:07:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:d1-6.8.y 33/50] sound/soc/sunxi/sun20i-codec.c:427:14:
 sparse: sparse: duplicate const
Message-ID: <202402081140.xOiQTo7j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: sound/soc/sunxi/sun20i-codec.c:427:14: sparse: sparse: duplicate const"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Samuel Holland <samuel@sholland.org>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>

tree:   https://github.com/esmil/linux d1-6.8.y
head:   f3b6698ac10e7f6528408bda7d8d162065a44af1
commit: 2bf2b3c3e381c76f1f04c3863bfbd5e03b35195f [33/50] ASoC: sun20i-codec: New driver for D1 internal codec
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arc-randconfig-r111-20240208 (https://download.01.org/0day-ci/archive/20240208/202402081140.xOiQTo7j-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240208/202402081140.xOiQTo7j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402081140.xOiQTo7j-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/sunxi/sun20i-codec.c:427:14: sparse: sparse: duplicate const
   sound/soc/sunxi/sun20i-codec.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +427 sound/soc/sunxi/sun20i-codec.c

2bf2b3c3e381c7 Samuel Holland 2021-06-12  426  
2bf2b3c3e381c7 Samuel Holland 2021-06-12 @427  static const SOC_ENUM_DOUBLE_DECL(sun20i_codec_line_out_mode_enum,
2bf2b3c3e381c7 Samuel Holland 2021-06-12  428  				  SUN20I_CODEC_DAC,
2bf2b3c3e381c7 Samuel Holland 2021-06-12  429  				  SUN20I_CODEC_DAC_LINEOUTL_DIFFEN,
2bf2b3c3e381c7 Samuel Holland 2021-06-12  430  				  SUN20I_CODEC_DAC_LINEOUTR_DIFFEN,
2bf2b3c3e381c7 Samuel Holland 2021-06-12  431  				  sun20i_codec_line_out_mode_enum_text);
2bf2b3c3e381c7 Samuel Holland 2021-06-12  432  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
