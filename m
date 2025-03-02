Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347B21876
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 05:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740893603; cv=none; b=lP5Ndsy6sSmkCBkCM0X6KpM5FRyORQiXaqIlkFGMho91Tc/uqRXNC4hKVc6G/AaCjEwc7NWmpqLdtpIHVE3poA06dvpBZfmPLyVJNN5GHq2D9kzqbaB9K6m1yYdRxytjaicAcTYR74Pp444LPiN2NOX5+xTaf/gd8/UuyTcv8R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740893603; c=relaxed/simple;
	bh=0L8QGirhvH175O1Svfnkz5sj8dIcTPgydwEABdW0c00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ir4MLNXz3tk7RpltUAhvJPbHDyLI0K42kPQwEDO5K+OlLMzcqYK38etTHBb6qbfX7Y1yxTyleWrDFEktvfZ3hdKP45qLvmXMw5+l/cuzz0W9SHFbsbt8U8b6v7nbHG42AX4iv6u7HER2NtY0dEipX4NcwVHbPldJH6hn3cD53gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H93hqsQI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H93hqsQI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740893601; x=1772429601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0L8QGirhvH175O1Svfnkz5sj8dIcTPgydwEABdW0c00=;
  b=H93hqsQIwhG/NcfFPq68Gt4vsRcvJiYgUrfa9e8lXMxoU57V8Q6+OPtp
   Tz0bbSsQ+/Cm4mRYAk6N5I8wpWRivnBW9H4KNgQcG619Ydo2GibFY4U5t
   fegAD7vkTIffIIbkoVU3bh0K2T3MjqNiOZCqVBY4sVwe4ROAhHYSjLEqp
   Nywy6yYYLJo0sugHT9xXPem7Vc0ufE/g38d98w/msWBfDo2mQhB66vmsX
   B7dID4nn+1OvET6z4X86ADRTuWJX4Anam6lrKsGw8dSpMfcSO6CnZZ97Q
   yXzEIL5cn9YXl6Q0//D/dDOVE8RSWGvXJAZKMuWvOfS5Lhq3N/cNsunBF
   w==;
X-CSE-ConnectionGUID: +p02fmykQdy0Yd/f8+3ngg==
X-CSE-MsgGUID: PJZCYL5pR8qjDDGEj6mwjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="29370011"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="29370011"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 21:33:20 -0800
X-CSE-ConnectionGUID: NCpOPgpoT5mrIPu7TkQ4Ug==
X-CSE-MsgGUID: 5I6YD9beS72cMp/VBVuCLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="117454483"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Mar 2025 21:33:19 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tobwt-000H6C-36;
	Sun, 02 Mar 2025 05:33:13 +0000
Date: Sun, 2 Mar 2025 13:32:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/hid/hid-sensor-custom.c:586:62: warning: '%s' directive
 output may be truncated writing likely 4 or more bytes into a region of size
 between 0 and 63
Message-ID: <202503021341.naIARLjP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@redhat.com>
CC: Petr Mladek <pmladek@suse.com>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ece144f151ac7bf8bb5b98f7d4aeeda7a2eed02a
commit: 318af7b80b6a6751520cf2b71edb8c45abb9d9d8 Revert "kbuild: use -flive-patching when CONFIG_LIVEPATCH is enabled"
date:   4 years, 6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 years, 6 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20250302/202503021341.naIARLjP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021341.naIARLjP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503021341.naIARLjP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-sensor-custom.c: In function 'store_value':
   drivers/hid/hid-sensor-custom.c:397:21: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     397 |                 int ret;
         |                     ^~~
   drivers/hid/hid-sensor-custom.c: In function 'hid_sensor_custom_add_attributes':
>> drivers/hid/hid-sensor-custom.c:586:62: warning: '%s' directive output may be truncated writing likely 4 or more bytes into a region of size between 0 and 63 [-Wformat-truncation=]
     586 |                                  HID_CUSTOM_NAME_LENGTH, "%s-%s",
         |                                                              ^~
   drivers/hid/hid-sensor-custom.c:586:58: note: assuming directive output of 4 bytes
     586 |                                  HID_CUSTOM_NAME_LENGTH, "%s-%s",
         |                                                          ^~~~~~~
   drivers/hid/hid-sensor-custom.c:585:25: note: 'snprintf' output 2 or more bytes (assuming 69) into a destination of size 64
     585 |                         snprintf((char *)&sensor_inst->fields[i].attr_name[j],
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     586 |                                  HID_CUSTOM_NAME_LENGTH, "%s-%s",
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     587 |                                  sensor_inst->fields[i].group_name,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     588 |                                  hid_custom_attrs[j].name);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~


vim +586 drivers/hid/hid-sensor-custom.c

4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  556  
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  557  static int hid_sensor_custom_add_attributes(struct hid_sensor_custom
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  558  								*sensor_inst)
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  559  {
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  560  	struct hid_sensor_hub_device *hsdev = sensor_inst->hsdev;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  561  	struct hid_device *hdev = hsdev->hdev;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  562  	int ret = -1;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  563  	int i, j;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  564  
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  565  	for (j = 0; j < HID_REPORT_TYPES; ++j) {
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  566  		if (j == HID_OUTPUT_REPORT)
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  567  			continue;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  568  
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  569  		ret = hid_sensor_custom_add_fields(sensor_inst,
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  570  						   &hdev->report_enum[j], j);
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  571  		if (ret)
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  572  			return ret;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  573  
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  574  	}
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  575  
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  576  	/* Create sysfs attributes */
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  577  	for (i = 0; i < sensor_inst->sensor_field_count; ++i) {
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  578  		j = 0;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  579  		while (j < HID_CUSTOM_TOTAL_ATTRS &&
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  580  		       hid_custom_attrs[j].name) {
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  581  			struct device_attribute *device_attr;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  582  
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  583  			device_attr = &sensor_inst->fields[i].sd_attrs[j];
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  584  
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  585  			snprintf((char *)&sensor_inst->fields[i].attr_name[j],
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10 @586  				 HID_CUSTOM_NAME_LENGTH, "%s-%s",
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  587  				 sensor_inst->fields[i].group_name,
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  588  				 hid_custom_attrs[j].name);
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  589  			sysfs_attr_init(&device_attr->attr);
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  590  			device_attr->attr.name =
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  591  				(char *)&sensor_inst->fields[i].attr_name[j];
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  592  			device_attr->attr.mode = hid_custom_attrs[j].mode;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  593  			device_attr->show = show_value;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  594  			if (hid_custom_attrs[j].mode & S_IWUSR)
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  595  				device_attr->store = store_value;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  596  			sensor_inst->fields[i].attrs[j] = &device_attr->attr;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  597  			++j;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  598  		}
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  599  		sensor_inst->fields[i].attrs[j] = NULL;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  600  		sensor_inst->fields[i].hid_custom_attribute_group.attrs =
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  601  						sensor_inst->fields[i].attrs;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  602  		sensor_inst->fields[i].hid_custom_attribute_group.name =
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  603  					sensor_inst->fields[i].group_name;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  604  		ret = sysfs_create_group(&sensor_inst->pdev->dev.kobj,
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  605  					 &sensor_inst->fields[i].
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  606  					 hid_custom_attribute_group);
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  607  		if (ret)
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  608  			break;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  609  
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  610  		/* For power or report field store indexes */
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  611  		if (sensor_inst->fields[i].attribute.attrib_id ==
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  612  					HID_USAGE_SENSOR_PROY_POWER_STATE)
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  613  			sensor_inst->power_state = &sensor_inst->fields[i];
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  614  		else if (sensor_inst->fields[i].attribute.attrib_id ==
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  615  					HID_USAGE_SENSOR_PROP_REPORT_STATE)
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  616  			sensor_inst->report_state = &sensor_inst->fields[i];
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  617  	}
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  618  
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  619  	return ret;
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  620  }
4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  621  

:::::: The code at line 586 was first introduced by commit
:::::: 4a7de0519df5e8fb89cef6ee062330ffe4b50a4d HID: sensor: Custom and Generic sensor support

:::::: TO: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
