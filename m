Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859781;
	b=uUYZu/pUTQZPB9Ya+ncOnwUDvp0SAisCI/A5SDyCfvdKC1sVmIActYDRKAhY+lpIEnXr
	 zpicYaK6yXjMU4OjixuF+XB3r/DQ8iDZrqEnuwET3rS6gOt54ruOHXZu/Te+efCeeA0Jp
	 iQAKB2UqI2WUJDWHku86s58LgQHVL27eXKjfNR7bui9U2jlEoeJkDnoBrHqIvxSmTcV7C
	 sBLcrXiaP3hpBwIEB005ZAztotGA4wKgsTbRvqpLnypSw6TPPGNHFbn374P5LP1h16+iA
	 rSeDCAL+e9r2O0neM7XQwxAnaauA7QfW9QQeSZrocxxmzMv37zMGLkoCpR2jwxdeMOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859781;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Nb6YCDCXYP4Ru1VN2gK3IxsqwNpolzXXxscaZ/NWbus=;
	b=ouPcPm9j2rdnx//VKmlx1WsdzNFQ4SthaZYUoc7E8LLRtXBYyKoddFwNnMpEmeFUXhz0
	 8CQEfWFbc9FHUbKpHwkSkhjFrReGq0YmQRCNje04gPRhn3Y94OSHN2Ulj7ZPfjcgjrgJc
	 7xZ1WJAEdLpNYDKJYB/YKjjZT/FsJmToagzuS87sX5E3IDv5mhRV+641A4+NgucKV2OTA
	 Cwo968nGfS/ARbmgHUwEhI5egjHShNMcv3VPeQ20NnR9svR4TSSbO7Ysc5hUEj6pIP9tH
	 xjhUYLWtfKLrJlahNtPURdVwuqp2Y2hi8btSv9eKbo0pvRwH5Sqk5qyQ3O9rC2FsU6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TbgTe1o1;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCC4606A31F
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Nov 2026 09:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DCC4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TbgTe1o1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795859780; x=1827395780;
  h=date:from:to:cc:subject:message-id;
  bh=O1nLjpR+4EYXShVbpqqLEAMwDl05DMB4lZ5xcFUu/z4=;
  b=TbgTe1o1mu8cXx/AfihVNl8dphmRlvouPobrbMMa+wUX4J52PdsA3MWP
   4f3GxDcAmbMPrsZ8Y0HdbgIy6VaiTB3JGO7B8JeB36FJoQMsdPq089T3C
   S6HZ9evy0xQ7AOfARwDEMGuA8xYOsCUYWRzFm3NAkmJGHKJHug/qKSBE+
   s5hZh7Q9CmytYjR32Z7g4RBALFDyX4QGYbxmhsofJlLjdwrnkRVi8KP7b
   sOWEqigdCpqSSnxGzRiHXP1xnDtTi4xlkS5w+ugBrxyxCJGafvnUvVTAK
   R/U+7fP3MnipyxZcjQrNG9EQdVJy6jpQW/0JNP3Ni/XC0wokTbsmoTGkc
   A==;
X-CSE-ConnectionGUID: 2mtK2Zx6QFq7zzkPhz3+NA==
X-CSE-MsgGUID: 1ZHW+qQ5Tye3YPDscRpcdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4738724"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4738724"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2026 01:56:20 -0800
X-CSE-ConnectionGUID: Yo5mgF9RRF6AKxyq/aoXSQ==
X-CSE-MsgGUID: hN2rTLl+RyWp4PR6GnARHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="13153111"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 28 Nov 2026 01:56:19 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xXFAG-000000000Xq-1mUT;
	Sat, 28 Nov 2026 09:56:16 +0000
Date: Sat, 28 Nov 2026 10:55:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bpf-next:master 1/1] drivers/hid/hid-steam.c:557
 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__647'
Message-ID: <20261128104658.Amd2HTXW-lkp@intel.com>
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
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   b81e432151a69b8dc07f4a398e2166268bee9a85
commit: b81e432151a69b8dc07f4a398e2166268bee9a85 [1/1] Merge git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf 7.4-rc4
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: arm64-randconfig-2200-20261128 (https://download.01.org/0day-ci/archive/20261128/20261128104658.Amd2HTXW-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 578b1f2d6a9776b63cbb6b86f4cca6208d429f48)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261128104658.Amd2HTXW-lkp@intel.com/

smatch warnings:
drivers/hid/hid-steam.c:557 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__647'

vim +/__UNIQUE_ID_x__647 +557 drivers/hid/hid-steam.c

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
