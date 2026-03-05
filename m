Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB8E1EFFA1
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772679758; cv=none; b=owaaUedbEphykw+zcyiueqaBj7kdnObyVadjJiP22peR1BxjmscY9K/BqNO0cbIHl8PYOv5kslba6Vd0fnlqVlIx8jT7/VyR88twgR+UJxFQ5QR3Pba4O5FHDbB4kK6RiiU0MP00Qj0vQGgYIJZwfN0AkJPSazjA4cBHTevrwBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772679758; c=relaxed/simple;
	bh=6HtpbPhZ1GHrlZVAeiIR6KraLoQ3xITuzh5ixpjCD3g=;
	h=Date:From:To:Subject:Message-ID; b=U2+75zSUVHlMMH0/WJRcu4Ady4GFNlFBFHAda5kAbkDkiOyYzSKHwH9idLfnzTEbXxmca6M+IvpryCkd1axTRB2LgFIDesFy1lVRi8FmXdOmiQQWp+1ek1mB9m1XpKZ+Oxh8s+WArvFV7skGa/gcf0aGZIM5OBHUGrsayRDqueI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzZUGtK/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzZUGtK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772679758; x=1804215758;
  h=date:from:to:subject:message-id;
  bh=6HtpbPhZ1GHrlZVAeiIR6KraLoQ3xITuzh5ixpjCD3g=;
  b=GzZUGtK/cVrUc3zqU3NLllA+z7Z03aiyBnWSLMdSlKcnxicQIJQ3I3an
   k1xaXX38pdR5NyHnuDK0Lc2iLeH8LdXADU4lMiEhBEaARe9vOCL/T3d9M
   PdccqdZG9q0YIUsE4FnmxwPCdqNmB6yXiKucPc4ZAYuytqr1DXtdxqygu
   mE/fjTELS/RJUerLoBCPHXXPuxybK06w6CIZKIGfujJrJm5LWqUdb4zY6
   MToYA3pEHxKeMXlXWwtInUpiKRYNzyIbEDAEdP3CsW9DGXdoh2XiCrzPd
   SAe5ojEZhdmHL4+PpGh6G/5lGgNahNq2cGVdU5jiCZ5BVw/ZRJlrkcT3c
   w==;
X-CSE-ConnectionGUID: tDbLB5AETp6Nos/cHJ3wxQ==
X-CSE-MsgGUID: n3xyIWDjST6zaWElmOZ6jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73945571"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73945571"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:02:37 -0800
X-CSE-ConnectionGUID: DxfuJC1FTsWEIA9S/1imew==
X-CSE-MsgGUID: Pk+rQmfCQJibuWlNtaDRLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="216826711"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2026 19:02:36 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxyyw-000000001qM-1F0m
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:02:34 +0000
Date: Thu, 05 Mar 2026 04:01:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 325/467] checkpatch:
 WARNING:SIZEOF_PARENTHESIS: sizeof ibox_stat should be sizeof(ibox_stat)
Message-ID: <202603050405.p5tnH1an-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: 539a090f7b3fc0c52fc8373f90763d9d34ab7c7e [325/467] powerpc/spufs: convert to read/write iterators
:::::: branch date: 56 minutes ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050405.p5tnH1an-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SIZEOF_PARENTHESIS: sizeof ibox_stat should be sizeof(ibox_stat)
#427: FILE: arch/powerpc/platforms/cell/spufs/file.c:777:
+	if (!copy_to_iter_full(&ibox_stat, sizeof ibox_stat, to))

WARNING:SIZEOF_PARENTHESIS: sizeof wbox_stat should be sizeof(wbox_stat)
#508: FILE: arch/powerpc/platforms/cell/spufs/file.c:907:
+	if (!copy_to_iter_full(&wbox_stat, sizeof wbox_stat, to))

WARNING:SIZEOF_PARENTHESIS: sizeof cmd should be sizeof(cmd)
#671: FILE: arch/powerpc/platforms/cell/spufs/file.c:1610:
+	if (!copy_from_iter_full(&cmd, sizeof cmd, from))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
