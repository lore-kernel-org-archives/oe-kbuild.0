Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B3CFC0A
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Jan 2024 15:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705763506; cv=none; b=jNoY9IUKDfVDSFTrEx0R98c79nCoMAxIWy4ARHllWxamuCNXj9ea3yZqT3cFoLp9hgHbeoF30MIyhGRMzb5ebne5RCxzGRaERe58X4IWbslyRJO8hz8a5FPWhPXnG29KXdAO0h7PbrSKo3sUuCX7lcBHW6Ps8R0yUbA/knOyups=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705763506; c=relaxed/simple;
	bh=9nGHZ3IceuZwj04PwLGgBO5oppU84TQqO0F5SbP7jCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BbTYY0wpW/4WA/S6oWQ0uYoQvau9FmhiqkQ8jUQNbomBuvJtzLSoJ+MlwJbSCoNW6DRLc0xT+SZb1Wf9aM778N8LTFTfk1SI3oJC134zFqNBjzvKCJkTdCHXirP3wb/DzAdE3weOvwoEUzg/TjPkY+zW3gWWDwOdwmZntEc7m0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHUKNJj6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHUKNJj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705763505; x=1737299505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9nGHZ3IceuZwj04PwLGgBO5oppU84TQqO0F5SbP7jCE=;
  b=PHUKNJj6TGJfaq6nYSBs8qdeefWFszENl67iuoNB/LAxym35nyRGXply
   lYw4B38dCSHj7pYuxuRXNobu83Ad2c7kijue5Fv5X98yvewBAuzMpk2Tn
   erZpKBWjsFlYTwT9S+KvDHrhI2wsYw4xfeDe7lL/qIAj+mmA9IzjQXz7B
   l+OQi+ObpmAl5Iw7rdLOnDH4rejHH/mXbKnOviyc013PpIC9dvj5pQcXi
   WUmX9nk4GPqAa/YWWux3loMqvqGCSKtRG702+z9cFIhijee5S6DIEiR/d
   dWgNqGpBTIHOwNK1X6UscahTzZ2R+DCqQgvzUWj1oVPSXvkpKhMhb4LKt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="19521039"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="19521039"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 07:11:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="1116483947"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="1116483947"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2024 07:11:42 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRD0W-0005By-0b;
	Sat, 20 Jan 2024 15:11:40 +0000
Date: Sat, 20 Jan 2024 23:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [oracle-dtrace:v2/6.7 1/11] builtin:14:922: sparse: sparse: string
 too long (12035 bytes, 8191 bytes max)
Message-ID: <202401202304.vOyu60L3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: builtin:14:922: sparse: sparse: string too long (12035 bytes, 8191 bytes max)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Luis Chamberlain <mcgrof@kernel.org>
CC: Nick Alcock <nick.alcock@oracle.com>
CC: Kris Van Hees <kris.van.hees@oracle.com>

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.7
head:   59b53403fac6433487b678d487564fa2ee67f229
commit: 105aecdb38625c8adc8b0d1c90ec56b3577c85f1 [1/11] kbuild: add modules.builtin.objs
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-123-20240120 (https://download.01.org/0day-ci/archive/20240120/202401202304.vOyu60L3-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401202304.vOyu60L3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401202304.vOyu60L3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   command-line: note: in included file:
   builtin:2:0: sparse: sparse: missing terminating " character
   builtin:13:0: sparse: sparse: missing terminating " character
>> builtin:14:922: sparse: sparse: string too long (12035 bytes, 8191 bytes max)
   builtin:14:805: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/aldebaran.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h, ...):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:316:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:320:49: sparse: sparse: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
--
   command-line: note: in included file:
   builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
>> builtin:4:347: sparse: sparse: x used with no following hex digits
   builtin:4:355: sparse: sparse: x used with no following hex digits
   builtin:4:363: sparse: sparse: x used with no following hex digits
   builtin:4:371: sparse: sparse: x used with no following hex digits
   builtin:4:379: sparse: sparse: x used with no following hex digits
   builtin:4:387: sparse: sparse: x used with no following hex digits
   builtin:5:0: sparse: sparse: missing terminating " character
   builtin:6:805: sparse: sparse: no newline at end of file
   builtin:6:805: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
