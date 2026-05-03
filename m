Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457BD23D7F0
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 03:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777778041; cv=none; b=hQldwToU814MrpsXpXTUPv1nzi3hSV7j+0loVbl/L+bEn7EWVApfRD7OwHz/Tk52q3mTH2rxaBaaMHeOfpiZ3aTfgzgzs8J9Vo4uWbUZKykAtciWzRI2NA/HLNocWsOZzUw7OIHl+sZkrEPgsEMP4BzOBJfRrZDu9mPRX+WZRyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777778041; c=relaxed/simple;
	bh=WclNz4tE7p5cKkNof9OtgOoWv89uPCttmytN5hHhaXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gCIGZpOs8bbS2LfBfgWzppPIr/2CE9VTUZMUMlYvBlR4xKmZ21zTlTUpas9BBXHnN7UvEb3pQRNghokBwMNAEHdzA9DBhb0dkZkzhsQVDa+zk+cLyQV+TiTTKVgytQqg+o0hNnEcREDlzRqIpKI5SARxqO4YfLfsxkIadURrIgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zfehvqc5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zfehvqc5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777778038; x=1809314038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WclNz4tE7p5cKkNof9OtgOoWv89uPCttmytN5hHhaXk=;
  b=Zfehvqc5QwHY68m7qiNbEVkS+3Nq9A69iDifuE4+bpqNDMwa7HNCcjmr
   Y/aM4IEZplvOCyLkwIy0/TbiuKMR4n0khXVy+mvH4WSFmHGlUlqallvNI
   c437VpOG9V+0QCT+EkC9ggMt5ifyGidcq5bXBIrsBJNoYW/cqGV95IVY5
   Bys+aI6FrF+V7Pt4zUleU0R4Og4fxP0gcpPTd0y9Heb9t1nisHEWyljO+
   IrhXVBKERm99ra8U4bcsw1QKU17DeeisEx98z66JGx12m2EntOTEAmmyM
   qMWCg9OPa5AOb3P+OC9bTDNonmN29DYJivQSQDgoEosMVnujhCQgooyam
   g==;
X-CSE-ConnectionGUID: 7P/U4LUqTWq73c7ncIZN3Q==
X-CSE-MsgGUID: 7M61z9y+Qnemt+C4iCI7sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="77846933"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="77846933"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 20:13:58 -0700
X-CSE-ConnectionGUID: hZlcpGdLSD6l2nO4nPTl7Q==
X-CSE-MsgGUID: SnOe3nRRRtaTj0AOj3nGUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="234335376"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 May 2026 20:13:57 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJNHF-0000000024z-48DU;
	Sun, 03 May 2026 03:13:53 +0000
Date: Sun, 3 May 2026 11:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] scripts/kernel-doc: Detect mismatched inline member
 documentation tags
Message-ID: <202605031151.7NM3FJQM-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260501160800.4043276-1-shuicheng.lin@intel.com>
References: <20260501160800.4043276-1-shuicheng.lin@intel.com>
TO: Shuicheng Lin <shuicheng.lin@intel.com>
TO: linux-doc@vger.kernel.org
CC: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>
CC: linux-kernel@vger.kernel.org
CC: intel-xe@lists.freedesktop.org

Hi Shuicheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v7.1-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuicheng-Lin/scripts-kernel-doc-Detect-mismatched-inline-member-documentation-tags/20260502-081921
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20260501160800.4043276-1-shuicheng.lin%40intel.com
patch subject: [PATCH v2] scripts/kernel-doc: Detect mismatched inline member documentation tags
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: hexagon-randconfig-002-20260503 (https://download.01.org/0day-ci/archive/20260503/202605031151.7NM3FJQM-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031151.7NM3FJQM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605031151.7NM3FJQM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: fs/backing-file.c:35 function parameter 'user_file' not described in 'backing_file_open'
>> Warning: fs/backing-file.c:35 Excess function parameter 'user_path' description in 'backing_file_open'
   Warning: fs/backing-file.c:35 function parameter 'user_file' not described in 'backing_file_open'
>> Warning: fs/backing-file.c:35 Excess function parameter 'user_path' description in 'backing_file_open'
--
>> Warning: drivers/gpu/buddy.c:1474 Excess function parameter 'p' description in 'gpu_buddy_print'
>> Warning: drivers/gpu/buddy.c:1474 Excess function parameter 'p' description in 'gpu_buddy_print'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
