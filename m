Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7144388
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Oct 2023 05:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696224459; x=1727760459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=70pr6ecfp/X1oIIHn0vE0UmiJh3V8lXDqCzlUrBUMEc=;
  b=euSEiAsO2+p2bgjWKWn5wLEmNdXFoOlP2ptaa/65FVYUja3LYw82HdAV
   52tOKoJs1mXwZEXqqn2GAd5NezWW//TYwaqOoiZMaLB8cCYTwcPuMaA2K
   3CyqEdVxg1mowLSWDDA0W5ZunfotsFCwSsAt3lROuK38CpgomHpNumLwb
   UrjSMVmsnUFMl7/iG5kDWkGCK0E/cbuE0HnY1zlrSxa+dOYxNvgR+D5Jt
   c7YW6X7Yrf3KpgoBAcziU1hdGNNogo3i7vrJbPmo38sggOyUET8Kb1WdJ
   Yo4eamZLyMs+PSdNl7UiEEtRkDyRUCfq4EMrbODR9m6k2DcMzMS0ZKYqG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="362853857"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="362853857"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 22:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="779840167"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="779840167"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 01 Oct 2023 22:27:28 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnBSo-0005m5-1D;
	Mon, 02 Oct 2023 05:27:26 +0000
Date: Mon, 2 Oct 2023 13:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c:140
 truly_nt35521_on() warn: Function too hairy.  No more merges.
Message-ID: <202310021323.KAPUN6F5-lkp@intel.com>
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
TO: Javier Martinez Canillas <javierm@redhat.com>
CC: Sam Ravnborg <sam@ravnborg.org>

Hi Javier,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
commit: 7b00536a206e9d31740e3a6c11c6b731b1d49182 drm/panel-sony-tulip-truly-nt35521: Drop custom DSI write macro
date:   9 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20230924 (https://download.01.org/0day-ci/archive/20231002/202310021323.KAPUN6F5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231002/202310021323.KAPUN6F5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310021323.KAPUN6F5-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c:140 truly_nt35521_on() warn: Function too hairy.  No more merges.

vim +140 drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c

9aa2c2320e6fb5 Shawn Guo                2021-08-09   45  
9aa2c2320e6fb5 Shawn Guo                2021-08-09   46  static int truly_nt35521_on(struct truly_nt35521 *ctx)
9aa2c2320e6fb5 Shawn Guo                2021-08-09   47  {
9aa2c2320e6fb5 Shawn Guo                2021-08-09   48  	struct mipi_dsi_device *dsi = ctx->dsi;
9aa2c2320e6fb5 Shawn Guo                2021-08-09   49  	struct device *dev = &dsi->dev;
9aa2c2320e6fb5 Shawn Guo                2021-08-09   50  	int ret;
9aa2c2320e6fb5 Shawn Guo                2021-08-09   51  
9aa2c2320e6fb5 Shawn Guo                2021-08-09   52  	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
9aa2c2320e6fb5 Shawn Guo                2021-08-09   53  
7b00536a206e9d Javier Martinez Canillas 2023-01-07   54  	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   55  	mipi_dsi_generic_write_seq(dsi, 0xff, 0xaa, 0x55, 0xa5, 0x80);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   56  	mipi_dsi_generic_write_seq(dsi, 0x6f, 0x11, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   57  	mipi_dsi_generic_write_seq(dsi, 0xf7, 0x20, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   58  	mipi_dsi_generic_write_seq(dsi, 0x6f, 0x01);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   59  	mipi_dsi_generic_write_seq(dsi, 0xb1, 0x21);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   60  	mipi_dsi_generic_write_seq(dsi, 0xbd, 0x01, 0xa0, 0x10, 0x08, 0x01);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   61  	mipi_dsi_generic_write_seq(dsi, 0xb8, 0x01, 0x02, 0x0c, 0x02);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   62  	mipi_dsi_generic_write_seq(dsi, 0xbb, 0x11, 0x11);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   63  	mipi_dsi_generic_write_seq(dsi, 0xbc, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   64  	mipi_dsi_generic_write_seq(dsi, 0xb6, 0x02);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   65  	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x01);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   66  	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x09, 0x09);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   67  	mipi_dsi_generic_write_seq(dsi, 0xb1, 0x09, 0x09);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   68  	mipi_dsi_generic_write_seq(dsi, 0xbc, 0x8c, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   69  	mipi_dsi_generic_write_seq(dsi, 0xbd, 0x8c, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   70  	mipi_dsi_generic_write_seq(dsi, 0xca, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   71  	mipi_dsi_generic_write_seq(dsi, 0xc0, 0x04);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   72  	mipi_dsi_generic_write_seq(dsi, 0xbe, 0xb5);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   73  	mipi_dsi_generic_write_seq(dsi, 0xb3, 0x35, 0x35);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   74  	mipi_dsi_generic_write_seq(dsi, 0xb4, 0x25, 0x25);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   75  	mipi_dsi_generic_write_seq(dsi, 0xb9, 0x43, 0x43);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   76  	mipi_dsi_generic_write_seq(dsi, 0xba, 0x24, 0x24);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   77  	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x02);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   78  	mipi_dsi_generic_write_seq(dsi, 0xee, 0x03);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   79  	mipi_dsi_generic_write_seq(dsi, 0xb0,
9aa2c2320e6fb5 Shawn Guo                2021-08-09   80  				   0x00, 0xb2, 0x00, 0xb3, 0x00, 0xb6, 0x00, 0xc3,
9aa2c2320e6fb5 Shawn Guo                2021-08-09   81  				   0x00, 0xce, 0x00, 0xe1, 0x00, 0xf3, 0x01, 0x11);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   82  	mipi_dsi_generic_write_seq(dsi, 0xb1,
9aa2c2320e6fb5 Shawn Guo                2021-08-09   83  				   0x01, 0x2e, 0x01, 0x5c, 0x01, 0x82, 0x01, 0xc3,
9aa2c2320e6fb5 Shawn Guo                2021-08-09   84  				   0x01, 0xfe, 0x02, 0x00, 0x02, 0x37, 0x02, 0x77);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   85  	mipi_dsi_generic_write_seq(dsi, 0xb2,
9aa2c2320e6fb5 Shawn Guo                2021-08-09   86  				   0x02, 0xa1, 0x02, 0xd7, 0x02, 0xfe, 0x03, 0x2c,
9aa2c2320e6fb5 Shawn Guo                2021-08-09   87  				   0x03, 0x4b, 0x03, 0x63, 0x03, 0x8f, 0x03, 0x90);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   88  	mipi_dsi_generic_write_seq(dsi, 0xb3, 0x03, 0x96, 0x03, 0x98);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   89  	mipi_dsi_generic_write_seq(dsi, 0xb4,
9aa2c2320e6fb5 Shawn Guo                2021-08-09   90  				   0x00, 0x81, 0x00, 0x8b, 0x00, 0x9c, 0x00, 0xa9,
9aa2c2320e6fb5 Shawn Guo                2021-08-09   91  				   0x00, 0xb5, 0x00, 0xcb, 0x00, 0xdf, 0x01, 0x02);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   92  	mipi_dsi_generic_write_seq(dsi, 0xb5,
9aa2c2320e6fb5 Shawn Guo                2021-08-09   93  				   0x01, 0x1f, 0x01, 0x51, 0x01, 0x7a, 0x01, 0xbf,
9aa2c2320e6fb5 Shawn Guo                2021-08-09   94  				   0x01, 0xfa, 0x01, 0xfc, 0x02, 0x34, 0x02, 0x76);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   95  	mipi_dsi_generic_write_seq(dsi, 0xb6,
9aa2c2320e6fb5 Shawn Guo                2021-08-09   96  				   0x02, 0x9f, 0x02, 0xd7, 0x02, 0xfc, 0x03, 0x2c,
9aa2c2320e6fb5 Shawn Guo                2021-08-09   97  				   0x03, 0x4a, 0x03, 0x63, 0x03, 0x8f, 0x03, 0xa2);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   98  	mipi_dsi_generic_write_seq(dsi, 0xb7, 0x03, 0xb8, 0x03, 0xba);
7b00536a206e9d Javier Martinez Canillas 2023-01-07   99  	mipi_dsi_generic_write_seq(dsi, 0xb8,
9aa2c2320e6fb5 Shawn Guo                2021-08-09  100  				   0x00, 0x01, 0x00, 0x02, 0x00, 0x0e, 0x00, 0x2a,
9aa2c2320e6fb5 Shawn Guo                2021-08-09  101  				   0x00, 0x41, 0x00, 0x67, 0x00, 0x87, 0x00, 0xb9);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  102  	mipi_dsi_generic_write_seq(dsi, 0xb9,
9aa2c2320e6fb5 Shawn Guo                2021-08-09  103  				   0x00, 0xe2, 0x01, 0x22, 0x01, 0x54, 0x01, 0xa3,
9aa2c2320e6fb5 Shawn Guo                2021-08-09  104  				   0x01, 0xe6, 0x01, 0xe7, 0x02, 0x24, 0x02, 0x67);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  105  	mipi_dsi_generic_write_seq(dsi, 0xba,
9aa2c2320e6fb5 Shawn Guo                2021-08-09  106  				   0x02, 0x93, 0x02, 0xcd, 0x02, 0xf6, 0x03, 0x31,
9aa2c2320e6fb5 Shawn Guo                2021-08-09  107  				   0x03, 0x6c, 0x03, 0xe9, 0x03, 0xef, 0x03, 0xf4);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  108  	mipi_dsi_generic_write_seq(dsi, 0xbb, 0x03, 0xf6, 0x03, 0xf7);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  109  	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x03);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  110  	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x22, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  111  	mipi_dsi_generic_write_seq(dsi, 0xb1, 0x22, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  112  	mipi_dsi_generic_write_seq(dsi, 0xb2, 0x05, 0x00, 0x60, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  113  	mipi_dsi_generic_write_seq(dsi, 0xb3, 0x05, 0x00, 0x60, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  114  	mipi_dsi_generic_write_seq(dsi, 0xb4, 0x05, 0x00, 0x60, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  115  	mipi_dsi_generic_write_seq(dsi, 0xb5, 0x05, 0x00, 0x60, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  116  	mipi_dsi_generic_write_seq(dsi, 0xba, 0x53, 0x00, 0x60, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  117  	mipi_dsi_generic_write_seq(dsi, 0xbb, 0x53, 0x00, 0x60, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  118  	mipi_dsi_generic_write_seq(dsi, 0xbc, 0x53, 0x00, 0x60, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  119  	mipi_dsi_generic_write_seq(dsi, 0xbd, 0x53, 0x00, 0x60, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  120  	mipi_dsi_generic_write_seq(dsi, 0xc0, 0x00, 0x34, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  121  	mipi_dsi_generic_write_seq(dsi, 0xc1, 0x00, 0x00, 0x34, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  122  	mipi_dsi_generic_write_seq(dsi, 0xc2, 0x00, 0x00, 0x34, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  123  	mipi_dsi_generic_write_seq(dsi, 0xc3, 0x00, 0x00, 0x34, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  124  	mipi_dsi_generic_write_seq(dsi, 0xc4, 0x60);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  125  	mipi_dsi_generic_write_seq(dsi, 0xc5, 0xc0);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  126  	mipi_dsi_generic_write_seq(dsi, 0xc6, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  127  	mipi_dsi_generic_write_seq(dsi, 0xc7, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  128  	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x05);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  129  	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x17, 0x06);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  130  	mipi_dsi_generic_write_seq(dsi, 0xb1, 0x17, 0x06);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  131  	mipi_dsi_generic_write_seq(dsi, 0xb2, 0x17, 0x06);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  132  	mipi_dsi_generic_write_seq(dsi, 0xb3, 0x17, 0x06);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  133  	mipi_dsi_generic_write_seq(dsi, 0xb4, 0x17, 0x06);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  134  	mipi_dsi_generic_write_seq(dsi, 0xb5, 0x17, 0x06);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  135  	mipi_dsi_generic_write_seq(dsi, 0xb6, 0x17, 0x06);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  136  	mipi_dsi_generic_write_seq(dsi, 0xb7, 0x17, 0x06);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  137  	mipi_dsi_generic_write_seq(dsi, 0xb8, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  138  	mipi_dsi_generic_write_seq(dsi, 0xb9, 0x00, 0x03);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  139  	mipi_dsi_generic_write_seq(dsi, 0xba, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07 @140  	mipi_dsi_generic_write_seq(dsi, 0xbb, 0x02, 0x03);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  141  	mipi_dsi_generic_write_seq(dsi, 0xbc, 0x02, 0x03);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  142  	mipi_dsi_generic_write_seq(dsi, 0xbd, 0x03, 0x03, 0x00, 0x03, 0x03);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  143  	mipi_dsi_generic_write_seq(dsi, 0xc0, 0x0b);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  144  	mipi_dsi_generic_write_seq(dsi, 0xc1, 0x09);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  145  	mipi_dsi_generic_write_seq(dsi, 0xc2, 0xa6);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  146  	mipi_dsi_generic_write_seq(dsi, 0xc3, 0x05);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  147  	mipi_dsi_generic_write_seq(dsi, 0xc4, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  148  	mipi_dsi_generic_write_seq(dsi, 0xc5, 0x02);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  149  	mipi_dsi_generic_write_seq(dsi, 0xc6, 0x22);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  150  	mipi_dsi_generic_write_seq(dsi, 0xc7, 0x03);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  151  	mipi_dsi_generic_write_seq(dsi, 0xc8, 0x07, 0x20);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  152  	mipi_dsi_generic_write_seq(dsi, 0xc9, 0x03, 0x20);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  153  	mipi_dsi_generic_write_seq(dsi, 0xca, 0x01, 0x60);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  154  	mipi_dsi_generic_write_seq(dsi, 0xcb, 0x01, 0x60);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  155  	mipi_dsi_generic_write_seq(dsi, 0xcc, 0x00, 0x00, 0x02);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  156  	mipi_dsi_generic_write_seq(dsi, 0xcd, 0x00, 0x00, 0x02);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  157  	mipi_dsi_generic_write_seq(dsi, 0xce, 0x00, 0x00, 0x02);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  158  	mipi_dsi_generic_write_seq(dsi, 0xcf, 0x00, 0x00, 0x02);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  159  	mipi_dsi_generic_write_seq(dsi, 0xd1, 0x00, 0x05, 0x01, 0x07, 0x10);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  160  	mipi_dsi_generic_write_seq(dsi, 0xd2, 0x10, 0x05, 0x05, 0x03, 0x10);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  161  	mipi_dsi_generic_write_seq(dsi, 0xd3, 0x20, 0x00, 0x43, 0x07, 0x10);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  162  	mipi_dsi_generic_write_seq(dsi, 0xd4, 0x30, 0x00, 0x43, 0x07, 0x10);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  163  	mipi_dsi_generic_write_seq(dsi, 0xd0,
9aa2c2320e6fb5 Shawn Guo                2021-08-09  164  				   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  165  	mipi_dsi_generic_write_seq(dsi, 0xd5,
9aa2c2320e6fb5 Shawn Guo                2021-08-09  166  				   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
9aa2c2320e6fb5 Shawn Guo                2021-08-09  167  				   0x00, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  168  	mipi_dsi_generic_write_seq(dsi, 0xd6,
9aa2c2320e6fb5 Shawn Guo                2021-08-09  169  				   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
9aa2c2320e6fb5 Shawn Guo                2021-08-09  170  				   0x00, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  171  	mipi_dsi_generic_write_seq(dsi, 0xd7,
9aa2c2320e6fb5 Shawn Guo                2021-08-09  172  				   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
9aa2c2320e6fb5 Shawn Guo                2021-08-09  173  				   0x00, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  174  	mipi_dsi_generic_write_seq(dsi, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  175  	mipi_dsi_generic_write_seq(dsi, 0xe5, 0x06);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  176  	mipi_dsi_generic_write_seq(dsi, 0xe6, 0x06);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  177  	mipi_dsi_generic_write_seq(dsi, 0xe7, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  178  	mipi_dsi_generic_write_seq(dsi, 0xe8, 0x06);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  179  	mipi_dsi_generic_write_seq(dsi, 0xe9, 0x06);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  180  	mipi_dsi_generic_write_seq(dsi, 0xea, 0x06);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  181  	mipi_dsi_generic_write_seq(dsi, 0xeb, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  182  	mipi_dsi_generic_write_seq(dsi, 0xec, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  183  	mipi_dsi_generic_write_seq(dsi, 0xed, 0x30);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  184  	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x06);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  185  	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x31, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  186  	mipi_dsi_generic_write_seq(dsi, 0xb1, 0x31, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  187  	mipi_dsi_generic_write_seq(dsi, 0xb2, 0x2d, 0x2e);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  188  	mipi_dsi_generic_write_seq(dsi, 0xb3, 0x31, 0x34);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  189  	mipi_dsi_generic_write_seq(dsi, 0xb4, 0x29, 0x2a);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  190  	mipi_dsi_generic_write_seq(dsi, 0xb5, 0x12, 0x10);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  191  	mipi_dsi_generic_write_seq(dsi, 0xb6, 0x18, 0x16);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  192  	mipi_dsi_generic_write_seq(dsi, 0xb7, 0x00, 0x02);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  193  	mipi_dsi_generic_write_seq(dsi, 0xb8, 0x08, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  194  	mipi_dsi_generic_write_seq(dsi, 0xb9, 0x31, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  195  	mipi_dsi_generic_write_seq(dsi, 0xba, 0x31, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  196  	mipi_dsi_generic_write_seq(dsi, 0xbb, 0x31, 0x08);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  197  	mipi_dsi_generic_write_seq(dsi, 0xbc, 0x03, 0x01);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  198  	mipi_dsi_generic_write_seq(dsi, 0xbd, 0x17, 0x19);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  199  	mipi_dsi_generic_write_seq(dsi, 0xbe, 0x11, 0x13);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  200  	mipi_dsi_generic_write_seq(dsi, 0xbf, 0x2a, 0x29);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  201  	mipi_dsi_generic_write_seq(dsi, 0xc0, 0x34, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  202  	mipi_dsi_generic_write_seq(dsi, 0xc1, 0x2e, 0x2d);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  203  	mipi_dsi_generic_write_seq(dsi, 0xc2, 0x31, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  204  	mipi_dsi_generic_write_seq(dsi, 0xc3, 0x31, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  205  	mipi_dsi_generic_write_seq(dsi, 0xc4, 0x31, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  206  	mipi_dsi_generic_write_seq(dsi, 0xc5, 0x31, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  207  	mipi_dsi_generic_write_seq(dsi, 0xc6, 0x2e, 0x2d);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  208  	mipi_dsi_generic_write_seq(dsi, 0xc7, 0x31, 0x34);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  209  	mipi_dsi_generic_write_seq(dsi, 0xc8, 0x29, 0x2a);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  210  	mipi_dsi_generic_write_seq(dsi, 0xc9, 0x17, 0x19);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  211  	mipi_dsi_generic_write_seq(dsi, 0xca, 0x11, 0x13);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  212  	mipi_dsi_generic_write_seq(dsi, 0xcb, 0x03, 0x01);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  213  	mipi_dsi_generic_write_seq(dsi, 0xcc, 0x08, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  214  	mipi_dsi_generic_write_seq(dsi, 0xcd, 0x31, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  215  	mipi_dsi_generic_write_seq(dsi, 0xce, 0x31, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  216  	mipi_dsi_generic_write_seq(dsi, 0xcf, 0x31, 0x08);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  217  	mipi_dsi_generic_write_seq(dsi, 0xd0, 0x00, 0x02);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  218  	mipi_dsi_generic_write_seq(dsi, 0xd1, 0x12, 0x10);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  219  	mipi_dsi_generic_write_seq(dsi, 0xd2, 0x18, 0x16);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  220  	mipi_dsi_generic_write_seq(dsi, 0xd3, 0x2a, 0x29);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  221  	mipi_dsi_generic_write_seq(dsi, 0xd4, 0x34, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  222  	mipi_dsi_generic_write_seq(dsi, 0xd5, 0x2d, 0x2e);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  223  	mipi_dsi_generic_write_seq(dsi, 0xd6, 0x31, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  224  	mipi_dsi_generic_write_seq(dsi, 0xd7, 0x31, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  225  	mipi_dsi_generic_write_seq(dsi, 0xe5, 0x31, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  226  	mipi_dsi_generic_write_seq(dsi, 0xe6, 0x31, 0x31);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  227  	mipi_dsi_generic_write_seq(dsi, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  228  	mipi_dsi_generic_write_seq(dsi, 0xd9, 0x00, 0x00, 0x00, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  229  	mipi_dsi_generic_write_seq(dsi, 0xe7, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  230  	mipi_dsi_generic_write_seq(dsi, 0x6f, 0x02);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  231  	mipi_dsi_generic_write_seq(dsi, 0xf7, 0x47);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  232  	mipi_dsi_generic_write_seq(dsi, 0x6f, 0x0a);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  233  	mipi_dsi_generic_write_seq(dsi, 0xf7, 0x02);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  234  	mipi_dsi_generic_write_seq(dsi, 0x6f, 0x17);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  235  	mipi_dsi_generic_write_seq(dsi, 0xf4, 0x60);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  236  	mipi_dsi_generic_write_seq(dsi, 0x6f, 0x01);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  237  	mipi_dsi_generic_write_seq(dsi, 0xf9, 0x46);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  238  	mipi_dsi_generic_write_seq(dsi, 0x6f, 0x11);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  239  	mipi_dsi_generic_write_seq(dsi, 0xf3, 0x01);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  240  	mipi_dsi_generic_write_seq(dsi, 0x35, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  241  	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  242  	mipi_dsi_generic_write_seq(dsi, 0xd9, 0x02, 0x03, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  243  	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  244  	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  245  	mipi_dsi_generic_write_seq(dsi, 0xb1, 0x6c, 0x21);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  246  	mipi_dsi_generic_write_seq(dsi, 0xf0, 0x55, 0xaa, 0x52, 0x00, 0x00);
7b00536a206e9d Javier Martinez Canillas 2023-01-07  247  	mipi_dsi_generic_write_seq(dsi, 0x35, 0x00);
9aa2c2320e6fb5 Shawn Guo                2021-08-09  248  
9aa2c2320e6fb5 Shawn Guo                2021-08-09  249  	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
9aa2c2320e6fb5 Shawn Guo                2021-08-09  250  	if (ret < 0) {
9aa2c2320e6fb5 Shawn Guo                2021-08-09  251  		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
9aa2c2320e6fb5 Shawn Guo                2021-08-09  252  		return ret;
9aa2c2320e6fb5 Shawn Guo                2021-08-09  253  	}
9aa2c2320e6fb5 Shawn Guo                2021-08-09  254  	msleep(120);
9aa2c2320e6fb5 Shawn Guo                2021-08-09  255  
9aa2c2320e6fb5 Shawn Guo                2021-08-09  256  	ret = mipi_dsi_dcs_set_display_on(dsi);
9aa2c2320e6fb5 Shawn Guo                2021-08-09  257  	if (ret < 0) {
9aa2c2320e6fb5 Shawn Guo                2021-08-09  258  		dev_err(dev, "Failed to set display on: %d\n", ret);
9aa2c2320e6fb5 Shawn Guo                2021-08-09  259  		return ret;
9aa2c2320e6fb5 Shawn Guo                2021-08-09  260  	}
9aa2c2320e6fb5 Shawn Guo                2021-08-09  261  	usleep_range(1000, 2000);
9aa2c2320e6fb5 Shawn Guo                2021-08-09  262  
7b00536a206e9d Javier Martinez Canillas 2023-01-07  263  	mipi_dsi_generic_write_seq(dsi, 0x53, 0x24);
9aa2c2320e6fb5 Shawn Guo                2021-08-09  264  
9aa2c2320e6fb5 Shawn Guo                2021-08-09  265  	return 0;
9aa2c2320e6fb5 Shawn Guo                2021-08-09  266  }
9aa2c2320e6fb5 Shawn Guo                2021-08-09  267  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
