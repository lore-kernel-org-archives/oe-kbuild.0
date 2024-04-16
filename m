Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC4912D1FD
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Apr 2024 14:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713277076; cv=none; b=XnfjxPRVKUqFBUyPH4jKGUtULyOen+yRHS6A7dNfqAvvcgME8JPwfw/vAH/Cqevc0jfxc2ixAZnfWIwy9v++/O/bGzu+6VJg2OH8NI2AhoNcL4m1N1k4Vwejs/EV6rlV1eXWZXgasrvUeFz8Yz0i9s2HL/bvoOxjwWaO3HmtvVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713277076; c=relaxed/simple;
	bh=o4jWOb+9l83dq05so+o0QUxmot1+CKERAsNpsP5Y4Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PLah8x4KX0RYwfV83BtJlcGUTv1OW2EVzb+9YnC4vv7/KhBoXqlEH1hA8HO7p2pRrpEC+k6vDIvhwSCCvLzz7H9XNiQzKIfDCHbBeH4VuaXMAmsxExdWn+XvercWwydFaz6kkz1XhQuMReKcfYlbgl7bS8X5268UndCPVXeMTq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHJ67cgH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHJ67cgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713277072; x=1744813072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o4jWOb+9l83dq05so+o0QUxmot1+CKERAsNpsP5Y4Ig=;
  b=MHJ67cgHMSWnAKKIUxO8v1oEG8nPRz17xvdC+VXkDYnq9tBoghMtwLbk
   mhxsoCyMiEVFLvgrPkNtMvCOwOkvnlPppMNjzwqd8wGKrYWey4bwrt+p6
   KZojRADHKa3xfLkzxSgBJowKLtLbNmtR5UVqThV9HuhxYkI8k5l9aDry3
   c/SyskpJTe77fBvsTKsN18P+bDhq5I+Uq+kFuUXWS+wSNnawvo3n4VSqv
   t5DIAUyHlA41KaTCgDCNkeBsJ+gMTaeZieA/cgkLHaq4v+9IatN7RhgXP
   AkAEtuhH6clgCTYpE1/ietaEWnn1AxwxrPM1AflDiHZl/HH8cCL8Qstlb
   A==;
X-CSE-ConnectionGUID: kVvUBjRKRoeP6Tk7LMjmmQ==
X-CSE-MsgGUID: wzoE8famSsuZj+GKJvXjCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9269538"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="9269538"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 07:17:49 -0700
X-CSE-ConnectionGUID: 7WAdqQY0S1eWMP6hA/BtRA==
X-CSE-MsgGUID: 6/8ejpfgSLG53ZBuf+MtFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22334572"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 16 Apr 2024 07:17:48 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwjd4-0005Lk-2a;
	Tue, 16 Apr 2024 14:17:46 +0000
Date: Tue, 16 Apr 2024 22:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-5.15 1/2] dtbs_check: make[3]: ***
 [scripts/Makefile.lib:374:
 arch/arm64/boot/dts/mediatek/mt8186-corsola-kyogre.dt.yaml] Error 1
Message-ID: <202404162229.PjMBka9A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-kyogre.dt.yaml] Error 1"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   774e34a1a9558877ecd953ce06050dad9f8ec23e
commit: 6a56c562033c79ee370c07d7f04342018b4d98f5 [1/2] CHROMIUM: arm64: dts: mt8186: Add corsola-kyogre board
:::::: branch date: 2 hours ago
:::::: commit date: 8 hours ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
dtschema version: 2024.3.dev14+g64b72b0
reproduce: (https://download.01.org/0day-ci/archive/20240416/202404162229.PjMBka9A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404162229.PjMBka9A-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-kingler.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-kingler.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dt.yaml'
>> make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-kyogre.dt.yaml] Error 1
>> make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-kyogre.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dt.yaml'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
