Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FAA8838
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 21:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694468991; x=1726004991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qkuGyvYbPm6eG4BvCpXlNvxKN1YFdPUtPJoGJeseV+s=;
  b=MWe1xRScY4ZxehrirTzKvVS0BqniiSKTZdzJ4/CtQcUkVUr6EtHlCjVC
   JBP3BCSllI0Wr6ZkcF4EPM8KAyh9jKuLbVsJ0cZsbrjXIY5mh3zB3cAvV
   dC9Mt23eBXJL8Tmwu1VvL4+G9DHWbAimOV9ynbixFI3CK17c8xPfC4H8e
   KxacoAjAJky1anUz2yE1P0x2M4h5S9GlA/EmlwSpX6CjFfHROhHtpxBs+
   ehmDcRNbYfy7TsKlvejJvV6cZ34DM0VvP77E6TP3QOQNOZgO6iPcfEeaR
   2VLzRrgAEd0Qm9DAmxpF8WdTGwmsUGjaGpGW/G4B7/yYTfClgG8sR4Twl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="368470026"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="368470026"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 14:47:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="886695923"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="886695923"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2023 14:47:22 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfokz-0006lw-2s;
	Mon, 11 Sep 2023 21:47:45 +0000
Date: Tue, 12 Sep 2023 05:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-ci:arm64-gcs 38/39] checkpatch: WARNING: calloc uses number
 as first arg, sizeof is generally wrong
Message-ID: <202309120515.KBeqSbtp-lkp@intel.com>
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
TO: Mark Brown <broonie@kernel.org>
INFO skip CC for checkpatch warnings

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   5886243daf585a7ed8f45646340af1ee602e1edd
commit: b29ad5079f15080ebaf4ba09de3d2bf1ea417d62 [38/39] kselftest/arm64: Add a GCS stress test
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230912/202309120515.KBeqSbtp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309120515.KBeqSbtp-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#57: 
new file mode 100644

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#65: tools/testing/selftests/arm64/gcs/gcs-stress-thread.S:1:
+// Program that loops for ever doing lots of recursions and system calls,

WARNING: Missing a blank line after declarations
#432: tools/testing/selftests/arm64/gcs/gcs-stress.c:51:
+	long nproc = sysconf(_SC_NPROCESSORS_CONF);
+	if (nproc < 0) {

WARNING: Possible repeated word: 'on'
#486: tools/testing/selftests/arm64/gcs/gcs-stress.c:105:
+		 * carry on on error since this isn't super critical.

WARNING: Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90
#553: tools/testing/selftests/arm64/gcs/gcs-stress.c:172:
+		strncpy(work, child->output, sizeof(work) - 1);

WARNING: calloc uses number as first arg, sizeof is generally wrong
#780: tools/testing/selftests/arm64/gcs/gcs-stress.c:399:
+	children = calloc(sizeof(*children), tests);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
