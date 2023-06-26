Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC536122
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jun 2023 15:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687792395; x=1719328395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B3BqrU6lUM2H1IohOAQc1Xtc736DVkZq/k7JfvQSmc8=;
  b=Gv/34Fr/cGTfrulAOL4L1k84cDKxuLKYPTtTcJOWiDlVXL6tTIeF+iJU
   issHDNOkUd+d7sLPuyIYfm5XC+UVADV6+qOQ29pAMIZnlJcQQwO5KASwz
   JcEWtj2Z6uOlMHcs0KAyX+aKHWD53/V/3mvHIkAhST9O7/5mL1gdgfXiy
   wMYMPMAf7gnKnt9/J56T2kYT0Qh7LRw49kEKQ8GJ3tW9pBxXyOE/ZZKS7
   Z57W+7IrA5BIZREFA7GTMQp2BlN9/+rqTotEZ3gGmLe+ABJtiDwdudO2f
   5voGJJdC5wZbEkYDMFE6G4nHeFWwc/aSxIqGK4KIYrtyhNQTeFD88Lpvw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="447682276"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="447682276"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 08:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="1046536717"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="1046536717"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Jun 2023 08:13:12 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDntv-000AlJ-2Q;
	Mon, 26 Jun 2023 15:13:11 +0000
Date: Mon, 26 Jun 2023 23:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 1/5] mm/hotplug: Embed vmem_altmap details in memory
 block
Message-ID: <202306262301.E9aAkVFA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230626102212.119919-2-aneesh.kumar@linux.ibm.com>
References: <20230626102212.119919-2-aneesh.kumar@linux.ibm.com>
TO: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

Hi Aneesh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on powerpc/fixes arm64/for-next/core linus/master v6.4]
[cannot apply to powerpc/next next-20230626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V/mm-hotplug-Embed-vmem_altmap-details-in-memory-block/20230626-182455
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230626102212.119919-2-aneesh.kumar%40linux.ibm.com
patch subject: [RFC PATCH 1/5] mm/hotplug: Embed vmem_altmap details in memory block
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230626/202306262301.E9aAkVFA-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306262301.E9aAkVFA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306262301.E9aAkVFA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/nios2/include/uapi/asm/elf.h:24,
                    from arch/nios2/include/asm/elf.h:9,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/memory.h:19,
                    from include/linux/memremap.h:5,
                    from include/linux/mm.h:31,
                    from include/linux/pid_namespace.h:7,
                    from fs/proc/inode.c:12:
   include/linux/ptrace.h: In function 'ptrace_event_pid':
   include/linux/ptrace.h:182:14: error: implicit declaration of function 'task_active_pid_ns' [-Werror=implicit-function-declaration]
     182 |         ns = task_active_pid_ns(rcu_dereference(current->parent));
         |              ^~~~~~~~~~~~~~~~~~
>> include/linux/ptrace.h:182:12: warning: assignment to 'struct pid_namespace *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     182 |         ns = task_active_pid_ns(rcu_dereference(current->parent));
         |            ^
   include/linux/pid_namespace.h: At top level:
   include/linux/pid_namespace.h:104:30: error: conflicting types for 'task_active_pid_ns'; have 'struct pid_namespace *(struct task_struct *)'
     104 | extern struct pid_namespace *task_active_pid_ns(struct task_struct *tsk);
         |                              ^~~~~~~~~~~~~~~~~~
   include/linux/ptrace.h:182:14: note: previous implicit declaration of 'task_active_pid_ns' with type 'int()'
     182 |         ns = task_active_pid_ns(rcu_dereference(current->parent));
         |              ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +182 include/linux/ptrace.h

88ac2921a71f78 Roland McGrath  2008-07-25  158  
4e52365f279564 Matthew Dempsky 2014-06-06  159  /**
4e52365f279564 Matthew Dempsky 2014-06-06  160   * ptrace_event_pid - possibly stop for a ptrace event notification
4e52365f279564 Matthew Dempsky 2014-06-06  161   * @event:	%PTRACE_EVENT_* value to report
4e52365f279564 Matthew Dempsky 2014-06-06  162   * @pid:	process identifier for %PTRACE_GETEVENTMSG to return
4e52365f279564 Matthew Dempsky 2014-06-06  163   *
4e52365f279564 Matthew Dempsky 2014-06-06  164   * Check whether @event is enabled and, if so, report @event and @pid
4e52365f279564 Matthew Dempsky 2014-06-06  165   * to the ptrace parent.  @pid is reported as the pid_t seen from the
df54714f579a77 Randy Dunlap    2021-02-25  166   * ptrace parent's pid namespace.
4e52365f279564 Matthew Dempsky 2014-06-06  167   *
4e52365f279564 Matthew Dempsky 2014-06-06  168   * Called without locks.
4e52365f279564 Matthew Dempsky 2014-06-06  169   */
4e52365f279564 Matthew Dempsky 2014-06-06  170  static inline void ptrace_event_pid(int event, struct pid *pid)
4e52365f279564 Matthew Dempsky 2014-06-06  171  {
4e52365f279564 Matthew Dempsky 2014-06-06  172  	/*
4e52365f279564 Matthew Dempsky 2014-06-06  173  	 * FIXME: There's a potential race if a ptracer in a different pid
4e52365f279564 Matthew Dempsky 2014-06-06  174  	 * namespace than parent attaches between computing message below and
4e52365f279564 Matthew Dempsky 2014-06-06  175  	 * when we acquire tasklist_lock in ptrace_stop().  If this happens,
4e52365f279564 Matthew Dempsky 2014-06-06  176  	 * the ptracer will get a bogus pid from PTRACE_GETEVENTMSG.
4e52365f279564 Matthew Dempsky 2014-06-06  177  	 */
4e52365f279564 Matthew Dempsky 2014-06-06  178  	unsigned long message = 0;
4e52365f279564 Matthew Dempsky 2014-06-06  179  	struct pid_namespace *ns;
4e52365f279564 Matthew Dempsky 2014-06-06  180  
4e52365f279564 Matthew Dempsky 2014-06-06  181  	rcu_read_lock();
4e52365f279564 Matthew Dempsky 2014-06-06 @182  	ns = task_active_pid_ns(rcu_dereference(current->parent));
4e52365f279564 Matthew Dempsky 2014-06-06  183  	if (ns)
4e52365f279564 Matthew Dempsky 2014-06-06  184  		message = pid_nr_ns(pid, ns);
4e52365f279564 Matthew Dempsky 2014-06-06  185  	rcu_read_unlock();
4e52365f279564 Matthew Dempsky 2014-06-06  186  
4e52365f279564 Matthew Dempsky 2014-06-06  187  	ptrace_event(event, message);
4e52365f279564 Matthew Dempsky 2014-06-06  188  }
4e52365f279564 Matthew Dempsky 2014-06-06  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
