Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825C63B8BCB
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 02:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773111356; cv=none; b=qp4g2LKcAm3x/45ccGL5hvUAN3pm+ozKoLP76ZYuls/1NX4nGyL2bs0LxZQU3pw9gVb/GEAdDDsvibuzE59ZNRJtVJd32zaQQNL8NIAr49eZvrxDCi2xmQLE6ps3FosLwPH6VDP+FLjoRHRUNV6fPcoib67ZD0YcE/IZYYdiyks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773111356; c=relaxed/simple;
	bh=q0JcoLnq89r8y3Ck3CK7wdK5orbNrdm3G4iYqgqixcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qFsYUTm0aJK54zA6SRcM16TRQm8mOyp6YYCRY4lWcNfH3Ozh/ny3zcJA9nyGnNwBWt+34VJRjO6DoWmlyL/KzE9dvrUMa8r4bohfMKBunZy1PCg7GJ7Eqv1SlPKHhBbLnQsShxeuLs+g5UAElQsAKvz+QKQkDq+0ehwtvoPgr7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYPfKT4Y; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYPfKT4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773111351; x=1804647351;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q0JcoLnq89r8y3Ck3CK7wdK5orbNrdm3G4iYqgqixcU=;
  b=hYPfKT4YufxDvpMtg15UCLFc57G5ARBvngC6BE30HNqWG+DVOT7RRwqi
   XLUlMh5IcBO6NWYoz8aYFakmDAKS3et2riYyMMUEBh3GJKfo5tjIYQydI
   ephCtoCcwbC11dz1c9KhGVVM5YAvCSJCPu20nhz/+DZQHxoy/Oc/tOU2O
   bJQfxLNzpLacDNrGBO4lsx5RIgfLw/2Xpgh0MErhQslNzFKt3XKCm+9GX
   BbOr/VjSJsdHxHblZ7d+yNGLxu+QgVX7BD8GGHfXphTOrmCRCpB0uLkTf
   v0iFyeadI1viSdQ2TUZAB1KABQBXhkhwr0VnyWs2EpP0G1mbJynAo1e7m
   A==;
X-CSE-ConnectionGUID: c6UxkkmFS+OGMjlNdBUiJQ==
X-CSE-MsgGUID: qUrtFvm9S7ybPrFGtvLm5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="77755198"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="77755198"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 19:55:50 -0700
X-CSE-ConnectionGUID: h5Fp4/tETlSQooh7sttWVg==
X-CSE-MsgGUID: TtulPEcdQwqcNytSlYIv+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="217523469"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Mar 2026 19:55:48 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vznG5-000000001AQ-3gTH;
	Tue, 10 Mar 2026 02:55:45 +0000
Date: Tue, 10 Mar 2026 10:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/asus-armoury.c:358
 mini_led_mode_current_value_store() warn: potential spectre issue
 'mini_led_mode_map' [r] (local cap)
Message-ID: <202603101034.DCC8mF48-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Luke D. Jones" <luke@ljones.dev>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
CC: Denis Benato <denis.benato@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
commit: f99eb098090e4c8bfca4190b545e20450fee8250 platform/x86: asus-armoury=
: move existing tunings to asus-armoury module
date:   4 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-r073-20260310 (https://download.01.org/0day-ci/ar=
chive/20260310/202603101034.DCC8mF48-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603101034.DCC8mF48-lkp@intel.com/

smatch warnings:
drivers/platform/x86/asus-armoury.c:358 mini_led_mode_current_value_store()=
 warn: potential spectre issue 'mini_led_mode_map' [r] (local cap)
drivers/platform/x86/asus-armoury.c:496 egpu_enable_current_value_store() w=
arn: potential spectre issue 'egpu_status_map' [r] (local cap)
drivers/platform/x86/asus-armoury.c:500 egpu_enable_current_value_store() w=
arn: possible spectre second half.  'enable'

vim +/mini_led_mode_map +358 drivers/platform/x86/asus-armoury.c

f99eb098090e4c Luke D. Jones 2025-11-02  322 =20
f99eb098090e4c Luke D. Jones 2025-11-02  323  static ssize_t mini_led_mode_=
current_value_store(struct kobject *kobj,
f99eb098090e4c Luke D. Jones 2025-11-02  324  						 struct kobj_attribute =
*attr,
f99eb098090e4c Luke D. Jones 2025-11-02  325  						 const char *buf, size_=
t count)
f99eb098090e4c Luke D. Jones 2025-11-02  326  {
f99eb098090e4c Luke D. Jones 2025-11-02  327  	u32 *mini_led_mode_map;
f99eb098090e4c Luke D. Jones 2025-11-02  328  	size_t mini_led_mode_map_siz=
e;
f99eb098090e4c Luke D. Jones 2025-11-02  329  	u32 mode;
f99eb098090e4c Luke D. Jones 2025-11-02  330  	int err;
f99eb098090e4c Luke D. Jones 2025-11-02  331 =20
f99eb098090e4c Luke D. Jones 2025-11-02  332  	err =3D kstrtou32(buf, 10, &=
mode);
f99eb098090e4c Luke D. Jones 2025-11-02  333  	if (err)
f99eb098090e4c Luke D. Jones 2025-11-02  334  		return err;
f99eb098090e4c Luke D. Jones 2025-11-02  335 =20
f99eb098090e4c Luke D. Jones 2025-11-02  336  	switch (asus_armoury.mini_le=
d_dev_id) {
f99eb098090e4c Luke D. Jones 2025-11-02  337  	case ASUS_WMI_DEVID_MINI_LED=
_MODE:
f99eb098090e4c Luke D. Jones 2025-11-02  338  		mini_led_mode_map =3D mini_=
led_mode1_map;
f99eb098090e4c Luke D. Jones 2025-11-02  339  		mini_led_mode_map_size =3D =
ARRAY_SIZE(mini_led_mode1_map);
f99eb098090e4c Luke D. Jones 2025-11-02  340  		break;
f99eb098090e4c Luke D. Jones 2025-11-02  341 =20
f99eb098090e4c Luke D. Jones 2025-11-02  342  	case ASUS_WMI_DEVID_MINI_LED=
_MODE2:
f99eb098090e4c Luke D. Jones 2025-11-02  343  		mini_led_mode_map =3D mini_=
led_mode2_map;
f99eb098090e4c Luke D. Jones 2025-11-02  344  		mini_led_mode_map_size =3D =
ARRAY_SIZE(mini_led_mode2_map);
f99eb098090e4c Luke D. Jones 2025-11-02  345  		break;
f99eb098090e4c Luke D. Jones 2025-11-02  346 =20
f99eb098090e4c Luke D. Jones 2025-11-02  347  	default:
f99eb098090e4c Luke D. Jones 2025-11-02  348  		pr_err("Unrecognized mini-L=
ED devid: %u\n", asus_armoury.mini_led_dev_id);
f99eb098090e4c Luke D. Jones 2025-11-02  349  		return -EINVAL;
f99eb098090e4c Luke D. Jones 2025-11-02  350  	}
f99eb098090e4c Luke D. Jones 2025-11-02  351 =20
f99eb098090e4c Luke D. Jones 2025-11-02  352  	if (mode >=3D mini_led_mode_=
map_size) {
f99eb098090e4c Luke D. Jones 2025-11-02  353  		return pr_warn("mini-LED mo=
de unrecognized device: %u\n", mode);
f99eb098090e4c Luke D. Jones 2025-11-02  354  		return -ENODEV;
f99eb098090e4c Luke D. Jones 2025-11-02  355  	}
f99eb098090e4c Luke D. Jones 2025-11-02  356 =20
f99eb098090e4c Luke D. Jones 2025-11-02  357  	return armoury_attr_uint_sto=
re(kobj, attr, buf, count,
f99eb098090e4c Luke D. Jones 2025-11-02 @358  				       0, mini_led_mode_m=
ap[mode],
f99eb098090e4c Luke D. Jones 2025-11-02  359  				       NULL, asus_armoury=
.mini_led_dev_id);
f99eb098090e4c Luke D. Jones 2025-11-02  360  }
f99eb098090e4c Luke D. Jones 2025-11-02  361 =20
f99eb098090e4c Luke D. Jones 2025-11-02  362  static ssize_t mini_led_mode_=
possible_values_show(struct kobject *kobj,
f99eb098090e4c Luke D. Jones 2025-11-02  363  						  struct kobj_attribute=
 *attr, char *buf)
f99eb098090e4c Luke D. Jones 2025-11-02  364  {
f99eb098090e4c Luke D. Jones 2025-11-02  365  	switch (asus_armoury.mini_le=
d_dev_id) {
f99eb098090e4c Luke D. Jones 2025-11-02  366  	case ASUS_WMI_DEVID_MINI_LED=
_MODE:
f99eb098090e4c Luke D. Jones 2025-11-02  367  		return armoury_attr_enum_li=
st(buf, ARRAY_SIZE(mini_led_mode1_map));
f99eb098090e4c Luke D. Jones 2025-11-02  368  	case ASUS_WMI_DEVID_MINI_LED=
_MODE2:
f99eb098090e4c Luke D. Jones 2025-11-02  369  		return armoury_attr_enum_li=
st(buf, ARRAY_SIZE(mini_led_mode2_map));
f99eb098090e4c Luke D. Jones 2025-11-02  370  	default:
f99eb098090e4c Luke D. Jones 2025-11-02  371  		return -ENODEV;
f99eb098090e4c Luke D. Jones 2025-11-02  372  	}
f99eb098090e4c Luke D. Jones 2025-11-02  373  }
f99eb098090e4c Luke D. Jones 2025-11-02  374  ASUS_ATTR_GROUP_ENUM(mini_led=
_mode, "mini_led_mode", "Set the mini-LED backlight mode");
f99eb098090e4c Luke D. Jones 2025-11-02  375 =20
f99eb098090e4c Luke D. Jones 2025-11-02  376  static ssize_t gpu_mux_mode_c=
urrent_value_store(struct kobject *kobj,
f99eb098090e4c Luke D. Jones 2025-11-02  377  						struct kobj_attribute *=
attr,
f99eb098090e4c Luke D. Jones 2025-11-02  378  						const char *buf, size_t=
 count)
f99eb098090e4c Luke D. Jones 2025-11-02  379  {
f99eb098090e4c Luke D. Jones 2025-11-02  380  	int result, err;
f99eb098090e4c Luke D. Jones 2025-11-02  381  	bool optimus;
f99eb098090e4c Luke D. Jones 2025-11-02  382 =20
f99eb098090e4c Luke D. Jones 2025-11-02  383  	err =3D kstrtobool(buf, &opt=
imus);
f99eb098090e4c Luke D. Jones 2025-11-02  384  	if (err)
f99eb098090e4c Luke D. Jones 2025-11-02  385  		return err;
f99eb098090e4c Luke D. Jones 2025-11-02  386 =20
f99eb098090e4c Luke D. Jones 2025-11-02  387  	if (armoury_has_devstate(ASU=
S_WMI_DEVID_DGPU)) {
f99eb098090e4c Luke D. Jones 2025-11-02  388  		err =3D armoury_get_devstat=
e(NULL, &result, ASUS_WMI_DEVID_DGPU);
f99eb098090e4c Luke D. Jones 2025-11-02  389  		if (err)
f99eb098090e4c Luke D. Jones 2025-11-02  390  			return err;
f99eb098090e4c Luke D. Jones 2025-11-02  391  		if (result && !optimus) {
f99eb098090e4c Luke D. Jones 2025-11-02  392  			pr_warn("Cannot switch MUX=
 to dGPU mode when dGPU is disabled: %02X\n",
f99eb098090e4c Luke D. Jones 2025-11-02  393  				result);
f99eb098090e4c Luke D. Jones 2025-11-02  394  			return -ENODEV;
f99eb098090e4c Luke D. Jones 2025-11-02  395  		}
f99eb098090e4c Luke D. Jones 2025-11-02  396  	}
f99eb098090e4c Luke D. Jones 2025-11-02  397 =20
f99eb098090e4c Luke D. Jones 2025-11-02  398  	if (armoury_has_devstate(ASU=
S_WMI_DEVID_EGPU)) {
f99eb098090e4c Luke D. Jones 2025-11-02  399  		err =3D armoury_get_devstat=
e(NULL, &result, ASUS_WMI_DEVID_EGPU);
f99eb098090e4c Luke D. Jones 2025-11-02  400  		if (err)
f99eb098090e4c Luke D. Jones 2025-11-02  401  			return err;
f99eb098090e4c Luke D. Jones 2025-11-02  402  		if (result && !optimus) {
f99eb098090e4c Luke D. Jones 2025-11-02  403  			pr_warn("Cannot switch MUX=
 to dGPU mode when eGPU is enabled\n");
f99eb098090e4c Luke D. Jones 2025-11-02  404  			return -EBUSY;
f99eb098090e4c Luke D. Jones 2025-11-02  405  		}
f99eb098090e4c Luke D. Jones 2025-11-02  406  	}
f99eb098090e4c Luke D. Jones 2025-11-02  407 =20
f99eb098090e4c Luke D. Jones 2025-11-02  408  	err =3D armoury_set_devstate=
(attr, optimus ? 1 : 0, NULL, asus_armoury.gpu_mux_dev_id);
f99eb098090e4c Luke D. Jones 2025-11-02  409  	if (err)
f99eb098090e4c Luke D. Jones 2025-11-02  410  		return err;
f99eb098090e4c Luke D. Jones 2025-11-02  411 =20
f99eb098090e4c Luke D. Jones 2025-11-02  412  	sysfs_notify(kobj, NULL, att=
r->attr.name);
f99eb098090e4c Luke D. Jones 2025-11-02  413  	asus_set_reboot_and_signal_e=
vent();
f99eb098090e4c Luke D. Jones 2025-11-02  414 =20
f99eb098090e4c Luke D. Jones 2025-11-02  415  	return count;
f99eb098090e4c Luke D. Jones 2025-11-02  416  }
f99eb098090e4c Luke D. Jones 2025-11-02  417  ASUS_WMI_SHOW_INT(gpu_mux_mod=
e_current_value, asus_armoury.gpu_mux_dev_id);
f99eb098090e4c Luke D. Jones 2025-11-02  418  ASUS_ATTR_GROUP_BOOL(gpu_mux_=
mode, "gpu_mux_mode", "Set the GPU display MUX mode");
f99eb098090e4c Luke D. Jones 2025-11-02  419 =20
f99eb098090e4c Luke D. Jones 2025-11-02  420  static ssize_t dgpu_disable_c=
urrent_value_store(struct kobject *kobj,
f99eb098090e4c Luke D. Jones 2025-11-02  421  						struct kobj_attribute *=
attr, const char *buf,
f99eb098090e4c Luke D. Jones 2025-11-02  422  						size_t count)
f99eb098090e4c Luke D. Jones 2025-11-02  423  {
f99eb098090e4c Luke D. Jones 2025-11-02  424  	int result, err;
f99eb098090e4c Luke D. Jones 2025-11-02  425  	bool disable;
f99eb098090e4c Luke D. Jones 2025-11-02  426 =20
f99eb098090e4c Luke D. Jones 2025-11-02  427  	err =3D kstrtobool(buf, &dis=
able);
f99eb098090e4c Luke D. Jones 2025-11-02  428  	if (err)
f99eb098090e4c Luke D. Jones 2025-11-02  429  		return err;
f99eb098090e4c Luke D. Jones 2025-11-02  430 =20
f99eb098090e4c Luke D. Jones 2025-11-02  431  	if (asus_armoury.gpu_mux_dev=
_id) {
f99eb098090e4c Luke D. Jones 2025-11-02  432  		err =3D armoury_get_devstat=
e(NULL, &result, asus_armoury.gpu_mux_dev_id);
f99eb098090e4c Luke D. Jones 2025-11-02  433  		if (err)
f99eb098090e4c Luke D. Jones 2025-11-02  434  			return err;
f99eb098090e4c Luke D. Jones 2025-11-02  435  		if (!result && disable) {
f99eb098090e4c Luke D. Jones 2025-11-02  436  			pr_warn("Cannot disable dG=
PU when the MUX is in dGPU mode\n");
f99eb098090e4c Luke D. Jones 2025-11-02  437  			return -EBUSY;
f99eb098090e4c Luke D. Jones 2025-11-02  438  		}
f99eb098090e4c Luke D. Jones 2025-11-02  439  	}
f99eb098090e4c Luke D. Jones 2025-11-02  440 =20
f99eb098090e4c Luke D. Jones 2025-11-02  441  	scoped_guard(mutex, &asus_ar=
moury.egpu_mutex) {
f99eb098090e4c Luke D. Jones 2025-11-02  442  		err =3D armoury_set_devstat=
e(attr, disable ? 1 : 0, NULL, ASUS_WMI_DEVID_DGPU);
f99eb098090e4c Luke D. Jones 2025-11-02  443  		if (err)
f99eb098090e4c Luke D. Jones 2025-11-02  444  			return err;
f99eb098090e4c Luke D. Jones 2025-11-02  445  	}
f99eb098090e4c Luke D. Jones 2025-11-02  446 =20
f99eb098090e4c Luke D. Jones 2025-11-02  447  	sysfs_notify(kobj, NULL, att=
r->attr.name);
f99eb098090e4c Luke D. Jones 2025-11-02  448 =20
f99eb098090e4c Luke D. Jones 2025-11-02  449  	return count;
f99eb098090e4c Luke D. Jones 2025-11-02  450  }
f99eb098090e4c Luke D. Jones 2025-11-02  451  ASUS_WMI_SHOW_INT(dgpu_disabl=
e_current_value, ASUS_WMI_DEVID_DGPU);
f99eb098090e4c Luke D. Jones 2025-11-02  452  ASUS_ATTR_GROUP_BOOL(dgpu_dis=
able, "dgpu_disable", "Disable the dGPU");
f99eb098090e4c Luke D. Jones 2025-11-02  453 =20
f99eb098090e4c Luke D. Jones 2025-11-02  454  /* Values map for eGPU activa=
tion requests. */
f99eb098090e4c Luke D. Jones 2025-11-02  455  static u32 egpu_status_map[] =
=3D {
f99eb098090e4c Luke D. Jones 2025-11-02  456  	[0] =3D 0x00000000U,
f99eb098090e4c Luke D. Jones 2025-11-02  457  	[1] =3D 0x00000001U,
f99eb098090e4c Luke D. Jones 2025-11-02  458  	[2] =3D 0x00000101U,
f99eb098090e4c Luke D. Jones 2025-11-02  459  	[3] =3D 0x00000201U,
f99eb098090e4c Luke D. Jones 2025-11-02  460  };
f99eb098090e4c Luke D. Jones 2025-11-02  461 =20
f99eb098090e4c Luke D. Jones 2025-11-02  462  /*
f99eb098090e4c Luke D. Jones 2025-11-02  463   * armoury_pci_rescan() - Per=
forms a PCI rescan
f99eb098090e4c Luke D. Jones 2025-11-02  464   *
f99eb098090e4c Luke D. Jones 2025-11-02  465   * Bring up any GPU that has =
been hotplugged in the system.
f99eb098090e4c Luke D. Jones 2025-11-02  466   */
f99eb098090e4c Luke D. Jones 2025-11-02  467  static void armoury_pci_resca=
n(void)
f99eb098090e4c Luke D. Jones 2025-11-02  468  {
f99eb098090e4c Luke D. Jones 2025-11-02  469  	struct pci_bus *b =3D NULL;
f99eb098090e4c Luke D. Jones 2025-11-02  470 =20
f99eb098090e4c Luke D. Jones 2025-11-02  471  	pci_lock_rescan_remove();
f99eb098090e4c Luke D. Jones 2025-11-02  472  	while ((b =3D pci_find_next_=
bus(b)) !=3D NULL)
f99eb098090e4c Luke D. Jones 2025-11-02  473  		pci_rescan_bus(b);
f99eb098090e4c Luke D. Jones 2025-11-02  474  	pci_unlock_rescan_remove();
f99eb098090e4c Luke D. Jones 2025-11-02  475  }
f99eb098090e4c Luke D. Jones 2025-11-02  476 =20
f99eb098090e4c Luke D. Jones 2025-11-02  477  /*
f99eb098090e4c Luke D. Jones 2025-11-02  478   * The ACPI call to enable th=
e eGPU might also disable the internal dGPU,
f99eb098090e4c Luke D. Jones 2025-11-02  479   * but this is not always the=
 case and on certain models enabling the eGPU
f99eb098090e4c Luke D. Jones 2025-11-02  480   * when the dGPU is either st=
ill active or has been disabled without rebooting
f99eb098090e4c Luke D. Jones 2025-11-02  481   * will make both GPUs malfun=
ction and the kernel will detect many
f99eb098090e4c Luke D. Jones 2025-11-02  482   * PCI AER unrecoverable erro=
rs.
f99eb098090e4c Luke D. Jones 2025-11-02  483   */
f99eb098090e4c Luke D. Jones 2025-11-02  484  static ssize_t egpu_enable_cu=
rrent_value_store(struct kobject *kobj, struct kobj_attribute *attr,
f99eb098090e4c Luke D. Jones 2025-11-02  485  							const char *buf, size_=
t count)
f99eb098090e4c Luke D. Jones 2025-11-02  486  {
f99eb098090e4c Luke D. Jones 2025-11-02  487  	int err;
f99eb098090e4c Luke D. Jones 2025-11-02  488  	u32 requested, enable, resul=
t;
f99eb098090e4c Luke D. Jones 2025-11-02  489 =20
f99eb098090e4c Luke D. Jones 2025-11-02  490  	err =3D kstrtou32(buf, 10, &=
requested);
f99eb098090e4c Luke D. Jones 2025-11-02  491  	if (err)
f99eb098090e4c Luke D. Jones 2025-11-02  492  		return err;
f99eb098090e4c Luke D. Jones 2025-11-02  493 =20
f99eb098090e4c Luke D. Jones 2025-11-02  494  	if (requested >=3D ARRAY_SIZ=
E(egpu_status_map))
f99eb098090e4c Luke D. Jones 2025-11-02  495  		return -EINVAL;
f99eb098090e4c Luke D. Jones 2025-11-02 @496  	enable =3D egpu_status_map[r=
equested];
f99eb098090e4c Luke D. Jones 2025-11-02  497 =20
f99eb098090e4c Luke D. Jones 2025-11-02  498  	scoped_guard(mutex, &asus_ar=
moury.egpu_mutex) {
f99eb098090e4c Luke D. Jones 2025-11-02  499  		/* Ensure the eGPU is conne=
cted before attempting to activate it. */
f99eb098090e4c Luke D. Jones 2025-11-02 @500  		if (enable) {
f99eb098090e4c Luke D. Jones 2025-11-02  501  			err =3D armoury_get_devsta=
te(NULL, &result, ASUS_WMI_DEVID_EGPU_CONNECTED);
f99eb098090e4c Luke D. Jones 2025-11-02  502  			if (err) {
f99eb098090e4c Luke D. Jones 2025-11-02  503  				pr_warn("Failed to get eG=
PU connection status: %d\n", err);
f99eb098090e4c Luke D. Jones 2025-11-02  504  				return err;
f99eb098090e4c Luke D. Jones 2025-11-02  505  			}
f99eb098090e4c Luke D. Jones 2025-11-02  506  			if (!result) {
f99eb098090e4c Luke D. Jones 2025-11-02  507  				pr_warn("Cannot activate =
eGPU while undetected\n");
f99eb098090e4c Luke D. Jones 2025-11-02  508  				return -ENOENT;
f99eb098090e4c Luke D. Jones 2025-11-02  509  			}
f99eb098090e4c Luke D. Jones 2025-11-02  510  		}
f99eb098090e4c Luke D. Jones 2025-11-02  511 =20
f99eb098090e4c Luke D. Jones 2025-11-02  512  		if (asus_armoury.gpu_mux_de=
v_id) {
f99eb098090e4c Luke D. Jones 2025-11-02  513  			err =3D armoury_get_devsta=
te(NULL, &result, asus_armoury.gpu_mux_dev_id);
f99eb098090e4c Luke D. Jones 2025-11-02  514  			if (err)
f99eb098090e4c Luke D. Jones 2025-11-02  515  				return err;
f99eb098090e4c Luke D. Jones 2025-11-02  516 =20
f99eb098090e4c Luke D. Jones 2025-11-02  517  			if (!result && enable) {
f99eb098090e4c Luke D. Jones 2025-11-02  518  				pr_warn("Cannot enable eG=
PU when the MUX is in dGPU mode\n");
f99eb098090e4c Luke D. Jones 2025-11-02  519  				return -ENODEV;
f99eb098090e4c Luke D. Jones 2025-11-02  520  			}
f99eb098090e4c Luke D. Jones 2025-11-02  521  		}
f99eb098090e4c Luke D. Jones 2025-11-02  522 =20
f99eb098090e4c Luke D. Jones 2025-11-02  523  		err =3D armoury_set_devstat=
e(attr, enable, &result, ASUS_WMI_DEVID_EGPU);
f99eb098090e4c Luke D. Jones 2025-11-02  524  		if (err) {
f99eb098090e4c Luke D. Jones 2025-11-02  525  			pr_err("Failed to set %s: =
%d\n", attr->attr.name, err);
f99eb098090e4c Luke D. Jones 2025-11-02  526  			return err;
f99eb098090e4c Luke D. Jones 2025-11-02  527  		}
f99eb098090e4c Luke D. Jones 2025-11-02  528 =20
f99eb098090e4c Luke D. Jones 2025-11-02  529  		/*
f99eb098090e4c Luke D. Jones 2025-11-02  530  		 * ACPI returns value 0x01 =
on success and 0x02 on a partial activation:
f99eb098090e4c Luke D. Jones 2025-11-02  531  		 * performing a pci rescan =
will bring up the device in pci-e 3.0 speed,
f99eb098090e4c Luke D. Jones 2025-11-02  532  		 * after a reboot the devic=
e will work at full speed.
f99eb098090e4c Luke D. Jones 2025-11-02  533  		 */
f99eb098090e4c Luke D. Jones 2025-11-02  534  		switch (result) {
f99eb098090e4c Luke D. Jones 2025-11-02  535  		case 0x01:
f99eb098090e4c Luke D. Jones 2025-11-02  536  			/*
f99eb098090e4c Luke D. Jones 2025-11-02  537  			 * When a GPU is in use it=
 does not get disconnected even if
f99eb098090e4c Luke D. Jones 2025-11-02  538  			 * the ACPI call returns a=
 success.
f99eb098090e4c Luke D. Jones 2025-11-02  539  			 */
f99eb098090e4c Luke D. Jones 2025-11-02  540  			if (!enable) {
f99eb098090e4c Luke D. Jones 2025-11-02  541  				err =3D armoury_get_devst=
ate(attr, &result, ASUS_WMI_DEVID_EGPU);
f99eb098090e4c Luke D. Jones 2025-11-02  542  				if (err) {
f99eb098090e4c Luke D. Jones 2025-11-02  543  					pr_warn("Failed to ensur=
e eGPU is deactivated: %d\n", err);
f99eb098090e4c Luke D. Jones 2025-11-02  544  					return err;
f99eb098090e4c Luke D. Jones 2025-11-02  545  				}
f99eb098090e4c Luke D. Jones 2025-11-02  546 =20
f99eb098090e4c Luke D. Jones 2025-11-02  547  				if (result !=3D 0)
f99eb098090e4c Luke D. Jones 2025-11-02  548  					return -EBUSY;
f99eb098090e4c Luke D. Jones 2025-11-02  549  			}
f99eb098090e4c Luke D. Jones 2025-11-02  550 =20
f99eb098090e4c Luke D. Jones 2025-11-02  551  			pr_debug("Success changing=
 the eGPU status\n");
f99eb098090e4c Luke D. Jones 2025-11-02  552  			break;
f99eb098090e4c Luke D. Jones 2025-11-02  553  		case 0x02:
f99eb098090e4c Luke D. Jones 2025-11-02  554  			pr_info("Success changing =
the eGPU status, a reboot is strongly advised\n");
f99eb098090e4c Luke D. Jones 2025-11-02  555  			asus_set_reboot_and_signal=
_event();
f99eb098090e4c Luke D. Jones 2025-11-02  556  			break;
f99eb098090e4c Luke D. Jones 2025-11-02  557  		default:
f99eb098090e4c Luke D. Jones 2025-11-02  558  			pr_err("Failed to change t=
he eGPU status: wmi result is 0x%x\n", result);
f99eb098090e4c Luke D. Jones 2025-11-02  559  			return -EIO;
f99eb098090e4c Luke D. Jones 2025-11-02  560  		}
f99eb098090e4c Luke D. Jones 2025-11-02  561  	}
f99eb098090e4c Luke D. Jones 2025-11-02  562 =20
f99eb098090e4c Luke D. Jones 2025-11-02  563  	/*
f99eb098090e4c Luke D. Jones 2025-11-02  564  	 * Perform a PCI rescan: on =
every tested model this is necessary
f99eb098090e4c Luke D. Jones 2025-11-02  565  	 * to make the eGPU visible =
on the bus without rebooting.
f99eb098090e4c Luke D. Jones 2025-11-02  566  	 */
f99eb098090e4c Luke D. Jones 2025-11-02  567  	armoury_pci_rescan();
f99eb098090e4c Luke D. Jones 2025-11-02  568 =20
f99eb098090e4c Luke D. Jones 2025-11-02  569  	sysfs_notify(kobj, NULL, att=
r->attr.name);
f99eb098090e4c Luke D. Jones 2025-11-02  570 =20
f99eb098090e4c Luke D. Jones 2025-11-02  571  	return count;
f99eb098090e4c Luke D. Jones 2025-11-02  572  }
f99eb098090e4c Luke D. Jones 2025-11-02  573 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
