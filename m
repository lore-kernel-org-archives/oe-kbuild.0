Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADA33EA7B
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Dec 2023 17:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PT3/VHN8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702659768; x=1734195768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ha48eyaIxYMnZUrusYYH9GJkpd6nj3O1iM7i4aaUsIw=;
  b=PT3/VHN8W8xTqMmwdybcC4aVhK9D25sOaJJF3eKzOjr73k7oL0QjaOeJ
   g25qigeeo6rHd5ugNxKNaoeQcySaAeU2lKIH37q4s37oJaNWDCyGc3AT4
   MCCj3ZaiUYD9MLcasm2R7e1bWDJr2a6973o81WSArMCLrkoKPxf9sWhh5
   gENhLQQKJ08dRm9wna6zNla2Fa0zbiu+FwI4g4rxaFZm3VEJl8sry902V
   fA+dKWSVCl2Pl9pP3IyOPryQx8hkDFRor0dJGVwZpideyjVUavSh3bphT
   Us3EJ3Xz0kjJBeFh5ilI3GuBq2hcuJ59wPvYp8Hi+9PIrFyBovhEnn6TZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="395042081"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="395042081"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 09:02:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="724510128"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="724510128"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Dec 2023 09:02:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEBaF-0000VM-2y;
	Fri, 15 Dec 2023 17:02:43 +0000
Date: Sat, 16 Dec 2023 01:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/panel/panel-raydium-rm692e5.c:137 rm692e5_on() warn:
 Function too hairy.  No more merges.
Message-ID: <202312160046.NrcAH5wA-lkp@intel.com>
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
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Luca Weiss <luca.weiss@fairphone.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f7168591ebf7bbdb91797d02b1afaf00a4289b1
commit: 988d0ff29ecf7ab750b9be29fddae588156c3d03 drm/panel: Add driver for BOE RM692E5 AMOLED panel
date:   2 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-161-20231214 (https://download.01.org/0day-ci/archive/20231216/202312160046.NrcAH5wA-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312160046.NrcAH5wA-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-raydium-rm692e5.c:137 rm692e5_on() warn: Function too hairy.  No more merges.

vim +137 drivers/gpu/drm/panel/panel-raydium-rm692e5.c

988d0ff29ecf7a Konrad Dybcio 2023-09-29   43  
988d0ff29ecf7a Konrad Dybcio 2023-09-29   44  static int rm692e5_on(struct rm692e5_panel *ctx)
988d0ff29ecf7a Konrad Dybcio 2023-09-29   45  {
988d0ff29ecf7a Konrad Dybcio 2023-09-29   46  	struct mipi_dsi_device *dsi = ctx->dsi;
988d0ff29ecf7a Konrad Dybcio 2023-09-29   47  	struct device *dev = &dsi->dev;
988d0ff29ecf7a Konrad Dybcio 2023-09-29   48  	int ret;
988d0ff29ecf7a Konrad Dybcio 2023-09-29   49  
988d0ff29ecf7a Konrad Dybcio 2023-09-29   50  	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
988d0ff29ecf7a Konrad Dybcio 2023-09-29   51  
988d0ff29ecf7a Konrad Dybcio 2023-09-29   52  	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x41);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   53  	mipi_dsi_generic_write_seq(dsi, 0xd6, 0x00);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   54  	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x16);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   55  	mipi_dsi_generic_write_seq(dsi, 0x8a, 0x87);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   56  	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x71);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   57  	mipi_dsi_generic_write_seq(dsi, 0x82, 0x01);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   58  	mipi_dsi_generic_write_seq(dsi, 0xc6, 0x00);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   59  	mipi_dsi_generic_write_seq(dsi, 0xc7, 0x2c);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   60  	mipi_dsi_generic_write_seq(dsi, 0xc8, 0x64);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   61  	mipi_dsi_generic_write_seq(dsi, 0xc9, 0x3c);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   62  	mipi_dsi_generic_write_seq(dsi, 0xca, 0x80);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   63  	mipi_dsi_generic_write_seq(dsi, 0xcb, 0x02);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   64  	mipi_dsi_generic_write_seq(dsi, 0xcc, 0x02);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   65  	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x38);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   66  	mipi_dsi_generic_write_seq(dsi, 0x18, 0x13);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   67  	mipi_dsi_generic_write_seq(dsi, 0xfe, 0xf4);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   68  	mipi_dsi_generic_write_seq(dsi, 0x00, 0xff);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   69  	mipi_dsi_generic_write_seq(dsi, 0x01, 0xff);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   70  	mipi_dsi_generic_write_seq(dsi, 0x02, 0xcf);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   71  	mipi_dsi_generic_write_seq(dsi, 0x03, 0xbc);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   72  	mipi_dsi_generic_write_seq(dsi, 0x04, 0xb9);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   73  	mipi_dsi_generic_write_seq(dsi, 0x05, 0x99);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   74  	mipi_dsi_generic_write_seq(dsi, 0x06, 0x02);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   75  	mipi_dsi_generic_write_seq(dsi, 0x07, 0x0a);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   76  	mipi_dsi_generic_write_seq(dsi, 0x08, 0xe0);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   77  	mipi_dsi_generic_write_seq(dsi, 0x09, 0x4c);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   78  	mipi_dsi_generic_write_seq(dsi, 0x0a, 0xeb);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   79  	mipi_dsi_generic_write_seq(dsi, 0x0b, 0xe8);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   80  	mipi_dsi_generic_write_seq(dsi, 0x0c, 0x32);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   81  	mipi_dsi_generic_write_seq(dsi, 0x0d, 0x07);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   82  	mipi_dsi_generic_write_seq(dsi, 0xfe, 0xf4);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   83  	mipi_dsi_generic_write_seq(dsi, 0x0d, 0xc0);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   84  	mipi_dsi_generic_write_seq(dsi, 0x0e, 0xff);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   85  	mipi_dsi_generic_write_seq(dsi, 0x0f, 0xff);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   86  	mipi_dsi_generic_write_seq(dsi, 0x10, 0x33);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   87  	mipi_dsi_generic_write_seq(dsi, 0x11, 0x6f);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   88  	mipi_dsi_generic_write_seq(dsi, 0x12, 0x6e);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   89  	mipi_dsi_generic_write_seq(dsi, 0x13, 0xa6);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   90  	mipi_dsi_generic_write_seq(dsi, 0x14, 0x80);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   91  	mipi_dsi_generic_write_seq(dsi, 0x15, 0x02);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   92  	mipi_dsi_generic_write_seq(dsi, 0x16, 0x38);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   93  	mipi_dsi_generic_write_seq(dsi, 0x17, 0xd3);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   94  	mipi_dsi_generic_write_seq(dsi, 0x18, 0x3a);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   95  	mipi_dsi_generic_write_seq(dsi, 0x19, 0xba);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   96  	mipi_dsi_generic_write_seq(dsi, 0x1a, 0xcc);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   97  	mipi_dsi_generic_write_seq(dsi, 0x1b, 0x01);
988d0ff29ecf7a Konrad Dybcio 2023-09-29   98  
988d0ff29ecf7a Konrad Dybcio 2023-09-29   99  	ret = mipi_dsi_dcs_nop(dsi);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  100  	if (ret < 0) {
988d0ff29ecf7a Konrad Dybcio 2023-09-29  101  		dev_err(dev, "Failed to nop: %d\n", ret);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  102  		return ret;
988d0ff29ecf7a Konrad Dybcio 2023-09-29  103  	}
988d0ff29ecf7a Konrad Dybcio 2023-09-29  104  	msleep(32);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  105  
988d0ff29ecf7a Konrad Dybcio 2023-09-29  106  	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x38);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  107  	mipi_dsi_generic_write_seq(dsi, 0x18, 0x13);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  108  	mipi_dsi_generic_write_seq(dsi, 0xfe, 0xd1);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  109  	mipi_dsi_generic_write_seq(dsi, 0xd3, 0x00);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  110  	mipi_dsi_generic_write_seq(dsi, 0xd0, 0x00);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  111  	mipi_dsi_generic_write_seq(dsi, 0xd2, 0x00);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  112  	mipi_dsi_generic_write_seq(dsi, 0xd4, 0x00);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  113  	mipi_dsi_generic_write_seq(dsi, 0xb4, 0x01);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  114  	mipi_dsi_generic_write_seq(dsi, 0xfe, 0xf9);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  115  	mipi_dsi_generic_write_seq(dsi, 0x00, 0xaf);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  116  	mipi_dsi_generic_write_seq(dsi, 0x1d, 0x37);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  117  	mipi_dsi_generic_write_seq(dsi, 0x44, 0x0a, 0x7b);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  118  	mipi_dsi_generic_write_seq(dsi, 0xfe, 0x00);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  119  	mipi_dsi_generic_write_seq(dsi, 0xfa, 0x01);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  120  	mipi_dsi_generic_write_seq(dsi, 0xc2, 0x08);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  121  	mipi_dsi_generic_write_seq(dsi, 0x35, 0x00);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  122  	mipi_dsi_generic_write_seq(dsi, 0x51, 0x05, 0x42);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  123  
988d0ff29ecf7a Konrad Dybcio 2023-09-29  124  	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  125  	if (ret < 0) {
988d0ff29ecf7a Konrad Dybcio 2023-09-29  126  		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  127  		return ret;
988d0ff29ecf7a Konrad Dybcio 2023-09-29  128  	}
988d0ff29ecf7a Konrad Dybcio 2023-09-29  129  	msleep(100);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  130  
988d0ff29ecf7a Konrad Dybcio 2023-09-29  131  	ret = mipi_dsi_dcs_set_display_on(dsi);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  132  	if (ret < 0) {
988d0ff29ecf7a Konrad Dybcio 2023-09-29  133  		dev_err(dev, "Failed to set display on: %d\n", ret);
988d0ff29ecf7a Konrad Dybcio 2023-09-29  134  		return ret;
988d0ff29ecf7a Konrad Dybcio 2023-09-29  135  	}
988d0ff29ecf7a Konrad Dybcio 2023-09-29  136  
988d0ff29ecf7a Konrad Dybcio 2023-09-29 @137  	return 0;
988d0ff29ecf7a Konrad Dybcio 2023-09-29  138  }
988d0ff29ecf7a Konrad Dybcio 2023-09-29  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
