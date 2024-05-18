Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6C9D53B
	for <oe-kbuild@lists.linux.dev>; Sat, 18 May 2024 18:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716057032; cv=none; b=Q9d3oOkaOyVCiv93ayBaOK+Zi5Fty9ZUa0wPep8PJJjqiPpg/mTY7A1wKYD5AerhmRR+8Yt2MoctF5fPosKJ0jXyzyLWyaBpddAZsn91Ui3NgTeFNig5shgbfvPlWUK9H/tHs/j40AmaVa8fH/q+VtF1LgMIWh8R9ZksRp53lQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716057032; c=relaxed/simple;
	bh=F4ZVxCScNLpSUv50cuC1Bn0a8rlAeZ+vVeZYhD3HiZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bWxRnS19PiAuD3cnhZ3kmQkgE3x+Ft079thUbKPqx3vQKwFPN6tXtu+WYL3KwJlQoIme/ziWoXhhSSBp3glkcR8X/UBSW62C90FtGX3kcQFSVeZIQMumhjE9UNVxPYRFS6Wn92AhF+kx8IPoyKMoOSw5zYandoJRn833aVabY2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XH2WJu49; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XH2WJu49"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716057030; x=1747593030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F4ZVxCScNLpSUv50cuC1Bn0a8rlAeZ+vVeZYhD3HiZY=;
  b=XH2WJu49mvhxURbId+vDeJwuasA8VF65VjACbJwec32FfT7fHUzGaF9n
   1sGTPzQQYfyBv5lxks7Rdorgp1RbfpEN/M4gK7sKfG3C8PNBJZmsuHS7C
   17gWl4QAnSpvuNXiK5cCsuFhIy8L8NpXS2CY0QbRNs+6D0+Ld1vrUCejx
   aZFKo8V8EJPiuV9Mw1MQYACgUw0juOvuHyDuEwY4UoJiqenwZCYnUWHoW
   PpKb4xrl/yn4IspMl9OQMKlaeOXKmqiERdejLcnFnVI5wqZLS8JxNafre
   S0KLW4trsVMFcP47svU7QY5+vDxkbyMARMZjoyezYKbRjDJq3S0QvOLe+
   A==;
X-CSE-ConnectionGUID: Sr8O1sr8Q6eOcEEghUKUTg==
X-CSE-MsgGUID: hh3xAYOYSPG4iwmmlVcr+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="11587388"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="11587388"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 11:30:30 -0700
X-CSE-ConnectionGUID: kcAx8BgnR5+24BA3V2DN1Q==
X-CSE-MsgGUID: eW3RSQeeQaebq6l9sxH7DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="32266456"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 May 2024 11:30:29 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8Op8-0002Wq-2F;
	Sat, 18 May 2024 18:30:26 +0000
Date: Sun, 19 May 2024 02:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 6/6] selftests: livepatch: Test livepatching function
 using an external symbol
Message-ID: <202405190214.M93ZmZJb-lkp@intel.com>
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
In-Reply-To: <20240516133009.20224-7-lhruska@suse.cz>
References: <20240516133009.20224-7-lhruska@suse.cz>
TO: Lukas Hruska <lhruska@suse.cz>
TO: pmladek@suse.com
TO: mbenes@suse.cz
TO: jpoimboe@kernel.org
CC: joe.lawrence@redhat.com
CC: live-patching@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-kbuild@vger.kernel.org
CC: mpdesouza@suse.com
CC: lhruska@suse.cz

Hi Lukas,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/fixes]
[also build test ERROR on shuah-kselftest/next shuah-kselftest/fixes linus/master v6.9]
[cannot apply to masahiroy-kbuild/for-next next-20240517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Hruska/livepatch-Add-klp-convert-tool/20240516-223103
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git fixes
patch link:    https://lore.kernel.org/r/20240516133009.20224-7-lhruska%40suse.cz
patch subject: [PATCH v2 6/6] selftests: livepatch: Test livepatching function using an external symbol
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405190214.M93ZmZJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405190214.M93ZmZJb-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "".klp.sym.rela.test_klp_extern_hello.test_klp_extern_hello.hello_msg,0"" [tools/testing/selftests/livepatch/test_modules/test_klp_extern.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
