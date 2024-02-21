Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7F069D05
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Feb 2024 15:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708527714; cv=none; b=Y3FJyl2E6J/DRUp4BYEX6xoGvHg9YsvEDj9j+N1E5HNhofGf0UGgd5X55bL25yWmGQHi7wcIzdYMn717V8w54l/sI+kkuU/7xkmzEDU3riL3vH4eeUPazlAZc6rx3yGCQ3JqsKky+No4sJpwKSTNaman7fLzXB/v+Vr4JXiFMfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708527714; c=relaxed/simple;
	bh=EgAKhdjPeOPP+TaE13vtGSS9EkVUb/yWDddbPwWxhBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PAnzHOppIjiTLHxsdlXHaUPiZ0Ux2G9HveExIOmSr3trDX4Up7Z6Tdkm+ZMf1+pmZBjhXu5WCjV2mMcXfUacSN2Lek2LziMNaJCtOeeMMWxqEGmcsdG/VyXTwhNEyG0GBWLT1exvEu2j6lZF0pFAW9FZpoWcPxryipYWGInSEKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2f5/3AR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2f5/3AR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708527713; x=1740063713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EgAKhdjPeOPP+TaE13vtGSS9EkVUb/yWDddbPwWxhBE=;
  b=j2f5/3AR31+dICSK1i6KlDNni3tMwD7NTL1LNROY4vkDL16SW4LOlfTm
   A0iHh5hJ2X1tDqITwKzbqeiwi8lNbNX5rwkbyiYhIs1tFx/NsKJ/BD15P
   5uCgYaWnrvNPHQvJHqynZZbTvZpdaS57plWRiQfDiqtwAqPNOCXWdENjF
   bUOOWBF44AjYvnAhg8jA3zu44DKYDZSVOiPTII7a0OJAXhhn84aZbNquw
   dlY2BSTkYftPrulwol9m/LCEQbvVcdomTtwK2JfxrHUVwAgvP82QX018y
   nog2RJew4ISeTZp9mkHdPJ2zs9CJBMPfVma9JrKKDvAoLC1L/4MmVoW80
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2828592"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2828592"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 07:01:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="936656524"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="936656524"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2024 07:01:51 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rco6W-0005QW-32;
	Wed, 21 Feb 2024 15:01:48 +0000
Date: Wed, 21 Feb 2024 23:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [surenbaghdasaryan:memalloc_prof_v4 14/36] lib/codetag.c:230:6:
 error: redefinition of 'codetag_load_module'
Message-ID: <202402212245.S2F7Wcl7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: lib/codetag.c:230:6: error: redefinition of 'codetag_load_module'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Suren Baghdasaryan <surenb@google.com>
TO: Suren Baghdasaryan <surenb@google.com>
CC: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/surenbaghdasaryan/linux.git memalloc_prof_v4
head:   62d6d360c9fd4bbfabe5aaacba64c4c02e8e6ba2
commit: a955c0c54931160e15915f315d43c9cb8acbb505 [14/36] lib: add allocation tagging support for memory allocation profiling
:::::: branch date: 12 hours ago
:::::: commit date: 3 days ago
config: arm-randconfig-r123-20240221 (https://download.01.org/0day-ci/archive/20240221/202402212245.S2F7Wcl7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240221/202402212245.S2F7Wcl7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402212245.S2F7Wcl7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/codetag.c:230:6: error: redefinition of 'codetag_load_module'
     230 | void codetag_load_module(struct module *mod)
         |      ^~~~~~~~~~~~~~~~~~~
   In file included from lib/codetag.c:2:
   include/linux/codetag.h:76:20: note: previous definition of 'codetag_load_module' with type 'void(struct module *)'
      76 | static inline void codetag_load_module(struct module *mod) {}
         |                    ^~~~~~~~~~~~~~~~~~~
>> lib/codetag.c:243:6: error: redefinition of 'codetag_unload_module'
     243 | bool codetag_unload_module(struct module *mod)
         |      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/codetag.h:77:20: note: previous definition of 'codetag_unload_module' with type 'bool(struct module *)' {aka '_Bool(struct module *)'}
      77 | static inline bool codetag_unload_module(struct module *mod) { return true; }
         |                    ^~~~~~~~~~~~~~~~~~~~~


vim +/codetag_load_module +230 lib/codetag.c

d40a98f6656f63 Suren Baghdasaryan 2022-08-07  229  
d40a98f6656f63 Suren Baghdasaryan 2022-08-07 @230  void codetag_load_module(struct module *mod)
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  231  {
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  232  	struct codetag_type *cttype;
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  233  
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  234  	if (!mod)
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  235  		return;
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  236  
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  237  	mutex_lock(&codetag_lock);
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  238  	list_for_each_entry(cttype, &codetag_types, link)
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  239  		codetag_module_init(cttype, mod);
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  240  	mutex_unlock(&codetag_lock);
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  241  }
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  242  
e1dcad488eb077 Suren Baghdasaryan 2023-03-22 @243  bool codetag_unload_module(struct module *mod)

:::::: The code at line 230 was first introduced by commit
:::::: d40a98f6656f63999ce093dd2349dcdc90efec06 lib: code tagging module support

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Suren Baghdasaryan <surenb@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
