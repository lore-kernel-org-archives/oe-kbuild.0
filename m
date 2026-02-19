Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5141EB9E1
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 16:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771518763; cv=none; b=kr2IwWSzsJ6BfCQSYPfxdrmaH0XP3XxSknZ1lRQaooruzwdsEqtVS2Wb3nE6OAFTKojWFrsoSBZapNTScpt0Uj9xj1+1I2zXSdHqoGNGJRhJd49YJuoOMkzAGbk8sJHF5YR+vnevJYn53hpq9Pp6qsCH7IXiFnc3zHE41fwKby4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771518763; c=relaxed/simple;
	bh=4mFjb6f7v4KIdJKoAKFwN8YvKElaCRdHxDXU8tao44Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lghyUlqNREo+1QLTYxLyHx4Nrq15MwPTaO5H9AmztJciflwHxU4VMiG+YQT4iNUsIbTaOeDQ0gIX//cTpVXfstj7x3Q8OpYSR9bkOx7nw7c30sPe/w0e+uXFgj/KNh949EyX7cK2fwn70Ba1GQcn0Lolh2Pc4WGMFhkAIqx0izg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WCubBPcw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCubBPcw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771518762; x=1803054762;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4mFjb6f7v4KIdJKoAKFwN8YvKElaCRdHxDXU8tao44Q=;
  b=WCubBPcw2J4ZEykAI+8/TSzjpKWhrRHcFee7orUDROMW5KkiD5UwUPay
   ++/gN99Y77Dj9zJY18Mk7WM/PCvWjhtU0iBB8MT/KG1/Nw45eRKwRPpgk
   8hy6EpLFulcz+9JY92q5DipZQ4571zsdGyr2zPsXQWN4FyPYafXe0S8v5
   2peGKKw6K+Trs+viSEVIXDFM9Hv2DYNgg+6Q5bpEj64sQ5GxiVJQg6XCk
   LUmX7tVSCxxBnWnoiYXUwlgl532wUx779liNggFfwnyf5ZqZWCEz0M6zX
   lieACh7D2w0JASUUpqud7F9aPYmiw32zPHDClLnIit7SCNe25mA3RA7ov
   A==;
X-CSE-ConnectionGUID: XeLghvnMRmS4c1WalxCz7Q==
X-CSE-MsgGUID: qvqFaVNdT6K1WhUKIGyfnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="90192744"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="90192744"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 08:32:41 -0800
X-CSE-ConnectionGUID: D8xrAYKNQNKHJrmS/QAYwA==
X-CSE-MsgGUID: 3YG/MkVFSR2XKhqN8aiNBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="214598612"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 19 Feb 2026 08:32:40 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vt6xC-0000000040D-2kcN
	for oe-kbuild@lists.linux.dev;
	Thu, 19 Feb 2026 16:32:38 +0000
Date: Thu, 19 Feb 2026 17:31:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v2 1/1] PCI: Prevent shrinking bridge window from its
 required size
Message-ID: <202602191726.9ZK3BubQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260219153951.68869-1-ilpo.jarvinen@linux.intel.com>
References: <20260219153951.68869-1-ilpo.jarvinen@linux.intel.com>
TO: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Mika Westerberg <mika.westerberg@linux.intel.com>
TO: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>
TO: linux-pci@vger.kernel.org
TO: linux-kernel@vger.kernel.org

Hi Ilpo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1c2b4a4c2bcb950f182eeeb33d94b565607608cf]

url:    https://github.com/intel-lab-lkp/linux/commits/Ilpo-J-rvinen/PCI-Prevent-shrinking-bridge-window-from-its-required-size/20260219-234201
base:   1c2b4a4c2bcb950f182eeeb33d94b565607608cf
patch link:    https://lore.kernel.org/r/20260219153951.68869-1-ilpo.jarvinen%40linux.intel.com
patch subject: [PATCH v2 1/1] PCI: Prevent shrinking bridge window from its required size
:::::: branch date: 49 minutes ago
:::::: commit date: 49 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260219/202602191726.9ZK3BubQ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#164: FILE: drivers/pci/setup-bus.c:1853:
+		switch (idx) {
+			case PCI_BRIDGE_IO_WINDOW:
[...]
+			case PCI_BRIDGE_MEM_WINDOW:
[...]
+			case PCI_BRIDGE_PREF_MEM_WINDOW:
[...]
+			default:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
