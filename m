Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7D7280033
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Nov 2025 18:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762538731; cv=none; b=XfC45qLNNHuhneBu3dcm8RVTYZJK64oL41NqtJvs/M/0NtuP/qMw/RarY9VadyR7Ce987SCOQGrYTLS1ym9CeIYHyZquEwldGRqT6qaGzbl2H7v8seplls4ikxl4LYo47SNbby0j1dsFbzhDHlFirjOctH2rJcwEkmg+3fhCNxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762538731; c=relaxed/simple;
	bh=wU8aizVxkkJ6NleDmK5Hw3f7WeFLOsMo4F8srOgbJdI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eigWoRJwgBQx1jq6lK/eAGTboQFf1g+MrZJj5Og6p7rd/knDVG9aZjBvFDyVKgP09leiashAp0OdrisPO3NxqiFuGeSKG+ZRypoCETRvryi9E8nfVWiNeVZrkKRmEonxOMgLmgbg8HCS5FryEd86IhtRFE14l/aBHiAHYeVfJk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPmNQXTi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPmNQXTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762538729; x=1794074729;
  h=date:from:to:subject:message-id:mime-version;
  bh=wU8aizVxkkJ6NleDmK5Hw3f7WeFLOsMo4F8srOgbJdI=;
  b=kPmNQXTiUJralvmLDB1trJYoRLZ85xkYN6IaN5M5Ia5Lw/wnT0HJdie1
   ImMMq1OyntvKErc0+CWwKyyDSVB9vKPjCMVNtJY+K8dGLMitKOdZ3Begn
   +Kg9xSfv8qfTYf/9yYrTe1SM4XmyuYK/z8rrSrDymfQu22iiE5jAdE8Da
   8Q1N/z7uTBNHoHT26EY07tDntuX/vSodkOD8Mc4aiumtG0K/rqJrgamJF
   T1J7GBQKCD7lM0tbeZMaBAKy4HXL9acgNiQQGJmf2EjuMezMwW3Yhnf9E
   0/JtqneEbnci7JGoDVYHwDuHE9/2INbSy7AYdwPVFKYMVOIEWs5O9qPFN
   A==;
X-CSE-ConnectionGUID: tNUgSKJhSNGGoAa0lCPacQ==
X-CSE-MsgGUID: /P4l6a69Sj63XHAgCpOCyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64732367"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="64732367"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 10:05:28 -0800
X-CSE-ConnectionGUID: I8rJGPpkSXGMRpHRVmYVug==
X-CSE-MsgGUID: 2vgxuEBdSsKrMMOW8Wi/DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="188529014"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 07 Nov 2025 10:05:27 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vHQpx-000000003Tg-13zo
	for oe-kbuild@lists.linux.dev;
	Fri, 07 Nov 2025 18:05:25 +0000
Date: Fri, 7 Nov 2025 19:05:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 1/1] checkpatch: WARNING: Missing or
 malformed SPDX-License-Identifier tag in line 1
Message-ID: <202511071940.yxee1LxU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Zach Brown <zab@zabbo.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   e8e76da7ed715ef67ccc4436f4981a5b39983d9f
commit: e8e76da7ed715ef67ccc4436f4981a5b39983d9f [1/1] rpdfs: initial commit
reproduce: (https://download.01.org/0day-ci/archive/20251107/202511071940.yxee1LxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511071940.yxee1LxU-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#162: FILE: fs/rpdfs/balloc.c:1:
+/* SPDX-License-Identifier: GPL-2.0 */

WARNING:LINE_SPACING: Missing a blank line after declarations
#244: FILE: fs/rpdfs/balloc.c:83:
+	u64 ignored;
+	return rpdfs_balloc_prepare_alloc_peek(rfi, txn, &ignored);

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#347: FILE: fs/rpdfs/block.c:1:
+/* SPDX-License-Identifier: GPL-2.0 */

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#525: FILE: fs/rpdfs/block.c:179:
+#define RBA(bk) \
+	(bk)->hnd.bnr, (bk)->hnd.wcount, atomic64_read(&(bk)->refcount), (bk)->readers, \
+	bitfield_char(bk->dirty, 'd'), bitfield_char(bk->upd_meta,  'M'), \
+	bitfield_char(bk->upd_data, 'D'), bitfield_char(bk->writer,  'w'), \
+	(bk)->request_mode, (bk)->grant_mode, (bk)->confirm_mode, (bk)->write_confirm_mode

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#603: FILE: fs/rpdfs/block.c:257:
+	for (unsigned seq__, retry__ = 1; \

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#1129: FILE: fs/rpdfs/block.c:783:
+						 struct rpdfs_dirty_boundary *bnd, unsigned i)

ERROR:CODE_INDENT: code indent should use tabs where possible
#1462: FILE: fs/rpdfs/block.c:1116:
+        for (pos = (list)->next; \$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1463: FILE: fs/rpdfs/block.c:1117:
+             !list_is_head(pos, (list)) && \$

ERROR:CODE_INDENT: code indent should use tabs where possible
#1465: FILE: fs/rpdfs/block.c:1119:
+             pos = pos->next)$

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#2092: FILE: fs/rpdfs/btree.c:1:
+/* SPDX-License-Identifier: GPL-2.0 */

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#3045: FILE: fs/rpdfs/btree_txn.c:1:
+/* SPDX-License-Identifier: GPL-2.0 */

WARNING:NEW_TYPEDEFS: do not add new typedefs
#3071: FILE: fs/rpdfs/btree_txn.c:27:
+typedef enum {

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3127: FILE: fs/rpdfs/btree_txn.c:83:
+				   rbt_op_t op, unsigned leaf_val_size)

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3135: FILE: fs/rpdfs/btree_txn.c:91:
+	unsigned val_size;

ERROR:CODE_INDENT: code indent should use tabs where possible
#3288: FILE: fs/rpdfs/btree_txn.c:244:
+^I^I^I        ref, (*hnd)->data);$

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3349: FILE: fs/rpdfs/btree_txn.c:305:
+				 rbt_op_t op, unsigned leaf_val_size,

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3357: FILE: fs/rpdfs/btree_txn.c:313:
+	unsigned val_size;

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3422: FILE: fs/rpdfs/btree_txn.c:378:
+				   unsigned val_size, rpdfs_btree_item_cb_t item_cb, void *cb_arg)

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3429: FILE: fs/rpdfs/btree_txn.c:385:
+				 unsigned val_size, rpdfs_btree_item_cb_t item_cb, void *cb_arg)

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3439: FILE: fs/rpdfs/btree_txn.c:395:
+				   unsigned val_size, rpdfs_btree_item_cb_t item_cb, void *cb_arg)

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3446: FILE: fs/rpdfs/btree_txn.c:402:
+				 unsigned val_size, rpdfs_btree_item_cb_t item_cb, void *cb_arg)

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3554: FILE: fs/rpdfs/btree_txn.h:10:
+				   unsigned val_size, rpdfs_btree_item_cb_t item_cb, void *cb_arg);

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3557: FILE: fs/rpdfs/btree_txn.h:13:
+				 unsigned val_size, rpdfs_btree_item_cb_t item_cb, void *cb_arg);

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3560: FILE: fs/rpdfs/btree_txn.h:16:
+				   unsigned val_size, rpdfs_btree_item_cb_t item_cb, void *cb_arg);

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3563: FILE: fs/rpdfs/btree_txn.h:19:
+				 unsigned val_size, rpdfs_btree_item_cb_t item_cb, void *cb_arg);

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#3604: FILE: fs/rpdfs/dir.c:1:
+/* SPDX-License-Identifier: GPL-2.0 */

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3648: FILE: fs/rpdfs/dir.c:45:
+static unsigned dent_size(unsigned name_len)

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3648: FILE: fs/rpdfs/dir.c:45:
+static unsigned dent_size(unsigned name_len)

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3653: FILE: fs/rpdfs/dir.c:50:
+static bool names_match(const char *a, unsigned a_len, const char *b, unsigned b_len)

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3653: FILE: fs/rpdfs/dir.c:50:
+static bool names_match(const char *a, unsigned a_len, const char *b, unsigned b_len)

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3659: FILE: fs/rpdfs/dir.c:56:
+			      unsigned name_len)

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#3959: FILE: fs/rpdfs/dir.c:356:
+	const unsigned name_len = dentry->d_name.len;

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#4166: FILE: fs/rpdfs/dir.c:563:
+	if (!new_inode)
+               i_size_write(new_dir, i_size_read(new_dir) + new_dentry->d_name.len);

ERROR:CODE_INDENT: code indent should use tabs where possible
#4167: FILE: fs/rpdfs/dir.c:564:
+               i_size_write(new_dir, i_size_read(new_dir) + new_dentry->d_name.len);$

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#4313: FILE: fs/rpdfs/file.c:1:
+/* SPDX-License-Identifier: GPL-2.0 */

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#4549: FILE: fs/rpdfs/format-block.h:206:
+#define RPDFS_DIRENT_DOT_HASH^I ^I0ULL$

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#4684: FILE: fs/rpdfs/inode.c:1:
+/* SPDX-License-Identifier: GPL-2.0 */

WARNING:LINE_SPACING: Missing a blank line after declarations
#4736: FILE: fs/rpdfs/inode.c:53:
+	u32 i = (u32)ino ^ (ino >> 32);
+	if (i <= RPDFS_ROOT_INO)

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#4820: FILE: fs/rpdfs/inode.c:137:
+	unsigned seq;

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#4938: FILE: fs/rpdfs/inode.c:255:
+	if (ret < 0) {
+	       if (!IS_ERR_OR_NULL(inode))

WARNING:TABSTOP: Statements should start on a tabstop
#4939: FILE: fs/rpdfs/inode.c:256:
+	       if (!IS_ERR_OR_NULL(inode))

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (15, 24)
#4939: FILE: fs/rpdfs/inode.c:256:
+	       if (!IS_ERR_OR_NULL(inode))
+			iget_failed(inode);

ERROR:CODE_INDENT: code indent should use tabs where possible
#5042: FILE: fs/rpdfs/inode.c:359:
+                return 0;$

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#5176: FILE: fs/rpdfs/map.c:1:
+/* SPDX-License-Identifier: GPL-2.0 */

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#5297: FILE: fs/rpdfs/map.c:122:
+	unsigned seq;

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#5436: FILE: fs/rpdfs/mkfs.c:1:
+/* SPDX-License-Identifier: GPL-2.0 */

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#5520: FILE: fs/rpdfs/net.c:1:
+/* SPDX-License-Identifier: GPL-2.0 */

ERROR:CODE_INDENT: code indent should use tabs where possible
#5579: FILE: fs/rpdfs/net.c:60:
+^I        (a->_sin.sin_port != b->_sin.sin_port ||$

ERROR:CODE_INDENT: code indent should use tabs where possible
#5580: FILE: fs/rpdfs/net.c:61:
+^I         a->_sin.sin_addr.s_addr != b->_sin.sin_addr.s_addr));$

ERROR:SPACING: space required before the open parenthesis '('
#5829: FILE: fs/rpdfs/net.c:310:
+	switch(md->type) {

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#5989: FILE: fs/rpdfs/net.c:470:
+	switch (nerrno) {
+		case -EIO: return RPDFS_MSG_ERR_EIO;
+		case -ENOMEM: default: return RPDFS_MSG_ERR_EIO;

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#6225: FILE: fs/rpdfs/net_tcp.c:1:
+/* SPDX-License-Identifier: GPL-2.0 */

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#6709: FILE: fs/rpdfs/parse.c:1:
+/* SPDX-License-Identifier: GPL-2.0 */

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#6809: FILE: fs/rpdfs/rht.c:1:
+/* SPDX-License-Identifier: GPL-2.0 */

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#6899: FILE: fs/rpdfs/super.c:1:
+/* SPDX-License-Identifier: GPL-2.0 */

ERROR:CODE_INDENT: code indent should use tabs where possible
#7023: FILE: fs/rpdfs/super.c:125:
+        fc->root = dget(sb->s_root);$

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#7041: FILE: fs/rpdfs/super.c:143:
+	fsparam_flag	("mkfs",			Opt_mkfs),

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#7042: FILE: fs/rpdfs/super.c:144:
+	fsparam_string	("source",			Opt_source),

WARNING:LINE_SPACING: Missing a blank line after declarations
#7121: FILE: fs/rpdfs/super.c:223:
+		struct inode *inode;
+		spin_lock(&sb->s_inode_list_lock);

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#7223: FILE: fs/rpdfs/txn.c:1:
+/* SPDX-License-Identifier: GPL-2.0 */

WARNING:NEW_TYPEDEFS: do not add new typedefs
#7393: FILE: fs/rpdfs/txn.c:171:
+typedef enum {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
