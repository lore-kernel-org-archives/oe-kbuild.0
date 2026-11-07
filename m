Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794068114;
	b=rmWgAhgQHbbBDokzf8bke+INWDi7cp7VpUbekIrkA64W8sK0PbOabIFywlsZMwxtIaXo
	 61LfKLiUH9MQAaBoxFQ2gMkB+cweYupXSFtL0xTonxHQtcq2Hn3L8OrP71KbMRSDwQ1RG
	 fkZlB0x51EfKHmBmiu29FJyFF3OWBmFMxq3f/NGRlB4fhTc2crwUiAMMagyXSoX2Axl4f
	 rxff2HccBFP/D23d5YztoDATCFO8Lgv/CBmOmpbrh1u97U48kRrYTmJ1nxy5j9yuYRZym
	 dbJxVRFvdcG5Wa+hQ3350U8NVp6/mzOCtUm3csFV02An3rUwxky9SqkfoiZx6Wt606Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068114;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Subject:Message-ID:User-Agent;
	bh=lQwGw1kqE3BCVaK6GVdpbFzI9AsQqSKP3+m3/57yAZI=;
	b=t8UhZo/tZ4K2qfOMKlhtFw35brvtdPTR+vPWE0FlnlijZ++xZun7V/p1XQ9RHAia4nji
	 dfzqbuCz4GFHQptMx0Jp1QcMRwdOBTWykUVk6u5FrUt4N/rxJTdmZCkCbxrZaAFh0amwJ
	 QByzcPQudTpKl5s/22ALOfHXJxIFVbEPStI+XcNKZWhbvV7jBIbyK7xPW2BGYz+voqVlM
	 +JsX19x/l7HooHYL+0IhX0oTIe7Fuh7sVWtZFHdu+G4Q01PwKRk2HLujlHt+srV+JUOoV
	 3cCjUHpjLXxKEDMkwxVhFT7chMWhFqSFa+SucR+WJGFBIVb6x5aEwVn2xyHg4Yc06kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mcXxc7Vk;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8B5606A338
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 16:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF8B5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mcXxc7Vk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794068113; x=1825604113;
  h=date:from:to:subject:message-id;
  bh=nkfMj+sTU+BP6p8VdyZ46L171ZlF7/SVRPobLciKukg=;
  b=mcXxc7VkNiq5UyR+fSVPhkOUMmpx4jdBDv75wAzg6PAvc4/IQ3/wpjup
   RqXXKtuj1SAQ1TnRFFQ04NecfTJ8GBB6dbKsNtW+h9NLCWGhueBkT7vG7
   AHQKl4rJuLG8EoJ+myCtfwn+KSAeQbA5jJbKlqSqSDosxFSsmZ8Pafnft
   btxpzggjrM1fwLnGk+2KC1j+nal4KR1A8cpCk5HsQafZsFPZFn8PnTflR
   0Q/dbtYl7pl6c2fu5LSyn0tbomJI4LnbrZYXBKpDucwzMXDqym5FHVDHc
   x79I157OxwCwzFYuqHWC0dC1KmTaexZ0cSeIQVBOBAZfpbN5Apt5ocBws
   Q==;
X-CSE-ConnectionGUID: C+LIuUmrQ5WzDgGUcR///g==
X-CSE-MsgGUID: GQaDmKVETuCRixS6IfnV2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2887130"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2887130"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 08:15:13 -0800
X-CSE-ConnectionGUID: u3a/dt/dTOKXP50JTKeuaA==
X-CSE-MsgGUID: jJj6IJiRSzGKPZLJoPBHXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7340832"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 07 Nov 2026 08:15:11 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPj4O-00000000AiZ-15DF
	for oe-kbuild@lists.linux.dev;
	Sat, 07 Nov 2026 16:15:08 +0000
Date: Sat, 07 Nov 2026 17:14:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/080-wifi 39/46] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202611071707.DIUr1SMz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   1ec4ed7d219b763623bcdb0858f273dd2135782d
commit: 4716f119e4e10a8c7c3cabebf6ad7977b9c62d14 [39/46] [brcmfmac] Support new join parameter structure versions
:::::: branch date: 2 hours ago
:::::: commit date: 5 days ago
reproduce: (https://download.01.org/0day-ci/archive/20261107/202611071707.DIUr1SMz-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#752: FILE: drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h:710:
+	__le32 active_time; /* -1 use default, dwell time per channel for
+				 * active scanning

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#755: FILE: drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h:713:
+	__le32 passive_time; /* -1 use default, dwell time per channel
+				 * for passive scanning

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#758: FILE: drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h:716:
+	__le32 home_time; /* -1 use default, dwell time for the home
+				 * channel between channel scans

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
