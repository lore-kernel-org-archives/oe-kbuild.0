Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276997;
	b=Tl6kQEol2KwHuIPgCtYCoXbPK+NJhUDrycZz3F2uG5msvf8yt9HhPFLgtcPbQO6Ux9kS
	 vorg9lZ6GF96BbM5hIrmGFEHYarT4TtIj8RrspzsbaatP2OkXwkhfPEIfbW7CHsbrvGm5
	 c7Lejb9wdvT0HbK1iXx5ECxuiYWit6QSE/jCLANRyqTjtMdVxNVHXPNPSAv+0XhRIIDk7
	 6gOo2ztbhscoBD+ri6t5+Af3q6KUrQQqS9YFrhp0nIdleYe9vUTebXYRC05NsIf8x0k8B
	 BwtMxaywZ2xLKI7BFpcxDaZ4riVbJEijr/vIxOatAmw95S8nA8WTmuLtNNFF1vPIn1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276997;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LXSfnaA2Hx8A57RG8vcjJbvb0axb/zhXfkTtjdp44xI=;
	b=tPhjsb/F1nL5yq8S085/OKWOca2rpE7/eIl0751FKvp6xeEG9FXXldPvxNTHiUBXhfva
	 k46DDdrNcvnOHG8V8451F4t4ljwJNhOuYU1jj6VeMDH32vjoZYuYcsARzWxn4XCoflrTI
	 ejL9vxj1doLGbkT8b4qeqf+AH4azQ4JF0JlBPoCBfS9eSy0odqMi6M9KIdvzJEmvAv94Z
	 3an8ly2hcwQdfdE2YTez2E7/PwJpcGkyKjrrcKNJhu3xaoyHENXZ7gwsgYFcbgXQK6/dz
	 LwB8pVa4QSQof2BjAf43jaYJxcEDV3O/6xx+IGqa7Iz0LR+B4428rLETbY6Hq1+/5/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="k/A9Evm/";
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BB6606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Nov 2026 02:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26BB6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k/A9Evm/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794276996; x=1825812996;
  h=date:from:to:cc:subject:message-id;
  bh=VQwvlxAPuE8lvm0sS3ZlRvMCSp5dOl3bWZbXYcLM8/s=;
  b=k/A9Evm/qQt5eafOZS/HOlRH4XneIro/muFuYPHTsO2hbyULSoYfKLds
   kq8xhCB5maYlZkoQiGT/rZnzQpmEd1COcLqFjA0NyzZ7OZIn/urfdfKDI
   I+53PirOVptBXbttlbUujbC5TnGnqZA/1XGFAD340gv4mhjRbZClkzc5B
   BsO34u4u401WyFBgeo3mNRrtZaNKMsCUB1z+6ilXIvN5xkYMMcviZ/Uqe
   DeTRfcnS4K0mDebXwTMUkk9121uj0XJ92eEVMu2FYn4oDDjHGhExGOjIf
   7FfOtGe/O72VYngEV74gJRFEsSJ5I9CXo59N8T51/gkvzcdHMvF4fNMcp
   g==;
X-CSE-ConnectionGUID: tAqxVi+tSgaCj+ZeHQgE0Q==
X-CSE-MsgGUID: 1XYKCzlZTgumKPmVRDAyRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3048084"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3048084"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 18:16:35 -0800
X-CSE-ConnectionGUID: e8dA5Dv3RYunqiWd4dinPg==
X-CSE-MsgGUID: ZGF2vYqyTlaHg6RSW4oIFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7882947"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 09 Nov 2026 18:16:35 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQbPU-0000000009L-1EAx;
	Tue, 10 Nov 2026 02:16:32 +0000
Date: Tue, 10 Nov 2026 03:15:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [groeck-staging:hwmon-next 185/185]
 drivers/hwmon/nct6683.c:1477 nct6687dr_curve_mode_reg() warn: signedness bug
 returning '(-2147481080)'
Message-ID: <202611100315.DoxU8Gyq-lkp@intel.com>
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
CC: Guenter Roeck <linux@roeck-us.net>
TO: Tomasz Bojanowski <tomasz@bojanowski.me>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   e0fdadf444800610828d01b299743f79ae3bd27f
commit: e0fdadf444800610828d01b299743f79ae3bd27f [185/185] hwmon: (nct6683) Report the fan curves of MSI boards with NCT6687D-R
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: parisc-randconfig-2200-20261109 (https://download.01.org/0day-ci/archive/20261110/202611100315.DoxU8Gyq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611100315.DoxU8Gyq-lkp@intel.com/

New smatch warnings:
drivers/hwmon/nct6683.c:1477 nct6687dr_curve_mode_reg() warn: signedness bug returning '(-2147481080)'

Old smatch warnings:
drivers/hwmon/nct6683.c:615 nct6683_pwm_reg() warn: signedness bug returning '(-2147483296)'
drivers/hwmon/nct6683.c:954 nct6683_cmd_reg() warn: signedness bug returning '(-2147481048)'

vim +1477 drivers/hwmon/nct6683.c

41082d66bfd6faf Guenter Roeck     2014-04-06  1474  
e0fdadf44480061 Tomasz Bojanowski 2026-11-09  1475  static u16 nct6687dr_curve_mode_reg(int ch)
e0fdadf44480061 Tomasz Bojanowski 2026-11-09  1476  {
e0fdadf44480061 Tomasz Bojanowski 2026-11-09 @1477  	return ch < 8 ? NCT6687DR_REG_CURVE_MODE(ch) :
e0fdadf44480061 Tomasz Bojanowski 2026-11-09  1478  			NCT6687DR_REG_CURVE_MODE_SYS(ch);
e0fdadf44480061 Tomasz Bojanowski 2026-11-09  1479  }
e0fdadf44480061 Tomasz Bojanowski 2026-11-09  1480  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
