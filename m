Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5CC1BDEF
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Sep 2023 22:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694904629; x=1726440629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rvd/THG71Jdusw0THExbuv5NTrVAoZnbYgI96Qql3QA=;
  b=QruiCagx+RuvD+ErIfW4KfABpfNggMBuRSuanLC5tOQLiT6j2KTkZXiE
   81eqTpwLelxLobbNskocQ+6sknIaUj2aPG9xMt9sQJHgP3e41sd3d0Rc7
   bK3Y48Jm2OTsXaaBVBXyWbPHaBbIv6RRwBmVxh8JrH32TG2xh/ekNsM2O
   gFUUsm3lJWPeunp3bA9ALV2JWRPj34wtZvUfT1ReWlCZ5OfDgwX4RuauY
   JZefSl2kVH49GFABsjxNzqlFqkLC5ZOzy+D/VOcbtghKmMmKL5SXYldEe
   xVLQ+N0zRcla5smq/IlpefOubrbzb1nUCv3SNwu9kIFkc4o02oXTwro7R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="359703432"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="359703432"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 15:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="888613734"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="888613734"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2023 15:49:47 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhe7M-0004jY-0M;
	Sat, 16 Sep 2023 22:50:24 +0000
Date: Sun, 17 Sep 2023 06:49:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [zen:6.6/zen-sauce 2/32] checkpatch: WARNING: LINUX_VERSION_CODE
 should be avoided, code should be for the version to which it is merged
Message-ID: <202309170636.cDRalFP6-lkp@intel.com>
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
TO: steven@liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 6.6/zen-sauce
head:   de10967a8b79627cbe295d7331f84fc9cff3bcef
commit: 9a71ba5a47d70f90d20fdb9cc6070a71cd74315a [2/32] ZEN: Add VHBA driver
:::::: branch date: 6 hours ago
:::::: commit date: 7 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309170636.cDRalFP6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309170636.cDRalFP6-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#43: 
new file mode 100644

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#73: drivers/scsi/vhba/vhba.c:1:
+/*

ERROR: Do not include the paragraph about writing to the Free Software Foundation's mailing address from the sample GPL notice. The FSF has changed addresses in the past, and may do so again. Linux already includes a copy of the GPL.
#89: drivers/scsi/vhba/vhba.c:17:
+ * with this program; if not, write to the Free Software Foundation, Inc.,$

ERROR: Do not include the paragraph about writing to the Free Software Foundation's mailing address from the sample GPL notice. The FSF has changed addresses in the past, and may do so again. Linux already includes a copy of the GPL.
#90: drivers/scsi/vhba/vhba.c:18:
+ * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.$

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#101: drivers/scsi/vhba/vhba.c:29:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 11, 0)

WARNING: Comparisons should place the constant on the right side of the test
#101: drivers/scsi/vhba/vhba.c:29:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 11, 0)

WARNING: Use #include <linux/uaccess.h> instead of <asm/uaccess.h>
#114: drivers/scsi/vhba/vhba.c:42:
+#include <asm/uaccess.h>

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#128: drivers/scsi/vhba/vhba.c:56:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 15, 0)

WARNING: Comparisons should place the constant on the right side of the test
#128: drivers/scsi/vhba/vhba.c:56:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 15, 0)

WARNING: please, no spaces at the start of a line
#130: drivers/scsi/vhba/vhba.c:58:
+    dev_dbg(&(sdev)->sdev_gendev, fmt, ##a)$

WARNING: please, no spaces at the start of a line
#132: drivers/scsi/vhba/vhba.c:60:
+    dev_dbg(&(scmd)->device->sdev_gendev, fmt, ##a)$

WARNING: please, no spaces at the start of a line
#150: drivers/scsi/vhba/vhba.c:78:
+    VHBA_REQ_FREE,$

WARNING: please, no spaces at the start of a line
#151: drivers/scsi/vhba/vhba.c:79:
+    VHBA_REQ_PENDING,$

WARNING: please, no spaces at the start of a line
#152: drivers/scsi/vhba/vhba.c:80:
+    VHBA_REQ_READING,$

WARNING: please, no spaces at the start of a line
#153: drivers/scsi/vhba/vhba.c:81:
+    VHBA_REQ_SENT,$

WARNING: please, no spaces at the start of a line
#154: drivers/scsi/vhba/vhba.c:82:
+    VHBA_REQ_WRITING,$

WARNING: please, no spaces at the start of a line
#158: drivers/scsi/vhba/vhba.c:86:
+    struct scsi_cmnd *cmd;$

WARNING: Block comments use * on subsequent lines
#160: drivers/scsi/vhba/vhba.c:88:
+    /* metatags are per-host. not to be confused with
+       queue tags that are usually per-lun */

WARNING: Block comments use a trailing */ on a separate line
#160: drivers/scsi/vhba/vhba.c:88:
+       queue tags that are usually per-lun */

WARNING: please, no spaces at the start of a line
#161: drivers/scsi/vhba/vhba.c:89:
+    unsigned long metatag;$

WARNING: please, no spaces at the start of a line
#162: drivers/scsi/vhba/vhba.c:90:
+    int status;$

WARNING: please, no spaces at the start of a line
#163: drivers/scsi/vhba/vhba.c:91:
+    struct list_head entry;$

WARNING: please, no spaces at the start of a line
#167: drivers/scsi/vhba/vhba.c:95:
+    unsigned int num;$

WARNING: please, no spaces at the start of a line
#168: drivers/scsi/vhba/vhba.c:96:
+    spinlock_t cmd_lock;$

WARNING: please, no spaces at the start of a line
#169: drivers/scsi/vhba/vhba.c:97:
+    struct list_head cmd_list;$

WARNING: please, no spaces at the start of a line
#170: drivers/scsi/vhba/vhba.c:98:
+    wait_queue_head_t cmd_wq;$

WARNING: please, no spaces at the start of a line
#171: drivers/scsi/vhba/vhba.c:99:
+    atomic_t refcnt;$

WARNING: please, no spaces at the start of a line
#173: drivers/scsi/vhba/vhba.c:101:
+    unsigned char *kbuf;$

WARNING: please, no spaces at the start of a line
#174: drivers/scsi/vhba/vhba.c:102:
+    size_t kbuf_size;$

WARNING: please, no spaces at the start of a line
#178: drivers/scsi/vhba/vhba.c:106:
+    struct Scsi_Host *shost;$

WARNING: please, no spaces at the start of a line
#179: drivers/scsi/vhba/vhba.c:107:
+    spinlock_t cmd_lock;$

WARNING: please, no spaces at the start of a line
#180: drivers/scsi/vhba/vhba.c:108:
+    int cmd_next;$

WARNING: please, no spaces at the start of a line
#181: drivers/scsi/vhba/vhba.c:109:
+    struct vhba_command *commands;$

WARNING: please, no spaces at the start of a line
#182: drivers/scsi/vhba/vhba.c:110:
+    spinlock_t dev_lock;$

WARNING: please, no spaces at the start of a line
#183: drivers/scsi/vhba/vhba.c:111:
+    struct vhba_device *devices[VHBA_MAX_DEVICES];$

WARNING: please, no spaces at the start of a line
#184: drivers/scsi/vhba/vhba.c:112:
+    int num_devices;$

WARNING: please, no spaces at the start of a line
#185: drivers/scsi/vhba/vhba.c:113:
+    DECLARE_BITMAP(chgmap, VHBA_MAX_DEVICES);$

WARNING: please, no spaces at the start of a line
#186: drivers/scsi/vhba/vhba.c:114:
+    int chgtype[VHBA_MAX_DEVICES];$

WARNING: please, no spaces at the start of a line
#187: drivers/scsi/vhba/vhba.c:115:
+    struct work_struct scan_devices;$

WARNING: please, no spaces at the start of a line
#193: drivers/scsi/vhba/vhba.c:121:
+    __u32 metatag;$

WARNING: please, no spaces at the start of a line
#194: drivers/scsi/vhba/vhba.c:122:
+    __u32 lun;$

WARNING: please, no spaces at the start of a line
#195: drivers/scsi/vhba/vhba.c:123:
+    __u8 cdb[MAX_COMMAND_SIZE];$

WARNING: please, no spaces at the start of a line
#196: drivers/scsi/vhba/vhba.c:124:
+    __u8 cdb_len;$

WARNING: please, no spaces at the start of a line
#197: drivers/scsi/vhba/vhba.c:125:
+    __u32 data_len;$

WARNING: please, no spaces at the start of a line
#201: drivers/scsi/vhba/vhba.c:129:
+    __u32 metatag;$

WARNING: please, no spaces at the start of a line
#202: drivers/scsi/vhba/vhba.c:130:
+    __u32 status;$

WARNING: please, no spaces at the start of a line
#203: drivers/scsi/vhba/vhba.c:131:
+    __u32 data_len;$

WARNING: space prohibited between function name and open parenthesis '('
#208: drivers/scsi/vhba/vhba.c:136:
+struct vhba_command *vhba_alloc_command (void);

WARNING: space prohibited between function name and open parenthesis '('
#209: drivers/scsi/vhba/vhba.c:137:
+void vhba_free_command (struct vhba_command *vcmd);

WARNING: externs should be avoided in .c files
#209: drivers/scsi/vhba/vhba.c:137:
+void vhba_free_command (struct vhba_command *vcmd);

WARNING: Block comments use * on subsequent lines
#216: drivers/scsi/vhba/vhba.c:144:
+/* These functions define a symmetric 1:1 mapping between device numbers and
+   the bus and id. We have reserved the last id per bus for the host itself. */

WARNING: Block comments use a trailing */ on a separate line
#216: drivers/scsi/vhba/vhba.c:144:
+   the bus and id. We have reserved the last id per bus for the host itself. */

WARNING: please, no spaces at the start of a line
#219: drivers/scsi/vhba/vhba.c:147:
+    *bus = devnum / (VHBA_MAX_ID-1);$

WARNING: please, no spaces at the start of a line
#220: drivers/scsi/vhba/vhba.c:148:
+    *id  = devnum % (VHBA_MAX_ID-1);$

WARNING: please, no spaces at the start of a line
#225: drivers/scsi/vhba/vhba.c:153:
+    return (bus * (VHBA_MAX_ID-1)) + id;$

WARNING: space prohibited between function name and open parenthesis '('
#228: drivers/scsi/vhba/vhba.c:156:
+struct vhba_device *vhba_device_alloc (void)

WARNING: please, no spaces at the start of a line
#230: drivers/scsi/vhba/vhba.c:158:
+    struct vhba_device *vdev;$

WARNING: please, no spaces at the start of a line
#232: drivers/scsi/vhba/vhba.c:160:
+    vdev = kzalloc(sizeof(struct vhba_device), GFP_KERNEL);$

WARNING: please, no spaces at the start of a line
#233: drivers/scsi/vhba/vhba.c:161:
+    if (!vdev) {$

WARNING: braces {} are not necessary for single statement blocks
#233: drivers/scsi/vhba/vhba.c:161:
+    if (!vdev) {
+        return NULL;
+    }

ERROR: code indent should use tabs where possible
#234: drivers/scsi/vhba/vhba.c:162:
+        return NULL;$

WARNING: please, no spaces at the start of a line
#234: drivers/scsi/vhba/vhba.c:162:
+        return NULL;$

WARNING: please, no spaces at the start of a line
#235: drivers/scsi/vhba/vhba.c:163:
+    }$

WARNING: please, no spaces at the start of a line
#237: drivers/scsi/vhba/vhba.c:165:
+    spin_lock_init(&vdev->cmd_lock);$

WARNING: please, no spaces at the start of a line
#238: drivers/scsi/vhba/vhba.c:166:
+    INIT_LIST_HEAD(&vdev->cmd_list);$

WARNING: please, no spaces at the start of a line
#239: drivers/scsi/vhba/vhba.c:167:
+    init_waitqueue_head(&vdev->cmd_wq);$

WARNING: please, no spaces at the start of a line
#240: drivers/scsi/vhba/vhba.c:168:
+    atomic_set(&vdev->refcnt, 1);$

WARNING: please, no spaces at the start of a line
#242: drivers/scsi/vhba/vhba.c:170:
+    vdev->kbuf = NULL;$

WARNING: please, no spaces at the start of a line
#243: drivers/scsi/vhba/vhba.c:171:
+    vdev->kbuf_size = 0;$

WARNING: please, no spaces at the start of a line
#245: drivers/scsi/vhba/vhba.c:173:
+    return vdev;$

WARNING: space prohibited between function name and open parenthesis '('
#248: drivers/scsi/vhba/vhba.c:176:
+void vhba_device_put (struct vhba_device *vdev)

WARNING: please, no spaces at the start of a line
#250: drivers/scsi/vhba/vhba.c:178:
+    if (atomic_dec_and_test(&vdev->refcnt)) {$

WARNING: braces {} are not necessary for single statement blocks
#250: drivers/scsi/vhba/vhba.c:178:
+    if (atomic_dec_and_test(&vdev->refcnt)) {
+        kfree(vdev);
+    }

ERROR: code indent should use tabs where possible
#251: drivers/scsi/vhba/vhba.c:179:
+        kfree(vdev);$

WARNING: please, no spaces at the start of a line
#251: drivers/scsi/vhba/vhba.c:179:
+        kfree(vdev);$

WARNING: please, no spaces at the start of a line
#252: drivers/scsi/vhba/vhba.c:180:
+    }$

WARNING: space prohibited between function name and open parenthesis '('
#255: drivers/scsi/vhba/vhba.c:183:
+struct vhba_device *vhba_device_get (struct vhba_device *vdev)

WARNING: please, no spaces at the start of a line
#257: drivers/scsi/vhba/vhba.c:185:
+    atomic_inc(&vdev->refcnt);$

WARNING: please, no spaces at the start of a line
#259: drivers/scsi/vhba/vhba.c:187:
+    return vdev;$

WARNING: space prohibited between function name and open parenthesis '('
#262: drivers/scsi/vhba/vhba.c:190:
+int vhba_device_queue (struct vhba_device *vdev, struct scsi_cmnd *cmd)

WARNING: please, no spaces at the start of a line
#264: drivers/scsi/vhba/vhba.c:192:
+    struct vhba_host *vhost;$

WARNING: please, no spaces at the start of a line
#265: drivers/scsi/vhba/vhba.c:193:
+    struct vhba_command *vcmd;$

WARNING: please, no spaces at the start of a line
#266: drivers/scsi/vhba/vhba.c:194:
+    unsigned long flags;$

WARNING: please, no spaces at the start of a line
#268: drivers/scsi/vhba/vhba.c:196:
+    vhost = platform_get_drvdata(&vhba_platform_device);$

WARNING: please, no spaces at the start of a line
#270: drivers/scsi/vhba/vhba.c:198:
+    vcmd = vhba_alloc_command();$

WARNING: please, no spaces at the start of a line
#271: drivers/scsi/vhba/vhba.c:199:
+    if (!vcmd) {$

WARNING: braces {} are not necessary for single statement blocks
#271: drivers/scsi/vhba/vhba.c:199:
+    if (!vcmd) {
+        return SCSI_MLQUEUE_HOST_BUSY;
+    }

ERROR: code indent should use tabs where possible
#272: drivers/scsi/vhba/vhba.c:200:
+        return SCSI_MLQUEUE_HOST_BUSY;$

WARNING: please, no spaces at the start of a line
#272: drivers/scsi/vhba/vhba.c:200:
+        return SCSI_MLQUEUE_HOST_BUSY;$

WARNING: please, no spaces at the start of a line
#273: drivers/scsi/vhba/vhba.c:201:
+    }$

WARNING: please, no spaces at the start of a line
#275: drivers/scsi/vhba/vhba.c:203:
+    vcmd->cmd = cmd;$

WARNING: please, no spaces at the start of a line
#277: drivers/scsi/vhba/vhba.c:205:
+    spin_lock_irqsave(&vdev->cmd_lock, flags);$

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#278: drivers/scsi/vhba/vhba.c:206:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 15, 0)

WARNING: Comparisons should place the constant on the right side of the test
#278: drivers/scsi/vhba/vhba.c:206:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 15, 0)

WARNING: please, no spaces at the start of a line
#279: drivers/scsi/vhba/vhba.c:207:
+    vcmd->metatag = scsi_cmd_to_rq(vcmd->cmd)->tag;$

WARNING: please, no spaces at the start of a line
#281: drivers/scsi/vhba/vhba.c:209:
+    vcmd->metatag = vcmd->cmd->request->tag;$

WARNING: please, no spaces at the start of a line
#283: drivers/scsi/vhba/vhba.c:211:
+    list_add_tail(&vcmd->entry, &vdev->cmd_list);$

WARNING: please, no spaces at the start of a line
#284: drivers/scsi/vhba/vhba.c:212:
+    spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#286: drivers/scsi/vhba/vhba.c:214:
+    wake_up_interruptible(&vdev->cmd_wq);$

WARNING: please, no spaces at the start of a line
#288: drivers/scsi/vhba/vhba.c:216:
+    return 0;$

WARNING: space prohibited between function name and open parenthesis '('
#291: drivers/scsi/vhba/vhba.c:219:
+int vhba_device_dequeue (struct vhba_device *vdev, struct scsi_cmnd *cmd)

WARNING: please, no spaces at the start of a line
#293: drivers/scsi/vhba/vhba.c:221:
+    struct vhba_command *vcmd;$

WARNING: please, no spaces at the start of a line
#294: drivers/scsi/vhba/vhba.c:222:
+    int retval;$

WARNING: please, no spaces at the start of a line
#295: drivers/scsi/vhba/vhba.c:223:
+    unsigned long flags;$

WARNING: please, no spaces at the start of a line
#297: drivers/scsi/vhba/vhba.c:225:
+    spin_lock_irqsave(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#298: drivers/scsi/vhba/vhba.c:226:
+    list_for_each_entry(vcmd, &vdev->cmd_list, entry) {$

ERROR: code indent should use tabs where possible
#299: drivers/scsi/vhba/vhba.c:227:
+        if (vcmd->cmd == cmd) {$

WARNING: please, no spaces at the start of a line
#299: drivers/scsi/vhba/vhba.c:227:
+        if (vcmd->cmd == cmd) {$

WARNING: suspect code indent for conditional statements (8, 12)
#299: drivers/scsi/vhba/vhba.c:227:
+        if (vcmd->cmd == cmd) {
+            list_del_init(&vcmd->entry);

ERROR: code indent should use tabs where possible
#300: drivers/scsi/vhba/vhba.c:228:
+            list_del_init(&vcmd->entry);$

WARNING: please, no spaces at the start of a line
#300: drivers/scsi/vhba/vhba.c:228:
+            list_del_init(&vcmd->entry);$

ERROR: code indent should use tabs where possible
#301: drivers/scsi/vhba/vhba.c:229:
+            break;$

WARNING: please, no spaces at the start of a line
#301: drivers/scsi/vhba/vhba.c:229:
+            break;$

ERROR: code indent should use tabs where possible
#302: drivers/scsi/vhba/vhba.c:230:
+        }$

WARNING: please, no spaces at the start of a line
#302: drivers/scsi/vhba/vhba.c:230:
+        }$

WARNING: please, no spaces at the start of a line
#303: drivers/scsi/vhba/vhba.c:231:
+    }$

WARNING: please, no spaces at the start of a line
#306: drivers/scsi/vhba/vhba.c:234:
+    if (&vcmd->entry == &vdev->cmd_list) {$

ERROR: code indent should use tabs where possible
#307: drivers/scsi/vhba/vhba.c:235:
+        spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#307: drivers/scsi/vhba/vhba.c:235:
+        spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

ERROR: code indent should use tabs where possible
#308: drivers/scsi/vhba/vhba.c:236:
+        return SUCCESS;$

WARNING: please, no spaces at the start of a line
#308: drivers/scsi/vhba/vhba.c:236:
+        return SUCCESS;$

WARNING: please, no spaces at the start of a line
#309: drivers/scsi/vhba/vhba.c:237:
+    }$

WARNING: please, no spaces at the start of a line
#311: drivers/scsi/vhba/vhba.c:239:
+    while (vcmd->status == VHBA_REQ_READING || vcmd->status == VHBA_REQ_WRITING) {$

ERROR: code indent should use tabs where possible
#312: drivers/scsi/vhba/vhba.c:240:
+        spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#312: drivers/scsi/vhba/vhba.c:240:
+        spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

ERROR: code indent should use tabs where possible
#313: drivers/scsi/vhba/vhba.c:241:
+        scmd_dbg(cmd, "wait for I/O before aborting\n");$

WARNING: please, no spaces at the start of a line
#313: drivers/scsi/vhba/vhba.c:241:
+        scmd_dbg(cmd, "wait for I/O before aborting\n");$

ERROR: code indent should use tabs where possible
#314: drivers/scsi/vhba/vhba.c:242:
+        schedule_timeout(1);$

WARNING: please, no spaces at the start of a line
#314: drivers/scsi/vhba/vhba.c:242:
+        schedule_timeout(1);$

ERROR: code indent should use tabs where possible
#315: drivers/scsi/vhba/vhba.c:243:
+        spin_lock_irqsave(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#315: drivers/scsi/vhba/vhba.c:243:
+        spin_lock_irqsave(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#316: drivers/scsi/vhba/vhba.c:244:
+    }$

WARNING: please, no spaces at the start of a line
#318: drivers/scsi/vhba/vhba.c:246:
+    retval = (vcmd->status == VHBA_REQ_SENT) ? FAILED : SUCCESS;$

WARNING: please, no spaces at the start of a line
#320: drivers/scsi/vhba/vhba.c:248:
+    vhba_free_command(vcmd);$

WARNING: please, no spaces at the start of a line
#322: drivers/scsi/vhba/vhba.c:250:
+    spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#324: drivers/scsi/vhba/vhba.c:252:
+    return retval;$

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#327: drivers/scsi/vhba/vhba.c:255:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0)

WARNING: Comparisons should place the constant on the right side of the test
#327: drivers/scsi/vhba/vhba.c:255:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0)

WARNING: please, no spaces at the start of a line
#330: drivers/scsi/vhba/vhba.c:258:
+    struct Scsi_Host *shost = sdev->host;$

WARNING: please, no spaces at the start of a line
#332: drivers/scsi/vhba/vhba.c:260:
+    sdev_dbg(sdev, "enabling tagging (queue depth: %i).\n", sdev->queue_depth);$

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#333: drivers/scsi/vhba/vhba.c:261:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 17, 0)

WARNING: Comparisons should place the constant on the right side of the test
#333: drivers/scsi/vhba/vhba.c:261:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 17, 0)

WARNING: please, no spaces at the start of a line
#334: drivers/scsi/vhba/vhba.c:262:
+    if (!shost_use_blk_mq(shost) && shost->bqt) {$

WARNING: please, no spaces at the start of a line
#336: drivers/scsi/vhba/vhba.c:264:
+    if (shost->bqt) {$

ERROR: code indent should use tabs where possible
#338: drivers/scsi/vhba/vhba.c:266:
+        blk_queue_init_tags(sdev->request_queue, sdev->queue_depth, shost->bqt);$

WARNING: please, no spaces at the start of a line
#338: drivers/scsi/vhba/vhba.c:266:
+        blk_queue_init_tags(sdev->request_queue, sdev->queue_depth, shost->bqt);$

WARNING: please, no spaces at the start of a line
#339: drivers/scsi/vhba/vhba.c:267:
+    }$

WARNING: please, no spaces at the start of a line
#340: drivers/scsi/vhba/vhba.c:268:
+    scsi_adjust_queue_depth(sdev, 0, sdev->queue_depth);$

WARNING: please, no spaces at the start of a line
#342: drivers/scsi/vhba/vhba.c:270:
+    return 0;$

WARNING: space prohibited between function name and open parenthesis '('
#346: drivers/scsi/vhba/vhba.c:274:
+void vhba_scan_devices_add (struct vhba_host *vhost, int bus, int id)

WARNING: please, no spaces at the start of a line
#348: drivers/scsi/vhba/vhba.c:276:
+    struct scsi_device *sdev;$

WARNING: please, no spaces at the start of a line
#350: drivers/scsi/vhba/vhba.c:278:
+    sdev = scsi_device_lookup(vhost->shost, bus, id, 0);$

WARNING: please, no spaces at the start of a line
#351: drivers/scsi/vhba/vhba.c:279:
+    if (!sdev) {$

ERROR: code indent should use tabs where possible
#352: drivers/scsi/vhba/vhba.c:280:
+        scsi_add_device(vhost->shost, bus, id, 0);$

WARNING: please, no spaces at the start of a line
#352: drivers/scsi/vhba/vhba.c:280:
+        scsi_add_device(vhost->shost, bus, id, 0);$

WARNING: please, no spaces at the start of a line
#353: drivers/scsi/vhba/vhba.c:281:
+    } else {$

WARNING: line length of 109 exceeds 100 columns
#354: drivers/scsi/vhba/vhba.c:282:
+        dev_warn(&vhost->shost->shost_gendev, "tried to add an already-existing device %d:0!\n", bus, id);

ERROR: code indent should use tabs where possible
#354: drivers/scsi/vhba/vhba.c:282:
+        dev_warn(&vhost->shost->shost_gendev, "tried to add an already-existing device %d:0!\n", bus, id);$

WARNING: please, no spaces at the start of a line
#354: drivers/scsi/vhba/vhba.c:282:
+        dev_warn(&vhost->shost->shost_gendev, "tried to add an already-existing device %d:0!\n", bus, id);$

ERROR: code indent should use tabs where possible
#355: drivers/scsi/vhba/vhba.c:283:
+        scsi_device_put(sdev);$

WARNING: please, no spaces at the start of a line
#355: drivers/scsi/vhba/vhba.c:283:
+        scsi_device_put(sdev);$

WARNING: please, no spaces at the start of a line
#356: drivers/scsi/vhba/vhba.c:284:
+    }$

WARNING: space prohibited between function name and open parenthesis '('
#359: drivers/scsi/vhba/vhba.c:287:
+void vhba_scan_devices_remove (struct vhba_host *vhost, int bus, int id)

WARNING: please, no spaces at the start of a line
#361: drivers/scsi/vhba/vhba.c:289:
+    struct scsi_device *sdev;$

WARNING: please, no spaces at the start of a line
#363: drivers/scsi/vhba/vhba.c:291:
+    sdev = scsi_device_lookup(vhost->shost, bus, id, 0);$

WARNING: please, no spaces at the start of a line
#364: drivers/scsi/vhba/vhba.c:292:
+    if (sdev) {$

ERROR: code indent should use tabs where possible
#365: drivers/scsi/vhba/vhba.c:293:
+        scsi_remove_device(sdev);$

WARNING: please, no spaces at the start of a line
#365: drivers/scsi/vhba/vhba.c:293:
+        scsi_remove_device(sdev);$

ERROR: code indent should use tabs where possible
#366: drivers/scsi/vhba/vhba.c:294:
+        scsi_device_put(sdev);$

WARNING: please, no spaces at the start of a line
#366: drivers/scsi/vhba/vhba.c:294:
+        scsi_device_put(sdev);$

WARNING: please, no spaces at the start of a line
#367: drivers/scsi/vhba/vhba.c:295:
+    } else {$

WARNING: line length of 105 exceeds 100 columns
#368: drivers/scsi/vhba/vhba.c:296:
+        dev_warn(&vhost->shost->shost_gendev, "tried to remove non-existing device %d:0!\n", bus, id);

ERROR: code indent should use tabs where possible
#368: drivers/scsi/vhba/vhba.c:296:
+        dev_warn(&vhost->shost->shost_gendev, "tried to remove non-existing device %d:0!\n", bus, id);$

WARNING: please, no spaces at the start of a line
#368: drivers/scsi/vhba/vhba.c:296:
+        dev_warn(&vhost->shost->shost_gendev, "tried to remove non-existing device %d:0!\n", bus, id);$

WARNING: please, no spaces at the start of a line
#369: drivers/scsi/vhba/vhba.c:297:
+    }$

WARNING: space prohibited between function name and open parenthesis '('
#372: drivers/scsi/vhba/vhba.c:300:
+void vhba_scan_devices (struct work_struct *work)

WARNING: please, no spaces at the start of a line
#374: drivers/scsi/vhba/vhba.c:302:
+    struct vhba_host *vhost = container_of(work, struct vhba_host, scan_devices);$

WARNING: please, no spaces at the start of a line
#375: drivers/scsi/vhba/vhba.c:303:
+    unsigned long flags;$

WARNING: please, no spaces at the start of a line
#376: drivers/scsi/vhba/vhba.c:304:
+    int change, exists;$

WARNING: please, no spaces at the start of a line
#377: drivers/scsi/vhba/vhba.c:305:
+    unsigned int devnum;$

WARNING: please, no spaces at the start of a line
#378: drivers/scsi/vhba/vhba.c:306:
+    unsigned int bus, id;$

WARNING: please, no spaces at the start of a line
#380: drivers/scsi/vhba/vhba.c:308:
+    for (;;) {$

ERROR: code indent should use tabs where possible
#381: drivers/scsi/vhba/vhba.c:309:
+        spin_lock_irqsave(&vhost->dev_lock, flags);$

WARNING: please, no spaces at the start of a line
#381: drivers/scsi/vhba/vhba.c:309:
+        spin_lock_irqsave(&vhost->dev_lock, flags);$

ERROR: code indent should use tabs where possible
#383: drivers/scsi/vhba/vhba.c:311:
+        devnum = find_first_bit(vhost->chgmap, VHBA_MAX_DEVICES);$

WARNING: please, no spaces at the start of a line
#383: drivers/scsi/vhba/vhba.c:311:
+        devnum = find_first_bit(vhost->chgmap, VHBA_MAX_DEVICES);$

ERROR: code indent should use tabs where possible
#384: drivers/scsi/vhba/vhba.c:312:
+        if (devnum >= VHBA_MAX_DEVICES) {$

WARNING: please, no spaces at the start of a line
#384: drivers/scsi/vhba/vhba.c:312:
+        if (devnum >= VHBA_MAX_DEVICES) {$

WARNING: suspect code indent for conditional statements (8, 12)
#384: drivers/scsi/vhba/vhba.c:312:
+        if (devnum >= VHBA_MAX_DEVICES) {
+            spin_unlock_irqrestore(&vhost->dev_lock, flags);

ERROR: code indent should use tabs where possible
#385: drivers/scsi/vhba/vhba.c:313:
+            spin_unlock_irqrestore(&vhost->dev_lock, flags);$

WARNING: please, no spaces at the start of a line
#385: drivers/scsi/vhba/vhba.c:313:
+            spin_unlock_irqrestore(&vhost->dev_lock, flags);$

ERROR: code indent should use tabs where possible
#386: drivers/scsi/vhba/vhba.c:314:
+            break;$

WARNING: please, no spaces at the start of a line
#386: drivers/scsi/vhba/vhba.c:314:
+            break;$

ERROR: code indent should use tabs where possible
#387: drivers/scsi/vhba/vhba.c:315:
+        }$

WARNING: please, no spaces at the start of a line
#387: drivers/scsi/vhba/vhba.c:315:
+        }$

ERROR: code indent should use tabs where possible
#388: drivers/scsi/vhba/vhba.c:316:
+        change = vhost->chgtype[devnum];$

WARNING: please, no spaces at the start of a line
#388: drivers/scsi/vhba/vhba.c:316:
+        change = vhost->chgtype[devnum];$

ERROR: code indent should use tabs where possible
#389: drivers/scsi/vhba/vhba.c:317:
+        exists = vhost->devices[devnum] != NULL;$

WARNING: please, no spaces at the start of a line
#389: drivers/scsi/vhba/vhba.c:317:
+        exists = vhost->devices[devnum] != NULL;$

ERROR: code indent should use tabs where possible
#391: drivers/scsi/vhba/vhba.c:319:
+        vhost->chgtype[devnum] = 0;$

WARNING: please, no spaces at the start of a line
#391: drivers/scsi/vhba/vhba.c:319:
+        vhost->chgtype[devnum] = 0;$

ERROR: code indent should use tabs where possible
#392: drivers/scsi/vhba/vhba.c:320:
+        clear_bit(devnum, vhost->chgmap);$

WARNING: please, no spaces at the start of a line
#392: drivers/scsi/vhba/vhba.c:320:
+        clear_bit(devnum, vhost->chgmap);$

ERROR: code indent should use tabs where possible
#394: drivers/scsi/vhba/vhba.c:322:
+        spin_unlock_irqrestore(&vhost->dev_lock, flags);$

WARNING: please, no spaces at the start of a line
#394: drivers/scsi/vhba/vhba.c:322:
+        spin_unlock_irqrestore(&vhost->dev_lock, flags);$

ERROR: code indent should use tabs where possible
#396: drivers/scsi/vhba/vhba.c:324:
+        devnum_to_bus_and_id(devnum, &bus, &id);$

WARNING: please, no spaces at the start of a line
#396: drivers/scsi/vhba/vhba.c:324:
+        devnum_to_bus_and_id(devnum, &bus, &id);$

ERROR: code indent should use tabs where possible
#398: drivers/scsi/vhba/vhba.c:326:
+        if (change < 0) {$

WARNING: please, no spaces at the start of a line
#398: drivers/scsi/vhba/vhba.c:326:
+        if (change < 0) {$

WARNING: suspect code indent for conditional statements (8, 12)
#398: drivers/scsi/vhba/vhba.c:326:
+        if (change < 0) {
+            dev_dbg(&vhost->shost->shost_gendev, "trying to remove target %d:0\n", bus, id);

ERROR: code indent should use tabs where possible
#399: drivers/scsi/vhba/vhba.c:327:
+            dev_dbg(&vhost->shost->shost_gendev, "trying to remove target %d:0\n", bus, id);$

WARNING: please, no spaces at the start of a line
#399: drivers/scsi/vhba/vhba.c:327:
+            dev_dbg(&vhost->shost->shost_gendev, "trying to remove target %d:0\n", bus, id);$

ERROR: code indent should use tabs where possible
#400: drivers/scsi/vhba/vhba.c:328:
+            vhba_scan_devices_remove(vhost, bus, id);$

WARNING: please, no spaces at the start of a line
#400: drivers/scsi/vhba/vhba.c:328:
+            vhba_scan_devices_remove(vhost, bus, id);$

ERROR: code indent should use tabs where possible
#401: drivers/scsi/vhba/vhba.c:329:
+        } else if (change > 0) {$

WARNING: please, no spaces at the start of a line
#401: drivers/scsi/vhba/vhba.c:329:
+        } else if (change > 0) {$

WARNING: suspect code indent for conditional statements (8, 12)
#401: drivers/scsi/vhba/vhba.c:329:
+        } else if (change > 0) {
+            dev_dbg(&vhost->shost->shost_gendev, "trying to add target %d:0\n", bus, id);

ERROR: code indent should use tabs where possible
#402: drivers/scsi/vhba/vhba.c:330:
+            dev_dbg(&vhost->shost->shost_gendev, "trying to add target %d:0\n", bus, id);$

WARNING: please, no spaces at the start of a line
#402: drivers/scsi/vhba/vhba.c:330:
+            dev_dbg(&vhost->shost->shost_gendev, "trying to add target %d:0\n", bus, id);$

ERROR: code indent should use tabs where possible
#403: drivers/scsi/vhba/vhba.c:331:
+            vhba_scan_devices_add(vhost, bus, id);$

WARNING: please, no spaces at the start of a line
#403: drivers/scsi/vhba/vhba.c:331:
+            vhba_scan_devices_add(vhost, bus, id);$

ERROR: code indent should use tabs where possible
#404: drivers/scsi/vhba/vhba.c:332:
+        } else {$

WARNING: please, no spaces at the start of a line
#404: drivers/scsi/vhba/vhba.c:332:
+        } else {$

WARNING: suspect code indent for conditional statements (8, 12)
#404: drivers/scsi/vhba/vhba.c:332:
+        } else {
[...]
+            if (exists) {

ERROR: code indent should use tabs where possible
#405: drivers/scsi/vhba/vhba.c:333:
+            /* quick sequence of add/remove or remove/add; we determine$

ERROR: code indent should use tabs where possible
#406: drivers/scsi/vhba/vhba.c:334:
+               which one it was by checking if device structure exists */$

WARNING: Block comments use * on subsequent lines
#406: drivers/scsi/vhba/vhba.c:334:
+            /* quick sequence of add/remove or remove/add; we determine
+               which one it was by checking if device structure exists */

WARNING: Block comments use a trailing */ on a separate line
#406: drivers/scsi/vhba/vhba.c:334:
+               which one it was by checking if device structure exists */

ERROR: code indent should use tabs where possible
#407: drivers/scsi/vhba/vhba.c:335:
+            if (exists) {$

WARNING: please, no spaces at the start of a line
#407: drivers/scsi/vhba/vhba.c:335:
+            if (exists) {$

ERROR: code indent should use tabs where possible
#408: drivers/scsi/vhba/vhba.c:336:
+                /* remove followed by add: remove and (re)add */$

ERROR: code indent should use tabs where possible
#409: drivers/scsi/vhba/vhba.c:337:
+                dev_dbg(&vhost->shost->shost_gendev, "trying to (re)add target %d:0\n", bus, id);$

WARNING: please, no spaces at the start of a line
#409: drivers/scsi/vhba/vhba.c:337:
+                dev_dbg(&vhost->shost->shost_gendev, "trying to (re)add target %d:0\n", bus, id);$

ERROR: code indent should use tabs where possible
#410: drivers/scsi/vhba/vhba.c:338:
+                vhba_scan_devices_remove(vhost, bus, id);$

WARNING: please, no spaces at the start of a line
#410: drivers/scsi/vhba/vhba.c:338:
+                vhba_scan_devices_remove(vhost, bus, id);$

ERROR: code indent should use tabs where possible
#411: drivers/scsi/vhba/vhba.c:339:
+                vhba_scan_devices_add(vhost, bus, id);$

WARNING: please, no spaces at the start of a line
#411: drivers/scsi/vhba/vhba.c:339:
+                vhba_scan_devices_add(vhost, bus, id);$

ERROR: code indent should use tabs where possible
#412: drivers/scsi/vhba/vhba.c:340:
+            } else {$

WARNING: please, no spaces at the start of a line
#412: drivers/scsi/vhba/vhba.c:340:
+            } else {$

ERROR: code indent should use tabs where possible
#413: drivers/scsi/vhba/vhba.c:341:
+                /* add followed by remove: no-op */$

ERROR: code indent should use tabs where possible
#414: drivers/scsi/vhba/vhba.c:342:
+                dev_dbg(&vhost->shost->shost_gendev, "no-op for target %d:0\n", bus, id);$

WARNING: please, no spaces at the start of a line
#414: drivers/scsi/vhba/vhba.c:342:
+                dev_dbg(&vhost->shost->shost_gendev, "no-op for target %d:0\n", bus, id);$

ERROR: code indent should use tabs where possible
#415: drivers/scsi/vhba/vhba.c:343:
+            }$

WARNING: please, no spaces at the start of a line
#415: drivers/scsi/vhba/vhba.c:343:
+            }$

ERROR: code indent should use tabs where possible
#416: drivers/scsi/vhba/vhba.c:344:
+        }$

WARNING: please, no spaces at the start of a line
#416: drivers/scsi/vhba/vhba.c:344:
+        }$

WARNING: please, no spaces at the start of a line
#417: drivers/scsi/vhba/vhba.c:345:
+    }$

WARNING: space prohibited between function name and open parenthesis '('
#420: drivers/scsi/vhba/vhba.c:348:
+int vhba_add_device (struct vhba_device *vdev)

WARNING: please, no spaces at the start of a line
#422: drivers/scsi/vhba/vhba.c:350:
+    struct vhba_host *vhost;$

WARNING: please, no spaces at the start of a line
#423: drivers/scsi/vhba/vhba.c:351:
+    unsigned int devnum;$

WARNING: please, no spaces at the start of a line
#424: drivers/scsi/vhba/vhba.c:352:
+    unsigned long flags;$

WARNING: please, no spaces at the start of a line
#426: drivers/scsi/vhba/vhba.c:354:
+    vhost = platform_get_drvdata(&vhba_platform_device);$

WARNING: please, no spaces at the start of a line
#428: drivers/scsi/vhba/vhba.c:356:
+    vhba_device_get(vdev);$

WARNING: please, no spaces at the start of a line
#430: drivers/scsi/vhba/vhba.c:358:
+    spin_lock_irqsave(&vhost->dev_lock, flags);$

WARNING: please, no spaces at the start of a line
#431: drivers/scsi/vhba/vhba.c:359:
+    if (vhost->num_devices >= VHBA_MAX_DEVICES) {$

ERROR: code indent should use tabs where possible
#432: drivers/scsi/vhba/vhba.c:360:
+        spin_unlock_irqrestore(&vhost->dev_lock, flags);$

WARNING: please, no spaces at the start of a line
#432: drivers/scsi/vhba/vhba.c:360:
+        spin_unlock_irqrestore(&vhost->dev_lock, flags);$

ERROR: code indent should use tabs where possible
#433: drivers/scsi/vhba/vhba.c:361:
+        vhba_device_put(vdev);$

WARNING: please, no spaces at the start of a line
#433: drivers/scsi/vhba/vhba.c:361:
+        vhba_device_put(vdev);$

ERROR: code indent should use tabs where possible
#434: drivers/scsi/vhba/vhba.c:362:
+        return -EBUSY;$

WARNING: please, no spaces at the start of a line
#434: drivers/scsi/vhba/vhba.c:362:
+        return -EBUSY;$

WARNING: please, no spaces at the start of a line
#435: drivers/scsi/vhba/vhba.c:363:
+    }$

WARNING: please, no spaces at the start of a line
#437: drivers/scsi/vhba/vhba.c:365:
+    for (devnum = 0; devnum < VHBA_MAX_DEVICES; devnum++) {$

ERROR: code indent should use tabs where possible
#438: drivers/scsi/vhba/vhba.c:366:
+        if (vhost->devices[devnum] == NULL) {$

WARNING: please, no spaces at the start of a line
#438: drivers/scsi/vhba/vhba.c:366:
+        if (vhost->devices[devnum] == NULL) {$

WARNING: suspect code indent for conditional statements (8, 12)
#438: drivers/scsi/vhba/vhba.c:366:
+        if (vhost->devices[devnum] == NULL) {
+            vdev->num = devnum;

ERROR: code indent should use tabs where possible
#439: drivers/scsi/vhba/vhba.c:367:
+            vdev->num = devnum;$

WARNING: please, no spaces at the start of a line
#439: drivers/scsi/vhba/vhba.c:367:
+            vdev->num = devnum;$

ERROR: code indent should use tabs where possible
#440: drivers/scsi/vhba/vhba.c:368:
+            vhost->devices[devnum] = vdev;$

WARNING: please, no spaces at the start of a line
#440: drivers/scsi/vhba/vhba.c:368:
+            vhost->devices[devnum] = vdev;$

ERROR: code indent should use tabs where possible
#441: drivers/scsi/vhba/vhba.c:369:
+            vhost->num_devices++;$

WARNING: please, no spaces at the start of a line
#441: drivers/scsi/vhba/vhba.c:369:
+            vhost->num_devices++;$

ERROR: code indent should use tabs where possible
#442: drivers/scsi/vhba/vhba.c:370:
+            set_bit(devnum, vhost->chgmap);$

WARNING: please, no spaces at the start of a line
#442: drivers/scsi/vhba/vhba.c:370:
+            set_bit(devnum, vhost->chgmap);$

ERROR: code indent should use tabs where possible
#443: drivers/scsi/vhba/vhba.c:371:
+            vhost->chgtype[devnum]++;$

WARNING: please, no spaces at the start of a line
#443: drivers/scsi/vhba/vhba.c:371:
+            vhost->chgtype[devnum]++;$

ERROR: code indent should use tabs where possible
#444: drivers/scsi/vhba/vhba.c:372:
+            break;$

WARNING: please, no spaces at the start of a line
#444: drivers/scsi/vhba/vhba.c:372:
+            break;$

ERROR: code indent should use tabs where possible
#445: drivers/scsi/vhba/vhba.c:373:
+        }$

WARNING: please, no spaces at the start of a line
#445: drivers/scsi/vhba/vhba.c:373:
+        }$

WARNING: please, no spaces at the start of a line
#446: drivers/scsi/vhba/vhba.c:374:
+    }$

WARNING: please, no spaces at the start of a line
#447: drivers/scsi/vhba/vhba.c:375:
+    spin_unlock_irqrestore(&vhost->dev_lock, flags);$

WARNING: please, no spaces at the start of a line
#449: drivers/scsi/vhba/vhba.c:377:
+    schedule_work(&vhost->scan_devices);$

WARNING: please, no spaces at the start of a line
#451: drivers/scsi/vhba/vhba.c:379:
+    return 0;$

WARNING: space prohibited between function name and open parenthesis '('
#454: drivers/scsi/vhba/vhba.c:382:
+int vhba_remove_device (struct vhba_device *vdev)

WARNING: please, no spaces at the start of a line
#456: drivers/scsi/vhba/vhba.c:384:
+    struct vhba_host *vhost;$

WARNING: please, no spaces at the start of a line
#457: drivers/scsi/vhba/vhba.c:385:
+    unsigned long flags;$

WARNING: please, no spaces at the start of a line
#459: drivers/scsi/vhba/vhba.c:387:
+    vhost = platform_get_drvdata(&vhba_platform_device);$

WARNING: please, no spaces at the start of a line
#461: drivers/scsi/vhba/vhba.c:389:
+    spin_lock_irqsave(&vhost->dev_lock, flags);$

WARNING: please, no spaces at the start of a line
#462: drivers/scsi/vhba/vhba.c:390:
+    set_bit(vdev->num, vhost->chgmap);$

WARNING: please, no spaces at the start of a line
#463: drivers/scsi/vhba/vhba.c:391:
+    vhost->chgtype[vdev->num]--;$

WARNING: please, no spaces at the start of a line
#464: drivers/scsi/vhba/vhba.c:392:
+    vhost->devices[vdev->num] = NULL;$

WARNING: please, no spaces at the start of a line
#465: drivers/scsi/vhba/vhba.c:393:
+    vhost->num_devices--;$

WARNING: please, no spaces at the start of a line
#466: drivers/scsi/vhba/vhba.c:394:
+    spin_unlock_irqrestore(&vhost->dev_lock, flags);$

WARNING: please, no spaces at the start of a line
#468: drivers/scsi/vhba/vhba.c:396:
+    vhba_device_put(vdev);$

WARNING: please, no spaces at the start of a line
#470: drivers/scsi/vhba/vhba.c:398:
+    schedule_work(&vhost->scan_devices);$

WARNING: please, no spaces at the start of a line
#472: drivers/scsi/vhba/vhba.c:400:
+    return 0;$

WARNING: space prohibited between function name and open parenthesis '('
#475: drivers/scsi/vhba/vhba.c:403:
+struct vhba_device *vhba_lookup_device (int devnum)

WARNING: please, no spaces at the start of a line
#477: drivers/scsi/vhba/vhba.c:405:
+    struct vhba_host *vhost;$

WARNING: please, no spaces at the start of a line
#478: drivers/scsi/vhba/vhba.c:406:
+    struct vhba_device *vdev = NULL;$

WARNING: please, no spaces at the start of a line
#479: drivers/scsi/vhba/vhba.c:407:
+    unsigned long flags;$

WARNING: please, no spaces at the start of a line
#481: drivers/scsi/vhba/vhba.c:409:
+    vhost = platform_get_drvdata(&vhba_platform_device);$

WARNING: please, no spaces at the start of a line
#483: drivers/scsi/vhba/vhba.c:411:
+    if (likely(devnum < VHBA_MAX_DEVICES)) {$

ERROR: code indent should use tabs where possible
#484: drivers/scsi/vhba/vhba.c:412:
+        spin_lock_irqsave(&vhost->dev_lock, flags);$

WARNING: please, no spaces at the start of a line
#484: drivers/scsi/vhba/vhba.c:412:
+        spin_lock_irqsave(&vhost->dev_lock, flags);$

ERROR: code indent should use tabs where possible
#485: drivers/scsi/vhba/vhba.c:413:
+        vdev = vhost->devices[devnum];$

WARNING: please, no spaces at the start of a line
#485: drivers/scsi/vhba/vhba.c:413:
+        vdev = vhost->devices[devnum];$

ERROR: code indent should use tabs where possible
#486: drivers/scsi/vhba/vhba.c:414:
+        if (vdev) {$

WARNING: please, no spaces at the start of a line
#486: drivers/scsi/vhba/vhba.c:414:
+        if (vdev) {$

WARNING: suspect code indent for conditional statements (8, 12)
#486: drivers/scsi/vhba/vhba.c:414:
+        if (vdev) {
+            vdev = vhba_device_get(vdev);

WARNING: braces {} are not necessary for single statement blocks
#486: drivers/scsi/vhba/vhba.c:414:
+        if (vdev) {
+            vdev = vhba_device_get(vdev);
+        }

ERROR: code indent should use tabs where possible
#487: drivers/scsi/vhba/vhba.c:415:
+            vdev = vhba_device_get(vdev);$

WARNING: please, no spaces at the start of a line
#487: drivers/scsi/vhba/vhba.c:415:
+            vdev = vhba_device_get(vdev);$

ERROR: code indent should use tabs where possible
#488: drivers/scsi/vhba/vhba.c:416:
+        }$

WARNING: please, no spaces at the start of a line
#488: drivers/scsi/vhba/vhba.c:416:
+        }$

ERROR: code indent should use tabs where possible
#490: drivers/scsi/vhba/vhba.c:418:
+        spin_unlock_irqrestore(&vhost->dev_lock, flags);$

WARNING: please, no spaces at the start of a line
#490: drivers/scsi/vhba/vhba.c:418:
+        spin_unlock_irqrestore(&vhost->dev_lock, flags);$

WARNING: please, no spaces at the start of a line
#491: drivers/scsi/vhba/vhba.c:419:
+    }$

WARNING: please, no spaces at the start of a line
#493: drivers/scsi/vhba/vhba.c:421:
+    return vdev;$

WARNING: space prohibited between function name and open parenthesis '('
#496: drivers/scsi/vhba/vhba.c:424:
+struct vhba_command *vhba_alloc_command (void)

WARNING: please, no spaces at the start of a line
#498: drivers/scsi/vhba/vhba.c:426:
+    struct vhba_host *vhost;$

WARNING: please, no spaces at the start of a line
#499: drivers/scsi/vhba/vhba.c:427:
+    struct vhba_command *vcmd;$

WARNING: please, no spaces at the start of a line
#500: drivers/scsi/vhba/vhba.c:428:
+    unsigned long flags;$

WARNING: please, no spaces at the start of a line
#501: drivers/scsi/vhba/vhba.c:429:
+    int i;$

WARNING: please, no spaces at the start of a line
#503: drivers/scsi/vhba/vhba.c:431:
+    vhost = platform_get_drvdata(&vhba_platform_device);$

WARNING: please, no spaces at the start of a line
#505: drivers/scsi/vhba/vhba.c:433:
+    spin_lock_irqsave(&vhost->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#507: drivers/scsi/vhba/vhba.c:435:
+    vcmd = vhost->commands + vhost->cmd_next++;$

WARNING: please, no spaces at the start of a line
#508: drivers/scsi/vhba/vhba.c:436:
+    if (vcmd->status != VHBA_REQ_FREE) {$

ERROR: code indent should use tabs where possible
#509: drivers/scsi/vhba/vhba.c:437:
+        for (i = 0; i < vhba_can_queue; i++) {$

WARNING: please, no spaces at the start of a line
#509: drivers/scsi/vhba/vhba.c:437:
+        for (i = 0; i < vhba_can_queue; i++) {$

WARNING: suspect code indent for conditional statements (8, 12)
#509: drivers/scsi/vhba/vhba.c:437:
+        for (i = 0; i < vhba_can_queue; i++) {
+            vcmd = vhost->commands + i;

ERROR: code indent should use tabs where possible
#510: drivers/scsi/vhba/vhba.c:438:
+            vcmd = vhost->commands + i;$

WARNING: please, no spaces at the start of a line
#510: drivers/scsi/vhba/vhba.c:438:
+            vcmd = vhost->commands + i;$

ERROR: code indent should use tabs where possible
#512: drivers/scsi/vhba/vhba.c:440:
+            if (vcmd->status == VHBA_REQ_FREE) {$

WARNING: please, no spaces at the start of a line
#512: drivers/scsi/vhba/vhba.c:440:
+            if (vcmd->status == VHBA_REQ_FREE) {$

ERROR: code indent should use tabs where possible
#513: drivers/scsi/vhba/vhba.c:441:
+                vhost->cmd_next = i + 1;$

WARNING: please, no spaces at the start of a line
#513: drivers/scsi/vhba/vhba.c:441:
+                vhost->cmd_next = i + 1;$

ERROR: code indent should use tabs where possible
#514: drivers/scsi/vhba/vhba.c:442:
+                break;$

WARNING: please, no spaces at the start of a line
#514: drivers/scsi/vhba/vhba.c:442:
+                break;$

ERROR: code indent should use tabs where possible
#515: drivers/scsi/vhba/vhba.c:443:
+            }$

WARNING: please, no spaces at the start of a line
#515: drivers/scsi/vhba/vhba.c:443:
+            }$

ERROR: code indent should use tabs where possible
#516: drivers/scsi/vhba/vhba.c:444:
+        }$

WARNING: please, no spaces at the start of a line
#516: drivers/scsi/vhba/vhba.c:444:
+        }$

ERROR: code indent should use tabs where possible
#518: drivers/scsi/vhba/vhba.c:446:
+        if (i == vhba_can_queue) {$

WARNING: please, no spaces at the start of a line
#518: drivers/scsi/vhba/vhba.c:446:
+        if (i == vhba_can_queue) {$

WARNING: suspect code indent for conditional statements (8, 12)
#518: drivers/scsi/vhba/vhba.c:446:
+        if (i == vhba_can_queue) {
+            vcmd = NULL;

WARNING: braces {} are not necessary for single statement blocks
#518: drivers/scsi/vhba/vhba.c:446:
+        if (i == vhba_can_queue) {
+            vcmd = NULL;
+        }

ERROR: code indent should use tabs where possible
#519: drivers/scsi/vhba/vhba.c:447:
+            vcmd = NULL;$

WARNING: please, no spaces at the start of a line
#519: drivers/scsi/vhba/vhba.c:447:
+            vcmd = NULL;$

ERROR: code indent should use tabs where possible
#520: drivers/scsi/vhba/vhba.c:448:
+        }$

WARNING: please, no spaces at the start of a line
#520: drivers/scsi/vhba/vhba.c:448:
+        }$

WARNING: please, no spaces at the start of a line
#521: drivers/scsi/vhba/vhba.c:449:
+    }$

WARNING: please, no spaces at the start of a line
#523: drivers/scsi/vhba/vhba.c:451:
+    if (vcmd) {$

WARNING: braces {} are not necessary for single statement blocks
#523: drivers/scsi/vhba/vhba.c:451:
+    if (vcmd) {
+        vcmd->status = VHBA_REQ_PENDING;
+    }

ERROR: code indent should use tabs where possible
#524: drivers/scsi/vhba/vhba.c:452:
+        vcmd->status = VHBA_REQ_PENDING;$

WARNING: please, no spaces at the start of a line
#524: drivers/scsi/vhba/vhba.c:452:
+        vcmd->status = VHBA_REQ_PENDING;$

WARNING: please, no spaces at the start of a line
#525: drivers/scsi/vhba/vhba.c:453:
+    }$

WARNING: please, no spaces at the start of a line
#527: drivers/scsi/vhba/vhba.c:455:
+    vhost->cmd_next %= vhba_can_queue;$

WARNING: please, no spaces at the start of a line
#529: drivers/scsi/vhba/vhba.c:457:
+    spin_unlock_irqrestore(&vhost->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#531: drivers/scsi/vhba/vhba.c:459:
+    return vcmd;$

WARNING: space prohibited between function name and open parenthesis '('
#534: drivers/scsi/vhba/vhba.c:462:
+void vhba_free_command (struct vhba_command *vcmd)

WARNING: please, no spaces at the start of a line
#536: drivers/scsi/vhba/vhba.c:464:
+    struct vhba_host *vhost;$

WARNING: please, no spaces at the start of a line
#537: drivers/scsi/vhba/vhba.c:465:
+    unsigned long flags;$

WARNING: please, no spaces at the start of a line
#539: drivers/scsi/vhba/vhba.c:467:
+    vhost = platform_get_drvdata(&vhba_platform_device);$

WARNING: please, no spaces at the start of a line
#541: drivers/scsi/vhba/vhba.c:469:
+    spin_lock_irqsave(&vhost->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#542: drivers/scsi/vhba/vhba.c:470:
+    vcmd->status = VHBA_REQ_FREE;$

WARNING: please, no spaces at the start of a line
#543: drivers/scsi/vhba/vhba.c:471:
+    spin_unlock_irqrestore(&vhost->cmd_lock, flags);$

WARNING: space prohibited between function name and open parenthesis '('
#546: drivers/scsi/vhba/vhba.c:474:
+int vhba_queuecommand (struct Scsi_Host *shost, struct scsi_cmnd *cmd)

WARNING: please, no spaces at the start of a line
#548: drivers/scsi/vhba/vhba.c:476:
+    struct vhba_device *vdev;$

WARNING: please, no spaces at the start of a line
#549: drivers/scsi/vhba/vhba.c:477:
+    int retval;$

WARNING: please, no spaces at the start of a line
#550: drivers/scsi/vhba/vhba.c:478:
+    unsigned int devnum;$

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#552: drivers/scsi/vhba/vhba.c:480:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 15, 0)

WARNING: Comparisons should place the constant on the right side of the test
#552: drivers/scsi/vhba/vhba.c:480:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 15, 0)

WARNING: please, no spaces at the start of a line
#553: drivers/scsi/vhba/vhba.c:481:
+    scmd_dbg(cmd, "queue %p tag %i\n", cmd, scsi_cmd_to_rq(cmd)->tag);$

WARNING: please, no spaces at the start of a line
#555: drivers/scsi/vhba/vhba.c:483:
+    scmd_dbg(cmd, "queue %p tag %i\n", cmd, cmd->request->tag);$

WARNING: please, no spaces at the start of a line
#558: drivers/scsi/vhba/vhba.c:486:
+    devnum = bus_and_id_to_devnum(cmd->device->channel, cmd->device->id);$

WARNING: please, no spaces at the start of a line
#559: drivers/scsi/vhba/vhba.c:487:
+    vdev = vhba_lookup_device(devnum);$

WARNING: please, no spaces at the start of a line
#560: drivers/scsi/vhba/vhba.c:488:
+    if (!vdev) {$

ERROR: code indent should use tabs where possible
#561: drivers/scsi/vhba/vhba.c:489:
+        scmd_dbg(cmd, "no such device\n");$

WARNING: please, no spaces at the start of a line
#561: drivers/scsi/vhba/vhba.c:489:
+        scmd_dbg(cmd, "no such device\n");$

ERROR: code indent should use tabs where possible
#563: drivers/scsi/vhba/vhba.c:491:
+        cmd->result = DID_NO_CONNECT << 16;$

WARNING: please, no spaces at the start of a line
#563: drivers/scsi/vhba/vhba.c:491:
+        cmd->result = DID_NO_CONNECT << 16;$

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#564: drivers/scsi/vhba/vhba.c:492:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 16, 0)

WARNING: Comparisons should place the constant on the right side of the test
#564: drivers/scsi/vhba/vhba.c:492:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 16, 0)

ERROR: code indent should use tabs where possible
#565: drivers/scsi/vhba/vhba.c:493:
+        scsi_done(cmd);$

WARNING: please, no spaces at the start of a line
#565: drivers/scsi/vhba/vhba.c:493:
+        scsi_done(cmd);$

ERROR: code indent should use tabs where possible
#567: drivers/scsi/vhba/vhba.c:495:
+        cmd->scsi_done(cmd);$

WARNING: please, no spaces at the start of a line
#567: drivers/scsi/vhba/vhba.c:495:
+        cmd->scsi_done(cmd);$

ERROR: code indent should use tabs where possible
#570: drivers/scsi/vhba/vhba.c:498:
+        return 0;$

WARNING: please, no spaces at the start of a line
#570: drivers/scsi/vhba/vhba.c:498:
+        return 0;$

WARNING: please, no spaces at the start of a line
#571: drivers/scsi/vhba/vhba.c:499:
+    }$

WARNING: please, no spaces at the start of a line
#573: drivers/scsi/vhba/vhba.c:501:
+    retval = vhba_device_queue(vdev, cmd);$

WARNING: please, no spaces at the start of a line
#575: drivers/scsi/vhba/vhba.c:503:
+    vhba_device_put(vdev);$

WARNING: please, no spaces at the start of a line
#577: drivers/scsi/vhba/vhba.c:505:
+    return retval;$

WARNING: space prohibited between function name and open parenthesis '('
#580: drivers/scsi/vhba/vhba.c:508:
+int vhba_abort (struct scsi_cmnd *cmd)

WARNING: please, no spaces at the start of a line
#582: drivers/scsi/vhba/vhba.c:510:
+    struct vhba_device *vdev;$

WARNING: please, no spaces at the start of a line
#583: drivers/scsi/vhba/vhba.c:511:
+    int retval = SUCCESS;$

WARNING: please, no spaces at the start of a line
#584: drivers/scsi/vhba/vhba.c:512:
+    unsigned int devnum;$

WARNING: please, no spaces at the start of a line
#586: drivers/scsi/vhba/vhba.c:514:
+    scmd_dbg(cmd, "abort %p\n", cmd);$

WARNING: please, no spaces at the start of a line
#588: drivers/scsi/vhba/vhba.c:516:
+    devnum = bus_and_id_to_devnum(cmd->device->channel, cmd->device->id);$

WARNING: please, no spaces at the start of a line
#589: drivers/scsi/vhba/vhba.c:517:
+    vdev = vhba_lookup_device(devnum);$

WARNING: please, no spaces at the start of a line
#590: drivers/scsi/vhba/vhba.c:518:
+    if (vdev) {$

ERROR: code indent should use tabs where possible
#591: drivers/scsi/vhba/vhba.c:519:
+        retval = vhba_device_dequeue(vdev, cmd);$

WARNING: please, no spaces at the start of a line
#591: drivers/scsi/vhba/vhba.c:519:
+        retval = vhba_device_dequeue(vdev, cmd);$

ERROR: code indent should use tabs where possible
#592: drivers/scsi/vhba/vhba.c:520:
+        vhba_device_put(vdev);$

WARNING: please, no spaces at the start of a line
#592: drivers/scsi/vhba/vhba.c:520:
+        vhba_device_put(vdev);$

WARNING: please, no spaces at the start of a line
#593: drivers/scsi/vhba/vhba.c:521:
+    } else {$

ERROR: code indent should use tabs where possible
#594: drivers/scsi/vhba/vhba.c:522:
+        cmd->result = DID_NO_CONNECT << 16;$

WARNING: please, no spaces at the start of a line
#594: drivers/scsi/vhba/vhba.c:522:
+        cmd->result = DID_NO_CONNECT << 16;$

WARNING: please, no spaces at the start of a line
#595: drivers/scsi/vhba/vhba.c:523:
+    }$

WARNING: please, no spaces at the start of a line
#597: drivers/scsi/vhba/vhba.c:525:
+    return retval;$

WARNING: please, no spaces at the start of a line
#601: drivers/scsi/vhba/vhba.c:529:
+    .module = THIS_MODULE,$

WARNING: please, no spaces at the start of a line
#602: drivers/scsi/vhba/vhba.c:530:
+    .name = "vhba",$

WARNING: please, no spaces at the start of a line
#603: drivers/scsi/vhba/vhba.c:531:
+    .proc_name = "vhba",$

WARNING: please, no spaces at the start of a line
#604: drivers/scsi/vhba/vhba.c:532:
+    .queuecommand = vhba_queuecommand,$

WARNING: please, no spaces at the start of a line
#605: drivers/scsi/vhba/vhba.c:533:
+    .eh_abort_handler = vhba_abort,$

WARNING: please, no spaces at the start of a line
#606: drivers/scsi/vhba/vhba.c:534:
+    .this_id = -1,$

WARNING: please, no spaces at the start of a line
#607: drivers/scsi/vhba/vhba.c:535:
+    .max_sectors = VHBA_MAX_SECTORS_PER_IO,$

WARNING: please, no spaces at the start of a line
#608: drivers/scsi/vhba/vhba.c:536:
+    .sg_tablesize = 256,$

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#609: drivers/scsi/vhba/vhba.c:537:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0)

WARNING: Comparisons should place the constant on the right side of the test
#609: drivers/scsi/vhba/vhba.c:537:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0)

WARNING: please, no spaces at the start of a line
#610: drivers/scsi/vhba/vhba.c:538:
+    .slave_alloc = vhba_slave_alloc,$

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#612: drivers/scsi/vhba/vhba.c:540:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 0, 0)

WARNING: Comparisons should place the constant on the right side of the test
#612: drivers/scsi/vhba/vhba.c:540:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 0, 0)

WARNING: please, no spaces at the start of a line
#613: drivers/scsi/vhba/vhba.c:541:
+    .tag_alloc_policy = BLK_TAG_ALLOC_RR,$

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#615: drivers/scsi/vhba/vhba.c:543:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) && LINUX_VERSION_CODE < KERNEL_VERSION(4, 4, 0)

WARNING: please, no spaces at the start of a line
#616: drivers/scsi/vhba/vhba.c:544:
+    .use_blk_tags = 1,$

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#618: drivers/scsi/vhba/vhba.c:546:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 0, 0)

WARNING: Comparisons should place the constant on the right side of the test
#618: drivers/scsi/vhba/vhba.c:546:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 0, 0)

WARNING: please, no spaces at the start of a line
#619: drivers/scsi/vhba/vhba.c:547:
+    .max_segment_size = VHBA_KBUF_SIZE,$

WARNING: line length of 125 exceeds 100 columns
#623: drivers/scsi/vhba/vhba.c:551:
+ssize_t do_request (struct vhba_device *vdev, unsigned long metatag, struct scsi_cmnd *cmd, char __user *buf, size_t buf_len)

WARNING: space prohibited between function name and open parenthesis '('
#623: drivers/scsi/vhba/vhba.c:551:
+ssize_t do_request (struct vhba_device *vdev, unsigned long metatag, struct scsi_cmnd *cmd, char __user *buf, size_t buf_len)

WARNING: please, no spaces at the start of a line
#625: drivers/scsi/vhba/vhba.c:553:
+    struct vhba_request vreq;$

WARNING: please, no spaces at the start of a line
#626: drivers/scsi/vhba/vhba.c:554:
+    ssize_t ret;$

WARNING: please, no spaces at the start of a line
#628: drivers/scsi/vhba/vhba.c:556:
+    scmd_dbg(cmd, "request %lu (%p), cdb 0x%x, bufflen %d, sg count %d\n",$

ERROR: code indent should use tabs where possible
#629: drivers/scsi/vhba/vhba.c:557:
+        metatag, cmd, cmd->cmnd[0], scsi_bufflen(cmd), scsi_sg_count(cmd));$

WARNING: please, no spaces at the start of a line
#629: drivers/scsi/vhba/vhba.c:557:
+        metatag, cmd, cmd->cmnd[0], scsi_bufflen(cmd), scsi_sg_count(cmd));$

WARNING: please, no spaces at the start of a line
#631: drivers/scsi/vhba/vhba.c:559:
+    ret = sizeof(vreq);$

WARNING: please, no spaces at the start of a line
#632: drivers/scsi/vhba/vhba.c:560:
+    if (DATA_TO_DEVICE(cmd->sc_data_direction)) {$

WARNING: braces {} are not necessary for single statement blocks
#632: drivers/scsi/vhba/vhba.c:560:
+    if (DATA_TO_DEVICE(cmd->sc_data_direction)) {
+        ret += scsi_bufflen(cmd);
+    }

ERROR: code indent should use tabs where possible
#633: drivers/scsi/vhba/vhba.c:561:
+        ret += scsi_bufflen(cmd);$

WARNING: please, no spaces at the start of a line
#633: drivers/scsi/vhba/vhba.c:561:
+        ret += scsi_bufflen(cmd);$

WARNING: please, no spaces at the start of a line
#634: drivers/scsi/vhba/vhba.c:562:
+    }$

WARNING: please, no spaces at the start of a line
#636: drivers/scsi/vhba/vhba.c:564:
+    if (ret > buf_len) {$

ERROR: code indent should use tabs where possible
#637: drivers/scsi/vhba/vhba.c:565:
+        scmd_dbg(cmd, "buffer too small (%zd < %zd) for a request\n", buf_len, ret);$

WARNING: please, no spaces at the start of a line
#637: drivers/scsi/vhba/vhba.c:565:
+        scmd_dbg(cmd, "buffer too small (%zd < %zd) for a request\n", buf_len, ret);$

ERROR: code indent should use tabs where possible
#638: drivers/scsi/vhba/vhba.c:566:
+        return -EIO;$

WARNING: please, no spaces at the start of a line
#638: drivers/scsi/vhba/vhba.c:566:
+        return -EIO;$

WARNING: please, no spaces at the start of a line
#639: drivers/scsi/vhba/vhba.c:567:
+    }$

WARNING: please, no spaces at the start of a line
#641: drivers/scsi/vhba/vhba.c:569:
+    vreq.metatag = metatag;$

WARNING: please, no spaces at the start of a line
#642: drivers/scsi/vhba/vhba.c:570:
+    vreq.lun = cmd->device->lun;$

WARNING: please, no spaces at the start of a line
#643: drivers/scsi/vhba/vhba.c:571:
+    memcpy(vreq.cdb, cmd->cmnd, MAX_COMMAND_SIZE);$

WARNING: please, no spaces at the start of a line
#644: drivers/scsi/vhba/vhba.c:572:
+    vreq.cdb_len = cmd->cmd_len;$

WARNING: please, no spaces at the start of a line
#645: drivers/scsi/vhba/vhba.c:573:
+    vreq.data_len = scsi_bufflen(cmd);$

WARNING: please, no spaces at the start of a line
#647: drivers/scsi/vhba/vhba.c:575:
+    if (copy_to_user(buf, &vreq, sizeof(vreq))) {$

WARNING: braces {} are not necessary for single statement blocks
#647: drivers/scsi/vhba/vhba.c:575:
+    if (copy_to_user(buf, &vreq, sizeof(vreq))) {
+        return -EFAULT;
+    }

ERROR: code indent should use tabs where possible
#648: drivers/scsi/vhba/vhba.c:576:
+        return -EFAULT;$

WARNING: please, no spaces at the start of a line
#648: drivers/scsi/vhba/vhba.c:576:
+        return -EFAULT;$

WARNING: please, no spaces at the start of a line
#649: drivers/scsi/vhba/vhba.c:577:
+    }$

WARNING: please, no spaces at the start of a line
#651: drivers/scsi/vhba/vhba.c:579:
+    if (DATA_TO_DEVICE(cmd->sc_data_direction) && vreq.data_len) {$

ERROR: code indent should use tabs where possible
#652: drivers/scsi/vhba/vhba.c:580:
+        buf += sizeof(vreq);$

WARNING: please, no spaces at the start of a line
#652: drivers/scsi/vhba/vhba.c:580:
+        buf += sizeof(vreq);$

ERROR: code indent should use tabs where possible
#654: drivers/scsi/vhba/vhba.c:582:
+        if (scsi_sg_count(cmd)) {$

WARNING: please, no spaces at the start of a line
#654: drivers/scsi/vhba/vhba.c:582:
+        if (scsi_sg_count(cmd)) {$

WARNING: suspect code indent for conditional statements (8, 12)
#654: drivers/scsi/vhba/vhba.c:582:
+        if (scsi_sg_count(cmd)) {
+            unsigned char *kaddr, *uaddr;

ERROR: code indent should use tabs where possible
#655: drivers/scsi/vhba/vhba.c:583:
+            unsigned char *kaddr, *uaddr;$

WARNING: please, no spaces at the start of a line
#655: drivers/scsi/vhba/vhba.c:583:
+            unsigned char *kaddr, *uaddr;$

ERROR: code indent should use tabs where possible
#656: drivers/scsi/vhba/vhba.c:584:
+            struct scatterlist *sglist = scsi_sglist(cmd);$

WARNING: please, no spaces at the start of a line
#656: drivers/scsi/vhba/vhba.c:584:
+            struct scatterlist *sglist = scsi_sglist(cmd);$

ERROR: code indent should use tabs where possible
#657: drivers/scsi/vhba/vhba.c:585:
+            struct scatterlist *sg;$

WARNING: please, no spaces at the start of a line
#657: drivers/scsi/vhba/vhba.c:585:
+            struct scatterlist *sg;$

ERROR: code indent should use tabs where possible
#658: drivers/scsi/vhba/vhba.c:586:
+            int i;$

WARNING: please, no spaces at the start of a line
#658: drivers/scsi/vhba/vhba.c:586:
+            int i;$

ERROR: code indent should use tabs where possible
#660: drivers/scsi/vhba/vhba.c:588:
+            uaddr = (unsigned char *) buf;$

WARNING: please, no spaces at the start of a line
#660: drivers/scsi/vhba/vhba.c:588:
+            uaddr = (unsigned char *) buf;$

ERROR: code indent should use tabs where possible
#662: drivers/scsi/vhba/vhba.c:590:
+            for_each_sg(sglist, sg, scsi_sg_count(cmd), i) {$

WARNING: please, no spaces at the start of a line
#662: drivers/scsi/vhba/vhba.c:590:
+            for_each_sg(sglist, sg, scsi_sg_count(cmd), i) {$

ERROR: code indent should use tabs where possible
#663: drivers/scsi/vhba/vhba.c:591:
+                size_t len = sg->length;$

WARNING: please, no spaces at the start of a line
#663: drivers/scsi/vhba/vhba.c:591:
+                size_t len = sg->length;$

ERROR: code indent should use tabs where possible
#665: drivers/scsi/vhba/vhba.c:593:
+                if (len > vdev->kbuf_size) {$

WARNING: please, no spaces at the start of a line
#665: drivers/scsi/vhba/vhba.c:593:
+                if (len > vdev->kbuf_size) {$

WARNING: suspect code indent for conditional statements (16, 20)
#665: drivers/scsi/vhba/vhba.c:593:
+                if (len > vdev->kbuf_size) {
+                    scmd_dbg(cmd, "segment size (%zu) exceeds kbuf size (%zu)!", len, vdev->kbuf_size);

WARNING: line length of 103 exceeds 100 columns
#666: drivers/scsi/vhba/vhba.c:594:
+                    scmd_dbg(cmd, "segment size (%zu) exceeds kbuf size (%zu)!", len, vdev->kbuf_size);

ERROR: code indent should use tabs where possible
#666: drivers/scsi/vhba/vhba.c:594:
+                    scmd_dbg(cmd, "segment size (%zu) exceeds kbuf size (%zu)!", len, vdev->kbuf_size);$

WARNING: please, no spaces at the start of a line
#666: drivers/scsi/vhba/vhba.c:594:
+                    scmd_dbg(cmd, "segment size (%zu) exceeds kbuf size (%zu)!", len, vdev->kbuf_size);$

ERROR: code indent should use tabs where possible
#667: drivers/scsi/vhba/vhba.c:595:
+                    len = vdev->kbuf_size;$

WARNING: please, no spaces at the start of a line
#667: drivers/scsi/vhba/vhba.c:595:
+                    len = vdev->kbuf_size;$

ERROR: code indent should use tabs where possible
#668: drivers/scsi/vhba/vhba.c:596:
+                }$

WARNING: please, no spaces at the start of a line
#668: drivers/scsi/vhba/vhba.c:596:
+                }$

ERROR: code indent should use tabs where possible
#670: drivers/scsi/vhba/vhba.c:598:
+                kaddr = kmap_atomic(sg_page(sg));$

WARNING: please, no spaces at the start of a line
#670: drivers/scsi/vhba/vhba.c:598:
+                kaddr = kmap_atomic(sg_page(sg));$

WARNING: Deprecated use of 'kmap_atomic', prefer 'kmap_local_page' instead
#670: drivers/scsi/vhba/vhba.c:598:
+                kaddr = kmap_atomic(sg_page(sg));

ERROR: code indent should use tabs where possible
#671: drivers/scsi/vhba/vhba.c:599:
+                memcpy(vdev->kbuf, kaddr + sg->offset, len);$

WARNING: please, no spaces at the start of a line
#671: drivers/scsi/vhba/vhba.c:599:
+                memcpy(vdev->kbuf, kaddr + sg->offset, len);$

ERROR: code indent should use tabs where possible
#672: drivers/scsi/vhba/vhba.c:600:
+                kunmap_atomic(kaddr);$

WARNING: please, no spaces at the start of a line
#672: drivers/scsi/vhba/vhba.c:600:
+                kunmap_atomic(kaddr);$

WARNING: Deprecated use of 'kunmap_atomic', prefer 'kunmap_local' instead
#672: drivers/scsi/vhba/vhba.c:600:
+                kunmap_atomic(kaddr);

ERROR: code indent should use tabs where possible
#674: drivers/scsi/vhba/vhba.c:602:
+                if (copy_to_user(uaddr, vdev->kbuf, len)) {$

WARNING: please, no spaces at the start of a line
#674: drivers/scsi/vhba/vhba.c:602:
+                if (copy_to_user(uaddr, vdev->kbuf, len)) {$

WARNING: suspect code indent for conditional statements (16, 20)
#674: drivers/scsi/vhba/vhba.c:602:
+                if (copy_to_user(uaddr, vdev->kbuf, len)) {
+                    return -EFAULT;

WARNING: braces {} are not necessary for single statement blocks
#674: drivers/scsi/vhba/vhba.c:602:
+                if (copy_to_user(uaddr, vdev->kbuf, len)) {
+                    return -EFAULT;
+                }

ERROR: code indent should use tabs where possible
#675: drivers/scsi/vhba/vhba.c:603:
+                    return -EFAULT;$

WARNING: please, no spaces at the start of a line
#675: drivers/scsi/vhba/vhba.c:603:
+                    return -EFAULT;$

ERROR: code indent should use tabs where possible
#676: drivers/scsi/vhba/vhba.c:604:
+                }$

WARNING: please, no spaces at the start of a line
#676: drivers/scsi/vhba/vhba.c:604:
+                }$

ERROR: code indent should use tabs where possible
#677: drivers/scsi/vhba/vhba.c:605:
+                uaddr += len;$

WARNING: please, no spaces at the start of a line
#677: drivers/scsi/vhba/vhba.c:605:
+                uaddr += len;$

ERROR: code indent should use tabs where possible
#678: drivers/scsi/vhba/vhba.c:606:
+            }$

WARNING: please, no spaces at the start of a line
#678: drivers/scsi/vhba/vhba.c:606:
+            }$

ERROR: code indent should use tabs where possible
#679: drivers/scsi/vhba/vhba.c:607:
+        } else {$

WARNING: please, no spaces at the start of a line
#679: drivers/scsi/vhba/vhba.c:607:
+        } else {$

WARNING: suspect code indent for conditional statements (8, 12)
#679: drivers/scsi/vhba/vhba.c:607:
+        } else {
+            if (copy_to_user(buf, scsi_sglist(cmd), vreq.data_len)) {

ERROR: code indent should use tabs where possible
#680: drivers/scsi/vhba/vhba.c:608:
+            if (copy_to_user(buf, scsi_sglist(cmd), vreq.data_len)) {$

WARNING: please, no spaces at the start of a line
#680: drivers/scsi/vhba/vhba.c:608:
+            if (copy_to_user(buf, scsi_sglist(cmd), vreq.data_len)) {$

WARNING: braces {} are not necessary for single statement blocks
#680: drivers/scsi/vhba/vhba.c:608:
+            if (copy_to_user(buf, scsi_sglist(cmd), vreq.data_len)) {
+                return -EFAULT;
+            }

ERROR: code indent should use tabs where possible
#681: drivers/scsi/vhba/vhba.c:609:
+                return -EFAULT;$

WARNING: please, no spaces at the start of a line
#681: drivers/scsi/vhba/vhba.c:609:
+                return -EFAULT;$

ERROR: code indent should use tabs where possible
#682: drivers/scsi/vhba/vhba.c:610:
+            }$

WARNING: please, no spaces at the start of a line
#682: drivers/scsi/vhba/vhba.c:610:
+            }$

ERROR: code indent should use tabs where possible
#683: drivers/scsi/vhba/vhba.c:611:
+        }$

WARNING: please, no spaces at the start of a line
#683: drivers/scsi/vhba/vhba.c:611:
+        }$

WARNING: please, no spaces at the start of a line
#684: drivers/scsi/vhba/vhba.c:612:
+    }$

WARNING: please, no spaces at the start of a line
#686: drivers/scsi/vhba/vhba.c:614:
+    return ret;$

WARNING: line length of 159 exceeds 100 columns
#689: drivers/scsi/vhba/vhba.c:617:
+ssize_t do_response (struct vhba_device *vdev, unsigned long metatag, struct scsi_cmnd *cmd, const char __user *buf, size_t buf_len, struct vhba_response *res)

WARNING: space prohibited between function name and open parenthesis '('
#689: drivers/scsi/vhba/vhba.c:617:
+ssize_t do_response (struct vhba_device *vdev, unsigned long metatag, struct scsi_cmnd *cmd, const char __user *buf, size_t buf_len, struct vhba_response *res)

WARNING: please, no spaces at the start of a line
#691: drivers/scsi/vhba/vhba.c:619:
+    ssize_t ret = 0;$

WARNING: please, no spaces at the start of a line
#693: drivers/scsi/vhba/vhba.c:621:
+    scmd_dbg(cmd, "response %lu (%p), status %x, data len %d, sg count %d\n",$

ERROR: code indent should use tabs where possible
#694: drivers/scsi/vhba/vhba.c:622:
+         metatag, cmd, res->status, res->data_len, scsi_sg_count(cmd));$

WARNING: please, no spaces at the start of a line
#694: drivers/scsi/vhba/vhba.c:622:
+         metatag, cmd, res->status, res->data_len, scsi_sg_count(cmd));$

WARNING: please, no spaces at the start of a line
#696: drivers/scsi/vhba/vhba.c:624:
+    if (res->status) {$

ERROR: code indent should use tabs where possible
#697: drivers/scsi/vhba/vhba.c:625:
+        if (res->data_len > SCSI_SENSE_BUFFERSIZE) {$

WARNING: please, no spaces at the start of a line
#697: drivers/scsi/vhba/vhba.c:625:
+        if (res->data_len > SCSI_SENSE_BUFFERSIZE) {$

WARNING: suspect code indent for conditional statements (8, 12)
#697: drivers/scsi/vhba/vhba.c:625:
+        if (res->data_len > SCSI_SENSE_BUFFERSIZE) {
+            scmd_dbg(cmd, "truncate sense (%d < %d)", SCSI_SENSE_BUFFERSIZE, res->data_len);

ERROR: code indent should use tabs where possible
#698: drivers/scsi/vhba/vhba.c:626:
+            scmd_dbg(cmd, "truncate sense (%d < %d)", SCSI_SENSE_BUFFERSIZE, res->data_len);$

WARNING: please, no spaces at the start of a line
#698: drivers/scsi/vhba/vhba.c:626:
+            scmd_dbg(cmd, "truncate sense (%d < %d)", SCSI_SENSE_BUFFERSIZE, res->data_len);$

ERROR: code indent should use tabs where possible
#699: drivers/scsi/vhba/vhba.c:627:
+            res->data_len = SCSI_SENSE_BUFFERSIZE;$

WARNING: please, no spaces at the start of a line
#699: drivers/scsi/vhba/vhba.c:627:
+            res->data_len = SCSI_SENSE_BUFFERSIZE;$

ERROR: code indent should use tabs where possible
#700: drivers/scsi/vhba/vhba.c:628:
+        }$

WARNING: please, no spaces at the start of a line
#700: drivers/scsi/vhba/vhba.c:628:
+        }$

ERROR: code indent should use tabs where possible
#702: drivers/scsi/vhba/vhba.c:630:
+        if (copy_from_user(cmd->sense_buffer, buf, res->data_len)) {$

WARNING: please, no spaces at the start of a line
#702: drivers/scsi/vhba/vhba.c:630:
+        if (copy_from_user(cmd->sense_buffer, buf, res->data_len)) {$

WARNING: suspect code indent for conditional statements (8, 12)
#702: drivers/scsi/vhba/vhba.c:630:
+        if (copy_from_user(cmd->sense_buffer, buf, res->data_len)) {
+            return -EFAULT;

WARNING: braces {} are not necessary for single statement blocks
#702: drivers/scsi/vhba/vhba.c:630:
+        if (copy_from_user(cmd->sense_buffer, buf, res->data_len)) {
+            return -EFAULT;
+        }

ERROR: code indent should use tabs where possible
#703: drivers/scsi/vhba/vhba.c:631:
+            return -EFAULT;$

WARNING: please, no spaces at the start of a line
#703: drivers/scsi/vhba/vhba.c:631:
+            return -EFAULT;$

ERROR: code indent should use tabs where possible
#704: drivers/scsi/vhba/vhba.c:632:
+        }$

WARNING: please, no spaces at the start of a line
#704: drivers/scsi/vhba/vhba.c:632:
+        }$

ERROR: code indent should use tabs where possible
#706: drivers/scsi/vhba/vhba.c:634:
+        cmd->result = res->status;$

WARNING: please, no spaces at the start of a line
#706: drivers/scsi/vhba/vhba.c:634:
+        cmd->result = res->status;$

ERROR: code indent should use tabs where possible
#708: drivers/scsi/vhba/vhba.c:636:
+        ret += res->data_len;$

WARNING: please, no spaces at the start of a line
#708: drivers/scsi/vhba/vhba.c:636:
+        ret += res->data_len;$

WARNING: please, no spaces at the start of a line
#709: drivers/scsi/vhba/vhba.c:637:
+    } else if (DATA_FROM_DEVICE(cmd->sc_data_direction) && scsi_bufflen(cmd)) {$

ERROR: code indent should use tabs where possible
#710: drivers/scsi/vhba/vhba.c:638:
+        size_t to_read;$

WARNING: please, no spaces at the start of a line
#710: drivers/scsi/vhba/vhba.c:638:
+        size_t to_read;$

ERROR: code indent should use tabs where possible
#712: drivers/scsi/vhba/vhba.c:640:
+        if (res->data_len > scsi_bufflen(cmd)) {$

WARNING: please, no spaces at the start of a line
#712: drivers/scsi/vhba/vhba.c:640:
+        if (res->data_len > scsi_bufflen(cmd)) {$

WARNING: suspect code indent for conditional statements (8, 12)
#712: drivers/scsi/vhba/vhba.c:640:
+        if (res->data_len > scsi_bufflen(cmd)) {
+            scmd_dbg(cmd, "truncate data (%d < %d)\n", scsi_bufflen(cmd), res->data_len);

ERROR: code indent should use tabs where possible
#713: drivers/scsi/vhba/vhba.c:641:
+            scmd_dbg(cmd, "truncate data (%d < %d)\n", scsi_bufflen(cmd), res->data_len);$

WARNING: please, no spaces at the start of a line
#713: drivers/scsi/vhba/vhba.c:641:
+            scmd_dbg(cmd, "truncate data (%d < %d)\n", scsi_bufflen(cmd), res->data_len);$

ERROR: code indent should use tabs where possible
#714: drivers/scsi/vhba/vhba.c:642:
+            res->data_len = scsi_bufflen(cmd);$

WARNING: please, no spaces at the start of a line
#714: drivers/scsi/vhba/vhba.c:642:
+            res->data_len = scsi_bufflen(cmd);$

ERROR: code indent should use tabs where possible
#715: drivers/scsi/vhba/vhba.c:643:
+        }$

WARNING: please, no spaces at the start of a line
#715: drivers/scsi/vhba/vhba.c:643:
+        }$

ERROR: code indent should use tabs where possible
#717: drivers/scsi/vhba/vhba.c:645:
+        to_read = res->data_len;$

WARNING: please, no spaces at the start of a line
#717: drivers/scsi/vhba/vhba.c:645:
+        to_read = res->data_len;$

ERROR: code indent should use tabs where possible
#719: drivers/scsi/vhba/vhba.c:647:
+        if (scsi_sg_count(cmd)) {$

WARNING: please, no spaces at the start of a line
#719: drivers/scsi/vhba/vhba.c:647:
+        if (scsi_sg_count(cmd)) {$

WARNING: suspect code indent for conditional statements (8, 12)
#719: drivers/scsi/vhba/vhba.c:647:
+        if (scsi_sg_count(cmd)) {
+            unsigned char *kaddr, *uaddr;

ERROR: code indent should use tabs where possible
#720: drivers/scsi/vhba/vhba.c:648:
+            unsigned char *kaddr, *uaddr;$

WARNING: please, no spaces at the start of a line
#720: drivers/scsi/vhba/vhba.c:648:
+            unsigned char *kaddr, *uaddr;$

ERROR: code indent should use tabs where possible
#721: drivers/scsi/vhba/vhba.c:649:
+            struct scatterlist *sglist = scsi_sglist(cmd);$

WARNING: please, no spaces at the start of a line
#721: drivers/scsi/vhba/vhba.c:649:
+            struct scatterlist *sglist = scsi_sglist(cmd);$

ERROR: code indent should use tabs where possible
#722: drivers/scsi/vhba/vhba.c:650:
+            struct scatterlist *sg;$

WARNING: please, no spaces at the start of a line
#722: drivers/scsi/vhba/vhba.c:650:
+            struct scatterlist *sg;$

ERROR: code indent should use tabs where possible
#723: drivers/scsi/vhba/vhba.c:651:
+            int i;$

WARNING: please, no spaces at the start of a line
#723: drivers/scsi/vhba/vhba.c:651:
+            int i;$

ERROR: code indent should use tabs where possible
#725: drivers/scsi/vhba/vhba.c:653:
+            uaddr = (unsigned char *)buf;$

WARNING: please, no spaces at the start of a line
#725: drivers/scsi/vhba/vhba.c:653:
+            uaddr = (unsigned char *)buf;$

ERROR: code indent should use tabs where possible
#727: drivers/scsi/vhba/vhba.c:655:
+            for_each_sg(sglist, sg, scsi_sg_count(cmd), i) {$

WARNING: please, no spaces at the start of a line
#727: drivers/scsi/vhba/vhba.c:655:
+            for_each_sg(sglist, sg, scsi_sg_count(cmd), i) {$

ERROR: code indent should use tabs where possible
#728: drivers/scsi/vhba/vhba.c:656:
+                size_t len = (sg->length < to_read) ? sg->length : to_read;$

WARNING: please, no spaces at the start of a line
#728: drivers/scsi/vhba/vhba.c:656:
+                size_t len = (sg->length < to_read) ? sg->length : to_read;$

ERROR: code indent should use tabs where possible
#730: drivers/scsi/vhba/vhba.c:658:
+                if (len > vdev->kbuf_size) {$

WARNING: please, no spaces at the start of a line
#730: drivers/scsi/vhba/vhba.c:658:
+                if (len > vdev->kbuf_size) {$

WARNING: suspect code indent for conditional statements (16, 20)
#730: drivers/scsi/vhba/vhba.c:658:
+                if (len > vdev->kbuf_size) {
+                    scmd_dbg(cmd, "segment size (%zu) exceeds kbuf size (%zu)!", len, vdev->kbuf_size);

WARNING: line length of 103 exceeds 100 columns
#731: drivers/scsi/vhba/vhba.c:659:
+                    scmd_dbg(cmd, "segment size (%zu) exceeds kbuf size (%zu)!", len, vdev->kbuf_size);

ERROR: code indent should use tabs where possible
#731: drivers/scsi/vhba/vhba.c:659:
+                    scmd_dbg(cmd, "segment size (%zu) exceeds kbuf size (%zu)!", len, vdev->kbuf_size);$

WARNING: please, no spaces at the start of a line
#731: drivers/scsi/vhba/vhba.c:659:
+                    scmd_dbg(cmd, "segment size (%zu) exceeds kbuf size (%zu)!", len, vdev->kbuf_size);$

ERROR: code indent should use tabs where possible
#732: drivers/scsi/vhba/vhba.c:660:
+                    len = vdev->kbuf_size;$

WARNING: please, no spaces at the start of a line
#732: drivers/scsi/vhba/vhba.c:660:
+                    len = vdev->kbuf_size;$

ERROR: code indent should use tabs where possible
#733: drivers/scsi/vhba/vhba.c:661:
+                }$

WARNING: please, no spaces at the start of a line
#733: drivers/scsi/vhba/vhba.c:661:
+                }$

ERROR: code indent should use tabs where possible
#735: drivers/scsi/vhba/vhba.c:663:
+                if (copy_from_user(vdev->kbuf, uaddr, len)) {$

WARNING: please, no spaces at the start of a line
#735: drivers/scsi/vhba/vhba.c:663:
+                if (copy_from_user(vdev->kbuf, uaddr, len)) {$

WARNING: suspect code indent for conditional statements (16, 20)
#735: drivers/scsi/vhba/vhba.c:663:
+                if (copy_from_user(vdev->kbuf, uaddr, len)) {
+                    return -EFAULT;

WARNING: braces {} are not necessary for single statement blocks
#735: drivers/scsi/vhba/vhba.c:663:
+                if (copy_from_user(vdev->kbuf, uaddr, len)) {
+                    return -EFAULT;
+                }

ERROR: code indent should use tabs where possible
#736: drivers/scsi/vhba/vhba.c:664:
+                    return -EFAULT;$

WARNING: please, no spaces at the start of a line
#736: drivers/scsi/vhba/vhba.c:664:
+                    return -EFAULT;$

ERROR: code indent should use tabs where possible
#737: drivers/scsi/vhba/vhba.c:665:
+                }$

WARNING: please, no spaces at the start of a line
#737: drivers/scsi/vhba/vhba.c:665:
+                }$

ERROR: code indent should use tabs where possible
#738: drivers/scsi/vhba/vhba.c:666:
+                uaddr += len;$

WARNING: please, no spaces at the start of a line
#738: drivers/scsi/vhba/vhba.c:666:
+                uaddr += len;$

ERROR: code indent should use tabs where possible
#740: drivers/scsi/vhba/vhba.c:668:
+                kaddr = kmap_atomic(sg_page(sg));$

WARNING: please, no spaces at the start of a line
#740: drivers/scsi/vhba/vhba.c:668:
+                kaddr = kmap_atomic(sg_page(sg));$

WARNING: Deprecated use of 'kmap_atomic', prefer 'kmap_local_page' instead
#740: drivers/scsi/vhba/vhba.c:668:
+                kaddr = kmap_atomic(sg_page(sg));

ERROR: code indent should use tabs where possible
#741: drivers/scsi/vhba/vhba.c:669:
+                memcpy(kaddr + sg->offset, vdev->kbuf, len);$

WARNING: please, no spaces at the start of a line
#741: drivers/scsi/vhba/vhba.c:669:
+                memcpy(kaddr + sg->offset, vdev->kbuf, len);$

ERROR: code indent should use tabs where possible
#742: drivers/scsi/vhba/vhba.c:670:
+                kunmap_atomic(kaddr);$

WARNING: please, no spaces at the start of a line
#742: drivers/scsi/vhba/vhba.c:670:
+                kunmap_atomic(kaddr);$

WARNING: Deprecated use of 'kunmap_atomic', prefer 'kunmap_local' instead
#742: drivers/scsi/vhba/vhba.c:670:
+                kunmap_atomic(kaddr);

ERROR: code indent should use tabs where possible
#744: drivers/scsi/vhba/vhba.c:672:
+                to_read -= len;$

WARNING: please, no spaces at the start of a line
#744: drivers/scsi/vhba/vhba.c:672:
+                to_read -= len;$

ERROR: code indent should use tabs where possible
#745: drivers/scsi/vhba/vhba.c:673:
+                if (to_read == 0) {$

WARNING: please, no spaces at the start of a line
#745: drivers/scsi/vhba/vhba.c:673:
+                if (to_read == 0) {$

WARNING: suspect code indent for conditional statements (16, 20)
#745: drivers/scsi/vhba/vhba.c:673:
+                if (to_read == 0) {
+                    break;

WARNING: braces {} are not necessary for single statement blocks
#745: drivers/scsi/vhba/vhba.c:673:
+                if (to_read == 0) {
+                    break;
+                }

ERROR: code indent should use tabs where possible
#746: drivers/scsi/vhba/vhba.c:674:
+                    break;$

WARNING: please, no spaces at the start of a line
#746: drivers/scsi/vhba/vhba.c:674:
+                    break;$

ERROR: code indent should use tabs where possible
#747: drivers/scsi/vhba/vhba.c:675:
+                }$

WARNING: please, no spaces at the start of a line
#747: drivers/scsi/vhba/vhba.c:675:
+                }$

ERROR: code indent should use tabs where possible
#748: drivers/scsi/vhba/vhba.c:676:
+            }$

WARNING: please, no spaces at the start of a line
#748: drivers/scsi/vhba/vhba.c:676:
+            }$

ERROR: code indent should use tabs where possible
#749: drivers/scsi/vhba/vhba.c:677:
+        } else {$

WARNING: please, no spaces at the start of a line
#749: drivers/scsi/vhba/vhba.c:677:
+        } else {$

WARNING: suspect code indent for conditional statements (8, 12)
#749: drivers/scsi/vhba/vhba.c:677:
+        } else {
+            if (copy_from_user(scsi_sglist(cmd), buf, res->data_len)) {

ERROR: code indent should use tabs where possible
#750: drivers/scsi/vhba/vhba.c:678:
+            if (copy_from_user(scsi_sglist(cmd), buf, res->data_len)) {$

WARNING: please, no spaces at the start of a line
#750: drivers/scsi/vhba/vhba.c:678:
+            if (copy_from_user(scsi_sglist(cmd), buf, res->data_len)) {$

WARNING: braces {} are not necessary for single statement blocks
#750: drivers/scsi/vhba/vhba.c:678:
+            if (copy_from_user(scsi_sglist(cmd), buf, res->data_len)) {
+                return -EFAULT;
+            }

ERROR: code indent should use tabs where possible
#751: drivers/scsi/vhba/vhba.c:679:
+                return -EFAULT;$

WARNING: please, no spaces at the start of a line
#751: drivers/scsi/vhba/vhba.c:679:
+                return -EFAULT;$

ERROR: code indent should use tabs where possible
#752: drivers/scsi/vhba/vhba.c:680:
+            }$

WARNING: please, no spaces at the start of a line
#752: drivers/scsi/vhba/vhba.c:680:
+            }$

ERROR: code indent should use tabs where possible
#754: drivers/scsi/vhba/vhba.c:682:
+            to_read -= res->data_len;$

WARNING: please, no spaces at the start of a line
#754: drivers/scsi/vhba/vhba.c:682:
+            to_read -= res->data_len;$

ERROR: code indent should use tabs where possible
#755: drivers/scsi/vhba/vhba.c:683:
+        }$

WARNING: please, no spaces at the start of a line
#755: drivers/scsi/vhba/vhba.c:683:
+        }$

ERROR: code indent should use tabs where possible
#757: drivers/scsi/vhba/vhba.c:685:
+        scsi_set_resid(cmd, to_read);$

WARNING: please, no spaces at the start of a line
#757: drivers/scsi/vhba/vhba.c:685:
+        scsi_set_resid(cmd, to_read);$

ERROR: code indent should use tabs where possible
#759: drivers/scsi/vhba/vhba.c:687:
+        ret += res->data_len - to_read;$

WARNING: please, no spaces at the start of a line
#759: drivers/scsi/vhba/vhba.c:687:
+        ret += res->data_len - to_read;$

WARNING: please, no spaces at the start of a line
#760: drivers/scsi/vhba/vhba.c:688:
+    }$

WARNING: please, no spaces at the start of a line
#762: drivers/scsi/vhba/vhba.c:690:
+    return ret;$

WARNING: space prohibited between function name and open parenthesis '('
#765: drivers/scsi/vhba/vhba.c:693:
+struct vhba_command *next_command (struct vhba_device *vdev)

WARNING: please, no spaces at the start of a line
#767: drivers/scsi/vhba/vhba.c:695:
+    struct vhba_command *vcmd;$

WARNING: please, no spaces at the start of a line
#769: drivers/scsi/vhba/vhba.c:697:
+    list_for_each_entry(vcmd, &vdev->cmd_list, entry) {$

ERROR: code indent should use tabs where possible
#770: drivers/scsi/vhba/vhba.c:698:
+        if (vcmd->status == VHBA_REQ_PENDING) {$

WARNING: please, no spaces at the start of a line
#770: drivers/scsi/vhba/vhba.c:698:
+        if (vcmd->status == VHBA_REQ_PENDING) {$

WARNING: suspect code indent for conditional statements (8, 12)
#770: drivers/scsi/vhba/vhba.c:698:
+        if (vcmd->status == VHBA_REQ_PENDING) {
+            break;

WARNING: braces {} are not necessary for single statement blocks
#770: drivers/scsi/vhba/vhba.c:698:
+        if (vcmd->status == VHBA_REQ_PENDING) {
+            break;
+        }

ERROR: code indent should use tabs where possible
#771: drivers/scsi/vhba/vhba.c:699:
+            break;$

WARNING: please, no spaces at the start of a line
#771: drivers/scsi/vhba/vhba.c:699:
+            break;$

ERROR: code indent should use tabs where possible
#772: drivers/scsi/vhba/vhba.c:700:
+        }$

WARNING: please, no spaces at the start of a line
#772: drivers/scsi/vhba/vhba.c:700:
+        }$

WARNING: please, no spaces at the start of a line
#773: drivers/scsi/vhba/vhba.c:701:
+    }$

WARNING: please, no spaces at the start of a line
#775: drivers/scsi/vhba/vhba.c:703:
+    if (&vcmd->entry == &vdev->cmd_list) {$

WARNING: braces {} are not necessary for single statement blocks
#775: drivers/scsi/vhba/vhba.c:703:
+    if (&vcmd->entry == &vdev->cmd_list) {
+        vcmd = NULL;
+    }

ERROR: code indent should use tabs where possible
#776: drivers/scsi/vhba/vhba.c:704:
+        vcmd = NULL;$

WARNING: please, no spaces at the start of a line
#776: drivers/scsi/vhba/vhba.c:704:
+        vcmd = NULL;$

WARNING: please, no spaces at the start of a line
#777: drivers/scsi/vhba/vhba.c:705:
+    }$

WARNING: please, no spaces at the start of a line
#779: drivers/scsi/vhba/vhba.c:707:
+    return vcmd;$

WARNING: space prohibited between function name and open parenthesis '('
#782: drivers/scsi/vhba/vhba.c:710:
+struct vhba_command *match_command (struct vhba_device *vdev, __u32 metatag)

WARNING: please, no spaces at the start of a line
#784: drivers/scsi/vhba/vhba.c:712:
+    struct vhba_command *vcmd;$

WARNING: please, no spaces at the start of a line
#786: drivers/scsi/vhba/vhba.c:714:
+    list_for_each_entry(vcmd, &vdev->cmd_list, entry) {$

ERROR: code indent should use tabs where possible
#787: drivers/scsi/vhba/vhba.c:715:
+        if (vcmd->metatag == metatag) {$

WARNING: please, no spaces at the start of a line
#787: drivers/scsi/vhba/vhba.c:715:
+        if (vcmd->metatag == metatag) {$

WARNING: suspect code indent for conditional statements (8, 12)
#787: drivers/scsi/vhba/vhba.c:715:
+        if (vcmd->metatag == metatag) {
+            break;

WARNING: braces {} are not necessary for single statement blocks
#787: drivers/scsi/vhba/vhba.c:715:
+        if (vcmd->metatag == metatag) {
+            break;
+        }

ERROR: code indent should use tabs where possible
#788: drivers/scsi/vhba/vhba.c:716:
+            break;$

WARNING: please, no spaces at the start of a line
#788: drivers/scsi/vhba/vhba.c:716:
+            break;$

ERROR: code indent should use tabs where possible
#789: drivers/scsi/vhba/vhba.c:717:
+        }$

WARNING: please, no spaces at the start of a line
#789: drivers/scsi/vhba/vhba.c:717:
+        }$

WARNING: please, no spaces at the start of a line
#790: drivers/scsi/vhba/vhba.c:718:
+    }$

WARNING: please, no spaces at the start of a line
#792: drivers/scsi/vhba/vhba.c:720:
+    if (&vcmd->entry == &vdev->cmd_list) {$

WARNING: braces {} are not necessary for single statement blocks
#792: drivers/scsi/vhba/vhba.c:720:
+    if (&vcmd->entry == &vdev->cmd_list) {
+        vcmd = NULL;
+    }

ERROR: code indent should use tabs where possible
#793: drivers/scsi/vhba/vhba.c:721:
+        vcmd = NULL;$

WARNING: please, no spaces at the start of a line
#793: drivers/scsi/vhba/vhba.c:721:
+        vcmd = NULL;$

WARNING: please, no spaces at the start of a line
#794: drivers/scsi/vhba/vhba.c:722:
+    }$

WARNING: please, no spaces at the start of a line
#796: drivers/scsi/vhba/vhba.c:724:
+    return vcmd;$

WARNING: space prohibited between function name and open parenthesis '('
#799: drivers/scsi/vhba/vhba.c:727:
+struct vhba_command *wait_command (struct vhba_device *vdev, unsigned long flags)

WARNING: please, no spaces at the start of a line
#801: drivers/scsi/vhba/vhba.c:729:
+    struct vhba_command *vcmd;$

WARNING: please, no spaces at the start of a line
#802: drivers/scsi/vhba/vhba.c:730:
+    DEFINE_WAIT(wait);$

WARNING: please, no spaces at the start of a line
#804: drivers/scsi/vhba/vhba.c:732:
+    while (!(vcmd = next_command(vdev))) {$

ERROR: code indent should use tabs where possible
#805: drivers/scsi/vhba/vhba.c:733:
+        if (signal_pending(current)) {$

WARNING: please, no spaces at the start of a line
#805: drivers/scsi/vhba/vhba.c:733:
+        if (signal_pending(current)) {$

WARNING: suspect code indent for conditional statements (8, 12)
#805: drivers/scsi/vhba/vhba.c:733:
+        if (signal_pending(current)) {
+            break;

WARNING: braces {} are not necessary for single statement blocks
#805: drivers/scsi/vhba/vhba.c:733:
+        if (signal_pending(current)) {
+            break;
+        }

ERROR: code indent should use tabs where possible
#806: drivers/scsi/vhba/vhba.c:734:
+            break;$

WARNING: please, no spaces at the start of a line
#806: drivers/scsi/vhba/vhba.c:734:
+            break;$

ERROR: code indent should use tabs where possible
#807: drivers/scsi/vhba/vhba.c:735:
+        }$

WARNING: please, no spaces at the start of a line
#807: drivers/scsi/vhba/vhba.c:735:
+        }$

ERROR: code indent should use tabs where possible
#809: drivers/scsi/vhba/vhba.c:737:
+        prepare_to_wait(&vdev->cmd_wq, &wait, TASK_INTERRUPTIBLE);$

WARNING: please, no spaces at the start of a line
#809: drivers/scsi/vhba/vhba.c:737:
+        prepare_to_wait(&vdev->cmd_wq, &wait, TASK_INTERRUPTIBLE);$

ERROR: code indent should use tabs where possible
#811: drivers/scsi/vhba/vhba.c:739:
+        spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#811: drivers/scsi/vhba/vhba.c:739:
+        spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

ERROR: code indent should use tabs where possible
#813: drivers/scsi/vhba/vhba.c:741:
+        schedule();$

WARNING: please, no spaces at the start of a line
#813: drivers/scsi/vhba/vhba.c:741:
+        schedule();$

ERROR: code indent should use tabs where possible
#815: drivers/scsi/vhba/vhba.c:743:
+        spin_lock_irqsave(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#815: drivers/scsi/vhba/vhba.c:743:
+        spin_lock_irqsave(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#816: drivers/scsi/vhba/vhba.c:744:
+    }$

WARNING: please, no spaces at the start of a line
#818: drivers/scsi/vhba/vhba.c:746:
+    finish_wait(&vdev->cmd_wq, &wait);$

WARNING: please, no spaces at the start of a line
#819: drivers/scsi/vhba/vhba.c:747:
+    if (vcmd) {$

WARNING: braces {} are not necessary for single statement blocks
#819: drivers/scsi/vhba/vhba.c:747:
+    if (vcmd) {
+        vcmd->status = VHBA_REQ_READING;
+    }

ERROR: code indent should use tabs where possible
#820: drivers/scsi/vhba/vhba.c:748:
+        vcmd->status = VHBA_REQ_READING;$

WARNING: please, no spaces at the start of a line
#820: drivers/scsi/vhba/vhba.c:748:
+        vcmd->status = VHBA_REQ_READING;$

WARNING: please, no spaces at the start of a line
#821: drivers/scsi/vhba/vhba.c:749:
+    }$

WARNING: please, no spaces at the start of a line
#823: drivers/scsi/vhba/vhba.c:751:
+    return vcmd;$

WARNING: space prohibited between function name and open parenthesis '('
#826: drivers/scsi/vhba/vhba.c:754:
+ssize_t vhba_ctl_read (struct file *file, char __user *buf, size_t buf_len, loff_t *offset)

WARNING: please, no spaces at the start of a line
#828: drivers/scsi/vhba/vhba.c:756:
+    struct vhba_device *vdev;$

WARNING: please, no spaces at the start of a line
#829: drivers/scsi/vhba/vhba.c:757:
+    struct vhba_command *vcmd;$

WARNING: please, no spaces at the start of a line
#830: drivers/scsi/vhba/vhba.c:758:
+    ssize_t ret;$

WARNING: please, no spaces at the start of a line
#831: drivers/scsi/vhba/vhba.c:759:
+    unsigned long flags;$

WARNING: please, no spaces at the start of a line
#833: drivers/scsi/vhba/vhba.c:761:
+    vdev = file->private_data;$

WARNING: please, no spaces at the start of a line
#836: drivers/scsi/vhba/vhba.c:764:
+    if (file->f_flags & O_NONBLOCK) {$

ERROR: code indent should use tabs where possible
#837: drivers/scsi/vhba/vhba.c:765:
+        /* Non-blocking variant */$

ERROR: code indent should use tabs where possible
#838: drivers/scsi/vhba/vhba.c:766:
+        spin_lock_irqsave(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#838: drivers/scsi/vhba/vhba.c:766:
+        spin_lock_irqsave(&vdev->cmd_lock, flags);$

ERROR: code indent should use tabs where possible
#839: drivers/scsi/vhba/vhba.c:767:
+        vcmd = next_command(vdev);$

WARNING: please, no spaces at the start of a line
#839: drivers/scsi/vhba/vhba.c:767:
+        vcmd = next_command(vdev);$

ERROR: code indent should use tabs where possible
#840: drivers/scsi/vhba/vhba.c:768:
+        spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#840: drivers/scsi/vhba/vhba.c:768:
+        spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

ERROR: code indent should use tabs where possible
#842: drivers/scsi/vhba/vhba.c:770:
+        if (!vcmd) {$

WARNING: please, no spaces at the start of a line
#842: drivers/scsi/vhba/vhba.c:770:
+        if (!vcmd) {$

WARNING: suspect code indent for conditional statements (8, 12)
#842: drivers/scsi/vhba/vhba.c:770:
+        if (!vcmd) {
+            return -EWOULDBLOCK;

WARNING: braces {} are not necessary for single statement blocks
#842: drivers/scsi/vhba/vhba.c:770:
+        if (!vcmd) {
+            return -EWOULDBLOCK;
+        }

ERROR: code indent should use tabs where possible
#843: drivers/scsi/vhba/vhba.c:771:
+            return -EWOULDBLOCK;$

WARNING: please, no spaces at the start of a line
#843: drivers/scsi/vhba/vhba.c:771:
+            return -EWOULDBLOCK;$

ERROR: code indent should use tabs where possible
#844: drivers/scsi/vhba/vhba.c:772:
+        }$

WARNING: please, no spaces at the start of a line
#844: drivers/scsi/vhba/vhba.c:772:
+        }$

WARNING: please, no spaces at the start of a line
#845: drivers/scsi/vhba/vhba.c:773:
+    } else {$

ERROR: code indent should use tabs where possible
#846: drivers/scsi/vhba/vhba.c:774:
+        /* Blocking variant */$

ERROR: code indent should use tabs where possible
#847: drivers/scsi/vhba/vhba.c:775:
+        spin_lock_irqsave(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#847: drivers/scsi/vhba/vhba.c:775:
+        spin_lock_irqsave(&vdev->cmd_lock, flags);$

ERROR: code indent should use tabs where possible
#848: drivers/scsi/vhba/vhba.c:776:
+        vcmd = wait_command(vdev, flags);$

WARNING: please, no spaces at the start of a line
#848: drivers/scsi/vhba/vhba.c:776:
+        vcmd = wait_command(vdev, flags);$

ERROR: code indent should use tabs where possible
#849: drivers/scsi/vhba/vhba.c:777:
+        spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#849: drivers/scsi/vhba/vhba.c:777:
+        spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

ERROR: code indent should use tabs where possible
#851: drivers/scsi/vhba/vhba.c:779:
+        if (!vcmd) {$

WARNING: please, no spaces at the start of a line
#851: drivers/scsi/vhba/vhba.c:779:
+        if (!vcmd) {$

WARNING: suspect code indent for conditional statements (8, 12)
#851: drivers/scsi/vhba/vhba.c:779:
+        if (!vcmd) {
+            return -ERESTARTSYS;

WARNING: braces {} are not necessary for single statement blocks
#851: drivers/scsi/vhba/vhba.c:779:
+        if (!vcmd) {
+            return -ERESTARTSYS;
+        }

ERROR: code indent should use tabs where possible
#852: drivers/scsi/vhba/vhba.c:780:
+            return -ERESTARTSYS;$

WARNING: please, no spaces at the start of a line
#852: drivers/scsi/vhba/vhba.c:780:
+            return -ERESTARTSYS;$

ERROR: code indent should use tabs where possible
#853: drivers/scsi/vhba/vhba.c:781:
+        }$

WARNING: please, no spaces at the start of a line
#853: drivers/scsi/vhba/vhba.c:781:
+        }$

WARNING: please, no spaces at the start of a line
#854: drivers/scsi/vhba/vhba.c:782:
+    }$

WARNING: please, no spaces at the start of a line
#856: drivers/scsi/vhba/vhba.c:784:
+    ret = do_request(vdev, vcmd->metatag, vcmd->cmd, buf, buf_len);$

WARNING: please, no spaces at the start of a line
#858: drivers/scsi/vhba/vhba.c:786:
+    spin_lock_irqsave(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#859: drivers/scsi/vhba/vhba.c:787:
+    if (ret >= 0) {$

ERROR: code indent should use tabs where possible
#860: drivers/scsi/vhba/vhba.c:788:
+        vcmd->status = VHBA_REQ_SENT;$

WARNING: please, no spaces at the start of a line
#860: drivers/scsi/vhba/vhba.c:788:
+        vcmd->status = VHBA_REQ_SENT;$

ERROR: code indent should use tabs where possible
#861: drivers/scsi/vhba/vhba.c:789:
+        *offset += ret;$

WARNING: please, no spaces at the start of a line
#861: drivers/scsi/vhba/vhba.c:789:
+        *offset += ret;$

WARNING: please, no spaces at the start of a line
#862: drivers/scsi/vhba/vhba.c:790:
+    } else {$

ERROR: code indent should use tabs where possible
#863: drivers/scsi/vhba/vhba.c:791:
+        vcmd->status = VHBA_REQ_PENDING;$

WARNING: please, no spaces at the start of a line
#863: drivers/scsi/vhba/vhba.c:791:
+        vcmd->status = VHBA_REQ_PENDING;$

WARNING: please, no spaces at the start of a line
#864: drivers/scsi/vhba/vhba.c:792:
+    }$

WARNING: please, no spaces at the start of a line
#866: drivers/scsi/vhba/vhba.c:794:
+    spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#868: drivers/scsi/vhba/vhba.c:796:
+    return ret;$

WARNING: space prohibited between function name and open parenthesis '('
#871: drivers/scsi/vhba/vhba.c:799:
+ssize_t vhba_ctl_write (struct file *file, const char __user *buf, size_t buf_len, loff_t *offset)

WARNING: please, no spaces at the start of a line
#873: drivers/scsi/vhba/vhba.c:801:
+    struct vhba_device *vdev;$

WARNING: please, no spaces at the start of a line
#874: drivers/scsi/vhba/vhba.c:802:
+    struct vhba_command *vcmd;$

WARNING: please, no spaces at the start of a line
#875: drivers/scsi/vhba/vhba.c:803:
+    struct vhba_response res;$

WARNING: please, no spaces at the start of a line
#876: drivers/scsi/vhba/vhba.c:804:
+    ssize_t ret;$

WARNING: please, no spaces at the start of a line
#877: drivers/scsi/vhba/vhba.c:805:
+    unsigned long flags;$

WARNING: please, no spaces at the start of a line
#879: drivers/scsi/vhba/vhba.c:807:
+    if (buf_len < sizeof(res)) {$

WARNING: braces {} are not necessary for single statement blocks
#879: drivers/scsi/vhba/vhba.c:807:
+    if (buf_len < sizeof(res)) {
+        return -EIO;
+    }

ERROR: code indent should use tabs where possible
#880: drivers/scsi/vhba/vhba.c:808:
+        return -EIO;$

WARNING: please, no spaces at the start of a line
#880: drivers/scsi/vhba/vhba.c:808:
+        return -EIO;$

WARNING: please, no spaces at the start of a line
#881: drivers/scsi/vhba/vhba.c:809:
+    }$

WARNING: please, no spaces at the start of a line
#883: drivers/scsi/vhba/vhba.c:811:
+    if (copy_from_user(&res, buf, sizeof(res))) {$

WARNING: braces {} are not necessary for single statement blocks
#883: drivers/scsi/vhba/vhba.c:811:
+    if (copy_from_user(&res, buf, sizeof(res))) {
+        return -EFAULT;
+    }

ERROR: code indent should use tabs where possible
#884: drivers/scsi/vhba/vhba.c:812:
+        return -EFAULT;$

WARNING: please, no spaces at the start of a line
#884: drivers/scsi/vhba/vhba.c:812:
+        return -EFAULT;$

WARNING: please, no spaces at the start of a line
#885: drivers/scsi/vhba/vhba.c:813:
+    }$

WARNING: please, no spaces at the start of a line
#887: drivers/scsi/vhba/vhba.c:815:
+    vdev = file->private_data;$

WARNING: please, no spaces at the start of a line
#889: drivers/scsi/vhba/vhba.c:817:
+    spin_lock_irqsave(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#890: drivers/scsi/vhba/vhba.c:818:
+    vcmd = match_command(vdev, res.metatag);$

WARNING: please, no spaces at the start of a line
#891: drivers/scsi/vhba/vhba.c:819:
+    if (!vcmd || vcmd->status != VHBA_REQ_SENT) {$

ERROR: code indent should use tabs where possible
#892: drivers/scsi/vhba/vhba.c:820:
+        spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#892: drivers/scsi/vhba/vhba.c:820:
+        spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

ERROR: code indent should use tabs where possible
#893: drivers/scsi/vhba/vhba.c:821:
+        pr_debug("ctl dev #%u not expecting response\n", vdev->num);$

WARNING: please, no spaces at the start of a line
#893: drivers/scsi/vhba/vhba.c:821:
+        pr_debug("ctl dev #%u not expecting response\n", vdev->num);$

ERROR: code indent should use tabs where possible
#894: drivers/scsi/vhba/vhba.c:822:
+        return -EIO;$

WARNING: please, no spaces at the start of a line
#894: drivers/scsi/vhba/vhba.c:822:
+        return -EIO;$

WARNING: please, no spaces at the start of a line
#895: drivers/scsi/vhba/vhba.c:823:
+    }$

WARNING: please, no spaces at the start of a line
#896: drivers/scsi/vhba/vhba.c:824:
+    vcmd->status = VHBA_REQ_WRITING;$

WARNING: please, no spaces at the start of a line
#897: drivers/scsi/vhba/vhba.c:825:
+    spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

WARNING: line length of 102 exceeds 100 columns
#899: drivers/scsi/vhba/vhba.c:827:
+    ret = do_response(vdev, vcmd->metatag, vcmd->cmd, buf + sizeof(res), buf_len - sizeof(res), &res);

WARNING: please, no spaces at the start of a line
#899: drivers/scsi/vhba/vhba.c:827:
+    ret = do_response(vdev, vcmd->metatag, vcmd->cmd, buf + sizeof(res), buf_len - sizeof(res), &res);$

WARNING: please, no spaces at the start of a line
#901: drivers/scsi/vhba/vhba.c:829:
+    spin_lock_irqsave(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#902: drivers/scsi/vhba/vhba.c:830:
+    if (ret >= 0) {$

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#903: drivers/scsi/vhba/vhba.c:831:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 16, 0)

WARNING: Comparisons should place the constant on the right side of the test
#903: drivers/scsi/vhba/vhba.c:831:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 16, 0)

ERROR: code indent should use tabs where possible
#904: drivers/scsi/vhba/vhba.c:832:
+        scsi_done(vcmd->cmd);$

WARNING: please, no spaces at the start of a line
#904: drivers/scsi/vhba/vhba.c:832:
+        scsi_done(vcmd->cmd);$

ERROR: code indent should use tabs where possible
#906: drivers/scsi/vhba/vhba.c:834:
+        vcmd->cmd->scsi_done(vcmd->cmd);$

WARNING: please, no spaces at the start of a line
#906: drivers/scsi/vhba/vhba.c:834:
+        vcmd->cmd->scsi_done(vcmd->cmd);$

ERROR: code indent should use tabs where possible
#908: drivers/scsi/vhba/vhba.c:836:
+        ret += sizeof(res);$

WARNING: please, no spaces at the start of a line
#908: drivers/scsi/vhba/vhba.c:836:
+        ret += sizeof(res);$

ERROR: code indent should use tabs where possible
#910: drivers/scsi/vhba/vhba.c:838:
+        /* don't compete with vhba_device_dequeue */$

ERROR: code indent should use tabs where possible
#911: drivers/scsi/vhba/vhba.c:839:
+        if (!list_empty(&vcmd->entry)) {$

WARNING: please, no spaces at the start of a line
#911: drivers/scsi/vhba/vhba.c:839:
+        if (!list_empty(&vcmd->entry)) {$

WARNING: suspect code indent for conditional statements (8, 12)
#911: drivers/scsi/vhba/vhba.c:839:
+        if (!list_empty(&vcmd->entry)) {
+            list_del_init(&vcmd->entry);

ERROR: code indent should use tabs where possible
#912: drivers/scsi/vhba/vhba.c:840:
+            list_del_init(&vcmd->entry);$

WARNING: please, no spaces at the start of a line
#912: drivers/scsi/vhba/vhba.c:840:
+            list_del_init(&vcmd->entry);$

ERROR: code indent should use tabs where possible
#913: drivers/scsi/vhba/vhba.c:841:
+            vhba_free_command(vcmd);$

WARNING: please, no spaces at the start of a line
#913: drivers/scsi/vhba/vhba.c:841:
+            vhba_free_command(vcmd);$

ERROR: code indent should use tabs where possible
#914: drivers/scsi/vhba/vhba.c:842:
+        }$

WARNING: please, no spaces at the start of a line
#914: drivers/scsi/vhba/vhba.c:842:
+        }$

WARNING: please, no spaces at the start of a line
#915: drivers/scsi/vhba/vhba.c:843:
+    } else {$

ERROR: code indent should use tabs where possible
#916: drivers/scsi/vhba/vhba.c:844:
+        vcmd->status = VHBA_REQ_SENT;$

WARNING: please, no spaces at the start of a line
#916: drivers/scsi/vhba/vhba.c:844:
+        vcmd->status = VHBA_REQ_SENT;$

WARNING: please, no spaces at the start of a line
#917: drivers/scsi/vhba/vhba.c:845:
+    }$

WARNING: please, no spaces at the start of a line
#919: drivers/scsi/vhba/vhba.c:847:
+    spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#921: drivers/scsi/vhba/vhba.c:849:
+    return ret;$

WARNING: space prohibited between function name and open parenthesis '('
#924: drivers/scsi/vhba/vhba.c:852:
+long vhba_ctl_ioctl (struct file *file, unsigned int cmd, unsigned long arg)

WARNING: please, no spaces at the start of a line
#926: drivers/scsi/vhba/vhba.c:854:
+    struct vhba_device *vdev = file->private_data;$

WARNING: please, no spaces at the start of a line
#927: drivers/scsi/vhba/vhba.c:855:
+    struct vhba_host *vhost = platform_get_drvdata(&vhba_platform_device);$

WARNING: please, no spaces at the start of a line
#929: drivers/scsi/vhba/vhba.c:857:
+    switch (cmd) {$

ERROR: code indent should use tabs where possible
#930: drivers/scsi/vhba/vhba.c:858:
+        case 0xBEEF001: {$

WARNING: please, no spaces at the start of a line
#930: drivers/scsi/vhba/vhba.c:858:
+        case 0xBEEF001: {$

ERROR: code indent should use tabs where possible
#931: drivers/scsi/vhba/vhba.c:859:
+            unsigned int ident[4]; /* host, channel, id, lun */$

WARNING: please, no spaces at the start of a line
#931: drivers/scsi/vhba/vhba.c:859:
+            unsigned int ident[4]; /* host, channel, id, lun */$

ERROR: code indent should use tabs where possible
#933: drivers/scsi/vhba/vhba.c:861:
+            ident[0] = vhost->shost->host_no;$

WARNING: please, no spaces at the start of a line
#933: drivers/scsi/vhba/vhba.c:861:
+            ident[0] = vhost->shost->host_no;$

ERROR: code indent should use tabs where possible
#934: drivers/scsi/vhba/vhba.c:862:
+            devnum_to_bus_and_id(vdev->num, &ident[1], &ident[2]);$

WARNING: please, no spaces at the start of a line
#934: drivers/scsi/vhba/vhba.c:862:
+            devnum_to_bus_and_id(vdev->num, &ident[1], &ident[2]);$

ERROR: code indent should use tabs where possible
#935: drivers/scsi/vhba/vhba.c:863:
+            ident[3] = 0; /* lun */$

WARNING: please, no spaces at the start of a line
#935: drivers/scsi/vhba/vhba.c:863:
+            ident[3] = 0; /* lun */$

ERROR: code indent should use tabs where possible
#937: drivers/scsi/vhba/vhba.c:865:
+            if (copy_to_user((void *) arg, ident, sizeof(ident))) {$

WARNING: please, no spaces at the start of a line
#937: drivers/scsi/vhba/vhba.c:865:
+            if (copy_to_user((void *) arg, ident, sizeof(ident))) {$

WARNING: braces {} are not necessary for single statement blocks
#937: drivers/scsi/vhba/vhba.c:865:
+            if (copy_to_user((void *) arg, ident, sizeof(ident))) {
+                return -EFAULT;
+            }

ERROR: code indent should use tabs where possible
#938: drivers/scsi/vhba/vhba.c:866:
+                return -EFAULT;$

WARNING: please, no spaces at the start of a line
#938: drivers/scsi/vhba/vhba.c:866:
+                return -EFAULT;$

ERROR: code indent should use tabs where possible
#939: drivers/scsi/vhba/vhba.c:867:
+            }$

WARNING: please, no spaces at the start of a line
#939: drivers/scsi/vhba/vhba.c:867:
+            }$

ERROR: code indent should use tabs where possible
#941: drivers/scsi/vhba/vhba.c:869:
+            return 0;$

WARNING: please, no spaces at the start of a line
#941: drivers/scsi/vhba/vhba.c:869:
+            return 0;$

ERROR: code indent should use tabs where possible
#942: drivers/scsi/vhba/vhba.c:870:
+        }$

WARNING: please, no spaces at the start of a line
#942: drivers/scsi/vhba/vhba.c:870:
+        }$

ERROR: code indent should use tabs where possible
#943: drivers/scsi/vhba/vhba.c:871:
+        case 0xBEEF002: {$

WARNING: please, no spaces at the start of a line
#943: drivers/scsi/vhba/vhba.c:871:
+        case 0xBEEF002: {$

ERROR: code indent should use tabs where possible
#944: drivers/scsi/vhba/vhba.c:872:
+            unsigned int devnum = vdev->num;$

WARNING: please, no spaces at the start of a line
#944: drivers/scsi/vhba/vhba.c:872:
+            unsigned int devnum = vdev->num;$

ERROR: code indent should use tabs where possible
#946: drivers/scsi/vhba/vhba.c:874:
+            if (copy_to_user((void *) arg, &devnum, sizeof(devnum))) {$

WARNING: please, no spaces at the start of a line
#946: drivers/scsi/vhba/vhba.c:874:
+            if (copy_to_user((void *) arg, &devnum, sizeof(devnum))) {$

WARNING: braces {} are not necessary for single statement blocks
#946: drivers/scsi/vhba/vhba.c:874:
+            if (copy_to_user((void *) arg, &devnum, sizeof(devnum))) {
+                return -EFAULT;
+            }

ERROR: code indent should use tabs where possible
#947: drivers/scsi/vhba/vhba.c:875:
+                return -EFAULT;$

WARNING: please, no spaces at the start of a line
#947: drivers/scsi/vhba/vhba.c:875:
+                return -EFAULT;$

ERROR: code indent should use tabs where possible
#948: drivers/scsi/vhba/vhba.c:876:
+            }$

WARNING: please, no spaces at the start of a line
#948: drivers/scsi/vhba/vhba.c:876:
+            }$

ERROR: code indent should use tabs where possible
#950: drivers/scsi/vhba/vhba.c:878:
+            return 0;$

WARNING: please, no spaces at the start of a line
#950: drivers/scsi/vhba/vhba.c:878:
+            return 0;$

ERROR: code indent should use tabs where possible
#951: drivers/scsi/vhba/vhba.c:879:
+        }$

WARNING: please, no spaces at the start of a line
#951: drivers/scsi/vhba/vhba.c:879:
+        }$

WARNING: please, no spaces at the start of a line
#952: drivers/scsi/vhba/vhba.c:880:
+    }$

WARNING: please, no spaces at the start of a line
#954: drivers/scsi/vhba/vhba.c:882:
+    return -ENOTTY;$

WARNING: space prohibited between function name and open parenthesis '('
#958: drivers/scsi/vhba/vhba.c:886:
+long vhba_ctl_compat_ioctl (struct file *file, unsigned int cmd, unsigned long arg)

WARNING: please, no spaces at the start of a line
#960: drivers/scsi/vhba/vhba.c:888:
+    unsigned long compat_arg = (unsigned long)compat_ptr(arg);$

WARNING: Missing a blank line after declarations
#961: drivers/scsi/vhba/vhba.c:889:
+    unsigned long compat_arg = (unsigned long)compat_ptr(arg);
+    return vhba_ctl_ioctl(file, cmd, compat_arg);

WARNING: please, no spaces at the start of a line
#961: drivers/scsi/vhba/vhba.c:889:
+    return vhba_ctl_ioctl(file, cmd, compat_arg);$

WARNING: space prohibited between function name and open parenthesis '('
#965: drivers/scsi/vhba/vhba.c:893:
+unsigned int vhba_ctl_poll (struct file *file, poll_table *wait)

WARNING: please, no spaces at the start of a line
#967: drivers/scsi/vhba/vhba.c:895:
+    struct vhba_device *vdev = file->private_data;$

WARNING: please, no spaces at the start of a line
#968: drivers/scsi/vhba/vhba.c:896:
+    unsigned int mask = 0;$

WARNING: please, no spaces at the start of a line
#969: drivers/scsi/vhba/vhba.c:897:
+    unsigned long flags;$

WARNING: please, no spaces at the start of a line
#971: drivers/scsi/vhba/vhba.c:899:
+    poll_wait(file, &vdev->cmd_wq, wait);$

WARNING: please, no spaces at the start of a line
#973: drivers/scsi/vhba/vhba.c:901:
+    spin_lock_irqsave(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#974: drivers/scsi/vhba/vhba.c:902:
+    if (next_command(vdev)) {$

WARNING: braces {} are not necessary for single statement blocks
#974: drivers/scsi/vhba/vhba.c:902:
+    if (next_command(vdev)) {
+        mask |= POLLIN | POLLRDNORM;
+    }

ERROR: code indent should use tabs where possible
#975: drivers/scsi/vhba/vhba.c:903:
+        mask |= POLLIN | POLLRDNORM;$

WARNING: please, no spaces at the start of a line
#975: drivers/scsi/vhba/vhba.c:903:
+        mask |= POLLIN | POLLRDNORM;$

WARNING: please, no spaces at the start of a line
#976: drivers/scsi/vhba/vhba.c:904:
+    }$

WARNING: please, no spaces at the start of a line
#977: drivers/scsi/vhba/vhba.c:905:
+    spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#979: drivers/scsi/vhba/vhba.c:907:
+    return mask;$

WARNING: space prohibited between function name and open parenthesis '('
#982: drivers/scsi/vhba/vhba.c:910:
+int vhba_ctl_open (struct inode *inode, struct file *file)

WARNING: please, no spaces at the start of a line
#984: drivers/scsi/vhba/vhba.c:912:
+    struct vhba_device *vdev;$

WARNING: please, no spaces at the start of a line
#985: drivers/scsi/vhba/vhba.c:913:
+    int retval;$

WARNING: please, no spaces at the start of a line
#987: drivers/scsi/vhba/vhba.c:915:
+    pr_debug("ctl dev open\n");$

WARNING: please, no spaces at the start of a line
#990: drivers/scsi/vhba/vhba.c:918:
+    if (!platform_get_drvdata(&vhba_platform_device)) {$

WARNING: braces {} are not necessary for single statement blocks
#990: drivers/scsi/vhba/vhba.c:918:
+    if (!platform_get_drvdata(&vhba_platform_device)) {
+        return -ENODEV;
+    }

ERROR: code indent should use tabs where possible
#991: drivers/scsi/vhba/vhba.c:919:
+        return -ENODEV;$

WARNING: please, no spaces at the start of a line
#991: drivers/scsi/vhba/vhba.c:919:
+        return -ENODEV;$

WARNING: please, no spaces at the start of a line
#992: drivers/scsi/vhba/vhba.c:920:
+    }$

WARNING: please, no spaces at the start of a line
#994: drivers/scsi/vhba/vhba.c:922:
+    vdev = vhba_device_alloc();$

WARNING: please, no spaces at the start of a line
#995: drivers/scsi/vhba/vhba.c:923:
+    if (!vdev) {$

WARNING: braces {} are not necessary for single statement blocks
#995: drivers/scsi/vhba/vhba.c:923:
+    if (!vdev) {
+        return -ENOMEM;
+    }

ERROR: code indent should use tabs where possible
#996: drivers/scsi/vhba/vhba.c:924:
+        return -ENOMEM;$

WARNING: please, no spaces at the start of a line
#996: drivers/scsi/vhba/vhba.c:924:
+        return -ENOMEM;$

WARNING: please, no spaces at the start of a line
#997: drivers/scsi/vhba/vhba.c:925:
+    }$

WARNING: please, no spaces at the start of a line
#999: drivers/scsi/vhba/vhba.c:927:
+    vdev->kbuf_size = VHBA_KBUF_SIZE;$

WARNING: please, no spaces at the start of a line
#1000: drivers/scsi/vhba/vhba.c:928:
+    vdev->kbuf = kzalloc(vdev->kbuf_size, GFP_KERNEL);$

WARNING: please, no spaces at the start of a line
#1001: drivers/scsi/vhba/vhba.c:929:
+    if (!vdev->kbuf) {$

WARNING: braces {} are not necessary for single statement blocks
#1001: drivers/scsi/vhba/vhba.c:929:
+    if (!vdev->kbuf) {
+        return -ENOMEM;
+    }

ERROR: code indent should use tabs where possible
#1002: drivers/scsi/vhba/vhba.c:930:
+        return -ENOMEM;$

WARNING: please, no spaces at the start of a line
#1002: drivers/scsi/vhba/vhba.c:930:
+        return -ENOMEM;$

WARNING: please, no spaces at the start of a line
#1003: drivers/scsi/vhba/vhba.c:931:
+    }$

WARNING: please, no spaces at the start of a line
#1005: drivers/scsi/vhba/vhba.c:933:
+    if (!(retval = vhba_add_device(vdev))) {$

ERROR: do not use assignment in if condition
#1005: drivers/scsi/vhba/vhba.c:933:
+    if (!(retval = vhba_add_device(vdev))) {

WARNING: braces {} are not necessary for single statement blocks
#1005: drivers/scsi/vhba/vhba.c:933:
+    if (!(retval = vhba_add_device(vdev))) {
+        file->private_data = vdev;
+    }

ERROR: code indent should use tabs where possible
#1006: drivers/scsi/vhba/vhba.c:934:
+        file->private_data = vdev;$

WARNING: please, no spaces at the start of a line
#1006: drivers/scsi/vhba/vhba.c:934:
+        file->private_data = vdev;$

WARNING: please, no spaces at the start of a line
#1007: drivers/scsi/vhba/vhba.c:935:
+    }$

WARNING: please, no spaces at the start of a line
#1009: drivers/scsi/vhba/vhba.c:937:
+    vhba_device_put(vdev);$

WARNING: please, no spaces at the start of a line
#1011: drivers/scsi/vhba/vhba.c:939:
+    return retval;$

WARNING: space prohibited between function name and open parenthesis '('
#1014: drivers/scsi/vhba/vhba.c:942:
+int vhba_ctl_release (struct inode *inode, struct file *file)

WARNING: please, no spaces at the start of a line
#1016: drivers/scsi/vhba/vhba.c:944:
+    struct vhba_device *vdev;$

WARNING: please, no spaces at the start of a line
#1017: drivers/scsi/vhba/vhba.c:945:
+    struct vhba_command *vcmd;$

WARNING: please, no spaces at the start of a line
#1018: drivers/scsi/vhba/vhba.c:946:
+    unsigned long flags;$

WARNING: please, no spaces at the start of a line
#1020: drivers/scsi/vhba/vhba.c:948:
+    vdev = file->private_data;$

WARNING: please, no spaces at the start of a line
#1022: drivers/scsi/vhba/vhba.c:950:
+    pr_debug("ctl dev release\n");$

WARNING: please, no spaces at the start of a line
#1024: drivers/scsi/vhba/vhba.c:952:
+    vhba_device_get(vdev);$

WARNING: please, no spaces at the start of a line
#1025: drivers/scsi/vhba/vhba.c:953:
+    vhba_remove_device(vdev);$

WARNING: please, no spaces at the start of a line
#1027: drivers/scsi/vhba/vhba.c:955:
+    spin_lock_irqsave(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#1028: drivers/scsi/vhba/vhba.c:956:
+    list_for_each_entry(vcmd, &vdev->cmd_list, entry) {$

ERROR: code indent should use tabs where possible
#1029: drivers/scsi/vhba/vhba.c:957:
+        WARN_ON(vcmd->status == VHBA_REQ_READING || vcmd->status == VHBA_REQ_WRITING);$

WARNING: please, no spaces at the start of a line
#1029: drivers/scsi/vhba/vhba.c:957:
+        WARN_ON(vcmd->status == VHBA_REQ_READING || vcmd->status == VHBA_REQ_WRITING);$

ERROR: code indent should use tabs where possible
#1031: drivers/scsi/vhba/vhba.c:959:
+        scmd_dbg(vcmd->cmd, "device released with command %lu (%p)\n", vcmd->metatag, vcmd->cmd);$

WARNING: please, no spaces at the start of a line
#1031: drivers/scsi/vhba/vhba.c:959:
+        scmd_dbg(vcmd->cmd, "device released with command %lu (%p)\n", vcmd->metatag, vcmd->cmd);$

ERROR: code indent should use tabs where possible
#1032: drivers/scsi/vhba/vhba.c:960:
+        vcmd->cmd->result = DID_NO_CONNECT << 16;$

WARNING: please, no spaces at the start of a line
#1032: drivers/scsi/vhba/vhba.c:960:
+        vcmd->cmd->result = DID_NO_CONNECT << 16;$

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#1033: drivers/scsi/vhba/vhba.c:961:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 16, 0)

WARNING: Comparisons should place the constant on the right side of the test
#1033: drivers/scsi/vhba/vhba.c:961:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 16, 0)

ERROR: code indent should use tabs where possible
#1034: drivers/scsi/vhba/vhba.c:962:
+        scsi_done(vcmd->cmd);$

WARNING: please, no spaces at the start of a line
#1034: drivers/scsi/vhba/vhba.c:962:
+        scsi_done(vcmd->cmd);$

ERROR: code indent should use tabs where possible
#1036: drivers/scsi/vhba/vhba.c:964:
+        vcmd->cmd->scsi_done(vcmd->cmd);$

WARNING: please, no spaces at the start of a line
#1036: drivers/scsi/vhba/vhba.c:964:
+        vcmd->cmd->scsi_done(vcmd->cmd);$

ERROR: code indent should use tabs where possible
#1038: drivers/scsi/vhba/vhba.c:966:
+        vhba_free_command(vcmd);$

WARNING: please, no spaces at the start of a line
#1038: drivers/scsi/vhba/vhba.c:966:
+        vhba_free_command(vcmd);$

WARNING: please, no spaces at the start of a line
#1039: drivers/scsi/vhba/vhba.c:967:
+    }$

WARNING: please, no spaces at the start of a line
#1040: drivers/scsi/vhba/vhba.c:968:
+    INIT_LIST_HEAD(&vdev->cmd_list);$

WARNING: please, no spaces at the start of a line
#1041: drivers/scsi/vhba/vhba.c:969:
+    spin_unlock_irqrestore(&vdev->cmd_lock, flags);$

WARNING: please, no spaces at the start of a line
#1043: drivers/scsi/vhba/vhba.c:971:
+    kfree(vdev->kbuf);$

WARNING: please, no spaces at the start of a line
#1044: drivers/scsi/vhba/vhba.c:972:
+    vdev->kbuf = NULL;$

WARNING: please, no spaces at the start of a line
#1046: drivers/scsi/vhba/vhba.c:974:
+    vhba_device_put(vdev);$

WARNING: please, no spaces at the start of a line
#1048: drivers/scsi/vhba/vhba.c:976:
+    return 0;$

WARNING: struct file_operations should normally be const
#1051: drivers/scsi/vhba/vhba.c:979:
+static struct file_operations vhba_ctl_fops = {

WARNING: please, no spaces at the start of a line
#1052: drivers/scsi/vhba/vhba.c:980:
+    .owner = THIS_MODULE,$

WARNING: please, no spaces at the start of a line
#1053: drivers/scsi/vhba/vhba.c:981:
+    .open = vhba_ctl_open,$

WARNING: please, no spaces at the start of a line
#1054: drivers/scsi/vhba/vhba.c:982:
+    .release = vhba_ctl_release,$

WARNING: please, no spaces at the start of a line
#1055: drivers/scsi/vhba/vhba.c:983:
+    .read = vhba_ctl_read,$

WARNING: please, no spaces at the start of a line
#1056: drivers/scsi/vhba/vhba.c:984:
+    .write = vhba_ctl_write,$

WARNING: please, no spaces at the start of a line
#1057: drivers/scsi/vhba/vhba.c:985:
+    .poll = vhba_ctl_poll,$

WARNING: please, no spaces at the start of a line
#1058: drivers/scsi/vhba/vhba.c:986:
+    .unlocked_ioctl = vhba_ctl_ioctl,$

WARNING: please, no spaces at the start of a line
#1060: drivers/scsi/vhba/vhba.c:988:
+    .compat_ioctl = vhba_ctl_compat_ioctl,$

WARNING: please, no spaces at the start of a line
#1065: drivers/scsi/vhba/vhba.c:993:
+    .minor = MISC_DYNAMIC_MINOR,$

WARNING: please, no spaces at the start of a line
#1066: drivers/scsi/vhba/vhba.c:994:
+    .name = "vhba_ctl",$

WARNING: please, no spaces at the start of a line
#1067: drivers/scsi/vhba/vhba.c:995:
+    .fops = &vhba_ctl_fops,$

WARNING: space prohibited between function name and open parenthesis '('
#1070: drivers/scsi/vhba/vhba.c:998:
+int vhba_probe (struct platform_device *pdev)

WARNING: please, no spaces at the start of a line
#1072: drivers/scsi/vhba/vhba.c:1000:
+    struct Scsi_Host *shost;$

WARNING: please, no spaces at the start of a line
#1073: drivers/scsi/vhba/vhba.c:1001:
+    struct vhba_host *vhost;$

WARNING: please, no spaces at the start of a line
#1074: drivers/scsi/vhba/vhba.c:1002:
+    int i;$

WARNING: please, no spaces at the start of a line
#1076: drivers/scsi/vhba/vhba.c:1004:
+    vhba_can_queue = clamp(vhba_can_queue, 1, 256);$

WARNING: please, no spaces at the start of a line
#1078: drivers/scsi/vhba/vhba.c:1006:
+    shost = scsi_host_alloc(&vhba_template, sizeof(struct vhba_host));$

WARNING: please, no spaces at the start of a line
#1079: drivers/scsi/vhba/vhba.c:1007:
+    if (!shost) {$

WARNING: braces {} are not necessary for single statement blocks
#1079: drivers/scsi/vhba/vhba.c:1007:
+    if (!shost) {
+        return -ENOMEM;
+    }

ERROR: code indent should use tabs where possible
#1080: drivers/scsi/vhba/vhba.c:1008:
+        return -ENOMEM;$

WARNING: please, no spaces at the start of a line
#1080: drivers/scsi/vhba/vhba.c:1008:
+        return -ENOMEM;$

WARNING: please, no spaces at the start of a line
#1081: drivers/scsi/vhba/vhba.c:1009:
+    }$

WARNING: please, no spaces at the start of a line
#1083: drivers/scsi/vhba/vhba.c:1011:
+    shost->max_channel = VHBA_MAX_BUS-1;$

WARNING: please, no spaces at the start of a line
#1084: drivers/scsi/vhba/vhba.c:1012:
+    shost->max_id = VHBA_MAX_ID;$

WARNING: please, no spaces at the start of a line
#1086: drivers/scsi/vhba/vhba.c:1014:
+    shost->max_lun = 1;$

WARNING: please, no spaces at the start of a line
#1087: drivers/scsi/vhba/vhba.c:1015:
+    shost->max_cmd_len = MAX_COMMAND_SIZE;$

WARNING: please, no spaces at the start of a line
#1088: drivers/scsi/vhba/vhba.c:1016:
+    shost->can_queue = vhba_can_queue;$

WARNING: please, no spaces at the start of a line
#1089: drivers/scsi/vhba/vhba.c:1017:
+    shost->cmd_per_lun = vhba_can_queue;$

WARNING: please, no spaces at the start of a line
#1091: drivers/scsi/vhba/vhba.c:1019:
+    vhost = (struct vhba_host *)shost->hostdata;$

WARNING: please, no spaces at the start of a line
#1092: drivers/scsi/vhba/vhba.c:1020:
+    memset(vhost, 0, sizeof(struct vhba_host));$

WARNING: please, no spaces at the start of a line
#1094: drivers/scsi/vhba/vhba.c:1022:
+    vhost->shost = shost;$

WARNING: please, no spaces at the start of a line
#1095: drivers/scsi/vhba/vhba.c:1023:
+    vhost->num_devices = 0;$

WARNING: please, no spaces at the start of a line
#1096: drivers/scsi/vhba/vhba.c:1024:
+    spin_lock_init(&vhost->dev_lock);$

WARNING: please, no spaces at the start of a line
#1097: drivers/scsi/vhba/vhba.c:1025:
+    spin_lock_init(&vhost->cmd_lock);$

WARNING: please, no spaces at the start of a line
#1098: drivers/scsi/vhba/vhba.c:1026:
+    INIT_WORK(&vhost->scan_devices, vhba_scan_devices);$

WARNING: please, no spaces at the start of a line
#1099: drivers/scsi/vhba/vhba.c:1027:
+    vhost->cmd_next = 0;$

WARNING: please, no spaces at the start of a line
#1100: drivers/scsi/vhba/vhba.c:1028:
+    vhost->commands = kzalloc(vhba_can_queue * sizeof(struct vhba_command), GFP_KERNEL);$

WARNING: Prefer kcalloc over kzalloc with multiply
#1100: drivers/scsi/vhba/vhba.c:1028:
+    vhost->commands = kzalloc(vhba_can_queue * sizeof(struct vhba_command), GFP_KERNEL);

WARNING: please, no spaces at the start of a line
#1101: drivers/scsi/vhba/vhba.c:1029:
+    if (!vhost->commands) {$

WARNING: braces {} are not necessary for single statement blocks
#1101: drivers/scsi/vhba/vhba.c:1029:
+    if (!vhost->commands) {
+        return -ENOMEM;
+    }

ERROR: code indent should use tabs where possible
#1102: drivers/scsi/vhba/vhba.c:1030:
+        return -ENOMEM;$

WARNING: please, no spaces at the start of a line
#1102: drivers/scsi/vhba/vhba.c:1030:
+        return -ENOMEM;$

WARNING: please, no spaces at the start of a line
#1103: drivers/scsi/vhba/vhba.c:1031:
+    }$

WARNING: please, no spaces at the start of a line
#1105: drivers/scsi/vhba/vhba.c:1033:
+    for (i = 0; i < vhba_can_queue; i++) {$

WARNING: braces {} are not necessary for single statement blocks
#1105: drivers/scsi/vhba/vhba.c:1033:
+    for (i = 0; i < vhba_can_queue; i++) {
+        vhost->commands[i].status = VHBA_REQ_FREE;
+    }

ERROR: code indent should use tabs where possible
#1106: drivers/scsi/vhba/vhba.c:1034:
+        vhost->commands[i].status = VHBA_REQ_FREE;$

WARNING: please, no spaces at the start of a line
#1106: drivers/scsi/vhba/vhba.c:1034:
+        vhost->commands[i].status = VHBA_REQ_FREE;$

WARNING: please, no spaces at the start of a line
#1107: drivers/scsi/vhba/vhba.c:1035:
+    }$

WARNING: please, no spaces at the start of a line
#1109: drivers/scsi/vhba/vhba.c:1037:
+    platform_set_drvdata(pdev, vhost);$

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#1111: drivers/scsi/vhba/vhba.c:1039:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 4, 0)

WARNING: Comparisons should place the constant on the right side of the test
#1111: drivers/scsi/vhba/vhba.c:1039:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 4, 0)

WARNING: please, no spaces at the start of a line
#1112: drivers/scsi/vhba/vhba.c:1040:
+    i = scsi_init_shared_tag_map(shost, vhba_can_queue);$

WARNING: please, no spaces at the start of a line
#1113: drivers/scsi/vhba/vhba.c:1041:
+    if (i) return i;$

ERROR: trailing statements should be on next line
#1113: drivers/scsi/vhba/vhba.c:1041:
+    if (i) return i;

WARNING: please, no spaces at the start of a line
#1116: drivers/scsi/vhba/vhba.c:1044:
+    if (scsi_add_host(shost, &pdev->dev)) {$

ERROR: code indent should use tabs where possible
#1117: drivers/scsi/vhba/vhba.c:1045:
+        scsi_host_put(shost);$

WARNING: please, no spaces at the start of a line
#1117: drivers/scsi/vhba/vhba.c:1045:
+        scsi_host_put(shost);$

ERROR: code indent should use tabs where possible
#1118: drivers/scsi/vhba/vhba.c:1046:
+        return -ENOMEM;$

WARNING: please, no spaces at the start of a line
#1118: drivers/scsi/vhba/vhba.c:1046:
+        return -ENOMEM;$

WARNING: please, no spaces at the start of a line
#1119: drivers/scsi/vhba/vhba.c:1047:
+    }$

WARNING: please, no spaces at the start of a line
#1121: drivers/scsi/vhba/vhba.c:1049:
+    return 0;$

WARNING: space prohibited between function name and open parenthesis '('
#1124: drivers/scsi/vhba/vhba.c:1052:
+int vhba_remove (struct platform_device *pdev)

WARNING: please, no spaces at the start of a line
#1126: drivers/scsi/vhba/vhba.c:1054:
+    struct vhba_host *vhost;$

WARNING: please, no spaces at the start of a line
#1127: drivers/scsi/vhba/vhba.c:1055:
+    struct Scsi_Host *shost;$

WARNING: please, no spaces at the start of a line
#1129: drivers/scsi/vhba/vhba.c:1057:
+    vhost = platform_get_drvdata(pdev);$

WARNING: please, no spaces at the start of a line
#1130: drivers/scsi/vhba/vhba.c:1058:
+    shost = vhost->shost;$

WARNING: please, no spaces at the start of a line
#1132: drivers/scsi/vhba/vhba.c:1060:
+    scsi_remove_host(shost);$

WARNING: please, no spaces at the start of a line
#1133: drivers/scsi/vhba/vhba.c:1061:
+    scsi_host_put(shost);$

WARNING: please, no spaces at the start of a line
#1135: drivers/scsi/vhba/vhba.c:1063:
+    kfree(vhost->commands);$

WARNING: please, no spaces at the start of a line
#1137: drivers/scsi/vhba/vhba.c:1065:
+    return 0;$

ERROR: "foo * bar" should be "foo *bar"
#1140: drivers/scsi/vhba/vhba.c:1068:
+void vhba_release (struct device * dev)

WARNING: space prohibited between function name and open parenthesis '('
#1140: drivers/scsi/vhba/vhba.c:1068:
+void vhba_release (struct device * dev)

WARNING: please, no spaces at the start of a line
#1142: drivers/scsi/vhba/vhba.c:1070:
+    return;$

WARNING: please, no spaces at the start of a line
#1146: drivers/scsi/vhba/vhba.c:1074:
+    .name = "vhba",$

WARNING: please, no spaces at the start of a line
#1147: drivers/scsi/vhba/vhba.c:1075:
+    .id = -1,$

WARNING: please, no spaces at the start of a line
#1148: drivers/scsi/vhba/vhba.c:1076:
+    .dev = {$

ERROR: code indent should use tabs where possible
#1149: drivers/scsi/vhba/vhba.c:1077:
+        .release = vhba_release,$

WARNING: please, no spaces at the start of a line
#1149: drivers/scsi/vhba/vhba.c:1077:
+        .release = vhba_release,$

WARNING: please, no spaces at the start of a line
#1150: drivers/scsi/vhba/vhba.c:1078:
+    },$

WARNING: please, no spaces at the start of a line
#1154: drivers/scsi/vhba/vhba.c:1082:
+    .driver = {$

ERROR: code indent should use tabs where possible
#1155: drivers/scsi/vhba/vhba.c:1083:
+        .owner = THIS_MODULE,$

WARNING: please, no spaces at the start of a line
#1155: drivers/scsi/vhba/vhba.c:1083:
+        .owner = THIS_MODULE,$

ERROR: code indent should use tabs where possible
#1156: drivers/scsi/vhba/vhba.c:1084:
+        .name = "vhba",$

WARNING: please, no spaces at the start of a line
#1156: drivers/scsi/vhba/vhba.c:1084:
+        .name = "vhba",$

WARNING: please, no spaces at the start of a line
#1157: drivers/scsi/vhba/vhba.c:1085:
+    },$

WARNING: please, no spaces at the start of a line
#1158: drivers/scsi/vhba/vhba.c:1086:
+    .probe = vhba_probe,$

WARNING: please, no spaces at the start of a line
#1159: drivers/scsi/vhba/vhba.c:1087:
+    .remove = vhba_remove,$

WARNING: space prohibited between function name and open parenthesis '('
#1162: drivers/scsi/vhba/vhba.c:1090:
+int __init vhba_init (void)

WARNING: please, no spaces at the start of a line
#1164: drivers/scsi/vhba/vhba.c:1092:
+    int ret;$

WARNING: please, no spaces at the start of a line
#1166: drivers/scsi/vhba/vhba.c:1094:
+    ret = platform_device_register(&vhba_platform_device);$

WARNING: please, no spaces at the start of a line
#1167: drivers/scsi/vhba/vhba.c:1095:
+    if (ret < 0) {$

WARNING: braces {} are not necessary for single statement blocks
#1167: drivers/scsi/vhba/vhba.c:1095:
+    if (ret < 0) {
+        return ret;
+    }

ERROR: code indent should use tabs where possible
#1168: drivers/scsi/vhba/vhba.c:1096:
+        return ret;$

WARNING: please, no spaces at the start of a line
#1168: drivers/scsi/vhba/vhba.c:1096:
+        return ret;$

WARNING: please, no spaces at the start of a line
#1169: drivers/scsi/vhba/vhba.c:1097:
+    }$

WARNING: please, no spaces at the start of a line
#1171: drivers/scsi/vhba/vhba.c:1099:
+    ret = platform_driver_register(&vhba_platform_driver);$

WARNING: please, no spaces at the start of a line
#1172: drivers/scsi/vhba/vhba.c:1100:
+    if (ret < 0) {$

ERROR: code indent should use tabs where possible
#1173: drivers/scsi/vhba/vhba.c:1101:
+        platform_device_unregister(&vhba_platform_device);$

WARNING: please, no spaces at the start of a line
#1173: drivers/scsi/vhba/vhba.c:1101:
+        platform_device_unregister(&vhba_platform_device);$

ERROR: code indent should use tabs where possible
#1174: drivers/scsi/vhba/vhba.c:1102:
+        return ret;$

WARNING: please, no spaces at the start of a line
#1174: drivers/scsi/vhba/vhba.c:1102:
+        return ret;$

WARNING: please, no spaces at the start of a line
#1175: drivers/scsi/vhba/vhba.c:1103:
+    }$

WARNING: please, no spaces at the start of a line
#1177: drivers/scsi/vhba/vhba.c:1105:
+    ret = misc_register(&vhba_miscdev);$

WARNING: please, no spaces at the start of a line
#1178: drivers/scsi/vhba/vhba.c:1106:
+    if (ret < 0) {$

ERROR: code indent should use tabs where possible
#1179: drivers/scsi/vhba/vhba.c:1107:
+        platform_driver_unregister(&vhba_platform_driver);$

WARNING: please, no spaces at the start of a line
#1179: drivers/scsi/vhba/vhba.c:1107:
+        platform_driver_unregister(&vhba_platform_driver);$

ERROR: code indent should use tabs where possible
#1180: drivers/scsi/vhba/vhba.c:1108:
+        platform_device_unregister(&vhba_platform_device);$

WARNING: please, no spaces at the start of a line
#1180: drivers/scsi/vhba/vhba.c:1108:
+        platform_device_unregister(&vhba_platform_device);$

ERROR: code indent should use tabs where possible
#1181: drivers/scsi/vhba/vhba.c:1109:
+        return ret;$

WARNING: please, no spaces at the start of a line
#1181: drivers/scsi/vhba/vhba.c:1109:
+        return ret;$

WARNING: please, no spaces at the start of a line
#1182: drivers/scsi/vhba/vhba.c:1110:
+    }$

WARNING: please, no spaces at the start of a line
#1184: drivers/scsi/vhba/vhba.c:1112:
+    return 0;$

WARNING: please, no spaces at the start of a line
#1189: drivers/scsi/vhba/vhba.c:1117:
+    misc_deregister(&vhba_miscdev);$

WARNING: please, no spaces at the start of a line
#1190: drivers/scsi/vhba/vhba.c:1118:
+    platform_driver_unregister(&vhba_platform_driver);$

WARNING: please, no spaces at the start of a line
#1191: drivers/scsi/vhba/vhba.c:1119:
+    platform_device_unregister(&vhba_platform_device);$

ERROR: Missing Signed-off-by: line(s)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
