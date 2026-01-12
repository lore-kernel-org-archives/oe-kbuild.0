Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E543033C7
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768204296; cv=none; b=ntu7CvIJ+qW/bzf+EdMP1KUAp76tnbyDX9GNHPxwPaypqKv/7PELpZZZL7QMZJQgefu3YUzO+XMMcaySBpdXHP5nuumBBNIT/6Y1Jlb1ROUKvbrx0gm+/kxpUyy9PqcBE7mzLhA4KJb3tyvBHq+6YdARomHezahNoNlvXMJDkFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768204296; c=relaxed/simple;
	bh=3dwT1VWvLcupUXbmik14aiPZlNc7LoW8eJNGr10l6vI=;
	h=Date:From:To:Subject:Message-ID; b=Y7A7sJmmU9Ei7r7jDlTyXv7TCVdwe3c9ygWfZDvp25rVKt/LnQNzoaw5QmW4AhrGVBE6imWo0kZNdZgvVBBJRhYXehuFNsOyrHchkZ7ii0UINWjVVQK8qrfjfDxWJwuiwmAFnm/+nUnf71z1myOM5B/fd8SC14KqMediK0h2yi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4mo01A1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4mo01A1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768204294; x=1799740294;
  h=date:from:to:subject:message-id;
  bh=3dwT1VWvLcupUXbmik14aiPZlNc7LoW8eJNGr10l6vI=;
  b=n4mo01A1Q15rRQuWvO6RtJMVrJxpuoqkRQ1kCh8K8uIQbHhnzQ+G3dDJ
   SlTYBK3j0WinyIpDIAe5j/GDNyjPXJGotp01pfJ+NUl7kluNoZ2jpWEzO
   cJH/eWhNo+CHqgc0TSmyzYqCquQEJk++zg1IX8b/pEJr7UJwLEZzBEQbN
   ZR7kFc+GfLWdJ/c2+KFh7qZXNLdK2rMdfSq2jUVmFbY3yWiYjhvGYB8wh
   X55a+TRjZLPs3ZZ04lO+kUDguZ4wjMH4hScjmPJLjC1S3nmdrXeJ/Yxvv
   5rzPaHjuNXJQKFCruY2mETKP7kiaNDYL3s8bpiUhy4MCkRyhqZDbvg067
   A==;
X-CSE-ConnectionGUID: HcNWh9RlQ4OlsvX4E9pUQw==
X-CSE-MsgGUID: bG/lKoDARKWrQArwpRlN8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69524306"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69524306"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 23:51:34 -0800
X-CSE-ConnectionGUID: blsahsJiTBCDz1v37DCJow==
X-CSE-MsgGUID: dl397TfqR2GIRIcHKoGDuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204719370"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jan 2026 23:51:33 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfCi3-000000000q3-0Llo
	for oe-kbuild@lists.linux.dev;
	Mon, 12 Jan 2026 07:51:31 +0000
Date: Mon, 12 Jan 2026 08:51:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [avpatel:riscv_kvm_nested_v1 17/23] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'context'
Message-ID: <202601120849.AhYHp57R-lkp@intel.com>
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
TO: Anup Patel <anup.patel@oss.qualcomm.com>

tree:   https://github.com/avpatel/linux.git riscv_kvm_nested_v1
head:   7098a1828807497eceb8f093a643c5323c7e45f3
commit: 98ecd4c1526bec9302746ac2b02e8f05249a5776 [17/23] RISC-V: KVM: Extend trap redirection for nested virtualization
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260112/202601120849.AhYHp57R-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'context'
#193: FILE: arch/riscv/kvm/vcpu_nested.c:80:
+		 *    with vsstatus.[FS|VS] saved in the nested virtualization context
+		 *    context (i.e. HS mode sstatus.[FS|VS])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
