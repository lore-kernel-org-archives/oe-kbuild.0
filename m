Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181A6324B09
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 09:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383178; cv=none; b=SYQTzvuG8unOqrp+e8lNlzNVYm1MyYdOAP+d8fR0U9gFrn6NcgjhngqGwgIYybudrwkXtYumfexvE2PDSdjNTjOJJtPxA2ZJ1ELhzvraOvQPQAW9PiQ7ivp/M0MvUTQknCHjLdhfmnJLNFL5RQh+PmMLVvTWaLJied7VeeczYhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383178; c=relaxed/simple;
	bh=+JjVmqyPOKuyj9B+LyLlME44gfxErgOVAG2QPOXBLxE=;
	h=Date:From:To:Subject:Message-ID; b=LB9S1d4h4g/N4fxgza9SHpm6A2xCcGTVK0HRk8xt6D0lXxN7f2pdtIDh5Qn9he+yMJDgHtU4PUV4RKXD0O+zgV0QYC5PHEfhd2rWsSaB1EE2nL+sCqeB1hXu2i3i9j34ekeaQQR/jHPdvL/3PPFHz9prx0AC65tJU/ssQKzDXvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTCE+42v; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTCE+42v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768383177; x=1799919177;
  h=date:from:to:subject:message-id;
  bh=+JjVmqyPOKuyj9B+LyLlME44gfxErgOVAG2QPOXBLxE=;
  b=GTCE+42vh42OceK0RunkdQEcmuaZQKb7D3U9yt90v9GG8wAaD+Gh54rv
   OtSKVeJyMx6S3QevOPTLfmjmFOSS6t84SwYUVqShXGOjxRzirJ7TSM5lR
   WEyIBWJ98g8OsR6braoJ007v7U1qGmxDXsqf8+tFBt/S+depMz0MHgRKS
   9JBF6SJExowVKokaP9Sgcd8Nr4sFh34ddcDXY5XbwQrcYXSPyTTFj3Yl8
   ynrTYAYaEVYkOWky+ZAZ5FyVziKYJ1B8HbOO4oIYOPZUNtPFEhHgwQsg2
   Jikmku54soAAGJY2ao2kKfTYdnCg+vAHxHQLY92fTyjlwIXVF6hOd5+nW
   g==;
X-CSE-ConnectionGUID: owdRZO6xR+SJFXLtEfJxUQ==
X-CSE-MsgGUID: w8ap2u+pQfCkxKIRon2I5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73518531"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="73518531"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 01:32:57 -0800
X-CSE-ConnectionGUID: 3UjSiLsjQ6qbZZ86WZBH3w==
X-CSE-MsgGUID: weWLhLX8SsmcEafv2eHDMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204913057"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 14 Jan 2026 01:32:56 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfxFG-000000001NV-03Fy
	for oe-kbuild@lists.linux.dev;
	Wed, 14 Jan 2026 09:32:54 +0000
Date: Wed, 14 Jan 2026 10:32:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sean-jc:x86/suppress_eoi_quirk 2/2] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'and'
Message-ID: <202601141005.ZSkaWRD5-lkp@intel.com>
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
TO: Khushit Shah <khushit.shah@nutanix.com>

tree:   https://github.com/sean-jc/linux x86/suppress_eoi_quirk
head:   81ee10c6f0d749df26ef368cbd60a579c6f8bd12
commit: 81ee10c6f0d749df26ef368cbd60a579c6f8bd12 [2/2] KVM: x86: Add x2APIC "features" to control EOI broadcast suppression
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260114/202601141005.ZSkaWRD5-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'and'
#241: FILE: arch/x86/kvm/lapic.c:155:
+		 * is not advertised, can only be enabled KVM_SET_APIC_STATE, and
+		 * and KVM's I/O APIC doesn't emulate Directed EOIs; but if the

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
