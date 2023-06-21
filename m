Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050C118C35
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jun 2023 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687367559; x=1718903559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ysgAiBIBlJqpLk/LG9r/MjlJ3RpgdIYq/G2bbmMHew=;
  b=blNzqE4ZskquOrHMUZiiM+g/cqcezzdO2hwrA0Mxy7tURiR2oaTvmvXB
   TXXPAyq7TWv8J9M0IptmYI+uXKvscQ1hHHA26AzkVMiorEmSyR+SgDyJe
   MAhB6YygJTfOOIZGPX1Uq4j4pdhqBayeiXVCWYQ4uuj95pxfLDzu/0cUo
   BGwqgcqcLL1E6fIv2ynA7qq6dA2pUw3f05asqwWZMPcepNr4uCamAdSH/
   31AOWQZBXSVHTGuIBC/1/0QQ88A2mGZnXcM9sThYF6X4Q/ps62oQVaJ7A
   LznzpV3Yln+sYwlxaPrWaaACYH1A6ENdrbXL1msdRZSJQiq0wSFGWhgpG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340589014"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="340589014"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 10:09:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="779908852"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="779908852"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jun 2023 10:09:13 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC1KS-0006yX-2L;
	Wed, 21 Jun 2023 17:09:12 +0000
Date: Thu, 22 Jun 2023 01:08:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/compiler_types.h:82:5: sparse: sparse: undefined
 preprocessor identifier 'CONFIG_FUNCTION_ALIGNMENT'
Message-ID: <202306220043.IHVrU1h8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um arch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e660abd551f1172e428b4e4003de887176a8a1fd
commit: c27cd083cfb9d392f304657ed00fcde1136704e7 Compiler attributes: GCC cold function alignment workarounds
date:   5 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 5 months ago
config: um-randconfig-s053-20230621 (https://download.01.org/0day-ci/archive/20230622/202306220043.IHVrU1h8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220043.IHVrU1h8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306220043.IHVrU1h8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/um/kernel/config.c: note: in included file (through include/linux/compiler_types.h, arch/um/include/shared/init.h):
   include/linux/compiler_attributes.h:55:9: sparse: sparse: preprocessor token __always_inline redefined
   arch/um/kernel/config.c: note: in included file (through /usr/include/features.h, /usr/include/sys/types.h, arch/um/include/shared/user.h, builtin):
   /usr/include/sys/cdefs.h:424:10: sparse: this was the original definition
   arch/um/kernel/config.c: note: in included file (through arch/um/include/shared/init.h):
>> include/linux/compiler_types.h:82:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_FUNCTION_ALIGNMENT'
--
   arch/um/drivers/fd.c: note: in included file (through include/linux/compiler_types.h, arch/um/include/shared/init.h, arch/um/drivers/chan_user.h):
   include/linux/compiler_attributes.h:55:9: sparse: sparse: preprocessor token __always_inline redefined
   arch/um/drivers/fd.c: note: in included file (through /usr/include/features.h, /usr/include/sys/types.h, arch/um/include/shared/user.h, builtin):
   /usr/include/sys/cdefs.h:424:10: sparse: this was the original definition
   arch/um/drivers/fd.c: note: in included file (through arch/um/include/shared/init.h, arch/um/drivers/chan_user.h):
>> include/linux/compiler_types.h:82:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_FUNCTION_ALIGNMENT'
--
   arch/um/drivers/chan_user.c: note: in included file (through include/linux/compiler_types.h, arch/um/include/shared/init.h, arch/um/drivers/chan_user.h):
   include/linux/compiler_attributes.h:55:9: sparse: sparse: preprocessor token __always_inline redefined
   arch/um/drivers/chan_user.c: note: in included file (through /usr/include/features.h, /usr/include/sys/types.h, arch/um/include/shared/user.h, builtin):
   /usr/include/sys/cdefs.h:424:10: sparse: this was the original definition
   arch/um/drivers/chan_user.c: note: in included file (through arch/um/include/shared/init.h, arch/um/drivers/chan_user.h):
>> include/linux/compiler_types.h:82:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_FUNCTION_ALIGNMENT'
--
   arch/um/drivers/port_user.c: note: in included file (through include/linux/compiler_types.h, arch/um/include/shared/init.h, arch/um/drivers/chan_user.h):
   include/linux/compiler_attributes.h:55:9: sparse: sparse: preprocessor token __always_inline redefined
   arch/um/drivers/port_user.c: note: in included file (through /usr/include/features.h, /usr/include/sys/types.h, arch/um/include/shared/user.h, builtin):
   /usr/include/sys/cdefs.h:424:10: sparse: this was the original definition
   arch/um/drivers/port_user.c: note: in included file (through arch/um/include/shared/init.h, arch/um/drivers/chan_user.h):
>> include/linux/compiler_types.h:82:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_FUNCTION_ALIGNMENT'
   arch/um/drivers/port_user.c:179:32: sparse: sparse: Using plain integer as NULL pointer
--
   arch/um/os-Linux/main.c: note: in included file (through include/linux/compiler_types.h, arch/um/include/shared/init.h):
   include/linux/compiler_attributes.h:55:9: sparse: sparse: preprocessor token __always_inline redefined
   arch/um/os-Linux/main.c: note: in included file (through /usr/include/features.h, /usr/include/sys/types.h, arch/um/include/shared/user.h, builtin):
   /usr/include/sys/cdefs.h:424:10: sparse: this was the original definition
   arch/um/os-Linux/main.c: note: in included file (through arch/um/include/shared/init.h):
>> include/linux/compiler_types.h:82:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_FUNCTION_ALIGNMENT'
   arch/um/os-Linux/main.c:187:6: sparse: sparse: symbol '__wrap_malloc' was not declared. Should it be static?
   arch/um/os-Linux/main.c:208:6: sparse: sparse: symbol '__wrap_calloc' was not declared. Should it be static?
   arch/um/os-Linux/main.c:222:6: sparse: sparse: symbol '__wrap_free' was not declared. Should it be static?
--
   arch/um/os-Linux/mem.c: note: in included file (through include/linux/compiler_types.h, arch/um/include/shared/init.h):
   include/linux/compiler_attributes.h:55:9: sparse: sparse: preprocessor token __always_inline redefined
   arch/um/os-Linux/mem.c: note: in included file (through /usr/include/features.h, /usr/include/sys/types.h, arch/um/include/shared/user.h, builtin):
   /usr/include/sys/cdefs.h:424:10: sparse: this was the original definition
   arch/um/os-Linux/mem.c: note: in included file (through arch/um/include/shared/init.h):
>> include/linux/compiler_types.h:82:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_FUNCTION_ALIGNMENT'
--
   arch/um/os-Linux/process.c: note: in included file (through include/linux/compiler_types.h, arch/um/include/shared/init.h):
   include/linux/compiler_attributes.h:55:9: sparse: sparse: preprocessor token __always_inline redefined
   arch/um/os-Linux/process.c: note: in included file (through /usr/include/features.h, /usr/include/sys/types.h, arch/um/include/shared/user.h, builtin):
   /usr/include/sys/cdefs.h:424:10: sparse: this was the original definition
   arch/um/os-Linux/process.c: note: in included file (through arch/um/include/shared/init.h):
>> include/linux/compiler_types.h:82:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_FUNCTION_ALIGNMENT'
--
   arch/um/os-Linux/sigio.c: note: in included file (through include/linux/compiler_types.h, arch/um/include/shared/init.h):
   include/linux/compiler_attributes.h:55:9: sparse: sparse: preprocessor token __always_inline redefined
   arch/um/os-Linux/sigio.c: note: in included file (through /usr/include/features.h, /usr/include/sys/types.h, arch/um/include/shared/user.h, builtin):
   /usr/include/sys/cdefs.h:424:10: sparse: this was the original definition
   arch/um/os-Linux/sigio.c: note: in included file (through arch/um/include/shared/init.h):
>> include/linux/compiler_types.h:82:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_FUNCTION_ALIGNMENT'
--
   arch/um/os-Linux/start_up.c: note: in included file (through include/linux/compiler_types.h, arch/um/include/shared/init.h):
   include/linux/compiler_attributes.h:55:9: sparse: sparse: preprocessor token __always_inline redefined
   arch/um/os-Linux/start_up.c: note: in included file (through /usr/include/features.h, /usr/include/sys/types.h, arch/um/include/shared/user.h, builtin):
   /usr/include/sys/cdefs.h:424:10: sparse: this was the original definition
   arch/um/os-Linux/start_up.c: note: in included file (through arch/um/include/shared/init.h):
>> include/linux/compiler_types.h:82:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_FUNCTION_ALIGNMENT'
--
   arch/um/os-Linux/umid.c: note: in included file (through include/linux/compiler_types.h, arch/um/include/shared/init.h):
   include/linux/compiler_attributes.h:55:9: sparse: sparse: preprocessor token __always_inline redefined
   arch/um/os-Linux/umid.c: note: in included file (through /usr/include/features.h, /usr/include/sys/types.h, arch/um/include/shared/user.h, builtin):
   /usr/include/sys/cdefs.h:424:10: sparse: this was the original definition
   arch/um/os-Linux/umid.c: note: in included file (through arch/um/include/shared/init.h):
>> include/linux/compiler_types.h:82:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_FUNCTION_ALIGNMENT'
--
   arch/um/os-Linux/util.c: note: in included file (through include/linux/compiler_types.h, arch/um/include/shared/init.h):
   include/linux/compiler_attributes.h:55:9: sparse: sparse: preprocessor token __always_inline redefined
   arch/um/os-Linux/util.c: note: in included file (through /usr/include/features.h, /usr/include/sys/types.h, arch/um/include/shared/user.h, builtin):
   /usr/include/sys/cdefs.h:424:10: sparse: this was the original definition
   arch/um/os-Linux/util.c: note: in included file (through arch/um/include/shared/init.h):
>> include/linux/compiler_types.h:82:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_FUNCTION_ALIGNMENT'
   arch/um/os-Linux/util.c:93:48: sparse: sparse: Using plain integer as NULL pointer
--
   arch/um/os-Linux/skas/mem.c: note: in included file (through include/linux/compiler_types.h, arch/um/include/shared/init.h):
   include/linux/compiler_attributes.h:55:9: sparse: sparse: preprocessor token __always_inline redefined
   arch/um/os-Linux/skas/mem.c: note: in included file (through /usr/include/features.h, /usr/include/sys/types.h, arch/um/include/shared/user.h, builtin):
   /usr/include/sys/cdefs.h:424:10: sparse: this was the original definition
   arch/um/os-Linux/skas/mem.c: note: in included file (through arch/um/include/shared/init.h):
>> include/linux/compiler_types.h:82:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_FUNCTION_ALIGNMENT'
--
   arch/um/os-Linux/skas/process.c: note: in included file (through include/linux/compiler_types.h, arch/um/include/shared/init.h):
   include/linux/compiler_attributes.h:55:9: sparse: sparse: preprocessor token __always_inline redefined
   arch/um/os-Linux/skas/process.c: note: in included file (through /usr/include/features.h, /usr/include/sys/types.h, arch/um/include/shared/user.h, builtin):
   /usr/include/sys/cdefs.h:424:10: sparse: this was the original definition
   arch/um/os-Linux/skas/process.c: note: in included file (through arch/um/include/shared/init.h):
>> include/linux/compiler_types.h:82:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_FUNCTION_ALIGNMENT'
   arch/um/os-Linux/skas/process.c:300:5: sparse: sparse: symbol 'kill_userspace_mm' was not declared. Should it be static?

vim +/CONFIG_FUNCTION_ALIGNMENT +82 include/linux/compiler_types.h

a3f8a30f3f0079 Miguel Ojeda 2018-08-30  81  
c27cd083cfb9d3 Mark Rutland 2023-01-23 @82  #if CONFIG_FUNCTION_ALIGNMENT > 0
c27cd083cfb9d3 Mark Rutland 2023-01-23  83  #define __function_aligned		__aligned(CONFIG_FUNCTION_ALIGNMENT)
c27cd083cfb9d3 Mark Rutland 2023-01-23  84  #else
c27cd083cfb9d3 Mark Rutland 2023-01-23  85  #define __function_aligned
c27cd083cfb9d3 Mark Rutland 2023-01-23  86  #endif
c27cd083cfb9d3 Mark Rutland 2023-01-23  87  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
