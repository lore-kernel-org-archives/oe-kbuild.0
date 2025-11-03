Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DF0314D25
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Nov 2025 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762193489; cv=none; b=rY2kdWSsN5JZ2TkCE0+llNtz8YV3BOU72cgM/fUoReA7q+/hQpxDNVS02OxrsJQpUTiF5XJ7oONHwVlOg8LAPkZfHFpnq/sO0SlR3Pf15YLrq9WlJsBW0EY0rZAeOhj8cGzMNXZJjN7+l+gJ9gN/6RiXdUHt0HUACWBjT4M1n50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762193489; c=relaxed/simple;
	bh=1dxil3y52b0n1dJbDXd7R9juW4Dhl/iG7wuRZJ4DvgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SEEmgOCywoxoWtrqbQW8kLi9eRKdfkYLTFX4A5svtgAJ6G8SDOTH8Q2KFoBITQyD1FXRKo72hcBpmNuEFDCHyhAQBnF5/6WfSESen3wvyedfPB8FQ9cFYxbgIu0jZZRdF+GOO4IpcXgv7vfUw9HtfmcmPCw86Jm/Z30EqtedKA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Awd2FuII; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Awd2FuII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762193487; x=1793729487;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1dxil3y52b0n1dJbDXd7R9juW4Dhl/iG7wuRZJ4DvgM=;
  b=Awd2FuII4g/r1+BAj/sI4ZCJjmyKfjdq2Sb9XCy7J73tpVX+qytSavsW
   jxCFMuDZdN4Rkii7ic12/YHwiRD0sTyAUuE/RNSrtdfP2azsfTeLWgRxR
   /clcrmmN7aQauArSWrUT0SfsNSctl+hJhidNvlyzB+uz/tR6xISv/BpIA
   hzWrpFbzdZpZQO/ZupQ7LPRlMhlQXqd7hubYow2eKqg4l69QFEsJkpLQP
   V6REwU3mm752FilxosKb/DCc5GHOepR3Tj6i9QlBkyN5T51LawPqlQjw0
   9RbYQQrPoaa7yN2NiNZeFlsiKgnDrLcV2UhFsBiE5SQwdxtFDtQ99jkGg
   A==;
X-CSE-ConnectionGUID: 2YF8Tmd4R4OXROZT8+qa/Q==
X-CSE-MsgGUID: DjOhIuzzTQq+r7WVr2B5xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64181360"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64181360"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 10:11:26 -0800
X-CSE-ConnectionGUID: H5BAv43cTBuQuMXk8mpNkg==
X-CSE-MsgGUID: oliTCaLwQiGWL2rF+x2TZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="186883556"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Nov 2025 10:11:26 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFz1X-000QS8-0R;
	Mon, 03 Nov 2025 18:11:23 +0000
Date: Tue, 4 Nov 2025 02:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4813/5674]
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c:172 mipi_exec_send_packet()
 error: uninitialized symbol 'ret'.
Message-ID: <202511040246.tgUoHUqf-lkp@intel.com>
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
TO: Jani Nikula <jani.nikula@intel.com>
CC: "Ville Syrjälä" <ville.syrjala@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9823120909776bbca58a3c55ef1f27d49283c1f3
commit: 23db1577ce2d6e6b1d1c8447dcc136dd2d443bd9 [4813/5674] drm/i915/dsi: log send packet sequence errors
:::::: branch date: 13 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20251103 (https://download.01.org/0day-ci/archive/20251104/202511040246.tgUoHUqf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511040246.tgUoHUqf-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_dsi_vbt.c:172 mipi_exec_send_packet() error: uninitialized symbol 'ret'.

vim +/ret +172 drivers/gpu/drm/i915/display/intel_dsi_vbt.c

8f4d2683b02ad8 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Gaurav K Singh 2014-12-04  100  
5b48ca0f52b5f7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  101  static const u8 *mipi_exec_send_packet(struct intel_dsi *intel_dsi,
5b48ca0f52b5f7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  102  				       const u8 *data)
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  103  {
bf5169db50c0ed drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-03-21  104  	struct intel_display *display = to_intel_display(&intel_dsi->base);
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  105  	struct mipi_dsi_device *dsi_device;
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  106  	u8 type, flags, seq_port;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  107  	u16 len;
8f4d2683b02ad8 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Gaurav K Singh 2014-12-04  108  	enum port port;
23db1577ce2d6e drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-10-29  109  	ssize_t ret;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  110  
bf5169db50c0ed drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-03-21  111  	drm_dbg_kms(display->drm, "\n");
0b9407c39864b8 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2016-09-19  112  
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  113  	flags = *data++;
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  114  	type = *data++;
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  115  
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  116  	len = *((u16 *) data);
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  117  	data += 2;
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  118  
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  119  	seq_port = (flags >> MIPI_PORT_SHIFT) & 3;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  120  
08c59dde71b73a drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2022-05-20  121  	port = intel_dsi_seq_port_to_port(intel_dsi, seq_port);
08c59dde71b73a drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2022-05-20  122  
bf5169db50c0ed drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-03-21  123  	if (drm_WARN_ON(display->drm, !intel_dsi->dsi_hosts[port]))
08c59dde71b73a drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2022-05-20  124  		goto out;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  125  
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  126  	dsi_device = intel_dsi->dsi_hosts[port]->device;
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  127  	if (!dsi_device) {
bf5169db50c0ed drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-03-21  128  		drm_dbg_kms(display->drm, "no dsi device for port %c\n",
e8441414131269 drivers/gpu/drm/i915/display/intel_dsi_vbt.c Wambui Karuga  2020-02-06  129  			    port_name(port));
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  130  		goto out;
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  131  	}
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  132  
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  133  	if ((flags >> MIPI_TRANSFER_MODE_SHIFT) & 1)
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  134  		dsi_device->mode_flags &= ~MIPI_DSI_MODE_LPM;
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  135  	else
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  136  		dsi_device->mode_flags |= MIPI_DSI_MODE_LPM;
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  137  
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  138  	dsi_device->channel = (flags >> MIPI_VIRTUAL_CHANNEL_SHIFT) & 3;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  139  
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  140  	switch (type) {
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  141  	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
23db1577ce2d6e drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-10-29  142  		ret = mipi_dsi_generic_write(dsi_device, NULL, 0);
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  143  		break;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  144  	case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
23db1577ce2d6e drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-10-29  145  		ret = mipi_dsi_generic_write(dsi_device, data, 1);
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  146  		break;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  147  	case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
23db1577ce2d6e drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-10-29  148  		ret = mipi_dsi_generic_write(dsi_device, data, 2);
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  149  		break;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  150  	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  151  	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  152  	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
23db1577ce2d6e drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-10-29  153  		ret = -EOPNOTSUPP;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  154  		break;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  155  	case MIPI_DSI_GENERIC_LONG_WRITE:
23db1577ce2d6e drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-10-29  156  		ret = mipi_dsi_generic_write(dsi_device, data, len);
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  157  		break;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  158  	case MIPI_DSI_DCS_SHORT_WRITE:
23db1577ce2d6e drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-10-29  159  		ret = mipi_dsi_dcs_write_buffer(dsi_device, data, 1);
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  160  		break;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  161  	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
23db1577ce2d6e drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-10-29  162  		ret = mipi_dsi_dcs_write_buffer(dsi_device, data, 2);
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  163  		break;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  164  	case MIPI_DSI_DCS_READ:
23db1577ce2d6e drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-10-29  165  		ret = -EOPNOTSUPP;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  166  		break;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  167  	case MIPI_DSI_DCS_LONG_WRITE:
23db1577ce2d6e drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-10-29  168  		ret = mipi_dsi_dcs_write_buffer(dsi_device, data, len);
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  169  		break;
b5fbcd98975529 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-27  170  	}
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  171  
23db1577ce2d6e drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-10-29 @172  	if (ret < 0)
23db1577ce2d6e drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-10-29  173  		drm_err(display->drm, "DSI send packet failed with %pe\n", ERR_PTR(ret));
23db1577ce2d6e drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-10-29  174  
bf5169db50c0ed drivers/gpu/drm/i915/display/intel_dsi_vbt.c Jani Nikula    2025-03-21  175  	if (DISPLAY_VER(display) < 11)
e518634b4366d2 drivers/gpu/drm/i915/intel_dsi_vbt.c         Jani Nikula    2018-07-05  176  		vlv_dsi_wait_for_fifo_empty(intel_dsi, port);
3870b89a810bc7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Hans de Goede  2017-02-28  177  
759d10c2e155e5 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Jani Nikula    2015-01-16  178  out:
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  179  	data += len;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  180  
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  181  	return data;
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  182  }
2ab8b458c6a1c7 drivers/gpu/drm/i915/intel_dsi_panel_vbt.c   Shobhit Kumar  2014-05-23  183  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
