Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3723219D071
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 04:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769661655; cv=none; b=n9sS9hI0cnftCHSH0lRJ0B07UMcicmFAYb931cvEvmMREi2CyoscRyAO/UBv/6FujyCzgym1dmEqkmWYNDANimDHPNTQ3qwzFhOy5/JNUAaS0SKWnxdeF333dtlf/cSOBxuVCYSzfPN6LxMUNDU0jzqBao9jYBPuXFbaPZons1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769661655; c=relaxed/simple;
	bh=/nCALu+0NWcQ+9IS5ANmv/XfuYGu6d7QyHEyrovbFms=;
	h=Date:From:To:Subject:Message-ID; b=MMV19f7CAP221GFpwoU0M8LOpLs6kUGcjzNDy8y7PTKfO871K6JBDhaIclMa7KPMDJJFIoHGubttoOq1CxjGAj0XZval7IUq92PGPdSKca6VKJ4QoNqVOBdK682v5e0/UM8XMVeVnDEKxYZlBtN+y2ln3RO+rcAunwlPRZfKyBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgCi0SAl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgCi0SAl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769661654; x=1801197654;
  h=date:from:to:subject:message-id;
  bh=/nCALu+0NWcQ+9IS5ANmv/XfuYGu6d7QyHEyrovbFms=;
  b=GgCi0SAlR7+2jUhOrLtCy9Vae0DvlTQ5b005j3p4MQn2/xyY9BnU0/m7
   u6kfT/4MW8xhesuxduWRcm3UZK+n2ed2eqwuXo5JlWgIABWp9dOCyASmP
   VKl0Q4+55KoYw6gxbmoDFl2N8OUDAA/BDjTk1hEI8/1S5Iet7IffppKyy
   tzz00ZQu/ZyH7LB0uHUWNp1SmBrWaN2PlZzPF3gxOh7veik2imTd3Ewy1
   6Jomu4x86zUtPnA0Ymkgx7fHplU6lZlOMGOyL5HsuRtvt0lZ/B4DYxB4Y
   ha7FjHyxTUX5J9nlhmTUnc8EuUWAmOk26s8HwOcegbJwQu2DrdQZHUAGD
   A==;
X-CSE-ConnectionGUID: KANG9k3aS52oAnb870qVfA==
X-CSE-MsgGUID: IYrR0ljTRXaIcbr3jGMrew==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69903768"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="69903768"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 20:40:53 -0800
X-CSE-ConnectionGUID: jHtFQu0PQVKt92qcIrNJyg==
X-CSE-MsgGUID: cnqpx4pDQfeHAQfiZDAQyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208362137"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jan 2026 20:40:53 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlJpr-000000002Ct-0Eii
	for oe-kbuild@lists.linux.dev;
	Thu, 29 Jan 2026 04:40:51 +0000
Date: Thu, 29 Jan 2026 05:40:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 37/39] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'vmlinux'
Message-ID: <202601290506.1YeA1GHK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Brian Cain <brian.cain@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   64417972b86f5eb0d4a466436b1fb43da5692dd6
commit: 7324d95182a4938f8a57816c9a6605bd7b8f5cb5 [37/39] hexagon: add QEMU boot documentation
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260129/202601290506.1YeA1GHK-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'vmlinux'
#109: FILE: Documentation/arch/hexagon/qemu-boot.rst:68:
+    llvm-objcopy -O binary vmlinux vmlinux.bin

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
