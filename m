Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C9C6FBD
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Sep 2023 23:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694301958; x=1725837958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R4m2NBH21NHz8Y9nVZzIOVkxBoHB5nIOb9YClFmZOL8=;
  b=kdSVGd7vyqRL2en6Dyw+iHcucfe0gzNxJ8MIS4TYUcwZRugu1jwaoNCQ
   gC4aCQxj3FCcT82HejQBagtajEd1h4QJxjeBNAszrNYFRD/ySK9nO3Fh8
   r1SDXMP6pyNG0jyQDO0BOpK6eFCjvYl3sMDaTOGzRl7Un/jTcidwoDsEy
   CTOqt5zEIqzenq8aZfMa5+DZXKtqDLMT3yey3SOh0jzSynXhMli3Y7+/y
   Xu9nh7Ph9W02yfo9ElWkEyeqIVHNj65EivjpXkuav67eLz5nym43PBvw0
   tVG7L/ApZr85+Y5KEBLwZQhFvbaj6MlScOvqigUseQcaRFf15uKCTJjZJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="444282601"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="444282601"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 16:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="1073694847"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="1073694847"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2023 16:25:55 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qf7Kr-00042R-1t;
	Sat, 09 Sep 2023 23:25:53 +0000
Date: Sun, 10 Sep 2023 07:25:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jfern:linux-debug-webinar 7/9] checkpatch: WARNING: unnecessary
 cast may hide bugs, see http://c-faq.com/malloc/mallocnocast.html
Message-ID: <202309100721.Z00aiuF5-lkp@intel.com>
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
head:   e96cc60e2a075f72aebc4606128d429c68501b25
commit: 529a7916e6767c06793446a831a7ef26ca5aa255 [7/9] DEMO: ipi storm kernel module
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230910/202309100721.Z00aiuF5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309100721.Z00aiuF5-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Missing commit description - Add an appropriate one

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#18: 
new file mode 100644

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#394053: drivers/misc/ipist.c:1:
+#include <linux/init.h>

ERROR: open brace '{' following function definitions go on the next line
#394066: drivers/misc/ipist.c:14:
+static void ipi_handler(void *info) {

WARNING: please, no spaces at the start of a line
#394067: drivers/misc/ipist.c:15:
+     mdelay(2); // Introduce a small delay between IPIs$

ERROR: open brace '{' following function definitions go on the next line
#394070: drivers/misc/ipist.c:18:
+static int send_ipis(void *data) {

WARNING: please, no spaces at the start of a line
#394071: drivers/misc/ipist.c:19:
+    unsigned long end_time = jiffies + msecs_to_jiffies(50000); // 50 seconds$

WARNING: please, no spaces at the start of a line
#394072: drivers/misc/ipist.c:20:
+    int i = 0;$

WARNING: please, no spaces at the start of a line
#394074: drivers/misc/ipist.c:22:
+    printk(KERN_ERR "IPI sender thread started on cpu %d\n", smp_processor_id());$

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#394074: drivers/misc/ipist.c:22:
+    printk(KERN_ERR "IPI sender thread started on cpu %d\n", smp_processor_id());

WARNING: please, no spaces at the start of a line
#394076: drivers/misc/ipist.c:24:
+    while (time_before(jiffies, end_time)) {$

ERROR: code indent should use tabs where possible
#394077: drivers/misc/ipist.c:25:
+        struct __call_single_data *csd =$

WARNING: please, no spaces at the start of a line
#394077: drivers/misc/ipist.c:25:
+        struct __call_single_data *csd =$

ERROR: code indent should use tabs where possible
#394078: drivers/misc/ipist.c:26:
+            (struct __call_single_data *) kmalloc(sizeof(struct __call_single_data), GFP_KERNEL);$

WARNING: please, no spaces at the start of a line
#394078: drivers/misc/ipist.c:26:
+            (struct __call_single_data *) kmalloc(sizeof(struct __call_single_data), GFP_KERNEL);$

WARNING: unnecessary cast may hide bugs, see http://c-faq.com/malloc/mallocnocast.html
#394078: drivers/misc/ipist.c:26:
+            (struct __call_single_data *) kmalloc(sizeof(struct __call_single_data), GFP_KERNEL);

ERROR: code indent should use tabs where possible
#394079: drivers/misc/ipist.c:27:
+        if (!csd) {$

WARNING: please, no spaces at the start of a line
#394079: drivers/misc/ipist.c:27:
+        if (!csd) {$

WARNING: suspect code indent for conditional statements (8, 12)
#394079: drivers/misc/ipist.c:27:
+        if (!csd) {
+            printk(KERN_ERR "Failed to allocate memory for csd\n");

ERROR: code indent should use tabs where possible
#394080: drivers/misc/ipist.c:28:
+            printk(KERN_ERR "Failed to allocate memory for csd\n");$

WARNING: please, no spaces at the start of a line
#394080: drivers/misc/ipist.c:28:
+            printk(KERN_ERR "Failed to allocate memory for csd\n");$

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#394080: drivers/misc/ipist.c:28:
+            printk(KERN_ERR "Failed to allocate memory for csd\n");

ERROR: code indent should use tabs where possible
#394081: drivers/misc/ipist.c:29:
+            continue;$

WARNING: please, no spaces at the start of a line
#394081: drivers/misc/ipist.c:29:
+            continue;$

ERROR: code indent should use tabs where possible
#394082: drivers/misc/ipist.c:30:
+        }$

WARNING: please, no spaces at the start of a line
#394082: drivers/misc/ipist.c:30:
+        }$

ERROR: code indent should use tabs where possible
#394083: drivers/misc/ipist.c:31:
+        memset(csd, 0, sizeof(struct __call_single_data));$

WARNING: please, no spaces at the start of a line
#394083: drivers/misc/ipist.c:31:
+        memset(csd, 0, sizeof(struct __call_single_data));$

ERROR: code indent should use tabs where possible
#394084: drivers/misc/ipist.c:32:
+        csd->func = ipi_handler;$

WARNING: please, no spaces at the start of a line
#394084: drivers/misc/ipist.c:32:
+        csd->func = ipi_handler;$

ERROR: code indent should use tabs where possible
#394085: drivers/misc/ipist.c:33:
+        smp_call_function_single_async(target_cpu, csd);$

WARNING: please, no spaces at the start of a line
#394085: drivers/misc/ipist.c:33:
+        smp_call_function_single_async(target_cpu, csd);$

ERROR: code indent should use tabs where possible
#394086: drivers/misc/ipist.c:34:
+        if (i++ % 1000 == 0) {$

WARNING: please, no spaces at the start of a line
#394086: drivers/misc/ipist.c:34:
+        if (i++ % 1000 == 0) {$

WARNING: suspect code indent for conditional statements (8, 12)
#394086: drivers/misc/ipist.c:34:
+        if (i++ % 1000 == 0) {
+            msleep(5);

WARNING: braces {} are not necessary for single statement blocks
#394086: drivers/misc/ipist.c:34:
+        if (i++ % 1000 == 0) {
+            msleep(5);
+        }

ERROR: code indent should use tabs where possible
#394087: drivers/misc/ipist.c:35:
+            msleep(5);$

WARNING: please, no spaces at the start of a line
#394087: drivers/misc/ipist.c:35:
+            msleep(5);$

WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
#394087: drivers/misc/ipist.c:35:
+            msleep(5);

ERROR: code indent should use tabs where possible
#394088: drivers/misc/ipist.c:36:
+        }$

WARNING: please, no spaces at the start of a line
#394088: drivers/misc/ipist.c:36:
+        }$

WARNING: please, no spaces at the start of a line
#394089: drivers/misc/ipist.c:37:
+    }$

WARNING: please, no spaces at the start of a line
#394091: drivers/misc/ipist.c:39:
+    return 0;$

ERROR: open brace '{' following function definitions go on the next line
#394094: drivers/misc/ipist.c:42:
+static int __init my_module_init(void) {

WARNING: please, no spaces at the start of a line
#394095: drivers/misc/ipist.c:43:
+    printk(KERN_INFO "Loading module to continuously send IPIs...\n");$

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#394095: drivers/misc/ipist.c:43:
+    printk(KERN_INFO "Loading module to continuously send IPIs...\n");

WARNING: please, no spaces at the start of a line
#394097: drivers/misc/ipist.c:45:
+    target_cpu = (smp_processor_id() + 1) % nr_cpu_ids; // Choose the next CPU as target$

WARNING: please, no spaces at the start of a line
#394099: drivers/misc/ipist.c:47:
+    printk(KERN_ERR "Target CPU: %d\n", target_cpu);$

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#394099: drivers/misc/ipist.c:47:
+    printk(KERN_ERR "Target CPU: %d\n", target_cpu);

WARNING: please, no spaces at the start of a line
#394103: drivers/misc/ipist.c:51:
+    ipi_thread = kthread_create_on_cpu(send_ipis, NULL, smp_processor_id(), "ipi_sender_thread");$

WARNING: please, no spaces at the start of a line
#394104: drivers/misc/ipist.c:52:
+    if (IS_ERR(ipi_thread)) {$

ERROR: code indent should use tabs where possible
#394105: drivers/misc/ipist.c:53:
+        printk(KERN_ERR "Failed to create IPI sender thread\n");$

WARNING: please, no spaces at the start of a line
#394105: drivers/misc/ipist.c:53:
+        printk(KERN_ERR "Failed to create IPI sender thread\n");$

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#394105: drivers/misc/ipist.c:53:
+        printk(KERN_ERR "Failed to create IPI sender thread\n");

ERROR: code indent should use tabs where possible
#394106: drivers/misc/ipist.c:54:
+        return PTR_ERR(ipi_thread);$

WARNING: please, no spaces at the start of a line
#394106: drivers/misc/ipist.c:54:
+        return PTR_ERR(ipi_thread);$

WARNING: please, no spaces at the start of a line
#394107: drivers/misc/ipist.c:55:
+    }$

WARNING: please, no spaces at the start of a line
#394109: drivers/misc/ipist.c:57:
+    wake_up_process(ipi_thread);$

WARNING: please, no spaces at the start of a line
#394110: drivers/misc/ipist.c:58:
+    return 0;$

ERROR: open brace '{' following function definitions go on the next line
#394113: drivers/misc/ipist.c:61:
+static void __exit my_module_exit(void) {

WARNING: please, no spaces at the start of a line
#394114: drivers/misc/ipist.c:62:
+    printk(KERN_INFO "Unloading module...\n");$

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#394114: drivers/misc/ipist.c:62:
+    printk(KERN_INFO "Unloading module...\n");

WARNING: please, no spaces at the start of a line
#394115: drivers/misc/ipist.c:63:
+    kthread_stop(ipi_thread);$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
