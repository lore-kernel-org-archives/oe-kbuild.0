Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DEC1101
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jun 2023 00:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685579568; x=1717115568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=soHd4XyJgN1WI0Ge8wmfMCQaR8VuEG/GXuqURdtwS84=;
  b=QcUS5j8EnOm5ApJxjRtvg2NLv+uIp88iIiBPCsd18QuxcsTimkgJBhja
   UbdpeWJf6s3ldQSbmTVlg0zCSWr8P/rBKspBLUageLBRIsbphTVvFBK/l
   ighwgnt76Q0nHj090qfs0WcK5IUf8vEGDVXUscTK0myQKw5XHs04uYT6D
   oWjfkFIkVKwPPVbMv3qT48bmpz2R0wPAZnGaPGOyvUovPEqTTfwbYTlPj
   xhzJgDd6SoX3a045Y4bLbJvGUZGvEG3DPVgoNN3PUp5Y/sTQerRbc8o5E
   PY8RKjgPp2VzPVhGCTHcCUlu0sNHifx7TVtnbCnHf9qjQU8KjP6AEZXRg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="344930614"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="344930614"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 17:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657560402"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="657560402"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2023 17:32:46 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4WFB-0001iN-1y;
	Thu, 01 Jun 2023 00:32:45 +0000
Date: Thu, 1 Jun 2023 08:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-6.1 3/3] drivers/hid/hid-core.c:2604
 hid_check_device_match() warn: signedness bug returning '(-19)'
Message-ID: <202306010854.3cMIiobb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   48ada893f8fcf93e8db0d2b94403a1b915b89b58
commit: 2892a1eb83bda74b9849399c8fd62a721a98da9f [3/3] FROMGIT: HID: split apart hid_device_probe to make logic more apparent
:::::: branch date: 6 hours ago
:::::: commit date: 23 hours ago
config: i386-randconfig-m021-20230531 (https://download.01.org/0day-ci/archive/20230601/202306010854.3cMIiobb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306010854.3cMIiobb-lkp@intel.com/

New smatch warnings:
drivers/hid/hid-core.c:2604 hid_check_device_match() warn: signedness bug returning '(-19)'

Old smatch warnings:
drivers/hid/hid-core.c:2765 hid_add_device() warn: inconsistent indenting

vim +2604 drivers/hid/hid-core.c

1a8861f117608e Daniel M. Lambea   2018-07-17  2597  
2892a1eb83bda7 Dmitry Torokhov    2023-05-23  2598  static bool hid_check_device_match(struct hid_device *hdev,
2892a1eb83bda7 Dmitry Torokhov    2023-05-23  2599  				   struct hid_driver *hdrv,
2892a1eb83bda7 Dmitry Torokhov    2023-05-23  2600  				   const struct hid_device_id **id)
85cdaf524b7dda Jiri Slaby         2008-05-16  2601  {
2892a1eb83bda7 Dmitry Torokhov    2023-05-23  2602  	*id = hid_match_device(hdev, hdrv);
2892a1eb83bda7 Dmitry Torokhov    2023-05-23  2603  	if (!*id)
2892a1eb83bda7 Dmitry Torokhov    2023-05-23 @2604  		return -ENODEV;
4ea5454203d991 David Herrmann     2011-08-10  2605  
2892a1eb83bda7 Dmitry Torokhov    2023-05-23  2606  	if (hdrv->match)
2892a1eb83bda7 Dmitry Torokhov    2023-05-23  2607  		return hdrv->match(hdev, hid_ignore_special_drivers);
8f732850df1b2b Benjamin Tissoires 2018-05-31  2608  
e04a0442d33b8c Benjamin Tissoires 2017-11-20  2609  	/*
2892a1eb83bda7 Dmitry Torokhov    2023-05-23  2610  	 * hid-generic implements .match(), so we must be dealing with a
2892a1eb83bda7 Dmitry Torokhov    2023-05-23  2611  	 * different HID driver here, and can simply check if
2892a1eb83bda7 Dmitry Torokhov    2023-05-23  2612  	 * hid_ignore_special_drivers is set or not.
e04a0442d33b8c Benjamin Tissoires 2017-11-20  2613  	 */
2892a1eb83bda7 Dmitry Torokhov    2023-05-23  2614  	return !hid_ignore_special_drivers;
e04a0442d33b8c Benjamin Tissoires 2017-11-20  2615  }
e04a0442d33b8c Benjamin Tissoires 2017-11-20  2616  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
