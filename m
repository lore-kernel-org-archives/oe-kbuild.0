Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAC5309EE4
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 04:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764131133; cv=none; b=rowGNsRVpCvdZ3dJoHLum1ekXgAngmozRRWQtEJkuOUeWlWt4Ej255Vm8yWPbCMMfh/fay07qGYzY1Thl9hv13BY6YdbMjj7f7kpgAjcAbuwQZIeTGzUF0DVy39fJlxhlLReIWtrebY5Uny2CrsJZXsyTh20X6bVnigC9Ifs31c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764131133; c=relaxed/simple;
	bh=/dppzt0EgFfpl9jM0yndQYMrtjmF0EHl2D7mt5ILZOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r1E1ozgh30JiItTyQvKLWuQKnUxG80mXeq8laRUiGx+QsJtPt63MzOKDDRIojw/S6RW0l774iuBBO5+7Omh8Uy72ZT8zeKPxLx4CUXQDPCSIRAU984CX9tkj8Db0AICdPEObuaVNkdzs5/9Z2Emffhd+uqvzAt6sGIUKdhMwQTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGDKV6xX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGDKV6xX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764131131; x=1795667131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/dppzt0EgFfpl9jM0yndQYMrtjmF0EHl2D7mt5ILZOI=;
  b=iGDKV6xXIndT5jTbTxQBXxHa4LoPdWk65U1galD6IlSQjtUuKGxTvUtZ
   nHGNEqY+gf+yOA7W4nTRTPhFyJQqn7S4Jr07YDJ8L1GLcVOm13zIJLVjd
   6HN0YdzbMDdudRhr8hpVri4lfMoytY19ifbZd9vbA1QQyLa1nzcQmWZhu
   dh4g57jcsKDovxTlw2Qw1Aff1Q1LuxRpKf29Z+x1Bb7YhyzOvhFUMsw4c
   7UL9QlDWeApUe3NC0LgIf5cyoLxmG8ilOJmkWJ32dvBKltJKH2c3gQswm
   +jOAAaCxlTIAfjsQs91zEAjF5E6z6m2YLuR7FNPbYMFVKmdSYnfm89pIk
   w==;
X-CSE-ConnectionGUID: 6+QT5eR4Th6WUEkL89K6hA==
X-CSE-MsgGUID: BYIpP5xuRf6EEpnTPKA0Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66043606"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="66043606"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 20:25:31 -0800
X-CSE-ConnectionGUID: jjIcmF19RQ+b+8bA1ZS+7g==
X-CSE-MsgGUID: OzicTZgjQMa9wUszjdXbnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="192721559"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Nov 2025 20:25:30 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO75s-000000002U9-01eN;
	Wed, 26 Nov 2025 04:25:28 +0000
Date: Wed, 26 Nov 2025 12:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/5] mm: introduce VM_FAULT_UFFD_MINOR fault reason
Message-ID: <202511261233.RgfmIwhI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251125183840.2368510-4-rppt@kernel.org>
References: <20251125183840.2368510-4-rppt@kernel.org>
TO: Mike Rapoport <rppt@kernel.org>

Hi Mike,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6a23ae0a96a600d1d12557add110e0bb6e32730c]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Rapoport/userfaultfd-move-vma_can_userfault-out-of-line/20251126-024059
base:   6a23ae0a96a600d1d12557add110e0bb6e32730c
patch link:    https://lore.kernel.org/r/20251125183840.2368510-4-rppt%40kernel.org
patch subject: [PATCH v2 3/5] mm: introduce VM_FAULT_UFFD_MINOR fault reason
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251126/202511261233.RgfmIwhI-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511261233.RgfmIwhI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511261233.RgfmIwhI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/trace/define_trace.h:132,
                    from ./include/trace/events/f2fs.h:2407,
                    from fs/f2fs/super.c:41:
   ./include/trace/events/f2fs.h: In function 'trace_raw_output_f2fs_mmap':
>> ./include/trace/stages/stage3_trace_output.h:70:37: error: expected expression before ',' token
      70 |                         { flag_array, { -1, NULL }};                    \
         |                                     ^
   ./include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   ./include/trace/events/f2fs.h:1432:9: note: in expansion of macro 'TP_printk'
    1432 |         TP_printk("dev = (%d,%d), ino = %lu, index = %lu, flags: %s, ret: %s",
         |         ^~~~~~~~~
   ./include/trace/events/f2fs.h:1436:17: note: in expansion of macro '__print_flags'
    1436 |                 __print_flags(__entry->ret, "|", VM_FAULT_RESULT_TRACE))
         |                 ^~~~~~~~~~~~~


vim +70 ./include/trace/stages/stage3_trace_output.h

1bc191051dca28 include/trace/stages/stage3_defines.h Linus Torvalds          2022-03-23  65  
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  66) #undef __print_flags
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  67) #define __print_flags(flag, delim, flag_array...)			\
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  68) 	({								\
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  69) 		static const struct trace_print_flags __flags[] =	\
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03 @70) 			{ flag_array, { -1, NULL }};			\
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  71) 		trace_print_flags_seq(p, delim, flag, __flags);	\
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  72) 	})
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  73) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
