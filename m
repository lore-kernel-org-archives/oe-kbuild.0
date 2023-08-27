Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B703817E4
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Aug 2023 09:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693128887; x=1724664887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pRPf0hLO1fkNcjPDkqB6GsjliXP/2rABHqoDbWtfPWQ=;
  b=Kdp0PndShMi6xg470+ABziqfQovrb/c2Jcb2LPu6cxqjrBdlyWeqwznr
   tXM5yEc74ul9x0U6CaYB3PvRiZNHTz9r645LSZtAkztGrP7EASwQxDhua
   PIKuFupDMJdgFxjdXen5oOwOd9M5pz8a2VaFm84yjIu4nVdbGjwzPl6Re
   CM3CEiXojwDhztOIMcAhZHTnohsDIzIka26pX5rtaPOTLZS0kSgkVi8j7
   nqefRiVIgdeT2TykyLHE57DAoxnA+iii3Fgubx0A4QV7ZUD18KhdC3XFX
   TNnnws3o+90YQ3R3gYi2l9CpoDdwb3UZFPbU36zT3xQC9b4tBI3BNL6zL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="355263065"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="355263065"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 02:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="741067152"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="741067152"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 27 Aug 2023 02:34:43 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaCAN-0005cg-0q;
	Sun, 27 Aug 2023 09:34:43 +0000
Date: Sun, 27 Aug 2023 17:34:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jejb-scsi:fixes-base 10/21] checkpatch: WARNING: simple_strtoul is
 obsolete, use kstrtoul instead
Message-ID: <202308271727.ZB63T8Ip-lkp@intel.com>
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
CC: linux-scsi@vger.kernel.org
TO: Tony Battersby <tonyb@cybernetics.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
INFO skip CC for checkpatch warnings

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git fixes-base
head:   1bd3a76880b2bce017987cf53780b372cf59528e
commit: 9426d3cef5000824e5f24f80ed5f42fb935f2488 [10/21] scsi: core: Fix legacy /proc parsing buffer overflow
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271727.ZB63T8Ip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308271727.ZB63T8Ip-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: simple_strtoul is obsolete, use kstrtoul instead
#82: drivers/scsi/scsi_proc.c:440:
+		host    = (p     < end) ? simple_strtoul(p, &p, 0) : 0;

WARNING: simple_strtoul is obsolete, use kstrtoul instead
#83: drivers/scsi/scsi_proc.c:441:
+		channel = (p + 1 < end) ? simple_strtoul(p + 1, &p, 0) : 0;

WARNING: simple_strtoul is obsolete, use kstrtoul instead
#84: drivers/scsi/scsi_proc.c:442:
+		id      = (p + 1 < end) ? simple_strtoul(p + 1, &p, 0) : 0;

WARNING: simple_strtoul is obsolete, use kstrtoul instead
#85: drivers/scsi/scsi_proc.c:443:
+		lun     = (p + 1 < end) ? simple_strtoul(p + 1, &p, 0) : 0;

WARNING: simple_strtoul is obsolete, use kstrtoul instead
#97: drivers/scsi/scsi_proc.c:454:
+		host    = (p     < end) ? simple_strtoul(p, &p, 0) : 0;

WARNING: simple_strtoul is obsolete, use kstrtoul instead
#98: drivers/scsi/scsi_proc.c:455:
+		channel = (p + 1 < end) ? simple_strtoul(p + 1, &p, 0) : 0;

WARNING: simple_strtoul is obsolete, use kstrtoul instead
#99: drivers/scsi/scsi_proc.c:456:
+		id      = (p + 1 < end) ? simple_strtoul(p + 1, &p, 0) : 0;

WARNING: simple_strtoul is obsolete, use kstrtoul instead
#100: drivers/scsi/scsi_proc.c:457:
+		lun     = (p + 1 < end) ? simple_strtoul(p + 1, &p, 0) : 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
