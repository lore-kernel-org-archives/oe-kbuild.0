Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BF979EC
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jun 2023 15:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687016680; x=1718552680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3g4W3+xtBHpe41PbWn1JM/W5pKjkiPtqVOnh0CbCEZs=;
  b=Sezps89o5zC2HECWKP2/yZ1EtQ17i/udnyA89m2GUfiSkAxB8fxfJ3Jy
   nq9xuV9/F82ds/YOVKzWmjddhFppbkH71XRYInR7pJg5iPcNGEtJipN34
   7QXPXTDcgnUC/S29CT2QMaHNRVkzOhugq4fX561kKfqJkY7Zku7k8/v+o
   cIiQxntZOIvChPtWg4vFhUVqFeyzDVehaFxARTS+BnstBrc16FN+MaFzu
   zkS5yo4ggfftSBsmBHx/2QWuqRMaauCwidhOSkXrzOotu/WMLcJO76gIK
   utkHOayMV1aMEFqtfesGKUr2wpkdjrKBtR2nOO4ljRvdlzo8U3FnP+zn8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="358272278"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="358272278"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 08:44:39 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="746792296"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="746792296"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Jun 2023 08:44:37 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAY6O-0002rU-2s;
	Sat, 17 Jun 2023 15:44:36 +0000
Date: Sat, 17 Jun 2023 23:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panel: boe-tv101wum-nl6: Drop macros and open
 code sequences
Message-ID: <202306172300.HNeMG90x-lkp@intel.com>
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
In-Reply-To: <20230615-fix-boe-tv101wum-nl6-v2-1-457d7ece4590@linaro.org>
References: <20230615-fix-boe-tv101wum-nl6-v2-1-457d7ece4590@linaro.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
TO: Stephen Boyd <swboyd@chromium.org>
TO: yangcong <yangcong5@huaqin.corp-partner.google.com>
TO: Jitao Shi <jitao.shi@mediatek.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Sam Ravnborg <sam@ravnborg.org>
TO: David Airlie <airlied@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org

Hi Linus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ac9a78681b921877518763ba0e89202254349d1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/drm-panel-boe-tv101wum-nl6-Drop-macros-and-open-code-sequences/20230617-050920
base:   ac9a78681b921877518763ba0e89202254349d1b
patch link:    https://lore.kernel.org/r/20230615-fix-boe-tv101wum-nl6-v2-1-457d7ece4590%40linaro.org
patch subject: [PATCH v2 1/2] drm/panel: boe-tv101wum-nl6: Drop macros and open code sequences
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-m001-20230617 (https://download.01.org/0day-ci/archive/20230617/202306172300.HNeMG90x-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306172300.HNeMG90x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306172300.HNeMG90x-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c:161 boe_tv110c9m_init() warn: Function too hairy.  No more merges.
drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c:519 inx_hj110iz_init() warn: Function too hairy.  No more merges.
drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c:857 boe_init() warn: Function too hairy.  No more merges.
drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c:1222 starry_qfh032011_53g_init() warn: Function too hairy.  No more merges.

vim +161 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c

a869b9db7adf3bd Jitao Shi     2020-01-16   56  
f24d88dac9221ea Linus Walleij 2023-06-16   57  static int boe_tv110c9m_init(struct mipi_dsi_device *dsi)
f24d88dac9221ea Linus Walleij 2023-06-16   58  {
f24d88dac9221ea Linus Walleij 2023-06-16   59  	int ret;
a869b9db7adf3bd Jitao Shi     2020-01-16   60  
f24d88dac9221ea Linus Walleij 2023-06-16   61  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x20);
f24d88dac9221ea Linus Walleij 2023-06-16   62  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16   63  	mipi_dsi_dcs_write_seq(dsi, 0x05, 0xD9);
f24d88dac9221ea Linus Walleij 2023-06-16   64  	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x78);
f24d88dac9221ea Linus Walleij 2023-06-16   65  	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x5A);
f24d88dac9221ea Linus Walleij 2023-06-16   66  	mipi_dsi_dcs_write_seq(dsi, 0x0D, 0x63);
f24d88dac9221ea Linus Walleij 2023-06-16   67  	mipi_dsi_dcs_write_seq(dsi, 0x0E, 0x91);
f24d88dac9221ea Linus Walleij 2023-06-16   68  	mipi_dsi_dcs_write_seq(dsi, 0x0F, 0x73);
f24d88dac9221ea Linus Walleij 2023-06-16   69  	mipi_dsi_dcs_write_seq(dsi, 0x95, 0xE6);
f24d88dac9221ea Linus Walleij 2023-06-16   70  	mipi_dsi_dcs_write_seq(dsi, 0x96, 0xF0);
f24d88dac9221ea Linus Walleij 2023-06-16   71  	mipi_dsi_dcs_write_seq(dsi, 0x30, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16   72  	mipi_dsi_dcs_write_seq(dsi, 0x6D, 0x66);
f24d88dac9221ea Linus Walleij 2023-06-16   73  	mipi_dsi_dcs_write_seq(dsi, 0x75, 0xA2);
f24d88dac9221ea Linus Walleij 2023-06-16   74  	mipi_dsi_dcs_write_seq(dsi, 0x77, 0x3B);
93ee1a2c0f08345 yangcong      2021-09-14   75  
f24d88dac9221ea Linus Walleij 2023-06-16   76  	mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4D, 0x00, 0x6D, 0x00, 0x89, 0x00, 0xA1, 0x00, 0xB6, 0x00, 0xC9);
f24d88dac9221ea Linus Walleij 2023-06-16   77  	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x00, 0xDA, 0x01, 0x13, 0x01, 0x3C, 0x01, 0x7E, 0x01, 0xAB, 0x01, 0xF7, 0x02, 0x2F, 0x02, 0x31);
f24d88dac9221ea Linus Walleij 2023-06-16   78  	mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x02, 0x67, 0x02, 0xA6, 0x02, 0xD1, 0x03, 0x08, 0x03, 0x2E, 0x03, 0x5B, 0x03, 0x6B, 0x03, 0x7B);
f24d88dac9221ea Linus Walleij 2023-06-16   79  	mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x03, 0x8E, 0x03, 0xA2, 0x03, 0xB7, 0x03, 0xE7, 0x03, 0xFD, 0x03, 0xFF);
93ee1a2c0f08345 yangcong      2021-09-14   80  
f24d88dac9221ea Linus Walleij 2023-06-16   81  	mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4D, 0x00, 0x6D, 0x00, 0x89, 0x00, 0xA1, 0x00, 0xB6, 0x00, 0xC9);
f24d88dac9221ea Linus Walleij 2023-06-16   82  	mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x00, 0xDA, 0x01, 0x13, 0x01, 0x3C, 0x01, 0x7E, 0x01, 0xAB, 0x01, 0xF7, 0x02, 0x2F, 0x02, 0x31);
f24d88dac9221ea Linus Walleij 2023-06-16   83  	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x02, 0x67, 0x02, 0xA6, 0x02, 0xD1, 0x03, 0x08, 0x03, 0x2E, 0x03, 0x5B, 0x03, 0x6B, 0x03, 0x7B);
f24d88dac9221ea Linus Walleij 2023-06-16   84  	mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x03, 0x8E, 0x03, 0xA2, 0x03, 0xB7, 0x03, 0xE7, 0x03, 0xFD, 0x03, 0xFF);
f24d88dac9221ea Linus Walleij 2023-06-16   85  	mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4D, 0x00, 0x6D, 0x00, 0x89, 0x00, 0xA1, 0x00, 0xB6, 0x00, 0xC9);
f24d88dac9221ea Linus Walleij 2023-06-16   86  	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x00, 0xDA, 0x01, 0x13, 0x01, 0x3C, 0x01, 0x7E, 0x01, 0xAB, 0x01, 0xF7, 0x02, 0x2F, 0x02, 0x31);
f24d88dac9221ea Linus Walleij 2023-06-16   87  	mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x02, 0x67, 0x02, 0xA6, 0x02, 0xD1, 0x03, 0x08, 0x03, 0x2E, 0x03, 0x5B, 0x03, 0x6B, 0x03, 0x7B);
f24d88dac9221ea Linus Walleij 2023-06-16   88  	mipi_dsi_dcs_write_seq(dsi, 0xBB, 0x03, 0x8E, 0x03, 0xA2, 0x03, 0xB7, 0x03, 0xE7, 0x03, 0xFD, 0x03, 0xFF);
f24d88dac9221ea Linus Walleij 2023-06-16   89  
f24d88dac9221ea Linus Walleij 2023-06-16   90  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x21);
f24d88dac9221ea Linus Walleij 2023-06-16   91  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16   92  
f24d88dac9221ea Linus Walleij 2023-06-16   93  	mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00, 0x99, 0x00, 0xAE, 0x00, 0xC1);
f24d88dac9221ea Linus Walleij 2023-06-16   94  	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x00, 0xD2, 0x01, 0x0B, 0x01, 0x34, 0x01, 0x76, 0x01, 0xA3, 0x01, 0xEF, 0x02, 0x27, 0x02, 0x29);
f24d88dac9221ea Linus Walleij 2023-06-16   95  	mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x02, 0x5F, 0x02, 0x9E, 0x02, 0xC9, 0x03, 0x00, 0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
f24d88dac9221ea Linus Walleij 2023-06-16   96  
f24d88dac9221ea Linus Walleij 2023-06-16   97  	mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xAF, 0x03, 0xDF, 0x03, 0xF5, 0x03, 0xE0);
f24d88dac9221ea Linus Walleij 2023-06-16   98  	mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00, 0x99, 0x00, 0xAE, 0x00, 0xC1);
f24d88dac9221ea Linus Walleij 2023-06-16   99  	mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x00, 0xD2, 0x01, 0x0B, 0x01, 0x34, 0x01, 0x76, 0x01, 0xA3, 0x01, 0xEF, 0x02, 0x27, 0x02, 0x29);
f24d88dac9221ea Linus Walleij 2023-06-16  100  	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x02, 0x5F, 0x02, 0x9E, 0x02, 0xC9, 0x03, 0x00, 0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
f24d88dac9221ea Linus Walleij 2023-06-16  101  	mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xAF, 0x03, 0xDF, 0x03, 0xF5, 0x03, 0xE0);
f24d88dac9221ea Linus Walleij 2023-06-16  102  
f24d88dac9221ea Linus Walleij 2023-06-16  103  	mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00, 0x99, 0x00, 0xAE, 0x00, 0xC1);
f24d88dac9221ea Linus Walleij 2023-06-16  104  	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x00, 0xD2, 0x01, 0x0B, 0x01, 0x34, 0x01, 0x76, 0x01, 0xA3, 0x01, 0xEF, 0x02, 0x27, 0x02, 0x29);
f24d88dac9221ea Linus Walleij 2023-06-16  105  	mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x02, 0x5F, 0x02, 0x9E, 0x02, 0xC9, 0x03, 0x00, 0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
f24d88dac9221ea Linus Walleij 2023-06-16  106  
f24d88dac9221ea Linus Walleij 2023-06-16  107  	mipi_dsi_dcs_write_seq(dsi, 0xBB, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xAF, 0x03, 0xDF, 0x03, 0xF5, 0x03, 0xE0);
f24d88dac9221ea Linus Walleij 2023-06-16  108  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x24);
f24d88dac9221ea Linus Walleij 2023-06-16  109  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16  110  
f24d88dac9221ea Linus Walleij 2023-06-16  111  	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  112  	mipi_dsi_dcs_write_seq(dsi, 0x01, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  113  
f24d88dac9221ea Linus Walleij 2023-06-16  114  	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x1C);
f24d88dac9221ea Linus Walleij 2023-06-16  115  	mipi_dsi_dcs_write_seq(dsi, 0x03, 0x1C);
f24d88dac9221ea Linus Walleij 2023-06-16  116  
f24d88dac9221ea Linus Walleij 2023-06-16  117  	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x1D);
f24d88dac9221ea Linus Walleij 2023-06-16  118  	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x1D);
f24d88dac9221ea Linus Walleij 2023-06-16  119  
f24d88dac9221ea Linus Walleij 2023-06-16  120  	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x04);
f24d88dac9221ea Linus Walleij 2023-06-16  121  	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x04);
f24d88dac9221ea Linus Walleij 2023-06-16  122  
f24d88dac9221ea Linus Walleij 2023-06-16  123  	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x0F);
f24d88dac9221ea Linus Walleij 2023-06-16  124  	mipi_dsi_dcs_write_seq(dsi, 0x09, 0x0F);
f24d88dac9221ea Linus Walleij 2023-06-16  125  
f24d88dac9221ea Linus Walleij 2023-06-16  126  	mipi_dsi_dcs_write_seq(dsi, 0x0A, 0x0E);
f24d88dac9221ea Linus Walleij 2023-06-16  127  	mipi_dsi_dcs_write_seq(dsi, 0x0B, 0x0E);
f24d88dac9221ea Linus Walleij 2023-06-16  128  
f24d88dac9221ea Linus Walleij 2023-06-16  129  	mipi_dsi_dcs_write_seq(dsi, 0x0C, 0x0D);
f24d88dac9221ea Linus Walleij 2023-06-16  130  	mipi_dsi_dcs_write_seq(dsi, 0x0D, 0x0D);
f24d88dac9221ea Linus Walleij 2023-06-16  131  
f24d88dac9221ea Linus Walleij 2023-06-16  132  	mipi_dsi_dcs_write_seq(dsi, 0x0E, 0x0C);
f24d88dac9221ea Linus Walleij 2023-06-16  133  	mipi_dsi_dcs_write_seq(dsi, 0x0F, 0x0C);
f24d88dac9221ea Linus Walleij 2023-06-16  134  
f24d88dac9221ea Linus Walleij 2023-06-16  135  	mipi_dsi_dcs_write_seq(dsi, 0x10, 0x08);
f24d88dac9221ea Linus Walleij 2023-06-16  136  	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x08);
f24d88dac9221ea Linus Walleij 2023-06-16  137  
f24d88dac9221ea Linus Walleij 2023-06-16  138  	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  139  	mipi_dsi_dcs_write_seq(dsi, 0x13, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  140  	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  141  	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  142  
f24d88dac9221ea Linus Walleij 2023-06-16  143  	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  144  	mipi_dsi_dcs_write_seq(dsi, 0x17, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  145  
f24d88dac9221ea Linus Walleij 2023-06-16  146  	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x1C);
f24d88dac9221ea Linus Walleij 2023-06-16  147  	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x1C);
f24d88dac9221ea Linus Walleij 2023-06-16  148  
f24d88dac9221ea Linus Walleij 2023-06-16  149  	mipi_dsi_dcs_write_seq(dsi, 0x1A, 0x1D);
f24d88dac9221ea Linus Walleij 2023-06-16  150  	mipi_dsi_dcs_write_seq(dsi, 0x1B, 0x1D);
f24d88dac9221ea Linus Walleij 2023-06-16  151  
f24d88dac9221ea Linus Walleij 2023-06-16  152  	mipi_dsi_dcs_write_seq(dsi, 0x1C, 0x04);
f24d88dac9221ea Linus Walleij 2023-06-16  153  	mipi_dsi_dcs_write_seq(dsi, 0x1D, 0x04);
f24d88dac9221ea Linus Walleij 2023-06-16  154  
f24d88dac9221ea Linus Walleij 2023-06-16  155  	mipi_dsi_dcs_write_seq(dsi, 0x1E, 0x0F);
f24d88dac9221ea Linus Walleij 2023-06-16  156  	mipi_dsi_dcs_write_seq(dsi, 0x1F, 0x0F);
f24d88dac9221ea Linus Walleij 2023-06-16  157  
f24d88dac9221ea Linus Walleij 2023-06-16  158  	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x0E);
f24d88dac9221ea Linus Walleij 2023-06-16  159  	mipi_dsi_dcs_write_seq(dsi, 0x21, 0x0E);
f24d88dac9221ea Linus Walleij 2023-06-16  160  
f24d88dac9221ea Linus Walleij 2023-06-16 @161  	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x0D);
f24d88dac9221ea Linus Walleij 2023-06-16  162  	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x0D);
f24d88dac9221ea Linus Walleij 2023-06-16  163  
f24d88dac9221ea Linus Walleij 2023-06-16  164  	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x0C);
f24d88dac9221ea Linus Walleij 2023-06-16  165  	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x0C);
f24d88dac9221ea Linus Walleij 2023-06-16  166  
f24d88dac9221ea Linus Walleij 2023-06-16  167  	mipi_dsi_dcs_write_seq(dsi, 0x26, 0x08);
f24d88dac9221ea Linus Walleij 2023-06-16  168  	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x08);
f24d88dac9221ea Linus Walleij 2023-06-16  169  
f24d88dac9221ea Linus Walleij 2023-06-16  170  	mipi_dsi_dcs_write_seq(dsi, 0x28, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  171  	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  172  	mipi_dsi_dcs_write_seq(dsi, 0x2A, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  173  	mipi_dsi_dcs_write_seq(dsi, 0x2B, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  174  
f24d88dac9221ea Linus Walleij 2023-06-16  175  	mipi_dsi_dcs_write_seq(dsi, 0x2D, 0x20);
f24d88dac9221ea Linus Walleij 2023-06-16  176  	mipi_dsi_dcs_write_seq(dsi, 0x2F, 0x0A);
f24d88dac9221ea Linus Walleij 2023-06-16  177  	mipi_dsi_dcs_write_seq(dsi, 0x30, 0x44);
f24d88dac9221ea Linus Walleij 2023-06-16  178  	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x0C);
f24d88dac9221ea Linus Walleij 2023-06-16  179  	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x32);
f24d88dac9221ea Linus Walleij 2023-06-16  180  
f24d88dac9221ea Linus Walleij 2023-06-16  181  	mipi_dsi_dcs_write_seq(dsi, 0x37, 0x44);
f24d88dac9221ea Linus Walleij 2023-06-16  182  	mipi_dsi_dcs_write_seq(dsi, 0x38, 0x40);
f24d88dac9221ea Linus Walleij 2023-06-16  183  	mipi_dsi_dcs_write_seq(dsi, 0x39, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  184  	mipi_dsi_dcs_write_seq(dsi, 0x3A, 0x5D);
f24d88dac9221ea Linus Walleij 2023-06-16  185  	mipi_dsi_dcs_write_seq(dsi, 0x3B, 0x60);
f24d88dac9221ea Linus Walleij 2023-06-16  186  	mipi_dsi_dcs_write_seq(dsi, 0x3D, 0x42);
f24d88dac9221ea Linus Walleij 2023-06-16  187  	mipi_dsi_dcs_write_seq(dsi, 0x3F, 0x06);
f24d88dac9221ea Linus Walleij 2023-06-16  188  	mipi_dsi_dcs_write_seq(dsi, 0x43, 0x06);
f24d88dac9221ea Linus Walleij 2023-06-16  189  	mipi_dsi_dcs_write_seq(dsi, 0x47, 0x66);
f24d88dac9221ea Linus Walleij 2023-06-16  190  	mipi_dsi_dcs_write_seq(dsi, 0x4A, 0x5D);
f24d88dac9221ea Linus Walleij 2023-06-16  191  	mipi_dsi_dcs_write_seq(dsi, 0x4B, 0x60);
f24d88dac9221ea Linus Walleij 2023-06-16  192  	mipi_dsi_dcs_write_seq(dsi, 0x4C, 0x91);
f24d88dac9221ea Linus Walleij 2023-06-16  193  	mipi_dsi_dcs_write_seq(dsi, 0x4D, 0x21);
f24d88dac9221ea Linus Walleij 2023-06-16  194  	mipi_dsi_dcs_write_seq(dsi, 0x4E, 0x43);
f24d88dac9221ea Linus Walleij 2023-06-16  195  	mipi_dsi_dcs_write_seq(dsi, 0x51, 0x12);
f24d88dac9221ea Linus Walleij 2023-06-16  196  	mipi_dsi_dcs_write_seq(dsi, 0x52, 0x34);
f24d88dac9221ea Linus Walleij 2023-06-16  197  	mipi_dsi_dcs_write_seq(dsi, 0x55, 0x82, 0x02);
f24d88dac9221ea Linus Walleij 2023-06-16  198  	mipi_dsi_dcs_write_seq(dsi, 0x56, 0x04);
f24d88dac9221ea Linus Walleij 2023-06-16  199  	mipi_dsi_dcs_write_seq(dsi, 0x58, 0x21);
f24d88dac9221ea Linus Walleij 2023-06-16  200  	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x30);
f24d88dac9221ea Linus Walleij 2023-06-16  201  	mipi_dsi_dcs_write_seq(dsi, 0x5A, 0x60);
f24d88dac9221ea Linus Walleij 2023-06-16  202  	mipi_dsi_dcs_write_seq(dsi, 0x5B, 0x50);
f24d88dac9221ea Linus Walleij 2023-06-16  203  	mipi_dsi_dcs_write_seq(dsi, 0x5E, 0x00, 0x06);
f24d88dac9221ea Linus Walleij 2023-06-16  204  	mipi_dsi_dcs_write_seq(dsi, 0x5F, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  205  	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x82);
f24d88dac9221ea Linus Walleij 2023-06-16  206  	mipi_dsi_dcs_write_seq(dsi, 0x7E, 0x20);
f24d88dac9221ea Linus Walleij 2023-06-16  207  	mipi_dsi_dcs_write_seq(dsi, 0x7F, 0x3C);
f24d88dac9221ea Linus Walleij 2023-06-16  208  	mipi_dsi_dcs_write_seq(dsi, 0x82, 0x04);
f24d88dac9221ea Linus Walleij 2023-06-16  209  	mipi_dsi_dcs_write_seq(dsi, 0x97, 0xC0);
f24d88dac9221ea Linus Walleij 2023-06-16  210  
f24d88dac9221ea Linus Walleij 2023-06-16  211  	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x05, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  212  	mipi_dsi_dcs_write_seq(dsi, 0x91, 0x44);
f24d88dac9221ea Linus Walleij 2023-06-16  213  	mipi_dsi_dcs_write_seq(dsi, 0x92, 0xA9);
f24d88dac9221ea Linus Walleij 2023-06-16  214  	mipi_dsi_dcs_write_seq(dsi, 0x93, 0x1A);
f24d88dac9221ea Linus Walleij 2023-06-16  215  	mipi_dsi_dcs_write_seq(dsi, 0x94, 0x96);
f24d88dac9221ea Linus Walleij 2023-06-16  216  	mipi_dsi_dcs_write_seq(dsi, 0xD7, 0x55);
f24d88dac9221ea Linus Walleij 2023-06-16  217  	mipi_dsi_dcs_write_seq(dsi, 0xDA, 0x0A);
f24d88dac9221ea Linus Walleij 2023-06-16  218  	mipi_dsi_dcs_write_seq(dsi, 0xDE, 0x08);
f24d88dac9221ea Linus Walleij 2023-06-16  219  	mipi_dsi_dcs_write_seq(dsi, 0xDB, 0x05);
f24d88dac9221ea Linus Walleij 2023-06-16  220  	mipi_dsi_dcs_write_seq(dsi, 0xDC, 0xA9);
f24d88dac9221ea Linus Walleij 2023-06-16  221  	mipi_dsi_dcs_write_seq(dsi, 0xDD, 0x22);
f24d88dac9221ea Linus Walleij 2023-06-16  222  
f24d88dac9221ea Linus Walleij 2023-06-16  223  	mipi_dsi_dcs_write_seq(dsi, 0xDF, 0x05);
f24d88dac9221ea Linus Walleij 2023-06-16  224  	mipi_dsi_dcs_write_seq(dsi, 0xE0, 0xA9);
f24d88dac9221ea Linus Walleij 2023-06-16  225  	mipi_dsi_dcs_write_seq(dsi, 0xE1, 0x05);
f24d88dac9221ea Linus Walleij 2023-06-16  226  	mipi_dsi_dcs_write_seq(dsi, 0xE2, 0xA9);
f24d88dac9221ea Linus Walleij 2023-06-16  227  	mipi_dsi_dcs_write_seq(dsi, 0xE3, 0x05);
f24d88dac9221ea Linus Walleij 2023-06-16  228  	mipi_dsi_dcs_write_seq(dsi, 0xE4, 0xA9);
f24d88dac9221ea Linus Walleij 2023-06-16  229  	mipi_dsi_dcs_write_seq(dsi, 0xE5, 0x05);
f24d88dac9221ea Linus Walleij 2023-06-16  230  	mipi_dsi_dcs_write_seq(dsi, 0xE6, 0xA9);
f24d88dac9221ea Linus Walleij 2023-06-16  231  	mipi_dsi_dcs_write_seq(dsi, 0x5C, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  232  	mipi_dsi_dcs_write_seq(dsi, 0x5D, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  233  	mipi_dsi_dcs_write_seq(dsi, 0x8D, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  234  	mipi_dsi_dcs_write_seq(dsi, 0x8E, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  235  	mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x90);
f24d88dac9221ea Linus Walleij 2023-06-16  236  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x25);
f24d88dac9221ea Linus Walleij 2023-06-16  237  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16  238  	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  239  	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x07);
f24d88dac9221ea Linus Walleij 2023-06-16  240  	mipi_dsi_dcs_write_seq(dsi, 0x1F, 0x60);
f24d88dac9221ea Linus Walleij 2023-06-16  241  	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x50);
f24d88dac9221ea Linus Walleij 2023-06-16  242  	mipi_dsi_dcs_write_seq(dsi, 0x26, 0x60);
f24d88dac9221ea Linus Walleij 2023-06-16  243  	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x50);
f24d88dac9221ea Linus Walleij 2023-06-16  244  	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x60);
f24d88dac9221ea Linus Walleij 2023-06-16  245  	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x50);
f24d88dac9221ea Linus Walleij 2023-06-16  246  	mipi_dsi_dcs_write_seq(dsi, 0x3F, 0xE0);
f24d88dac9221ea Linus Walleij 2023-06-16  247  	mipi_dsi_dcs_write_seq(dsi, 0x40, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  248  	mipi_dsi_dcs_write_seq(dsi, 0x44, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  249  	mipi_dsi_dcs_write_seq(dsi, 0x45, 0x40);
f24d88dac9221ea Linus Walleij 2023-06-16  250  	mipi_dsi_dcs_write_seq(dsi, 0x48, 0x60);
f24d88dac9221ea Linus Walleij 2023-06-16  251  	mipi_dsi_dcs_write_seq(dsi, 0x49, 0x50);
f24d88dac9221ea Linus Walleij 2023-06-16  252  	mipi_dsi_dcs_write_seq(dsi, 0x5B, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  253  	mipi_dsi_dcs_write_seq(dsi, 0x5C, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  254  	mipi_dsi_dcs_write_seq(dsi, 0x5D, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  255  	mipi_dsi_dcs_write_seq(dsi, 0x5E, 0xD0);
f24d88dac9221ea Linus Walleij 2023-06-16  256  	mipi_dsi_dcs_write_seq(dsi, 0x61, 0x60);
f24d88dac9221ea Linus Walleij 2023-06-16  257  	mipi_dsi_dcs_write_seq(dsi, 0x62, 0x50);
f24d88dac9221ea Linus Walleij 2023-06-16  258  	mipi_dsi_dcs_write_seq(dsi, 0xF1, 0x10);
f24d88dac9221ea Linus Walleij 2023-06-16  259  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x2A);
f24d88dac9221ea Linus Walleij 2023-06-16  260  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16  261  
f24d88dac9221ea Linus Walleij 2023-06-16  262  	mipi_dsi_dcs_write_seq(dsi, 0x64, 0x16);
f24d88dac9221ea Linus Walleij 2023-06-16  263  	mipi_dsi_dcs_write_seq(dsi, 0x67, 0x16);
f24d88dac9221ea Linus Walleij 2023-06-16  264  	mipi_dsi_dcs_write_seq(dsi, 0x6A, 0x16);
f24d88dac9221ea Linus Walleij 2023-06-16  265  
f24d88dac9221ea Linus Walleij 2023-06-16  266  	mipi_dsi_dcs_write_seq(dsi, 0x70, 0x30);
f24d88dac9221ea Linus Walleij 2023-06-16  267  
f24d88dac9221ea Linus Walleij 2023-06-16  268  	mipi_dsi_dcs_write_seq(dsi, 0xA2, 0xF3);
f24d88dac9221ea Linus Walleij 2023-06-16  269  	mipi_dsi_dcs_write_seq(dsi, 0xA3, 0xFF);
f24d88dac9221ea Linus Walleij 2023-06-16  270  	mipi_dsi_dcs_write_seq(dsi, 0xA4, 0xFF);
f24d88dac9221ea Linus Walleij 2023-06-16  271  	mipi_dsi_dcs_write_seq(dsi, 0xA5, 0xFF);
f24d88dac9221ea Linus Walleij 2023-06-16  272  
f24d88dac9221ea Linus Walleij 2023-06-16  273  	mipi_dsi_dcs_write_seq(dsi, 0xD6, 0x08);
f24d88dac9221ea Linus Walleij 2023-06-16  274  
f24d88dac9221ea Linus Walleij 2023-06-16  275  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x26);
f24d88dac9221ea Linus Walleij 2023-06-16  276  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16  277  	mipi_dsi_dcs_write_seq(dsi, 0x00, 0xA1);
f24d88dac9221ea Linus Walleij 2023-06-16  278  
f24d88dac9221ea Linus Walleij 2023-06-16  279  	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x31);
f24d88dac9221ea Linus Walleij 2023-06-16  280  	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x28);
f24d88dac9221ea Linus Walleij 2023-06-16  281  	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x30);
f24d88dac9221ea Linus Walleij 2023-06-16  282  	mipi_dsi_dcs_write_seq(dsi, 0x0C, 0x16);
f24d88dac9221ea Linus Walleij 2023-06-16  283  	mipi_dsi_dcs_write_seq(dsi, 0x0D, 0x0D);
f24d88dac9221ea Linus Walleij 2023-06-16  284  	mipi_dsi_dcs_write_seq(dsi, 0x0F, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  285  	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  286  	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x50);
f24d88dac9221ea Linus Walleij 2023-06-16  287  	mipi_dsi_dcs_write_seq(dsi, 0x13, 0x56);
f24d88dac9221ea Linus Walleij 2023-06-16  288  	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x57);
f24d88dac9221ea Linus Walleij 2023-06-16  289  	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  290  	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x10);
f24d88dac9221ea Linus Walleij 2023-06-16  291  	mipi_dsi_dcs_write_seq(dsi, 0x17, 0xA0);
f24d88dac9221ea Linus Walleij 2023-06-16  292  	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x86);
f24d88dac9221ea Linus Walleij 2023-06-16  293  	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x0D);
f24d88dac9221ea Linus Walleij 2023-06-16  294  	mipi_dsi_dcs_write_seq(dsi, 0x1A, 0x7F);
f24d88dac9221ea Linus Walleij 2023-06-16  295  	mipi_dsi_dcs_write_seq(dsi, 0x1B, 0x0C);
f24d88dac9221ea Linus Walleij 2023-06-16  296  	mipi_dsi_dcs_write_seq(dsi, 0x1C, 0xBF);
f24d88dac9221ea Linus Walleij 2023-06-16  297  	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  298  	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  299  	mipi_dsi_dcs_write_seq(dsi, 0x2A, 0x0D);
f24d88dac9221ea Linus Walleij 2023-06-16  300  	mipi_dsi_dcs_write_seq(dsi, 0x2B, 0x7F);
f24d88dac9221ea Linus Walleij 2023-06-16  301  
f24d88dac9221ea Linus Walleij 2023-06-16  302  	mipi_dsi_dcs_write_seq(dsi, 0x1D, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  303  	mipi_dsi_dcs_write_seq(dsi, 0x1E, 0x65);
f24d88dac9221ea Linus Walleij 2023-06-16  304  	mipi_dsi_dcs_write_seq(dsi, 0x1F, 0x65);
f24d88dac9221ea Linus Walleij 2023-06-16  305  	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  306  	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x65);
f24d88dac9221ea Linus Walleij 2023-06-16  307  	mipi_dsi_dcs_write_seq(dsi, 0x2F, 0x05);
f24d88dac9221ea Linus Walleij 2023-06-16  308  	mipi_dsi_dcs_write_seq(dsi, 0x30, 0x65);
f24d88dac9221ea Linus Walleij 2023-06-16  309  	mipi_dsi_dcs_write_seq(dsi, 0x31, 0x05);
f24d88dac9221ea Linus Walleij 2023-06-16  310  	mipi_dsi_dcs_write_seq(dsi, 0x32, 0x7D);
f24d88dac9221ea Linus Walleij 2023-06-16  311  	mipi_dsi_dcs_write_seq(dsi, 0x39, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  312  	mipi_dsi_dcs_write_seq(dsi, 0x3A, 0x65);
f24d88dac9221ea Linus Walleij 2023-06-16  313  	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16  314  	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x11);
f24d88dac9221ea Linus Walleij 2023-06-16  315  	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x78);
f24d88dac9221ea Linus Walleij 2023-06-16  316  	mipi_dsi_dcs_write_seq(dsi, 0x35, 0x16);
f24d88dac9221ea Linus Walleij 2023-06-16  317  	mipi_dsi_dcs_write_seq(dsi, 0xC8, 0x04);
f24d88dac9221ea Linus Walleij 2023-06-16  318  	mipi_dsi_dcs_write_seq(dsi, 0xC9, 0x9E);
f24d88dac9221ea Linus Walleij 2023-06-16  319  	mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x4E);
f24d88dac9221ea Linus Walleij 2023-06-16  320  	mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  321  
f24d88dac9221ea Linus Walleij 2023-06-16  322  	mipi_dsi_dcs_write_seq(dsi, 0xA9, 0x49);
f24d88dac9221ea Linus Walleij 2023-06-16  323  	mipi_dsi_dcs_write_seq(dsi, 0xAA, 0x4B);
f24d88dac9221ea Linus Walleij 2023-06-16  324  	mipi_dsi_dcs_write_seq(dsi, 0xAB, 0x48);
f24d88dac9221ea Linus Walleij 2023-06-16  325  	mipi_dsi_dcs_write_seq(dsi, 0xAC, 0x43);
f24d88dac9221ea Linus Walleij 2023-06-16  326  	mipi_dsi_dcs_write_seq(dsi, 0xAD, 0x40);
f24d88dac9221ea Linus Walleij 2023-06-16  327  	mipi_dsi_dcs_write_seq(dsi, 0xAE, 0x50);
f24d88dac9221ea Linus Walleij 2023-06-16  328  	mipi_dsi_dcs_write_seq(dsi, 0xAF, 0x44);
f24d88dac9221ea Linus Walleij 2023-06-16  329  	mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x54);
f24d88dac9221ea Linus Walleij 2023-06-16  330  	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x4E);
f24d88dac9221ea Linus Walleij 2023-06-16  331  	mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x4D);
f24d88dac9221ea Linus Walleij 2023-06-16  332  	mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x4C);
f24d88dac9221ea Linus Walleij 2023-06-16  333  	mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x41);
f24d88dac9221ea Linus Walleij 2023-06-16  334  	mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x47);
f24d88dac9221ea Linus Walleij 2023-06-16  335  	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x53);
f24d88dac9221ea Linus Walleij 2023-06-16  336  	mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x3E);
f24d88dac9221ea Linus Walleij 2023-06-16  337  	mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x51);
f24d88dac9221ea Linus Walleij 2023-06-16  338  	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x3C);
f24d88dac9221ea Linus Walleij 2023-06-16  339  	mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x3B);
f24d88dac9221ea Linus Walleij 2023-06-16  340  	mipi_dsi_dcs_write_seq(dsi, 0xBB, 0x46);
f24d88dac9221ea Linus Walleij 2023-06-16  341  	mipi_dsi_dcs_write_seq(dsi, 0xBC, 0x45);
f24d88dac9221ea Linus Walleij 2023-06-16  342  	mipi_dsi_dcs_write_seq(dsi, 0xBD, 0x55);
f24d88dac9221ea Linus Walleij 2023-06-16  343  	mipi_dsi_dcs_write_seq(dsi, 0xBE, 0x3D);
f24d88dac9221ea Linus Walleij 2023-06-16  344  	mipi_dsi_dcs_write_seq(dsi, 0xBF, 0x3F);
f24d88dac9221ea Linus Walleij 2023-06-16  345  	mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x52);
f24d88dac9221ea Linus Walleij 2023-06-16  346  	mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x4A);
f24d88dac9221ea Linus Walleij 2023-06-16  347  	mipi_dsi_dcs_write_seq(dsi, 0xC2, 0x39);
f24d88dac9221ea Linus Walleij 2023-06-16  348  	mipi_dsi_dcs_write_seq(dsi, 0xC3, 0x4F);
f24d88dac9221ea Linus Walleij 2023-06-16  349  	mipi_dsi_dcs_write_seq(dsi, 0xC4, 0x3A);
f24d88dac9221ea Linus Walleij 2023-06-16  350  	mipi_dsi_dcs_write_seq(dsi, 0xC5, 0x42);
f24d88dac9221ea Linus Walleij 2023-06-16  351  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x27);
f24d88dac9221ea Linus Walleij 2023-06-16  352  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16  353  
f24d88dac9221ea Linus Walleij 2023-06-16  354  	mipi_dsi_dcs_write_seq(dsi, 0x56, 0x06);
f24d88dac9221ea Linus Walleij 2023-06-16  355  	mipi_dsi_dcs_write_seq(dsi, 0x58, 0x80);
f24d88dac9221ea Linus Walleij 2023-06-16  356  	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x75);
f24d88dac9221ea Linus Walleij 2023-06-16  357  	mipi_dsi_dcs_write_seq(dsi, 0x5A, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  358  	mipi_dsi_dcs_write_seq(dsi, 0x5B, 0x02);
f24d88dac9221ea Linus Walleij 2023-06-16  359  	mipi_dsi_dcs_write_seq(dsi, 0x5C, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  360  	mipi_dsi_dcs_write_seq(dsi, 0x5D, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  361  	mipi_dsi_dcs_write_seq(dsi, 0x5E, 0x20);
f24d88dac9221ea Linus Walleij 2023-06-16  362  	mipi_dsi_dcs_write_seq(dsi, 0x5F, 0x10);
f24d88dac9221ea Linus Walleij 2023-06-16  363  	mipi_dsi_dcs_write_seq(dsi, 0x60, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  364  	mipi_dsi_dcs_write_seq(dsi, 0x61, 0x2E);
f24d88dac9221ea Linus Walleij 2023-06-16  365  	mipi_dsi_dcs_write_seq(dsi, 0x62, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  366  	mipi_dsi_dcs_write_seq(dsi, 0x63, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16  367  	mipi_dsi_dcs_write_seq(dsi, 0x64, 0x43);
f24d88dac9221ea Linus Walleij 2023-06-16  368  	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x2D);
f24d88dac9221ea Linus Walleij 2023-06-16  369  	mipi_dsi_dcs_write_seq(dsi, 0x66, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  370  	mipi_dsi_dcs_write_seq(dsi, 0x67, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16  371  	mipi_dsi_dcs_write_seq(dsi, 0x68, 0x44);
f24d88dac9221ea Linus Walleij 2023-06-16  372  
f24d88dac9221ea Linus Walleij 2023-06-16  373  	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  374  	mipi_dsi_dcs_write_seq(dsi, 0x78, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  375  	mipi_dsi_dcs_write_seq(dsi, 0xC3, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  376  
f24d88dac9221ea Linus Walleij 2023-06-16  377  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x2A);
f24d88dac9221ea Linus Walleij 2023-06-16  378  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16  379  
f24d88dac9221ea Linus Walleij 2023-06-16  380  	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x2F);
f24d88dac9221ea Linus Walleij 2023-06-16  381  	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x08);
f24d88dac9221ea Linus Walleij 2023-06-16  382  
f24d88dac9221ea Linus Walleij 2023-06-16  383  	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  384  	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x65);
f24d88dac9221ea Linus Walleij 2023-06-16  385  	mipi_dsi_dcs_write_seq(dsi, 0x26, 0xF8);
f24d88dac9221ea Linus Walleij 2023-06-16  386  	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  387  	mipi_dsi_dcs_write_seq(dsi, 0x28, 0x1A);
f24d88dac9221ea Linus Walleij 2023-06-16  388  	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  389  	mipi_dsi_dcs_write_seq(dsi, 0x2A, 0x1A);
f24d88dac9221ea Linus Walleij 2023-06-16  390  	mipi_dsi_dcs_write_seq(dsi, 0x2B, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  391  	mipi_dsi_dcs_write_seq(dsi, 0x2D, 0x1A);
f24d88dac9221ea Linus Walleij 2023-06-16  392  
f24d88dac9221ea Linus Walleij 2023-06-16  393  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x23);
f24d88dac9221ea Linus Walleij 2023-06-16  394  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16  395  
f24d88dac9221ea Linus Walleij 2023-06-16  396  	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x80);
f24d88dac9221ea Linus Walleij 2023-06-16  397  	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  398  
f24d88dac9221ea Linus Walleij 2023-06-16  399  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0xE0);
f24d88dac9221ea Linus Walleij 2023-06-16  400  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16  401  	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x60);
f24d88dac9221ea Linus Walleij 2023-06-16  402  	mipi_dsi_dcs_write_seq(dsi, 0x16, 0xC0);
f24d88dac9221ea Linus Walleij 2023-06-16  403  
f24d88dac9221ea Linus Walleij 2023-06-16  404  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0xF0);
f24d88dac9221ea Linus Walleij 2023-06-16  405  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16  406  	mipi_dsi_dcs_write_seq(dsi, 0x3A, 0x08);
f24d88dac9221ea Linus Walleij 2023-06-16  407  
f24d88dac9221ea Linus Walleij 2023-06-16  408  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x10);
f24d88dac9221ea Linus Walleij 2023-06-16  409  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16  410  	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16  411  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x20);
f24d88dac9221ea Linus Walleij 2023-06-16  412  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16  413  	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x40);
f24d88dac9221ea Linus Walleij 2023-06-16  414  
f24d88dac9221ea Linus Walleij 2023-06-16  415  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x10);
f24d88dac9221ea Linus Walleij 2023-06-16  416  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
f24d88dac9221ea Linus Walleij 2023-06-16  417  	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x02);
f24d88dac9221ea Linus Walleij 2023-06-16  418  	mipi_dsi_dcs_write_seq(dsi, 0x35, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  419  	mipi_dsi_dcs_write_seq(dsi, 0x51, 0x00, 0xFF);
f24d88dac9221ea Linus Walleij 2023-06-16  420  	mipi_dsi_dcs_write_seq(dsi, 0x53, 0x24);
f24d88dac9221ea Linus Walleij 2023-06-16  421  	mipi_dsi_dcs_write_seq(dsi, 0x55, 0x00);
f24d88dac9221ea Linus Walleij 2023-06-16  422  	mipi_dsi_dcs_write_seq(dsi, 0xBB, 0x13);
f24d88dac9221ea Linus Walleij 2023-06-16  423  	mipi_dsi_dcs_write_seq(dsi, 0x3B, 0x03, 0x96, 0x1A, 0x04, 0x04);
f24d88dac9221ea Linus Walleij 2023-06-16  424  	msleep(100);
f24d88dac9221ea Linus Walleij 2023-06-16  425  	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
f24d88dac9221ea Linus Walleij 2023-06-16  426  	if (ret)
f24d88dac9221ea Linus Walleij 2023-06-16  427  		return ret;
f24d88dac9221ea Linus Walleij 2023-06-16  428  	msleep(200);
f24d88dac9221ea Linus Walleij 2023-06-16  429  	ret = mipi_dsi_dcs_set_display_on(dsi);
f24d88dac9221ea Linus Walleij 2023-06-16  430  	if (ret)
f24d88dac9221ea Linus Walleij 2023-06-16  431  		return ret;
f24d88dac9221ea Linus Walleij 2023-06-16  432  	msleep(100);
93ee1a2c0f08345 yangcong      2021-09-14  433  
f24d88dac9221ea Linus Walleij 2023-06-16  434  	return 0;
f24d88dac9221ea Linus Walleij 2023-06-16  435  }
a869b9db7adf3bd Jitao Shi     2020-01-16  436  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
