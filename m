Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B714CEC7
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jul 2023 06:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688451044; x=1719987044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dFG3MKSIbPoU5Pn0i45xcqp/kmjFq4+uT24dOtF8VRo=;
  b=SKpeg9xdBttbBOExPwkx3LOZ3KPvVIiaQpuB/VlGo2DhS3BWLta+9Ul0
   ViTJXFyYCvvnI9ZcShxON0mZBHeQ59MTjZhMkY9+KjyNE5HzFXFXDITP+
   VARecKOo0bAWIDUdlVcD4C4slUmryTlWQc2QEWwYH1Fow9twFQR+o59Ss
   kGfsNL3af25/XSSy1wyU5Sch5aAI6Fl6lXKV5Z3SaxAotuS/2Mz0DFXFw
   ZrKFUVNzBGydjmwqYsvJmbwj7XkRr68gWiNzI3+31mWECSZXot9wAvj6z
   8s3xVC5/5ZqpTyKFk6XqwK4hzx7ws1EFRkbnl2Ft+4uaYJFY1Wa792gl+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="363081352"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="363081352"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 23:10:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="748314740"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="748314740"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Jul 2023 23:10:37 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGZFE-000Hwf-0Q;
	Tue, 04 Jul 2023 06:10:36 +0000
Date: Tue, 4 Jul 2023 14:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 1/4] drm/panel: boe-tv101wum-nl6: Drop macros and open
 code sequences
Message-ID: <202307041422.SzQw0jR1-lkp@intel.com>
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
In-Reply-To: <20230703-fix-boe-tv101wum-nl6-v3-1-bd6e9432c755@linaro.org>
References: <20230703-fix-boe-tv101wum-nl6-v3-1-bd6e9432c755@linaro.org>
TO: Linus Walleij <linus.walleij@linaro.org>

Hi Linus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 14806c6415820b1c4bc317655c40784d050a2edb]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/drm-panel-boe-tv101wum-nl6-Drop-macros-and-open-code-sequences/20230703-212315
base:   14806c6415820b1c4bc317655c40784d050a2edb
patch link:    https://lore.kernel.org/r/20230703-fix-boe-tv101wum-nl6-v3-1-bd6e9432c755%40linaro.org
patch subject: [PATCH v3 1/4] drm/panel: boe-tv101wum-nl6: Drop macros and open code sequences
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-m021-20230703 (https://download.01.org/0day-ci/archive/20230704/202307041422.SzQw0jR1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041422.SzQw0jR1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307041422.SzQw0jR1-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c:168 boe_tv110c9m_init() warn: Function too hairy.  No more merges.
drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c:525 inx_hj110iz_init() warn: Function too hairy.  No more merges.
drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c:863 boe_init() warn: Function too hairy.  No more merges.
drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c:1228 starry_qfh032011_53g_init() warn: Function too hairy.  No more merges.

Old smatch warnings:
drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c:1454 starry_ili9882t_init() warn: Function too hairy.  No more merges.

vim +168 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c

a869b9db7adf3b Jitao Shi     2020-01-16   57  
5c468773299243 Linus Walleij 2023-07-03   58  static int boe_tv110c9m_init(struct mipi_dsi_device *dsi)
5c468773299243 Linus Walleij 2023-07-03   59  {
5c468773299243 Linus Walleij 2023-07-03   60  	int ret;
a869b9db7adf3b Jitao Shi     2020-01-16   61  
5c468773299243 Linus Walleij 2023-07-03   62  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x20);
5c468773299243 Linus Walleij 2023-07-03   63  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
5c468773299243 Linus Walleij 2023-07-03   64  	mipi_dsi_dcs_write_seq(dsi, 0x05, 0xD9);
5c468773299243 Linus Walleij 2023-07-03   65  	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x78);
5c468773299243 Linus Walleij 2023-07-03   66  	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x5A);
5c468773299243 Linus Walleij 2023-07-03   67  	mipi_dsi_dcs_write_seq(dsi, 0x0D, 0x63);
5c468773299243 Linus Walleij 2023-07-03   68  	mipi_dsi_dcs_write_seq(dsi, 0x0E, 0x91);
5c468773299243 Linus Walleij 2023-07-03   69  	mipi_dsi_dcs_write_seq(dsi, 0x0F, 0x73);
5c468773299243 Linus Walleij 2023-07-03   70  	mipi_dsi_dcs_write_seq(dsi, 0x95, 0xE6);
5c468773299243 Linus Walleij 2023-07-03   71  	mipi_dsi_dcs_write_seq(dsi, 0x96, 0xF0);
5c468773299243 Linus Walleij 2023-07-03   72  	mipi_dsi_dcs_write_seq(dsi, 0x30, 0x00);
5c468773299243 Linus Walleij 2023-07-03   73  	mipi_dsi_dcs_write_seq(dsi, 0x6D, 0x66);
5c468773299243 Linus Walleij 2023-07-03   74  	mipi_dsi_dcs_write_seq(dsi, 0x75, 0xA2);
5c468773299243 Linus Walleij 2023-07-03   75  	mipi_dsi_dcs_write_seq(dsi, 0x77, 0x3B);
a869b9db7adf3b Jitao Shi     2020-01-16   76  
5c468773299243 Linus Walleij 2023-07-03   77  	mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4D, 0x00, 0x6D, 0x00, 0x89, 0x00, 0xA1, 0x00, 0xB6, 0x00, 0xC9);
5c468773299243 Linus Walleij 2023-07-03   78  	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x00, 0xDA, 0x01, 0x13, 0x01, 0x3C, 0x01, 0x7E, 0x01, 0xAB, 0x01, 0xF7, 0x02, 0x2F, 0x02, 0x31);
5c468773299243 Linus Walleij 2023-07-03   79  	mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x02, 0x67, 0x02, 0xA6, 0x02, 0xD1, 0x03, 0x08, 0x03, 0x2E, 0x03, 0x5B, 0x03, 0x6B, 0x03, 0x7B);
5c468773299243 Linus Walleij 2023-07-03   80  	mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x03, 0x8E, 0x03, 0xA2, 0x03, 0xB7, 0x03, 0xE7, 0x03, 0xFD, 0x03, 0xFF);
93ee1a2c0f0834 yangcong      2021-09-14   81  
5c468773299243 Linus Walleij 2023-07-03   82  	mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4D, 0x00, 0x6D, 0x00, 0x89, 0x00, 0xA1, 0x00, 0xB6, 0x00, 0xC9);
5c468773299243 Linus Walleij 2023-07-03   83  	mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x00, 0xDA, 0x01, 0x13, 0x01, 0x3C, 0x01, 0x7E, 0x01, 0xAB, 0x01, 0xF7, 0x02, 0x2F, 0x02, 0x31);
5c468773299243 Linus Walleij 2023-07-03   84  	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x02, 0x67, 0x02, 0xA6, 0x02, 0xD1, 0x03, 0x08, 0x03, 0x2E, 0x03, 0x5B, 0x03, 0x6B, 0x03, 0x7B);
5c468773299243 Linus Walleij 2023-07-03   85  	mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x03, 0x8E, 0x03, 0xA2, 0x03, 0xB7, 0x03, 0xE7, 0x03, 0xFD, 0x03, 0xFF);
5c468773299243 Linus Walleij 2023-07-03   86  	mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4D, 0x00, 0x6D, 0x00, 0x89, 0x00, 0xA1, 0x00, 0xB6, 0x00, 0xC9);
5c468773299243 Linus Walleij 2023-07-03   87  	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x00, 0xDA, 0x01, 0x13, 0x01, 0x3C, 0x01, 0x7E, 0x01, 0xAB, 0x01, 0xF7, 0x02, 0x2F, 0x02, 0x31);
5c468773299243 Linus Walleij 2023-07-03   88  	mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x02, 0x67, 0x02, 0xA6, 0x02, 0xD1, 0x03, 0x08, 0x03, 0x2E, 0x03, 0x5B, 0x03, 0x6B, 0x03, 0x7B);
5c468773299243 Linus Walleij 2023-07-03   89  	mipi_dsi_dcs_write_seq(dsi, 0xBB, 0x03, 0x8E, 0x03, 0xA2, 0x03, 0xB7, 0x03, 0xE7, 0x03, 0xFD, 0x03, 0xFF);
5c468773299243 Linus Walleij 2023-07-03   90  
5c468773299243 Linus Walleij 2023-07-03   91  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x21);
5c468773299243 Linus Walleij 2023-07-03   92  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
5c468773299243 Linus Walleij 2023-07-03   93  
5c468773299243 Linus Walleij 2023-07-03   94  	mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00, 0x99, 0x00, 0xAE, 0x00, 0xC1);
5c468773299243 Linus Walleij 2023-07-03   95  	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x00, 0xD2, 0x01, 0x0B, 0x01, 0x34, 0x01, 0x76, 0x01, 0xA3, 0x01, 0xEF, 0x02, 0x27, 0x02, 0x29);
5c468773299243 Linus Walleij 2023-07-03   96  	mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x02, 0x5F, 0x02, 0x9E, 0x02, 0xC9, 0x03, 0x00, 0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
5c468773299243 Linus Walleij 2023-07-03   97  
5c468773299243 Linus Walleij 2023-07-03   98  	mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xAF, 0x03, 0xDF, 0x03, 0xF5, 0x03, 0xE0);
5c468773299243 Linus Walleij 2023-07-03   99  	mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00, 0x99, 0x00, 0xAE, 0x00, 0xC1);
5c468773299243 Linus Walleij 2023-07-03  100  	mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x00, 0xD2, 0x01, 0x0B, 0x01, 0x34, 0x01, 0x76, 0x01, 0xA3, 0x01, 0xEF, 0x02, 0x27, 0x02, 0x29);
5c468773299243 Linus Walleij 2023-07-03  101  	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x02, 0x5F, 0x02, 0x9E, 0x02, 0xC9, 0x03, 0x00, 0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
5c468773299243 Linus Walleij 2023-07-03  102  	mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xAF, 0x03, 0xDF, 0x03, 0xF5, 0x03, 0xE0);
5c468773299243 Linus Walleij 2023-07-03  103  
5c468773299243 Linus Walleij 2023-07-03  104  	mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00, 0x99, 0x00, 0xAE, 0x00, 0xC1);
5c468773299243 Linus Walleij 2023-07-03  105  	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x00, 0xD2, 0x01, 0x0B, 0x01, 0x34, 0x01, 0x76, 0x01, 0xA3, 0x01, 0xEF, 0x02, 0x27, 0x02, 0x29);
5c468773299243 Linus Walleij 2023-07-03  106  	mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x02, 0x5F, 0x02, 0x9E, 0x02, 0xC9, 0x03, 0x00, 0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
5c468773299243 Linus Walleij 2023-07-03  107  
5c468773299243 Linus Walleij 2023-07-03  108  	mipi_dsi_dcs_write_seq(dsi, 0xBB, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xAF, 0x03, 0xDF, 0x03, 0xF5, 0x03, 0xE0);
5c468773299243 Linus Walleij 2023-07-03  109  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x24);
5c468773299243 Linus Walleij 2023-07-03  110  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
5c468773299243 Linus Walleij 2023-07-03  111  
5c468773299243 Linus Walleij 2023-07-03  112  	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x00);
5c468773299243 Linus Walleij 2023-07-03  113  	mipi_dsi_dcs_write_seq(dsi, 0x01, 0x00);
5c468773299243 Linus Walleij 2023-07-03  114  
5c468773299243 Linus Walleij 2023-07-03  115  	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x1C);
5c468773299243 Linus Walleij 2023-07-03  116  	mipi_dsi_dcs_write_seq(dsi, 0x03, 0x1C);
5c468773299243 Linus Walleij 2023-07-03  117  
5c468773299243 Linus Walleij 2023-07-03  118  	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x1D);
5c468773299243 Linus Walleij 2023-07-03  119  	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x1D);
5c468773299243 Linus Walleij 2023-07-03  120  
5c468773299243 Linus Walleij 2023-07-03  121  	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x04);
5c468773299243 Linus Walleij 2023-07-03  122  	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x04);
5c468773299243 Linus Walleij 2023-07-03  123  
5c468773299243 Linus Walleij 2023-07-03  124  	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x0F);
5c468773299243 Linus Walleij 2023-07-03  125  	mipi_dsi_dcs_write_seq(dsi, 0x09, 0x0F);
5c468773299243 Linus Walleij 2023-07-03  126  
5c468773299243 Linus Walleij 2023-07-03  127  	mipi_dsi_dcs_write_seq(dsi, 0x0A, 0x0E);
5c468773299243 Linus Walleij 2023-07-03  128  	mipi_dsi_dcs_write_seq(dsi, 0x0B, 0x0E);
5c468773299243 Linus Walleij 2023-07-03  129  
5c468773299243 Linus Walleij 2023-07-03  130  	mipi_dsi_dcs_write_seq(dsi, 0x0C, 0x0D);
5c468773299243 Linus Walleij 2023-07-03  131  	mipi_dsi_dcs_write_seq(dsi, 0x0D, 0x0D);
5c468773299243 Linus Walleij 2023-07-03  132  
5c468773299243 Linus Walleij 2023-07-03  133  	mipi_dsi_dcs_write_seq(dsi, 0x0E, 0x0C);
5c468773299243 Linus Walleij 2023-07-03  134  	mipi_dsi_dcs_write_seq(dsi, 0x0F, 0x0C);
5c468773299243 Linus Walleij 2023-07-03  135  
5c468773299243 Linus Walleij 2023-07-03  136  	mipi_dsi_dcs_write_seq(dsi, 0x10, 0x08);
5c468773299243 Linus Walleij 2023-07-03  137  	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x08);
5c468773299243 Linus Walleij 2023-07-03  138  
5c468773299243 Linus Walleij 2023-07-03  139  	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x00);
5c468773299243 Linus Walleij 2023-07-03  140  	mipi_dsi_dcs_write_seq(dsi, 0x13, 0x00);
5c468773299243 Linus Walleij 2023-07-03  141  	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x00);
5c468773299243 Linus Walleij 2023-07-03  142  	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x00);
5c468773299243 Linus Walleij 2023-07-03  143  
5c468773299243 Linus Walleij 2023-07-03  144  	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x00);
5c468773299243 Linus Walleij 2023-07-03  145  	mipi_dsi_dcs_write_seq(dsi, 0x17, 0x00);
5c468773299243 Linus Walleij 2023-07-03  146  
5c468773299243 Linus Walleij 2023-07-03  147  	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x1C);
5c468773299243 Linus Walleij 2023-07-03  148  	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x1C);
5c468773299243 Linus Walleij 2023-07-03  149  
5c468773299243 Linus Walleij 2023-07-03  150  	mipi_dsi_dcs_write_seq(dsi, 0x1A, 0x1D);
5c468773299243 Linus Walleij 2023-07-03  151  	mipi_dsi_dcs_write_seq(dsi, 0x1B, 0x1D);
5c468773299243 Linus Walleij 2023-07-03  152  
5c468773299243 Linus Walleij 2023-07-03  153  	mipi_dsi_dcs_write_seq(dsi, 0x1C, 0x04);
5c468773299243 Linus Walleij 2023-07-03  154  	mipi_dsi_dcs_write_seq(dsi, 0x1D, 0x04);
5c468773299243 Linus Walleij 2023-07-03  155  
5c468773299243 Linus Walleij 2023-07-03  156  	mipi_dsi_dcs_write_seq(dsi, 0x1E, 0x0F);
5c468773299243 Linus Walleij 2023-07-03  157  	mipi_dsi_dcs_write_seq(dsi, 0x1F, 0x0F);
5c468773299243 Linus Walleij 2023-07-03  158  
5c468773299243 Linus Walleij 2023-07-03  159  	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x0E);
5c468773299243 Linus Walleij 2023-07-03  160  	mipi_dsi_dcs_write_seq(dsi, 0x21, 0x0E);
5c468773299243 Linus Walleij 2023-07-03  161  
5c468773299243 Linus Walleij 2023-07-03  162  	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x0D);
5c468773299243 Linus Walleij 2023-07-03  163  	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x0D);
5c468773299243 Linus Walleij 2023-07-03  164  
5c468773299243 Linus Walleij 2023-07-03  165  	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x0C);
5c468773299243 Linus Walleij 2023-07-03  166  	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x0C);
5c468773299243 Linus Walleij 2023-07-03  167  
5c468773299243 Linus Walleij 2023-07-03 @168  	mipi_dsi_dcs_write_seq(dsi, 0x26, 0x08);
5c468773299243 Linus Walleij 2023-07-03  169  	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x08);
5c468773299243 Linus Walleij 2023-07-03  170  
5c468773299243 Linus Walleij 2023-07-03  171  	mipi_dsi_dcs_write_seq(dsi, 0x28, 0x00);
5c468773299243 Linus Walleij 2023-07-03  172  	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x00);
5c468773299243 Linus Walleij 2023-07-03  173  	mipi_dsi_dcs_write_seq(dsi, 0x2A, 0x00);
5c468773299243 Linus Walleij 2023-07-03  174  	mipi_dsi_dcs_write_seq(dsi, 0x2B, 0x00);
5c468773299243 Linus Walleij 2023-07-03  175  
5c468773299243 Linus Walleij 2023-07-03  176  	mipi_dsi_dcs_write_seq(dsi, 0x2D, 0x20);
5c468773299243 Linus Walleij 2023-07-03  177  	mipi_dsi_dcs_write_seq(dsi, 0x2F, 0x0A);
5c468773299243 Linus Walleij 2023-07-03  178  	mipi_dsi_dcs_write_seq(dsi, 0x30, 0x44);
5c468773299243 Linus Walleij 2023-07-03  179  	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x0C);
5c468773299243 Linus Walleij 2023-07-03  180  	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x32);
5c468773299243 Linus Walleij 2023-07-03  181  
5c468773299243 Linus Walleij 2023-07-03  182  	mipi_dsi_dcs_write_seq(dsi, 0x37, 0x44);
5c468773299243 Linus Walleij 2023-07-03  183  	mipi_dsi_dcs_write_seq(dsi, 0x38, 0x40);
5c468773299243 Linus Walleij 2023-07-03  184  	mipi_dsi_dcs_write_seq(dsi, 0x39, 0x00);
5c468773299243 Linus Walleij 2023-07-03  185  	mipi_dsi_dcs_write_seq(dsi, 0x3A, 0x5D);
5c468773299243 Linus Walleij 2023-07-03  186  	mipi_dsi_dcs_write_seq(dsi, 0x3B, 0x60);
5c468773299243 Linus Walleij 2023-07-03  187  	mipi_dsi_dcs_write_seq(dsi, 0x3D, 0x42);
5c468773299243 Linus Walleij 2023-07-03  188  	mipi_dsi_dcs_write_seq(dsi, 0x3F, 0x06);
5c468773299243 Linus Walleij 2023-07-03  189  	mipi_dsi_dcs_write_seq(dsi, 0x43, 0x06);
5c468773299243 Linus Walleij 2023-07-03  190  	mipi_dsi_dcs_write_seq(dsi, 0x47, 0x66);
5c468773299243 Linus Walleij 2023-07-03  191  	mipi_dsi_dcs_write_seq(dsi, 0x4A, 0x5D);
5c468773299243 Linus Walleij 2023-07-03  192  	mipi_dsi_dcs_write_seq(dsi, 0x4B, 0x60);
5c468773299243 Linus Walleij 2023-07-03  193  	mipi_dsi_dcs_write_seq(dsi, 0x4C, 0x91);
5c468773299243 Linus Walleij 2023-07-03  194  	mipi_dsi_dcs_write_seq(dsi, 0x4D, 0x21);
5c468773299243 Linus Walleij 2023-07-03  195  	mipi_dsi_dcs_write_seq(dsi, 0x4E, 0x43);
5c468773299243 Linus Walleij 2023-07-03  196  	mipi_dsi_dcs_write_seq(dsi, 0x51, 0x12);
5c468773299243 Linus Walleij 2023-07-03  197  	mipi_dsi_dcs_write_seq(dsi, 0x52, 0x34);
5c468773299243 Linus Walleij 2023-07-03  198  	mipi_dsi_dcs_write_seq(dsi, 0x55, 0x82, 0x02);
5c468773299243 Linus Walleij 2023-07-03  199  	mipi_dsi_dcs_write_seq(dsi, 0x56, 0x04);
5c468773299243 Linus Walleij 2023-07-03  200  	mipi_dsi_dcs_write_seq(dsi, 0x58, 0x21);
5c468773299243 Linus Walleij 2023-07-03  201  	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x30);
5c468773299243 Linus Walleij 2023-07-03  202  	mipi_dsi_dcs_write_seq(dsi, 0x5A, 0x60);
5c468773299243 Linus Walleij 2023-07-03  203  	mipi_dsi_dcs_write_seq(dsi, 0x5B, 0x50);
5c468773299243 Linus Walleij 2023-07-03  204  	mipi_dsi_dcs_write_seq(dsi, 0x5E, 0x00, 0x06);
5c468773299243 Linus Walleij 2023-07-03  205  	mipi_dsi_dcs_write_seq(dsi, 0x5F, 0x00);
5c468773299243 Linus Walleij 2023-07-03  206  	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x82);
5c468773299243 Linus Walleij 2023-07-03  207  	mipi_dsi_dcs_write_seq(dsi, 0x7E, 0x20);
5c468773299243 Linus Walleij 2023-07-03  208  	mipi_dsi_dcs_write_seq(dsi, 0x7F, 0x3C);
5c468773299243 Linus Walleij 2023-07-03  209  	mipi_dsi_dcs_write_seq(dsi, 0x82, 0x04);
5c468773299243 Linus Walleij 2023-07-03  210  	mipi_dsi_dcs_write_seq(dsi, 0x97, 0xC0);
5c468773299243 Linus Walleij 2023-07-03  211  
5c468773299243 Linus Walleij 2023-07-03  212  	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x05, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00);
5c468773299243 Linus Walleij 2023-07-03  213  	mipi_dsi_dcs_write_seq(dsi, 0x91, 0x44);
5c468773299243 Linus Walleij 2023-07-03  214  	mipi_dsi_dcs_write_seq(dsi, 0x92, 0xA9);
5c468773299243 Linus Walleij 2023-07-03  215  	mipi_dsi_dcs_write_seq(dsi, 0x93, 0x1A);
5c468773299243 Linus Walleij 2023-07-03  216  	mipi_dsi_dcs_write_seq(dsi, 0x94, 0x96);
5c468773299243 Linus Walleij 2023-07-03  217  	mipi_dsi_dcs_write_seq(dsi, 0xD7, 0x55);
5c468773299243 Linus Walleij 2023-07-03  218  	mipi_dsi_dcs_write_seq(dsi, 0xDA, 0x0A);
5c468773299243 Linus Walleij 2023-07-03  219  	mipi_dsi_dcs_write_seq(dsi, 0xDE, 0x08);
5c468773299243 Linus Walleij 2023-07-03  220  	mipi_dsi_dcs_write_seq(dsi, 0xDB, 0x05);
5c468773299243 Linus Walleij 2023-07-03  221  	mipi_dsi_dcs_write_seq(dsi, 0xDC, 0xA9);
5c468773299243 Linus Walleij 2023-07-03  222  	mipi_dsi_dcs_write_seq(dsi, 0xDD, 0x22);
5c468773299243 Linus Walleij 2023-07-03  223  
5c468773299243 Linus Walleij 2023-07-03  224  	mipi_dsi_dcs_write_seq(dsi, 0xDF, 0x05);
5c468773299243 Linus Walleij 2023-07-03  225  	mipi_dsi_dcs_write_seq(dsi, 0xE0, 0xA9);
5c468773299243 Linus Walleij 2023-07-03  226  	mipi_dsi_dcs_write_seq(dsi, 0xE1, 0x05);
5c468773299243 Linus Walleij 2023-07-03  227  	mipi_dsi_dcs_write_seq(dsi, 0xE2, 0xA9);
5c468773299243 Linus Walleij 2023-07-03  228  	mipi_dsi_dcs_write_seq(dsi, 0xE3, 0x05);
5c468773299243 Linus Walleij 2023-07-03  229  	mipi_dsi_dcs_write_seq(dsi, 0xE4, 0xA9);
5c468773299243 Linus Walleij 2023-07-03  230  	mipi_dsi_dcs_write_seq(dsi, 0xE5, 0x05);
5c468773299243 Linus Walleij 2023-07-03  231  	mipi_dsi_dcs_write_seq(dsi, 0xE6, 0xA9);
5c468773299243 Linus Walleij 2023-07-03  232  	mipi_dsi_dcs_write_seq(dsi, 0x5C, 0x00);
5c468773299243 Linus Walleij 2023-07-03  233  	mipi_dsi_dcs_write_seq(dsi, 0x5D, 0x00);
5c468773299243 Linus Walleij 2023-07-03  234  	mipi_dsi_dcs_write_seq(dsi, 0x8D, 0x00);
5c468773299243 Linus Walleij 2023-07-03  235  	mipi_dsi_dcs_write_seq(dsi, 0x8E, 0x00);
5c468773299243 Linus Walleij 2023-07-03  236  	mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x90);
5c468773299243 Linus Walleij 2023-07-03  237  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x25);
5c468773299243 Linus Walleij 2023-07-03  238  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
5c468773299243 Linus Walleij 2023-07-03  239  	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x00);
5c468773299243 Linus Walleij 2023-07-03  240  	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x07);
5c468773299243 Linus Walleij 2023-07-03  241  	mipi_dsi_dcs_write_seq(dsi, 0x1F, 0x60);
5c468773299243 Linus Walleij 2023-07-03  242  	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x50);
5c468773299243 Linus Walleij 2023-07-03  243  	mipi_dsi_dcs_write_seq(dsi, 0x26, 0x60);
5c468773299243 Linus Walleij 2023-07-03  244  	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x50);
5c468773299243 Linus Walleij 2023-07-03  245  	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x60);
5c468773299243 Linus Walleij 2023-07-03  246  	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x50);
5c468773299243 Linus Walleij 2023-07-03  247  	mipi_dsi_dcs_write_seq(dsi, 0x3F, 0xE0);
5c468773299243 Linus Walleij 2023-07-03  248  	mipi_dsi_dcs_write_seq(dsi, 0x40, 0x00);
5c468773299243 Linus Walleij 2023-07-03  249  	mipi_dsi_dcs_write_seq(dsi, 0x44, 0x00);
5c468773299243 Linus Walleij 2023-07-03  250  	mipi_dsi_dcs_write_seq(dsi, 0x45, 0x40);
5c468773299243 Linus Walleij 2023-07-03  251  	mipi_dsi_dcs_write_seq(dsi, 0x48, 0x60);
5c468773299243 Linus Walleij 2023-07-03  252  	mipi_dsi_dcs_write_seq(dsi, 0x49, 0x50);
5c468773299243 Linus Walleij 2023-07-03  253  	mipi_dsi_dcs_write_seq(dsi, 0x5B, 0x00);
5c468773299243 Linus Walleij 2023-07-03  254  	mipi_dsi_dcs_write_seq(dsi, 0x5C, 0x00);
5c468773299243 Linus Walleij 2023-07-03  255  	mipi_dsi_dcs_write_seq(dsi, 0x5D, 0x00);
5c468773299243 Linus Walleij 2023-07-03  256  	mipi_dsi_dcs_write_seq(dsi, 0x5E, 0xD0);
5c468773299243 Linus Walleij 2023-07-03  257  	mipi_dsi_dcs_write_seq(dsi, 0x61, 0x60);
5c468773299243 Linus Walleij 2023-07-03  258  	mipi_dsi_dcs_write_seq(dsi, 0x62, 0x50);
5c468773299243 Linus Walleij 2023-07-03  259  	mipi_dsi_dcs_write_seq(dsi, 0xF1, 0x10);
5c468773299243 Linus Walleij 2023-07-03  260  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x2A);
5c468773299243 Linus Walleij 2023-07-03  261  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
5c468773299243 Linus Walleij 2023-07-03  262  
5c468773299243 Linus Walleij 2023-07-03  263  	mipi_dsi_dcs_write_seq(dsi, 0x64, 0x16);
5c468773299243 Linus Walleij 2023-07-03  264  	mipi_dsi_dcs_write_seq(dsi, 0x67, 0x16);
5c468773299243 Linus Walleij 2023-07-03  265  	mipi_dsi_dcs_write_seq(dsi, 0x6A, 0x16);
5c468773299243 Linus Walleij 2023-07-03  266  
5c468773299243 Linus Walleij 2023-07-03  267  	mipi_dsi_dcs_write_seq(dsi, 0x70, 0x30);
5c468773299243 Linus Walleij 2023-07-03  268  
5c468773299243 Linus Walleij 2023-07-03  269  	mipi_dsi_dcs_write_seq(dsi, 0xA2, 0xF3);
5c468773299243 Linus Walleij 2023-07-03  270  	mipi_dsi_dcs_write_seq(dsi, 0xA3, 0xFF);
5c468773299243 Linus Walleij 2023-07-03  271  	mipi_dsi_dcs_write_seq(dsi, 0xA4, 0xFF);
5c468773299243 Linus Walleij 2023-07-03  272  	mipi_dsi_dcs_write_seq(dsi, 0xA5, 0xFF);
5c468773299243 Linus Walleij 2023-07-03  273  
5c468773299243 Linus Walleij 2023-07-03  274  	mipi_dsi_dcs_write_seq(dsi, 0xD6, 0x08);
5c468773299243 Linus Walleij 2023-07-03  275  
5c468773299243 Linus Walleij 2023-07-03  276  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x26);
5c468773299243 Linus Walleij 2023-07-03  277  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
5c468773299243 Linus Walleij 2023-07-03  278  	mipi_dsi_dcs_write_seq(dsi, 0x00, 0xA1);
5c468773299243 Linus Walleij 2023-07-03  279  
5c468773299243 Linus Walleij 2023-07-03  280  	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x31);
5c468773299243 Linus Walleij 2023-07-03  281  	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x28);
5c468773299243 Linus Walleij 2023-07-03  282  	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x30);
5c468773299243 Linus Walleij 2023-07-03  283  	mipi_dsi_dcs_write_seq(dsi, 0x0C, 0x16);
5c468773299243 Linus Walleij 2023-07-03  284  	mipi_dsi_dcs_write_seq(dsi, 0x0D, 0x0D);
5c468773299243 Linus Walleij 2023-07-03  285  	mipi_dsi_dcs_write_seq(dsi, 0x0F, 0x00);
5c468773299243 Linus Walleij 2023-07-03  286  	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x00);
5c468773299243 Linus Walleij 2023-07-03  287  	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x50);
5c468773299243 Linus Walleij 2023-07-03  288  	mipi_dsi_dcs_write_seq(dsi, 0x13, 0x56);
5c468773299243 Linus Walleij 2023-07-03  289  	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x57);
5c468773299243 Linus Walleij 2023-07-03  290  	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x00);
5c468773299243 Linus Walleij 2023-07-03  291  	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x10);
5c468773299243 Linus Walleij 2023-07-03  292  	mipi_dsi_dcs_write_seq(dsi, 0x17, 0xA0);
5c468773299243 Linus Walleij 2023-07-03  293  	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x86);
5c468773299243 Linus Walleij 2023-07-03  294  	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x0D);
5c468773299243 Linus Walleij 2023-07-03  295  	mipi_dsi_dcs_write_seq(dsi, 0x1A, 0x7F);
5c468773299243 Linus Walleij 2023-07-03  296  	mipi_dsi_dcs_write_seq(dsi, 0x1B, 0x0C);
5c468773299243 Linus Walleij 2023-07-03  297  	mipi_dsi_dcs_write_seq(dsi, 0x1C, 0xBF);
5c468773299243 Linus Walleij 2023-07-03  298  	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x00);
5c468773299243 Linus Walleij 2023-07-03  299  	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x00);
5c468773299243 Linus Walleij 2023-07-03  300  	mipi_dsi_dcs_write_seq(dsi, 0x2A, 0x0D);
5c468773299243 Linus Walleij 2023-07-03  301  	mipi_dsi_dcs_write_seq(dsi, 0x2B, 0x7F);
5c468773299243 Linus Walleij 2023-07-03  302  
5c468773299243 Linus Walleij 2023-07-03  303  	mipi_dsi_dcs_write_seq(dsi, 0x1D, 0x00);
5c468773299243 Linus Walleij 2023-07-03  304  	mipi_dsi_dcs_write_seq(dsi, 0x1E, 0x65);
5c468773299243 Linus Walleij 2023-07-03  305  	mipi_dsi_dcs_write_seq(dsi, 0x1F, 0x65);
5c468773299243 Linus Walleij 2023-07-03  306  	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x00);
5c468773299243 Linus Walleij 2023-07-03  307  	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x65);
5c468773299243 Linus Walleij 2023-07-03  308  	mipi_dsi_dcs_write_seq(dsi, 0x2F, 0x05);
5c468773299243 Linus Walleij 2023-07-03  309  	mipi_dsi_dcs_write_seq(dsi, 0x30, 0x65);
5c468773299243 Linus Walleij 2023-07-03  310  	mipi_dsi_dcs_write_seq(dsi, 0x31, 0x05);
5c468773299243 Linus Walleij 2023-07-03  311  	mipi_dsi_dcs_write_seq(dsi, 0x32, 0x7D);
5c468773299243 Linus Walleij 2023-07-03  312  	mipi_dsi_dcs_write_seq(dsi, 0x39, 0x00);
5c468773299243 Linus Walleij 2023-07-03  313  	mipi_dsi_dcs_write_seq(dsi, 0x3A, 0x65);
5c468773299243 Linus Walleij 2023-07-03  314  	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x01);
5c468773299243 Linus Walleij 2023-07-03  315  	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x11);
5c468773299243 Linus Walleij 2023-07-03  316  	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x78);
5c468773299243 Linus Walleij 2023-07-03  317  	mipi_dsi_dcs_write_seq(dsi, 0x35, 0x16);
5c468773299243 Linus Walleij 2023-07-03  318  	mipi_dsi_dcs_write_seq(dsi, 0xC8, 0x04);
5c468773299243 Linus Walleij 2023-07-03  319  	mipi_dsi_dcs_write_seq(dsi, 0xC9, 0x9E);
5c468773299243 Linus Walleij 2023-07-03  320  	mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x4E);
5c468773299243 Linus Walleij 2023-07-03  321  	mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x00);
5c468773299243 Linus Walleij 2023-07-03  322  
5c468773299243 Linus Walleij 2023-07-03  323  	mipi_dsi_dcs_write_seq(dsi, 0xA9, 0x49);
5c468773299243 Linus Walleij 2023-07-03  324  	mipi_dsi_dcs_write_seq(dsi, 0xAA, 0x4B);
5c468773299243 Linus Walleij 2023-07-03  325  	mipi_dsi_dcs_write_seq(dsi, 0xAB, 0x48);
5c468773299243 Linus Walleij 2023-07-03  326  	mipi_dsi_dcs_write_seq(dsi, 0xAC, 0x43);
5c468773299243 Linus Walleij 2023-07-03  327  	mipi_dsi_dcs_write_seq(dsi, 0xAD, 0x40);
5c468773299243 Linus Walleij 2023-07-03  328  	mipi_dsi_dcs_write_seq(dsi, 0xAE, 0x50);
5c468773299243 Linus Walleij 2023-07-03  329  	mipi_dsi_dcs_write_seq(dsi, 0xAF, 0x44);
5c468773299243 Linus Walleij 2023-07-03  330  	mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x54);
5c468773299243 Linus Walleij 2023-07-03  331  	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x4E);
5c468773299243 Linus Walleij 2023-07-03  332  	mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x4D);
5c468773299243 Linus Walleij 2023-07-03  333  	mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x4C);
5c468773299243 Linus Walleij 2023-07-03  334  	mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x41);
5c468773299243 Linus Walleij 2023-07-03  335  	mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x47);
5c468773299243 Linus Walleij 2023-07-03  336  	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x53);
5c468773299243 Linus Walleij 2023-07-03  337  	mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x3E);
5c468773299243 Linus Walleij 2023-07-03  338  	mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x51);
5c468773299243 Linus Walleij 2023-07-03  339  	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x3C);
5c468773299243 Linus Walleij 2023-07-03  340  	mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x3B);
5c468773299243 Linus Walleij 2023-07-03  341  	mipi_dsi_dcs_write_seq(dsi, 0xBB, 0x46);
5c468773299243 Linus Walleij 2023-07-03  342  	mipi_dsi_dcs_write_seq(dsi, 0xBC, 0x45);
5c468773299243 Linus Walleij 2023-07-03  343  	mipi_dsi_dcs_write_seq(dsi, 0xBD, 0x55);
5c468773299243 Linus Walleij 2023-07-03  344  	mipi_dsi_dcs_write_seq(dsi, 0xBE, 0x3D);
5c468773299243 Linus Walleij 2023-07-03  345  	mipi_dsi_dcs_write_seq(dsi, 0xBF, 0x3F);
5c468773299243 Linus Walleij 2023-07-03  346  	mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x52);
5c468773299243 Linus Walleij 2023-07-03  347  	mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x4A);
5c468773299243 Linus Walleij 2023-07-03  348  	mipi_dsi_dcs_write_seq(dsi, 0xC2, 0x39);
5c468773299243 Linus Walleij 2023-07-03  349  	mipi_dsi_dcs_write_seq(dsi, 0xC3, 0x4F);
5c468773299243 Linus Walleij 2023-07-03  350  	mipi_dsi_dcs_write_seq(dsi, 0xC4, 0x3A);
5c468773299243 Linus Walleij 2023-07-03  351  	mipi_dsi_dcs_write_seq(dsi, 0xC5, 0x42);
5c468773299243 Linus Walleij 2023-07-03  352  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x27);
5c468773299243 Linus Walleij 2023-07-03  353  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
5c468773299243 Linus Walleij 2023-07-03  354  
5c468773299243 Linus Walleij 2023-07-03  355  	mipi_dsi_dcs_write_seq(dsi, 0x56, 0x06);
5c468773299243 Linus Walleij 2023-07-03  356  	mipi_dsi_dcs_write_seq(dsi, 0x58, 0x80);
5c468773299243 Linus Walleij 2023-07-03  357  	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x75);
5c468773299243 Linus Walleij 2023-07-03  358  	mipi_dsi_dcs_write_seq(dsi, 0x5A, 0x00);
5c468773299243 Linus Walleij 2023-07-03  359  	mipi_dsi_dcs_write_seq(dsi, 0x5B, 0x02);
5c468773299243 Linus Walleij 2023-07-03  360  	mipi_dsi_dcs_write_seq(dsi, 0x5C, 0x00);
5c468773299243 Linus Walleij 2023-07-03  361  	mipi_dsi_dcs_write_seq(dsi, 0x5D, 0x00);
5c468773299243 Linus Walleij 2023-07-03  362  	mipi_dsi_dcs_write_seq(dsi, 0x5E, 0x20);
5c468773299243 Linus Walleij 2023-07-03  363  	mipi_dsi_dcs_write_seq(dsi, 0x5F, 0x10);
5c468773299243 Linus Walleij 2023-07-03  364  	mipi_dsi_dcs_write_seq(dsi, 0x60, 0x00);
5c468773299243 Linus Walleij 2023-07-03  365  	mipi_dsi_dcs_write_seq(dsi, 0x61, 0x2E);
5c468773299243 Linus Walleij 2023-07-03  366  	mipi_dsi_dcs_write_seq(dsi, 0x62, 0x00);
5c468773299243 Linus Walleij 2023-07-03  367  	mipi_dsi_dcs_write_seq(dsi, 0x63, 0x01);
5c468773299243 Linus Walleij 2023-07-03  368  	mipi_dsi_dcs_write_seq(dsi, 0x64, 0x43);
5c468773299243 Linus Walleij 2023-07-03  369  	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x2D);
5c468773299243 Linus Walleij 2023-07-03  370  	mipi_dsi_dcs_write_seq(dsi, 0x66, 0x00);
5c468773299243 Linus Walleij 2023-07-03  371  	mipi_dsi_dcs_write_seq(dsi, 0x67, 0x01);
5c468773299243 Linus Walleij 2023-07-03  372  	mipi_dsi_dcs_write_seq(dsi, 0x68, 0x44);
5c468773299243 Linus Walleij 2023-07-03  373  
5c468773299243 Linus Walleij 2023-07-03  374  	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x00);
5c468773299243 Linus Walleij 2023-07-03  375  	mipi_dsi_dcs_write_seq(dsi, 0x78, 0x00);
5c468773299243 Linus Walleij 2023-07-03  376  	mipi_dsi_dcs_write_seq(dsi, 0xC3, 0x00);
5c468773299243 Linus Walleij 2023-07-03  377  
5c468773299243 Linus Walleij 2023-07-03  378  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x2A);
5c468773299243 Linus Walleij 2023-07-03  379  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
5c468773299243 Linus Walleij 2023-07-03  380  
5c468773299243 Linus Walleij 2023-07-03  381  	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x2F);
5c468773299243 Linus Walleij 2023-07-03  382  	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x08);
5c468773299243 Linus Walleij 2023-07-03  383  
5c468773299243 Linus Walleij 2023-07-03  384  	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x00);
5c468773299243 Linus Walleij 2023-07-03  385  	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x65);
5c468773299243 Linus Walleij 2023-07-03  386  	mipi_dsi_dcs_write_seq(dsi, 0x26, 0xF8);
5c468773299243 Linus Walleij 2023-07-03  387  	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x00);
5c468773299243 Linus Walleij 2023-07-03  388  	mipi_dsi_dcs_write_seq(dsi, 0x28, 0x1A);
5c468773299243 Linus Walleij 2023-07-03  389  	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x00);
5c468773299243 Linus Walleij 2023-07-03  390  	mipi_dsi_dcs_write_seq(dsi, 0x2A, 0x1A);
5c468773299243 Linus Walleij 2023-07-03  391  	mipi_dsi_dcs_write_seq(dsi, 0x2B, 0x00);
5c468773299243 Linus Walleij 2023-07-03  392  	mipi_dsi_dcs_write_seq(dsi, 0x2D, 0x1A);
5c468773299243 Linus Walleij 2023-07-03  393  
5c468773299243 Linus Walleij 2023-07-03  394  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x23);
5c468773299243 Linus Walleij 2023-07-03  395  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
5c468773299243 Linus Walleij 2023-07-03  396  
5c468773299243 Linus Walleij 2023-07-03  397  	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x80);
5c468773299243 Linus Walleij 2023-07-03  398  	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x00);
5c468773299243 Linus Walleij 2023-07-03  399  
5c468773299243 Linus Walleij 2023-07-03  400  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0xE0);
5c468773299243 Linus Walleij 2023-07-03  401  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
5c468773299243 Linus Walleij 2023-07-03  402  	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x60);
5c468773299243 Linus Walleij 2023-07-03  403  	mipi_dsi_dcs_write_seq(dsi, 0x16, 0xC0);
5c468773299243 Linus Walleij 2023-07-03  404  
5c468773299243 Linus Walleij 2023-07-03  405  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0xF0);
5c468773299243 Linus Walleij 2023-07-03  406  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
5c468773299243 Linus Walleij 2023-07-03  407  	mipi_dsi_dcs_write_seq(dsi, 0x3A, 0x08);
5c468773299243 Linus Walleij 2023-07-03  408  
5c468773299243 Linus Walleij 2023-07-03  409  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x10);
5c468773299243 Linus Walleij 2023-07-03  410  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
5c468773299243 Linus Walleij 2023-07-03  411  	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x01);
5c468773299243 Linus Walleij 2023-07-03  412  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x20);
5c468773299243 Linus Walleij 2023-07-03  413  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
5c468773299243 Linus Walleij 2023-07-03  414  	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x40);
5c468773299243 Linus Walleij 2023-07-03  415  
5c468773299243 Linus Walleij 2023-07-03  416  	mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x10);
5c468773299243 Linus Walleij 2023-07-03  417  	mipi_dsi_dcs_write_seq(dsi, 0xFB, 0x01);
5c468773299243 Linus Walleij 2023-07-03  418  	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x02);
5c468773299243 Linus Walleij 2023-07-03  419  	mipi_dsi_dcs_write_seq(dsi, 0x35, 0x00);
5c468773299243 Linus Walleij 2023-07-03  420  	mipi_dsi_dcs_write_seq(dsi, 0x51, 0x00, 0xFF);
5c468773299243 Linus Walleij 2023-07-03  421  	mipi_dsi_dcs_write_seq(dsi, 0x53, 0x24);
5c468773299243 Linus Walleij 2023-07-03  422  	mipi_dsi_dcs_write_seq(dsi, 0x55, 0x00);
5c468773299243 Linus Walleij 2023-07-03  423  	mipi_dsi_dcs_write_seq(dsi, 0xBB, 0x13);
5c468773299243 Linus Walleij 2023-07-03  424  	mipi_dsi_dcs_write_seq(dsi, 0x3B, 0x03, 0x96, 0x1A, 0x04, 0x04);
5c468773299243 Linus Walleij 2023-07-03  425  	msleep(100);
5c468773299243 Linus Walleij 2023-07-03  426  	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
5c468773299243 Linus Walleij 2023-07-03  427  	if (ret)
5c468773299243 Linus Walleij 2023-07-03  428  		return ret;
5c468773299243 Linus Walleij 2023-07-03  429  	msleep(200);
5c468773299243 Linus Walleij 2023-07-03  430  	ret = mipi_dsi_dcs_set_display_on(dsi);
5c468773299243 Linus Walleij 2023-07-03  431  	if (ret)
5c468773299243 Linus Walleij 2023-07-03  432  		return ret;
5c468773299243 Linus Walleij 2023-07-03  433  	msleep(100);
93ee1a2c0f0834 yangcong      2021-09-14  434  
5c468773299243 Linus Walleij 2023-07-03  435  	return 0;
5c468773299243 Linus Walleij 2023-07-03  436  }
a869b9db7adf3b Jitao Shi     2020-01-16  437  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
