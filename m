Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACDC8BEC
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 12:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764418691; cv=none; b=SSwJLeYESvCDXlgBR7gDHumpF1Onsw97lXwf4HRAHUjijYzMWmRcLtX7/yKk6lqfcooYiAKqEQiMS4KIeG/CU12oNDevnfDlVhMNt4zTABwEtSgAhgMN/wlc1E49tZ0wqJYeXpfLHBbBjvCxP4Si4dXaasH8lv7N55Fc7mhdE0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764418691; c=relaxed/simple;
	bh=d/+/ZzvSu4WRycstanzJ0E8wIfp/4EY3DG44wrJ/h6E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B0nyUzu+373QoNZdVSWocTBGJ0uCk/jDtgQV4wo6TkuBa9UUsw+DJGCmte1ndMfpLnO2RcdYcGZAQQOultBxrTrY0eXahOR6rZmIDIYbHl5dVB0YwevOFfKOG7Whno15/J+OdUhn2Ai/ygUclx+F4dXQf8T9T+/T01qe+bWuSRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TPJqLQDJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TPJqLQDJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764418689; x=1795954689;
  h=date:from:to:subject:message-id:mime-version;
  bh=d/+/ZzvSu4WRycstanzJ0E8wIfp/4EY3DG44wrJ/h6E=;
  b=TPJqLQDJ7G1RrFA5KV4NEHdpB0xzlgUwwKnWJYPqhGNUs7usLbTcZGrs
   bO469uKcFz4n1K0xVmNg3cO5QPVHW1MY7cYiKX0PJdr540nv5i510kBv7
   WoF81butim0sRx1Gu4I18J7h2C/Tgxp7YUwvG0nFlmGZ6lqdcz2n3RO3d
   FUBHVqtPf/hwOjb8lTqZE70SeSspwo+SiL6RScRCUWcdCn2WZpXmiPvd1
   hwqlrve3SCI5781Gzm8MDM7F433D1GZXuR4jvsYAPlGtN0WTxjiIe57k4
   4+i7hEcx8s90MDocXNPnSULBY3+Quc8C3gVeR5r+1v5tGapU0FC6jfe8U
   A==;
X-CSE-ConnectionGUID: u4gh0cc0SXueU7A+tWo4xA==
X-CSE-MsgGUID: UknRPGk4TtqVsheyBNfnZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="77102942"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="77102942"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 04:18:09 -0800
X-CSE-ConnectionGUID: ZuGwPhZ3TpyLXcPRA29fHg==
X-CSE-MsgGUID: fEJSimQBSpiB6JbEvJZyHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="193763386"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 29 Nov 2025 04:18:08 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPJtu-000000002Jt-03N9
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 12:18:06 +0000
Date: Sat, 29 Nov 2025 13:17:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [peterz-queue:sched/flat 22/22] checkpatch: WARNING:PRINTF_L: %Ld is
 non-standard C, use %lld
Message-ID: <202511291317.ow36Yu7z-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   eaad49852269b521e02cff73adc8b8a432fda88e
commit: eaad49852269b521e02cff73adc8b8a432fda88e [22/22] sched/eevdf: Move to a single runqueue
:::::: branch date: 50 minutes ago
:::::: commit date: 50 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511291317.ow36Yu7z-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:PRINTF_L: %Ld is non-standard C, use %lld
#90: FILE: kernel/sched/debug.c:734:
+	SEQ_printf(m, " %15s %5d %10ld %9Ld.%06ld   %c   %9Ld.%06ld %c %9Ld.%06ld %9Ld.%06ld %9Ld   %5d ",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
