Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589553F8DF1
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 16:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773332883; cv=none; b=ECOnG68KhROn/zxSdMi1Oth1caMpN4912ssjHM58lljzsNMV8BMNNTnYv/Fz9+gYWXOJthkAK/b/Rc5/dMinGFoaWEENszs9BO7KAxbF9JcGkUhsCmz4+pqIf7EFvPWrD7TX4KPjwBMRx6ypPCJRmFvLHlEvBykUIztVrQ0XHsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773332883; c=relaxed/simple;
	bh=K8wI4RSd9uBRRJBjbTeoxBrMmyOAaXF4xqguzQOOBaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PLXgLO13K9tdvu+V14SGwVsj0y+oQ226kIio8DcaySXJveyqKEDKgQAl3DSLrozmnUUYdWkweBuorM36XLUPW5Sk7CGM0pr9Pku2jg8AwRwteBlo5dnoK/F1vs6ldDzECvAFlMqx1qtk9NXOvLTlHFwLYaFxNGMoo+t7GmjjNsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtIoqXzz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtIoqXzz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773332875; x=1804868875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K8wI4RSd9uBRRJBjbTeoxBrMmyOAaXF4xqguzQOOBaI=;
  b=VtIoqXzzyP+RbPwk1+bOSzT+Zt6yelP6fISuVQPAN41jpiJJH5dhb0TX
   OZzCaiyFIPu9TQQm2JTem5Mmn5lFEhyQ00/XxJ403puhbC0FT2KGq6CGh
   wWxx4Ho+v25rCQDLgxjThsXmDMRuAJoyUJtHP7Tji4T7zciDP/JINhNeq
   +kJWYQUVIZq+97YhrbkzdVeJLVQByo1QWAduy4HtT6DhS+YFZ7Dw0buLU
   1O1b+ZvFK0TpE4HiBdUtZXhcMARhN5VLf3k6raX5IDTXKh1YpCpgIsQOQ
   xXvPE74S/rIMcn5LfMm8khApIOdP4uyoBj+zXuAOh8EnM9xa8RxKLjhlB
   w==;
X-CSE-ConnectionGUID: gs18bhU4QPu5+SMOb13iTA==
X-CSE-MsgGUID: JaLT9mozQVSxZMQY5aCqUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="97043728"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="97043728"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 09:27:54 -0700
X-CSE-ConnectionGUID: y8SKb3KnTqqB+4V8WF537A==
X-CSE-MsgGUID: wrPWEvNrRcqJLharVWdkmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="251376503"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Mar 2026 09:27:53 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0it3-000000002gh-3Sz6;
	Thu, 12 Mar 2026 16:27:49 +0000
Date: Fri, 13 Mar 2026 00:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 20/20] docs: xforms_lists: use CMatch for all
 identifiers
Message-ID: <202603130051.wRdZObXE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <716c6dfa1d5d50c92ca14e9ecbd1ed9ebd07f052.1773297828.git.mchehab+huawei@kernel.org>
References: <716c6dfa1d5d50c92ca14e9ecbd1ed9ebd07f052.1773297828.git.mchehab+huawei@kernel.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Jonathan Corbet <corbet@lwn.net>
TO: Kees Cook <kees@kernel.org>
TO: Linux Doc Mailing List <linux-doc@vger.kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: linux-hardening@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
CC: Randy Dunlap <rdunlap@infradead.org>

Hi Mauro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on next-20260311]
[cannot apply to kees/for-next/pstore kees/for-next/kspp linus/master v7.0-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/docs-python-add-helpers-to-run-unit-tests/20260312-152320
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/716c6dfa1d5d50c92ca14e9ecbd1ed9ebd07f052.1773297828.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH v2 20/20] docs: xforms_lists: use CMatch for all identifiers
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20260313/202603130051.wRdZObXE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130051.wRdZObXE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603130051.wRdZObXE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/clocksource/mmio.c:51 expecting prototype for clocksource_mmio_init(). Prototype was for int() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
