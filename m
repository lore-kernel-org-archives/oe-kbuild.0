Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019C87B
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Oct 2022 23:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666827265; x=1698363265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mdq5HqTBnG1Rje8WXZ0JJeJURiz3wSj/mGH7X7aOZNs=;
  b=B0WUvDt3ZQPqo6G/QsK6dTGMeZ4NmJWiNSsHAMghWRit2O8NhZ4pcPAo
   GoDPUamNjbPVHMSd+hWLHF6reAuwvvHIs4SeWuSrW5lN7Da3HX7PSrWWh
   nRQON5MpM0BQjsnopklbEUMK1sB+j+cLGyvDSanjAE631vVYiJ5D1wKeK
   Ynkn27pN/FQ+c1paCDDHHUwt1zFRapyjgxRUEmYE/NtumEw9lyUvOPeQG
   /8h8OHnSP2VG9oocqZWA4nvftsVK3StOABtMK0wtdONMxQS5vz8SAHq1n
   s1LjWXBEirq7V9ybSjKGNpuoc2VOBVUYtp7ayxZd8s9mxOJ1kIFXdDYgI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="306816975"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="306816975"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 16:34:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="665468751"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="665468751"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Oct 2022 16:34:20 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1onpue-0007z2-0m;
	Wed, 26 Oct 2022 23:34:20 +0000
Date: Thu, 27 Oct 2022 07:33:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 13/25] selftests/rseq: x86: Template memory ordering
 and percpu access mode
Message-ID: <202210270707.tXq0qYqX-lkp@intel.com>
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
In-Reply-To: <20220922105941.237830-14-mathieu.desnoyers@efficios.com>
References: <20220922105941.237830-14-mathieu.desnoyers@efficios.com>
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

Hi Mathieu,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rostedt-trace/for-next]
[cannot apply to shuah-kselftest/next tip/sched/core kees/for-next/execve linus/master v6.1-rc2 next-20221026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/RSEQ-node-id-and-virtual-cpu-id-extensions/20220922-191315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
patch link:    https://lore.kernel.org/r/20220922105941.237830-14-mathieu.desnoyers%40efficios.com
patch subject: [PATCH v4 13/25] selftests/rseq: x86: Template memory ordering and percpu access mode
:::::: branch date: 5 weeks ago
:::::: commit date: 5 weeks ago
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> tools/testing/selftests/rseq/rseq-x86.h: rseq-x86-bits.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
