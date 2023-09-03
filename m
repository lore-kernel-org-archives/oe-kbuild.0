Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F5D1C13
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 18:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693766286; x=1725302286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kvCBkx9Uhe86OazER8srdsJmz6dZgf4yqpL7a2yl0PI=;
  b=BWDZBuwkjyDW1F9Ln46QBIWNdwfw3rKPmX9aLVoKYGz5ONDbjTdx1YCC
   zjy2Jqb5ZFL50AZIce7GD0po9YFzmvGIkl53Xo4iGLsyP3Om5ahjZV8EB
   Ueh9yEKQL21mD8RM5E+lY14uU+11xbt9aL0ay8LXvD0psx09Q42nZ8iEf
   r7bnCoRrB+cV5vIq8YbGziURt3LTTI6cs2QbNa+D1xvNLpwbyyrgAryD0
   YbYZHAHk796LIEtznWgEY1MRXG4Mhl8dhHJ1AyR3hoZuDFSlmbCpZARnC
   XqZQ/jWQMQvkTlauphO9Cf2YWdsBZ40tZ7N6p/N0JtBfWqGcoLIgT5/bl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="462837146"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="462837146"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 11:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="864112523"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="864112523"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Sep 2023 11:38:03 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcryz-0003Lz-1A;
	Sun, 03 Sep 2023 18:38:01 +0000
Date: Mon, 4 Sep 2023 02:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] HID: sony: Fix a potential memory leak in sony_probe()
Message-ID: <202309040205.4e0VqT2B-lkp@intel.com>
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
In-Reply-To: <db06095c912d6bc56bed6b7e4663c7994072a2ce.1693757011.git.christophe.jaillet@wanadoo.fr>
References: <db06095c912d6bc56bed6b7e4663c7994072a2ce.1693757011.git.christophe.jaillet@wanadoo.fr>
TO: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
TO: Jiri Kosina <jikos@kernel.org>
TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>
TO: Pascal Giard <pascal.giard@etsmtl.ca>
CC: linux-kernel@vger.kernel.org
CC: kernel-janitors@vger.kernel.org
CC: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: linux-input@vger.kernel.org

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-JAILLET/HID-sony-Fix-a-potential-memory-leak-in-sony_probe/20230904-000514
base:   linus/master
patch link:    https://lore.kernel.org/r/db06095c912d6bc56bed6b7e4663c7994072a2ce.1693757011.git.christophe.jaillet%40wanadoo.fr
patch subject: [PATCH] HID: sony: Fix a potential memory leak in sony_probe()
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230904/202309040205.4e0VqT2B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309040205.4e0VqT2B-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: usb_free_urb(NULL) is safe and this check is probably not required
#24: drivers/hid/hid-sony.c:2159:
+	if (sc->ghl_urb)
+		usb_free_urb(sc->ghl_urb);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
