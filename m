Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A40848C
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Jul 2023 23:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689464531; x=1721000531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=St4INjvDMmlawMucMVbxnudFGVlJYcnuCp4tRyvaS1s=;
  b=ksOT3Avlkt+v+cDGNnVDa0+buzkTSnfUxxXqlo5KYg4aJoB0nYi80y1x
   w0KQpYD4veBeaHct2gWNh0mOWMZItPFZuJaDf1WYfoENCgi31ZlHWNLgv
   It6aFMru07Dpgy6EA5YtwSchOXQYuYfvsAPDjfcflrSAaEvyBPpFVIRSl
   FP0HOiYSX78eh65v1zHvCSoumkGfWl6WGTpdKdgp3h4hZn/wzGYpE9dm0
   18+ns82Vbx3zQARckhGAH3Luh6heiAoMYQi1MAsfC4SD2S4Vn6kqj8dSw
   /GRJ8TqYTaOcV6WoOATJP3d6X/wSHUshDjQCRv6rN+WhGRVyfWf/z/Bdv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="365754313"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="365754313"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 16:42:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="846851009"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="846851009"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Jul 2023 16:42:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKotr-0008Pr-1H;
	Sat, 15 Jul 2023 23:42:07 +0000
Date: Sun, 16 Jul 2023 07:41:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/panel/panel-novatek-nt36523.c:578
 j606f_boe_init_sequence() warn: Function too hairy.  No more merges.
Message-ID: <202307160704.MxqrE20f-lkp@intel.com>
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
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Jianhua Lu <lujianhua000@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   831fe284d8275987596b7d640518dddba5735f61
commit: 4f048de28b90abefff2044f450e882576eb746e9 drm/panel: nt36523: Add Lenovo J606F panel
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-m001-20230716 (https://download.01.org/0day-ci/archive/20230716/202307160704.MxqrE20f-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160704.MxqrE20f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307160704.MxqrE20f-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/panel/panel-novatek-nt36523.c:578 j606f_boe_init_sequence() warn: Function too hairy.  No more merges.

Old smatch warnings:
drivers/gpu/drm/panel/panel-novatek-nt36523.c:104 elish_boe_init_sequence() warn: Function too hairy.  No more merges.
drivers/gpu/drm/panel/panel-novatek-nt36523.c:324 elish_csot_init_sequence() warn: Function too hairy.  No more merges.

vim +578 drivers/gpu/drm/panel/panel-novatek-nt36523.c

0993234a00451e Jianhua Lu    2023-03-13  485  
4f048de28b90ab Konrad Dybcio 2023-04-17  486  static int j606f_boe_init_sequence(struct panel_info *pinfo)
4f048de28b90ab Konrad Dybcio 2023-04-17  487  {
4f048de28b90ab Konrad Dybcio 2023-04-17  488  	struct mipi_dsi_device *dsi = pinfo->dsi[0];
4f048de28b90ab Konrad Dybcio 2023-04-17  489  	struct device *dev = &dsi->dev;
4f048de28b90ab Konrad Dybcio 2023-04-17  490  	int ret;
4f048de28b90ab Konrad Dybcio 2023-04-17  491  
4f048de28b90ab Konrad Dybcio 2023-04-17  492  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x20);
4f048de28b90ab Konrad Dybcio 2023-04-17  493  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  494  	mipi_dsi_dcs_write_seq(dsi, 0x05, 0xd9);
4f048de28b90ab Konrad Dybcio 2023-04-17  495  	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x78);
4f048de28b90ab Konrad Dybcio 2023-04-17  496  	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x5a);
4f048de28b90ab Konrad Dybcio 2023-04-17  497  	mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x63);
4f048de28b90ab Konrad Dybcio 2023-04-17  498  	mipi_dsi_dcs_write_seq(dsi, 0x0e, 0x91);
4f048de28b90ab Konrad Dybcio 2023-04-17  499  	mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x73);
4f048de28b90ab Konrad Dybcio 2023-04-17  500  	mipi_dsi_dcs_write_seq(dsi, 0x95, 0xeb);
4f048de28b90ab Konrad Dybcio 2023-04-17  501  	mipi_dsi_dcs_write_seq(dsi, 0x96, 0xeb);
4f048de28b90ab Konrad Dybcio 2023-04-17  502  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x11);
4f048de28b90ab Konrad Dybcio 2023-04-17  503  	mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x66);
4f048de28b90ab Konrad Dybcio 2023-04-17  504  	mipi_dsi_dcs_write_seq(dsi, 0x75, 0xa2);
4f048de28b90ab Konrad Dybcio 2023-04-17  505  	mipi_dsi_dcs_write_seq(dsi, 0x77, 0xb3);
4f048de28b90ab Konrad Dybcio 2023-04-17  506  	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d, 0x00,
4f048de28b90ab Konrad Dybcio 2023-04-17  507  			       0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
4f048de28b90ab Konrad Dybcio 2023-04-17  508  	mipi_dsi_dcs_write_seq(dsi, 0xb1, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e, 0x01,
4f048de28b90ab Konrad Dybcio 2023-04-17  509  			       0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
4f048de28b90ab Konrad Dybcio 2023-04-17  510  	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08, 0x03,
4f048de28b90ab Konrad Dybcio 2023-04-17  511  			       0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
4f048de28b90ab Konrad Dybcio 2023-04-17  512  	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7, 0x03,
4f048de28b90ab Konrad Dybcio 2023-04-17  513  			       0xfd, 0x03, 0xff);
4f048de28b90ab Konrad Dybcio 2023-04-17  514  	mipi_dsi_dcs_write_seq(dsi, 0xb4, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d, 0x00,
4f048de28b90ab Konrad Dybcio 2023-04-17  515  			       0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
4f048de28b90ab Konrad Dybcio 2023-04-17  516  	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e, 0x01,
4f048de28b90ab Konrad Dybcio 2023-04-17  517  			       0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
4f048de28b90ab Konrad Dybcio 2023-04-17  518  	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08, 0x03,
4f048de28b90ab Konrad Dybcio 2023-04-17  519  			       0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
4f048de28b90ab Konrad Dybcio 2023-04-17  520  	mipi_dsi_dcs_write_seq(dsi, 0xb7, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7, 0x03,
4f048de28b90ab Konrad Dybcio 2023-04-17  521  			       0xfd, 0x03, 0xff);
4f048de28b90ab Konrad Dybcio 2023-04-17  522  	mipi_dsi_dcs_write_seq(dsi, 0xb8, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d, 0x00,
4f048de28b90ab Konrad Dybcio 2023-04-17  523  			       0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
4f048de28b90ab Konrad Dybcio 2023-04-17  524  	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e, 0x01,
4f048de28b90ab Konrad Dybcio 2023-04-17  525  			       0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
4f048de28b90ab Konrad Dybcio 2023-04-17  526  	mipi_dsi_dcs_write_seq(dsi, 0xba, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08, 0x03,
4f048de28b90ab Konrad Dybcio 2023-04-17  527  			       0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
4f048de28b90ab Konrad Dybcio 2023-04-17  528  	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7, 0x03,
4f048de28b90ab Konrad Dybcio 2023-04-17  529  			       0xfd, 0x03, 0xff);
4f048de28b90ab Konrad Dybcio 2023-04-17  530  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x21);
4f048de28b90ab Konrad Dybcio 2023-04-17  531  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  532  	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65, 0x00,
4f048de28b90ab Konrad Dybcio 2023-04-17  533  			       0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
4f048de28b90ab Konrad Dybcio 2023-04-17  534  	mipi_dsi_dcs_write_seq(dsi, 0xb1, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76, 0x01,
4f048de28b90ab Konrad Dybcio 2023-04-17  535  			       0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
4f048de28b90ab Konrad Dybcio 2023-04-17  536  	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00, 0x03,
4f048de28b90ab Konrad Dybcio 2023-04-17  537  			       0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
4f048de28b90ab Konrad Dybcio 2023-04-17  538  	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf, 0x03,
4f048de28b90ab Konrad Dybcio 2023-04-17  539  			       0xf5, 0x03, 0xf7);
4f048de28b90ab Konrad Dybcio 2023-04-17  540  	mipi_dsi_dcs_write_seq(dsi, 0xb4, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65, 0x00,
4f048de28b90ab Konrad Dybcio 2023-04-17  541  			       0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
4f048de28b90ab Konrad Dybcio 2023-04-17  542  	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76, 0x01,
4f048de28b90ab Konrad Dybcio 2023-04-17  543  			       0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
4f048de28b90ab Konrad Dybcio 2023-04-17  544  	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00, 0x03,
4f048de28b90ab Konrad Dybcio 2023-04-17  545  			       0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
4f048de28b90ab Konrad Dybcio 2023-04-17  546  	mipi_dsi_dcs_write_seq(dsi, 0xb7, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf, 0x03,
4f048de28b90ab Konrad Dybcio 2023-04-17  547  			       0xf5, 0x03, 0xf7);
4f048de28b90ab Konrad Dybcio 2023-04-17  548  	mipi_dsi_dcs_write_seq(dsi, 0xb8, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65, 0x00,
4f048de28b90ab Konrad Dybcio 2023-04-17  549  			       0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
4f048de28b90ab Konrad Dybcio 2023-04-17  550  	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76, 0x01,
4f048de28b90ab Konrad Dybcio 2023-04-17  551  			       0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
4f048de28b90ab Konrad Dybcio 2023-04-17  552  	mipi_dsi_dcs_write_seq(dsi, 0xba, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00, 0x03,
4f048de28b90ab Konrad Dybcio 2023-04-17  553  			       0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
4f048de28b90ab Konrad Dybcio 2023-04-17  554  	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf, 0x03,
4f048de28b90ab Konrad Dybcio 2023-04-17  555  			       0xf5, 0x03, 0xf7);
4f048de28b90ab Konrad Dybcio 2023-04-17  556  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x23);
4f048de28b90ab Konrad Dybcio 2023-04-17  557  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  558  	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x80);
4f048de28b90ab Konrad Dybcio 2023-04-17  559  	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  560  	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  561  	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x77);
4f048de28b90ab Konrad Dybcio 2023-04-17  562  	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x07);
4f048de28b90ab Konrad Dybcio 2023-04-17  563  	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x07);
4f048de28b90ab Konrad Dybcio 2023-04-17  564  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x24);
4f048de28b90ab Konrad Dybcio 2023-04-17  565  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  566  	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  567  	mipi_dsi_dcs_write_seq(dsi, 0x01, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  568  	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x1c);
4f048de28b90ab Konrad Dybcio 2023-04-17  569  	mipi_dsi_dcs_write_seq(dsi, 0x03, 0x1c);
4f048de28b90ab Konrad Dybcio 2023-04-17  570  	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x1d);
4f048de28b90ab Konrad Dybcio 2023-04-17  571  	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x1d);
4f048de28b90ab Konrad Dybcio 2023-04-17  572  	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x04);
4f048de28b90ab Konrad Dybcio 2023-04-17  573  	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x04);
4f048de28b90ab Konrad Dybcio 2023-04-17  574  	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x0f);
4f048de28b90ab Konrad Dybcio 2023-04-17  575  	mipi_dsi_dcs_write_seq(dsi, 0x09, 0x0f);
4f048de28b90ab Konrad Dybcio 2023-04-17  576  	mipi_dsi_dcs_write_seq(dsi, 0x0a, 0x0e);
4f048de28b90ab Konrad Dybcio 2023-04-17  577  	mipi_dsi_dcs_write_seq(dsi, 0x0b, 0x0e);
4f048de28b90ab Konrad Dybcio 2023-04-17 @578  	mipi_dsi_dcs_write_seq(dsi, 0x0c, 0x0d);
4f048de28b90ab Konrad Dybcio 2023-04-17  579  	mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x0d);
4f048de28b90ab Konrad Dybcio 2023-04-17  580  	mipi_dsi_dcs_write_seq(dsi, 0x0e, 0x0c);
4f048de28b90ab Konrad Dybcio 2023-04-17  581  	mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x0c);
4f048de28b90ab Konrad Dybcio 2023-04-17  582  	mipi_dsi_dcs_write_seq(dsi, 0x10, 0x08);
4f048de28b90ab Konrad Dybcio 2023-04-17  583  	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x08);
4f048de28b90ab Konrad Dybcio 2023-04-17  584  	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  585  	mipi_dsi_dcs_write_seq(dsi, 0x13, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  586  	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  587  	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  588  	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  589  	mipi_dsi_dcs_write_seq(dsi, 0x17, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  590  	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x1c);
4f048de28b90ab Konrad Dybcio 2023-04-17  591  	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x1c);
4f048de28b90ab Konrad Dybcio 2023-04-17  592  	mipi_dsi_dcs_write_seq(dsi, 0x1a, 0x1d);
4f048de28b90ab Konrad Dybcio 2023-04-17  593  	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x1d);
4f048de28b90ab Konrad Dybcio 2023-04-17  594  	mipi_dsi_dcs_write_seq(dsi, 0x1c, 0x04);
4f048de28b90ab Konrad Dybcio 2023-04-17  595  	mipi_dsi_dcs_write_seq(dsi, 0x1d, 0x04);
4f048de28b90ab Konrad Dybcio 2023-04-17  596  	mipi_dsi_dcs_write_seq(dsi, 0x1e, 0x0f);
4f048de28b90ab Konrad Dybcio 2023-04-17  597  	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0x0f);
4f048de28b90ab Konrad Dybcio 2023-04-17  598  	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x0e);
4f048de28b90ab Konrad Dybcio 2023-04-17  599  	mipi_dsi_dcs_write_seq(dsi, 0x21, 0x0e);
4f048de28b90ab Konrad Dybcio 2023-04-17  600  	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x0d);
4f048de28b90ab Konrad Dybcio 2023-04-17  601  	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x0d);
4f048de28b90ab Konrad Dybcio 2023-04-17  602  	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x0c);
4f048de28b90ab Konrad Dybcio 2023-04-17  603  	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x0c);
4f048de28b90ab Konrad Dybcio 2023-04-17  604  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0x08);
4f048de28b90ab Konrad Dybcio 2023-04-17  605  	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x08);
4f048de28b90ab Konrad Dybcio 2023-04-17  606  	mipi_dsi_dcs_write_seq(dsi, 0x28, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  607  	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  608  	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  609  	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  610  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_LUT, 0x20);
4f048de28b90ab Konrad Dybcio 2023-04-17  611  	mipi_dsi_dcs_write_seq(dsi, 0x2f, 0x0a);
4f048de28b90ab Konrad Dybcio 2023-04-17  612  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x44);
4f048de28b90ab Konrad Dybcio 2023-04-17  613  	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x0c);
4f048de28b90ab Konrad Dybcio 2023-04-17  614  	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x32);
4f048de28b90ab Konrad Dybcio 2023-04-17  615  	mipi_dsi_dcs_write_seq(dsi, 0x37, 0x44);
4f048de28b90ab Konrad Dybcio 2023-04-17  616  	mipi_dsi_dcs_write_seq(dsi, 0x38, 0x40);
4f048de28b90ab Konrad Dybcio 2023-04-17  617  	mipi_dsi_dcs_write_seq(dsi, 0x39, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  618  
4f048de28b90ab Konrad Dybcio 2023-04-17  619  	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x9a);
4f048de28b90ab Konrad Dybcio 2023-04-17  620  	if (ret < 0) {
4f048de28b90ab Konrad Dybcio 2023-04-17  621  		dev_err(dev, "Failed to set pixel format: %d\n", ret);
4f048de28b90ab Konrad Dybcio 2023-04-17  622  		return ret;
4f048de28b90ab Konrad Dybcio 2023-04-17  623  	}
4f048de28b90ab Konrad Dybcio 2023-04-17  624  
4f048de28b90ab Konrad Dybcio 2023-04-17  625  	mipi_dsi_dcs_write_seq(dsi, 0x3b, 0xa0);
4f048de28b90ab Konrad Dybcio 2023-04-17  626  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x42);
4f048de28b90ab Konrad Dybcio 2023-04-17  627  	mipi_dsi_dcs_write_seq(dsi, 0x3f, 0x06);
4f048de28b90ab Konrad Dybcio 2023-04-17  628  	mipi_dsi_dcs_write_seq(dsi, 0x43, 0x06);
4f048de28b90ab Konrad Dybcio 2023-04-17  629  	mipi_dsi_dcs_write_seq(dsi, 0x47, 0x66);
4f048de28b90ab Konrad Dybcio 2023-04-17  630  	mipi_dsi_dcs_write_seq(dsi, 0x4a, 0x9a);
4f048de28b90ab Konrad Dybcio 2023-04-17  631  	mipi_dsi_dcs_write_seq(dsi, 0x4b, 0xa0);
4f048de28b90ab Konrad Dybcio 2023-04-17  632  	mipi_dsi_dcs_write_seq(dsi, 0x4c, 0x91);
4f048de28b90ab Konrad Dybcio 2023-04-17  633  	mipi_dsi_dcs_write_seq(dsi, 0x4d, 0x21);
4f048de28b90ab Konrad Dybcio 2023-04-17  634  	mipi_dsi_dcs_write_seq(dsi, 0x4e, 0x43);
4f048de28b90ab Konrad Dybcio 2023-04-17  635  
4f048de28b90ab Konrad Dybcio 2023-04-17  636  	ret = mipi_dsi_dcs_set_display_brightness(dsi, 18);
4f048de28b90ab Konrad Dybcio 2023-04-17  637  	if (ret < 0) {
4f048de28b90ab Konrad Dybcio 2023-04-17  638  		dev_err(dev, "Failed to set display brightness: %d\n", ret);
4f048de28b90ab Konrad Dybcio 2023-04-17  639  		return ret;
4f048de28b90ab Konrad Dybcio 2023-04-17  640  	}
4f048de28b90ab Konrad Dybcio 2023-04-17  641  
4f048de28b90ab Konrad Dybcio 2023-04-17  642  	mipi_dsi_dcs_write_seq(dsi, 0x52, 0x34);
4f048de28b90ab Konrad Dybcio 2023-04-17  643  	mipi_dsi_dcs_write_seq(dsi, 0x55, 0x82, 0x02);
4f048de28b90ab Konrad Dybcio 2023-04-17  644  	mipi_dsi_dcs_write_seq(dsi, 0x56, 0x04);
4f048de28b90ab Konrad Dybcio 2023-04-17  645  	mipi_dsi_dcs_write_seq(dsi, 0x58, 0x21);
4f048de28b90ab Konrad Dybcio 2023-04-17  646  	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x30);
4f048de28b90ab Konrad Dybcio 2023-04-17  647  	mipi_dsi_dcs_write_seq(dsi, 0x5a, 0xba);
4f048de28b90ab Konrad Dybcio 2023-04-17  648  	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0xa0);
4f048de28b90ab Konrad Dybcio 2023-04-17  649  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00, 0x06);
4f048de28b90ab Konrad Dybcio 2023-04-17  650  	mipi_dsi_dcs_write_seq(dsi, 0x5f, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  651  	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x82);
4f048de28b90ab Konrad Dybcio 2023-04-17  652  	mipi_dsi_dcs_write_seq(dsi, 0x7e, 0x20);
4f048de28b90ab Konrad Dybcio 2023-04-17  653  	mipi_dsi_dcs_write_seq(dsi, 0x7f, 0x3c);
4f048de28b90ab Konrad Dybcio 2023-04-17  654  	mipi_dsi_dcs_write_seq(dsi, 0x82, 0x04);
4f048de28b90ab Konrad Dybcio 2023-04-17  655  	mipi_dsi_dcs_write_seq(dsi, 0x97, 0xc0);
4f048de28b90ab Konrad Dybcio 2023-04-17  656  	mipi_dsi_dcs_write_seq(dsi, 0xb6,
4f048de28b90ab Konrad Dybcio 2023-04-17  657  			       0x05, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05,
4f048de28b90ab Konrad Dybcio 2023-04-17  658  			       0x05, 0x00, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  659  	mipi_dsi_dcs_write_seq(dsi, 0x92, 0xc4);
4f048de28b90ab Konrad Dybcio 2023-04-17  660  	mipi_dsi_dcs_write_seq(dsi, 0x93, 0x1a);
4f048de28b90ab Konrad Dybcio 2023-04-17  661  	mipi_dsi_dcs_write_seq(dsi, 0x94, 0x5f);
4f048de28b90ab Konrad Dybcio 2023-04-17  662  	mipi_dsi_dcs_write_seq(dsi, 0xd7, 0x55);
4f048de28b90ab Konrad Dybcio 2023-04-17  663  	mipi_dsi_dcs_write_seq(dsi, 0xda, 0x0a);
4f048de28b90ab Konrad Dybcio 2023-04-17  664  	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x08);
4f048de28b90ab Konrad Dybcio 2023-04-17  665  	mipi_dsi_dcs_write_seq(dsi, 0xdb, 0x05);
4f048de28b90ab Konrad Dybcio 2023-04-17  666  	mipi_dsi_dcs_write_seq(dsi, 0xdc, 0xc4);
4f048de28b90ab Konrad Dybcio 2023-04-17  667  	mipi_dsi_dcs_write_seq(dsi, 0xdd, 0x22);
4f048de28b90ab Konrad Dybcio 2023-04-17  668  	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x05);
4f048de28b90ab Konrad Dybcio 2023-04-17  669  	mipi_dsi_dcs_write_seq(dsi, 0xe0, 0xc4);
4f048de28b90ab Konrad Dybcio 2023-04-17  670  	mipi_dsi_dcs_write_seq(dsi, 0xe1, 0x05);
4f048de28b90ab Konrad Dybcio 2023-04-17  671  	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0xc4);
4f048de28b90ab Konrad Dybcio 2023-04-17  672  	mipi_dsi_dcs_write_seq(dsi, 0xe3, 0x05);
4f048de28b90ab Konrad Dybcio 2023-04-17  673  	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0xc4);
4f048de28b90ab Konrad Dybcio 2023-04-17  674  	mipi_dsi_dcs_write_seq(dsi, 0xe5, 0x05);
4f048de28b90ab Konrad Dybcio 2023-04-17  675  	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0xc4);
4f048de28b90ab Konrad Dybcio 2023-04-17  676  	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x88);
4f048de28b90ab Konrad Dybcio 2023-04-17  677  	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x08);
4f048de28b90ab Konrad Dybcio 2023-04-17  678  	mipi_dsi_dcs_write_seq(dsi, 0x8d, 0x88);
4f048de28b90ab Konrad Dybcio 2023-04-17  679  	mipi_dsi_dcs_write_seq(dsi, 0x8e, 0x08);
4f048de28b90ab Konrad Dybcio 2023-04-17  680  	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x90);
4f048de28b90ab Konrad Dybcio 2023-04-17  681  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x25);
4f048de28b90ab Konrad Dybcio 2023-04-17  682  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  683  	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  684  	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x07);
4f048de28b90ab Konrad Dybcio 2023-04-17  685  	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0xba);
4f048de28b90ab Konrad Dybcio 2023-04-17  686  	mipi_dsi_dcs_write_seq(dsi, 0x20, 0xa0);
4f048de28b90ab Konrad Dybcio 2023-04-17  687  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0xba);
4f048de28b90ab Konrad Dybcio 2023-04-17  688  	mipi_dsi_dcs_write_seq(dsi, 0x27, 0xa0);
4f048de28b90ab Konrad Dybcio 2023-04-17  689  	mipi_dsi_dcs_write_seq(dsi, 0x33, 0xba);
4f048de28b90ab Konrad Dybcio 2023-04-17  690  	mipi_dsi_dcs_write_seq(dsi, 0x34, 0xa0);
4f048de28b90ab Konrad Dybcio 2023-04-17  691  	mipi_dsi_dcs_write_seq(dsi, 0x3f, 0xe0);
4f048de28b90ab Konrad Dybcio 2023-04-17  692  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_VSYNC_TIMING, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  693  	mipi_dsi_dcs_write_seq(dsi, 0x44, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  694  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_GET_SCANLINE, 0x40);
4f048de28b90ab Konrad Dybcio 2023-04-17  695  	mipi_dsi_dcs_write_seq(dsi, 0x48, 0xba);
4f048de28b90ab Konrad Dybcio 2023-04-17  696  	mipi_dsi_dcs_write_seq(dsi, 0x49, 0xa0);
4f048de28b90ab Konrad Dybcio 2023-04-17  697  	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  698  	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  699  	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  700  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0xd0);
4f048de28b90ab Konrad Dybcio 2023-04-17  701  	mipi_dsi_dcs_write_seq(dsi, 0x61, 0xba);
4f048de28b90ab Konrad Dybcio 2023-04-17  702  	mipi_dsi_dcs_write_seq(dsi, 0x62, 0xa0);
4f048de28b90ab Konrad Dybcio 2023-04-17  703  	mipi_dsi_dcs_write_seq(dsi, 0xf1, 0x10);
4f048de28b90ab Konrad Dybcio 2023-04-17  704  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2a);
4f048de28b90ab Konrad Dybcio 2023-04-17  705  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  706  	mipi_dsi_dcs_write_seq(dsi, 0x64, 0x16);
4f048de28b90ab Konrad Dybcio 2023-04-17  707  	mipi_dsi_dcs_write_seq(dsi, 0x67, 0x16);
4f048de28b90ab Konrad Dybcio 2023-04-17  708  	mipi_dsi_dcs_write_seq(dsi, 0x6a, 0x16);
4f048de28b90ab Konrad Dybcio 2023-04-17  709  	mipi_dsi_dcs_write_seq(dsi, 0x70, 0x30);
4f048de28b90ab Konrad Dybcio 2023-04-17  710  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_READ_PPS_START, 0xf3);
4f048de28b90ab Konrad Dybcio 2023-04-17  711  	mipi_dsi_dcs_write_seq(dsi, 0xa3, 0xff);
4f048de28b90ab Konrad Dybcio 2023-04-17  712  	mipi_dsi_dcs_write_seq(dsi, 0xa4, 0xff);
4f048de28b90ab Konrad Dybcio 2023-04-17  713  	mipi_dsi_dcs_write_seq(dsi, 0xa5, 0xff);
4f048de28b90ab Konrad Dybcio 2023-04-17  714  	mipi_dsi_dcs_write_seq(dsi, 0xd6, 0x08);
4f048de28b90ab Konrad Dybcio 2023-04-17  715  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x26);
4f048de28b90ab Konrad Dybcio 2023-04-17  716  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  717  	mipi_dsi_dcs_write_seq(dsi, 0x00, 0xa1);
4f048de28b90ab Konrad Dybcio 2023-04-17  718  	mipi_dsi_dcs_write_seq(dsi, 0x0a, 0xf2);
4f048de28b90ab Konrad Dybcio 2023-04-17  719  	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x28);
4f048de28b90ab Konrad Dybcio 2023-04-17  720  	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x30);
4f048de28b90ab Konrad Dybcio 2023-04-17  721  	mipi_dsi_dcs_write_seq(dsi, 0x0c, 0x13);
4f048de28b90ab Konrad Dybcio 2023-04-17  722  	mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x0a);
4f048de28b90ab Konrad Dybcio 2023-04-17  723  	mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x0a);
4f048de28b90ab Konrad Dybcio 2023-04-17  724  	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  725  	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x50);
4f048de28b90ab Konrad Dybcio 2023-04-17  726  	mipi_dsi_dcs_write_seq(dsi, 0x13, 0x51);
4f048de28b90ab Konrad Dybcio 2023-04-17  727  	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x65);
4f048de28b90ab Konrad Dybcio 2023-04-17  728  	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  729  	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x10);
4f048de28b90ab Konrad Dybcio 2023-04-17  730  	mipi_dsi_dcs_write_seq(dsi, 0x17, 0xa0);
4f048de28b90ab Konrad Dybcio 2023-04-17  731  	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x86);
4f048de28b90ab Konrad Dybcio 2023-04-17  732  	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x11);
4f048de28b90ab Konrad Dybcio 2023-04-17  733  	mipi_dsi_dcs_write_seq(dsi, 0x1a, 0x7b);
4f048de28b90ab Konrad Dybcio 2023-04-17  734  	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x10);
4f048de28b90ab Konrad Dybcio 2023-04-17  735  	mipi_dsi_dcs_write_seq(dsi, 0x1c, 0xbb);
4f048de28b90ab Konrad Dybcio 2023-04-17  736  	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  737  	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  738  	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x11);
4f048de28b90ab Konrad Dybcio 2023-04-17  739  	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x7b);
4f048de28b90ab Konrad Dybcio 2023-04-17  740  	mipi_dsi_dcs_write_seq(dsi, 0x1d, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  741  	mipi_dsi_dcs_write_seq(dsi, 0x1e, 0xc3);
4f048de28b90ab Konrad Dybcio 2023-04-17  742  	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0xc3);
4f048de28b90ab Konrad Dybcio 2023-04-17  743  	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  744  	mipi_dsi_dcs_write_seq(dsi, 0x25, 0xc3);
4f048de28b90ab Konrad Dybcio 2023-04-17  745  	mipi_dsi_dcs_write_seq(dsi, 0x2f, 0x05);
4f048de28b90ab Konrad Dybcio 2023-04-17  746  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0xc3);
4f048de28b90ab Konrad Dybcio 2023-04-17  747  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_COLUMNS, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  748  	mipi_dsi_dcs_write_seq(dsi, 0x32, 0xc3);
4f048de28b90ab Konrad Dybcio 2023-04-17  749  	mipi_dsi_dcs_write_seq(dsi, 0x39, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  750  
4f048de28b90ab Konrad Dybcio 2023-04-17  751  	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0xc3);
4f048de28b90ab Konrad Dybcio 2023-04-17  752  	if (ret < 0) {
4f048de28b90ab Konrad Dybcio 2023-04-17  753  		dev_err(dev, "Failed to set pixel format: %d\n", ret);
4f048de28b90ab Konrad Dybcio 2023-04-17  754  		return ret;
4f048de28b90ab Konrad Dybcio 2023-04-17  755  	}
4f048de28b90ab Konrad Dybcio 2023-04-17  756  
4f048de28b90ab Konrad Dybcio 2023-04-17  757  	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  758  	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x11);
4f048de28b90ab Konrad Dybcio 2023-04-17  759  	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x78);
4f048de28b90ab Konrad Dybcio 2023-04-17  760  	mipi_dsi_dcs_write_seq(dsi, 0x35, 0x16);
4f048de28b90ab Konrad Dybcio 2023-04-17  761  	mipi_dsi_dcs_write_seq(dsi, 0xc8, 0x04);
4f048de28b90ab Konrad Dybcio 2023-04-17  762  	mipi_dsi_dcs_write_seq(dsi, 0xc9, 0x82);
4f048de28b90ab Konrad Dybcio 2023-04-17  763  	mipi_dsi_dcs_write_seq(dsi, 0xca, 0x4e);
4f048de28b90ab Konrad Dybcio 2023-04-17  764  	mipi_dsi_dcs_write_seq(dsi, 0xcb, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  765  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_READ_PPS_CONTINUE, 0x4c);
4f048de28b90ab Konrad Dybcio 2023-04-17  766  	mipi_dsi_dcs_write_seq(dsi, 0xaa, 0x47);
4f048de28b90ab Konrad Dybcio 2023-04-17  767  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x27);
4f048de28b90ab Konrad Dybcio 2023-04-17  768  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  769  	mipi_dsi_dcs_write_seq(dsi, 0x56, 0x06);
4f048de28b90ab Konrad Dybcio 2023-04-17  770  	mipi_dsi_dcs_write_seq(dsi, 0x58, 0x80);
4f048de28b90ab Konrad Dybcio 2023-04-17  771  	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x53);
4f048de28b90ab Konrad Dybcio 2023-04-17  772  	mipi_dsi_dcs_write_seq(dsi, 0x5a, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  773  	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x14);
4f048de28b90ab Konrad Dybcio 2023-04-17  774  	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  775  	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  776  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x20);
4f048de28b90ab Konrad Dybcio 2023-04-17  777  	mipi_dsi_dcs_write_seq(dsi, 0x5f, 0x10);
4f048de28b90ab Konrad Dybcio 2023-04-17  778  	mipi_dsi_dcs_write_seq(dsi, 0x60, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  779  	mipi_dsi_dcs_write_seq(dsi, 0x61, 0x1d);
4f048de28b90ab Konrad Dybcio 2023-04-17  780  	mipi_dsi_dcs_write_seq(dsi, 0x62, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  781  	mipi_dsi_dcs_write_seq(dsi, 0x63, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  782  	mipi_dsi_dcs_write_seq(dsi, 0x64, 0x24);
4f048de28b90ab Konrad Dybcio 2023-04-17  783  	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x1c);
4f048de28b90ab Konrad Dybcio 2023-04-17  784  	mipi_dsi_dcs_write_seq(dsi, 0x66, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  785  	mipi_dsi_dcs_write_seq(dsi, 0x67, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  786  	mipi_dsi_dcs_write_seq(dsi, 0x68, 0x25);
4f048de28b90ab Konrad Dybcio 2023-04-17  787  	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  788  	mipi_dsi_dcs_write_seq(dsi, 0x78, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  789  	mipi_dsi_dcs_write_seq(dsi, 0xc3, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  790  	mipi_dsi_dcs_write_seq(dsi, 0xd1, 0x24);
4f048de28b90ab Konrad Dybcio 2023-04-17  791  	mipi_dsi_dcs_write_seq(dsi, 0xd2, 0x30);
4f048de28b90ab Konrad Dybcio 2023-04-17  792  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2a);
4f048de28b90ab Konrad Dybcio 2023-04-17  793  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  794  	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x2f);
4f048de28b90ab Konrad Dybcio 2023-04-17  795  	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x08);
4f048de28b90ab Konrad Dybcio 2023-04-17  796  	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  797  	mipi_dsi_dcs_write_seq(dsi, 0x25, 0xc3);
4f048de28b90ab Konrad Dybcio 2023-04-17  798  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0xf8);
4f048de28b90ab Konrad Dybcio 2023-04-17  799  	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  800  	mipi_dsi_dcs_write_seq(dsi, 0x28, 0x1a);
4f048de28b90ab Konrad Dybcio 2023-04-17  801  	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  802  	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x1a);
4f048de28b90ab Konrad Dybcio 2023-04-17  803  	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  804  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_LUT, 0x1a);
4f048de28b90ab Konrad Dybcio 2023-04-17  805  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0xe0);
4f048de28b90ab Konrad Dybcio 2023-04-17  806  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  807  	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x60);
4f048de28b90ab Konrad Dybcio 2023-04-17  808  	mipi_dsi_dcs_write_seq(dsi, 0x16, 0xc0);
4f048de28b90ab Konrad Dybcio 2023-04-17  809  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0xf0);
4f048de28b90ab Konrad Dybcio 2023-04-17  810  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  811  
4f048de28b90ab Konrad Dybcio 2023-04-17  812  	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x08);
4f048de28b90ab Konrad Dybcio 2023-04-17  813  	if (ret < 0) {
4f048de28b90ab Konrad Dybcio 2023-04-17  814  		dev_err(dev, "Failed to set pixel format: %d\n", ret);
4f048de28b90ab Konrad Dybcio 2023-04-17  815  		return ret;
4f048de28b90ab Konrad Dybcio 2023-04-17  816  	}
4f048de28b90ab Konrad Dybcio 2023-04-17  817  
4f048de28b90ab Konrad Dybcio 2023-04-17  818  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x24);
4f048de28b90ab Konrad Dybcio 2023-04-17  819  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  820  
4f048de28b90ab Konrad Dybcio 2023-04-17  821  	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x5d);
4f048de28b90ab Konrad Dybcio 2023-04-17  822  	if (ret < 0) {
4f048de28b90ab Konrad Dybcio 2023-04-17  823  		dev_err(dev, "Failed to set pixel format: %d\n", ret);
4f048de28b90ab Konrad Dybcio 2023-04-17  824  		return ret;
4f048de28b90ab Konrad Dybcio 2023-04-17  825  	}
4f048de28b90ab Konrad Dybcio 2023-04-17  826  
4f048de28b90ab Konrad Dybcio 2023-04-17  827  	mipi_dsi_dcs_write_seq(dsi, 0x3b, 0x60);
4f048de28b90ab Konrad Dybcio 2023-04-17  828  	mipi_dsi_dcs_write_seq(dsi, 0x4a, 0x5d);
4f048de28b90ab Konrad Dybcio 2023-04-17  829  	mipi_dsi_dcs_write_seq(dsi, 0x4b, 0x60);
4f048de28b90ab Konrad Dybcio 2023-04-17  830  	mipi_dsi_dcs_write_seq(dsi, 0x5a, 0x70);
4f048de28b90ab Konrad Dybcio 2023-04-17  831  	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x60);
4f048de28b90ab Konrad Dybcio 2023-04-17  832  	mipi_dsi_dcs_write_seq(dsi, 0x91, 0x44);
4f048de28b90ab Konrad Dybcio 2023-04-17  833  	mipi_dsi_dcs_write_seq(dsi, 0x92, 0x75);
4f048de28b90ab Konrad Dybcio 2023-04-17  834  	mipi_dsi_dcs_write_seq(dsi, 0xdb, 0x05);
4f048de28b90ab Konrad Dybcio 2023-04-17  835  	mipi_dsi_dcs_write_seq(dsi, 0xdc, 0x75);
4f048de28b90ab Konrad Dybcio 2023-04-17  836  	mipi_dsi_dcs_write_seq(dsi, 0xdd, 0x22);
4f048de28b90ab Konrad Dybcio 2023-04-17  837  	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x05);
4f048de28b90ab Konrad Dybcio 2023-04-17  838  	mipi_dsi_dcs_write_seq(dsi, 0xe0, 0x75);
4f048de28b90ab Konrad Dybcio 2023-04-17  839  	mipi_dsi_dcs_write_seq(dsi, 0xe1, 0x05);
4f048de28b90ab Konrad Dybcio 2023-04-17  840  	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0x75);
4f048de28b90ab Konrad Dybcio 2023-04-17  841  	mipi_dsi_dcs_write_seq(dsi, 0xe3, 0x05);
4f048de28b90ab Konrad Dybcio 2023-04-17  842  	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x75);
4f048de28b90ab Konrad Dybcio 2023-04-17  843  	mipi_dsi_dcs_write_seq(dsi, 0xe5, 0x05);
4f048de28b90ab Konrad Dybcio 2023-04-17  844  	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x75);
4f048de28b90ab Konrad Dybcio 2023-04-17  845  	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  846  	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  847  	mipi_dsi_dcs_write_seq(dsi, 0x8d, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  848  	mipi_dsi_dcs_write_seq(dsi, 0x8e, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  849  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x25);
4f048de28b90ab Konrad Dybcio 2023-04-17  850  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  851  	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0x70);
4f048de28b90ab Konrad Dybcio 2023-04-17  852  	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x60);
4f048de28b90ab Konrad Dybcio 2023-04-17  853  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0x70);
4f048de28b90ab Konrad Dybcio 2023-04-17  854  	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x60);
4f048de28b90ab Konrad Dybcio 2023-04-17  855  	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x70);
4f048de28b90ab Konrad Dybcio 2023-04-17  856  	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x60);
4f048de28b90ab Konrad Dybcio 2023-04-17  857  	mipi_dsi_dcs_write_seq(dsi, 0x48, 0x70);
4f048de28b90ab Konrad Dybcio 2023-04-17  858  	mipi_dsi_dcs_write_seq(dsi, 0x49, 0x60);
4f048de28b90ab Konrad Dybcio 2023-04-17  859  	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  860  	mipi_dsi_dcs_write_seq(dsi, 0x61, 0x70);
4f048de28b90ab Konrad Dybcio 2023-04-17  861  	mipi_dsi_dcs_write_seq(dsi, 0x62, 0x60);
4f048de28b90ab Konrad Dybcio 2023-04-17  862  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x26);
4f048de28b90ab Konrad Dybcio 2023-04-17  863  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  864  	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x31);
4f048de28b90ab Konrad Dybcio 2023-04-17  865  	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x0a);
4f048de28b90ab Konrad Dybcio 2023-04-17  866  	mipi_dsi_dcs_write_seq(dsi, 0x1a, 0x7f);
4f048de28b90ab Konrad Dybcio 2023-04-17  867  	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x0a);
4f048de28b90ab Konrad Dybcio 2023-04-17  868  	mipi_dsi_dcs_write_seq(dsi, 0x1c, 0x0c);
4f048de28b90ab Konrad Dybcio 2023-04-17  869  	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x0a);
4f048de28b90ab Konrad Dybcio 2023-04-17  870  	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x7f);
4f048de28b90ab Konrad Dybcio 2023-04-17  871  	mipi_dsi_dcs_write_seq(dsi, 0x1e, 0x75);
4f048de28b90ab Konrad Dybcio 2023-04-17  872  	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0x75);
4f048de28b90ab Konrad Dybcio 2023-04-17  873  	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x75);
4f048de28b90ab Konrad Dybcio 2023-04-17  874  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x75);
4f048de28b90ab Konrad Dybcio 2023-04-17  875  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_COLUMNS, 0x05);
4f048de28b90ab Konrad Dybcio 2023-04-17  876  	mipi_dsi_dcs_write_seq(dsi, 0x32, 0x8d);
4f048de28b90ab Konrad Dybcio 2023-04-17  877  
4f048de28b90ab Konrad Dybcio 2023-04-17  878  	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x75);
4f048de28b90ab Konrad Dybcio 2023-04-17  879  	if (ret < 0) {
4f048de28b90ab Konrad Dybcio 2023-04-17  880  		dev_err(dev, "Failed to set pixel format: %d\n", ret);
4f048de28b90ab Konrad Dybcio 2023-04-17  881  		return ret;
4f048de28b90ab Konrad Dybcio 2023-04-17  882  	}
4f048de28b90ab Konrad Dybcio 2023-04-17  883  
4f048de28b90ab Konrad Dybcio 2023-04-17  884  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2a);
4f048de28b90ab Konrad Dybcio 2023-04-17  885  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  886  	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x75);
4f048de28b90ab Konrad Dybcio 2023-04-17  887  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
4f048de28b90ab Konrad Dybcio 2023-04-17  888  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  889  	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  890  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x20);
4f048de28b90ab Konrad Dybcio 2023-04-17  891  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  892  	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x40);
4f048de28b90ab Konrad Dybcio 2023-04-17  893  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
4f048de28b90ab Konrad Dybcio 2023-04-17  894  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  895  	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x02);
4f048de28b90ab Konrad Dybcio 2023-04-17  896  
4f048de28b90ab Konrad Dybcio 2023-04-17  897  	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
4f048de28b90ab Konrad Dybcio 2023-04-17  898  	if (ret < 0) {
4f048de28b90ab Konrad Dybcio 2023-04-17  899  		dev_err(dev, "Failed to set tear on: %d\n", ret);
4f048de28b90ab Konrad Dybcio 2023-04-17  900  		return ret;
4f048de28b90ab Konrad Dybcio 2023-04-17  901  	}
4f048de28b90ab Konrad Dybcio 2023-04-17  902  
4f048de28b90ab Konrad Dybcio 2023-04-17  903  	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x13);
4f048de28b90ab Konrad Dybcio 2023-04-17  904  	mipi_dsi_dcs_write_seq(dsi, 0x3b, 0x03, 0x5f, 0x1a, 0x04, 0x04);
4f048de28b90ab Konrad Dybcio 2023-04-17  905  	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
4f048de28b90ab Konrad Dybcio 2023-04-17  906  	usleep_range(10000, 11000);
4f048de28b90ab Konrad Dybcio 2023-04-17  907  	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  908  
4f048de28b90ab Konrad Dybcio 2023-04-17  909  	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0);
4f048de28b90ab Konrad Dybcio 2023-04-17  910  	if (ret < 0) {
4f048de28b90ab Konrad Dybcio 2023-04-17  911  		dev_err(dev, "Failed to set display brightness: %d\n", ret);
4f048de28b90ab Konrad Dybcio 2023-04-17  912  		return ret;
4f048de28b90ab Konrad Dybcio 2023-04-17  913  	}
4f048de28b90ab Konrad Dybcio 2023-04-17  914  
4f048de28b90ab Konrad Dybcio 2023-04-17  915  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x2c);
4f048de28b90ab Konrad Dybcio 2023-04-17  916  	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
4f048de28b90ab Konrad Dybcio 2023-04-17  917  	mipi_dsi_dcs_write_seq(dsi, 0x68, 0x05, 0x01);
4f048de28b90ab Konrad Dybcio 2023-04-17  918  
4f048de28b90ab Konrad Dybcio 2023-04-17  919  	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
4f048de28b90ab Konrad Dybcio 2023-04-17  920  	if (ret < 0) {
4f048de28b90ab Konrad Dybcio 2023-04-17  921  		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
4f048de28b90ab Konrad Dybcio 2023-04-17  922  		return ret;
4f048de28b90ab Konrad Dybcio 2023-04-17  923  	}
4f048de28b90ab Konrad Dybcio 2023-04-17  924  	msleep(100);
4f048de28b90ab Konrad Dybcio 2023-04-17  925  
4f048de28b90ab Konrad Dybcio 2023-04-17  926  	ret = mipi_dsi_dcs_set_display_on(dsi);
4f048de28b90ab Konrad Dybcio 2023-04-17  927  	if (ret < 0) {
4f048de28b90ab Konrad Dybcio 2023-04-17  928  		dev_err(dev, "Failed to set display on: %d\n", ret);
4f048de28b90ab Konrad Dybcio 2023-04-17  929  		return ret;
4f048de28b90ab Konrad Dybcio 2023-04-17  930  	}
4f048de28b90ab Konrad Dybcio 2023-04-17  931  	msleep(30);
4f048de28b90ab Konrad Dybcio 2023-04-17  932  
4f048de28b90ab Konrad Dybcio 2023-04-17  933  	return 0;
4f048de28b90ab Konrad Dybcio 2023-04-17  934  }
4f048de28b90ab Konrad Dybcio 2023-04-17  935  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
