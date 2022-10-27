Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7386BA26
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Oct 2022 19:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666899588; x=1698435588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xw0JOENEnktzxMShH/eOV8hiJPWtFhq6UuY6LHMIDlU=;
  b=SQQrYA4s4FWPfW1OHcd/Y8dVR7xhHIgS5m1mcNVyDl1431MmqjfjrZGe
   wMko6QL2zb8elOujrID8Z9ejfqcQIz1bIJRKnAbC6CTd1y2zmAEoQyC0V
   6UjyJ1p08eAkHkP9KzpgJZu+DBpMaDZfqyHfFPct67GYHD6bVlZv7IkMY
   mxt9Ty6IvBX9fQETwXj8RSsbvJwm8OyNS6NUjcu+iKWjyZGT8ITuL3J9e
   Kvr1sSFSvH4Jleim2h/XGXbu7ZaXFu29fNC5ZXSEj3NrNd+2mEUSEecuU
   XgdkGdO8xLaLLajv/6vXYYyCg7NHYM4LSqN+Po9YzsXg4h0HVaUKq7yXU
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="370390584"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; 
   d="scan'208";a="370390584"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 12:39:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="610487462"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; 
   d="scan'208";a="610487462"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Oct 2022 12:39:47 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oo8jC-00096t-2d;
	Thu, 27 Oct 2022 19:39:46 +0000
Date: Fri, 28 Oct 2022 03:38:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 15/25] selftests/rseq: arm64: Template memory ordering
 and percpu access mode
Message-ID: <202210280334.qAYTfhvQ-lkp@intel.com>
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
In-Reply-To: <20220922105941.237830-16-mathieu.desnoyers@efficios.com>
References: <20220922105941.237830-16-mathieu.desnoyers@efficios.com>
TO: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
TO: Peter Zijlstra <peterz@infradead.org>
CC: linux-kernel@vger.kernel.org
CC: Thomas Gleixner <tglx@linutronix.de>
CC: "Paul E . McKenney" <paulmck@kernel.org>
CC: Boqun Feng <boqun.feng@gmail.com>
CC: "H . Peter Anvin" <hpa@zytor.com>
CC: Paul Turner <pjt@google.com>
CC: linux-api@vger.kernel.org
CC: Christian Brauner <brauner@kernel.org>
CC: Florian Weimer <fw@deneb.enyo.de>
CC: David.Laight@ACULAB.COM
CC: carlos@redhat.com
CC: Peter Oskolkov <posk@posk.io>
CC: Alexander Mikhalitsyn <alexander@mihalicyn.com>
CC: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>

Hi Mathieu,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rostedt-trace/for-next]
[cannot apply to shuah-kselftest/next tip/sched/core kees/for-next/execve linus/master v6.1-rc2 next-20221027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/RSEQ-node-id-and-virtual-cpu-id-extensions/20220922-191315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
patch link:    https://lore.kernel.org/r/20220922105941.237830-16-mathieu.desnoyers%40efficios.com
patch subject: [PATCH v4 15/25] selftests/rseq: arm64: Template memory ordering and percpu access mode
:::::: branch date: 5 weeks ago
:::::: commit date: 5 weeks ago
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> tools/testing/selftests/rseq/rseq-arm64.h: rseq-arm64-bits.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
