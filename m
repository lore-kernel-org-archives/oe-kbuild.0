Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681774;
	b=gpUsTqKGOF3iT4gQBuigSR5ovbFw1DDOfa5X8Z+qHSOrIQDJaShm1ITE1hu3uoyXoDkL
	 WBtQ05RCaAr5ZF9nTXYEB4IRi47DI7QFOzvTyxZ+ry5/dOsPPcss0txUSD9r157wuWJ6b
	 2xstGG8Tm+1FHQSH+rUdChSjR7snW9dokXbX8BQg2zEXlVkYg6t+2BOeyWD40crxFnErj
	 Py8Fdsvent3RQWdr23w8Fgr4ZVOfpjw/5B0xmcgbQqaPimLlWy5zneUTaK6LQ5qPAXdx0
	 xSNL1kYixujoPQDMI8iKrW3FH698bGUP8YlMKh6Vx8zhwX5IwR7+it4cIbXQ1WHJZLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681774;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ItWu8667UlYi3AKmxHUxmSEEjfWhfnfPFVSphRk/ZQc=;
	b=v9mCjNVbJm/kZ3Fc5goy8NU9+zGwopq1tJVZgOhXqG6gN9/6PvdnLqthGvehwipvM3zk
	 8ZhvUPFYCa64c/MnfJxUqmZ06pin4EOovajyL/smHlslZ/nCuzNECAAKjVIhH0hmF+Pfc
	 UuDjT2KL7BL4F9AIuEGhV1zdLGGiPTUt/TO4gQ0b0TbI5WiObgv1gN5dPW7Yc3kDcNMYd
	 wrI6pZLrrxnvqUXojRE0LmqL1nYL1nrnxcSO2SpTJw2/KyZCX16Kh0EDYjsU/erTNBRNU
	 xfDUBmDhRXoz7ZN853qtjOlh3nOtbi5IrRuwLUe4Qnghnnh+dG4lyydqE9miHPdXHsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hW27BD8b;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A6B606A31E
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 08:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11A6B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hW27BD8b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795681774; x=1827217774;
  h=date:from:to:cc:subject:message-id;
  bh=1KWt8nLyb+HFr4K5NS8iBpVwWqnCqK+c1T3irPLMZds=;
  b=hW27BD8bto0zXQ3dei5IUkrxJI9sqHypU8CJqZ3ykpg17SfwZxDdG/VH
   RWdWe10xC8k6Ku1h4oE+ywIy/HwsozPAyvGLipBJZTwYijloSqSXUJ0fG
   KDFoioGMYa6hLHuAXgdPk8gLEQ8fJmrliOOD+hnZoXxcUJqgeLgjAu13y
   Rh4YyiFVnylIIS7NPY18aIi3CuSn5zCMnhZU2W9lo2u6EPgZrdvop6oZP
   HSNP9N2QB+QjpzySBW10aeNZF4kI+Pev4CGETCD2u8H4zgpCAgbfLa5Yr
   GkVMiYdBCa+8VGFTD6Yo5lNu7V/xreNrkkBV55CccuT6sJwOp2v8w/7jL
   A==;
X-CSE-ConnectionGUID: twe/7JprR3iNvCqwCA6mCA==
X-CSE-MsgGUID: vjNYCGjQSK6urhZDfa1HBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4486869"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4486869"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 00:29:33 -0800
X-CSE-ConnectionGUID: UPNWChqkQvWCwp8TrJFn3g==
X-CSE-MsgGUID: G3bo//KZSpWuJ+jm7is2Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="14150382"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 26 Nov 2026 00:29:31 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWUr9-000000000Hm-0RIe;
	Thu, 26 Nov 2026 08:29:27 +0000
Date: Thu, 26 Nov 2026 09:28:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 398/454] drivers/hid/hid-steam.c:557
 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__674'
Message-ID: <20261126091909.V8zezOfp-lkp@intel.com>
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
TO: Muchun Song <songmuchun@bytedance.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Chris Down <chris@chrisdown.name>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   739e2d979b66be560b608a38c4ff86150ec090be
commit: ed7787a0b69dfe1d9fdc73bf24456955ba22148e [398/454] mm/page_ext: inline unchecked page extension lookup
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-2200-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126091909.V8zezOfp-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261126091909.V8zezOfp-lkp@intel.com/

smatch warnings:
drivers/hid/hid-steam.c:557 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__674'

vim +/__UNIQUE_ID_x__674 +557 drivers/hid/hid-steam.c

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
