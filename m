Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF5A7F
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 12:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693743440; x=1725279440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mtZhyHWymOQHktYXpohAc/kBrIp3/p21Ma337sjaugg=;
  b=PqczkDQEUJGgoOuEm/r32IX8qQmNiyZFJ8VTtRzzviwi7Pm2BX8cLYKl
   Qvrse8ub8/JCcB1tMXwcRqbxUhkwy15jWwq2gz2DIjRG+XMPVFFSjB+Y1
   aKlfgCLUxyUH1kVTVFNAhbpP55T3qlqZQcqgKQon9V2U5hRR/nOFyif3o
   lzsr+KmRE+f/1K4TUUs1QrE/oCNyLWIyO+mfTirWA/u2is3xSlpR/DfQz
   t2ZUyAZ5ULlL1ewlutGiRLa9cPW23OVyM5IE7YWnoWCcmigbE3nRC8KNm
   5iwLKJwV4PtTK9F1oiPyiXS9+wH36Hnp9oEe/+UybJAOV22d6amGgRrmS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="462813360"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="462813360"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 05:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="690300642"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="690300642"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Sep 2023 05:16:54 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcm28-00039P-1O;
	Sun, 03 Sep 2023 12:16:52 +0000
Date: Sun, 3 Sep 2023 20:16:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jfern:linux-debug-webinar 7/9] checkpatch: WARNING: unnecessary
 cast may hide bugs, see http://c-faq.com/malloc/mallocnocast.html
Message-ID: <202309032020.JDZh4T5u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "checkpatch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Joel Fernandes (Google)" <joel@joelfernandes.org>
INFO skip CC for checkpatch warnings

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git linux-debug-webinar
head:   17044d82a0bae97e76abac839dc151e5abc09d07
commit: 3633c60b54b33d2665814fa23b6a715293b647e1 [7/9] DEMO: ipi storm kernel module
:::::: branch date: 10 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230903/202309032020.JDZh4T5u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309032020.JDZh4T5u-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Missing commit description - Add an appropriate one

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#31: drivers/misc/ipist.c:1:
+#include <linux/init.h>

ERROR: open brace '{' following function definitions go on the next line
#44: drivers/misc/ipist.c:14:
+static void ipi_handler(void *info) {

WARNING: please, no spaces at the start of a line
#45: drivers/misc/ipist.c:15:
+     mdelay(2); // Introduce a small delay between IPIs$

ERROR: open brace '{' following function definitions go on the next line
#48: drivers/misc/ipist.c:18:
+static int send_ipis(void *data) {

WARNING: please, no spaces at the start of a line
#49: drivers/misc/ipist.c:19:
+    unsigned long end_time = jiffies + msecs_to_jiffies(50000); // 50 seconds$

WARNING: please, no spaces at the start of a line
#50: drivers/misc/ipist.c:20:
+    int i = 0;$

WARNING: please, no spaces at the start of a line
#52: drivers/misc/ipist.c:22:
+    printk(KERN_ERR "IPI sender thread started on cpu %d\n", smp_processor_id());$

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#52: drivers/misc/ipist.c:22:
+    printk(KERN_ERR "IPI sender thread started on cpu %d\n", smp_processor_id());

WARNING: please, no spaces at the start of a line
#54: drivers/misc/ipist.c:24:
+    while (time_before(jiffies, end_time)) {$

ERROR: code indent should use tabs where possible
#55: drivers/misc/ipist.c:25:
+        struct __call_single_data *csd =$

WARNING: please, no spaces at the start of a line
#55: drivers/misc/ipist.c:25:
+        struct __call_single_data *csd =$

ERROR: code indent should use tabs where possible
#56: drivers/misc/ipist.c:26:
+            (struct __call_single_data *) kmalloc(sizeof(struct __call_single_data), GFP_KERNEL);$

WARNING: please, no spaces at the start of a line
#56: drivers/misc/ipist.c:26:
+            (struct __call_single_data *) kmalloc(sizeof(struct __call_single_data), GFP_KERNEL);$

WARNING: unnecessary cast may hide bugs, see http://c-faq.com/malloc/mallocnocast.html
#56: drivers/misc/ipist.c:26:
+            (struct __call_single_data *) kmalloc(sizeof(struct __call_single_data), GFP_KERNEL);

ERROR: code indent should use tabs where possible
#57: drivers/misc/ipist.c:27:
+        if (!csd) {$

WARNING: please, no spaces at the start of a line
#57: drivers/misc/ipist.c:27:
+        if (!csd) {$

WARNING: suspect code indent for conditional statements (8, 12)
#57: drivers/misc/ipist.c:27:
+        if (!csd) {
+            printk(KERN_ERR "Failed to allocate memory for csd\n");

ERROR: code indent should use tabs where possible
#58: drivers/misc/ipist.c:28:
+            printk(KERN_ERR "Failed to allocate memory for csd\n");$

WARNING: please, no spaces at the start of a line
#58: drivers/misc/ipist.c:28:
+            printk(KERN_ERR "Failed to allocate memory for csd\n");$

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#58: drivers/misc/ipist.c:28:
+            printk(KERN_ERR "Failed to allocate memory for csd\n");

ERROR: code indent should use tabs where possible
#59: drivers/misc/ipist.c:29:
+            continue;$

WARNING: please, no spaces at the start of a line
#59: drivers/misc/ipist.c:29:
+            continue;$

ERROR: code indent should use tabs where possible
#60: drivers/misc/ipist.c:30:
+        }$

WARNING: please, no spaces at the start of a line
#60: drivers/misc/ipist.c:30:
+        }$

ERROR: code indent should use tabs where possible
#61: drivers/misc/ipist.c:31:
+        memset(csd, 0, sizeof(struct __call_single_data));$

WARNING: please, no spaces at the start of a line
#61: drivers/misc/ipist.c:31:
+        memset(csd, 0, sizeof(struct __call_single_data));$

ERROR: code indent should use tabs where possible
#62: drivers/misc/ipist.c:32:
+        csd->func = ipi_handler;$

WARNING: please, no spaces at the start of a line
#62: drivers/misc/ipist.c:32:
+        csd->func = ipi_handler;$

ERROR: code indent should use tabs where possible
#63: drivers/misc/ipist.c:33:
+        smp_call_function_single_async(target_cpu, csd);$

WARNING: please, no spaces at the start of a line
#63: drivers/misc/ipist.c:33:
+        smp_call_function_single_async(target_cpu, csd);$

ERROR: code indent should use tabs where possible
#64: drivers/misc/ipist.c:34:
+        if (i++ % 1000 == 0) {$

WARNING: please, no spaces at the start of a line
#64: drivers/misc/ipist.c:34:
+        if (i++ % 1000 == 0) {$

WARNING: suspect code indent for conditional statements (8, 12)
#64: drivers/misc/ipist.c:34:
+        if (i++ % 1000 == 0) {
+            msleep(5);

WARNING: braces {} are not necessary for single statement blocks
#64: drivers/misc/ipist.c:34:
+        if (i++ % 1000 == 0) {
+            msleep(5);
+        }

ERROR: code indent should use tabs where possible
#65: drivers/misc/ipist.c:35:
+            msleep(5);$

WARNING: please, no spaces at the start of a line
#65: drivers/misc/ipist.c:35:
+            msleep(5);$

WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
#65: drivers/misc/ipist.c:35:
+            msleep(5);

ERROR: code indent should use tabs where possible
#66: drivers/misc/ipist.c:36:
+        }$

WARNING: please, no spaces at the start of a line
#66: drivers/misc/ipist.c:36:
+        }$

WARNING: please, no spaces at the start of a line
#67: drivers/misc/ipist.c:37:
+    }$

WARNING: please, no spaces at the start of a line
#69: drivers/misc/ipist.c:39:
+    return 0;$

ERROR: open brace '{' following function definitions go on the next line
#72: drivers/misc/ipist.c:42:
+static int __init my_module_init(void) {

WARNING: please, no spaces at the start of a line
#73: drivers/misc/ipist.c:43:
+    printk(KERN_INFO "Loading module to continuously send IPIs...\n");$

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#73: drivers/misc/ipist.c:43:
+    printk(KERN_INFO "Loading module to continuously send IPIs...\n");

WARNING: please, no spaces at the start of a line
#75: drivers/misc/ipist.c:45:
+    target_cpu = (smp_processor_id() + 1) % nr_cpu_ids; // Choose the next CPU as target$

WARNING: please, no spaces at the start of a line
#77: drivers/misc/ipist.c:47:
+    printk(KERN_ERR "Target CPU: %d\n", target_cpu);$

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#77: drivers/misc/ipist.c:47:
+    printk(KERN_ERR "Target CPU: %d\n", target_cpu);

WARNING: please, no spaces at the start of a line
#81: drivers/misc/ipist.c:51:
+    ipi_thread = kthread_create_on_cpu(send_ipis, NULL, smp_processor_id(), "ipi_sender_thread");$

WARNING: please, no spaces at the start of a line
#82: drivers/misc/ipist.c:52:
+    if (IS_ERR(ipi_thread)) {$

ERROR: code indent should use tabs where possible
#83: drivers/misc/ipist.c:53:
+        printk(KERN_ERR "Failed to create IPI sender thread\n");$

WARNING: please, no spaces at the start of a line
#83: drivers/misc/ipist.c:53:
+        printk(KERN_ERR "Failed to create IPI sender thread\n");$

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#83: drivers/misc/ipist.c:53:
+        printk(KERN_ERR "Failed to create IPI sender thread\n");

ERROR: code indent should use tabs where possible
#84: drivers/misc/ipist.c:54:
+        return PTR_ERR(ipi_thread);$

WARNING: please, no spaces at the start of a line
#84: drivers/misc/ipist.c:54:
+        return PTR_ERR(ipi_thread);$

WARNING: please, no spaces at the start of a line
#85: drivers/misc/ipist.c:55:
+    }$

WARNING: please, no spaces at the start of a line
#87: drivers/misc/ipist.c:57:
+    wake_up_process(ipi_thread);$

WARNING: please, no spaces at the start of a line
#88: drivers/misc/ipist.c:58:
+    return 0;$

ERROR: open brace '{' following function definitions go on the next line
#91: drivers/misc/ipist.c:61:
+static void __exit my_module_exit(void) {

WARNING: please, no spaces at the start of a line
#92: drivers/misc/ipist.c:62:
+    printk(KERN_INFO "Unloading module...\n");$

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#92: drivers/misc/ipist.c:62:
+    printk(KERN_INFO "Unloading module...\n");

WARNING: please, no spaces at the start of a line
#93: drivers/misc/ipist.c:63:
+    kthread_stop(ipi_thread);$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
