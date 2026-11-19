Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053538;
	b=lny/K33bPY3PXbuSrTcUiaBRSrHitn14ibDc5pzgmte9l9qh4++wfpTVEClWgb2dS+ES
	 Rq2jv9sSBZrhcqLaGJGgo097IleVoNJjB+aYVUQbthWzqL1Zdy0MNpj1BLggt69Rfzcs4
	 JtLdYAmT2/jsWsMl8CNqQZFVgQLadIBesNeXoGhx6+eOIlx4kbKTmavFfAYF+4WSl3XZW
	 mzV+CkFOnJq43yXB6B8/fmP7ESSPqnoUf0FqGddXrUQIk400YnzGT3zHpH/lPZRXzY+KH
	 S3X1nI1nqajhsADKncj2R/PyCs/2+8byUeeGah03q3iTSuQ932oyuwXYlUJoU3eX5WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053538;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+h8majoo3jWM1N0zsTfDiXujBqy5fEWv/Yla/SnfCnI=;
	b=s2ZVLmbFgO8c9ZQYtwCodQ3QFue/K3F5V2UllGb/mRU/HpBEo3kLyCoC3s0kqieyH6yg
	 ZJ3KAN+oWrHLdKBbu1eRt1kmeMzV1W3ZCGYC8TUnXWp0/yPKl7Cm3s82HvYORS4N76//F
	 Z9cnTUV/Bdq9QiVgandg7WQ1C/5pzqsUlGi++sB2CkCrRLPtXGP+8oId53DDCBZgLnj4J
	 5oz4p+qPsbJo0k49VKDEgSvGSH0hjb88udg3CoXiWbQOJBGkZ9aWAqFZwlRde44vQGZQ1
	 VKkth6AicaWp9J9h9A0Z6CPg1J9MQypJBVP1pqOh705fUfyQfE1Bvga86INqcY+tPlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A2qswLpk;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF06606A335
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 01:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF06606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A2qswLpk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795053539; x=1826589539;
  h=date:from:to:cc:subject:message-id;
  bh=pNGBq0vufHUme5G3K9xb3vfpQ7cP4zPo1VLqq3N2Tyc=;
  b=A2qswLpk+DMCD0ahQD8UplBPLuSBRvKQCIemN8uMOXybbYF0zxFt9ZyM
   R80/TZUCdq5w0gGFq5VaYRM5R7+8p6n7TGq4qA762nvdE2Otn2gIqMQqE
   P0L4BMzPlh/KuwLEv2q7eDnw4rsf8X23fcFzOVjbWj2ayD4lqiTPDp1Cw
   UX7rAq66i/FurLIQ5quuzZXmo+VoaVQZTmhOu874cauIFolQ/SFaUuq5e
   yOlhYFJ1Iw2UAkwjA9fFTJ1+3yp3xB+bmyiEhSHNoRXbITAYG8pj1PmSl
   alHUihYRBLvSgLCGq5ozt7ygv6XtkCBw8xu17+KQVbJmcir32+/7uN23R
   A==;
X-CSE-ConnectionGUID: qobXRuRgSyqRKBakRVxDZg==
X-CSE-MsgGUID: iVe8ECEwRH+3Ubdnd45T0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3789627"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3789627"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 17:58:58 -0800
X-CSE-ConnectionGUID: 5eZPj4JtSYyIM74hUghZYw==
X-CSE-MsgGUID: O+Ofpl/aQKuv1gRBXBPEKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10659996"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 18 Nov 2026 17:58:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTrQM-000000003aX-3AYO;
	Thu, 19 Nov 2026 01:58:54 +0000
Date: Thu, 19 Nov 2026 02:58:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 197/287] drivers/hid/hid-steam.c:557
 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__533'
Message-ID: <20261119025138.nSEoa3vq-lkp@intel.com>
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
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: Wen Jiang <jiangwen6@xiaomi.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Barry Song <baohua@kernel.org>
CC: "Uladzislau Rezki (Sony)" <urezki@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   376fb945578b6a1f0001fe27adcd01b11340f4a4
commit: 68168a9931a4ef18ca42376c7858f2f77454dae5 [197/287] mm/vmalloc: use vmap_pte_set_huge()/vmap_pte_clear_huge() for PTE-level block mappings
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: s390-randconfig-2200-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119025138.nSEoa3vq-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261119025138.nSEoa3vq-lkp@intel.com/

smatch warnings:
drivers/hid/hid-steam.c:557 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__533'

vim +/__UNIQUE_ID_x__533 +557 drivers/hid/hid-steam.c

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
