Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FFB1D86F7
	for <oe-kbuild@lists.linux.dev>; Sat, 10 May 2025 22:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746915093; cv=none; b=MvgjUK8ILIMmOLvI7S6yfXR8fJBl4PLSeqwiMp6kLDrYNO+OC5hRA31DjTDdPZEzE4ClYeG0PeuujADwszhhMr3qxhV0Pjxar8eUzCBLfzVhKP+Tada5K93zz+jJkc2QB6khmJbXptq/tZU1BJ6DoCbwzylfDr4/6FRAHEyRTVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746915093; c=relaxed/simple;
	bh=Hh4suVFOCXoYtFRRYeLrMnp4FFIlbhpCSR2pXyUWJAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+xYQQNjHp2GkS9+Qw4rIwxMPLw4Req9WfkrqTHMziYv57bangwVKajG1gHfkKAYYZD+CslpPQvpnYnChRFZxvs2lm4sR4UlCuwo5SZL3A9lba2gj5b6B++QrzjPYRqZGrw1MsrXBZw0YqeaC+xCM6RfRBE7IoqizUVvmY4/bys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1ky2TTf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1ky2TTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746915092; x=1778451092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hh4suVFOCXoYtFRRYeLrMnp4FFIlbhpCSR2pXyUWJAU=;
  b=V1ky2TTfbdxpc9R0KDs1sOHQ9NfmO5nv09FSxQDbbsMt4haxaZg9vJGw
   Hikb/5sNiKL0pPUHVPIDncudks5cYpOd3FkozA0YbkrHnbC06XxkWhfTw
   Ek8ogLVXtz+VLGqq1VH9S9Y3Mux3iZzBzmxAUqcjuatKD1W0lJHCHjxcw
   9RuOuwrqvXh4toE7DPMHph3OVnX+kkYZR9xWo6ZhcXe3c+p4IglR3MLqd
   41dhd3Bps1bw4xZkjaTliQl5OPIThseC0Ticm9BPG/8q91IRd95xl6TCk
   9obYKtLb4ZQs8juOHv6veCFLIdp1nZGiEkZ/osdalAbxUXSISe9ZbsjTC
   g==;
X-CSE-ConnectionGUID: AoLVAv6HSfy+wNHTzZRDUw==
X-CSE-MsgGUID: tPe3ibiJT12XxFvYYS0zlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="47845274"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="47845274"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 15:11:29 -0700
X-CSE-ConnectionGUID: zwCNTuFjQamkdlJQ2HdJOA==
X-CSE-MsgGUID: YCVLD5mRTpuPbwyz0X4uxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="168043911"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 May 2025 15:11:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDsPl-000DQN-1h;
	Sat, 10 May 2025 22:11:25 +0000
Date: Sun, 11 May 2025 06:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [superm1:linux-next 4/4] drivers/cpufreq/amd-pstate-ut.c:262
 amd_pstate_ut_check_driver() error: uninitialized symbol 'ret'.
Message-ID: <202505110608.VZ20jjP5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Swapnil Sapkal <swapnil.sapkal@amd.com>
CC: Mario Limonciello <mario.limonciello@amd.com>
CC: "Gautham R. Shenoy" <gautham.shenoy@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git linux-next
head:   d26d16438bc5fd5524121244cc133f9872a63210
commit: d26d16438bc5fd5524121244cc133f9872a63210 [4/4] amd-pstate-ut: Reset amd-pstate driver mode after running selftests
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20250510 (https://download.01.org/0day-ci/archive/20250511/202505110608.VZ20jjP5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505110608.VZ20jjP5-lkp@intel.com/

smatch warnings:
drivers/cpufreq/amd-pstate-ut.c:262 amd_pstate_ut_check_driver() error: uninitialized symbol 'ret'.

vim +/ret +262 drivers/cpufreq/amd-pstate-ut.c

3e39e68dfbb6d4 Mario Limonciello 2024-08-31  241  
a7875346c68910 Mario Limonciello 2025-02-14  242  static int amd_pstate_ut_check_driver(u32 index)
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  243  {
93497752dfed19 Qianqiang Liu     2024-09-11  244  	enum amd_pstate_mode mode1, mode2 = AMD_PSTATE_DISABLE;
d26d16438bc5fd Swapnil Sapkal    2025-04-30  245  	enum amd_pstate_mode orig_mode = amd_pstate_get_status();
d26d16438bc5fd Swapnil Sapkal    2025-04-30  246  	int ret;
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  247  
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  248  	for (mode1 = AMD_PSTATE_DISABLE; mode1 < AMD_PSTATE_MAX; mode1++) {
a7875346c68910 Mario Limonciello 2025-02-14  249  		int ret = amd_pstate_set_mode(mode1);
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  250  		if (ret)
a7875346c68910 Mario Limonciello 2025-02-14  251  			return ret;
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  252  		for (mode2 = AMD_PSTATE_DISABLE; mode2 < AMD_PSTATE_MAX; mode2++) {
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  253  			if (mode1 == mode2)
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  254  				continue;
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  255  			ret = amd_pstate_set_mode(mode2);
d26d16438bc5fd Swapnil Sapkal    2025-04-30  256  			if (ret)
d26d16438bc5fd Swapnil Sapkal    2025-04-30  257  				goto out;
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  258  		}
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  259  	}
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  260  
d26d16438bc5fd Swapnil Sapkal    2025-04-30  261  out:
d26d16438bc5fd Swapnil Sapkal    2025-04-30 @262  	if (ret)
d26d16438bc5fd Swapnil Sapkal    2025-04-30  263  		pr_warn("%s: failed to update status for %s->%s: %d\n", __func__,
d26d16438bc5fd Swapnil Sapkal    2025-04-30  264  			amd_pstate_get_mode_string(mode1),
d26d16438bc5fd Swapnil Sapkal    2025-04-30  265  			amd_pstate_get_mode_string(mode2), ret);
d26d16438bc5fd Swapnil Sapkal    2025-04-30  266  
d26d16438bc5fd Swapnil Sapkal    2025-04-30  267  	amd_pstate_set_mode(orig_mode);
d26d16438bc5fd Swapnil Sapkal    2025-04-30  268  	return ret;
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  269  }
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  270  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
