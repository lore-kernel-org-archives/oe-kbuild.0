Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592E82BE04C
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 18:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760986131; cv=none; b=mNKwVPDGdE0pKSKmH1q1uMF9tqElueLcgFf0zazT8WeHM3Yao2/ZSDbCHUyHRM1ULakYN8n8itTSoaTTkw+g9+6Lkra0Ffjt204vf8uoawoL3hi0dzpXsOgcRZN9sAIEVMoJ26mLYrDYOI4uMMh9xg1V3qWltUX3abONcIVYmGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760986131; c=relaxed/simple;
	bh=b3biMJT1Y31CAA63wAvcKtJnZ2pOM+xyNDcED56ow2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u/y1IymX5vNkhAJy2bK6/GCychkb+WFUx4NNX2Wba911GSpIGXM13oNGS+lreOuxQBKB0Hhgebz8crDRQ8wFn8TpPyMagpFe8tKl65ZWfg7STpKllGbOZHHtVMuYvaTBmY7Mlz+4ea7I6htZNZIq8Hx7dUoyoeJvnH+9Fz/unqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0281BUk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0281BUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760986129; x=1792522129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b3biMJT1Y31CAA63wAvcKtJnZ2pOM+xyNDcED56ow2s=;
  b=c0281BUkEcLOPCPj0AzeoM+oe/CVAVCXTpN4cyU6KReDs7sI27zmppfw
   cNptqVveI36NjAdOBO8cRXRHRaTgGi7sZNDlhY7E3xZn1hd6MPEpBz7HX
   ITR0TiRJk12yFOEiij5Fccjn7xcFVkisoA8Rvyrj81CrysjDs+ryF2TQA
   VerqBVE9+mUoGZfLXcurgynD7yulxQCORLRMk8RrMglLFx0WsH+h3/34/
   NZ4FqqfCFRK44DGL5zXn06amdoSah3mPbMvIGTFwVmlcz8AQh+Uqzfl9S
   VvyBYGxhjk6E1stZC+/mVJRAyD5Aiye4yjPwzyRWEWOoeLpQ3AYqG/AJ+
   g==;
X-CSE-ConnectionGUID: prszEveAQYWRuHuIRLT7Xg==
X-CSE-MsgGUID: 0CR6eXKsSTqhqNNf76aoVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73398494"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="73398494"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 11:48:49 -0700
X-CSE-ConnectionGUID: i96qoGaUTl+hus68OXGPBA==
X-CSE-MsgGUID: MTplO0a8RSWCiPTv5/+jTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="183807196"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Oct 2025 11:48:47 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAuw1-000A5L-2b;
	Mon, 20 Oct 2025 18:48:45 +0000
Date: Tue, 21 Oct 2025 02:48:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-5.10 3239/3239]
 tools/power/acpi/include/acpi/platform/aclinux.h:198:9: error: missing
 binary operator before token "("
Message-ID: <202510210250.7SqF2rX1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   778ac52b2e93163892e99cf06ec8021b6c1bab72
commit: d1c564ec2caf3397821e747c783bbc3600fcc782 [3239/3239] ACPI: Support ACPI_MACHINE_WIDTH for 64
:::::: branch date: 8 hours ago
:::::: commit date: 2 years, 8 months ago
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210250.7SqF2rX1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510210250.7SqF2rX1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from tools/power/acpi/include/acpi/platform/acenv.h:163,
                    from tools/power/acpi/include/acpi/acpi.h:22,
                    from acpidbg.c:9:
>> tools/power/acpi/include/acpi/platform/aclinux.h:198:9: error: missing binary operator before token "("
     198 |         (defined(__riscv) && (defined(__LP64__) || defined(_LP64)))
         |         ^
   make[3]: *** [../../Makefile.rules:24: tools/power/acpi/tools/acpidbg/acpidbg.o] Error 1
   make[2]: *** [Makefile:18: acpidbg] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
