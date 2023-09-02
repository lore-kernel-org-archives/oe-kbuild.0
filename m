Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A04517D2
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Sep 2023 07:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693639156; x=1725175156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aaJKHlhEkNPVp8KSUyKfKfe7p6SwUBlhbo3tfMxBYhQ=;
  b=Cc5lctUCPOyNlrmBnzLLjbHJsFKGVZo4evDSOQiv5ThyIDykQbigxzEY
   jE88bQ2e9tpRHnnc39zzSJQlC1ECkkIlz0dUSI6lZh2eSp/1YRsoJqncS
   bDoMcezxJck67oAzqXUl61+oXY/ts/7SQIR1pOJAOk3StkeRQFnXEoHFe
   ZQiARmzZDXHnuvLAlZ7dMZYHYfTdrUqV70L8Ceqhk/9Cr8b16keF7wXdI
   qVoNBAdCHy1BmDHIXXby4ULbcZsDSPqIgmUEuIfw37J7rAr+sNTNk0G0d
   qplDfaOJZAaT75+SFiDYOo9Ar2U3n5FKtewNnvF7BxX4MDJ3g5OgMcjq6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462714496"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="462714496"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 00:19:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="854959951"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="854959951"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Sep 2023 00:19:12 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcKuT-000273-2j;
	Sat, 02 Sep 2023 07:19:09 +0000
Date: Sat, 2 Sep 2023 15:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jfern:linux-debug-webinar 7/7] checkpatch: WARNING: unnecessary
 cast may hide bugs, see http://c-faq.com/malloc/mallocnocast.html
Message-ID: <202309021557.swzxpXwW-lkp@intel.com>
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
head:   d3807eaa620f57f49898bc00500ac1f69917bf7f
commit: d3807eaa620f57f49898bc00500ac1f69917bf7f [7/7] DEMO: ipi storm kernel module
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230902/202309021557.swzxpXwW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309021557.swzxpXwW-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Missing commit description - Add an appropriate one

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#31: drivers/misc/ipist.c:1:
+#include <linux/init.h>

ERROR: open brace '{' following function definitions go on the next line
#45: drivers/misc/ipist.c:15:
+static void ipi_handler(void *info) {

WARNING: please, no spaces at the start of a line
#46: drivers/misc/ipist.c:16:
+     mdelay(2); // Introduce a small delay between IPIs$

ERROR: open brace '{' following function definitions go on the next line
#49: drivers/misc/ipist.c:19:
+static int send_ipis(void *data) {

WARNING: please, no spaces at the start of a line
#50: drivers/misc/ipist.c:20:
+    unsigned long end_time = jiffies + msecs_to_jiffies(50000); // 50 seconds$

WARNING: please, no spaces at the start of a line
#51: drivers/misc/ipist.c:21:
+    int i = 0;$

WARNING: please, no spaces at the start of a line
#53: drivers/misc/ipist.c:23:
+    printk(KERN_ERR "IPI sender thread started on cpu %d\n", smp_processor_id());$

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#53: drivers/misc/ipist.c:23:
+    printk(KERN_ERR "IPI sender thread started on cpu %d\n", smp_processor_id());

WARNING: please, no spaces at the start of a line
#55: drivers/misc/ipist.c:25:
+    while (time_before(jiffies, end_time)) {$

ERROR: code indent should use tabs where possible
#56: drivers/misc/ipist.c:26:
+        struct __call_single_data *csd =$

WARNING: please, no spaces at the start of a line
#56: drivers/misc/ipist.c:26:
+        struct __call_single_data *csd =$

ERROR: code indent should use tabs where possible
#57: drivers/misc/ipist.c:27:
+            (struct __call_single_data *) kmalloc(sizeof(struct __call_single_data), GFP_KERNEL);$

WARNING: please, no spaces at the start of a line
#57: drivers/misc/ipist.c:27:
+            (struct __call_single_data *) kmalloc(sizeof(struct __call_single_data), GFP_KERNEL);$

WARNING: unnecessary cast may hide bugs, see http://c-faq.com/malloc/mallocnocast.html
#57: drivers/misc/ipist.c:27:
+            (struct __call_single_data *) kmalloc(sizeof(struct __call_single_data), GFP_KERNEL);

ERROR: code indent should use tabs where possible
#58: drivers/misc/ipist.c:28:
+        if (!csd) {$

WARNING: please, no spaces at the start of a line
#58: drivers/misc/ipist.c:28:
+        if (!csd) {$

WARNING: suspect code indent for conditional statements (8, 12)
#58: drivers/misc/ipist.c:28:
+        if (!csd) {
+            printk(KERN_ERR "Failed to allocate memory for csd\n");

ERROR: code indent should use tabs where possible
#59: drivers/misc/ipist.c:29:
+            printk(KERN_ERR "Failed to allocate memory for csd\n");$

WARNING: please, no spaces at the start of a line
#59: drivers/misc/ipist.c:29:
+            printk(KERN_ERR "Failed to allocate memory for csd\n");$

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#59: drivers/misc/ipist.c:29:
+            printk(KERN_ERR "Failed to allocate memory for csd\n");

ERROR: code indent should use tabs where possible
#60: drivers/misc/ipist.c:30:
+            continue;$

WARNING: please, no spaces at the start of a line
#60: drivers/misc/ipist.c:30:
+            continue;$

ERROR: code indent should use tabs where possible
#61: drivers/misc/ipist.c:31:
+        }$

WARNING: please, no spaces at the start of a line
#61: drivers/misc/ipist.c:31:
+        }$

ERROR: code indent should use tabs where possible
#62: drivers/misc/ipist.c:32:
+        memset(csd, 0, sizeof(struct __call_single_data));$

WARNING: please, no spaces at the start of a line
#62: drivers/misc/ipist.c:32:
+        memset(csd, 0, sizeof(struct __call_single_data));$

ERROR: code indent should use tabs where possible
#63: drivers/misc/ipist.c:33:
+        csd->func = ipi_handler;$

WARNING: please, no spaces at the start of a line
#63: drivers/misc/ipist.c:33:
+        csd->func = ipi_handler;$

ERROR: code indent should use tabs where possible
#64: drivers/misc/ipist.c:34:
+        smp_call_function_single_async(target_cpu, csd);$

WARNING: please, no spaces at the start of a line
#64: drivers/misc/ipist.c:34:
+        smp_call_function_single_async(target_cpu, csd);$

ERROR: code indent should use tabs where possible
#65: drivers/misc/ipist.c:35:
+        if (i++ % 1000 == 0) {$

WARNING: please, no spaces at the start of a line
#65: drivers/misc/ipist.c:35:
+        if (i++ % 1000 == 0) {$

WARNING: suspect code indent for conditional statements (8, 12)
#65: drivers/misc/ipist.c:35:
+        if (i++ % 1000 == 0) {
+            msleep(5);

WARNING: braces {} are not necessary for single statement blocks
#65: drivers/misc/ipist.c:35:
+        if (i++ % 1000 == 0) {
+            msleep(5);
+        }

ERROR: code indent should use tabs where possible
#66: drivers/misc/ipist.c:36:
+            msleep(5);$

WARNING: please, no spaces at the start of a line
#66: drivers/misc/ipist.c:36:
+            msleep(5);$

WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
#66: drivers/misc/ipist.c:36:
+            msleep(5);

ERROR: code indent should use tabs where possible
#67: drivers/misc/ipist.c:37:
+        }$

WARNING: please, no spaces at the start of a line
#67: drivers/misc/ipist.c:37:
+        }$

WARNING: please, no spaces at the start of a line
#68: drivers/misc/ipist.c:38:
+    }$

WARNING: please, no spaces at the start of a line
#70: drivers/misc/ipist.c:40:
+    return 0;$

ERROR: open brace '{' following function definitions go on the next line
#73: drivers/misc/ipist.c:43:
+static int __init my_module_init(void) {

WARNING: please, no spaces at the start of a line
#74: drivers/misc/ipist.c:44:
+    printk(KERN_INFO "Loading module to continuously send IPIs...\n");$

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#74: drivers/misc/ipist.c:44:
+    printk(KERN_INFO "Loading module to continuously send IPIs...\n");

WARNING: please, no spaces at the start of a line
#76: drivers/misc/ipist.c:46:
+    target_cpu = (smp_processor_id() + 1) % nr_cpu_ids; // Choose the next CPU as target$

WARNING: please, no spaces at the start of a line
#78: drivers/misc/ipist.c:48:
+    printk(KERN_ERR "Target CPU: %d\n", target_cpu);$

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#78: drivers/misc/ipist.c:48:
+    printk(KERN_ERR "Target CPU: %d\n", target_cpu);

WARNING: please, no spaces at the start of a line
#82: drivers/misc/ipist.c:52:
+    ipi_thread = kthread_create_on_cpu(send_ipis, NULL, smp_processor_id(), "ipi_sender_thread");$

WARNING: please, no spaces at the start of a line
#83: drivers/misc/ipist.c:53:
+    if (IS_ERR(ipi_thread)) {$

ERROR: code indent should use tabs where possible
#84: drivers/misc/ipist.c:54:
+        printk(KERN_ERR "Failed to create IPI sender thread\n");$

WARNING: please, no spaces at the start of a line
#84: drivers/misc/ipist.c:54:
+        printk(KERN_ERR "Failed to create IPI sender thread\n");$

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#84: drivers/misc/ipist.c:54:
+        printk(KERN_ERR "Failed to create IPI sender thread\n");

ERROR: code indent should use tabs where possible
#85: drivers/misc/ipist.c:55:
+        return PTR_ERR(ipi_thread);$

WARNING: please, no spaces at the start of a line
#85: drivers/misc/ipist.c:55:
+        return PTR_ERR(ipi_thread);$

WARNING: please, no spaces at the start of a line
#86: drivers/misc/ipist.c:56:
+    }$

ERROR: trailing whitespace
#87: drivers/misc/ipist.c:57:
+    $

WARNING: please, no spaces at the start of a line
#87: drivers/misc/ipist.c:57:
+    $

WARNING: please, no spaces at the start of a line
#88: drivers/misc/ipist.c:58:
+    wake_up_process(ipi_thread);$

WARNING: please, no spaces at the start of a line
#89: drivers/misc/ipist.c:59:
+    return 0;$

ERROR: open brace '{' following function definitions go on the next line
#92: drivers/misc/ipist.c:62:
+static void __exit my_module_exit(void) {

WARNING: please, no spaces at the start of a line
#93: drivers/misc/ipist.c:63:
+    printk(KERN_INFO "Unloading module...\n");$

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#93: drivers/misc/ipist.c:63:
+    printk(KERN_INFO "Unloading module...\n");

WARNING: please, no spaces at the start of a line
#94: drivers/misc/ipist.c:64:
+    kthread_stop(ipi_thread);$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
