Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8BF15CA9
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Oct 2022 09:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667034750; x=1698570750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A2Vr/uZzxlpZANttE/PCeO7xeEY6fH1gAFoAJyzsHV8=;
  b=F8d5u3hFtLtZZuhfxUV5jVSPrOdg8iIJ2syqDTcD9Uq61+Ii7L6BHttq
   jROEqpDfHTGixoKHvHVc78jchFLN/A4iJ17nvgN/fNLT1TIO4mwnE4ruj
   weTLFbtsrDaCgsMrpyFFRFDXkfAxYys93NfRpkwedR8plxfyfEgjaaqh/
   F6hhYlG1bYuICA0WbBIyhRYTc191n6X96Ti0iT9FRwxIjeVVKsGSpfSQN
   VqMTPdFIrj1/47PXCA07h/calLA5vdA675WgVtt7pWrvMJ4pTHI/+cwjF
   QTo6/bPPrwh43a6KN2nhYRBH28fmPDhjtC0muFxpxHy5snIdVtEC5z1LW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="372862151"
X-IronPort-AV: E=Sophos;i="5.95,223,1661842800"; 
   d="scan'208";a="372862151"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2022 02:12:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="611001815"
X-IronPort-AV: E=Sophos;i="5.95,223,1661842800"; 
   d="scan'208";a="611001815"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Oct 2022 02:12:20 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ooht6-000ArN-0n;
	Sat, 29 Oct 2022 09:12:20 +0000
Date: Sat, 29 Oct 2022 17:12:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 14/25] selftests/rseq: arm: Template memory ordering
 and percpu access mode
Message-ID: <202210291636.9d1eu7WQ-lkp@intel.com>
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
[cannot apply to shuah-kselftest/next tip/sched/core kees/for-next/execve linus/master v6.1-rc2 next-20221028]
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
