Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE882EB0F
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 03:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791084817; cv=none; b=NFNngIMV18Y2+eMa3aY/2iUVbDk7XUKx+6liXplSSYNCMnOl5KwFEnOl4u9TB/GA2VElG+cBiSe1Sl0cgF086uvLWQKL0khGQUWt0ov7g21wSU8SE8ZloMmTBMOCBt3cwRWPdW8umgBlt8ejMCiCwr5olKjqWbF0Bvug0Uc31a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791084817; c=relaxed/simple;
	bh=sZA5+hQputvW6j36Hl+3Tb7HGFJWE64OzZbxSfbst0A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iP2R1MZn9EUmizP7+afrhel0ha40W3e44AQC+5R6GiSQW5eGy8P5Z/fyTdRIBPRUsNCtjp5THbfqiGK2oIVQfMY609dHgubj8bEhNamvsaOrR9NoDvMv3fi2V8H6M4twzhoVvTts/eU1sNlxGff0KcNOLFV9CTrDBOGyxM7F2E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwxXukew; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwxXukew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791084814; x=1822620814;
  h=date:from:to:cc:subject:message-id;
  bh=sZA5+hQputvW6j36Hl+3Tb7HGFJWE64OzZbxSfbst0A=;
  b=KwxXukewFvdbb032+XPAMUzEOw6rZ1RQbWNFIpUFn8ZGthnANZ1vYYn1
   7Vqp2++GkzIEGu1HARkNXdbfcNbnkKrtGYdjklrzChjmEYOJ3wgk91IiF
   yIGrGfcpoJAJPDDvh9YwFGVMW1Aidkn6Z8IEq/iBZ10CS0Ur/jUIAM2sD
   1suqINFv5C1fBhf9MshCB8Coo2ZM0osaF7uqCLIYJd17g73sMDw4Hxegv
   erbdQ+w+COxajCWfzqyNUGCXuL6ZlcbFpQomFO4Qrjn03xq09FJLgSpcc
   4pEIBR6MTKImy9A2sgAygwwmniqDqwmIU4VZS0MwspM1sl9bjUPzrBU57
   w==;
X-CSE-ConnectionGUID: d3ZhNLShQ7eCb1n6ntjtmw==
X-CSE-MsgGUID: MfMKOoH7TuWn+16LwMnJ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90692626"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90692626"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 20:33:32 -0700
X-CSE-ConnectionGUID: CwJ+uyTfTmWATJjek7MPAg==
X-CSE-MsgGUID: kP0uADtBT9ikCHlyDho88A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="306043192"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 03 Oct 2026 20:33:30 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDCye-000000000BX-2XKo;
	Sun, 04 Oct 2026 03:33:28 +0000
Date: Sun, 04 Oct 2026 05:32:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2638/14185]
 drivers/media/pci/intel/ipu6/ipu6-buttress.c:473:3-5: opportunity for
 str_up_down(on)
Message-ID: <202610040500.LubZGK8q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Antti Laakso <antti.laakso@linux.intel.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f0406245cb9855e6318335a8a223551354291a46
commit: 381f97a28c04ffebaabf616260a99f054d9b32fd [2638/14185] media: ipu6: Add ipu7 buttress support
:::::: branch date: 27 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-2103-20261004 (https://download.01.org/0day-ci/archive/20261004/202610040500.LubZGK8q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610040500.LubZGK8q-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/pci/intel/ipu6/ipu6-buttress.c:473:3-5: opportunity for str_up_down(on)

vim +473 drivers/media/pci/intel/ipu6/ipu6-buttress.c

ab29a2478e709b8 Bingbu Cao   2024-01-31  451  
381f97a28c04ffe Antti Laakso 2026-08-27  452  static int ipu7_isys_d2d_power(struct ipu6_device *isp, bool on)
381f97a28c04ffe Antti Laakso 2026-08-27  453  {
381f97a28c04ffe Antti Laakso 2026-08-27  454  	u32 target = on ? IPU7_BUTTRESS_D2D_PWR_ACK : 0U;
381f97a28c04ffe Antti Laakso 2026-08-27  455  	u32 val;
381f97a28c04ffe Antti Laakso 2026-08-27  456  	int ret;
381f97a28c04ffe Antti Laakso 2026-08-27  457  
381f97a28c04ffe Antti Laakso 2026-08-27  458  	val = readl(isp->base + IPU7_BUTTRESS_REG_D2D_CTL);
381f97a28c04ffe Antti Laakso 2026-08-27  459  	if ((val & IPU7_BUTTRESS_D2D_PWR_ACK) == target)
381f97a28c04ffe Antti Laakso 2026-08-27  460  		return 0;
381f97a28c04ffe Antti Laakso 2026-08-27  461  
381f97a28c04ffe Antti Laakso 2026-08-27  462  	if (on)
381f97a28c04ffe Antti Laakso 2026-08-27  463  		val |= IPU7_BUTTRESS_D2D_PWR_EN;
381f97a28c04ffe Antti Laakso 2026-08-27  464  	else
381f97a28c04ffe Antti Laakso 2026-08-27  465  		val &= ~IPU7_BUTTRESS_D2D_PWR_EN;
381f97a28c04ffe Antti Laakso 2026-08-27  466  	writel(val, isp->base + IPU7_BUTTRESS_REG_D2D_CTL);
381f97a28c04ffe Antti Laakso 2026-08-27  467  
381f97a28c04ffe Antti Laakso 2026-08-27  468  	ret = readl_poll_timeout(isp->base + IPU7_BUTTRESS_REG_D2D_CTL, val,
381f97a28c04ffe Antti Laakso 2026-08-27  469  				 (val & IPU7_BUTTRESS_D2D_PWR_ACK) == target,
381f97a28c04ffe Antti Laakso 2026-08-27  470  				 100, BUTTRESS_POWER_TIMEOUT_US);
381f97a28c04ffe Antti Laakso 2026-08-27  471  	if (ret)
381f97a28c04ffe Antti Laakso 2026-08-27  472  		dev_err(&isp->pdev->dev, "D2D power %s timeout: 0x%x\n",
381f97a28c04ffe Antti Laakso 2026-08-27 @473  			on ? "up" : "down", val);
381f97a28c04ffe Antti Laakso 2026-08-27  474  
381f97a28c04ffe Antti Laakso 2026-08-27  475  	return ret;
381f97a28c04ffe Antti Laakso 2026-08-27  476  }
381f97a28c04ffe Antti Laakso 2026-08-27  477  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
