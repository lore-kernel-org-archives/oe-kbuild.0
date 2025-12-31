Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560002F745D
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 07:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767166130; cv=none; b=fJH3/TrwA5sPxSfujC5AN3SUkkM/j3LroaF8GkCQ+4ItbGRoGH7mhhCG2+60Rs9sJkVq8Yp5KY7RfQiCDG6HhwGH6ilchXa4aBSaaFr5B/xYky5L5l2o1xaYVDKl3V1VHjOIE1MUsz0lX+QiGiKOtzZl5hBqqqIGaB5//RPWpJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767166130; c=relaxed/simple;
	bh=crWb4Mj1PMDfR8JhQkCKW0IGLt2RimwPdueuAPikY/k=;
	h=Date:From:To:Subject:Message-ID; b=LAbcrj9DhpnCHseMPvF0lEH4iZ0eRYdBhSmNlU4AsW/tLNq3Y52bOWaDgczmCIA8TtrXI3VR4K5ld9BicOT7TXEYTcv+BVtztIMNuf2UWW0H8EcQRk5x164/VK+UFzsnanxJSamSkgk4vDliA/JQISTJ9OFpUTzGB4J7SNDAZoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQgi4m5u; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQgi4m5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767166128; x=1798702128;
  h=date:from:to:subject:message-id;
  bh=crWb4Mj1PMDfR8JhQkCKW0IGLt2RimwPdueuAPikY/k=;
  b=TQgi4m5uuXedR6pRxcjt88mXyWrX575IFPL+7aIEgQetHxJX7u+1USjm
   KybnaEJc02V9IQjrmWezG+6WAtYrv3C57iKymO1uOR+tBSZw8biW3p8zm
   +0XCIobXhCzwFwtR8VJNrznAJFqR7sSnNZHGjoXUhKmHBHscMJg2hA3gA
   jp2Sw6LOMZrEmZq70MGY7VI3ZsnDYWbuBzGIifxFpatXYJ0v78jYu5bU1
   r4bpbBPKY6ezbtq1frSKBNemgMavhScLWh/mYcNKRYCjvcxBOYndfYT5a
   kCSTUOcWZR5DEkEFYwv++QMKlVvK5rODWN/XACr0BCz7v9y5x5+opSyx7
   A==;
X-CSE-ConnectionGUID: H1D03Kk6Si+SSZmbb/sC3A==
X-CSE-MsgGUID: 9Oa2yLZuR3Cn1cc6wd7jTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="79466217"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="79466217"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 23:28:47 -0800
X-CSE-ConnectionGUID: Cdnk9X6pR56RBOn6q2T6Jg==
X-CSE-MsgGUID: +tDEx/HGQM6afIPLWYPDDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="201130596"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 30 Dec 2025 23:28:47 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaqdQ-0000000001H-3Gs7
	for oe-kbuild@lists.linux.dev;
	Wed, 31 Dec 2025 07:28:44 +0000
Date: Wed, 31 Dec 2025 08:28:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [avpatel:riscv_kvm_nested_v1 8/14] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'context'
Message-ID: <202512310811.sFBStdxt-lkp@intel.com>
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
head:   d9789002a11efbf06d07540d80dbe5fc7d7bbeb2
commit: 82da176ef84d4434d15cb033b5240e379d17fb40 [8/14] RISC-V: KVM: Extend trap redirection for nested virtualization
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251231/202512310811.sFBStdxt-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'context'
#192: FILE: arch/riscv/kvm/vcpu_nested.c:79:
+		 *    with vsstatus.[FS|VS] saved in the nested virtualization context
+		 *    context (i.e. HS mode sstatus.[FS|VS])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
