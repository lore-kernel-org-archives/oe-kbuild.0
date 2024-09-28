Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3934C19DF9C
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Sep 2024 08:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727511908; cv=none; b=FiSHbEP3Fjpve0ZzlpgfdCLrsamGfBh/es+g8oO8UseaNiGfG3/h+E8f27SzrJoaX/N/lpldCw/7cMIRB8H2uYJSJo3HxSg7zCzbSETFqAaLLpIcn/cnDcr4KSWDscPhf/4Nx5j/19XQj8Hry4idWT6WmEHp4AlJTGYyhugPBnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727511908; c=relaxed/simple;
	bh=hVgG1UO0VDxxXXAm0tJWlmf9YTH4YExl9fyP9jjHdrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ekuXhmukPTXEXn/99VsBZKOn7UwrxVl7vnBXCGnm6yPK8iINw0qrzQVefCboeKsGwvYIUDPn+IuYukSRLGkuvOPugMSf7004F16K5pe0l40glkIhXF24H6pZVkZnvkyoycl/EoBtANL109Qp+LH1zDdu3/eCoApez+XiPqlUWdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRnL9sIX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRnL9sIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727511906; x=1759047906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hVgG1UO0VDxxXXAm0tJWlmf9YTH4YExl9fyP9jjHdrc=;
  b=hRnL9sIXzJodXIPSwK/h5CU5Sq3CPmlOZ1vYlgV6fgW3Q5Hf2ocusXp6
   M4OZoMjXtId9Vvk/I06SLA3+IwMTPdUEmRdt+ST9moVjEVJafS1tNE5f/
   t1+lK0WvxJx9wf0qAMhmUKW0Z+DlbWyYAPmMUDMlFmbbC20MyS/UgFxyc
   /Rm0xApB7nyB4nuoe6lCwsemV/9hJy5jR9tYiAdwxOxOWGEicWHVjuYVo
   MAeGvP76euhVOfjJuMIgxP7LnxlZcXcKt9PHhJW00IUURFqj6ziL6TAxr
   eDewMG8ONO7yUNNatbTU43dbr/+2B0p0EvBYfCofnXuSA5+wK1mPjIlKs
   w==;
X-CSE-ConnectionGUID: CVLGmyJkSX+YgAVjr07l1A==
X-CSE-MsgGUID: NBpUlubuQUK5nD8VBo8YzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="49180605"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="49180605"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 01:25:05 -0700
X-CSE-ConnectionGUID: PeU2MSI9S+KcXlQvGvYRog==
X-CSE-MsgGUID: +mFkdVO5QvaUb+tcBuXsbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77152206"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Sep 2024 01:25:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suSlC-000N25-0H;
	Sat, 28 Sep 2024 08:25:02 +0000
Date: Sat, 28 Sep 2024 16:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/4] kcsan, debugfs: refactor
 set_report_filterlist_whitelist() to return a value
Message-ID: <202409281520.LZsRSFFR-lkp@intel.com>
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
In-Reply-To: <20240925143154.2322926-3-ranxiaokai627@163.com>
References: <20240925143154.2322926-3-ranxiaokai627@163.com>
TO: ran xiaokai <ranxiaokai627@163.com>
TO: elver@google.com
TO: tglx@linutronix.de
TO: dvyukov@google.com
CC: kasan-dev@googlegroups.com
CC: linux-kernel@vger.kernel.org
CC: Ran Xiaokai <ran.xiaokai@zte.com.cn>

Hi ran,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20240927]
[cannot apply to v6.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ran-xiaokai/kcsan-debugfs-Remove-redundant-call-of-kallsyms_lookup_name/20240925-231034
base:   linus/master
patch link:    https://lore.kernel.org/r/20240925143154.2322926-3-ranxiaokai627%40163.com
patch subject: [PATCH 2/4] kcsan, debugfs: refactor set_report_filterlist_whitelist() to return a value
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc-randconfig-r072-20240927 (https://download.01.org/0day-ci/archive/20240928/202409281520.LZsRSFFR-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409281520.LZsRSFFR-lkp@intel.com/

smatch warnings:
kernel/kcsan/debugfs.c:256 debugfs_write() error: uninitialized symbol 'ret'.

vim +/ret +256 kernel/kcsan/debugfs.c

dfd402a4c4baae Marco Elver   2019-11-14  222  
5cbaefe9743bf1 Ingo Molnar   2019-11-20  223  static ssize_t
5cbaefe9743bf1 Ingo Molnar   2019-11-20  224  debugfs_write(struct file *file, const char __user *buf, size_t count, loff_t *off)
dfd402a4c4baae Marco Elver   2019-11-14  225  {
dfd402a4c4baae Marco Elver   2019-11-14  226  	char kbuf[KSYM_NAME_LEN];
dfd402a4c4baae Marco Elver   2019-11-14  227  	char *arg;
43d631bf06ec96 Thorsten Blum 2024-06-24  228  	const size_t read_len = min(count, sizeof(kbuf) - 1);
52313281c8b7ca Ran Xiaokai   2024-09-25  229  	ssize_t ret;
dfd402a4c4baae Marco Elver   2019-11-14  230  
dfd402a4c4baae Marco Elver   2019-11-14  231  	if (copy_from_user(kbuf, buf, read_len))
dfd402a4c4baae Marco Elver   2019-11-14  232  		return -EFAULT;
dfd402a4c4baae Marco Elver   2019-11-14  233  	kbuf[read_len] = '\0';
dfd402a4c4baae Marco Elver   2019-11-14  234  	arg = strstrip(kbuf);
dfd402a4c4baae Marco Elver   2019-11-14  235  
dfd402a4c4baae Marco Elver   2019-11-14  236  	if (!strcmp(arg, "on")) {
dfd402a4c4baae Marco Elver   2019-11-14  237  		WRITE_ONCE(kcsan_enabled, true);
dfd402a4c4baae Marco Elver   2019-11-14  238  	} else if (!strcmp(arg, "off")) {
dfd402a4c4baae Marco Elver   2019-11-14  239  		WRITE_ONCE(kcsan_enabled, false);
a4e74fa5f0d3e2 Marco Elver   2020-07-31  240  	} else if (str_has_prefix(arg, "microbench=")) {
dfd402a4c4baae Marco Elver   2019-11-14  241  		unsigned long iters;
dfd402a4c4baae Marco Elver   2019-11-14  242  
a4e74fa5f0d3e2 Marco Elver   2020-07-31  243  		if (kstrtoul(&arg[strlen("microbench=")], 0, &iters))
dfd402a4c4baae Marco Elver   2019-11-14  244  			return -EINVAL;
dfd402a4c4baae Marco Elver   2019-11-14  245  		microbenchmark(iters);
dfd402a4c4baae Marco Elver   2019-11-14  246  	} else if (!strcmp(arg, "whitelist")) {
52313281c8b7ca Ran Xiaokai   2024-09-25  247  		ret = set_report_filterlist_whitelist(true);
dfd402a4c4baae Marco Elver   2019-11-14  248  	} else if (!strcmp(arg, "blacklist")) {
52313281c8b7ca Ran Xiaokai   2024-09-25  249  		ret = set_report_filterlist_whitelist(false);
dfd402a4c4baae Marco Elver   2019-11-14  250  	} else if (arg[0] == '!') {
52313281c8b7ca Ran Xiaokai   2024-09-25  251  		ret = insert_report_filterlist(&arg[1]);
dfd402a4c4baae Marco Elver   2019-11-14  252  	} else {
dfd402a4c4baae Marco Elver   2019-11-14  253  		return -EINVAL;
dfd402a4c4baae Marco Elver   2019-11-14  254  	}
dfd402a4c4baae Marco Elver   2019-11-14  255  
52313281c8b7ca Ran Xiaokai   2024-09-25 @256  	if (ret < 0)
52313281c8b7ca Ran Xiaokai   2024-09-25  257  		return ret;
52313281c8b7ca Ran Xiaokai   2024-09-25  258  	else
dfd402a4c4baae Marco Elver   2019-11-14  259  		return count;
dfd402a4c4baae Marco Elver   2019-11-14  260  }
dfd402a4c4baae Marco Elver   2019-11-14  261  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
