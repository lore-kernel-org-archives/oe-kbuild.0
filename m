Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384317;
	b=v4cdQmYmsQzd1VY+/pCfRS/1Vacox6ANqw1APTfn3ASM6p9KRMFEywq/nnN6oi8T0k08
	 WMNX/XO2PSw+UUVmJOCKSET6VBgKip5jQ+hpKN8zQeKEZjVOmbFRsqmdrLNPp7ZI/qnev
	 yTUkV9PiDxTH6SsqOP4umcUfYexu0zqlQr1HEysQizsUNg9UjWMN/UjvKHppbPsXVgPWc
	 k93W3tbmBSrLBRMjcT/Wm8EaALJmTHE5kW2+XO14j9SyIaNyjQ06e56/i8hkafODwbnLm
	 ytEJO/1aADoRLvKvRuyew3vPdDC+lEpHfSuwUABr6D+CGx4jbtILqiK5eSKE20N6CwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384317;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=TwVFykanV7OPXCr9//Ol9k9TTEMgidv1YLszq9aM7CQ=;
	b=z1wG1bqob7rzU8Cwaca3baKjA+KYQiVJ8IBcMaYgLskRK/HpSiaw0nZ1KGAFrWJG9qaN
	 eMhGWl89TV7WhBstB8Y+uNX3/YEJpxUdl3uzN1e83JHR+tVzhqvuH0HOeTMha2fikEV+w
	 uiFtbhnAbrlTLMHda/mhlM7bECEFzql0XGglXsj54oq1ROf6CKcamWlM6pS0V9yzrF0E8
	 Q1Ig7W87zFDC/1KtPdGybedqpVOct3TVrHNobc7Vm4q1ck/lrMs9R1ocU3ajxmQrXMjS8
	 x2nutqhtkO2T8fyeAVO5/do+PoUBXyPi2XE5Wta4t/GIgGd4VLD2zcplVomTBAZJKGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XWeVBpmM;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19D5606A320
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Nov 2026 08:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D19D5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XWeVBpmM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794384317; x=1825920317;
  h=date:from:to:cc:subject:message-id;
  bh=qnUTsruAOF3+p9GxgYN3/zZ1XHGKFK+vvGukRvRegoU=;
  b=XWeVBpmMRS2KYr4NgFDzA9xvj1JhgtOfgsAsTzBPy5cSraK6mfRseqJF
   zDp2n7v/iPIJmPhdvCQc1GDVINdY1zDZ/dcl5/v9sZ+YOA30xwiMxW3Tl
   I2GwZlfoIb0WhQxT2w6eVWALqKuY7p/l1gx98n2nXt4rmAKa1m/bLYkCh
   lAc31DUk3vLj/mZf8Ux2e5lC6JJGmsgvQ//KV7ln1mUmT5IBMTf67uuFg
   JWvwSQmKPEpUJmwb19sRDZlLxYC4gu7SYZ0jw2nV6huzw7q/f+Zv+qaw7
   ow4DG3ZZOI0PaZswNA/+2AwBr0QJ2iNl4fUYQWu+OIpmcaOiK2pnlNtzw
   Q==;
X-CSE-ConnectionGUID: jf+7LgdHRI+sIL37vfzJaA==
X-CSE-MsgGUID: o15tKf6rTOSfZQs3vpU+Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3045696"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3045696"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 00:05:16 -0800
X-CSE-ConnectionGUID: JKphye9OQmi9M9hCEgFu0g==
X-CSE-MsgGUID: dvY0cVmjQkK7xQjmeUCP7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8339971"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Nov 2026 00:05:15 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR3KT-000000000XX-04tR;
	Wed, 11 Nov 2026 08:05:13 +0000
Date: Wed, 11 Nov 2026 09:04:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 220/229] drivers/hid/hid-steam.c:557
 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__991'
Message-ID: <202611110857.G137BvrU-lkp@intel.com>
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
head:   d3925707865d051ba04d5710d60550776e744368
commit: 685a45a21d2d2935885d7f0c40fc4217adc9b3eb [220/229] mm/vmalloc: use vmap_pte_set_huge()/vmap_pte_clear_huge() for PTE-level block mappings
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: x86_64-randconfig-2200-20261111 (https://download.01.org/0day-ci/archive/20261111/202611110857.G137BvrU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611110857.G137BvrU-lkp@intel.com/

smatch warnings:
drivers/hid/hid-steam.c:557 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__991'

vim +/__UNIQUE_ID_x__991 +557 drivers/hid/hid-steam.c

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
