Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BC7153800
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733996756; cv=none; b=P2ktbe1kBaZMQMDGBlq26EsYLf7GUcz/A0Awe+G2C3TxQz2CdQ6rAn7vTB0adp0TgXc9nyxPmDI37prdwX4lqoXkt/xeU9bGIZn02DkW3lqtYrwTGuHFukjI5IPjGxfXILeaxRViIhwXlC7Gqpai47hHpo26ppfiwt3BlU+KlcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733996756; c=relaxed/simple;
	bh=UBJfFCPqumPmzmO2NEr0SRkJxgG79iF9iRi2fp97EJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ua9O4YT45+//ZQWgQaSR5wYRPneUSquK9ARmzcBnIBbDTbkHWBYwwew5td5MbrEEoZVJvBlryQBBF1nfTxLNse/Cnc+eUK2nwIvjjDTBkSn/wSTXWSgITlpxjCdPkXt8OFgHsIQSaKLwj0s/segLZZo5dpnuTNzVKhHUiwIcBuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZ3Xso8n; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZ3Xso8n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733996754; x=1765532754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UBJfFCPqumPmzmO2NEr0SRkJxgG79iF9iRi2fp97EJ4=;
  b=MZ3Xso8nO6jAfUuVDHUqAJQrNV+DYHBnCO+nJxY2O+lHGqCO+xug3bNS
   1PbK8mm9RXahV1pypaBWhqAPRBI3KN0lcYjApD5HFb4AgwZfbnrIvChf0
   IDR59WcfR0tFo7Oy9Pmek863ouBGnnvk5t5RRaa1F2Ja0a7JbjSp4QNTK
   hymzu9+V3yUzBsbDkz6UdXagW4+a3ce+H6pYpHA0rlGxGDTTuNm/z0Das
   DeUTuEiYNbKHxvUUdlfRt3zoB/MSM+IqOnnNc9CkVDcYxn2Sa5aasqbxt
   jD7VJeD1IAu9LfUe3QvYYAEc37164it98vQ5Y3D1Q0PZs8XaSpyAYLDRt
   g==;
X-CSE-ConnectionGUID: FY0mcWpHT0exu9TQrr/2xA==
X-CSE-MsgGUID: zKajGL/1Qj2jFSRaRrhkVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34534389"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34534389"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 01:45:53 -0800
X-CSE-ConnectionGUID: 0ekcOmsOTwuAajoml2Oj/A==
X-CSE-MsgGUID: uhfzhcofTJSdy4nunBHMig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127177432"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2024 01:45:52 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLflW-0007gH-0g;
	Thu, 12 Dec 2024 09:45:50 +0000
Date: Thu, 12 Dec 2024 17:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bytedance:6.6-velinux 1425/8656] WARNING: modpost: vmlinux: section
 mismatch in reference: arch_jump_label_transform+0xdc (section: .text) ->
 populate_kernel_pte (section: .init.text)
Message-ID: <202412121712.sBLtlyv2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/mod/modpost.c file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: jason.zeng@intel.com
TO: lin.x.wang@intel.com
TO: pei.p.jia@intel.com

tree:   https://github.com/bytedance/kernel.git 6.6-velinux
head:   65674ccd09d044c63c8fc2c305f155b8376e0632
commit: 88bb8f5cf88161aabcb97ddd06b1a1c50a9a9768 [1425/8656] modpost: fix section mismatch message for RELA
:::::: branch date: 25 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121712.sBLtlyv2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121712.sBLtlyv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412121712.sBLtlyv2-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: arch_jump_label_transform+0xdc (section: .text) -> populate_kernel_pte (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: copy_user_highpage+0x19c (section: .text) -> populate_kernel_pte (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_user_highpage+0x1d0 (section: .text) -> populate_kernel_pte (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_user_highpage+0x204 (section: .text) -> populate_kernel_pte (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: arch_add_memory+0xd0 (section: .text) -> populate_kernel_pte (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: arch_remove_memory+0x124 (section: .text) -> populate_kernel_pte (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: arch_remove_memory+0x16c (section: .text) -> populate_kernel_pte (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
