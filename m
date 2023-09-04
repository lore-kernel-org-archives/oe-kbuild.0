Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9347CC138
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Sep 2023 15:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693842580; x=1725378580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q7/9A6ioCcklSpgHn/bjqFeELEV8WHC2++X1P1hun0E=;
  b=UqpT1iTEDVtotp0twXp/KvRTz5dDnASoHw5wPlSolrRk25pTw+BaINYF
   XQD/P5OoTsuurWDZTuUsSW24dJ25rMF9XvMKZC4P5fS6o/xi9SKt6TZ90
   xZ5j88CLXJiUNzAtfxtEAQKvyW8alYOzjDmN3xrRfCZKdYZ6DEq3Jha7D
   dHRp0cAHwa+hPBDlxCTTDu84jorwP9ANtJw2X3SUeYqyuj8VIAObyqzbX
   aHJq+zae04DtLof+Nm7/z/015b8mW1PSxf+du7zlR7dtIDkWJgm5bvHFo
   IcY5SuXWOrcv6BGRYOHbqqD8IVaV8CNkL8pwrIB7LO4XoxBTT1r6k7UKG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="361656445"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="361656445"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 08:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="884046605"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="884046605"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 04 Sep 2023 08:49:33 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdBpY-0000cN-2f;
	Mon, 04 Sep 2023 15:49:36 +0000
Date: Mon, 4 Sep 2023 23:49:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hid:for-next 1/2] checkpatch: WARNING: usb_free_urb(NULL) is safe
 and this check is probably not required
Message-ID: <202309042350.yID5wItw-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
head:   bd0ffb67f8d3ec8d3b78dbf049f294db532e0b56
commit: e1cd4004cde7c9b694bbdd8def0e02288ee58c74 [1/2] HID: sony: Fix a potential memory leak in sony_probe()
:::::: branch date: 6 hours ago
:::::: commit date: 7 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230904/202309042350.yID5wItw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309042350.yID5wItw-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: usb_free_urb(NULL) is safe and this check is probably not required
#25: drivers/hid/hid-sony.c:2159:
+	if (sc->ghl_urb)
+		usb_free_urb(sc->ghl_urb);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
