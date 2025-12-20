Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D432DC78C
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 01:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766195795; cv=none; b=gS9rY0TECx94kY2AYeu8AP2kUVpsuwGXcQQmWD4Iy0DA0RMpvH/spRL8Qa74STu/9Jfdllk4a6stMPA9zeHvzXIgs5pB51MhaeXMB04g/L7bzzxQ52JRONLBZhjffD6Kqyok8bCwpckE8n4yyS3Ydt+Mg1P6kLYVtxEvOPZUQWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766195795; c=relaxed/simple;
	bh=uZ3/87BmBtCVQori+a/mTLvyU5J6EFMxp1yPcx4KEXM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YIECx3w6F5Db0EpAFTdyutO1SsHmp1bSqZbwmTOZRQLtQD35VCCg9uGzteGpxc7ey3YTTHl1yN1f8ebkyzgGpJMr1MSa1RvQdJ6Jicb0OPCzto+fK5F19SQTITcfS8+YDPYhaaS50u3ncqU1Z9qJ9MA21VLq1Z1TW5iXvofQrBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drzrTnc0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drzrTnc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766195794; x=1797731794;
  h=date:from:to:subject:message-id:mime-version;
  bh=uZ3/87BmBtCVQori+a/mTLvyU5J6EFMxp1yPcx4KEXM=;
  b=drzrTnc0BMpGneGf7KgChJxlBD/BMBujPYoUv1zNv7PvRYVMpszJ4cU0
   nHUXj/+uAFtyvIkLTVXjupziOB+wSNkPA5Hk/4GMYfB1CwTyulk30PIkq
   /CsAphhN8Cxf8Pf4PdK0viclh/8Rj1s5rzWJ7SOyFC2BJ5E/vRs3QlAzQ
   dcEqcxVJwcz0bdPaLTRdD+0vXwe0H9Fpkbepjn7eNVGvLp0pAPvc4KWP2
   AR1kq20irFR7qutALtxjFwSyMFNh1SlYJHSNMjLz9jGXXQyl6qkPihmTO
   fv3qNEoAsZXsQ+YK84UdgF3AQG6Tu68fGDH1MiLVuJGz8ELipdPe4bBq6
   A==;
X-CSE-ConnectionGUID: ZpELTJX7SYel5xpi13/8Xg==
X-CSE-MsgGUID: y6ZeE8iKSSu5spPKl2B84w==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="72002187"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="72002187"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 17:56:32 -0800
X-CSE-ConnectionGUID: KSWLlCyNTkG1ADrBKc6kXA==
X-CSE-MsgGUID: ezkqGnXDRJKGX9Orldtbeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="222427854"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 19 Dec 2025 17:56:31 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWmCr-000000004SH-3IzY
	for oe-kbuild@lists.linux.dev;
	Sat, 20 Dec 2025 01:56:29 +0000
Date: Sat, 20 Dec 2025 02:55:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/gicv5-full 68/82] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202512200223.wyw2FcN3-lkp@intel.com>
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
commit: 9d01097b8baaed8cf8de6d6eece4953aa6ed71c5 [68/82] KVM: arm64: gic-v5: Add the ITS device
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512200223.wyw2FcN3-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#152: FILE: arch/arm64/kvm/vgic/vgic-its-v5.c:105:
+ * size, but this isn't guranteed in the spec.
+*/

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#579: FILE: arch/arm64/kvm/vgic/vgic-its-v5.c:532:
+	/*
+	* Make sure that we have the correct context to look up the

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#618: FILE: arch/arm64/kvm/vgic/vgic-its-v5.c:571:
+	/*
+	* Mask off the upper addr bits - we just want the offset into the MMIO

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#690: FILE: arch/arm64/kvm/vgic/vgic-its-v5.c:643:
+	/*
+	* Mask off the upper addr bits - we just want the offset into the MMIO

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#721: FILE: arch/arm64/kvm/vgic/vgic-its-v5.c:674:
+	/*
+	* Mask off the upper addr bits - we just want the offset into the MMIO

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#784: FILE: arch/arm64/kvm/vgic/vgic-its-v5.c:737:
+	/*
+	* Mask off the upper addr bits - we just want the offset into the MMIO

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#860: FILE: arch/arm64/kvm/vgic/vgic-its-v5.c:813:
+	/*
+	* Mask off the upper addr bits - we just want the offset into the MMIO

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#876: FILE: arch/arm64/kvm/vgic/vgic-its-v5.c:829:
+	/*
+	* Mask off the upper addr bits - we just want the offset into the MMIO

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#999: FILE: arch/arm64/kvm/vgic/vgic-its-v5.c:952:
+	/*
+	* This is the ITS_TRANSLATE_FRAME. For simplicity, this is offset by

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
