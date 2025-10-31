Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D479E2E9EDD
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Oct 2025 07:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761897377; cv=none; b=Z419U2CStCpvjDkcQQOi+mbkm94jyGGC9vQNf2YVBozp+kDsyMgWHgjKY9Q38m1od95dm2ricScWNbXq1bsac64AAaXI/VtbHOdfhjaCpTulDquunNwO1F2tIjv7JWi+yQOCaDF9P9AvgVV80dwtLihcsmg3P0Nh4lnfrNMh2d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761897377; c=relaxed/simple;
	bh=SfamJ6x4HypqliLvyHFjlJY8CEl+oS+iLD8REFKaQcE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r/RAwEF0EOI+Q+vGwC6z6A8Ecgf8IwGZvwx8wJY/MUcH+2q+F2ZrrjGYMXMhAYTd2GXllKoKUY5UBaJZT7Et1O/rtWX2F+oUmqjEvvoYSYx1hCaHwcT7QLao9rSNvqYOoXYW1ccpJ9xDBjkiXyNOKx5R/Qw263WlqIKoBDlR08s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6Tl+eaw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6Tl+eaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761897375; x=1793433375;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SfamJ6x4HypqliLvyHFjlJY8CEl+oS+iLD8REFKaQcE=;
  b=B6Tl+eaw5YmSufYgJEElDPkSkTOkIWpD6X7P8XA/c8Nx9tpRwoA9YUrj
   b6Pdy7xFzI0NZhfblw5gQ5/EnyqsJLJGaXEW1CCc6O7Fcc/GyQyACO5Ha
   /g+e1apk3BJ8ixgdmwYjRM1/wejipG/8+o5YZCuh3pD1QJomnJs7WC7VA
   nnfuOTrJc/Qm1KisSk2wq0n50hRsr1pBuJERgR0JV6fBBtIlY8tqu7f5r
   +fu48bAL2i0gHYFvgxQPngdzeBCQvCCgrDuUepVKYnYjLWQ/5rFcOOxC7
   irIBaGQBALz1NbvXYV58oJdExMOCK2e11c5DNVESiM1gbApie8/xMNuwt
   g==;
X-CSE-ConnectionGUID: l6L3tN27QjquqXDZvWMfHw==
X-CSE-MsgGUID: qrl9YKP9SIiZ/DaaHDwMoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63938373"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="63938373"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 00:56:13 -0700
X-CSE-ConnectionGUID: UUe7s7b6RNq8uT+m1mbSDQ==
X-CSE-MsgGUID: 3RtMwPv+RTGPnKHejeVSPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="217008476"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 31 Oct 2025 00:56:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEjzW-000Msk-04;
	Fri, 31 Oct 2025 07:56:10 +0000
Date: Fri, 31 Oct 2025 15:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/platform/x86/lenovo/ideapad-laptop.c:447:46-51: opportunity
 for str_on_off(value)
Message-ID: <202510311551.xjWbHTrm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mark Pearson <mpearson-lenovo@squebb.ca>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Mark,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d127176862a93c4b3216bda533d2bee170af5e71
commit: 651b57dd40871d4d0d61fb291e7f26e2b8bd69b1 platform/x86: Move Lenovo files into lenovo subdir
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-101-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311551.xjWbHTrm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510311551.xjWbHTrm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/platform/x86/lenovo/ideapad-laptop.c:447:46-51: opportunity for str_on_off(value)
   drivers/platform/x86/lenovo/ideapad-laptop.c:452:44-49: opportunity for str_on_off(value)
   drivers/platform/x86/lenovo/ideapad-laptop.c:454:44-49: opportunity for str_on_off(value)
   drivers/platform/x86/lenovo/ideapad-laptop.c:456:44-49: opportunity for str_on_off(value)
   drivers/platform/x86/lenovo/ideapad-laptop.c:458:44-49: opportunity for str_on_off(value)
   drivers/platform/x86/lenovo/ideapad-laptop.c:463:47-52: opportunity for str_on_off(value)
   drivers/platform/x86/lenovo/ideapad-laptop.c:465:47-52: opportunity for str_on_off(value)

vim +447 drivers/platform/x86/lenovo/ideapad-laptop.c

6c1fa8edfef815 drivers/platform/x86/ideapad-laptop.c Gergo Koteles   2024-07-25  431  
773e3206e6a8b4 drivers/platform/x86/ideapad-laptop.c Ike Panhc       2011-09-06  432  /*
773e3206e6a8b4 drivers/platform/x86/ideapad-laptop.c Ike Panhc       2011-09-06  433   * debugfs
773e3206e6a8b4 drivers/platform/x86/ideapad-laptop.c Ike Panhc       2011-09-06  434   */
773e3206e6a8b4 drivers/platform/x86/ideapad-laptop.c Ike Panhc       2011-09-06  435  static int debugfs_status_show(struct seq_file *s, void *data)
773e3206e6a8b4 drivers/platform/x86/ideapad-laptop.c Ike Panhc       2011-09-06  436  {
331e0ea243ed15 drivers/platform/x86/ideapad-laptop.c Zhang Rui       2013-09-25  437  	struct ideapad_private *priv = s->private;
773e3206e6a8b4 drivers/platform/x86/ideapad-laptop.c Ike Panhc       2011-09-06  438  	unsigned long value;
773e3206e6a8b4 drivers/platform/x86/ideapad-laptop.c Ike Panhc       2011-09-06  439  
7cc06e729460a2 drivers/platform/x86/ideapad-laptop.c Gergo Koteles   2024-07-25  440  	guard(mutex)(&priv->vpc_mutex);
7cc06e729460a2 drivers/platform/x86/ideapad-laptop.c Gergo Koteles   2024-07-25  441  
331e0ea243ed15 drivers/platform/x86/ideapad-laptop.c Zhang Rui       2013-09-25  442  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL_MAX, &value))
7553390d4b7e63 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  443  		seq_printf(s, "Backlight max:  %lu\n", value);
331e0ea243ed15 drivers/platform/x86/ideapad-laptop.c Zhang Rui       2013-09-25  444  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL, &value))
7553390d4b7e63 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  445  		seq_printf(s, "Backlight now:  %lu\n", value);
331e0ea243ed15 drivers/platform/x86/ideapad-laptop.c Zhang Rui       2013-09-25  446  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &value))
7553390d4b7e63 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03 @447  		seq_printf(s, "BL power value: %s (%lu)\n", value ? "on" : "off", value);
65c7713a507927 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  448  
7553390d4b7e63 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  449  	seq_puts(s, "=====================\n");
773e3206e6a8b4 drivers/platform/x86/ideapad-laptop.c Ike Panhc       2011-09-06  450  
331e0ea243ed15 drivers/platform/x86/ideapad-laptop.c Zhang Rui       2013-09-25  451  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_RF, &value))
7553390d4b7e63 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  452  		seq_printf(s, "Radio status: %s (%lu)\n", value ? "on" : "off", value);
331e0ea243ed15 drivers/platform/x86/ideapad-laptop.c Zhang Rui       2013-09-25  453  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_WIFI, &value))
7553390d4b7e63 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  454  		seq_printf(s, "Wifi status:  %s (%lu)\n", value ? "on" : "off", value);
331e0ea243ed15 drivers/platform/x86/ideapad-laptop.c Zhang Rui       2013-09-25  455  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_BT, &value))
7553390d4b7e63 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  456  		seq_printf(s, "BT status:    %s (%lu)\n", value ? "on" : "off", value);
331e0ea243ed15 drivers/platform/x86/ideapad-laptop.c Zhang Rui       2013-09-25  457  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_3G, &value))
7553390d4b7e63 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  458  		seq_printf(s, "3G status:    %s (%lu)\n", value ? "on" : "off", value);
65c7713a507927 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  459  
7553390d4b7e63 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  460  	seq_puts(s, "=====================\n");
773e3206e6a8b4 drivers/platform/x86/ideapad-laptop.c Ike Panhc       2011-09-06  461  
331e0ea243ed15 drivers/platform/x86/ideapad-laptop.c Zhang Rui       2013-09-25  462  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value))
7553390d4b7e63 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  463  		seq_printf(s, "Touchpad status: %s (%lu)\n", value ? "on" : "off", value);
331e0ea243ed15 drivers/platform/x86/ideapad-laptop.c Zhang Rui       2013-09-25  464  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &value))
7553390d4b7e63 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  465  		seq_printf(s, "Camera status:   %s (%lu)\n", value ? "on" : "off", value);
65c7713a507927 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  466  
ade50296186a1c drivers/platform/x86/ideapad-laptop.c Hao Wei Tee     2017-08-15  467  	seq_puts(s, "=====================\n");
ade50296186a1c drivers/platform/x86/ideapad-laptop.c Hao Wei Tee     2017-08-15  468  
7553390d4b7e63 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  469  	if (!eval_gbmd(priv->adev->handle, &value))
7553390d4b7e63 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  470  		seq_printf(s, "GBMD: %#010lx\n", value);
7553390d4b7e63 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  471  	if (!eval_hals(priv->adev->handle, &value))
7553390d4b7e63 drivers/platform/x86/ideapad-laptop.c Barnabás Pőcze  2021-02-03  472  		seq_printf(s, "HALS: %#010lx\n", value);
773e3206e6a8b4 drivers/platform/x86/ideapad-laptop.c Ike Panhc       2011-09-06  473  
773e3206e6a8b4 drivers/platform/x86/ideapad-laptop.c Ike Panhc       2011-09-06  474  	return 0;
773e3206e6a8b4 drivers/platform/x86/ideapad-laptop.c Ike Panhc       2011-09-06  475  }
334c4efd295cda drivers/platform/x86/ideapad-laptop.c Andy Shevchenko 2018-01-22  476  DEFINE_SHOW_ATTRIBUTE(debugfs_status);
773e3206e6a8b4 drivers/platform/x86/ideapad-laptop.c Ike Panhc       2011-09-06  477  

:::::: The code at line 447 was first introduced by commit
:::::: 7553390d4b7e636d9be7913b16f4b9ae8b75df4c platform/x86: ideapad-laptop: change 'status' debugfs file format

:::::: TO: Barnabás Pőcze <pobrn@protonmail.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
