Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975547;
	b=XkhehB2KG8gmaCDaCh3mhm9NFDtBCZ2w+Qdsbx0ZfXDWxhEDLBvcBTCOSsfZzntyLZjZ
	 0wxA/4gaLZADyARhnuUQr1lx9+LDDlUw025HexdNM3qVOKlOOUhMFglSA+gT/eZEaE9GD
	 qRAkEWeZ50N9WBE8y3n2SQPfkMmSiR6gP6UBnpIrdGuNxL3u+NWDnzOcDnb4IoBYKhAU9
	 YSf4pumK9z7Zt/im4kkIepHKc3lSbJ3l8XhZwjPRzNx4lA/2VxKGDWb37PhC7vQxfhyur
	 Hj3q2M2CWmyWmuWwfOZgFA77lXbaCCI8ZQIyxQiUbdlyae967hVek0yJKhExgJDDfzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975547;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qnA+ok1hCwShU4Mf7k4OKsX9F2V3D/gzKE5Kz9neGAQ=;
	b=r/fztGbBmBtjUY254EKMDsxEIA/C0Lr5NciD1cvE2qvxe5OCe0+pt7uLXasVInRxUbJK
	 KXAAKumjvqyigAtTPvIiQGOE0iXjIjC8Hsqcd6I0lSX/4gLjNsDL2IARwsM97W8LPgYyK
	 aWaflOcm+t9x15IyFZdFLoTlHgV0SK9jJ3A+OAqvkmP20xdK7Iza88EA2bLtEGOZqDuSs
	 53tpM96CvyzDHhNs/J35cCd2yQuvLCe0l10qQSgiB1mP0LmvI6PhrNFXbUtRqt4dzd/AR
	 S0JFrpGwoEDv1k0Wgq03QAXtZwm0nBrjBrMLHUHT+RWRKb+jiXIN7LNCbhDg/PbiILA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Z810z/hQ";
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE910606A329
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 14:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE910606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z810z/hQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793975546; x=1825511546;
  h=date:from:to:cc:subject:message-id;
  bh=eWzjK47FHr9JW6FOb6joz4pf/aQ59iPqGbffbBYk4dY=;
  b=Z810z/hQweNF8ewh4ar52ZbasdxPfum+v75kDVnj636Nch0ec2JzSVDU
   2QmxYP3rJZpNTHOHGHmkVL2k2jZQr8+T8tnbQ2PbS+Q47W3hN/mBvQO38
   Ip9TMartKJG5vG13ItjRAe4ujNDsGk8uluZwIVohZ8b5d/yhs50JU+xZ7
   5E+03kvEzq/7/ZObsnJZyHhnlGSlk/7omtuA10YbXM/xqlmNuZrNfE5o9
   WdDvHriBnHI0eSFcwOy2qbSsSZvRvzbgPszBcTXLey/LvAUt8btFnZPPF
   cEX2HCA6mCSqlh4o97RwkKIxyP82fJtKR8gtt8Kxs1hvJs9HNRk1xIufq
   w==;
X-CSE-ConnectionGUID: kbkZ51E1SWi/pRx3bIaNPQ==
X-CSE-MsgGUID: mMIobQTLR7aGI+DVqE5DqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2816466"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2816466"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 06:32:25 -0800
X-CSE-ConnectionGUID: LgZ/u0SyTzyTGw6Hfz7d8A==
X-CSE-MsgGUID: qe64tEF+T2+JzXx/MlInmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7855104"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2026 06:32:23 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPKzM-00000000AHj-2Up1;
	Fri, 06 Nov 2026 14:32:20 +0000
Date: Fri, 06 Nov 2026 15:31:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [leon-rdma:device-trust-core-v2 19/20]
 drivers/hid/hid-steam.c:557 steam_send_report_id() warn: check sign expansion
 for '__UNIQUE_ID_x__496'
Message-ID: <202611061513.BRkz4f7G-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git device-trust-core-v2
head:   f10f8e448540982699438dce369fef6cbfabcba5
commit: 98f5d11580d736a7878323dfb7238cd08c6c76af [19/20] driver core: Export device trust policy requests
:::::: branch date: 21 hours ago
:::::: commit date: 24 hours ago
config: sparc-randconfig-2200-20261106 (https://download.01.org/0day-ci/archive/20261106/202611061513.BRkz4f7G-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611061513.BRkz4f7G-lkp@intel.com/

smatch warnings:
drivers/hid/hid-steam.c:557 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__496'

vim +/__UNIQUE_ID_x__496 +557 drivers/hid/hid-steam.c

c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  516  
0a80b4e8ec6a6e4 Vicki Pfau          2026-08-11  517  static int steam_send_report_id(struct steam_device *steam,
0a80b4e8ec6a6e4 Vicki Pfau          2026-08-11  518  		u8 *cmd, int size, u8 report_id)
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  519  {
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  520  	struct hid_report *r;
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  521  	u8 *buf;
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  522  	unsigned int retries = 50;
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  523  	int ret;
0a80b4e8ec6a6e4 Vicki Pfau          2026-08-11  524  	u32 len;
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  525  
0a80b4e8ec6a6e4 Vicki Pfau          2026-08-11  526  	r = steam->hdev->report_enum[HID_FEATURE_REPORT].report_id_hash[report_id];
cd11d1a6114bd4b Lee Jones           2022-07-08  527  	if (!r) {
0a80b4e8ec6a6e4 Vicki Pfau          2026-08-11  528  		hid_err(steam->hdev, "No HID_FEATURE_REPORT present for ID %u\n", report_id);
cd11d1a6114bd4b Lee Jones           2022-07-08  529  		return -EINVAL;
cd11d1a6114bd4b Lee Jones           2022-07-08  530  	}
cd11d1a6114bd4b Lee Jones           2022-07-08  531  
0a80b4e8ec6a6e4 Vicki Pfau          2026-08-11  532  	len = hid_report_len(r);
0a80b4e8ec6a6e4 Vicki Pfau          2026-08-11  533  	if (len < 64)
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  534  		return -EINVAL;
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  535  
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  536  	buf = hid_alloc_report_buf(r, GFP_KERNEL);
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  537  	if (!buf)
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  538  		return -ENOMEM;
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  539  
0a80b4e8ec6a6e4 Vicki Pfau          2026-08-11  540  	/* The report ID is always consistent */
0a80b4e8ec6a6e4 Vicki Pfau          2026-08-11  541  	buf[0] = report_id;
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  542  	memcpy(buf + 1, cmd, size);
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  543  
de435b770cd9492 Vicki Pfau          2026-07-29  544  	hid_dbg(steam->hdev, "Sending report %*ph\n", size, cmd);
de435b770cd9492 Vicki Pfau          2026-07-29  545  
0a80b4e8ec6a6e4 Vicki Pfau          2026-08-11  546  	if (!(steam->quirks & STEAM_QUIRK_IBEX))
0a80b4e8ec6a6e4 Vicki Pfau          2026-08-11  547  		len += 1;
0a80b4e8ec6a6e4 Vicki Pfau          2026-08-11  548  
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  549  	/*
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  550  	 * Sometimes the wireless controller fails with EPIPE
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  551  	 * when sending a feature report.
0a80b4e8ec6a6e4 Vicki Pfau          2026-08-11  552  	 * Doing a HID_REQ_SET_REPORT and waiting for a while
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  553  	 * seems to fix that.
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  554  	 */
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  555  	do {
0a80b4e8ec6a6e4 Vicki Pfau          2026-08-11  556  		ret = hid_hw_raw_request(steam->hdev, report_id,
0a80b4e8ec6a6e4 Vicki Pfau          2026-08-11 @557  				buf, max(size + 1, len),
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  558  				HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  559  		if (ret != -EPIPE)
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  560  			break;
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  561  		msleep(20);
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  562  	} while (--retries);
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  563  
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  564  	kfree(buf);
cfa66cba6d02ff2 Vicki Pfau          2026-08-11  565  	/*
cfa66cba6d02ff2 Vicki Pfau          2026-08-11  566  	 * Don't log if the failure is -ENODEV, as this
cfa66cba6d02ff2 Vicki Pfau          2026-08-11  567  	 * can happen normally on disconnect.
cfa66cba6d02ff2 Vicki Pfau          2026-08-11  568  	 */
cfa66cba6d02ff2 Vicki Pfau          2026-08-11  569  	if (ret < 0 && ret != -ENODEV)
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  570  		hid_err(steam->hdev, "%s: error %d (%*ph)\n", __func__,
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  571  				ret, size, cmd);
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  572  	return ret;
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  573  }
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  574  

:::::: The code at line 557 was first introduced by commit
:::::: 0a80b4e8ec6a6e40937c7abdf8fb2ebe6cc7c1e5 HID: steam: Initial 2026 Steam Controller support

:::::: TO: Vicki Pfau <vi@endrift.com>
:::::: CC: Jiri Kosina <jkosina@suse.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
