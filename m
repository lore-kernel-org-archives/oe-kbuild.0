Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06804186A
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Oct 2022 11:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666871003; x=1698407003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vQV+a45EUcC8w5s81qBSDYNg6tKKQ9QX3HwmX/cu28w=;
  b=dieMKwyWM/q1SUpBabuU3G/dUGgajVnTl3hqboJrTzBVSdglWAAF+UxL
   PDGOmrIR8JlvI4T4wjNWr4pRyjKS3nXYeVx65Cj+s/j5R20FbnIY64sLs
   lRIcQyKjXjeqyCrcanH09Ofg2FVzNt0ZcO8CI2gwg47TrdJqm3zLCtOu3
   T+/QpcsB1eCtH1rlIxl6MQkKlAcKlnPWOSuQ7MlK2zxmkxPRi6qSrE1fd
   +oLEQRyMEdtY5Yd+LlDskI2Rj22ANp3z69YKQXtqtPP3iEPZgNEwZ4ike
   QUABv6oyQo1H8cyR0BtbIbOWZqjgnTNMpb8yDzl6ponq0BuXS9Nv9j3t1
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="309291163"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; 
   d="scan'208";a="309291163"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 04:43:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="583526669"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; 
   d="scan'208";a="583526669"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 27 Oct 2022 04:43:21 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oo1I8-0008jd-2X;
	Thu, 27 Oct 2022 11:43:20 +0000
Date: Thu, 27 Oct 2022 19:42:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 14/25] selftests/rseq: arm: Template memory ordering
 and percpu access mode
Message-ID: <202210271925.kJyXnqXw-lkp@intel.com>
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
In-Reply-To: <20220922105941.237830-15-mathieu.desnoyers@efficios.com>
References: <20220922105941.237830-15-mathieu.desnoyers@efficios.com>
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
CC: Russell King <linux@armlinux.org.uk>
CC: Mark Rutland <mark.rutland@arm.com>

Hi Mathieu,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rostedt-trace/for-next]
[cannot apply to shuah-kselftest/next tip/sched/core kees/for-next/execve linus/master v6.1-rc2 next-20221027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/RSEQ-node-id-and-virtual-cpu-id-extensions/20220922-191315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
patch link:    https://lore.kernel.org/r/20220922105941.237830-15-mathieu.desnoyers%40efficios.com
patch subject: [PATCH v4 14/25] selftests/rseq: arm: Template memory ordering and percpu access mode
:::::: branch date: 5 weeks ago
:::::: commit date: 5 weeks ago
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> tools/testing/selftests/rseq/rseq-arm.h: rseq-arm-bits.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
