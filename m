Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E79C2D29C7
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 06:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766126426; cv=none; b=nLZtGKD+xxuy2jf+qOSC3389O5HwRzDavcRBTJA9lc1TI0cJXV1R8bc4ZEWQSYHuqteBc+8RmAu394MaQQQCT8ql90mUgOp8LAZuCJSVx+Hy9W/VIO31tENVixCQ4TlguKJYfr1E9hHzhwxkraBdW/RUYqF63mX+NEFnlGaeQPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766126426; c=relaxed/simple;
	bh=VUrPzZgyB3KrU5F02MrZCKoe2sXnlXRsRBmmJK+4TOo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rtxglf/zbPHp0luEtddUV+GWTmX7VfLUy19f2tJqjpgcsi1vO1i45a2lnnsrjrkHM0D2JOgc/gYWRMvKpPYail7W9y4qFotjZu+sCLq+hvCnvZgPljkEhGoksiuj5kWxz5OC1NHleFjFgOfkldxfR/C3G24GyP2LpLloTlMICfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWFN+xeD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWFN+xeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766126424; x=1797662424;
  h=date:from:to:subject:message-id:mime-version;
  bh=VUrPzZgyB3KrU5F02MrZCKoe2sXnlXRsRBmmJK+4TOo=;
  b=QWFN+xeDSivai2Qrf9zeo3y+LesPxzsSh8LqF0H1v3hD/auFSMIpNFbS
   qY9txMlHGJ5N00NmjInj5fLMbXIEr0bP7b2cftrq2BSxoXgQGtj+9h8DI
   lCGvuy2FnsxEFDtU2V+lFANTjxMtWFhaiZ1nCoKL5ZUOeXw7OHukYeTGk
   MyTdCNzCg7lPCwkN7mmCSdjB0WQzSTwqK1+MbNtYuxWdmA01c91HPTZEF
   8LjvAoxEi7buVSC2U23tcIitQvrx/dW0MfxtzDmLJNh5EwlDlWkiYIXL3
   EC9WyvKTRDqQSvmjIw1MuqXMqiBrZhLiIYEq4U4chWrlm7Q3bbYSurQkS
   g==;
X-CSE-ConnectionGUID: /u2cB7T9RRCKCHBXIC4VHA==
X-CSE-MsgGUID: Sp38cBbQT5yMb9sGhp4Ufg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67283641"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="67283641"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 22:40:23 -0800
X-CSE-ConnectionGUID: y87/V+FoS9Gh/0s2Uneqrg==
X-CSE-MsgGUID: klZLhDn/R2igWMJ/6CDqhQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 18 Dec 2025 22:40:21 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWU9y-000000004DB-3UaI
	for oe-kbuild@lists.linux.dev;
	Fri, 19 Dec 2025 06:40:18 +0000
Date: Fri, 19 Dec 2025 07:39:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal:spec 3/131] checkpatch: WARNING:PREFER_SEQ_PUTS: Prefer
 seq_puts to seq_printf
Message-ID: <202512190737.hZH7RgtV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: 6aa31f1ccf3199d75896dd96df920fedd842db81 [3/131] kernel/api: add debugfs interface for kernel API specifications
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251219/202512190737.hZH7RgtV-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#129: FILE: kernel/api/kapi_debugfs.c:46:
+	seq_printf(m, "    flags: ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#130: FILE: kernel/api/kapi_debugfs.c:47:
+	if (flags & KAPI_PARAM_IN) seq_printf(m, "IN ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#131: FILE: kernel/api/kapi_debugfs.c:48:
+	if (flags & KAPI_PARAM_OUT) seq_printf(m, "OUT ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#132: FILE: kernel/api/kapi_debugfs.c:49:
+	if (flags & KAPI_PARAM_INOUT) seq_printf(m, "INOUT ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#133: FILE: kernel/api/kapi_debugfs.c:50:
+	if (flags & KAPI_PARAM_OPTIONAL) seq_printf(m, "OPTIONAL ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#134: FILE: kernel/api/kapi_debugfs.c:51:
+	if (flags & KAPI_PARAM_CONST) seq_printf(m, "CONST ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#135: FILE: kernel/api/kapi_debugfs.c:52:
+	if (flags & KAPI_PARAM_USER) seq_printf(m, "USER ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#136: FILE: kernel/api/kapi_debugfs.c:53:
+	if (flags & KAPI_PARAM_VOLATILE) seq_printf(m, "VOLATILE ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#137: FILE: kernel/api/kapi_debugfs.c:54:
+	if (flags & KAPI_PARAM_DMA) seq_printf(m, "DMA ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#138: FILE: kernel/api/kapi_debugfs.c:55:
+	if (flags & KAPI_PARAM_ALIGNED) seq_printf(m, "ALIGNED ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#139: FILE: kernel/api/kapi_debugfs.c:56:
+	seq_printf(m, "\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#145: FILE: kernel/api/kapi_debugfs.c:62:
+	seq_printf(m, "Context flags: ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#146: FILE: kernel/api/kapi_debugfs.c:63:
+	if (flags & KAPI_CTX_PROCESS) seq_printf(m, "PROCESS ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#147: FILE: kernel/api/kapi_debugfs.c:64:
+	if (flags & KAPI_CTX_HARDIRQ) seq_printf(m, "HARDIRQ ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#148: FILE: kernel/api/kapi_debugfs.c:65:
+	if (flags & KAPI_CTX_SOFTIRQ) seq_printf(m, "SOFTIRQ ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#149: FILE: kernel/api/kapi_debugfs.c:66:
+	if (flags & KAPI_CTX_NMI) seq_printf(m, "NMI ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#150: FILE: kernel/api/kapi_debugfs.c:67:
+	if (flags & KAPI_CTX_SLEEPABLE) seq_printf(m, "SLEEPABLE ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#151: FILE: kernel/api/kapi_debugfs.c:68:
+	if (flags & KAPI_CTX_ATOMIC) seq_printf(m, "ATOMIC ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#152: FILE: kernel/api/kapi_debugfs.c:69:
+	if (flags & KAPI_CTX_PREEMPT_DISABLED) seq_printf(m, "PREEMPT_DISABLED ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#153: FILE: kernel/api/kapi_debugfs.c:70:
+	if (flags & KAPI_CTX_IRQ_DISABLED) seq_printf(m, "IRQ_DISABLED ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#154: FILE: kernel/api/kapi_debugfs.c:71:
+	seq_printf(m, "\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#163: FILE: kernel/api/kapi_debugfs.c:80:
+	seq_printf(m, "Kernel API Specification\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#164: FILE: kernel/api/kapi_debugfs.c:81:
+	seq_printf(m, "========================\n\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#175: FILE: kernel/api/kapi_debugfs.c:92:
+	seq_printf(m, "\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#195: FILE: kernel/api/kapi_debugfs.c:112:
+				seq_printf(m, "    constraints:\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#198: FILE: kernel/api/kapi_debugfs.c:115:
+					seq_printf(m, "      type: range\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#203: FILE: kernel/api/kapi_debugfs.c:120:
+					seq_printf(m, "      type: mask\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#207: FILE: kernel/api/kapi_debugfs.c:124:
+					seq_printf(m, "      type: enum\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#211: FILE: kernel/api/kapi_debugfs.c:128:
+					seq_printf(m, "      type: user_string\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#216: FILE: kernel/api/kapi_debugfs.c:133:
+					seq_printf(m, "      type: user_path\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#217: FILE: kernel/api/kapi_debugfs.c:134:
+					seq_printf(m, "      max_len: PATH_MAX (4096)\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#220: FILE: kernel/api/kapi_debugfs.c:137:
+					seq_printf(m, "      type: user_ptr\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#224: FILE: kernel/api/kapi_debugfs.c:141:
+					seq_printf(m, "      type: custom\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#233: FILE: kernel/api/kapi_debugfs.c:150:
+			seq_printf(m, "\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#238: FILE: kernel/api/kapi_debugfs.c:155:
+	seq_printf(m, "Return value:\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#253: FILE: kernel/api/kapi_debugfs.c:170:
+		seq_printf(m, "  success: valid file descriptor (>= 0)\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#256: FILE: kernel/api/kapi_debugfs.c:173:
+		seq_printf(m, "  success: error check\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#259: FILE: kernel/api/kapi_debugfs.c:176:
+		seq_printf(m, "  success: custom check\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#264: FILE: kernel/api/kapi_debugfs.c:181:
+	seq_printf(m, "\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#276: FILE: kernel/api/kapi_debugfs.c:193:
+		seq_printf(m, "\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#305: FILE: kernel/api/kapi_debugfs.c:222:
+		seq_printf(m, "\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#317: FILE: kernel/api/kapi_debugfs.c:234:
+			seq_printf(m, "\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#321: FILE: kernel/api/kapi_debugfs.c:238:
+		seq_printf(m, "\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#330: FILE: kernel/api/kapi_debugfs.c:247:
+			seq_printf(m, "    direction: ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#331: FILE: kernel/api/kapi_debugfs.c:248:
+			if (sig->direction & KAPI_SIGNAL_SEND) seq_printf(m, "send ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#332: FILE: kernel/api/kapi_debugfs.c:249:
+			if (sig->direction & KAPI_SIGNAL_RECEIVE) seq_printf(m, "receive ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#333: FILE: kernel/api/kapi_debugfs.c:250:
+			if (sig->direction & KAPI_SIGNAL_HANDLE) seq_printf(m, "handle ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#334: FILE: kernel/api/kapi_debugfs.c:251:
+			if (sig->direction & KAPI_SIGNAL_BLOCK) seq_printf(m, "block ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#335: FILE: kernel/api/kapi_debugfs.c:252:
+			if (sig->direction & KAPI_SIGNAL_IGNORE) seq_printf(m, "ignore ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#336: FILE: kernel/api/kapi_debugfs.c:253:
+			seq_printf(m, "\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#337: FILE: kernel/api/kapi_debugfs.c:254:
+			seq_printf(m, "    action: ");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#349: FILE: kernel/api/kapi_debugfs.c:266:
+			seq_printf(m, "\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#353: FILE: kernel/api/kapi_debugfs.c:270:
+		seq_printf(m, "\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#388: FILE: kernel/api/kapi_debugfs.c:305:
+	seq_printf(m, "Available Kernel API Specifications\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#389: FILE: kernel/api/kapi_debugfs.c:306:
+	seq_printf(m, "===================================\n\n");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
