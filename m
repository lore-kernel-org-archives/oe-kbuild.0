Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF07F4431
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jul 2024 06:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720850649; cv=none; b=lxyAA+nSMPvB5Gr+L+U2ODvdH4mXOKdQ+mEuae87pWSRyrs9ietkCs2czPAnD/mS3IJQ3JepX9HPERy3/XhMBBq/U6VhKlDB1HuW/9EUjaC9PnzTw/GnuFEqMXs101ZMa1O3Rnh2P4UHCuks1RQeNobG+qeVswOATufiR/cfRfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720850649; c=relaxed/simple;
	bh=IyyPNImJvJgboXOreiu09Hhvq+EidiD9abRdQYXWSAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hp0U1K9tKpyHfIwqldQj/QPhi5S4LZk7cGXMKPIDeeoQcbY2YVLCU8kL+eku40qFTN+6btHQQIqk7nmBasJhzn6o/IBqDpvk9yO+mZ63z1wYY0nXkBZgXb+VM1h9psEsXJhEngGqTiAOr+8/ihzCAicyM0FyW0tyWeG3zfZVirE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cwqh1HQe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cwqh1HQe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720850647; x=1752386647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IyyPNImJvJgboXOreiu09Hhvq+EidiD9abRdQYXWSAQ=;
  b=Cwqh1HQeyYk2hMTVU/I3Y8ZuzAioWMzW/1bBIeDEBtoZxdazG2x/0NLE
   2sSVpUfuDrWgzC/y4uDMOz3EpQmWy/qmTpmr/KTnSN2e2Hs7iNlphmS1f
   n6dMQGdE3s8SSLBTvEMaktyS8Jath9W02IVYEg7PrPzmjDpP4Re3MCREk
   k/8+BTZgC6JPUoV1iKIOvr10vJTcmGv5t9xrcwE8bKHhnk3WdPfY34cud
   nwt9PYOtqC65QKYYnPWU1pCpa0nOLzkocPgU9drwHenL9LlVtyYj28uUK
   7L3nHDjyGBjNZDU4oAIwYbCr8u8RKfdWcWiIEDxiJxw8spxb2lE3v8vab
   Q==;
X-CSE-ConnectionGUID: vxA88BjtQo2lMfP5Khhycg==
X-CSE-MsgGUID: fTnaMvScRMidoGanNgO2qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="22171626"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="22171626"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 23:04:07 -0700
X-CSE-ConnectionGUID: 4f9tXI/WTzuQb1HL9Xj46A==
X-CSE-MsgGUID: YFa3zIJCRJqLpwaP1N3LzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="53947904"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jul 2024 23:04:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSVrX-000bkm-16;
	Sat, 13 Jul 2024 06:04:03 +0000
Date: Sat, 13 Jul 2024 14:03:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/cxl/core/region.c:1261 check_interleave_cap() error:
 uninitialized symbol 'eiw'.
Message-ID: <202407131332.TpbaCNOT-lkp@intel.com>
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
TO: Yao Xingtao <yaoxt.fnst@fujitsu.com>
CC: Dave Jiang <dave.jiang@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   975f3b6da18020f1c8a7667ccb08fa542928ec03
commit: 84328c5acebc10c8cdcf17283ab6c6d548885bfc cxl/region: check interleave capability
date:   2 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20240713 (https://download.01.org/0day-ci/archive/20240713/202407131332.TpbaCNOT-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407131332.TpbaCNOT-lkp@intel.com/

New smatch warnings:
drivers/cxl/core/region.c:1261 check_interleave_cap() error: uninitialized symbol 'eiw'.
drivers/cxl/core/region.c:1266 check_interleave_cap() error: uninitialized symbol 'eig'.

Old smatch warnings:
drivers/cxl/core/region.c:1268 check_interleave_cap() error: uninitialized symbol 'eig'.

vim +/eiw +1261 drivers/cxl/core/region.c

27b3f8d13830cd Dan Williams 2022-06-06  1232  
84328c5acebc10 Yao Xingtao  2024-06-14  1233  static int check_interleave_cap(struct cxl_decoder *cxld, int iw, int ig)
84328c5acebc10 Yao Xingtao  2024-06-14  1234  {
84328c5acebc10 Yao Xingtao  2024-06-14  1235  	struct cxl_port *port = to_cxl_port(cxld->dev.parent);
84328c5acebc10 Yao Xingtao  2024-06-14  1236  	struct cxl_hdm *cxlhdm = dev_get_drvdata(&port->dev);
84328c5acebc10 Yao Xingtao  2024-06-14  1237  	unsigned int interleave_mask;
84328c5acebc10 Yao Xingtao  2024-06-14  1238  	u8 eiw;
84328c5acebc10 Yao Xingtao  2024-06-14  1239  	u16 eig;
84328c5acebc10 Yao Xingtao  2024-06-14  1240  	int high_pos, low_pos;
84328c5acebc10 Yao Xingtao  2024-06-14  1241  
84328c5acebc10 Yao Xingtao  2024-06-14  1242  	if (!test_bit(iw, &cxlhdm->iw_cap_mask))
84328c5acebc10 Yao Xingtao  2024-06-14  1243  		return -ENXIO;
84328c5acebc10 Yao Xingtao  2024-06-14  1244  	/*
84328c5acebc10 Yao Xingtao  2024-06-14  1245  	 * Per CXL specification r3.1(8.2.4.20.13 Decoder Protection),
84328c5acebc10 Yao Xingtao  2024-06-14  1246  	 * if eiw < 8:
84328c5acebc10 Yao Xingtao  2024-06-14  1247  	 *   DPAOFFSET[51: eig + 8] = HPAOFFSET[51: eig + 8 + eiw]
84328c5acebc10 Yao Xingtao  2024-06-14  1248  	 *   DPAOFFSET[eig + 7: 0]  = HPAOFFSET[eig + 7: 0]
84328c5acebc10 Yao Xingtao  2024-06-14  1249  	 *
84328c5acebc10 Yao Xingtao  2024-06-14  1250  	 *   when the eiw is 0, all the bits of HPAOFFSET[51: 0] are used, the
84328c5acebc10 Yao Xingtao  2024-06-14  1251  	 *   interleave bits are none.
84328c5acebc10 Yao Xingtao  2024-06-14  1252  	 *
84328c5acebc10 Yao Xingtao  2024-06-14  1253  	 * if eiw >= 8:
84328c5acebc10 Yao Xingtao  2024-06-14  1254  	 *   DPAOFFSET[51: eig + 8] = HPAOFFSET[51: eig + eiw] / 3
84328c5acebc10 Yao Xingtao  2024-06-14  1255  	 *   DPAOFFSET[eig + 7: 0]  = HPAOFFSET[eig + 7: 0]
84328c5acebc10 Yao Xingtao  2024-06-14  1256  	 *
84328c5acebc10 Yao Xingtao  2024-06-14  1257  	 *   when the eiw is 8, all the bits of HPAOFFSET[51: 0] are used, the
84328c5acebc10 Yao Xingtao  2024-06-14  1258  	 *   interleave bits are none.
84328c5acebc10 Yao Xingtao  2024-06-14  1259  	 */
84328c5acebc10 Yao Xingtao  2024-06-14  1260  	ways_to_eiw(iw, &eiw);
84328c5acebc10 Yao Xingtao  2024-06-14 @1261  	if (eiw == 0 || eiw == 8)
84328c5acebc10 Yao Xingtao  2024-06-14  1262  		return 0;
84328c5acebc10 Yao Xingtao  2024-06-14  1263  
84328c5acebc10 Yao Xingtao  2024-06-14  1264  	granularity_to_eig(ig, &eig);
84328c5acebc10 Yao Xingtao  2024-06-14  1265  	if (eiw > 8)
84328c5acebc10 Yao Xingtao  2024-06-14 @1266  		high_pos = eiw + eig - 1;
84328c5acebc10 Yao Xingtao  2024-06-14  1267  	else
84328c5acebc10 Yao Xingtao  2024-06-14  1268  		high_pos = eiw + eig + 7;
84328c5acebc10 Yao Xingtao  2024-06-14  1269  	low_pos = eig + 8;
84328c5acebc10 Yao Xingtao  2024-06-14  1270  	interleave_mask = GENMASK(high_pos, low_pos);
84328c5acebc10 Yao Xingtao  2024-06-14  1271  	if (interleave_mask & ~cxlhdm->interleave_mask)
84328c5acebc10 Yao Xingtao  2024-06-14  1272  		return -ENXIO;
84328c5acebc10 Yao Xingtao  2024-06-14  1273  
84328c5acebc10 Yao Xingtao  2024-06-14  1274  	return 0;
84328c5acebc10 Yao Xingtao  2024-06-14  1275  }
84328c5acebc10 Yao Xingtao  2024-06-14  1276  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
