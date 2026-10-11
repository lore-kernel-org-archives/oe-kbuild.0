Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEDE3644C6
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Oct 2026 08:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791705935; cv=none; b=Hx8M9JTivPyws2uaqfbcrcqmaM2iO93+52MQHFIMh0zbK2KX78Uj08zWC8MpJOZV02Dc0hE1tG0/iQjvFLjRlagpBp3Zv3OmDrq9rMltnZXUN8GZHurF0zvKdroDi53dTxNxZ+VltEKvnxd6Q3xYx+o7VRky93W9+2qG44xCvWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791705935; c=relaxed/simple;
	bh=cfSxlml6s5WdQgzcsHShU9+/zp/OEAtgY21GY3gihO0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RlKAUQr9MKOsbGjOpMMoJcwQmlYDzWFhdFiY0a3JEFPBwsc9yrjDA7Q9CfD4agpzwL/HDsnIQ5rXI7wXx8aeHunxMEipe1HAk9SViAn7TittwF+RvvamG2Ua0M8PwaXteiP4D0EhaLLj6DdeyWGnSFAdIYRCNUSoJsh144lLALQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XUvbjDsp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUvbjDsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791705933; x=1823241933;
  h=date:from:to:cc:subject:message-id;
  bh=cfSxlml6s5WdQgzcsHShU9+/zp/OEAtgY21GY3gihO0=;
  b=XUvbjDspKBY8v2p0quKF05ntmltAVc0uUuz5qvz8fJsT+4CYzikRQQt9
   c4HnqJke8bv6gDSG9ksfr9LNF1yeE9UKi6UzvhM2mb7MgTtdZkqV2GpbE
   EouYr5sbuyq/Xg4S2aQAgd7WaNgFLFVIOw+tVNo4l+yEEw0pdyGfM3gm+
   RL5i1Letu0ZNUShnEg86bEW6henu0V5sAezcT7XB4e9gEDUyMYIqrNy60
   nkqT7pkt7fGc1vr54JcI8OIcPzzTf8ey5uNN/d2tLPGNUxeMQMGvEiyjY
   35HDBBlhx0tyavO+zFoGGQA1yA6l0yhNih1Oq6hsGFxDeZPyp2X71SCIh
   w==;
X-CSE-ConnectionGUID: 3rEVIZPGQsGdem9i09LACw==
X-CSE-MsgGUID: FoMMGV1dQz+Jd0l7BjE41g==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="444397"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="444397"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 01:05:32 -0700
X-CSE-ConnectionGUID: i+LT476dTL2QlEoZnnQTmw==
X-CSE-MsgGUID: d5720g0LScGwImQ46SPfWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="1106861"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 11 Oct 2026 01:05:31 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFoYi-000000009RP-1ctK;
	Sun, 11 Oct 2026 08:05:28 +0000
Date: Sun, 11 Oct 2026 10:05:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 153/308] drivers/hid/hid-steam.c:557
 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__592'
Message-ID: <202610110904.3aIbLUAr-lkp@intel.com>
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
head:   bda0bb3703bf54520057f7fc1551cb254c21796d
commit: a7a82e63311185e7ba9879f1d1889cc2241cd622 [153/308] mm: add mmap action for discontiguous kernel page mapping
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-randconfig-2200-20261011 (https://download.01.org/0day-ci/archive/20261011/202610110904.3aIbLUAr-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610110904.3aIbLUAr-lkp@intel.com/

smatch warnings:
drivers/hid/hid-steam.c:557 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__592'

vim +/__UNIQUE_ID_x__592 +557 drivers/hid/hid-steam.c

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
