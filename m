Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5BE2AD00
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Aug 2026 02:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787364235; cv=none; b=NaS+jzvijk98iRVWzS1/Bv/J5b3LGnhSgYE8VauxJVgr/WnHlyBkxlrG/+pXLc0g7elbtz+0SSkDq1C1MvKySxs1f/wKKNbQgOhlAjvNMvmyer3DlAi02Efg9aTB5xPtsG69S87t7swdS0/5G8QLaWkbbE9pKYkW3VRlBmxtcoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787364235; c=relaxed/simple;
	bh=IMUQgTMnj1MVHqgdjTsZuTO54Jxr+/Z+/xcKyeqzrIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eJgTmlHa7fe+2m6HKNHV2+RInOUibTs/tFGeiHDfF3bI8fVR/NzzZy3xneIQ887w8inip6qf6ETiEnSzOifeVRW7/Ov0TGsycFnexzoNPNXvnFIlHEnJAsceHjQd/gfwHWVpk9gcwSiR/hbvAVXWWBe7WGm7iydGEScTA7GnP1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1zmvQRH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1zmvQRH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787364234; x=1818900234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IMUQgTMnj1MVHqgdjTsZuTO54Jxr+/Z+/xcKyeqzrIw=;
  b=Q1zmvQRHZdV5QfT74b14/vVGVzyqLfNnyaxAENLJ4sZUmeixFH/t8eIX
   Z3R9JlmDYJtelj2PSrBg7+vH0qQXx/PhCyMQ/I5DJN5KdpRbwkw10QZNX
   9DNY9bqdf2YV0Lt3iIVY7FGGmMSO9cmQQXRRnqEWVHtoH5lc6zYirZp7x
   fKSrPIPvj8wYQmWmxtZlmxZ/E6ZWetwwBJp5yMJFoeE6h1X9KCbGVHxXC
   hQd930Ob7s7d1KfpQREPFxSAYwZYvu944y1gFsNvvlegVO4+cbLHKaSdq
   PSZP2vB9Xs8xv3K1nelgu1JfKTRS36Tbno82QT0D85xz9pjlWNMJtwbCS
   w==;
X-CSE-ConnectionGUID: ZVQ9/TF4RlaAIznEvcPH6Q==
X-CSE-MsgGUID: UMHKfTlNRYmhZmeyxbacsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="88115956"
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="88115956"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 19:03:53 -0700
X-CSE-ConnectionGUID: JKzaaB6AQjaAeN94Z7sl5w==
X-CSE-MsgGUID: lZ2rtME9RUmuJK64jfhXoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="263230717"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 21 Aug 2026 19:03:51 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxb5J-000000007on-0sLZ;
	Sat, 22 Aug 2026 02:03:49 +0000
Date: Sat, 22 Aug 2026 04:03:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v19 6/6] lib: inline percpu_counter_tree_items_size with
 boot-safety sentinel
Message-ID: <202608220311.iAQwDQvI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260702192214.41467-7-mathieu.desnoyers@efficios.com>
References: <20260702192214.41467-7-mathieu.desnoyers@efficios.com>
TO: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: linux-kernel@vger.kernel.org
CC: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

Hi Mathieu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on akpm-mm/mm-nonmm-unstable linus/master v7.2]
[cannot apply to dennis-percpu/for-next next-20260821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/lib-introduce-hierarchical-per-cpu-counters/20260811-135340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260702192214.41467-7-mathieu.desnoyers%40efficios.com
patch subject: [PATCH v19 6/6] lib: inline percpu_counter_tree_items_size with boot-safety sentinel
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260822/202608220311.iAQwDQvI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608220311.iAQwDQvI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:58: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:228: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:251: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/core-api/percpu-counter-tree.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
