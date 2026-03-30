Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85A5387352
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774855587; cv=none; b=QVdF7ANYsj7/TgKRchoYFF8mMNdZlK74A+MZOdJEWZEcsJBBvmidS4TZ0945rGy6F7el9441QMUqoT9/Es5xh1bSIMAzZvD4d4BxvJ6Lzp/Z1Q/M93lIrqeTkFMr9+mz9wQMqVknca0YZHh7qo47pYiUlap0z+vaEArw9LJVO/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774855587; c=relaxed/simple;
	bh=uPuVKS2OXX+q00c4sW8oC+3TUkwmW0sfmLXkFChZG68=;
	h=Date:From:To:Subject:Message-ID; b=uH4h5ls8V4In+KcJlfArgnfP+Ye3kvmCQAHNWEI5R6bTBEYmCi1km/K96/sPgbJSn2fpa7r7QWp8jkLdvrFbuz0pCqHkotWH8npeTt5tsoaVRUinfz34MTXm6wql/gbYDHYv7NNY++XFlGMwEddM0MtxchaWJsX/fCwGMqVuHGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdHOqDbK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdHOqDbK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774855587; x=1806391587;
  h=date:from:to:subject:message-id;
  bh=uPuVKS2OXX+q00c4sW8oC+3TUkwmW0sfmLXkFChZG68=;
  b=cdHOqDbKEMGjVwu+OGFiTCSD9hFutmNgX8uptSST5UGWmo6Ngx5m8W56
   PAfz/xqoeiVJo+Xxjbp6smPGf3dF7lwoFlLhwqMrKKeGEhOi1esnFCpza
   H0FS3uGWWPqY2jvDvIHvOpTR5f2G6Z+EI1XFQ/0EGYnjCZo4GEw1iDWqH
   kBC80OM448ZDLUhCoR9QEI3YCscRw1xYsh2oUBKRpe27eoAdHQYG3qRFq
   lubrgk6ABXajd11cc58IBzZrfxqUGI4oV15lpLti1U9uZnyZGYiaXlCzA
   Bdnyfb5H2MCZWbVCDXC9NAH6QevxAOC5x6KewP+Az7I3tUC7/XMYgum5t
   w==;
X-CSE-ConnectionGUID: BuoyZUcbSXOpu7Y0ulprwg==
X-CSE-MsgGUID: gY9e9d85Roi7IRiOdfIHmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75551344"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="75551344"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 00:26:26 -0700
X-CSE-ConnectionGUID: H7PzB8WJQgi9dqtbQG/Waw==
X-CSE-MsgGUID: R3EcPuD6Sg+FvkWgxEVjEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="221102995"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 30 Mar 2026 00:26:25 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w770x-0000000084P-1JJ9
	for oe-kbuild@lists.linux.dev;
	Mon, 30 Mar 2026 07:26:23 +0000
Date: Mon, 30 Mar 2026 09:25:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tip:x86/platform 1/1] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'very'
Message-ID: <202603300958.HxE6lQh8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/platform
head:   7d246d15b140cf99eb7cc89b8cca9ef9e3a85660
commit: 7d246d15b140cf99eb7cc89b8cca9ef9e3a85660 [1/1] x86/cpu: Remove M486/M486SX/ELAN support
:::::: branch date: 31 minutes ago
:::::: commit date: 31 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260330/202603300958.HxE6lQh8-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'very'
#7: 
facilities on x86-32 to support ancient 32-bit CPUs that very very few

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
