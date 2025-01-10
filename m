Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA7320A5EE
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jan 2025 21:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736546297; cv=none; b=k3J5tmS0oRuecTC7eajhLFwvp9t+p3C4FNEYNq4qV7YNXfWwT79w/ST94lpCpVN9c2nQhZKrmhLn1dj9e1eEdR3CQTY8KQLz6/upZDYyZTvWirxlvyAjuk6v5rmANKuBK4rPZRtB9+PLO1Q4SnOHANc0JT+L0NHffjzN0Eifj+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736546297; c=relaxed/simple;
	bh=NjAQYGsvwZCIdX56bMfpmEFPIp8icjNkOaFjjC0opII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uoi8dBDnwF0/1DNpjU4PYNAiHVB4W1+xlb+eYAUeHU+TQuPCscP5Eo5kWjE2Z8InHZlC99PtRY2J4XI4Mw0mG9y4TsaK5+Hp/Z94jrDsiHUE6c4AN4K9BNBhvl3SWcEOr+BQOvSydM+IlhkJiwE09ZfAvwaLCtXaPgqkvlUN4+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHp5/bpj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHp5/bpj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736546296; x=1768082296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NjAQYGsvwZCIdX56bMfpmEFPIp8icjNkOaFjjC0opII=;
  b=bHp5/bpjG9KuBxpi48EpCSMb0u8vy4L8UEVX2c6F8ZEgfltTwIQKkWAn
   92jf16ZAKImjP5hB+wflVhXDsQC22xhyq9rHU/oidFL42plOy5/Zhiael
   D/sbu2ZhbA/emj4NFcqaxWsB9evpAMUWAZVceYuMo8Bd8gtnRRCgxiDQA
   iJBgjLzOo7I1q38TyptAoy3S7fUcdFF+5wpv51LXLwVYX20KTSvL/C8Mf
   St/umCPxDAkWXFS3tjnGi3kISobbrTTi11QSJIR7dK/SXclHy6o6jjNNy
   5WPBTHwsV/Fz2HfCtb3oY3tyU+Dh0np76nGP66rKZ33BGEtdiMIuVeCXI
   A==;
X-CSE-ConnectionGUID: 9sZWjKg7TJ6xlg8Z6lVuYQ==
X-CSE-MsgGUID: H5GbC2c+SWuGmH1EzpUpTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36138902"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="36138902"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 13:58:15 -0800
X-CSE-ConnectionGUID: jo0hd4O8Rr2c/ZFNtlQ80g==
X-CSE-MsgGUID: x3ccdmglRT2z794U03Tqsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="104365646"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jan 2025 13:58:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWN1A-000JnH-0N;
	Fri, 10 Jan 2025 21:58:12 +0000
Date: Sat, 11 Jan 2025 05:57:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/hid/hid-sensor-custom.c:586:62: warning: '%s' directive
 output may be truncated writing likely 4 or more bytes into a region of size
 between 0 and 63
Message-ID: <202501110520.Emv0PYxA-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f8c6263347e1740edf159584775332f4abf693a1
commit: 318af7b80b6a6751520cf2b71edb8c45abb9d9d8 Revert "kbuild: use -flive-patching when CONFIG_LIVEPATCH is enabled"
date:   4 years, 4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 years, 4 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20250111/202501110520.Emv0PYxA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110520.Emv0PYxA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501110520.Emv0PYxA-lkp@intel.com/

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
