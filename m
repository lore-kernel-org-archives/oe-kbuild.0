Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC99EACD
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 00:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781395434; cv=none; b=Ce4LEJ8EGypq0UpphQQEbpIFPE7wqcZsLVTqFL+7yUIKLBacyUKkF4S0EpeoC/4oOOQsFLdTdgmavLigXw8QwsiDwSMujCPFnK6nAL8G4j8EA7KbHdYfP55hwQ9PT0POLc+1w4hvokEH0uoXpUtCMKFXGNfQiSvoPZHtC/7pIrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781395434; c=relaxed/simple;
	bh=8rMyho2CFZvjdI1kRu1kKgeiwl0jaIQyDLaomtaXi14=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sevfh49pfzb1a9kNrDtDgL6x84z+aqwAgrUFKL62LMCB3jAB5MyAXZ7YJguAsTFRj6M/TFR/Fe6pUZsUygQ6Q2wFCS0XUEoDygHhMXfuaFMEeIPw78Lopg3q500PiMCqknENi2TcxeLxYIKbOfYlueqIOe5eiQ9YFL6VDhuxd/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVd+31ON; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVd+31ON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781395433; x=1812931433;
  h=date:from:to:cc:subject:message-id;
  bh=8rMyho2CFZvjdI1kRu1kKgeiwl0jaIQyDLaomtaXi14=;
  b=KVd+31ONns+nYOQxRBUdA9SBCRWY+YWwagn9PN5AorlgdXimKo9waiQS
   pR6SUrf7W6dRiWsGLPdcTP9QnMAY4dNlOwuBYglcf8woA5MIlMd73Fkv8
   D0tLU6wuBFUr/cvB7GpjtRLw33hgufu9wB24o9REFdzPUdVOK0W3L23dg
   gCeyrDKrIerLeBl/nSu3P05a+jAm6F19AIv04YLbplPa4r8ZjfaFWBURM
   dM6AYLRVP1ciI24GdfSklzdjmkHHOHcFbhmRCB6jvGrPd+MkknloFDK4Z
   DlfSi4w6dN5F0mOv3n513jDh5CQSTsdL702YtKqkJbsZ3NRdBSmggZSNP
   Q==;
X-CSE-ConnectionGUID: V6DnD2OVRD+RBP11b4KlRA==
X-CSE-MsgGUID: X31IABJkTWuegU5KHJgfuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82031629"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="82031629"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 17:03:53 -0700
X-CSE-ConnectionGUID: 0f3BMcwPRUaK6ydoT/kbPg==
X-CSE-MsgGUID: qx+F7n98TnO1jnrJXo8+vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="246245038"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jun 2026 17:03:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYYKK-00000000QOq-3QPv;
	Sun, 14 Jun 2026 00:03:48 +0000
Date: Sun, 14 Jun 2026 08:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4238/13763] net/smc/af_smc.c:1222
 smc_fill_gid_list() error: buffer overflow 'gidlist->list' 2 <= 3
Message-ID: <202606140719.OthHgcwb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Marco Elver <elver@google.com>
CC: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
CC: "Harry Yoo (Oracle)" <harry@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: feb662d9168b63e1d4c02671ec96005410c6f3ce [4238/13763] slab: support for compiler-assisted type-based slab cache partitioning
:::::: branch date: 29 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-141-20260614 (https://download.01.org/0day-ci/archive/20260614/202606140719.OthHgcwb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606140719.OthHgcwb-lkp@intel.com/

smatch warnings:
net/smc/af_smc.c:1222 smc_fill_gid_list() error: buffer overflow 'gidlist->list' 2 <= 3
net/smc/af_smc.c:1222 smc_fill_gid_list() error: buffer overflow 'gidlist->list' 2 <= 3
net/smc/af_smc.c:1222 smc_fill_gid_list() error: buffer overflow 'gidlist->list' 2 <= 3

vim +1222 net/smc/af_smc.c

a046d57da19f812 Ursula Braun   2017-01-09  1200  
b4ba4652b3f8b7c Karsten Graul  2021-10-16  1201  void smc_fill_gid_list(struct smc_link_group *lgr,
e5c4744cfb598f9 Karsten Graul  2021-10-16  1202  		       struct smc_gidlist *gidlist,
e5c4744cfb598f9 Karsten Graul  2021-10-16  1203  		       struct smc_ib_device *known_dev, u8 *known_gid)
e5c4744cfb598f9 Karsten Graul  2021-10-16  1204  {
e5c4744cfb598f9 Karsten Graul  2021-10-16  1205  	struct smc_init_info *alt_ini = NULL;
e5c4744cfb598f9 Karsten Graul  2021-10-16  1206  
e5c4744cfb598f9 Karsten Graul  2021-10-16  1207  	memset(gidlist, 0, sizeof(*gidlist));
e5c4744cfb598f9 Karsten Graul  2021-10-16  1208  	memcpy(gidlist->list[gidlist->len++], known_gid, SMC_GID_SIZE);
e5c4744cfb598f9 Karsten Graul  2021-10-16  1209  
bf4afc53b77aeaa Linus Torvalds 2026-02-21  1210  	alt_ini = kzalloc_obj(*alt_ini);
e5c4744cfb598f9 Karsten Graul  2021-10-16  1211  	if (!alt_ini)
e5c4744cfb598f9 Karsten Graul  2021-10-16  1212  		goto out;
e5c4744cfb598f9 Karsten Graul  2021-10-16  1213  
e5c4744cfb598f9 Karsten Graul  2021-10-16  1214  	alt_ini->vlan_id = lgr->vlan_id;
e5c4744cfb598f9 Karsten Graul  2021-10-16  1215  	alt_ini->check_smcrv2 = true;
e5c4744cfb598f9 Karsten Graul  2021-10-16  1216  	alt_ini->smcrv2.saddr = lgr->saddr;
e5c4744cfb598f9 Karsten Graul  2021-10-16  1217  	smc_pnet_find_alt_roce(lgr, alt_ini, known_dev);
e5c4744cfb598f9 Karsten Graul  2021-10-16  1218  
e5c4744cfb598f9 Karsten Graul  2021-10-16  1219  	if (!alt_ini->smcrv2.ib_dev_v2)
e5c4744cfb598f9 Karsten Graul  2021-10-16  1220  		goto out;
e5c4744cfb598f9 Karsten Graul  2021-10-16  1221  
e5c4744cfb598f9 Karsten Graul  2021-10-16 @1222  	memcpy(gidlist->list[gidlist->len++], alt_ini->smcrv2.ib_gid_v2,
e5c4744cfb598f9 Karsten Graul  2021-10-16  1223  	       SMC_GID_SIZE);
e5c4744cfb598f9 Karsten Graul  2021-10-16  1224  
e5c4744cfb598f9 Karsten Graul  2021-10-16  1225  out:
e5c4744cfb598f9 Karsten Graul  2021-10-16  1226  	kfree(alt_ini);
e5c4744cfb598f9 Karsten Graul  2021-10-16  1227  }
e5c4744cfb598f9 Karsten Graul  2021-10-16  1228  

:::::: The code at line 1222 was first introduced by commit
:::::: e5c4744cfb598f98672f8d21d59ef2c1fa9c9b5f net/smc: add SMC-Rv2 connection establishment

:::::: TO: Karsten Graul <kgraul@linux.ibm.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
