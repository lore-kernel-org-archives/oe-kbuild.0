Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF049122A3
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Oct 2022 22:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667170547; x=1698706547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NRVowaAc4dJAU2lOr2q0uXWj+LR870Z7jquQtCQwvjk=;
  b=B1yT0Nn2475D9jhOlbrlureQH6OGsz6CY1WPZRb5fdZcsPqOf5eJUmkT
   3rfKuPP7HV4bMJhdDADK8Cizl9tHF8sIa7226hONIi0mk2mtlpks02xhp
   uLBGcMueTY3gfDWRQTtBHAlJP+Z4eGZ3gzweaWVjpHuVqSjN4Zee+3tDB
   pyuVQVK+Fi1uHIAdPUa9uT0mBwaQo9IvczRRWBXe5lydn8UlxlcVvZBKA
   YXhMlJbDryAyLBOzSjv5Tsfsvs7luXbmrJ+BIC5stjAWOOTvKOu/mw1fg
   1qofDW5XExqw1VFCXDEHpjT6oxApwOKbwXnQQ/Y+A4FvHttxS5iMHERvU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="395100008"
X-IronPort-AV: E=Sophos;i="5.95,226,1661842800"; 
   d="scan'208";a="395100008"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2022 15:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="696804516"
X-IronPort-AV: E=Sophos;i="5.95,226,1661842800"; 
   d="scan'208";a="696804516"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Oct 2022 15:55:46 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1opHDV-000CTw-30;
	Sun, 30 Oct 2022 22:55:45 +0000
Date: Mon, 31 Oct 2022 06:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 19/25] selftests/rseq: riscv: Template memory ordering
 and percpu access mode
Message-ID: <202210310652.WBwzcGD0-lkp@intel.com>
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
In-Reply-To: <20220922105941.237830-20-mathieu.desnoyers@efficios.com>
References: <20220922105941.237830-20-mathieu.desnoyers@efficios.com>
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
CC: Vincent Chen <vincent.chen@sifive.com>
CC: Eric Lin <eric.lin@sifive.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>

Hi Mathieu,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rostedt-trace/for-next]
[cannot apply to shuah-kselftest/next tip/sched/core kees/for-next/execve linus/master v6.1-rc3 next-20221028]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/RSEQ-node-id-and-virtual-cpu-id-extensions/20220922-191315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
patch link:    https://lore.kernel.org/r/20220922105941.237830-20-mathieu.desnoyers%40efficios.com
patch subject: [PATCH v4 19/25] selftests/rseq: riscv: Template memory ordering and percpu access mode
:::::: branch date: 6 weeks ago
:::::: commit date: 6 weeks ago
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> tools/testing/selftests/rseq/rseq-riscv.h: rseq-riscv-bits.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
