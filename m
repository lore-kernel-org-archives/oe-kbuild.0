Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75EB1C687
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Jan 2025 06:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735970827; cv=none; b=Q4NrPCGZ4cGvjkFYhWiveqo4gj0JJldp8V8nZBGYZ9YasL8sA7+ybzpNUxWAwgrBzG1BBtc/eMBNua4q1wLjN3HgLHPK62DP20N7DElA0hAZSVFf9/uZeCkw8xznspXdraaQpKGWIsr2EzFQql13qzokrTaVHOIwtez0XNalUqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735970827; c=relaxed/simple;
	bh=yrKwikA36Xl0BpqgAnAsK4OwcXWbAbnSBYcuUG6B4pI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OKsPUwnvJsFury3Y9zOtsxDIfM5YzFRbTvsTw47Wn6MG1lFkpewW4IHr12qsBfwDmGpmovi+AV589XIk1ABsJ+T7lYHkJmxtP0CkPzbsswhuhsvlZRSv8hN20CFto/N74Aydx8gbwcdQLaQS0fsuPn5Ok08xaYKg/rWviCufaHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhznaSBT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhznaSBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735970826; x=1767506826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yrKwikA36Xl0BpqgAnAsK4OwcXWbAbnSBYcuUG6B4pI=;
  b=RhznaSBTZcRIlo6CLX2wQXd67CDgQJY29iAK+t7z/EiGnLS2O7GVpfzk
   6y21aa61ob/Kd9KRqrZbYtlAMAwrJdWzIBXPGsPaMTr2dBqvERKYdKkyK
   taVsxbHjGS/OEmFy45oQ0dB5+7sO2mgUu3LqVBEvSkFxCG2ySmKOmJals
   JW4gl0D30oOnPwVZgioUCEel31czUEgwizCKO0VsLYguHH5BmbbpY+UER
   I5ss0F7HJAcJN78f0VHq04Z4TXrBnIGvukQkGfFnatFgy7rcddb+Zosfs
   6boOZBfiQT7QKsLeXMcn6JL9lb6oNz/G414wJ0/goMYm3C7dHuOe7thye
   Q==;
X-CSE-ConnectionGUID: 7AV52oMMSeaJ3fslfziRGw==
X-CSE-MsgGUID: RBzAskMhRgae3jcLYYacOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="53620411"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="53620411"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 22:07:06 -0800
X-CSE-ConnectionGUID: 9BL5l2iNQN+TJLpj4bjJ/g==
X-CSE-MsgGUID: Hes/9dAWSH6/UCVeX6ISng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="101818453"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jan 2025 22:07:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTxJO-000Afc-1Y;
	Sat, 04 Jan 2025 06:07:02 +0000
Date: Sat, 4 Jan 2025 14:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/pci/ymfpci/ymfpci_main.c:2054 snd_ymfpci_request_firmware()
 warn: 'chip->controller_microcode' from request_firmware() not released on
 lines: 2053.
Message-ID: <202501041407.Aacdl029-lkp@intel.com>
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
head:   63676eefb7a026d04b51dcb7aaf54f358517a2ec
commit: a4184174be36369c3af8d937e165f28a43ef1e02 alpha: drop pre-EV56 support
date:   8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 months ago
config: alpha-randconfig-r071-20250104 (https://download.01.org/0day-ci/archive/20250104/202501041407.Aacdl029-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501041407.Aacdl029-lkp@intel.com/

New smatch warnings:
sound/pci/ymfpci/ymfpci_main.c:2054 snd_ymfpci_request_firmware() warn: 'chip->controller_microcode' from request_firmware() not released on lines: 2053.
sound/pci/ymfpci/ymfpci_main.c:2054 snd_ymfpci_request_firmware() warn: 'chip->dsp_microcode' from request_firmware() not released on lines: 2037,2053.

Old smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:70 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:70 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

vim +2054 sound/pci/ymfpci/ymfpci_main.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  2021  
102fa9060e114a Clemens Ladisch 2006-10-11  2022  static int snd_ymfpci_request_firmware(struct snd_ymfpci *chip)
102fa9060e114a Clemens Ladisch 2006-10-11  2023  {
102fa9060e114a Clemens Ladisch 2006-10-11  2024  	int err, is_1e;
102fa9060e114a Clemens Ladisch 2006-10-11  2025  	const char *name;
102fa9060e114a Clemens Ladisch 2006-10-11  2026  
102fa9060e114a Clemens Ladisch 2006-10-11  2027  	err = request_firmware(&chip->dsp_microcode, "yamaha/ds1_dsp.fw",
102fa9060e114a Clemens Ladisch 2006-10-11  2028  			       &chip->pci->dev);
102fa9060e114a Clemens Ladisch 2006-10-11  2029  	if (err >= 0) {
b82a82d0a90af7 David Woodhouse 2008-05-29  2030  		if (chip->dsp_microcode->size != YDSXG_DSPLENGTH) {
6436bcf6a4a35a Takashi Iwai    2014-02-26  2031  			dev_err(chip->card->dev,
6436bcf6a4a35a Takashi Iwai    2014-02-26  2032  				"DSP microcode has wrong size\n");
102fa9060e114a Clemens Ladisch 2006-10-11  2033  			err = -EINVAL;
102fa9060e114a Clemens Ladisch 2006-10-11  2034  		}
102fa9060e114a Clemens Ladisch 2006-10-11  2035  	}
b7dd2b349a9fa9 Takashi Iwai    2007-04-26  2036  	if (err < 0)
102fa9060e114a Clemens Ladisch 2006-10-11  2037  		return err;
102fa9060e114a Clemens Ladisch 2006-10-11  2038  	is_1e = chip->device_id == PCI_DEVICE_ID_YAMAHA_724F ||
102fa9060e114a Clemens Ladisch 2006-10-11  2039  		chip->device_id == PCI_DEVICE_ID_YAMAHA_740C ||
102fa9060e114a Clemens Ladisch 2006-10-11  2040  		chip->device_id == PCI_DEVICE_ID_YAMAHA_744 ||
102fa9060e114a Clemens Ladisch 2006-10-11  2041  		chip->device_id == PCI_DEVICE_ID_YAMAHA_754;
102fa9060e114a Clemens Ladisch 2006-10-11  2042  	name = is_1e ? "yamaha/ds1e_ctrl.fw" : "yamaha/ds1_ctrl.fw";
102fa9060e114a Clemens Ladisch 2006-10-11  2043  	err = request_firmware(&chip->controller_microcode, name,
102fa9060e114a Clemens Ladisch 2006-10-11  2044  			       &chip->pci->dev);
102fa9060e114a Clemens Ladisch 2006-10-11  2045  	if (err >= 0) {
b82a82d0a90af7 David Woodhouse 2008-05-29  2046  		if (chip->controller_microcode->size != YDSXG_CTRLLENGTH) {
6436bcf6a4a35a Takashi Iwai    2014-02-26  2047  			dev_err(chip->card->dev,
6436bcf6a4a35a Takashi Iwai    2014-02-26  2048  				"controller microcode has wrong size\n");
102fa9060e114a Clemens Ladisch 2006-10-11  2049  			err = -EINVAL;
102fa9060e114a Clemens Ladisch 2006-10-11  2050  		}
102fa9060e114a Clemens Ladisch 2006-10-11  2051  	}
b7dd2b349a9fa9 Takashi Iwai    2007-04-26  2052  	if (err < 0)
102fa9060e114a Clemens Ladisch 2006-10-11  2053  		return err;
102fa9060e114a Clemens Ladisch 2006-10-11 @2054  	return 0;
102fa9060e114a Clemens Ladisch 2006-10-11  2055  }
7e0af29d6f3964 Clemens Ladisch 2007-05-03  2056  

:::::: The code at line 2054 was first introduced by commit
:::::: 102fa9060e114a53628a6594034b6ecf624dffc6 [ALSA] ymfpci: add request_firmware()

:::::: TO: Clemens Ladisch <clemens@ladisch.de>
:::::: CC: Jaroslav Kysela <perex@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
