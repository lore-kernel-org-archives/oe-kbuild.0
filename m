Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739034;
	b=TktB+GSi3u6Il3diI+me357wrqCeJ6F7ge80il2akCdXvTASL+oyc+HIEjYOlSW65jEQ
	 Ml5IlnV6gXjhjUkvpmBmo4LXbTCBW7GSZXOZNu4+6elFHxdnMvdpV0SG45XOGWHoqGpEP
	 OVMSCgILNqvM8OjopaICKsJcAJhoy596NqvW4bbYbxgOx/WPB4ElsYjz4dH7YUzoW+/C0
	 QlN0dzbiWwp4np3DIDili2hRrnychvLsX/2LC5J+TjtIPgMrgZdQikKfxGRPyZjEDBgdW
	 S4EZ1U8LnqdnjPNxeF17uVWH3nJTVpQBOLW6W2c1jJT7y0odQKkE/l2szZjq6bc/W6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739034;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=HDSTQpLEd8NrhOx0lu+7Gf7JyZgWlYu9QJs8EdVM8Xg=;
	b=5DmTVaOgk06z+b+pLh+7hOO9JMVMIsHi8jt9y3xrQWyCLPKjg9ZeBbPngeHDcw7EAnIq
	 8fLjG9YmVNRoMe5BInQyoukjgMzW4+RDST1J+mJmrJXQpzBX34232gQUpYOJMQWbE+79d
	 YJIruEruheFxzPs1IkUsIhYQfcKhwyrK6WFIzaArdCZkEzlTLNbRBO9/FYdfcJF4q3uj1
	 VCYFN4vc3XgZudGCrsbAkMMAdnRL7KUoMRfuTx8JOG3U733ukhjTaqPbyEMHME2///6Zl
	 OjpTIyfHjOR/KhO+GV+wn5WDepCfn6pSD6sOJjiMOp5Sv9lwgHRw2ABcv0pDZZ/l2rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yohm2Ptx;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E99B606A31A
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 10:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E99B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yohm2Ptx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794739033; x=1826275033;
  h=date:from:to:cc:subject:message-id;
  bh=SnpnSm9xTaqskpEnLKMBjQjBsFjCB6zVKCGzn9mepzo=;
  b=Yohm2Ptx9CLuhimDKjSjl8WKppgtmYQx539q24kELiIq9yfrcuxdUAgK
   0QHQhnQ4nFckIQAIkYw6Ur/Wr/GXV/ayZsHvz2Eou8Giw+uq9CvF50US4
   a144IaTo/y1B5lG8aCzhJhQ5FZ5HFxoTiMAa/h74o4vhLxg2K9zHt/LC7
   aMFKqkwcKNGHYf7xFZlNbi+YuSPj5NDAY4gEe985tlf0Hp1h27uDikaA4
   M4GupDIvgA85HyinfC+NX9y5cRxCftw5HrQErwWKV87YkMvoql7vcQzBv
   YBadhpe+kbGa2ZnriWGLeAnPPMx0REfLHAeyjM0kVCz6bYIKRq4BVAMHq
   g==;
X-CSE-ConnectionGUID: vFeGA5I3RSi3evmA2oE64Q==
X-CSE-MsgGUID: FHfYlCVrTPu0ot4GGL8Mag==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3505892"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3505892"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 02:37:13 -0800
X-CSE-ConnectionGUID: wkP540reSR+yaCB4J9uvEA==
X-CSE-MsgGUID: KcJSBgfhRWyBbVRawjsmxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9663572"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 15 Nov 2026 02:37:11 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSXbh-0000000029Q-18rn;
	Sun, 15 Nov 2026 10:37:09 +0000
Date: Sun, 15 Nov 2026 11:37:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1957/7428] undefined reference to
 `scsi_register_device_handler'
Message-ID: <202611151100.1wsRdb2g-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit | /zdci/kbuild/indicators/61/6173959c7d4d578bce9b075577cbdf59877b1eea-reported_build_error_fbc-error"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Liang Haowen <nbg2974@gmail.com>
CC: Lee Jones <lee@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84abb955b1015477aa11a96e2f3ac1b938b77f48
commit: 6173959c7d4d578bce9b075577cbdf59877b1eea [1957/7428] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe enclosures
:::::: branch date: 2 days ago
:::::: commit date: 12 days ago
config: alpha-randconfig-2001-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151100.1wsRdb2g-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151100.1wsRdb2g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611151100.1wsRdb2g-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/leds/rgb/leds-asus-aura-scsi.o: in function `asus_aura_init':
>> (.init.text+0x8): undefined reference to `scsi_register_device_handler'
>> alpha-linux-ld: (.init.text+0x24): undefined reference to `scsi_register_device_handler'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
