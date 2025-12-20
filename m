Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1532DC344
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 01:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766195615; cv=none; b=pFaaHvm0+x5srepu9OkqHj/LpBb1GRTr2qa3ajg0dfjOgmGj6izlgtk3k0DQF1dcG1LoeLrfd1FvtM9g9+dYMjgD8NfkGmCmhKh36FF4MfszdLNv1b5XrqAY1PrCOChc+BqxW+JShFr9PZI5CRIqOJlieQ3M+yUOrWWB7PMD0hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766195615; c=relaxed/simple;
	bh=7D9zvxfaGYQC/r6aKlEf65F2C7nmY9YF06Ob0ML3eY0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lHBAc2oSid5Luj7I3vU7AdxfNnlmlYuTRijs7qFd/A/9egKj3j3BhmfhE3AssvMjsnPArDiTZX50fyL6576BZJSGPtND1q+scuZTgAsEwfu8g+/kvDbUncfYIb9Y2/lBcQkneO+DhBrmiZxhsLozhebgxpjflpTZ1krRdHVdCQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVtYYcbu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVtYYcbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766195614; x=1797731614;
  h=date:from:to:subject:message-id:mime-version;
  bh=7D9zvxfaGYQC/r6aKlEf65F2C7nmY9YF06Ob0ML3eY0=;
  b=JVtYYcbuG0DC2WPdGyIbkN53KJLB4R7W5AsQ797UG0zWxK3n2Mdpv7u/
   M/LXydMOxccQjBcEB12mYm4mTgRwb66tXFH0KrqyV34gfG9oaljOAMrWg
   +YrToBAGhRX/HEd5IhjDSxG9D59YKxfJ4fJJW8jNn2R2Mf3zCZAqFw/Tb
   DZfzz18uIP6VflfDbnaFw8cZcY2Ixphc7fqlQvhCwOkNw6D4+pOLEod5S
   0mJA1S7rYfvH6b+at9SsIfGuayZHvZ4LElm3KW9Aa2/tOhl047IHe8qV1
   f/GcWxn6HO0uNUNDVgRZmGttVnAb9HnwR7i+fCk8z7lHzVd7utdUENAwN
   A==;
X-CSE-ConnectionGUID: vR65PdSNTc6h7zDROwcKEw==
X-CSE-MsgGUID: WnqnYs4wTki4SxrvpvU3EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="78872771"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="78872771"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 17:53:32 -0800
X-CSE-ConnectionGUID: dCBzHNhjTOy7xOrMTLzplw==
X-CSE-MsgGUID: hb5BI8UiQjCWMtcQjqpRxw==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198995300"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 19 Dec 2025 17:53:31 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWm9x-000000004RW-1JYI
	for oe-kbuild@lists.linux.dev;
	Sat, 20 Dec 2025 01:53:29 +0000
Date: Sat, 20 Dec 2025 02:52:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/gicv5-full 42/82] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202512200224.cWuWwqkk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sascha Bischoff <sascha.bischoff@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: a994bc0447523a526e17ae0a62024bf8ef371ce6 [42/82] KVM: arm64: gic-v5: Create, manage, and teardown VMT & VPETs
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512200224.cWuWwqkk-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#179: FILE: arch/arm64/kvm/vgic/vgic-v5-tables.c:128:
+	struct vmtl2_entry * l2_table;

ERROR:SPACING: space required before the open parenthesis '('
#309: FILE: arch/arm64/kvm/vgic/vgic-v5-tables.c:258:
+		for(int i = 0; i < vmt_info->l2.num_l1_ents; ++i)

ERROR:SPACING: space required before the open parenthesis '('
#311: FILE: arch/arm64/kvm/vgic/vgic-v5-tables.c:260:
+			if(!!FIELD_GET(GICV5_VMTEL1E_VALID, vmt_info->l2.vmt_base[i]))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
