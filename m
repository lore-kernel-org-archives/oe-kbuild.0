Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1E619DF64
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Sep 2024 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727509389; cv=none; b=gwEPAUj/NAObZ43NYUemcdgcgcw6WZQDE/8i36VACeuLXOQAuVvYg+LvdmoZWs+ZDlzjvFAZzBzJ80Jzs5N6sXad3MwdZ0BhJDhVRRhLiav33BXIlNClLAzryTyPqE7K/uzwh2QlH7MJ8V3ZxB36oYpT7172cUudXhTZYW2op9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727509389; c=relaxed/simple;
	bh=Nne0JKRBMSNqc12b4eWaRrcBE4+QFs5oZhI8pl0nH/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dYKGmjFyn5RPtahL6u4EUHYooqO2Zq3dE8zZapCMbZZ+s9sEOcSRebhlTC/WEkXtOfSbxXnx+ozaqvOdvadf292Tw50r1HAmMJ/bov7MAWO2lpNThtFHGNLn4PnzvEkigupKlWseqsLYAzEsVIGqMyQRKE+VPQEgzqXlBlGdmdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZdrWJ6+z; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZdrWJ6+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727509387; x=1759045387;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Nne0JKRBMSNqc12b4eWaRrcBE4+QFs5oZhI8pl0nH/8=;
  b=ZdrWJ6+z4PAkjDAOEcjfGajWaFFVUVGzEBWufU3MFrS14V9T3C/06lwS
   sUdVpPrIac6Tq5M+JUkUeGGIMvtORSvjP7FqrBCxbvDu+lrn0bUsJBgC2
   aNL+rVgKG09uRzjELp0kKax/7ZBf3IPNxvDugh0wR2/R4NTXRaY3wzUla
   3dRj44IYMWIe2CV964/Q1KnCIqmpMI4gDriMJl0UkqPbTG7lBSji9gFn5
   9PLb9PB0aQhwkEjf6FODAE1be4MGPoNDGzglZ+qNyGfhk2cDQZFF66Las
   d1uMn8GCyf1sOnc2oQ/4LbRlBXSyfYi596DrTHE0IJoDv5SPu0OeuNqbv
   A==;
X-CSE-ConnectionGUID: NoxaShMzSPy1/EYcejbnYg==
X-CSE-MsgGUID: Hjx7sXf3T1CIn1FH4OWhgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26819256"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26819256"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 00:43:04 -0700
X-CSE-ConnectionGUID: vCSP9TBVQom/5JLL7+W9Xw==
X-CSE-MsgGUID: Mc7qfYcfRDeHakb576NKZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73060821"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Sep 2024 00:43:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suS6W-000N0L-2N;
	Sat, 28 Sep 2024 07:43:00 +0000
Date: Sat, 28 Sep 2024 15:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO
Message-ID: <202409281508.wjZPxkCR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240927124152.139099-2-wse@tuxedocomputers.com>
References: <20240927124152.139099-2-wse@tuxedocomputers.com>
TO: Werner Sembach <wse@tuxedocomputers.com>
TO: Hans de Goede <hdegoede@redhat.com>
TO: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
TO: Werner Sembach <wse@tuxedocomputers.com>
CC: bentiss@kernel.org
CC: dri-devel@lists.freedesktop.org
CC: jelle@vdwaa.nl
CC: jikos@kernel.org
CC: lee@kernel.org
CC: linux-input@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-leds@vger.kernel.org
CC: miguel.ojeda.sandonis@gmail.com
CC: ojeda@kernel.org
CC: onitake@gmail.com
CC: pavel@ucw.cz
CC: cs@tuxedo.de
CC: platform-driver-x86@vger.kernel.org

Hi Werner,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Werner-Sembach/platform-x86-tuxedo-Add-virtual-LampArray-for-TUXEDO/20240927-214157
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240927124152.139099-2-wse%40tuxedocomputers.com
patch subject: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-161-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281508.wjZPxkCR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409281508.wjZPxkCR-lkp@intel.com/

smatch warnings:
drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c:602 handle_lamp_range_update_report() error: uninitialized symbol 'lamp_count'.

vim +/lamp_count +602 drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c

1a862fa1eeacf4 Werner Sembach 2024-09-27  579  
1a862fa1eeacf4 Werner Sembach 2024-09-27  580  static int handle_lamp_range_update_report(struct hid_device *hdev,
1a862fa1eeacf4 Werner Sembach 2024-09-27  581  					   struct lamp_range_update_report_t *report)
1a862fa1eeacf4 Werner Sembach 2024-09-27  582  {
1a862fa1eeacf4 Werner Sembach 2024-09-27  583  	struct driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
1a862fa1eeacf4 Werner Sembach 2024-09-27  584  	int ret;
1a862fa1eeacf4 Werner Sembach 2024-09-27  585  	uint8_t lamp_count;
1a862fa1eeacf4 Werner Sembach 2024-09-27  586  	struct lamp_multi_update_report_t lamp_multi_update_report = {
1a862fa1eeacf4 Werner Sembach 2024-09-27  587  		.report_id = LAMP_MULTI_UPDATE_REPORT_ID
1a862fa1eeacf4 Werner Sembach 2024-09-27  588  	};
1a862fa1eeacf4 Werner Sembach 2024-09-27  589  
1a862fa1eeacf4 Werner Sembach 2024-09-27  590  	// Catching missformated lamp_range_update_report and fail silently according to
1a862fa1eeacf4 Werner Sembach 2024-09-27  591  	// "HID Usage Tables v1.5"
1a862fa1eeacf4 Werner Sembach 2024-09-27  592  	if (report->lamp_id_start > report->lamp_id_end) {
1a862fa1eeacf4 Werner Sembach 2024-09-27  593  		pr_debug("lamp_id_start > lamp_id_end in lamp_range_update_report. Skippng whole report!\n");
1a862fa1eeacf4 Werner Sembach 2024-09-27  594  		return sizeof(struct lamp_range_update_report_t);
1a862fa1eeacf4 Werner Sembach 2024-09-27  595  	}
1a862fa1eeacf4 Werner Sembach 2024-09-27  596  
1a862fa1eeacf4 Werner Sembach 2024-09-27  597  	if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII)
1a862fa1eeacf4 Werner Sembach 2024-09-27  598  		lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
1a862fa1eeacf4 Werner Sembach 2024-09-27  599  	else if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
1a862fa1eeacf4 Werner Sembach 2024-09-27  600  		lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
1a862fa1eeacf4 Werner Sembach 2024-09-27  601  
1a862fa1eeacf4 Werner Sembach 2024-09-27 @602  	if (report->lamp_id_end > lamp_count - 1) {
1a862fa1eeacf4 Werner Sembach 2024-09-27  603  		pr_debug("Out of bounds lamp_id_* in lamp_range_update_report. Skippng whole report!\n");
1a862fa1eeacf4 Werner Sembach 2024-09-27  604  		return sizeof(struct lamp_range_update_report_t);
1a862fa1eeacf4 Werner Sembach 2024-09-27  605  	}
1a862fa1eeacf4 Werner Sembach 2024-09-27  606  
1a862fa1eeacf4 Werner Sembach 2024-09-27  607  	// Break handle_lamp_range_update_report call down to multiple
1a862fa1eeacf4 Werner Sembach 2024-09-27  608  	// handle_lamp_multi_update_report calls to easily ensure that mixing
1a862fa1eeacf4 Werner Sembach 2024-09-27  609  	// handle_lamp_range_update_report and handle_lamp_multi_update_report
1a862fa1eeacf4 Werner Sembach 2024-09-27  610  	// does not break things.
1a862fa1eeacf4 Werner Sembach 2024-09-27  611  	for (int i = report->lamp_id_start; i < report->lamp_id_end + 1; i = i + 8) {
1a862fa1eeacf4 Werner Sembach 2024-09-27  612  		lamp_multi_update_report.lamp_count = MIN(report->lamp_id_end + 1 - i, 8);
1a862fa1eeacf4 Werner Sembach 2024-09-27  613  		if (i + lamp_multi_update_report.lamp_count == report->lamp_id_end + 1)
1a862fa1eeacf4 Werner Sembach 2024-09-27  614  			lamp_multi_update_report.lamp_update_flags |=
1a862fa1eeacf4 Werner Sembach 2024-09-27  615  				LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE;
1a862fa1eeacf4 Werner Sembach 2024-09-27  616  
1a862fa1eeacf4 Werner Sembach 2024-09-27  617  		for (int j = 0; j < lamp_multi_update_report.lamp_count; ++j) {
1a862fa1eeacf4 Werner Sembach 2024-09-27  618  			lamp_multi_update_report.lamp_id[j] = i + j;
1a862fa1eeacf4 Werner Sembach 2024-09-27  619  			lamp_multi_update_report.update_channels[j].red =
1a862fa1eeacf4 Werner Sembach 2024-09-27  620  				report->red_update_channel;
1a862fa1eeacf4 Werner Sembach 2024-09-27  621  			lamp_multi_update_report.update_channels[j].green =
1a862fa1eeacf4 Werner Sembach 2024-09-27  622  				report->green_update_channel;
1a862fa1eeacf4 Werner Sembach 2024-09-27  623  			lamp_multi_update_report.update_channels[j].blue =
1a862fa1eeacf4 Werner Sembach 2024-09-27  624  				report->blue_update_channel;
1a862fa1eeacf4 Werner Sembach 2024-09-27  625  			lamp_multi_update_report.update_channels[j].intensity =
1a862fa1eeacf4 Werner Sembach 2024-09-27  626  				report->intensity_update_channel;
1a862fa1eeacf4 Werner Sembach 2024-09-27  627  		}
1a862fa1eeacf4 Werner Sembach 2024-09-27  628  
1a862fa1eeacf4 Werner Sembach 2024-09-27  629  		ret = handle_lamp_multi_update_report(hdev, &lamp_multi_update_report);
1a862fa1eeacf4 Werner Sembach 2024-09-27  630  		if (ret < 0)
1a862fa1eeacf4 Werner Sembach 2024-09-27  631  			return ret;
1a862fa1eeacf4 Werner Sembach 2024-09-27  632  		else if (ret != sizeof(struct lamp_multi_update_report_t))
1a862fa1eeacf4 Werner Sembach 2024-09-27  633  			return -EIO;
1a862fa1eeacf4 Werner Sembach 2024-09-27  634  	}
1a862fa1eeacf4 Werner Sembach 2024-09-27  635  
1a862fa1eeacf4 Werner Sembach 2024-09-27  636  	return sizeof(struct lamp_range_update_report_t);
1a862fa1eeacf4 Werner Sembach 2024-09-27  637  }
1a862fa1eeacf4 Werner Sembach 2024-09-27  638  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
