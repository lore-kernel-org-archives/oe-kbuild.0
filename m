Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D6E1FDE31
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Oct 2026 16:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873931; cv=none; b=brwJhfbJtePtGBPlfW+VosgiPl6gzWwwRc5FdjN7H4MYaqGqjLTdd1O6OAKpDKkfzRwzK1F79VXa7zHtrQJGxzJIwzNH/LAABqajmwd2yB8zMnRiwlfLp13sc/1FfM+TqCT4YnPH0Np5bIGs78q9kg/YRQdrdR9H7zY9dWrJBUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873931; c=relaxed/simple;
	bh=5bJGzhAz90QEG1GVDMFMDrp6VOHy0Sra4trMCfHqQx8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Myms2N9y0NX8g1tnhOMuhfi3Qgo/kq0NGmbsKo/4dNQ3Kvf+HwlrWYqbU+agaZShG2zdo6VPMgMCZ8N6tP72/DyQ0ovWvtlq8jTKJbdtTN862OSzlcOYE09L97qXL5lfMDmLvsowratsQf4CX7V3CMQjASHuNOYS7h1tdKLRHyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSmKmHur; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSmKmHur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790873928; x=1822409928;
  h=date:from:to:cc:subject:message-id;
  bh=5bJGzhAz90QEG1GVDMFMDrp6VOHy0Sra4trMCfHqQx8=;
  b=VSmKmHurf3JzbZPucir5gY3A133NvzOTfJAoVROo3UyY65fZjh3uEP8T
   k1RtxaR6BkVO0v8jhSTJ4Ngqquk4O5nsw2BILPr+KpxeJp/YXLgW5OM+D
   vWHL2ZMKQKerp5iiJ7OV71hc8b+ogECpy1GRJ06CUo622LHNWT/OEEiv9
   w0xoIx0fnGv3fsUkUaubLBUUIrgPS6RJnkuCnic9zy/OI+F46N8Y9EmM0
   ghKkmME2yr1NTNhJjivIy44qLW9AnojvdtvA+xi0fsAT/VMBRwmCOs8g1
   D/iDJQThM1iOwBAAloYzcn6aBc7+gduQ6jxaOi/aq9QV7c5Vcrgs8Evtx
   A==;
X-CSE-ConnectionGUID: PUSdIve+SgKN1ncuXlU8tw==
X-CSE-MsgGUID: pQktaVcgSTO0teGZoq6FjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94353610"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="94353610"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 09:58:47 -0700
X-CSE-ConnectionGUID: SKmBGoIwTxa+nEDuoHioBg==
X-CSE-MsgGUID: H0IsPv8RRJuY9mlzZhdbzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="284101685"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 01 Oct 2026 09:58:46 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCK7G-0000000009H-1Jre;
	Thu, 01 Oct 2026 16:58:42 +0000
Date: Thu, 01 Oct 2026 18:58:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:sched/core 16/25] drivers/hid/hid-steam.c:557
 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__507'
Message-ID: <202610011841.x1lrKFqP-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Shrikanth Hegde <sshegde@linux.ibm.com>
CC: Jinjie Ruan <ruanjinjie@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   1fb28c664a19df8d45a6afa04d28d102b04ea680
commit: b9d267b9d632feec9ddd1ce12078b7113f429a51 [16/25] sched: dynamic: Simplify preempt_schedule{,_notrace}()
:::::: branch date: 3 days ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-2200-20261001 (https://download.01.org/0day-ci/archive/20261001/202610011841.x1lrKFqP-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610011841.x1lrKFqP-lkp@intel.com/

smatch warnings:
drivers/hid/hid-steam.c:557 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__507'

vim +/__UNIQUE_ID_x__507 +557 drivers/hid/hid-steam.c

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
