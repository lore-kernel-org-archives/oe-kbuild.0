Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A884190
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Oct 2022 08:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667119054; x=1698655054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1fnNYcaGOztxQ5FIllGZHI3ynB9A2ROA/Ru8LQSOE54=;
  b=P/PbOMYd0b5XSYjbg3NxesrsjncTBLM3HoN9iXfoAyt99m05Lphvr6Bz
   joUvNAXg5YcH4AQoHuTkx+t43/xbPmnumWciQOosUA4gST/1TaNiO9br/
   Gl/gjgiee1PIFFRpCwFKlR7l87yCZPY+gtmomQpAYhZTyTFbqXhYveCYL
   sGyxTTk7oL8umhw2bXhQmVoOz1EeKjX1gm48rHDSP/JRRnw3m5pjp5ybW
   V6vzpCB3lh50FgX4UpXs3ZLJ1nb+C/WWcQIVZBU2h5hdkk1PR2N8hKHg7
   NgpzyI9FhiyqZJ0KJ5TyjPNZUnzpjqCiJ+W9e0DccnfSyNcUOr0vWsZ87
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="308727297"
X-IronPort-AV: E=Sophos;i="5.95,225,1661842800"; 
   d="scan'208";a="308727297"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2022 01:37:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="664463816"
X-IronPort-AV: E=Sophos;i="5.95,225,1661842800"; 
   d="scan'208";a="664463816"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Oct 2022 01:37:16 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1op3oi-000BrG-0O;
	Sun, 30 Oct 2022 08:37:16 +0000
Date: Sun, 30 Oct 2022 16:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 17/25] selftests/rseq: ppc: Template memory ordering
 and percpu access mode
Message-ID: <202210301607.fCGTgwtz-lkp@intel.com>
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
In-Reply-To: <20220922105941.237830-18-mathieu.desnoyers@efficios.com>
References: <20220922105941.237830-18-mathieu.desnoyers@efficios.com>
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
patch link:    https://lore.kernel.org/r/20220922105941.237830-18-mathieu.desnoyers%40efficios.com
patch subject: [PATCH v4 17/25] selftests/rseq: ppc: Template memory ordering and percpu access mode
:::::: branch date: 5 weeks ago
:::::: commit date: 5 weeks ago
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> tools/testing/selftests/rseq/rseq-ppc.h: rseq-ppc-bits.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
