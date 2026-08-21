Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB9C43BDB4
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 15:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787327758; cv=none; b=V1QLdMiS3Q70yfxVIfCF8wHdaKYocIYviu9wp1rkNZXxIbCnQ4LBmXn/wT97/bDfJQJQmFn6o/ubP1m52HYlUSE0baEteZKst/1Igtfo5BkIIuCglfOeRnvBpCPVG9gF2QmrJ8UjRTf8JJLfywVXsRW8aDu2aJibrmkYm7W9rZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787327758; c=relaxed/simple;
	bh=wOA5dSKHhnI1syFBB09+kJK6Ag/xdmk11SPc3RMhbso=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CPhxwab0bMkpYePdcD8sOK2e+fJv/VYXwAg0sK4j6vmXIeRX3vn1A9ghlSqk26REPW6NSW3U8fmEry46SMWfKtbCn5ZNg+s4T+e2uNbpCPnJ6bQkKrZEJUPyhOfWEV/4FFa4xVtO2DePUgaKIMhedhYivcvGPKojMhBFf9D/8yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsEFm1IH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsEFm1IH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787327754; x=1818863754;
  h=date:from:to:cc:subject:message-id;
  bh=wOA5dSKHhnI1syFBB09+kJK6Ag/xdmk11SPc3RMhbso=;
  b=BsEFm1IHhHl1TZEoQLFypa0mves49QuX/nNCgXEH/Orqddy7aAEQcBEb
   lvzXni0p+jAY5R1X4QHs7J2lRntj7bwhWlVKeCnLzW1oHXAl0YWUlTqXA
   z0v69UNj1ffIyQfX1PoViC8yW1I7u8hlGZ8NhcrApuNWY/MUQCuNCBhUY
   uVw3RJ8DA2qsCmZ8MGYlTdha7I3cGqN9LrAvtOsF4zpVXumxzaYoJTwzu
   jbwGgx1/6v5FCBYEqLJCB/qCRHVXeZMF96FWoDWt8PDPQPvXzSDUvhZ78
   DVDLDtihxTvLHqbG8ln5Kw5kG1A9x9/HFroemD/+sHBE5fos0I3k/eAfF
   A==;
X-CSE-ConnectionGUID: YeV8gisuR8i+wW+0wzTjyQ==
X-CSE-MsgGUID: troj6XXsTW2RUdtrKGbH3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="105416537"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="105416537"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 08:55:52 -0700
X-CSE-ConnectionGUID: f+dtUTS6RwizOjjhWY7i5A==
X-CSE-MsgGUID: 5qQAplEMQiOcZsoNur8vtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="263733207"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Aug 2026 08:55:51 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxRau-00000000q83-3C5Z;
	Fri, 21 Aug 2026 15:55:48 +0000
Date: Fri, 21 Aug 2026 23:55:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/hid/hid-msi.c:1274 claw_rgb_queue_fn() warn: can
 'drvdata' even be NULL?
Message-ID: <202608212345.DvQUBcaE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Derek J. Clark" <derekjohn.clark@gmail.com>
CC: Jiri Kosina <jikos@kernel.org>
CC: Zhouwang Huang <honjow311@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   818bebeb63dd6bf5f4e07e145f6cdbace520a34c
commit: f27e2e3c80edb2ff09c3bb3ee1605c86c64fcaa8 HID: hid-msi: Add RGB control interface
date:   3 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 weeks ago
config: csky-randconfig-r073-20260821 (https://download.01.org/0day-ci/archive/20260821/202608212345.DvQUBcaE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f27e2e3c80ed ("HID: hid-msi: Add RGB control interface")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608212345.DvQUBcaE-lkp@intel.com/

smatch warnings:
drivers/hid/hid-msi.c:1274 claw_rgb_queue_fn() warn: can 'drvdata' even be NULL?

vim +/drvdata +1274 drivers/hid/hid-msi.c

f27e2e3c80edb2f Derek J. Clark 2026-07-20  1267  
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1268  static void claw_rgb_queue_fn(struct work_struct *work)
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1269  {
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1270  	struct delayed_work *dwork = container_of(work, struct delayed_work, work);
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1271  	struct claw_drvdata *drvdata = container_of(dwork, struct claw_drvdata, rgb_queue);
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1272  	int ret;
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1273  
f27e2e3c80edb2f Derek J. Clark 2026-07-20 @1274  	if (!drvdata)
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1275  		return;
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1276  
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1277  	scoped_guard(spinlock_irqsave, &drvdata->registration_lock) {
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1278  		/* Pairs with smp_store_release from cfg_setup_fn in system_wq context */
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1279  		if (!smp_load_acquire(&drvdata->rgb_registered))
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1280  			return;
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1281  	}
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1282  
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1283  	ret = claw_apply_rgb_state(drvdata);
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1284  	if (ret)
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1285  		dev_err(&drvdata->hdev->dev, "Failed to apply RGB state: %d\n", ret);
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1286  }
f27e2e3c80edb2f Derek J. Clark 2026-07-20  1287  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
