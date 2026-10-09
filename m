Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B7D4A7CA0
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Oct 2026 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558023; cv=none; b=g6N9TsOqtVFbIs/zN43zY6HURLyhYAyVCupdz5zxpoVSsJj4SPEhftIakPTYjNc+LAGeqPvSikVGv0dAblDyXZ58Ww1K7rGMsKQm7emHw+vpSHIok1pxXWKohL3DnCDUpSO7XBPpDmCw6cXAsUtt02JrzHi7GGNqFqo3ELZy9Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558023; c=relaxed/simple;
	bh=gMLBGbwQDKhn4ZVSR4RRs9zpW06uoqLDSgwQqz86dT8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WANIv0RTkjYYSA2+Js4XYltLGhZvwZP67Pu7MWiGCf4T96bJ0vjY929lJLLqcsd9k2f8Hsu+LhbMyCM9LJuuisdfFu6ri21pyR5E0ujq49tbMMsw13jRgJVwtQGvZBVE4bYJwfyrIrZD4XV0goPbgJk5aoD3gVWQAwJtgFZhRaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ajh0OHye; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ajh0OHye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791558022; x=1823094022;
  h=date:from:to:cc:subject:message-id;
  bh=gMLBGbwQDKhn4ZVSR4RRs9zpW06uoqLDSgwQqz86dT8=;
  b=Ajh0OHyeoUM1erSIV+pK0pUc+T5NkEirYf7Ly5J4DfgZRp2GeD4q5Fe7
   hBCT35M78/L/ysj/HCcLfzhAza8ujSrEiyl8tNPqpHVc854qfBSFOCjQM
   GNP/uJWeGUbklI1q9TQPcNchekwLiVB9TSTIX6L85b1/iIjciV2T/u5lK
   AD3041/KVVNsJ7hR58BHZc7PuEJ8TWtNgW88s6VBWzHe2ef8POfGGwL/Q
   rjQWVOsfoRizAISJKDQq84chDeQfPPPH5hXTTlum8nl03qX0y50S1UIQ/
   svX+MTFGrJu9+VXLtSdTAIukKBctLKGU+P8Ig5++C+K8e7oY782pROUVV
   w==;
X-CSE-ConnectionGUID: hmpoeXHkSVWBTcwu+5LSuA==
X-CSE-MsgGUID: bYlmmJWqTw6vpBfwBrPNFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="257890"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="257890"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:00:21 -0700
X-CSE-ConnectionGUID: K4rEMZspTfy23YAK+7pCRQ==
X-CSE-MsgGUID: HQws0pcLSqeWiIGcsoExEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2131930"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 09 Oct 2026 08:00:19 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFC53-00000000779-25zA;
	Fri, 09 Oct 2026 15:00:17 +0000
Date: Fri, 09 Oct 2026 17:00:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 361/508] drivers/hid/hid-steam.c:557
 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__551'
Message-ID: <202610091620.OVDm1ktr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   634cbf5b794b734c78631b92e381cfc85f357bbe
commit: 230c13e7d3475c02b4e3028c9200dc46d070b835 [361/508] mm: add mmap action for discontiguous kernel page mapping
:::::: branch date: 9 hours ago
:::::: commit date: 16 hours ago
config: loongarch-randconfig-r2202-20261009 (https://download.01.org/0day-ci/archive/20261009/202610091620.OVDm1ktr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610091620.OVDm1ktr-lkp@intel.com/

smatch warnings:
drivers/hid/hid-steam.c:557 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__551'

vim +/__UNIQUE_ID_x__551 +557 drivers/hid/hid-steam.c

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
