Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD1CAD5F
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Sep 2023 13:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693834663; x=1725370663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B+gBFuKZQRQ9wN5yarHfZuAE33RNdEXXlLJe5Qbada4=;
  b=DQ4YSGQ2ZwsjDldU6jtaUzXNAuDhU8yJx33e4QM5waLaClWlpTR4j6dd
   NhZFT32A676KHIGadb8HnCtaWNvGteEBVDnwpY5yty868GiO37RT0H43K
   Vhs8EG11AUHB0cFMPRaHSTuVZ67OrbzLVUsJ3yJYfTUqBJYaKboeSx6Mk
   fR/rkQ/mV7QGmWm5OT08cBYpefOKD9yRXIXBq7s1weHolPpny8GiawJVF
   FyEtk1WbLSkY+9LS2QE2baUB4bRRaVUAHuEM81rgYUXS7D9QU4bTYQIhi
   QTXesEcaTEXx5H7fiX0aD9hS5HlyWO92BOiskJAJSqW+CPXg9tGssn1j/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="442995146"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="442995146"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 06:37:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="690596222"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="690596222"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Sep 2023 06:37:40 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qd9lq-0000WP-1S;
	Mon, 04 Sep 2023 13:37:38 +0000
Date: Mon, 4 Sep 2023 21:36:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hid:for-6.6/upstream-fixes 1/1] checkpatch: WARNING:
 usb_free_urb(NULL) is safe and this check is probably not required
Message-ID: <202309042157.gVNgqG7T-lkp@intel.com>
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
CC: linux-input@vger.kernel.org
TO: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: Jiri Kosina <jkosina@suse.cz>
INFO skip CC for checkpatch warnings

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-6.6/upstream-fixes
head:   e1cd4004cde7c9b694bbdd8def0e02288ee58c74
commit: e1cd4004cde7c9b694bbdd8def0e02288ee58c74 [1/1] HID: sony: Fix a potential memory leak in sony_probe()
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230904/202309042157.gVNgqG7T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309042157.gVNgqG7T-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: usb_free_urb(NULL) is safe and this check is probably not required
#25: drivers/hid/hid-sony.c:2159:
+	if (sc->ghl_urb)
+		usb_free_urb(sc->ghl_urb);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
