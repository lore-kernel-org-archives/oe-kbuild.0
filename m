Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426D91FAE
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Oct 2022 20:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666989905; x=1698525905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I4o9vxT+9tyEa+UxXMNY9AVorYOUNBCp89J0R0UkSSg=;
  b=Slzs89cqNL5LG00OS1ZOLxE45RjOF2d7zL/dKKsujE1ezAfAAfXqhMfI
   WVU2MdFkYgJUBRRN5W0z9D6VbUAc5c+WE3a6QXq1oVT3iVhMAfpWJ7YdC
   INYgGfVq9y6GuHDQb4YH9TGhvOMJEI/Z7yLFkvYss8kcO7L5vVFRaFAem
   wUBzEjZJ0tfCfECCt8g/drsrni/rrxeTXr6lP/yF4F9h9/gEvxv/4zJCM
   sbLCGkOfhNC+eotiwf39F6/imJa+YtgvN/kkeg75eu3p6psW1R0LVtsW6
   Bx82MK9u3IpV7qNLqCC2BMoiECDhjiX1tGyGRsu6devU3dncjrLxU4+F1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="308584145"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="308584145"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 13:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="610876436"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="610876436"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Oct 2022 13:45:03 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ooWDu-000ADb-2x;
	Fri, 28 Oct 2022 20:45:02 +0000
Date: Sat, 29 Oct 2022 04:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 13/25] selftests/rseq: x86: Template memory ordering
 and percpu access mode
Message-ID: <202210290447.QwkYrt48-lkp@intel.com>
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
[cannot apply to shuah-kselftest/next tip/sched/core kees/for-next/execve linus/master v6.1-rc2 next-20221028]
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
