Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D456D42AA3
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Aug 2024 02:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723776172; cv=none; b=knEJnGHiz2LRZGyNCh2SE+9VH18sd7BFTtLPDzCSk+1XrX0gPe9Aje0ZBNfVJAtgcCyUVDVdSq6wZ6JX0O0ycOoOyCRCudx4OkBzj7ll3NqhnvDBQj/54DT9z3r5kywKiqeOTeObD8S2sPoMDZtWuP0YFqar9XiOyr6vDg/BM8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723776172; c=relaxed/simple;
	bh=A5tG/QPpJNMd0Z3NTEY/3TQXeRO3GpKaqoSTjN1VAr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RYab5X3LazuGM8ahafQaLQyDcxUXLiyMPiccMJRcXg+/d8p1gTwkYt+6vLZ3Wg5LCaYFOx20b9U6oMaFE2inZ1okMozUUCJzqOqhSt2QwgGgKoO4mLy25StbQoqykpPYoAJxYVo+HRQemA+q1kBJ+FMwG5pwH2W0UH/2QCc3IAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3swQvAx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3swQvAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723776171; x=1755312171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A5tG/QPpJNMd0Z3NTEY/3TQXeRO3GpKaqoSTjN1VAr4=;
  b=f3swQvAxh9nJY7R6Z7uUFNCZgaVTpDvMEasI5ErKV2bgbSddW6beyKBb
   5YlYHeNtqO3yfYVqMbXY67a+Vt+dcSMg6lofsetRGCEro814NysJBeQGZ
   de8GeK+UpKd0e9osiAsyxjgv3anfgzbnvd+ZZbF24UH1vy6Qxxxk0TD5r
   tvioWzeCWBpc/9ZFYp2xBl/fivXL/dpWeKkREuM+yccih8uaX1v1zcF/z
   hnhu7E6UGzz1Xobgk83+KaS7BzJPNGzYEUsMQ4ynFJHVWw8OakJl8uw+0
   iPkq/uG0ZEdUJmIktpfTztWj3TjZrGTPHooMK3C6FgPjb1e2KLToP/uNf
   g==;
X-CSE-ConnectionGUID: /DSJtthST6Sjo0JooXqKnQ==
X-CSE-MsgGUID: 6Gj3xwvdTUeUJvlu58BOIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22207303"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="22207303"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 19:42:39 -0700
X-CSE-ConnectionGUID: 1lEsPSqaROSpwPpTycdWPw==
X-CSE-MsgGUID: FUqdnkEPRg+XOtwRUaFfUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="64487947"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Aug 2024 19:42:37 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1semvD-0005um-1p;
	Fri, 16 Aug 2024 02:42:35 +0000
Date: Fri, 16 Aug 2024 10:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/4] thunderbolt: Improve software receiver lane margining
Message-ID: <202408161041.jjzazHm4-lkp@intel.com>
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
In-Reply-To: <20240813110135.2178900-5-mika.westerberg@linux.intel.com>
References: <20240813110135.2178900-5-mika.westerberg@linux.intel.com>
TO: Mika Westerberg <mika.westerberg@linux.intel.com>
TO: Yehezkel Bernat <YehezkelShB@gmail.com>
TO: Michael Jamet <michael.jamet@intel.com>
TO: Lukas Wunner <lukas@wunner.de>
TO: Andreas Noever <andreas.noever@gmail.com>
CC: linux-usb@vger.kernel.org
CC: Aapo Vienamo <aapo.vienamo@linux.intel.com>
CC: Rene Sapiens <rene.sapiens@intel.com>
CC: R Kannappan <r.kannappan@intel.com>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>

Hi Mika,

kernel test robot noticed the following build warnings:

[auto build test WARNING on westeri-thunderbolt/next]
[also build test WARNING on linus/master v6.11-rc3 next-20240815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mika-Westerberg/thunderbolt-Add-missing-usb4_port_sb_read-to-usb4_port_sw_margin/20240815-001205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20240813110135.2178900-5-mika.westerberg%40linux.intel.com
patch subject: [PATCH 4/4] thunderbolt: Improve software receiver lane margining
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: i386-randconfig-141-20240815 (https://download.01.org/0day-ci/archive/20240816/202408161041.jjzazHm4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408161041.jjzazHm4-lkp@intel.com/

smatch warnings:
drivers/thunderbolt/debugfs.c:1014 margining_run_sw() error: uninitialized symbol 'errors'.

vim +/errors +1014 drivers/thunderbolt/debugfs.c

d0f1e0c2a69909 Mika Westerberg 2022-02-22   985  
c0188291a5471b R Kannappan     2024-08-13   986  static int margining_run_sw(struct tb_margining *margining,
c0188291a5471b R Kannappan     2024-08-13   987  			    struct usb4_port_margining_params *params)
c0188291a5471b R Kannappan     2024-08-13   988  {
c0188291a5471b R Kannappan     2024-08-13   989  	u32 nsamples = margining->dwell_time / DWELL_SAMPLE_INTERVAL;
c0188291a5471b R Kannappan     2024-08-13   990  	u32 errors;
c0188291a5471b R Kannappan     2024-08-13   991  	int ret, i;
c0188291a5471b R Kannappan     2024-08-13   992  
c0188291a5471b R Kannappan     2024-08-13   993  	ret = usb4_port_sw_margin(margining->port, margining->target, margining->index,
c0188291a5471b R Kannappan     2024-08-13   994  				  params, margining->results);
c0188291a5471b R Kannappan     2024-08-13   995  	if (ret)
c0188291a5471b R Kannappan     2024-08-13   996  		goto out_stop;
c0188291a5471b R Kannappan     2024-08-13   997  
c0188291a5471b R Kannappan     2024-08-13   998  	for (i = 0; i <= nsamples; i++) {
c0188291a5471b R Kannappan     2024-08-13   999  		ret = usb4_port_sw_margin_errors(margining->port, margining->target,
c0188291a5471b R Kannappan     2024-08-13  1000  						 margining->index, &margining->results[1]);
c0188291a5471b R Kannappan     2024-08-13  1001  		if (ret)
c0188291a5471b R Kannappan     2024-08-13  1002  			break;
c0188291a5471b R Kannappan     2024-08-13  1003  
c0188291a5471b R Kannappan     2024-08-13  1004  		if (margining->lanes == USB4_MARGIN_SW_LANE_0)
c0188291a5471b R Kannappan     2024-08-13  1005  			errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_0_MASK,
c0188291a5471b R Kannappan     2024-08-13  1006  					   margining->results[1]);
c0188291a5471b R Kannappan     2024-08-13  1007  		else if (margining->lanes == USB4_MARGIN_SW_LANE_1)
c0188291a5471b R Kannappan     2024-08-13  1008  			errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_1_MASK,
c0188291a5471b R Kannappan     2024-08-13  1009  					   margining->results[1]);
c0188291a5471b R Kannappan     2024-08-13  1010  		else if (margining->lanes == USB4_MARGIN_SW_ALL_LANES)
c0188291a5471b R Kannappan     2024-08-13  1011  			errors = margining->results[1];
c0188291a5471b R Kannappan     2024-08-13  1012  
c0188291a5471b R Kannappan     2024-08-13  1013  		/* Any errors stop the test */
c0188291a5471b R Kannappan     2024-08-13 @1014  		if (errors)
c0188291a5471b R Kannappan     2024-08-13  1015  			break;
c0188291a5471b R Kannappan     2024-08-13  1016  
c0188291a5471b R Kannappan     2024-08-13  1017  		fsleep(DWELL_SAMPLE_INTERVAL * USEC_PER_MSEC);
c0188291a5471b R Kannappan     2024-08-13  1018  	}
c0188291a5471b R Kannappan     2024-08-13  1019  
c0188291a5471b R Kannappan     2024-08-13  1020  out_stop:
c0188291a5471b R Kannappan     2024-08-13  1021  	/*
c0188291a5471b R Kannappan     2024-08-13  1022  	 * Stop the counters but don't clear them to allow the
c0188291a5471b R Kannappan     2024-08-13  1023  	 * different error counter configurations.
c0188291a5471b R Kannappan     2024-08-13  1024  	 */
c0188291a5471b R Kannappan     2024-08-13  1025  	margining_modify_error_counter(margining, margining->lanes,
c0188291a5471b R Kannappan     2024-08-13  1026  				       USB4_MARGIN_SW_ERROR_COUNTER_STOP);
c0188291a5471b R Kannappan     2024-08-13  1027  	return ret;
c0188291a5471b R Kannappan     2024-08-13  1028  }
c0188291a5471b R Kannappan     2024-08-13  1029  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
