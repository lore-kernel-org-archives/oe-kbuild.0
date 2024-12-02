Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0786F1D958E
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733166605; cv=none; b=uh9g9DucOZAkcds3FfCRqY3ceXLjqexWcZzoEMwRwd+BgWgzeRqn26iFMz1J1VF5Fv6Euz46HqfkVD0VlNlTicEldxI3WXGXEHQ8S3JGmpdyqoX6oyCExcmWHYUEImW8YQqavDecVZhDSb9WVYHAdoHTQ6xDYsbuuyFxWCscNPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733166605; c=relaxed/simple;
	bh=4VFXnMg2QZt86Ha7RF39ZRGHpu3H1yL5UveMDfWg8P8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tAuZTG0OOCq1IZhcZJDbjF/F9389aa7oO3RVBQhRd0I0q9L6AQFgKkvEQy65WN0xsv7/XYwVwhXPlcbfpfB587uLeFGFDPKeDwOQMD3PsFj1Y97pysNm6vxqBpgEOemQVFjIH1sRqemOHgOA06XZSMfP6Zp5/+luMEdKeJdW3i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ox8OcVy1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ox8OcVy1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733166604; x=1764702604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4VFXnMg2QZt86Ha7RF39ZRGHpu3H1yL5UveMDfWg8P8=;
  b=Ox8OcVy17Zx0iecZZAN0OAbgBX1q9YKlJd7nr2Y2zB3ni/GI7kytYULw
   53+ALgO0DcHBNG1kN34N0ahSZCDN+HQ4sALM+ncLT+WC/eJE/YSGM+MZY
   UUfXJ0d6u/tjQw96RWg30piFwCwWqbBi8QgPr6Z+K9GthtaMcnAb+xeNN
   9poKDtDrFswUqeWgeOkC7Zsts3BqwnrpDmlI6dLjp85bB0hrGHuW3ioaT
   oztk6nr+KGVkTfeylBkVyT2+SMBYlIneGwB8QfNxJUYeDddcu5VIpQLZ8
   2OQH0F4lBo7gcWWx1OURi3PZwZJZxYo5z4dB5Hf4ijBcWe4jXGJTwzNmU
   A==;
X-CSE-ConnectionGUID: ZvllWVEfR92npUbIHOM+ZQ==
X-CSE-MsgGUID: xoP9IlpJRXWKPZ2mlKlIog==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44741000"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="44741000"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 11:10:01 -0800
X-CSE-ConnectionGUID: XvnS8ZwsSXCcxrqKHz9Mgw==
X-CSE-MsgGUID: snHQ4B0TS+K9ssG1C/IYxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="98177054"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 02 Dec 2024 11:10:01 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIBny-0002nP-05;
	Mon, 02 Dec 2024 19:09:58 +0000
Date: Tue, 3 Dec 2024 03:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/usb/typec/ucsi/ucsi_ccg.c:637:8-28: WARNING: Threaded IRQ
 with no primary handler requested without IRQF_ONESHOT (unless it is nested
 IRQ)
Message-ID: <202412030218.ufNQUJRw-lkp@intel.com>
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
TO: Sanket Goswami <Sanket.Goswami@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e70140ba0d2b1a30467d4af6bcfe761327b9ec95
commit: 5767f40053ebf599e47d688e65b259d0b6f3227a ucsi_ccg: Do not hardcode interrupt polarity and type
date:   2 years, 6 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 2 years, 6 months ago
config: loongarch-randconfig-r062-20241111 (https://download.01.org/0day-ci/archive/20241203/202412030218.ufNQUJRw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412030218.ufNQUJRw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/usb/typec/ucsi/ucsi_ccg.c:637:8-28: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +637 drivers/usb/typec/ucsi/ucsi_ccg.c

247c554a14aa16 Ajay Gupta     2018-10-26  629  
5767f40053ebf5 Sanket Goswami 2022-05-26  630  static int ccg_request_irq(struct ucsi_ccg *uc)
5767f40053ebf5 Sanket Goswami 2022-05-26  631  {
5767f40053ebf5 Sanket Goswami 2022-05-26  632  	unsigned long flags = IRQF_ONESHOT;
5767f40053ebf5 Sanket Goswami 2022-05-26  633  
5767f40053ebf5 Sanket Goswami 2022-05-26  634  	if (!has_acpi_companion(uc->dev))
5767f40053ebf5 Sanket Goswami 2022-05-26  635  		flags |= IRQF_TRIGGER_HIGH;
5767f40053ebf5 Sanket Goswami 2022-05-26  636  
5767f40053ebf5 Sanket Goswami 2022-05-26 @637  	return request_threaded_irq(uc->irq, NULL, ccg_irq_handler, flags, dev_name(uc->dev), uc);
5767f40053ebf5 Sanket Goswami 2022-05-26  638  }
5767f40053ebf5 Sanket Goswami 2022-05-26  639  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
