Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E3D274B4D
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 16:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764691599; cv=none; b=XEMxY7hzJx63HZ2uOLAp20Sj3wqLn+0v/7CN5zBv+xvHfQIayHvQrFj2TX3RsS9Fl4prXyT1mKoVZfWiPT6NNgsMHuyshmIZ3kKONEGf2oToWQod7s5nACakkygsxLOeZDUcnvgWpAY+W7vSl5p0E6Iz8eI8f6+4n4mKHGOEIMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764691599; c=relaxed/simple;
	bh=QrpxfBhmnWxOm3YbPxk/wNbUkqTUWhDc7C0/z1eKP3E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tajLDKP12t3SNR0kKc+e9d5+8pkyRVYSO2F9LN51/JrqyDubG8a/sQGqLsgsCPcdDx/MGgm62koORoZ+m7Nugqs8ydR0ZdsX8MajSD0mSRJhQZkvfRgPXXeR3aIW+8U0VwigrSZnJNhSn+JgJdr/CCD/zTMH03/FoxtwG9sjbdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eY9XDipH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eY9XDipH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764691598; x=1796227598;
  h=date:from:to:subject:message-id:mime-version;
  bh=QrpxfBhmnWxOm3YbPxk/wNbUkqTUWhDc7C0/z1eKP3E=;
  b=eY9XDipH/3xAXEIjINvhaoIa8voPEFAiyDtrPK1BuKWPgFzR0BZ4qFdK
   br/um6FF3GCov54BVb1oar8+mgaXl6T5sZ+VblsUbkvG/k4xuIcroZfPD
   fJ+7D2Ft47ZM/4qMvxEQcgAoi9hk6e8UaowhZWT9kVhszcyeXaupMQKiQ
   Bk75t145FqORFNO90XRx/9y5tRqcMh/JsRiIUsu/FOrF0D32EUgTcz8ZO
   fME8pDjeEKv8hBAw4MZcdBRmDO0bKfbujPJpbDCF2ugGonQRgGLyKFHIV
   4JvKFRxzK4ievVX0/v+xs1RYv4q4DjimgK7kVfUFTrQhx8OJnGZ7sIo7Z
   Q==;
X-CSE-ConnectionGUID: O3qddCwUSRCFEf0ZYupqhA==
X-CSE-MsgGUID: OHUNXckeSIuQnfsYcC1gmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84265451"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="84265451"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 08:06:38 -0800
X-CSE-ConnectionGUID: 5JwHjPyISCWXyQH5C3tbTw==
X-CSE-MsgGUID: 3WxWpm4TR+2Wj2dZzUKRsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="225108043"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 02 Dec 2025 08:06:37 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQSte-000000002uv-2JX9
	for oe-kbuild@lists.linux.dev;
	Tue, 02 Dec 2025 16:06:34 +0000
Date: Tue, 2 Dec 2025 17:05:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Guanghui-Feng/PCI-Fix-PCIe-SBR-dev-link-wait-error/20251202-123344
 1/1] checkpatch: ERROR:SPACING: space required before the open parenthesis
 '('
Message-ID: <202512021726.pGc0XI1Z-lkp@intel.com>
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
TO: Guanghui Feng <guanghuifeng@linux.alibaba.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Guanghui-Feng/PCI-Fix-PCIe-SBR-dev-link-wait-error/20251202-123344
head:   5890a61a6bf09a7c7c876294ce683dbd6549856f
commit: 5890a61a6bf09a7c7c876294ce683dbd6549856f [1/1] PCI: Fix PCIe SBR dev/link wait error
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251202/202512021726.pGc0XI1Z-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#169: FILE: drivers/pci/pci.c:4798:
+		if(ret)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
