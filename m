Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793924795;
	b=FGmhq3ceJzR0j2xgefXdbkXsCRxMFLkfhP+ESpGtOQ+45hepwmScKnmWpke6jHvl/qu6
	 9hTqLpMYYFbD7FjLKwnO1t1ycCcSaKI8Q/UgjvFONSo7i9+xo0FD+16DQRlGZLg5ygklw
	 f0xpML02LL8Q8Kdy9OLtZs8FIqvpIOsEVtwK5Je9OBLCOnBsxABcxL+++EdfEXa3JuiDX
	 Zi2fKoLv4Got40lpUO8YTF2B0stFmJDv5k8zTq+geMPl/CHL/cYZ7NK7a+VULuYUrGFUN
	 nzIgcC/OmXa9o3/x9RkrAZPYgNxsyt2R+X2zLfnz0BlpbF/2kTMXbeZXlGuBdgo/P6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924795;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=871kqBKpH7BdJyha37kfsiPtA37MYQn4Drz6UsxA3sw=;
	b=i/7hDzT1cIZNysAVflq4zjq1nV9eVJMVpvahGYocHAbEERITXHKiycBfqVI+jfdn/Fmu
	 UGNMrrEEIqZq3lNhLtg/54YhL9X+N0me41AMu1pVWXRKnAaRbTgsAzZ5A3F4EcnT2RPCf
	 eZKQfPZGLuCZalukWRVZ6i9wA12WFS7+xGIv3PAaq3a3Ekz6JrAGceOl5MMMnX0TU8TpK
	 eTTuNkFUY83HLyIdKg59DYYRXz3H1hUCxfoJ4e2PTZYgSW0Nlo7PIFkDkVJuq8Kh4kJhX
	 aSju1JwLshr+7KGyuzkbc2AkFEgCU3gEoLl9A7ekCe07+fLHLw8B+UqRnPZR/NexwZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WKxjR8lM;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2C3606A31B
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 00:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F2C3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WKxjR8lM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793924795; x=1825460795;
  h=date:from:to:cc:subject:message-id;
  bh=nyRK9ZbMihBLo8/3dvuNNPcLnW4macXM4mk4OyHMlfg=;
  b=WKxjR8lM82Y5tm7EYgiY1dkUeDHbVwznumCI8w2uUJGz8ATbaHn3JOaM
   EFnBD7gYLK6SzRjJ0k1wioSeDONr/nsbNkAVwby6j2mRYVXNKy+jHOyua
   jXb9y4UEnJEO2zbZGNx2ozfjyID8aj9aRnlVdeVDQizkTd5Ga26hyB2B2
   LIqGHQWi9jSwFb4KV9LlqMMYwfIU2AylCl57MKjBmb0BSrDlvVIOWkMUT
   cr/JqjBlei3DML8qe26HPdyrA9/yDFafiUB+kRlbwO+i0reLXrb7qOBFH
   Y/g1zuA4TXrmNnt+aqznc0+Gu7dZjafxThbKYQTKaiD17e7LugRKis2Y7
   w==;
X-CSE-ConnectionGUID: 5ckNXfBfQV6NTFVRYbo4LA==
X-CSE-MsgGUID: eAG7nzEQSuKpwwHmvhZyzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2767246"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2767246"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 16:26:34 -0800
X-CSE-ConnectionGUID: wHTX8nJzRHKUxjXAAUmdFQ==
X-CSE-MsgGUID: i9jz5i/ORIqH0mpHnwrxpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7486458"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 Nov 2026 16:26:33 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP7mo-000000009vI-3lUw;
	Fri, 06 Nov 2026 00:26:30 +0000
Date: Fri, 06 Nov 2026 01:26:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [leon-rdma:device-trust-core-v2 19/20]
 drivers/hid/hid-steam.c:557 steam_send_report_id() warn: check sign expansion
 for '__UNIQUE_ID_x__469'
Message-ID: <202611060143.hg15jGO0-lkp@intel.com>
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
:::::: branch date: 7 hours ago
:::::: commit date: 10 hours ago
config: sparc64-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060143.hg15jGO0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611060143.hg15jGO0-lkp@intel.com/

smatch warnings:
drivers/hid/hid-steam.c:557 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__469'

vim +/__UNIQUE_ID_x__469 +557 drivers/hid/hid-steam.c

c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  516  
0a80b4e8ec6a6e Vicki Pfau          2026-08-11  517  static int steam_send_report_id(struct steam_device *steam,
0a80b4e8ec6a6e Vicki Pfau          2026-08-11  518  		u8 *cmd, int size, u8 report_id)
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  519  {
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  520  	struct hid_report *r;
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  521  	u8 *buf;
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  522  	unsigned int retries = 50;
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  523  	int ret;
0a80b4e8ec6a6e Vicki Pfau          2026-08-11  524  	u32 len;
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  525  
0a80b4e8ec6a6e Vicki Pfau          2026-08-11  526  	r = steam->hdev->report_enum[HID_FEATURE_REPORT].report_id_hash[report_id];
cd11d1a6114bd4 Lee Jones           2022-07-08  527  	if (!r) {
0a80b4e8ec6a6e Vicki Pfau          2026-08-11  528  		hid_err(steam->hdev, "No HID_FEATURE_REPORT present for ID %u\n", report_id);
cd11d1a6114bd4 Lee Jones           2022-07-08  529  		return -EINVAL;
cd11d1a6114bd4 Lee Jones           2022-07-08  530  	}
cd11d1a6114bd4 Lee Jones           2022-07-08  531  
0a80b4e8ec6a6e Vicki Pfau          2026-08-11  532  	len = hid_report_len(r);
0a80b4e8ec6a6e Vicki Pfau          2026-08-11  533  	if (len < 64)
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  534  		return -EINVAL;
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  535  
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  536  	buf = hid_alloc_report_buf(r, GFP_KERNEL);
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  537  	if (!buf)
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  538  		return -ENOMEM;
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  539  
0a80b4e8ec6a6e Vicki Pfau          2026-08-11  540  	/* The report ID is always consistent */
0a80b4e8ec6a6e Vicki Pfau          2026-08-11  541  	buf[0] = report_id;
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  542  	memcpy(buf + 1, cmd, size);
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  543  
de435b770cd949 Vicki Pfau          2026-07-29  544  	hid_dbg(steam->hdev, "Sending report %*ph\n", size, cmd);
de435b770cd949 Vicki Pfau          2026-07-29  545  
0a80b4e8ec6a6e Vicki Pfau          2026-08-11  546  	if (!(steam->quirks & STEAM_QUIRK_IBEX))
0a80b4e8ec6a6e Vicki Pfau          2026-08-11  547  		len += 1;
0a80b4e8ec6a6e Vicki Pfau          2026-08-11  548  
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  549  	/*
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  550  	 * Sometimes the wireless controller fails with EPIPE
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  551  	 * when sending a feature report.
0a80b4e8ec6a6e Vicki Pfau          2026-08-11  552  	 * Doing a HID_REQ_SET_REPORT and waiting for a while
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  553  	 * seems to fix that.
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  554  	 */
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  555  	do {
0a80b4e8ec6a6e Vicki Pfau          2026-08-11  556  		ret = hid_hw_raw_request(steam->hdev, report_id,
0a80b4e8ec6a6e Vicki Pfau          2026-08-11 @557  				buf, max(size + 1, len),
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  558  				HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  559  		if (ret != -EPIPE)
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  560  			break;
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  561  		msleep(20);
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  562  	} while (--retries);
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  563  
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  564  	kfree(buf);
cfa66cba6d02ff Vicki Pfau          2026-08-11  565  	/*
cfa66cba6d02ff Vicki Pfau          2026-08-11  566  	 * Don't log if the failure is -ENODEV, as this
cfa66cba6d02ff Vicki Pfau          2026-08-11  567  	 * can happen normally on disconnect.
cfa66cba6d02ff Vicki Pfau          2026-08-11  568  	 */
cfa66cba6d02ff Vicki Pfau          2026-08-11  569  	if (ret < 0 && ret != -ENODEV)
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  570  		hid_err(steam->hdev, "%s: error %d (%*ph)\n", __func__,
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  571  				ret, size, cmd);
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  572  	return ret;
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  573  }
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  574  

:::::: The code at line 557 was first introduced by commit
:::::: 0a80b4e8ec6a6e40937c7abdf8fb2ebe6cc7c1e5 HID: steam: Initial 2026 Steam Controller support

:::::: TO: Vicki Pfau <vi@endrift.com>
:::::: CC: Jiri Kosina <jkosina@suse.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
