Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB501F601
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 23:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O31fxbL/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699054381; x=1730590381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PcT9/pSW3Ymqcvm9IZpThN4Nv4FkGSck63SNsZjBxEE=;
  b=O31fxbL/1fMc+Goa/2n0Gm+TJhlYJeEE24ndoXjz4egPZnZnh8JwEWtN
   3I3p9IqUWy+YT1JDzjZehZuXD5tSuLf0Dyl9WES/SItV3Rjlcuwn86Pv7
   O6WvA0Hky1Vm/l+DcG5fZeMskke8xlkMUSlNhPRPLTYTK1zIfndym0nKm
   nnKrCWghiX89gkLOKu0H1tPxJ04WI6SwmMBVihKuI7h7e4nes5y75DLrM
   fnDevjNqrXFWioOhJQG8hZPWJ7tIRQxGsqTfS3seck5pZIkFPPPj5wPX1
   Xa4M6Bdk0G7U2RtqyhP+P7wuCilBsocl9rH6zn9339eyjUCN/Cpjmib1m
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="475274703"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="475274703"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008965076"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="1008965076"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Nov 2023 16:32:59 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz3er-00033g-0A;
	Fri, 03 Nov 2023 23:32:57 +0000
Date: Sat, 4 Nov 2023 07:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/panel/panel-novatek-nt36523.c:108
 elish_boe_init_sequence() warn: Function too hairy.  No more merges.
Message-ID: <202311040717.QDPBES54-lkp@intel.com>
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
TO: Jianhua Lu <lujianhua000@gmail.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e392ea4d4d00880bf94550151b1ace4f88a4b17a
commit: 0993234a00451e0a5c3e47d8b0f2e01dac6cedbf drm/panel: Add driver for Novatek NT36523
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231104/202311040717.QDPBES54-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311040717.QDPBES54-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311040717.QDPBES54-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-novatek-nt36523.c:108 elish_boe_init_sequence() warn: Function too hairy.  No more merges.
drivers/gpu/drm/panel/panel-novatek-nt36523.c:328 elish_csot_init_sequence() warn: Function too hairy.  No more merges.

vim +108 drivers/gpu/drm/panel/panel-novatek-nt36523.c

0993234a00451e Jianhua Lu 2023-03-13   62  
0993234a00451e Jianhua Lu 2023-03-13   63  static int elish_boe_init_sequence(struct panel_info *pinfo)
0993234a00451e Jianhua Lu 2023-03-13   64  {
0993234a00451e Jianhua Lu 2023-03-13   65  	struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
0993234a00451e Jianhua Lu 2023-03-13   66  	struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
0993234a00451e Jianhua Lu 2023-03-13   67  	/* No datasheet, so write magic init sequence directly */
0993234a00451e Jianhua Lu 2023-03-13   68  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
0993234a00451e Jianhua Lu 2023-03-13   69  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13   70  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x05);
0993234a00451e Jianhua Lu 2023-03-13   71  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
0993234a00451e Jianhua Lu 2023-03-13   72  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13   73  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x18, 0x40);
0993234a00451e Jianhua Lu 2023-03-13   74  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
0993234a00451e Jianhua Lu 2023-03-13   75  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13   76  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x02);
0993234a00451e Jianhua Lu 2023-03-13   77  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x23);
0993234a00451e Jianhua Lu 2023-03-13   78  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13   79  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x80);
0993234a00451e Jianhua Lu 2023-03-13   80  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0x84);
0993234a00451e Jianhua Lu 2023-03-13   81  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x05, 0x2d);
0993234a00451e Jianhua Lu 2023-03-13   82  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x06, 0x00);
0993234a00451e Jianhua Lu 2023-03-13   83  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x07, 0x00);
0993234a00451e Jianhua Lu 2023-03-13   84  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x08, 0x01);
0993234a00451e Jianhua Lu 2023-03-13   85  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0x45);
0993234a00451e Jianhua Lu 2023-03-13   86  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11, 0x02);
0993234a00451e Jianhua Lu 2023-03-13   87  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x12, 0x80);
0993234a00451e Jianhua Lu 2023-03-13   88  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x15, 0x83);
0993234a00451e Jianhua Lu 2023-03-13   89  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x16, 0x0c);
0993234a00451e Jianhua Lu 2023-03-13   90  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29, 0x0a);
0993234a00451e Jianhua Lu 2023-03-13   91  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0xff);
0993234a00451e Jianhua Lu 2023-03-13   92  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x31, 0xfe);
0993234a00451e Jianhua Lu 2023-03-13   93  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x32, 0xfd);
0993234a00451e Jianhua Lu 2023-03-13   94  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x33, 0xfb);
0993234a00451e Jianhua Lu 2023-03-13   95  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x34, 0xf8);
0993234a00451e Jianhua Lu 2023-03-13   96  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0xf5);
0993234a00451e Jianhua Lu 2023-03-13   97  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x36, 0xf3);
0993234a00451e Jianhua Lu 2023-03-13   98  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x37, 0xf2);
0993234a00451e Jianhua Lu 2023-03-13   99  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x38, 0xf2);
0993234a00451e Jianhua Lu 2023-03-13  100  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0xf2);
0993234a00451e Jianhua Lu 2023-03-13  101  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0xef);
0993234a00451e Jianhua Lu 2023-03-13  102  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0xec);
0993234a00451e Jianhua Lu 2023-03-13  103  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3d, 0xe9);
0993234a00451e Jianhua Lu 2023-03-13  104  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3f, 0xe5);
0993234a00451e Jianhua Lu 2023-03-13  105  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x40, 0xe5);
0993234a00451e Jianhua Lu 2023-03-13  106  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x41, 0xe5);
0993234a00451e Jianhua Lu 2023-03-13  107  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x13);
0993234a00451e Jianhua Lu 2023-03-13 @108  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x45, 0xff);
0993234a00451e Jianhua Lu 2023-03-13  109  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x46, 0xf4);
0993234a00451e Jianhua Lu 2023-03-13  110  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x47, 0xe7);
0993234a00451e Jianhua Lu 2023-03-13  111  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x48, 0xda);
0993234a00451e Jianhua Lu 2023-03-13  112  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x49, 0xcd);
0993234a00451e Jianhua Lu 2023-03-13  113  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4a, 0xc0);
0993234a00451e Jianhua Lu 2023-03-13  114  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4b, 0xb3);
0993234a00451e Jianhua Lu 2023-03-13  115  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4c, 0xb2);
0993234a00451e Jianhua Lu 2023-03-13  116  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4d, 0xb2);
0993234a00451e Jianhua Lu 2023-03-13  117  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4e, 0xb2);
0993234a00451e Jianhua Lu 2023-03-13  118  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x99);
0993234a00451e Jianhua Lu 2023-03-13  119  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x50, 0x80);
0993234a00451e Jianhua Lu 2023-03-13  120  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x68);
0993234a00451e Jianhua Lu 2023-03-13  121  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x52, 0x66);
0993234a00451e Jianhua Lu 2023-03-13  122  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x66);
0993234a00451e Jianhua Lu 2023-03-13  123  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x54, 0x66);
0993234a00451e Jianhua Lu 2023-03-13  124  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0x0e);
0993234a00451e Jianhua Lu 2023-03-13  125  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x58, 0xff);
0993234a00451e Jianhua Lu 2023-03-13  126  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x59, 0xfb);
0993234a00451e Jianhua Lu 2023-03-13  127  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5a, 0xf7);
0993234a00451e Jianhua Lu 2023-03-13  128  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5b, 0xf3);
0993234a00451e Jianhua Lu 2023-03-13  129  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5c, 0xef);
0993234a00451e Jianhua Lu 2023-03-13  130  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5d, 0xe3);
0993234a00451e Jianhua Lu 2023-03-13  131  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5e, 0xda);
0993234a00451e Jianhua Lu 2023-03-13  132  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5f, 0xd8);
0993234a00451e Jianhua Lu 2023-03-13  133  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x60, 0xd8);
0993234a00451e Jianhua Lu 2023-03-13  134  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x61, 0xd8);
0993234a00451e Jianhua Lu 2023-03-13  135  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x62, 0xcb);
0993234a00451e Jianhua Lu 2023-03-13  136  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x63, 0xbf);
0993234a00451e Jianhua Lu 2023-03-13  137  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x64, 0xb3);
0993234a00451e Jianhua Lu 2023-03-13  138  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x65, 0xb2);
0993234a00451e Jianhua Lu 2023-03-13  139  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x66, 0xb2);
0993234a00451e Jianhua Lu 2023-03-13  140  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x67, 0xb2);
0993234a00451e Jianhua Lu 2023-03-13  141  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
0993234a00451e Jianhua Lu 2023-03-13  142  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  143  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x25, 0x47);
0993234a00451e Jianhua Lu 2023-03-13  144  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0x47);
0993234a00451e Jianhua Lu 2023-03-13  145  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0x47);
0993234a00451e Jianhua Lu 2023-03-13  146  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
0993234a00451e Jianhua Lu 2023-03-13  147  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  148  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x10);
0993234a00451e Jianhua Lu 2023-03-13  149  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1a, 0xe0);
0993234a00451e Jianhua Lu 2023-03-13  150  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x10);
0993234a00451e Jianhua Lu 2023-03-13  151  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x00);
0993234a00451e Jianhua Lu 2023-03-13  152  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x10);
0993234a00451e Jianhua Lu 2023-03-13  153  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0xe0);
0993234a00451e Jianhua Lu 2023-03-13  154  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
0993234a00451e Jianhua Lu 2023-03-13  155  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  156  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
0993234a00451e Jianhua Lu 2023-03-13  157  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  158  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x84, 0x08);
0993234a00451e Jianhua Lu 2023-03-13  159  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x85, 0x0c);
0993234a00451e Jianhua Lu 2023-03-13  160  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
0993234a00451e Jianhua Lu 2023-03-13  161  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  162  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x00);
0993234a00451e Jianhua Lu 2023-03-13  163  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
0993234a00451e Jianhua Lu 2023-03-13  164  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  165  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x91, 0x1f);
0993234a00451e Jianhua Lu 2023-03-13  166  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x92, 0x0f);
0993234a00451e Jianhua Lu 2023-03-13  167  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x93, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  168  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x94, 0x18);
0993234a00451e Jianhua Lu 2023-03-13  169  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x95, 0x03);
0993234a00451e Jianhua Lu 2023-03-13  170  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x96, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  171  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
0993234a00451e Jianhua Lu 2023-03-13  172  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb0, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  173  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
0993234a00451e Jianhua Lu 2023-03-13  174  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  175  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x1f);
0993234a00451e Jianhua Lu 2023-03-13  176  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x1b);
0993234a00451e Jianhua Lu 2023-03-13  177  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x24);
0993234a00451e Jianhua Lu 2023-03-13  178  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  179  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x28);
0993234a00451e Jianhua Lu 2023-03-13  180  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x27);
0993234a00451e Jianhua Lu 2023-03-13  181  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  182  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x31);
0993234a00451e Jianhua Lu 2023-03-13  183  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd1, 0x20);
0993234a00451e Jianhua Lu 2023-03-13  184  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd2, 0x30);
0993234a00451e Jianhua Lu 2023-03-13  185  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x08);
0993234a00451e Jianhua Lu 2023-03-13  186  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xde, 0x80);
0993234a00451e Jianhua Lu 2023-03-13  187  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdf, 0x02);
0993234a00451e Jianhua Lu 2023-03-13  188  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
0993234a00451e Jianhua Lu 2023-03-13  189  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  190  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x81);
0993234a00451e Jianhua Lu 2023-03-13  191  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0xb0);
0993234a00451e Jianhua Lu 2023-03-13  192  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x22);
0993234a00451e Jianhua Lu 2023-03-13  193  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  194  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9f, 0x50);
0993234a00451e Jianhua Lu 2023-03-13  195  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x6f, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  196  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x70, 0x11);
0993234a00451e Jianhua Lu 2023-03-13  197  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x73, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  198  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x74, 0x49);
0993234a00451e Jianhua Lu 2023-03-13  199  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x76, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  200  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x77, 0x49);
0993234a00451e Jianhua Lu 2023-03-13  201  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa0, 0x3f);
0993234a00451e Jianhua Lu 2023-03-13  202  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa9, 0x50);
0993234a00451e Jianhua Lu 2023-03-13  203  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xaa, 0x28);
0993234a00451e Jianhua Lu 2023-03-13  204  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xab, 0x28);
0993234a00451e Jianhua Lu 2023-03-13  205  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xad, 0x10);
0993234a00451e Jianhua Lu 2023-03-13  206  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x00);
0993234a00451e Jianhua Lu 2023-03-13  207  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x49);
0993234a00451e Jianhua Lu 2023-03-13  208  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xba, 0x49);
0993234a00451e Jianhua Lu 2023-03-13  209  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x49);
0993234a00451e Jianhua Lu 2023-03-13  210  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbe, 0x04);
0993234a00451e Jianhua Lu 2023-03-13  211  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbf, 0x49);
0993234a00451e Jianhua Lu 2023-03-13  212  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc0, 0x04);
0993234a00451e Jianhua Lu 2023-03-13  213  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc1, 0x59);
0993234a00451e Jianhua Lu 2023-03-13  214  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc2, 0x00);
0993234a00451e Jianhua Lu 2023-03-13  215  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc5, 0x00);
0993234a00451e Jianhua Lu 2023-03-13  216  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc6, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  217  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc7, 0x48);
0993234a00451e Jianhua Lu 2023-03-13  218  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xca, 0x43);
0993234a00451e Jianhua Lu 2023-03-13  219  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcb, 0x3c);
0993234a00451e Jianhua Lu 2023-03-13  220  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xce, 0x00);
0993234a00451e Jianhua Lu 2023-03-13  221  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcf, 0x43);
0993234a00451e Jianhua Lu 2023-03-13  222  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x3c);
0993234a00451e Jianhua Lu 2023-03-13  223  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd3, 0x43);
0993234a00451e Jianhua Lu 2023-03-13  224  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x3c);
0993234a00451e Jianhua Lu 2023-03-13  225  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd7, 0x00);
0993234a00451e Jianhua Lu 2023-03-13  226  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdc, 0x43);
0993234a00451e Jianhua Lu 2023-03-13  227  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdd, 0x3c);
0993234a00451e Jianhua Lu 2023-03-13  228  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xe1, 0x43);
0993234a00451e Jianhua Lu 2023-03-13  229  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xe2, 0x3c);
0993234a00451e Jianhua Lu 2023-03-13  230  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xf2, 0x00);
0993234a00451e Jianhua Lu 2023-03-13  231  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xf3, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  232  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xf4, 0x48);
0993234a00451e Jianhua Lu 2023-03-13  233  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
0993234a00451e Jianhua Lu 2023-03-13  234  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  235  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x13, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  236  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x14, 0x23);
0993234a00451e Jianhua Lu 2023-03-13  237  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbc, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  238  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbd, 0x23);
0993234a00451e Jianhua Lu 2023-03-13  239  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
0993234a00451e Jianhua Lu 2023-03-13  240  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  241  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x97, 0x3c);
0993234a00451e Jianhua Lu 2023-03-13  242  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x98, 0x02);
0993234a00451e Jianhua Lu 2023-03-13  243  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x99, 0x95);
0993234a00451e Jianhua Lu 2023-03-13  244  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9a, 0x03);
0993234a00451e Jianhua Lu 2023-03-13  245  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9b, 0x00);
0993234a00451e Jianhua Lu 2023-03-13  246  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9c, 0x0b);
0993234a00451e Jianhua Lu 2023-03-13  247  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9d, 0x0a);
0993234a00451e Jianhua Lu 2023-03-13  248  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9e, 0x90);
0993234a00451e Jianhua Lu 2023-03-13  249  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x22);
0993234a00451e Jianhua Lu 2023-03-13  250  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  251  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9f, 0x50);
0993234a00451e Jianhua Lu 2023-03-13  252  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x23);
0993234a00451e Jianhua Lu 2023-03-13  253  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  254  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa3, 0x50);
0993234a00451e Jianhua Lu 2023-03-13  255  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xe0);
0993234a00451e Jianhua Lu 2023-03-13  256  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  257  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x14, 0x60);
0993234a00451e Jianhua Lu 2023-03-13  258  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x16, 0xc0);
0993234a00451e Jianhua Lu 2023-03-13  259  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x02);
0993234a00451e Jianhua Lu 2023-03-13  260  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
0993234a00451e Jianhua Lu 2023-03-13  261  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  262  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0x08);
0993234a00451e Jianhua Lu 2023-03-13  263  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xd0);
0993234a00451e Jianhua Lu 2023-03-13  264  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  265  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x02, 0xaf);
0993234a00451e Jianhua Lu 2023-03-13  266  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0xee);
0993234a00451e Jianhua Lu 2023-03-13  267  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x99);
0993234a00451e Jianhua Lu 2023-03-13  268  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1d, 0x09);
0993234a00451e Jianhua Lu 2023-03-13  269  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
0993234a00451e Jianhua Lu 2023-03-13  270  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
0993234a00451e Jianhua Lu 2023-03-13  271  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x0f, 0xff);
0993234a00451e Jianhua Lu 2023-03-13  272  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x2c);
0993234a00451e Jianhua Lu 2023-03-13  273  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0x00);
0993234a00451e Jianhua Lu 2023-03-13  274  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x13);
0993234a00451e Jianhua Lu 2023-03-13  275  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0x03, 0xac, 0x1a, 0x04, 0x04);
0993234a00451e Jianhua Lu 2023-03-13  276  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11);
0993234a00451e Jianhua Lu 2023-03-13  277  	msleep(70);
0993234a00451e Jianhua Lu 2023-03-13  278  	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29);
0993234a00451e Jianhua Lu 2023-03-13  279  
0993234a00451e Jianhua Lu 2023-03-13  280  	return 0;
0993234a00451e Jianhua Lu 2023-03-13  281  }
0993234a00451e Jianhua Lu 2023-03-13  282  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
