Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F37753C3BF
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Oct 2026 16:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081203; cv=none; b=K73dJftrv+SUyz9uTvX+o+LdQYHxH8DiariB+WCmMtSgf4r4KiBlBLysLBy2tVqz6CYlcxHTGYtb2uL3Txn3ux4w3bXr6Fke1HC6oYmSP7wowp+aqI2/umIgrMWPQnQ9wj5roqI3wmLPRk3bjuzBQ4HNC2Gumk9L2lIK/xAdt6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081203; c=relaxed/simple;
	bh=4RHIOJxZlR/9dy0chIVY5JO2dDl4trQLxBLrVCZhzxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kmu/w5KmGYlzWKGaaMngx41/Q8Sga3uvpX0aft2fXIqzWS3qWcfwWb6rUhoaOwVE6+joDGiOvb3hVgzMAJUX72200RaG/lnLc1djGw73SKz/d8AF+KzJr5Os2vMlDTZdZGrtRb0YvfxnuctBjRUO400RWnkbI8cTGya7Uve/a4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ew8fboip; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ew8fboip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792081190; x=1823617190;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4RHIOJxZlR/9dy0chIVY5JO2dDl4trQLxBLrVCZhzxw=;
  b=ew8fboipmV4FkOdrTFvCYdUw8XCzrYKWsJEJyaoUB0g9okTvwxqDEz9j
   4NZo+xUWyx5oUO3BKMWvZ9o08GRIm1tnslmcJQnbJUQBn/CDsJxtMn5Iv
   9ZuulxT12g50aq/Jv/q1x5gRqtUg0YC8I+en7qQYntOBR2PpFrCT9lMIK
   C/O/w92Ib9vU5IHlz+HhhOqjqltEBPM+qyaN5mI4lPaq/LwnQObR3fVNr
   pQdtk8ssdS2spvqFG4xW1a4BtW++fYalR4BV5cWVMYAT7vEVieNXTkYez
   H4r3jV/bC1YGXTvA2L4fiAuIF3BrL8UGBg5tLuiyzYebuxlZywg+oz0QY
   g==;
X-CSE-ConnectionGUID: rcLlHgAxRqWnsbf77x7BHg==
X-CSE-MsgGUID: ouPg0FNSRMOEzGjc1h/siw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="742390"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="742390"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 09:19:49 -0700
X-CSE-ConnectionGUID: B5vJTjb2QiW30AJvV+/D1A==
X-CSE-MsgGUID: HGmciTEeSt6eLlF+vtgneQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1793573"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 15 Oct 2026 09:19:47 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHOBE-00000000BlH-4BRU;
	Thu, 15 Oct 2026 16:19:45 +0000
Date: Thu, 15 Oct 2026 18:19:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-error-propagation 3/3] WARNING:
 modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol
 'thermal_cooling_device_register' has no CRC!
Message-ID: <202610151851.yGkEpH8p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/kbuild-error-propagation
head:   4243eb1d190a56f570d636ae78f64714b61d39f4
commit: 4243eb1d190a56f570d636ae78f64714b61d39f4 [3/3] kbuild: try to enabl=
e set -e pipefail for commands
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/202=
61015/202610151851.yGkEpH8p-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261015/202610151851.yGkEpH8p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610151851.yGkEpH8p-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devl_region_d=
estroy' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'debugfs_creat=
e_u64' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'free_netdev' =
has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol '__skb_ext_put=
' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'page_pool_put=
_unrefed_netmem' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devlink_info_=
version_running_put_ext' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol '__local_bh_en=
able_ip' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'sscanf' has n=
o CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol '__fortify_pan=
ic' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'device_regist=
er' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'netif_tx_wake=
_queue' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'preempt_count=
_sub' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devl_trylock'=
 has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'page_pool_cre=
ate' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'skb_checksum'=
 has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'hrtimer_start=
_range_ns' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devl_trap_pol=
icers_unregister' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'debugfs_creat=
e_u32_array' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'bitmap_zalloc=
' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devlink_fmsg_=
u64_pair_put' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devl_trap_gro=
ups_register' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'wait_for_comp=
letion' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'debugfs_creat=
e_u32' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'kmemdup_nopro=
f' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol '__pskb_pull_t=
ail' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devlink_trap_=
report' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devlink_fmsg_=
obj_nest_start' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devl_traps_re=
gister' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devl_unlock' =
has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol '__netif_napi_=
del_locked' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'kstrdup' has =
no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'sprintf' has =
no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'xdp_attachmen=
t_setup' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol '__preempt_cou=
nt' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'gro_receive_s=
kb' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'mutex_unlock'=
 has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'cancel_delaye=
d_work_sync' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'memdup_user_n=
ul' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'netif_queue_s=
et_napi' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devl_port_unr=
egister' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'page_pool_all=
oc_pages' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol '__kmalloc_cac=
he_noprof' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'cancel_work_s=
ync' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'netif_carrier=
_off' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'delayed_work_=
timer_fn' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devlink_priv'=
 has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'bpf_offload_d=
ev_netdev_unregister' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'netif_carrier=
_on' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devl_lock_is_=
held' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'debugfs_creat=
e_file_full' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol '__asan_handle=
_no_return' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'hrtimer_cance=
l' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'timer_init_ke=
y' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol '__dev_forward=
_skb' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devlink_fmsg_=
string_pair_put' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol '__might_resch=
ed' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'bpf_offload_d=
ev_create' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol '__skb_ext_set=
' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'bpf_offload_d=
ev_priv' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'hrtimer_activ=
e' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'napi_schedule=
_prep' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devlink_fmsg_=
pair_nest_end' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'dev_kfree_skb=
_any_reason' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devl_trap_pol=
icers_register' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devl_register=
' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'debugfs_creat=
e_dir' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'generic_file_=
llseek' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'netdev_offloa=
d_xstats_push_delta' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devl_trap_gro=
ups_unregister' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'devl_traps_un=
register' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'kmalloc_cache=
s' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'netdev_info' =
has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'bus_register'=
 has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'flush_work' h=
as no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'synchronize_n=
et' has no CRC!
WARNING: modpost: drivers/net/netdevsim/netdevsim.ko: symbol 'register_netd=
evice' has no CRC!
WARNING: modpost: drivers/media/rc/rc-loopback.ko: symbol '__asan_load8_noa=
bort' has no CRC!
WARNING: modpost: drivers/media/rc/rc-loopback.ko: symbol '__asan_store4_no=
abort' has no CRC!
WARNING: modpost: drivers/media/rc/rc-loopback.ko: symbol '__asan_load1_noa=
bort' has no CRC!
WARNING: modpost: drivers/media/rc/rc-loopback.ko: symbol '__asan_store8_no=
abort' has no CRC!
WARNING: modpost: drivers/media/rc/rc-loopback.ko: symbol '__asan_store2_no=
abort' has no CRC!
WARNING: modpost: drivers/media/rc/rc-loopback.ko: symbol '__asan_store1_no=
abort' has no CRC!
WARNING: modpost: drivers/media/rc/rc-loopback.ko: symbol '_dev_err' has no=
 CRC!
WARNING: modpost: drivers/media/rc/rc-loopback.ko: symbol '__asan_load4_noa=
bort' has no CRC!
WARNING: modpost: drivers/media/rc/rc-loopback.ko: symbol 'kmalloc_caches' =
has no CRC!
WARNING: modpost: drivers/media/rc/rc-loopback.ko: symbol '__kmalloc_cache_=
noprof' has no CRC!
WARNING: modpost: drivers/media/rc/rc-loopback.ko: symbol 'kfree' has no CR=
C!
WARNING: modpost: drivers/media/rc/rc-loopback.ko: symbol '__asan_unregiste=
r_globals' has no CRC!
WARNING: modpost: drivers/media/rc/rc-loopback.ko: symbol '__asan_register_=
globals' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol '__asan=
_load8_noabort' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol '__asan=
_store8_noabort' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol 'nr_cpu=
_ids' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol '__asan=
_load4_noabort' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol 'sysfs_=
emit' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol 'mutex_=
lock_nested' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol 'mutex_=
unlock' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol '_print=
k' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol '__cpu_=
present_mask' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol '__trac=
epoint_read_msr' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol 'do_tra=
ce_read_msr' has no CRC!
>> WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol 'the=
rmal_cooling_device_register' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol 'debugf=
s_create_dir' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol 'debugf=
s_create_file_full' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol 'therma=
l_cooling_device_unregister' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol 'cancel=
_delayed_work_sync' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol 'debugf=
s_remove' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol '__max_=
logical_packages' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol 'system=
_percpu_wq' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol 'queue_=
delayed_work_on' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol '__max_=
dies_per_package' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol '_mutex=
_trylock_nest_lock' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol '__asan=
_load1_noabort' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol '__asan=
_store1_noabort' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol 'delaye=
d_work_timer_fn' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol '__asan=
_unregister_globals' has no CRC!
WARNING: modpost: drivers/thermal/intel/intel_powerclamp.ko: symbol '__asan=
_register_globals' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'th=
ermal_zone_device_priv' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
asan_load8_noabort' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
asan_load4_noabort' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
asan_store4_noabort' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'pl=
atform_thermal_package_notify' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
asan_store8_noabort' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'pl=
atform_thermal_package_rate_control' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
cpuhp_remove_state' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'de=
bugfs_remove' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'kf=
ree' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
kmalloc_noprof' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
max_logical_packages' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
max_dies_per_package' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
cpuhp_setup_state' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'de=
bugfs_create_dir' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'de=
bugfs_create_u32' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'cp=
u_info' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'nr=
_cpu_ids' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
asan_load1_noabort' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'mu=
tex_lock_nested' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'mu=
tex_unlock' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'th=
ermal_zone_device_unregister' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
tracepoint_write_msr' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'do=
_trace_write_msr' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'ca=
ncel_delayed_work_sync' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
msecs_to_jiffies' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'sy=
stem_percpu_wq' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'qu=
eue_delayed_work_on' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'km=
alloc_caches' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
kmalloc_cache_noprof' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'de=
layed_work_timer_fn' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'ti=
mer_init_key' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'th=
ermal_zone_device_register_with_trips' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'th=
ermal_zone_device_enable' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
tracepoint_read_msr' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'do=
_trace_read_msr' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
asan_store1_noabort' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'th=
ermal_clear_package_intr_status' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol 'th=
ermal_zone_device_update' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
asan_unregister_globals' has no CRC!
WARNING: modpost: drivers/thermal/intel/x86_pkg_temp_thermal.ko: symbol '__=
asan_register_globals' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol '__asan_load8_noa=
bort' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol '__asan_store4_no=
abort' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol '__asan_load4_noa=
bort' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol '__platform_drive=
r_probe' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'on_each_cpu_cond=
_mask' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'smp_call_functio=
n_any' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol '__asan_load1_noa=
bort' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol '__asan_loadN_noa=
bort' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'cpus_read_lock' =
has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'cpus_read_unlock=
' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'sprintf' has no =
CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol '__cpu_possible_m=
ask' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'cpu_info' has no=
 CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'acpi_processor_p=
reregister_performance' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol '__asan_store8_no=
abort' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'platform_driver_=
unregister' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'cpu_bit_bitmap' =
has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'kmalloc_caches' =
has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol '__kmalloc_cache_=
noprof' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'acpi_processor_r=
egister_performance' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'nr_cpu_ids' has =
no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'cpu_core_map' ha=
s no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'acpi_processor_u=
nregister_performance' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'kfree' has no CR=
C!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol '__kmalloc_noprof=
' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'cpu_sibling_map'=
 has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'cppc_get_dmi_max=
_khz' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'acpi_processor_n=
otify_smm' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol '__asan_store1_no=
abort' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'cppc_get_perf_ca=
ps' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol '_printk' has no =
CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol '__tracepoint_wri=
te_msr' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'do_trace_write_m=
sr' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol '__tracepoint_rea=
d_msr' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'do_trace_read_ms=
r' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol 'acpi_processor_g=
et_bios_limit' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol '__asan_unregiste=
r_globals' has no CRC!
WARNING: modpost: drivers/cpufreq/acpi-cpufreq.ko: symbol '__asan_register_=
globals' has no CRC!
WARNING: modpost: drivers/crypto/virtio/virtio_crypto.ko: symbol 'crypto_fi=
nalize_akcipher_request' has no CRC!
WARNING: modpost: drivers/crypto/virtio/virtio_crypto.ko: symbol '__asan_st=
ore4_noabort' has no CRC!
WARNING: modpost: drivers/crypto/virtio/virtio_crypto.ko: symbol 'virtqueue=
_enable_cb' has no CRC!
WARNING: modpost: drivers/crypto/virtio/virtio_crypto.ko: symbol '__asan_lo=
ad4_noabort' has no CRC!
WARNING: modpost: drivers/crypto/virtio/virtio_crypto.ko: symbol '__asan_lo=
ad8_noabort' has no CRC!
WARNING: modpost: drivers/crypto/virtio/virtio_crypto.ko: symbol 'preempt_c=
ount_add' has no CRC!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
