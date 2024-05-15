Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D79A15AADE
	for <oe-kbuild@lists.linux.dev>; Wed, 15 May 2024 20:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715803331; cv=none; b=VtsxKoldxCvTFxwwYE9ZWdwEqPixkd4FnnPthJzU+2YzvrYzriY1E6bU6OVC3qAuLO5pDJd3NEmpVgHALlcgb0WMPx+I36kdoU0e4L9Xlbqnmfu7L4JI9CRq78s5tXd7/rVQFdGm/jxJ5cgkaPaoxW87PPlsR3NjYM1+SVfWGOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715803331; c=relaxed/simple;
	bh=UB+pseZEHk7oPx4iu1WNtd+zGpn62ZM//ZPcXigcxGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QCD7UGmpHjRPwTR6EGZIC+6i3Vtvk/8z+rCiy3/Yvi+9rm6PDC/iLiooovIndeClwPQX2XbfAlVKAAsiKZ2B3BlzTUzL2FfbLd+dGmlIwOtYvXHregZ2yLBNlrjonHmxNvF6D3/3yjeUCrRCRGx69HUvSYuSyYtchuwKTQar1HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZmy4fww; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZmy4fww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715803327; x=1747339327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UB+pseZEHk7oPx4iu1WNtd+zGpn62ZM//ZPcXigcxGQ=;
  b=OZmy4fwwrrHHzwsrb9osQxXxC6evyEmjqv9MMMPkxSC6T26r9+AT18nq
   o60AwP+MnYkcrkF+yOR0ZZ0E3sdjLvPv0T9mu+n8olcnnbzKyp9ADltSY
   jYwvrl9r0EZVeG4ZJ47bXipnfaPHWljSau7n72Ox32BxEhsciiAz5/AZm
   DApFYVSv5lXiQBZsrpFZoiDN226qoVf94GPirxEvvEfEwjjf+PolB8VFK
   dHWZecx2sw2Eb+wj4gS27ocxsG1yYuquNb95z4GouJfI2yc97w7Nkm+dB
   bLOUogaX7NDi4Voh+21ulFw8RxdqnKn32I0ibuyQeHAHiTD9AvKHwVuLW
   w==;
X-CSE-ConnectionGUID: dfWwfv/yST6Zt3BMzzCO9A==
X-CSE-MsgGUID: LwuqxlJpQ7ibJgYOtF8zFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15657484"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="15657484"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 13:02:04 -0700
X-CSE-ConnectionGUID: iRHh5HSXRnO8V4iSEZoKQw==
X-CSE-MsgGUID: HaYykkYPRPe21M6W/A0rnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="31172730"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2024 13:02:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7Kp6-000DDd-20;
	Wed, 15 May 2024 20:02:00 +0000
Date: Thu, 16 May 2024 04:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:openEuler-1.0-LTS 21328/22436]
 drivers/scsi/sssraid/sssraid_os.c:1716:33: sparse: sparse: break/continue
 not in iterator scope
Message-ID: <202405160350.E9SPCyJO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/scsi/sssraid/sssraid_os.c:1716:33: sparse: sparse: break/continue not in iterator scope"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Steven Song <steven.song@3snic.com>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c6c0f64fb7e3a44c5ddebc0bf9dfbb71901a28e3
commit: 2e2a4edd9d4a725c5474dc278b090913d9b5bfd5 [21328/22436] SCSI: SSSRAID: Support 3SNIC 3S5XX serial RAID/HBA  controllers
:::::: branch date: 17 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-121-20240516 (https://download.01.org/0day-ci/archive/20240516/202405160350.E9SPCyJO-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405160350.E9SPCyJO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405160350.E9SPCyJO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/sssraid/sssraid_os.c:1704:45: sparse: sparse: Expected ; at end of statement
   drivers/scsi/sssraid/sssraid_os.c:1704:45: sparse: sparse: got {
>> drivers/scsi/sssraid/sssraid_os.c:1716:33: sparse: sparse: break/continue not in iterator scope
   drivers/scsi/sssraid/sssraid_os.c:1726:17: sparse: sparse: break/continue not in iterator scope
   drivers/scsi/sssraid/sssraid_os.c:1729:16: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1729:16: sparse: sparse: got =
>> drivers/scsi/sssraid/sssraid_os.c:1729:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1729:23: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1729:23: sparse: sparse: got <
   drivers/scsi/sssraid/sssraid_os.c:1729:38: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1729:38: sparse: sparse: got ++
>> drivers/scsi/sssraid/sssraid_os.c:1731:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1731:17: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1731:17: sparse: sparse: got {
   drivers/scsi/sssraid/sssraid_os.c:1731:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1731:17: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1732:17: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1732:17: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:1732:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1732:17: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1732:17: sparse: sparse: got <
   drivers/scsi/sssraid/sssraid_os.c:1732:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1732:17: sparse: sparse: got )
   drivers/scsi/sssraid/sssraid_os.c:1734:25: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1734:25: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1734:25: sparse: sparse: got {
   drivers/scsi/sssraid/sssraid_os.c:1734:25: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1734:25: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1735:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1735:17: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1739:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1739:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1753:13: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1753:13: sparse: sparse: got (
>> drivers/scsi/sssraid/sssraid_os.c:1753:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1756:13: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1756:13: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:1756:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1758:21: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1758:21: sparse: sparse: got ->
>> drivers/scsi/sssraid/sssraid_os.c:1759:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1759:24: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1759:24: sparse: sparse: got 0
   drivers/scsi/sssraid/sssraid_os.c:1760:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1760:9: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1766:39: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1766:39: sparse: sparse: got ,
   drivers/scsi/sssraid/sssraid_os.c:1769:13: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1769:13: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:1769:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1772:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1772:24: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1772:24: sparse: sparse: got 0x1055
   drivers/scsi/sssraid/sssraid_os.c:1773:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1773:9: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1776:16: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1776:16: sparse: sparse: got .
   drivers/scsi/sssraid/sssraid_os.c:1777:16: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1777:16: sparse: sparse: got .
   drivers/scsi/sssraid/sssraid_os.c:1780:13: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1780:13: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:1780:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1782:28: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1782:28: sparse: sparse: got &
   drivers/scsi/sssraid/sssraid_os.c:1783:21: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1783:21: sparse: sparse: got ->
   drivers/scsi/sssraid/sssraid_os.c:1784:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1784:24: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1784:24: sparse: sparse: got 0
   drivers/scsi/sssraid/sssraid_os.c:1785:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1785:9: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1788:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> drivers/scsi/sssraid/sssraid_os.c:1788:13: sparse: sparse: missing type declaration for parameter 'work_mode'
>> drivers/scsi/sssraid/sssraid_os.c:1791:11: sparse: sparse: Trying to use reserved word 'else' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1791:16: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1791:16: sparse: sparse: got {
   drivers/scsi/sssraid/sssraid_os.c:1793:20: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1793:20: sparse: sparse: got ->
   drivers/scsi/sssraid/sssraid_os.c:1794:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1794:9: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1797:16: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1797:16: sparse: sparse: got .
   drivers/scsi/sssraid/sssraid_os.c:1801:12: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1801:12: sparse: sparse: got ->
   drivers/scsi/sssraid/sssraid_os.c:1802:12: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1802:12: sparse: sparse: got ->
   drivers/scsi/sssraid/sssraid_os.c:1804:13: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1804:13: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:1804:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1806:35: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1806:35: sparse: sparse: got ,
   drivers/scsi/sssraid/sssraid_os.c:1807:21: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1807:21: sparse: sparse: got ->
>> drivers/scsi/sssraid/sssraid_os.c:1809:17: sparse: sparse: Trying to use reserved word 'goto' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1809:22: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1809:22: sparse: sparse: got deinit_iod
   drivers/scsi/sssraid/sssraid_os.c:1810:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1810:9: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1812:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1812:9: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1812:9: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1812:9: sparse: sparse: got &
   drivers/scsi/sssraid/sssraid_os.c:1812:9: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1812:9: sparse: sparse: got .
   drivers/scsi/sssraid/sssraid_os.c:1812:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1812:9: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1813:30: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1813:30: sparse: sparse: got ,
   drivers/scsi/sssraid/sssraid_os.c:1815:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1815:16: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1815:16: sparse: sparse: got 0
   drivers/scsi/sssraid/sssraid_os.c:1817:11: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1817:11: sparse: sparse: got :
   drivers/scsi/sssraid/sssraid_os.c:1820:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1820:16: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1820:16: sparse: sparse: got retval
   drivers/scsi/sssraid/sssraid_os.c:1821:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1821:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1836:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> drivers/scsi/sssraid/sssraid_os.c:1836:13: sparse: sparse: missing type declaration for parameter 'hostdata'
   drivers/scsi/sssraid/sssraid_os.c:1851:11: sparse: sparse: Trying to use reserved word 'else' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1851:16: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1851:16: sparse: sparse: got {
   drivers/scsi/sssraid/sssraid_os.c:1853:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1853:9: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1856:13: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1856:13: sparse: sparse: got ->
   drivers/scsi/sssraid/sssraid_os.c:1859:13: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1859:13: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:1859:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1862:38: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1862:38: sparse: sparse: got ->
   drivers/scsi/sssraid/sssraid_os.c:1864:9: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1864:9: sparse: sparse: got "001"
   drivers/scsi/sssraid/sssraid_os.c:1869:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1869:16: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1869:16: sparse: sparse: got 0
   drivers/scsi/sssraid/sssraid_os.c:1870:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1870:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1879:13: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1879:13: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:1879:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1885:13: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1885:13: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:1885:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: Expected ) in nested declarator
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: got {
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: got (
>> drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: Trying to use reserved word 'switch' as identifier
>> drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: Trying to use reserved word 'break' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: got }
>> drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: Trying to use reserved word 'break' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: got }
>> drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: Trying to use reserved word 'break' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: got }
>> drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: Trying to use reserved word 'break' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: Expected ) in nested declarator
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: got {
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: Trying to use reserved word 'switch' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: Trying to use reserved word 'break' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: Trying to use reserved word 'break' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: Trying to use reserved word 'break' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: Trying to use reserved word 'break' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1891:27: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1891:27: sparse: sparse: got ,
   drivers/scsi/sssraid/sssraid_os.c:1892:16: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1892:16: sparse: sparse: got ->
   drivers/scsi/sssraid/sssraid_os.c:1892:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1895:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1895:9: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1895:9: sparse: sparse: got {
   drivers/scsi/sssraid/sssraid_os.c:1895:9: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1895:9: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:1895:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1895:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1895:9: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1898:13: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1898:13: sparse: sparse: got ->
   drivers/scsi/sssraid/sssraid_os.c:1899:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1899:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1905:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1905:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1916:13: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1916:13: sparse: sparse: got !
   drivers/scsi/sssraid/sssraid_os.c:1916:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1918:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1918:24: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1918:24: sparse: sparse: got -
   drivers/scsi/sssraid/sssraid_os.c:1919:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1919:9: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1922:18: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1922:18: sparse: sparse: got =
   drivers/scsi/sssraid/sssraid_os.c:1922:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1922:27: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1922:27: sparse: sparse: got <
   drivers/scsi/sssraid/sssraid_os.c:1922:67: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1922:67: sparse: sparse: got ++
   drivers/scsi/sssraid/sssraid_os.c:1925:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1925:9: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1929:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1929:16: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1929:16: sparse: sparse: got -
   drivers/scsi/sssraid/sssraid_os.c:1931:10: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1931:10: sparse: sparse: got :
   drivers/scsi/sssraid/sssraid_os.c:1933:17: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1933:17: sparse: sparse: got ->
   drivers/scsi/sssraid/sssraid_os.c:1934:17: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1934:17: sparse: sparse: got ->
   drivers/scsi/sssraid/sssraid_os.c:1935:17: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1935:17: sparse: sparse: got ->
   drivers/scsi/sssraid/sssraid_os.c:1936:17: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1936:17: sparse: sparse: got ->
   drivers/scsi/sssraid/sssraid_os.c:1937:13: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1937:13: sparse: sparse: got ->
   drivers/scsi/sssraid/sssraid_os.c:1938:17: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1938:17: sparse: sparse: got &
   drivers/scsi/sssraid/sssraid_os.c:1939:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1939:16: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1939:16: sparse: sparse: got 0
   drivers/scsi/sssraid/sssraid_os.c:1940:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1940:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1946:13: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1946:13: sparse: sparse: got ->
   drivers/scsi/sssraid/sssraid_os.c:1947:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1947:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1955:41: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1955:41: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:1955:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:1958:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: got &
>> drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: got 1
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: got &
>> drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: got 1
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: Expected ) in nested declarator
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: got {
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: Trying to use reserved word 'switch' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: Trying to use reserved word 'break' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: Trying to use reserved word 'break' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: Trying to use reserved word 'break' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: Trying to use reserved word 'break' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1963:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1963:17: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1967:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1967:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1980:18: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1980:18: sparse: sparse: got ->
   drivers/scsi/sssraid/sssraid_os.c:1980:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1988:9: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1988:9: sparse: sparse: got "001"
   drivers/scsi/sssraid/sssraid_os.c:1990:17: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1990:17: sparse: sparse: got !=
   drivers/scsi/sssraid/sssraid_os.c:1990:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1992:17: sparse: sparse: Trying to use reserved word 'if' as identifier
>> drivers/scsi/sssraid/sssraid_os.c:1992:21: sparse: sparse: missing type declaration for parameter 'ret'
   drivers/scsi/sssraid/sssraid_os.c:1997:17: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:1997:17: sparse: sparse: got "001"
   drivers/scsi/sssraid/sssraid_os.c:1998:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/scsi/sssraid/sssraid_os.c:1998:24: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:1998:24: sparse: sparse: got 0x2002
   drivers/scsi/sssraid/sssraid_os.c:1999:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:1999:9: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2002:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2002:16: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:2002:16: sparse: sparse: got 0x2003
   drivers/scsi/sssraid/sssraid_os.c:2003:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2003:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2008:35: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2008:35: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:2008:35: sparse: sparse: got {
   drivers/scsi/sssraid/sssraid_os.c:2008:35: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:2008:35: sparse: sparse: got !
   drivers/scsi/sssraid/sssraid_os.c:2008:35: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2008:35: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2008:35: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2008:35: sparse: sparse: Expected ) in nested declarator
   drivers/scsi/sssraid/sssraid_os.c:2008:35: sparse: sparse: got Scsi_Host
>> drivers/scsi/sssraid/sssraid_os.c:2008:35: sparse: sparse: Trying to use reserved word 'struct' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2008:35: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2008:35: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2012:34: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:2012:34: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:2012:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2015:21: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:2015:21: sparse: sparse: got >>=
   drivers/scsi/sssraid/sssraid_os.c:2016:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2016:9: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2019:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2019:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2024:35: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2024:35: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:2024:35: sparse: sparse: got {
   drivers/scsi/sssraid/sssraid_os.c:2024:35: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:2024:35: sparse: sparse: got !
   drivers/scsi/sssraid/sssraid_os.c:2024:35: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2024:35: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2024:35: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2024:35: sparse: sparse: Expected ) in nested declarator
   drivers/scsi/sssraid/sssraid_os.c:2024:35: sparse: sparse: got Scsi_Host
   drivers/scsi/sssraid/sssraid_os.c:2024:35: sparse: sparse: Trying to use reserved word 'struct' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2024:35: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2024:35: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2028:34: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:2028:34: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:2028:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2031:21: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:2031:21: sparse: sparse: got >>=
   drivers/scsi/sssraid/sssraid_os.c:2032:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2032:9: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2035:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2035:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2040:35: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2040:35: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:2040:35: sparse: sparse: got {
   drivers/scsi/sssraid/sssraid_os.c:2040:35: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:2040:35: sparse: sparse: got !
   drivers/scsi/sssraid/sssraid_os.c:2040:35: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2040:35: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2040:35: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2040:35: sparse: sparse: Expected ) in nested declarator
   drivers/scsi/sssraid/sssraid_os.c:2040:35: sparse: sparse: got Scsi_Host
   drivers/scsi/sssraid/sssraid_os.c:2040:35: sparse: sparse: Trying to use reserved word 'struct' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2040:35: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2040:35: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2044:34: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:2044:34: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:2044:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2047:21: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:2047:21: sparse: sparse: got >>=
   drivers/scsi/sssraid/sssraid_os.c:2048:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2048:9: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2051:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2051:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2056:35: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2056:35: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:2056:35: sparse: sparse: got {
   drivers/scsi/sssraid/sssraid_os.c:2056:35: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:2056:35: sparse: sparse: got !
   drivers/scsi/sssraid/sssraid_os.c:2056:35: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2056:35: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2056:35: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2056:35: sparse: sparse: Expected ) in nested declarator
   drivers/scsi/sssraid/sssraid_os.c:2056:35: sparse: sparse: got Scsi_Host
   drivers/scsi/sssraid/sssraid_os.c:2056:35: sparse: sparse: Trying to use reserved word 'struct' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2056:35: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2056:35: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2060:34: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:2060:34: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:2060:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2063:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2063:16: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:2063:16: sparse: sparse: got snprintf
   drivers/scsi/sssraid/sssraid_os.c:2064:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2064:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2069:35: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2069:35: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:2069:35: sparse: sparse: got {
   drivers/scsi/sssraid/sssraid_os.c:2069:35: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:2069:35: sparse: sparse: got !
   drivers/scsi/sssraid/sssraid_os.c:2069:35: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2069:35: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2069:35: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2069:35: sparse: sparse: Expected ) in nested declarator
   drivers/scsi/sssraid/sssraid_os.c:2069:35: sparse: sparse: got Scsi_Host
   drivers/scsi/sssraid/sssraid_os.c:2069:35: sparse: sparse: Trying to use reserved word 'struct' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2069:35: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2069:35: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2072:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2072:16: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:2072:16: sparse: sparse: got snprintf
   drivers/scsi/sssraid/sssraid_os.c:2073:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2073:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2083:22: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:2083:22: sparse: sparse: got (
   drivers/scsi/sssraid/sssraid_os.c:2083:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2085:17: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:2085:17: sparse: sparse: got <
   drivers/scsi/sssraid/sssraid_os.c:2085:9: sparse: sparse: Trying to use reserved word 'if' as identifier
--
   drivers/scsi/sssraid/sssraid_os.c:2090:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2090:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2095:35: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2095:35: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:2095:35: sparse: sparse: got {
   drivers/scsi/sssraid/sssraid_os.c:2095:35: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:2095:35: sparse: sparse: got !
   drivers/scsi/sssraid/sssraid_os.c:2095:35: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2095:35: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2095:35: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2095:35: sparse: sparse: Expected ) in nested declarator
   drivers/scsi/sssraid/sssraid_os.c:2095:35: sparse: sparse: got Scsi_Host
   drivers/scsi/sssraid/sssraid_os.c:2095:35: sparse: sparse: Trying to use reserved word 'struct' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2095:35: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2095:35: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2098:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2098:16: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:2098:16: sparse: sparse: got snprintf
   drivers/scsi/sssraid/sssraid_os.c:2099:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2099:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2104:35: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2104:35: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:2104:35: sparse: sparse: got {
   drivers/scsi/sssraid/sssraid_os.c:2104:35: sparse: sparse: Expected ) in function declarator
   drivers/scsi/sssraid/sssraid_os.c:2104:35: sparse: sparse: got !
   drivers/scsi/sssraid/sssraid_os.c:2104:35: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2104:35: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2104:35: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2104:35: sparse: sparse: Expected ) in nested declarator
   drivers/scsi/sssraid/sssraid_os.c:2104:35: sparse: sparse: got Scsi_Host
   drivers/scsi/sssraid/sssraid_os.c:2104:35: sparse: sparse: Trying to use reserved word 'struct' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2104:35: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2104:35: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:2107:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/scsi/sssraid/sssraid_os.c:2107:16: sparse: sparse: Expected ; at end of declaration
   drivers/scsi/sssraid/sssraid_os.c:2107:16: sparse: sparse: got snprintf
   drivers/scsi/sssraid/sssraid_os.c:2108:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/scsi/sssraid/sssraid_os.c:2108:1: sparse: sparse: got }
   drivers/scsi/sssraid/sssraid_os.c:1704:9: sparse: sparse: undefined identifier 'for_each_pci_msi_entry'
   drivers/scsi/sssraid/sssraid_os.c:1707:34: sparse: sparse: undefined identifier 'msi_list'
   drivers/scsi/sssraid/sssraid_os.c:1732:17: sparse: sparse: undefined identifier 'node_mask'
   drivers/scsi/sssraid/sssraid_os.c:1732:17: sparse: sparse: symbol 'cpu' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1732:17: sparse:    incomplete type [addressable] [toplevel] cpu
   drivers/scsi/sssraid/sssraid_os.c:1732:17: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1732:17: sparse:    int [addressable] [toplevel] cpu
   drivers/scsi/sssraid/sssraid_os.c:1745:48: sparse: sparse: undefined identifier 'shost'
   drivers/scsi/sssraid/sssraid_os.c:1746:36: sparse: sparse: undefined identifier 'scmd'
   drivers/scsi/sssraid/sssraid_os.c:1765:9: sparse: sparse: symbol 'hostdata' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1765:9: sparse:    int [addressable] [toplevel] hostdata
   drivers/scsi/sssraid/sssraid_os.c:1747:38: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1747:38: sparse:    struct sssraid_sdev_hostdata *[addressable] [toplevel] hostdata
   drivers/scsi/sssraid/sssraid_os.c:1766:9: sparse: sparse: symbol 'sssraid_get_tag_from_scmd' redeclared with different type (incompatible argument 1 (different base types)):
   drivers/scsi/sssraid/sssraid_os.c:1766:9: sparse:    int static [signed] [toplevel] sssraid_get_tag_from_scmd( ... )
   drivers/scsi/sssraid/sssraid_os.c:650:1: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:650:1: sparse:    void static inline [toplevel] [unused] sssraid_get_tag_from_scmd( ... )
   drivers/scsi/sssraid/sssraid_os.c:1767:9: sparse: sparse: symbol 'sq' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1767:9: sparse:    int [addressable] [toplevel] sq
   drivers/scsi/sssraid/sssraid_os.c:1749:31: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1749:31: sparse:    struct sssraid_squeue *[addressable] [toplevel] sq
   drivers/scsi/sssraid/sssraid_os.c:1776:9: sparse: sparse: symbol 'ioq_cmd' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1776:9: sparse:    int [addressable] [toplevel] ioq_cmd
   drivers/scsi/sssraid/sssraid_os.c:1750:36: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1750:36: sparse:    struct sssraid_ioq_command [addressable] [toplevel] ioq_cmd
   drivers/scsi/sssraid/sssraid_os.c:1777:9: sparse: sparse: symbol 'ioq_cmd' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1777:9: sparse:    int [addressable] [toplevel] ioq_cmd
   drivers/scsi/sssraid/sssraid_os.c:1750:36: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1750:36: sparse:    struct sssraid_ioq_command [addressable] [toplevel] ioq_cmd
   drivers/scsi/sssraid/sssraid_os.c:1782:17: sparse: sparse: symbol 'atomic_dec' redeclared with different type (different argument counts):
   drivers/scsi/sssraid/sssraid_os.c:1782:17: sparse:    int static [signed] [toplevel] atomic_dec( ... )
   drivers/scsi/sssraid/sssraid_os.c: note: in included file (through arch/x86/include/asm/atomic.h, include/linux/atomic.h, include/linux/jump_label.h, ...):
   include/asm-generic/atomic-instrumented.h:125:29: sparse: note: previously declared as:
   include/asm-generic/atomic-instrumented.h:125:29: sparse:    void static inline [toplevel] [unused] atomic_dec( ... )
   drivers/scsi/sssraid/sssraid_os.c:1789:17: sparse: sparse: undefined identifier 'iod'
   drivers/scsi/sssraid/sssraid_os.c:1790:17: sparse: sparse: undefined identifier 'iod'
   drivers/scsi/sssraid/sssraid_os.c:1797:9: sparse: sparse: symbol 'ioq_cmd' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1797:9: sparse:    int [addressable] [toplevel] ioq_cmd
   drivers/scsi/sssraid/sssraid_os.c:1750:36: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1750:36: sparse:    struct sssraid_ioq_command [addressable] [toplevel] ioq_cmd
   drivers/scsi/sssraid/sssraid_os.c:1799:9: sparse: sparse: symbol 'sssraid_init_iod' redeclared with different type (incompatible argument 1 (different base types)):
   drivers/scsi/sssraid/sssraid_os.c:1799:9: sparse:    int static [signed] [toplevel] sssraid_init_iod( ... )
   drivers/scsi/sssraid/sssraid_os.c:792:20: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:792:20: sparse:    void static inline [toplevel] [unused] sssraid_init_iod( ... )
   drivers/scsi/sssraid/sssraid_os.c:1803:9: sparse: sparse: symbol 'retval' has multiple initializers (originally initialized at drivers/scsi/sssraid/sssraid_os.c:1779)
   drivers/scsi/sssraid/sssraid_os.c:1806:17: sparse: sparse: symbol 'set_host_byte' redeclared with different type (incompatible argument 1 (different base types)):
   drivers/scsi/sssraid/sssraid_os.c:1806:17: sparse:    int static [signed] [toplevel] set_host_byte( ... )
   drivers/scsi/sssraid/sssraid_os.c: note: in included file:
   include/scsi/scsi_cmnd.h:349:20: sparse: note: previously declared as:
   include/scsi/scsi_cmnd.h:349:20: sparse:    void static inline [toplevel] [unused] set_host_byte( ... )
   drivers/scsi/sssraid/sssraid_os.c:1808:17: sparse: sparse: symbol 'retval' has multiple initializers (originally initialized at drivers/scsi/sssraid/sssraid_os.c:1803)
   drivers/scsi/sssraid/sssraid_os.c:1812:9: sparse: sparse: symbol '__write_once_size' redeclared with different type (different argument counts):
   drivers/scsi/sssraid/sssraid_os.c:1812:9: sparse:    int static [signed] [toplevel] __write_once_size( ... )
   drivers/scsi/sssraid/sssraid_os.c: note: in included file (through include/linux/string.h, include/linux/uuid.h, include/linux/mod_devicetable.h, ...):
   include/linux/compiler.h:228:29: sparse: note: previously declared as:
   include/linux/compiler.h:228:29: sparse:    void static inline [toplevel] [unused] __write_once_size( ... )
   drivers/scsi/sssraid/sssraid_os.c:1832:28: sparse: sparse: symbol 'sdioc' has multiple initializers (originally initialized at drivers/scsi/sssraid/sssraid_os.c:1745)
   drivers/scsi/sssraid/sssraid_os.c:1833:38: sparse: sparse: symbol 'hostdata' has multiple initializers (originally initialized at drivers/scsi/sssraid/sssraid_os.c:1765)
   drivers/scsi/sssraid/sssraid_os.c:1833:38: sparse: sparse: symbol 'hostdata' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1833:38: sparse:    struct sssraid_sdev_hostdata *[addressable] [toplevel] hostdata
   drivers/scsi/sssraid/sssraid_os.c:1765:9: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1765:9: sparse:    int [addressable] [toplevel] hostdata
>> drivers/scsi/sssraid/sssraid_os.c:1837:21: sparse: sparse: cannot dereference this type
   drivers/scsi/sssraid/sssraid_os.c:1839:26: sparse: sparse: cannot dereference this type
   drivers/scsi/sssraid/sssraid_os.c:1841:35: sparse: sparse: cannot dereference this type
   drivers/scsi/sssraid/sssraid_os.c:1842:17: sparse: sparse: undefined identifier 'qd'
   drivers/scsi/sssraid/sssraid_os.c:1842:53: sparse: sparse: cannot dereference this type
   drivers/scsi/sssraid/sssraid_os.c:1844:49: sparse: sparse: cannot dereference this type
   drivers/scsi/sssraid/sssraid_os.c:1845:33: sparse: sparse: cannot dereference this type
   drivers/scsi/sssraid/sssraid_os.c:1846:41: sparse: sparse: cannot dereference this type
   drivers/scsi/sssraid/sssraid_os.c:1850:33: sparse: sparse: cannot dereference this type
   drivers/scsi/sssraid/sssraid_os.c:1856:9: sparse: sparse: symbol 'sdev' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1856:9: sparse:    int [addressable] [toplevel] sdev
   drivers/scsi/sssraid/sssraid_os.c:1746:28: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1746:28: sparse:    struct scsi_device *[addressable] [toplevel] sdev
   drivers/scsi/sssraid/sssraid_os.c:1876:26: sparse: sparse: symbol 'scmd' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1876:26: sparse:    struct scsi_cmnd *[addressable] [toplevel] scmd
   drivers/scsi/sssraid/sssraid_os.c:1807:17: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1807:17: sparse:    int [addressable] [toplevel] scmd
   drivers/scsi/sssraid/sssraid_os.c:1877:28: sparse: sparse: symbol 'iod' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1877:28: sparse:    struct sssraid_iod *[addressable] [toplevel] iod
   drivers/scsi/sssraid/sssraid_os.c:1802:9: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1802:9: sparse:    int [addressable] [toplevel] iod
   drivers/scsi/sssraid/sssraid_os.c:1882:33: sparse: sparse: undefined identifier 'rq'
   drivers/scsi/sssraid/sssraid_os.c:1882:9: sparse: sparse: symbol 'scmd' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1882:9: sparse:    int [addressable] [toplevel] scmd
   drivers/scsi/sssraid/sssraid_os.c:1876:26: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1876:26: sparse:    struct scsi_cmnd *[addressable] [toplevel] scmd
   drivers/scsi/sssraid/sssraid_os.c:1883:9: sparse: sparse: symbol 'iod' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1883:9: sparse:    int [addressable] [toplevel] iod
   drivers/scsi/sssraid/sssraid_os.c:1877:28: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1877:28: sparse:    struct sssraid_iod *[addressable] [toplevel] iod
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: undefined identifier '__ai_ptr'
   drivers/scsi/sssraid/sssraid_os.c:1885:14: sparse: sparse: undefined identifier '__ai_ptr'
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: undefined identifier '__ai_ptr'
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: symbol '__old' has multiple initializers (originally initialized at drivers/scsi/sssraid/sssraid_os.c:1885)
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: undefined identifier '__ai_ptr'
   drivers/scsi/sssraid/sssraid_os.c:1887:14: sparse: sparse: symbol '__new' has multiple initializers (originally initialized at drivers/scsi/sssraid/sssraid_os.c:1885)
   drivers/scsi/sssraid/sssraid_os.c:1891:9: sparse: sparse: symbol 'set_host_byte' redeclared with different type (incompatible argument 1 (different base types)):
   drivers/scsi/sssraid/sssraid_os.c:1891:9: sparse:    int static [signed] [toplevel] set_host_byte( ... )
   drivers/scsi/sssraid/sssraid_os.c: note: in included file:
   include/scsi/scsi_cmnd.h:349:20: sparse: note: previously declared as:
   include/scsi/scsi_cmnd.h:349:20: sparse:    void static inline [toplevel] [unused] set_host_byte( ... )
   drivers/scsi/sssraid/sssraid_os.c:1898:9: sparse: sparse: symbol 'scmd' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1898:9: sparse:    int [addressable] [toplevel] scmd
   drivers/scsi/sssraid/sssraid_os.c:1876:26: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1876:26: sparse:    struct scsi_cmnd *[addressable] [toplevel] scmd
   drivers/scsi/sssraid/sssraid_os.c:1914:32: sparse: sparse: cannot dereference this type
   drivers/scsi/sssraid/sssraid_os.c:1914:9: sparse: sparse: symbol 'sdioc' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1914:9: sparse:    int [addressable] [toplevel] sdioc
   drivers/scsi/sssraid/sssraid_os.c:1911:28: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1911:28: sparse:    struct sssraid_ioc *[addressable] [toplevel] sdioc
   drivers/scsi/sssraid/sssraid_os.c:1915:35: sparse: sparse: cannot dereference this type
   drivers/scsi/sssraid/sssraid_os.c:1915:9: sparse: sparse: symbol 'hostdata' has multiple initializers (originally initialized at drivers/scsi/sssraid/sssraid_os.c:1833)
   drivers/scsi/sssraid/sssraid_os.c:1915:9: sparse: sparse: symbol 'hostdata' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1915:9: sparse:    int [addressable] [toplevel] hostdata
   drivers/scsi/sssraid/sssraid_os.c:1833:38: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1833:38: sparse:    struct sssraid_sdev_hostdata *[addressable] [toplevel] hostdata
   drivers/scsi/sssraid/sssraid_os.c:1922:23: sparse: sparse: symbol 'idx' redeclared with different type (different type sizes):
   drivers/scsi/sssraid/sssraid_os.c:1922:23: sparse:    int [addressable] [toplevel] idx
   drivers/scsi/sssraid/sssraid_os.c:1912:13: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1912:13: sparse:    unsigned short [addressable] [toplevel] [usertype] idx
   drivers/scsi/sssraid/sssraid_os.c:1922:64: sparse: sparse: symbol 'idx' redeclared with different type (different type sizes):
   drivers/scsi/sssraid/sssraid_os.c:1922:64: sparse:    int [addressable] [toplevel] idx
   drivers/scsi/sssraid/sssraid_os.c:1912:13: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1912:13: sparse:    unsigned short [addressable] [toplevel] [usertype] idx
   drivers/scsi/sssraid/sssraid_os.c:1933:9: sparse: sparse: symbol 'hostdata' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1933:9: sparse:    int [addressable] [toplevel] hostdata
   drivers/scsi/sssraid/sssraid_os.c:1833:38: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1833:38: sparse:    struct sssraid_sdev_hostdata *[addressable] [toplevel] hostdata
   drivers/scsi/sssraid/sssraid_os.c:1934:9: sparse: sparse: symbol 'hostdata' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1934:9: sparse:    int [addressable] [toplevel] hostdata
   drivers/scsi/sssraid/sssraid_os.c:1833:38: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1833:38: sparse:    struct sssraid_sdev_hostdata *[addressable] [toplevel] hostdata
   drivers/scsi/sssraid/sssraid_os.c:1935:9: sparse: sparse: symbol 'hostdata' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1935:9: sparse:    int [addressable] [toplevel] hostdata
   drivers/scsi/sssraid/sssraid_os.c:1833:38: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1833:38: sparse:    struct sssraid_sdev_hostdata *[addressable] [toplevel] hostdata
   drivers/scsi/sssraid/sssraid_os.c:1936:9: sparse: sparse: symbol 'hostdata' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1936:9: sparse:    int [addressable] [toplevel] hostdata
   drivers/scsi/sssraid/sssraid_os.c:1833:38: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1833:38: sparse:    struct sssraid_sdev_hostdata *[addressable] [toplevel] hostdata
   drivers/scsi/sssraid/sssraid_os.c:1937:9: sparse: sparse: symbol 'sdev' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1937:9: sparse:    int [addressable] [toplevel] sdev
   drivers/scsi/sssraid/sssraid_os.c:1746:28: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1746:28: sparse:    struct scsi_device *[addressable] [toplevel] sdev
   drivers/scsi/sssraid/sssraid_os.c:1946:9: sparse: sparse: symbol 'sdev' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1946:9: sparse:    int [addressable] [toplevel] sdev
   drivers/scsi/sssraid/sssraid_os.c:1746:28: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1746:28: sparse:    struct scsi_device *[addressable] [toplevel] sdev
   drivers/scsi/sssraid/sssraid_os.c:1953:36: sparse: sparse: cannot dereference this type
   drivers/scsi/sssraid/sssraid_os.c:1953:22: sparse: sparse: symbol 'timeout' has multiple initializers (originally initialized at drivers/scsi/sssraid/sssraid_os.c:1831)
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: cannot dereference this type
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: sparse: symbol '__dummy2' redeclared with different type (different base types):
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse:    bad type [addressable] [toplevel] __dummy2
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse: note: previously declared as:
   drivers/scsi/sssraid/sssraid_os.c:1958:13: sparse:    unsigned long volatile [addressable] [toplevel] __dummy2
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: undefined identifier '__ai_ptr'
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: symbol '__old' has multiple initializers (originally initialized at drivers/scsi/sssraid/sssraid_os.c:1887)
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: undefined identifier '__ai_ptr'
   drivers/scsi/sssraid/sssraid_os.c:1959:21: sparse: sparse: symbol '__new' has multiple initializers (originally initialized at drivers/scsi/sssraid/sssraid_os.c:1887)
   drivers/scsi/sssraid/sssraid_os.c:1973:28: sparse: sparse: symbol 'iod' has multiple initializers (originally initialized at drivers/scsi/sssraid/sssraid_os.c:1883)
   drivers/scsi/sssraid/sssraid_os.c:1973:28: sparse: sparse: symbol 'iod' redeclared with different type (different base types):

vim +1716 drivers/scsi/sssraid/sssraid_os.c

2e2a4edd9d4a72 Steven Song 2023-11-07  1689  
2e2a4edd9d4a72 Steven Song 2023-11-07  1690  static int sssraid_map_queues(struct Scsi_Host *shost)
2e2a4edd9d4a72 Steven Song 2023-11-07  1691  {
2e2a4edd9d4a72 Steven Song 2023-11-07  1692  	struct sssraid_ioc *sdioc = shost_priv(shost);
2e2a4edd9d4a72 Steven Song 2023-11-07  1693  	struct pci_dev *pdev = sdioc->pdev;
2e2a4edd9d4a72 Steven Song 2023-11-07  1694  	struct msi_desc *entry = NULL;
2e2a4edd9d4a72 Steven Song 2023-11-07  1695  	struct blk_mq_tag_set *tag_set = &shost->tag_set;
2e2a4edd9d4a72 Steven Song 2023-11-07  1696  	unsigned int *map = tag_set->mq_map;
2e2a4edd9d4a72 Steven Song 2023-11-07  1697  	const struct cpumask *node_mask = NULL;
2e2a4edd9d4a72 Steven Song 2023-11-07  1698  	unsigned int nr_queues = tag_set->nr_hw_queues;
2e2a4edd9d4a72 Steven Song 2023-11-07  1699  	unsigned int node_id, node_id_last = 0xFFFFFFFF;
2e2a4edd9d4a72 Steven Song 2023-11-07  1700  	int cpu, queue = 0;
2e2a4edd9d4a72 Steven Song 2023-11-07  1701  	u8 node_count = 0, i;
2e2a4edd9d4a72 Steven Song 2023-11-07  1702  	unsigned int node_id_array[100];
2e2a4edd9d4a72 Steven Song 2023-11-07  1703  
2e2a4edd9d4a72 Steven Song 2023-11-07  1704  	for_each_pci_msi_entry(entry, pdev) {
2e2a4edd9d4a72 Steven Song 2023-11-07  1705  		struct list_head *msi_list = &pdev->dev.msi_list;
2e2a4edd9d4a72 Steven Song 2023-11-07  1706  
2e2a4edd9d4a72 Steven Song 2023-11-07  1707  		if (list_is_last(msi_list, &entry->list))
2e2a4edd9d4a72 Steven Song 2023-11-07  1708  			goto get_next_numa_node;
2e2a4edd9d4a72 Steven Song 2023-11-07  1709  
2e2a4edd9d4a72 Steven Song 2023-11-07  1710  		if (entry->irq) {
2e2a4edd9d4a72 Steven Song 2023-11-07  1711  			node_mask = entry->affinity;
2e2a4edd9d4a72 Steven Song 2023-11-07  1712  
2e2a4edd9d4a72 Steven Song 2023-11-07  1713  			cpu = cpumask_first(node_mask);
2e2a4edd9d4a72 Steven Song 2023-11-07  1714  			node_id = cpu_to_node(cpu);
2e2a4edd9d4a72 Steven Song 2023-11-07  1715  			if (node_id_last == node_id)
2e2a4edd9d4a72 Steven Song 2023-11-07 @1716  				continue;
2e2a4edd9d4a72 Steven Song 2023-11-07  1717  
2e2a4edd9d4a72 Steven Song 2023-11-07  1718  			for (i = 0; i < node_count; i++) {
2e2a4edd9d4a72 Steven Song 2023-11-07  1719  				if (node_id == node_id_array[i])
2e2a4edd9d4a72 Steven Song 2023-11-07  1720  					goto get_next_numa_node;
2e2a4edd9d4a72 Steven Song 2023-11-07  1721  			}
2e2a4edd9d4a72 Steven Song 2023-11-07  1722  			node_id_array[node_count++] = node_id;
2e2a4edd9d4a72 Steven Song 2023-11-07  1723  			node_id_last = node_id;
2e2a4edd9d4a72 Steven Song 2023-11-07  1724  		}
2e2a4edd9d4a72 Steven Song 2023-11-07  1725  get_next_numa_node:
2e2a4edd9d4a72 Steven Song 2023-11-07  1726  		continue;
2e2a4edd9d4a72 Steven Song 2023-11-07  1727  	}
2e2a4edd9d4a72 Steven Song 2023-11-07  1728  
2e2a4edd9d4a72 Steven Song 2023-11-07 @1729  	for (i = 0; i < node_count; i++) {
2e2a4edd9d4a72 Steven Song 2023-11-07  1730  		node_mask = cpumask_of_node(node_id_array[i]);
2e2a4edd9d4a72 Steven Song 2023-11-07 @1731  		dbgprint(sdioc, "NUMA_node = %d\n", node_id_array[i]);
2e2a4edd9d4a72 Steven Song 2023-11-07  1732  		for_each_cpu(cpu, node_mask) {
2e2a4edd9d4a72 Steven Song 2023-11-07  1733  			map[cpu] = (queue < nr_queues) ? queue++ : 0;
2e2a4edd9d4a72 Steven Song 2023-11-07  1734  			dbgprint(sdioc, "map[%d] = %d\n", cpu, map[cpu]);
2e2a4edd9d4a72 Steven Song 2023-11-07  1735  		}
2e2a4edd9d4a72 Steven Song 2023-11-07  1736  	}
2e2a4edd9d4a72 Steven Song 2023-11-07  1737  
2e2a4edd9d4a72 Steven Song 2023-11-07  1738  	return 0;
2e2a4edd9d4a72 Steven Song 2023-11-07  1739  }
2e2a4edd9d4a72 Steven Song 2023-11-07  1740  
2e2a4edd9d4a72 Steven Song 2023-11-07  1741  /* queuecommand	call back */
2e2a4edd9d4a72 Steven Song 2023-11-07  1742  static int sssraid_qcmd(struct Scsi_Host *shost, struct scsi_cmnd *scmd)
2e2a4edd9d4a72 Steven Song 2023-11-07  1743  {
2e2a4edd9d4a72 Steven Song 2023-11-07  1744  	struct sssraid_iod *iod = scsi_cmd_priv(scmd);
2e2a4edd9d4a72 Steven Song 2023-11-07  1745  	struct sssraid_ioc *sdioc = shost_priv(shost);
2e2a4edd9d4a72 Steven Song 2023-11-07  1746  	struct scsi_device *sdev = scmd->device;
2e2a4edd9d4a72 Steven Song 2023-11-07  1747  	struct sssraid_sdev_hostdata *hostdata;
2e2a4edd9d4a72 Steven Song 2023-11-07  1748  	u16 hwq, cid;
2e2a4edd9d4a72 Steven Song 2023-11-07  1749  	struct sssraid_squeue *sq;
2e2a4edd9d4a72 Steven Song 2023-11-07  1750  	struct sssraid_ioq_command ioq_cmd;
2e2a4edd9d4a72 Steven Song 2023-11-07  1751  	int retval;
2e2a4edd9d4a72 Steven Song 2023-11-07  1752  
2e2a4edd9d4a72 Steven Song 2023-11-07 @1753  	if (unlikely(sdioc->state == SSSRAID_RESETTING))
2e2a4edd9d4a72 Steven Song 2023-11-07  1754  		return SCSI_MLQUEUE_HOST_BUSY;
2e2a4edd9d4a72 Steven Song 2023-11-07  1755  
2e2a4edd9d4a72 Steven Song 2023-11-07  1756  	if (unlikely(sdioc->state != SSSRAID_LIVE)) {
2e2a4edd9d4a72 Steven Song 2023-11-07  1757  		set_host_byte(scmd, DID_NO_CONNECT);
2e2a4edd9d4a72 Steven Song 2023-11-07  1758  		scmd->scsi_done(scmd);
2e2a4edd9d4a72 Steven Song 2023-11-07 @1759  		return 0;
2e2a4edd9d4a72 Steven Song 2023-11-07  1760  	}
2e2a4edd9d4a72 Steven Song 2023-11-07  1761  
2e2a4edd9d4a72 Steven Song 2023-11-07  1762  	if (unlikely(sdioc->logging_level & SSSRAID_DEBUG))
2e2a4edd9d4a72 Steven Song 2023-11-07  1763  		scsi_print_command(scmd);
2e2a4edd9d4a72 Steven Song 2023-11-07  1764  
2e2a4edd9d4a72 Steven Song 2023-11-07  1765  	hostdata = sdev->hostdata;
2e2a4edd9d4a72 Steven Song 2023-11-07  1766  	sssraid_get_tag_from_scmd(scmd, &hwq, sdioc, &cid, hostdata);
2e2a4edd9d4a72 Steven Song 2023-11-07  1767  	sq = &sdioc->sqinfo[hwq];
2e2a4edd9d4a72 Steven Song 2023-11-07  1768  
2e2a4edd9d4a72 Steven Song 2023-11-07  1769  	if (unlikely(atomic_inc_return(&sq->inflight) >
2e2a4edd9d4a72 Steven Song 2023-11-07  1770  		     (sdioc->ioq_depth - SSSRAID_PTCMDS_PERQ))) {
2e2a4edd9d4a72 Steven Song 2023-11-07  1771  		atomic_dec(&sq->inflight);
2e2a4edd9d4a72 Steven Song 2023-11-07  1772  		return SCSI_MLQUEUE_HOST_BUSY;
2e2a4edd9d4a72 Steven Song 2023-11-07  1773  	}
2e2a4edd9d4a72 Steven Song 2023-11-07  1774  
2e2a4edd9d4a72 Steven Song 2023-11-07  1775  	memset(&ioq_cmd, 0, sizeof(ioq_cmd));
2e2a4edd9d4a72 Steven Song 2023-11-07  1776  	ioq_cmd.rw.hdid = cpu_to_le32(hostdata->hdid);
2e2a4edd9d4a72 Steven Song 2023-11-07  1777  	ioq_cmd.rw.command_id = cpu_to_le16(cid);
2e2a4edd9d4a72 Steven Song 2023-11-07  1778  
2e2a4edd9d4a72 Steven Song 2023-11-07  1779  	retval = sssraid_setup_ioq_cmd(sdioc, &ioq_cmd, scmd);
2e2a4edd9d4a72 Steven Song 2023-11-07  1780  	if (unlikely(retval)) {
2e2a4edd9d4a72 Steven Song 2023-11-07  1781  		set_host_byte(scmd, DID_ERROR);
2e2a4edd9d4a72 Steven Song 2023-11-07  1782  		atomic_dec(&sq->inflight);
2e2a4edd9d4a72 Steven Song 2023-11-07  1783  		scmd->scsi_done(scmd);
2e2a4edd9d4a72 Steven Song 2023-11-07  1784  		return 0;
2e2a4edd9d4a72 Steven Song 2023-11-07  1785  	}
2e2a4edd9d4a72 Steven Song 2023-11-07  1786  
2e2a4edd9d4a72 Steven Song 2023-11-07  1787  	retval = cid * SCSI_SENSE_BUFFERSIZE;
2e2a4edd9d4a72 Steven Song 2023-11-07 @1788  	if (work_mode) {
2e2a4edd9d4a72 Steven Song 2023-11-07  1789  		iod->sense = sdioc->senses + retval;
2e2a4edd9d4a72 Steven Song 2023-11-07  1790  		iod->sense_dma = sdioc->sense_dma_addr + retval;
2e2a4edd9d4a72 Steven Song 2023-11-07 @1791  	} else {
2e2a4edd9d4a72 Steven Song 2023-11-07  1792  		iod->sense = sq->sense + retval;
2e2a4edd9d4a72 Steven Song 2023-11-07  1793  		iod->sense_dma = sq->sense_dma_addr + retval;
2e2a4edd9d4a72 Steven Song 2023-11-07  1794  	}
2e2a4edd9d4a72 Steven Song 2023-11-07  1795  
2e2a4edd9d4a72 Steven Song 2023-11-07  1796  	ioq_cmd.common.sense_addr = cpu_to_le64(iod->sense_dma);
2e2a4edd9d4a72 Steven Song 2023-11-07  1797  	ioq_cmd.common.sense_len = cpu_to_le16(SCSI_SENSE_BUFFERSIZE);
2e2a4edd9d4a72 Steven Song 2023-11-07  1798  
2e2a4edd9d4a72 Steven Song 2023-11-07  1799  	sssraid_init_iod(iod);
2e2a4edd9d4a72 Steven Song 2023-11-07  1800  
2e2a4edd9d4a72 Steven Song 2023-11-07  1801  	iod->sqinfo = sq;
2e2a4edd9d4a72 Steven Song 2023-11-07  1802  	iod->cid = cid;
2e2a4edd9d4a72 Steven Song 2023-11-07  1803  	retval = sssraid_io_map_data(sdioc, iod, scmd, &ioq_cmd);
2e2a4edd9d4a72 Steven Song 2023-11-07  1804  	if (unlikely(retval)) {
2e2a4edd9d4a72 Steven Song 2023-11-07  1805  		ioc_err(sdioc, "err: io map data fail.\n");
2e2a4edd9d4a72 Steven Song 2023-11-07  1806  		set_host_byte(scmd, DID_ERROR);
2e2a4edd9d4a72 Steven Song 2023-11-07  1807  		scmd->scsi_done(scmd);
2e2a4edd9d4a72 Steven Song 2023-11-07  1808  		retval = 0;
2e2a4edd9d4a72 Steven Song 2023-11-07 @1809  		goto deinit_iod;
2e2a4edd9d4a72 Steven Song 2023-11-07  1810  	}
2e2a4edd9d4a72 Steven Song 2023-11-07  1811  
2e2a4edd9d4a72 Steven Song 2023-11-07  1812  	WRITE_ONCE(iod->state, SSSRAID_CMDSTAT_FLIGHT);
2e2a4edd9d4a72 Steven Song 2023-11-07  1813  	sssraid_submit_cmd(sq, &ioq_cmd);
2e2a4edd9d4a72 Steven Song 2023-11-07  1814  
2e2a4edd9d4a72 Steven Song 2023-11-07  1815  	return 0;
2e2a4edd9d4a72 Steven Song 2023-11-07  1816  
2e2a4edd9d4a72 Steven Song 2023-11-07  1817  deinit_iod:
2e2a4edd9d4a72 Steven Song 2023-11-07  1818  	atomic_dec(&sq->inflight);
2e2a4edd9d4a72 Steven Song 2023-11-07  1819  	sssraid_free_iod_res(sdioc, iod);
2e2a4edd9d4a72 Steven Song 2023-11-07  1820  	return retval;
2e2a4edd9d4a72 Steven Song 2023-11-07  1821  }
2e2a4edd9d4a72 Steven Song 2023-11-07  1822  
2e2a4edd9d4a72 Steven Song 2023-11-07  1823  /* change_queue_depth call back:
2e2a4edd9d4a72 Steven Song 2023-11-07  1824   * keep as old
2e2a4edd9d4a72 Steven Song 2023-11-07  1825   */
2e2a4edd9d4a72 Steven Song 2023-11-07  1826  
2e2a4edd9d4a72 Steven Song 2023-11-07  1827  /* slave_configure call back */
2e2a4edd9d4a72 Steven Song 2023-11-07  1828  static int sssraid_slave_configure(struct scsi_device *sdev)
2e2a4edd9d4a72 Steven Song 2023-11-07  1829  {
2e2a4edd9d4a72 Steven Song 2023-11-07  1830  	int qd = MAX_CMD_PER_DEV;
2e2a4edd9d4a72 Steven Song 2023-11-07  1831  	unsigned int timeout = scmd_tmout_rawdisk * HZ;
2e2a4edd9d4a72 Steven Song 2023-11-07  1832  	struct sssraid_ioc *sdioc = shost_priv(sdev->host);
2e2a4edd9d4a72 Steven Song 2023-11-07  1833  	struct sssraid_sdev_hostdata *hostdata = sdev->hostdata;
2e2a4edd9d4a72 Steven Song 2023-11-07  1834  	u32 max_sec = sdev->host->max_sectors;
2e2a4edd9d4a72 Steven Song 2023-11-07  1835  
2e2a4edd9d4a72 Steven Song 2023-11-07 @1836  	if (hostdata) {
2e2a4edd9d4a72 Steven Song 2023-11-07 @1837  		if (SSSRAID_DISK_INFO_ATTR_VD(hostdata->attr))
2e2a4edd9d4a72 Steven Song 2023-11-07  1838  			timeout = scmd_tmout_vd * HZ;
2e2a4edd9d4a72 Steven Song 2023-11-07  1839  		else if (SSSRAID_DISK_INFO_ATTR_RAW(hostdata->attr))
2e2a4edd9d4a72 Steven Song 2023-11-07  1840  			timeout = scmd_tmout_rawdisk * HZ;
2e2a4edd9d4a72 Steven Song 2023-11-07  1841  		max_sec = hostdata->max_io_kb << 1;
2e2a4edd9d4a72 Steven Song 2023-11-07  1842  		qd = sssraid_get_qd_by_disk(hostdata->attr);
2e2a4edd9d4a72 Steven Song 2023-11-07  1843  
2e2a4edd9d4a72 Steven Song 2023-11-07  1844  		if (sssraid_disk_is_hdd(hostdata->attr))
2e2a4edd9d4a72 Steven Song 2023-11-07  1845  			hostdata->hwq =
2e2a4edd9d4a72 Steven Song 2023-11-07  1846  				hostdata->hdid %
2e2a4edd9d4a72 Steven Song 2023-11-07  1847  					(sdioc->init_done_queue_cnt - 1) +
2e2a4edd9d4a72 Steven Song 2023-11-07  1848  				1;
2e2a4edd9d4a72 Steven Song 2023-11-07  1849  		else
2e2a4edd9d4a72 Steven Song 2023-11-07  1850  			hostdata->hwq = 0;
2e2a4edd9d4a72 Steven Song 2023-11-07  1851  	} else {
2e2a4edd9d4a72 Steven Song 2023-11-07  1852  		ioc_err(sdioc, "err: scsi dev hostdata is null\n");
2e2a4edd9d4a72 Steven Song 2023-11-07  1853  	}
2e2a4edd9d4a72 Steven Song 2023-11-07  1854  
2e2a4edd9d4a72 Steven Song 2023-11-07  1855  	blk_queue_rq_timeout(sdev->request_queue, timeout);
2e2a4edd9d4a72 Steven Song 2023-11-07  1856  	sdev->eh_timeout = timeout;
2e2a4edd9d4a72 Steven Song 2023-11-07  1857  	scsi_change_queue_depth(sdev, qd);
2e2a4edd9d4a72 Steven Song 2023-11-07  1858  
2e2a4edd9d4a72 Steven Song 2023-11-07  1859  	if ((max_sec == 0) || (max_sec > sdev->host->max_sectors))
2e2a4edd9d4a72 Steven Song 2023-11-07  1860  		max_sec = sdev->host->max_sectors;
2e2a4edd9d4a72 Steven Song 2023-11-07  1861  
2e2a4edd9d4a72 Steven Song 2023-11-07  1862  	blk_queue_max_hw_sectors(sdev->request_queue, max_sec);
2e2a4edd9d4a72 Steven Song 2023-11-07  1863  
2e2a4edd9d4a72 Steven Song 2023-11-07  1864  	ioc_info(
2e2a4edd9d4a72 Steven Song 2023-11-07  1865  		sdioc,
2e2a4edd9d4a72 Steven Song 2023-11-07  1866  		"scsi dev channel:id:lun[%d:%d:%lld], scmd_timeout[%d]s, maxsec[%d]\n",
2e2a4edd9d4a72 Steven Song 2023-11-07  1867  		sdev->channel, sdev->id, sdev->lun, timeout / HZ, max_sec);
2e2a4edd9d4a72 Steven Song 2023-11-07  1868  
2e2a4edd9d4a72 Steven Song 2023-11-07  1869  	return 0;
2e2a4edd9d4a72 Steven Song 2023-11-07  1870  }
2e2a4edd9d4a72 Steven Song 2023-11-07  1871  
2e2a4edd9d4a72 Steven Song 2023-11-07  1872  static void sssraid_clean_pending_io(struct request *rq, void *data,
2e2a4edd9d4a72 Steven Song 2023-11-07  1873  				     bool reserved)
2e2a4edd9d4a72 Steven Song 2023-11-07  1874  {
2e2a4edd9d4a72 Steven Song 2023-11-07  1875  	struct sssraid_ioc *sdioc = data;
2e2a4edd9d4a72 Steven Song 2023-11-07  1876  	struct scsi_cmnd *scmd;
2e2a4edd9d4a72 Steven Song 2023-11-07  1877  	struct sssraid_iod *iod;
2e2a4edd9d4a72 Steven Song 2023-11-07  1878  
2e2a4edd9d4a72 Steven Song 2023-11-07  1879  	if (unlikely(!rq || !blk_mq_request_started(rq)))
2e2a4edd9d4a72 Steven Song 2023-11-07  1880  		return;
2e2a4edd9d4a72 Steven Song 2023-11-07  1881  
2e2a4edd9d4a72 Steven Song 2023-11-07  1882  	scmd = blk_mq_rq_to_pdu(rq);
2e2a4edd9d4a72 Steven Song 2023-11-07  1883  	iod = scsi_cmd_priv(scmd);
2e2a4edd9d4a72 Steven Song 2023-11-07  1884  
2e2a4edd9d4a72 Steven Song 2023-11-07 @1885  	if ((cmpxchg(&iod->state, SSSRAID_CMDSTAT_FLIGHT,
2e2a4edd9d4a72 Steven Song 2023-11-07  1886  		     SSSRAID_CMDSTAT_COMPLETE) != SSSRAID_CMDSTAT_FLIGHT) &&
2e2a4edd9d4a72 Steven Song 2023-11-07  1887  	    (cmpxchg(&iod->state, SSSRAID_CMDSTAT_TIMEOUT,
2e2a4edd9d4a72 Steven Song 2023-11-07  1888  		     SSSRAID_CMDSTAT_COMPLETE) != SSSRAID_CMDSTAT_TIMEOUT))
2e2a4edd9d4a72 Steven Song 2023-11-07  1889  		return;
2e2a4edd9d4a72 Steven Song 2023-11-07  1890  
2e2a4edd9d4a72 Steven Song 2023-11-07  1891  	set_host_byte(scmd, DID_NO_CONNECT);
2e2a4edd9d4a72 Steven Song 2023-11-07  1892  	if (iod->nsge)
2e2a4edd9d4a72 Steven Song 2023-11-07  1893  		scsi_dma_unmap(scmd);
2e2a4edd9d4a72 Steven Song 2023-11-07  1894  	sssraid_free_iod_res(sdioc, iod);
2e2a4edd9d4a72 Steven Song 2023-11-07  1895  	dev_warn_ratelimited(&sdioc->pdev->dev,
2e2a4edd9d4a72 Steven Song 2023-11-07  1896  			     "back unfinished CQE, cid[%d] qid[%d]\n", iod->cid,
2e2a4edd9d4a72 Steven Song 2023-11-07  1897  			     iod->sqinfo->qidx);
2e2a4edd9d4a72 Steven Song 2023-11-07  1898  	scmd->scsi_done(scmd);
2e2a4edd9d4a72 Steven Song 2023-11-07  1899  }
2e2a4edd9d4a72 Steven Song 2023-11-07  1900  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
