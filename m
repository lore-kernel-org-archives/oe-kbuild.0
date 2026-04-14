Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B820846B5
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Apr 2026 20:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776197828; cv=none; b=DUgHjlF78tPOQwvm2M/aGq7F2FctmOkb4/sC0hq8lT7rECPBPIwrOwbHXMjbejqFXVSR6FQpwdNjh1c69wuCQLOyI90IwU83VMdpeZaDTQ6ILZJ3CTg4tSAZVjkGWp4EHG6HDv5AR/Y4YNlCDSQmSssSExfaEFissOs4n6dCohU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776197828; c=relaxed/simple;
	bh=jxU0RwnHXZ4G/pXmzw4ZYntS+1ZZb5POaWo7ihujxfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UJWlWh/xPITEoDJLMaIm3uCUpxUCmBxUqofMXacJwRBSDS9sbchXsUDl9ldnuIEA4EZ69XX94Vp7Lc1w+HPyU7fNvIhy10Xp3dXCtGXnADRjWeRmOv0vG7ufFWZc4PuUHinIoiNLCQ0gLR8HY3fsmGj162EMR4TNDzmXA74wJ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayihNh7i; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayihNh7i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776197827; x=1807733827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jxU0RwnHXZ4G/pXmzw4ZYntS+1ZZb5POaWo7ihujxfQ=;
  b=ayihNh7ij1sdgIMz4jcVrqGO1aR9W8UQBow9oNY+EqRXX6lFNE5cbPwO
   STfCagXny01bGvMrBasvoS1fb0jYn9BonQfz3mY0N8UkoyYvpEwORR0vF
   D2ifoZ79DBDicYQm6xBFG/pdtIjcswvXjr8IuG7zhysuPER1/JCBohd08
   1C92sW/4/TfL35zDcvORe2frC2koEl2JYq+M57gJqajgw18sxxobfJmjF
   N8k1GLiFOp3RwPdVuXsVgX049rgm1dDrMjcmu3p4pgevX77quBIqEd35v
   OPVL/1bLqrVMLK2fJOzQ97436V7uUOCGxpzirel7YOXiBRFm7ZyL1S7He
   g==;
X-CSE-ConnectionGUID: gwCUzydcR0KTVwVf2/Z1MQ==
X-CSE-MsgGUID: y93pJxR4TZ2792fUiR9wpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="94568022"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="94568022"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 13:17:07 -0700
X-CSE-ConnectionGUID: BieMGeQPQeSWyVdDyzSKEw==
X-CSE-MsgGUID: /yOd8ADmTQmJb8gVvQwghA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253594337"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 14 Apr 2026 13:17:05 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCkBz-000000000U5-1ccP;
	Tue, 14 Apr 2026 20:17:03 +0000
Date: Tue, 14 Apr 2026 22:16:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] crash: Support high memory reservation for range syntax
Message-ID: <202604142220.dKz92tzW-lkp@intel.com>
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
In-Reply-To: <20260404074103.506793-1-youling.tang@linux.dev>
References: <20260404074103.506793-1-youling.tang@linux.dev>
TO: Youling Tang <youling.tang@linux.dev>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Baoquan He <bhe@redhat.com>
TO: Jonathan Corbet <corbet@lwn.net>
CC: Vivek Goyal <vgoyal@redhat.com>
CC: Dave Young <dyoung@redhat.com>
CC: kexec@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: youling.tang@linux.dev
CC: Youling Tang <tangyouling@kylinos.cn>

Hi Youling,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v7.0 next-20260414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Youling-Tang/crash-Support-high-memory-reservation-for-range-syntax/20260414-205035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260404074103.506793-1-youling.tang%40linux.dev
patch subject: [PATCH] crash: Support high memory reservation for range syntax
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260414/202604142220.dKz92tzW-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604142220.dKz92tzW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604142220.dKz92tzW-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/crash_reserve.c: In function '__parse_crashkernel':
>> kernel/crash_reserve.c:324:37: error: 'DEFAULT_CRASH_KERNEL_LOW_SIZE' undeclared (first use in this function)
     324 |                         *low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/crash_reserve.c:324:37: note: each undeclared identifier is reported only once for each function it appears in


vim +/DEFAULT_CRASH_KERNEL_LOW_SIZE +324 kernel/crash_reserve.c

b83e6224c4967a Youling Tang 2026-04-04  282  
85fcde402db191 Baoquan He   2024-01-24  283  static int __init __parse_crashkernel(char *cmdline,
85fcde402db191 Baoquan He   2024-01-24  284  			     unsigned long long system_ram,
85fcde402db191 Baoquan He   2024-01-24  285  			     unsigned long long *crash_size,
85fcde402db191 Baoquan He   2024-01-24  286  			     unsigned long long *crash_base,
b83e6224c4967a Youling Tang 2026-04-04  287  			     const char *suffix,
b83e6224c4967a Youling Tang 2026-04-04  288  			     bool *high,
b83e6224c4967a Youling Tang 2026-04-04  289  			     unsigned long long *low_size)
85fcde402db191 Baoquan He   2024-01-24  290  {
85fcde402db191 Baoquan He   2024-01-24  291  	char *first_colon, *first_space;
85fcde402db191 Baoquan He   2024-01-24  292  	char *ck_cmdline;
85fcde402db191 Baoquan He   2024-01-24  293  	char *name = "crashkernel=";
b83e6224c4967a Youling Tang 2026-04-04  294  	unsigned long long boundary = 0;
b83e6224c4967a Youling Tang 2026-04-04  295  	int ret;
85fcde402db191 Baoquan He   2024-01-24  296  
85fcde402db191 Baoquan He   2024-01-24  297  	BUG_ON(!crash_size || !crash_base);
85fcde402db191 Baoquan He   2024-01-24  298  	*crash_size = 0;
85fcde402db191 Baoquan He   2024-01-24  299  	*crash_base = 0;
85fcde402db191 Baoquan He   2024-01-24  300  
85fcde402db191 Baoquan He   2024-01-24  301  	ck_cmdline = get_last_crashkernel(cmdline, name, suffix);
85fcde402db191 Baoquan He   2024-01-24  302  	if (!ck_cmdline)
85fcde402db191 Baoquan He   2024-01-24  303  		return -ENOENT;
85fcde402db191 Baoquan He   2024-01-24  304  
85fcde402db191 Baoquan He   2024-01-24  305  	ck_cmdline += strlen(name);
85fcde402db191 Baoquan He   2024-01-24  306  
85fcde402db191 Baoquan He   2024-01-24  307  	if (suffix)
85fcde402db191 Baoquan He   2024-01-24  308  		return parse_crashkernel_suffix(ck_cmdline, crash_size,
85fcde402db191 Baoquan He   2024-01-24  309  				suffix);
85fcde402db191 Baoquan He   2024-01-24  310  	/*
85fcde402db191 Baoquan He   2024-01-24  311  	 * if the commandline contains a ':', then that's the extended
85fcde402db191 Baoquan He   2024-01-24  312  	 * syntax -- if not, it must be the classic syntax
85fcde402db191 Baoquan He   2024-01-24  313  	 */
85fcde402db191 Baoquan He   2024-01-24  314  	first_colon = strchr(ck_cmdline, ':');
85fcde402db191 Baoquan He   2024-01-24  315  	first_space = strchr(ck_cmdline, ' ');
b83e6224c4967a Youling Tang 2026-04-04  316  	if (first_colon && (!first_space || first_colon < first_space)) {
b83e6224c4967a Youling Tang 2026-04-04  317  		ret = parse_crashkernel_mem(ck_cmdline, system_ram,
85fcde402db191 Baoquan He   2024-01-24  318  				crash_size, crash_base);
85fcde402db191 Baoquan He   2024-01-24  319  
b83e6224c4967a Youling Tang 2026-04-04  320  		/* Handle optional ',>boundary' condition for range ':' syntax only. */
b83e6224c4967a Youling Tang 2026-04-04  321  		parse_crashkernel_boundary(ck_cmdline, &boundary);
b83e6224c4967a Youling Tang 2026-04-04  322  		if (!ret && *crash_size > boundary) {
b83e6224c4967a Youling Tang 2026-04-04  323  			*high = true;
b83e6224c4967a Youling Tang 2026-04-04 @324  			*low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
b83e6224c4967a Youling Tang 2026-04-04  325  		}
b83e6224c4967a Youling Tang 2026-04-04  326  
b83e6224c4967a Youling Tang 2026-04-04  327  		return ret;
b83e6224c4967a Youling Tang 2026-04-04  328  	}
b83e6224c4967a Youling Tang 2026-04-04  329  
85fcde402db191 Baoquan He   2024-01-24  330  	return parse_crashkernel_simple(ck_cmdline, crash_size, crash_base);
85fcde402db191 Baoquan He   2024-01-24  331  }
85fcde402db191 Baoquan He   2024-01-24  332  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
