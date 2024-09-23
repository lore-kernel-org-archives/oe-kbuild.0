Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D6B80C0C
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Sep 2024 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727104653; cv=none; b=puET5j/U0ybiWe11ZMzQO/awubaZT8ZFcmdfue+oCw6QsYg/FLuuiasxKsJMMoapGiXkMWaCcnQLj88y7UxjFq3qYXZyS4UjNgz8+n4mDv1HkvH/5GE0RmeXIP+SatNztx8ojZNN19hVrJDWYqy/i+7VT1LNIPBi8APqMTyB5wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727104653; c=relaxed/simple;
	bh=A4i2DY5XyLbSWtZF6nPukw71Sn3zfUHg7Hok/Bu95V4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SbOxY8dS38BpBPwHiYmzPZoS9Iddj7Etb4ugcW/EKk6wtsOXG/ZGK4gfiDmvEcAJrS3V4KkBdakzBB3E0PD8nvq5nC0Ir+55C5luO2Jq7vDru5zpGwcK88nnPOEKkUiswp9aHfxS64pPVrEvcu7idWgCYotyykDjnB80Opv6dsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hf49RtXq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hf49RtXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727104651; x=1758640651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A4i2DY5XyLbSWtZF6nPukw71Sn3zfUHg7Hok/Bu95V4=;
  b=Hf49RtXq+lKFjqF27YmZdb4BJv2nxrZH9aj8IWiR+bt08SgglLZO4/dY
   axGRl+39SzUMtparb3eA8Vgu8FMsE92CjxZAXSA0fyXw59Ek5Go3CQt9N
   PFEhu8PVS60BmovsvIHl1UeoKKYP+aDArhYqeW+tYRSYTAP0V6FC7E+ZQ
   Mv9WOMwrt8NaFzOkWZ9TWULGhegVJazEGWwfAXbCmlB1zUr9F2c8bNL8U
   wMexor58lqgaKgE50C1d/7UkBW35JvUTCUtXea1Fh+g3x83bMxea2N61z
   whPQ8L0CZJIKwnw08DS9pVIUsdNvLLgWjY8XTgfMEU8Yp0Gr1IaQU5HbZ
   A==;
X-CSE-ConnectionGUID: yrm44412RfyhNeRMv7IfSA==
X-CSE-MsgGUID: vyPRThzjRP6s4Kpx5H0eAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43575689"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="43575689"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 08:17:31 -0700
X-CSE-ConnectionGUID: P00trb7GRmelY0EcrC/ziw==
X-CSE-MsgGUID: scFIRkT3QVqu/JzFdKuzaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="70998557"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Sep 2024 08:17:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sskoY-000HJG-32;
	Mon, 23 Sep 2024 15:17:26 +0000
Date: Mon, 23 Sep 2024 23:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/kernel/ipl.c:805 sys_reipl_fcp_scp_data_store() warn:
 potential user controlled sizeof overflow '(636) + scpdata_len' '636 +
 0-u64max'
Message-ID: <202409232305.rCH7ky0m-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Alexander Egorenkov <egorenar@linux.ibm.com>
CC: Alexander Gordeev <agordeev@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   de5cb0dcb74c294ec527eddfe5094acfdb21ff21
commit: 005ca0133375a68fbbe4244cc7399b640d78dd91 s390/ipl: Introduce macros for (re)ipl sysfs attribute 'scp_data'
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: s390-randconfig-r071-20240922 (https://download.01.org/0day-ci/archive/20240923/202409232305.rCH7ky0m-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409232305.rCH7ky0m-lkp@intel.com/

New smatch warnings:
arch/s390/kernel/ipl.c:805 sys_reipl_fcp_scp_data_store() warn: potential user controlled sizeof overflow '(636) + scpdata_len' '636 + 0-u64max'
arch/s390/kernel/ipl.c:929 sys_reipl_nvme_scp_data_store() warn: potential user controlled sizeof overflow '(636) + scpdata_len' '636 + 0-u64max'
arch/s390/kernel/ipl.c:1028 sys_reipl_eckd_scp_data_store() warn: potential user controlled sizeof overflow '(636) + scpdata_len' '636 + 0-u64max'

Old smatch warnings:
arch/s390/kernel/ipl.c:1893 sys_vmcmd_on_reboot_store() warn: unsigned 'len' is never less than zero.
arch/s390/kernel/ipl.c:1894 sys_vmcmd_on_panic_store() warn: unsigned 'len' is never less than zero.
arch/s390/kernel/ipl.c:1895 sys_vmcmd_on_halt_store() warn: unsigned 'len' is never less than zero.
arch/s390/kernel/ipl.c:1896 sys_vmcmd_on_poff_store() warn: unsigned 'len' is never less than zero.
arch/s390/kernel/ipl.c:1897 sys_vmcmd_on_restart_store() warn: unsigned 'len' is never less than zero.

vim +805 arch/s390/kernel/ipl.c

ff6b8ea68f4b73 Michael Holzheu     2006-09-20  804  
005ca0133375a6 Alexander Egorenkov 2024-05-10 @805  DEFINE_IPL_ATTR_SCP_DATA_RW(reipl_fcp, reipl_block_fcp->hdr,
005ca0133375a6 Alexander Egorenkov 2024-05-10  806  			    reipl_block_fcp->fcp,
005ca0133375a6 Alexander Egorenkov 2024-05-10  807  			    IPL_BP_FCP_LEN, IPL_BP0_FCP_LEN,
005ca0133375a6 Alexander Egorenkov 2024-05-10  808  			    DIAG308_SCPDATA_SIZE);
684d2fd48e718e Hendrik Brueckner   2009-09-11  809  
22d557abf75ce3 Sebastian Ott       2015-03-17  810  static struct bin_attribute *reipl_fcp_bin_attrs[] = {
22d557abf75ce3 Sebastian Ott       2015-03-17  811  	&sys_reipl_fcp_scp_data_attr,
22d557abf75ce3 Sebastian Ott       2015-03-17  812  	NULL,
684d2fd48e718e Hendrik Brueckner   2009-09-11  813  };
684d2fd48e718e Hendrik Brueckner   2009-09-11  814  
eda4ddf7e3a224 Michael Holzheu     2013-06-21  815  DEFINE_IPL_ATTR_RW(reipl_fcp, wwpn, "0x%016llx\n", "%llx\n",
86c74d869d321b Martin Schwidefsky  2019-02-20  816  		   reipl_block_fcp->fcp.wwpn);
eda4ddf7e3a224 Michael Holzheu     2013-06-21  817  DEFINE_IPL_ATTR_RW(reipl_fcp, lun, "0x%016llx\n", "%llx\n",
86c74d869d321b Martin Schwidefsky  2019-02-20  818  		   reipl_block_fcp->fcp.lun);
ff6b8ea68f4b73 Michael Holzheu     2006-09-20  819  DEFINE_IPL_ATTR_RW(reipl_fcp, bootprog, "%lld\n", "%lld\n",
86c74d869d321b Martin Schwidefsky  2019-02-20  820  		   reipl_block_fcp->fcp.bootprog);
ff6b8ea68f4b73 Michael Holzheu     2006-09-20  821  DEFINE_IPL_ATTR_RW(reipl_fcp, br_lba, "%lld\n", "%lld\n",
86c74d869d321b Martin Schwidefsky  2019-02-20  822  		   reipl_block_fcp->fcp.br_lba);
ff6b8ea68f4b73 Michael Holzheu     2006-09-20  823  DEFINE_IPL_ATTR_RW(reipl_fcp, device, "0.0.%04llx\n", "0.0.%llx\n",
86c74d869d321b Martin Schwidefsky  2019-02-20  824  		   reipl_block_fcp->fcp.devno);
ff6b8ea68f4b73 Michael Holzheu     2006-09-20  825  
a0443fbb467af5 Hendrik Brueckner   2008-07-14  826  static void reipl_get_ascii_loadparm(char *loadparm,
a0443fbb467af5 Hendrik Brueckner   2008-07-14  827  				     struct ipl_parameter_block *ibp)
03a4d2087644f5 Michael Holzheu     2006-12-04  828  {
5f1207fbe74450 Martin Schwidefsky  2019-02-20  829  	memcpy(loadparm, ibp->common.loadparm, LOADPARM_LEN);
03a4d2087644f5 Michael Holzheu     2006-12-04  830  	EBCASC(loadparm, LOADPARM_LEN);
03a4d2087644f5 Michael Holzheu     2006-12-04  831  	loadparm[LOADPARM_LEN] = 0;
1d802e24774c94 Heiko Carstens      2009-12-18  832  	strim(loadparm);
03a4d2087644f5 Michael Holzheu     2006-12-04  833  }
03a4d2087644f5 Michael Holzheu     2006-12-04  834  
a0443fbb467af5 Hendrik Brueckner   2008-07-14  835  static ssize_t reipl_generic_loadparm_show(struct ipl_parameter_block *ipb,
a0443fbb467af5 Hendrik Brueckner   2008-07-14  836  					   char *page)
03a4d2087644f5 Michael Holzheu     2006-12-04  837  {
03a4d2087644f5 Michael Holzheu     2006-12-04  838  	char buf[LOADPARM_LEN + 1];
03a4d2087644f5 Michael Holzheu     2006-12-04  839  
a0443fbb467af5 Hendrik Brueckner   2008-07-14  840  	reipl_get_ascii_loadparm(buf, ipb);
03a4d2087644f5 Michael Holzheu     2006-12-04  841  	return sprintf(page, "%s\n", buf);
03a4d2087644f5 Michael Holzheu     2006-12-04  842  }
03a4d2087644f5 Michael Holzheu     2006-12-04  843  
a0443fbb467af5 Hendrik Brueckner   2008-07-14  844  static ssize_t reipl_generic_loadparm_store(struct ipl_parameter_block *ipb,
03a4d2087644f5 Michael Holzheu     2006-12-04  845  					    const char *buf, size_t len)
03a4d2087644f5 Michael Holzheu     2006-12-04  846  {
03a4d2087644f5 Michael Holzheu     2006-12-04  847  	int i, lp_len;
03a4d2087644f5 Michael Holzheu     2006-12-04  848  
03a4d2087644f5 Michael Holzheu     2006-12-04  849  	/* ignore trailing newline */
03a4d2087644f5 Michael Holzheu     2006-12-04  850  	lp_len = len;
03a4d2087644f5 Michael Holzheu     2006-12-04  851  	if ((len > 0) && (buf[len - 1] == '\n'))
03a4d2087644f5 Michael Holzheu     2006-12-04  852  		lp_len--;
03a4d2087644f5 Michael Holzheu     2006-12-04  853  	/* loadparm can have max 8 characters and must not start with a blank */
03a4d2087644f5 Michael Holzheu     2006-12-04  854  	if ((lp_len > LOADPARM_LEN) || ((lp_len > 0) && (buf[0] == ' ')))
03a4d2087644f5 Michael Holzheu     2006-12-04  855  		return -EINVAL;
03a4d2087644f5 Michael Holzheu     2006-12-04  856  	/* loadparm can only contain "a-z,A-Z,0-9,SP,." */
03a4d2087644f5 Michael Holzheu     2006-12-04  857  	for (i = 0; i < lp_len; i++) {
03a4d2087644f5 Michael Holzheu     2006-12-04  858  		if (isalpha(buf[i]) || isdigit(buf[i]) || (buf[i] == ' ') ||
03a4d2087644f5 Michael Holzheu     2006-12-04  859  		    (buf[i] == '.'))
03a4d2087644f5 Michael Holzheu     2006-12-04  860  			continue;
03a4d2087644f5 Michael Holzheu     2006-12-04  861  		return -EINVAL;
03a4d2087644f5 Michael Holzheu     2006-12-04  862  	}
03a4d2087644f5 Michael Holzheu     2006-12-04  863  	/* initialize loadparm with blanks */
5f1207fbe74450 Martin Schwidefsky  2019-02-20  864  	memset(ipb->common.loadparm, ' ', LOADPARM_LEN);
03a4d2087644f5 Michael Holzheu     2006-12-04  865  	/* copy and convert to ebcdic */
5f1207fbe74450 Martin Schwidefsky  2019-02-20  866  	memcpy(ipb->common.loadparm, buf, lp_len);
5f1207fbe74450 Martin Schwidefsky  2019-02-20  867  	ASCEBC(ipb->common.loadparm, LOADPARM_LEN);
5f1207fbe74450 Martin Schwidefsky  2019-02-20  868  	ipb->common.flags |= IPL_PB0_FLAG_LOADPARM;
03a4d2087644f5 Michael Holzheu     2006-12-04  869  	return len;
03a4d2087644f5 Michael Holzheu     2006-12-04  870  }
03a4d2087644f5 Michael Holzheu     2006-12-04  871  
c676aac66f5b2b Sven Schnelle       2023-01-29  872  #define DEFINE_GENERIC_LOADPARM(name)							\
c676aac66f5b2b Sven Schnelle       2023-01-29  873  static ssize_t reipl_##name##_loadparm_show(struct kobject *kobj,			\
c676aac66f5b2b Sven Schnelle       2023-01-29  874  					    struct kobj_attribute *attr, char *page)	\
c676aac66f5b2b Sven Schnelle       2023-01-29  875  {											\
c676aac66f5b2b Sven Schnelle       2023-01-29  876  	return reipl_generic_loadparm_show(reipl_block_##name, page);			\
c676aac66f5b2b Sven Schnelle       2023-01-29  877  }											\
c676aac66f5b2b Sven Schnelle       2023-01-29  878  static ssize_t reipl_##name##_loadparm_store(struct kobject *kobj,			\
c676aac66f5b2b Sven Schnelle       2023-01-29  879  					     struct kobj_attribute *attr,		\
c676aac66f5b2b Sven Schnelle       2023-01-29  880  					     const char *buf, size_t len)		\
c676aac66f5b2b Sven Schnelle       2023-01-29  881  {											\
c676aac66f5b2b Sven Schnelle       2023-01-29  882  	return reipl_generic_loadparm_store(reipl_block_##name, buf, len);		\
c676aac66f5b2b Sven Schnelle       2023-01-29  883  }											\
c676aac66f5b2b Sven Schnelle       2023-01-29  884  static struct kobj_attribute sys_reipl_##name##_loadparm_attr =				\
c676aac66f5b2b Sven Schnelle       2023-01-29  885  	__ATTR(loadparm, 0644, reipl_##name##_loadparm_show,				\
c676aac66f5b2b Sven Schnelle       2023-01-29  886  	       reipl_##name##_loadparm_store)
69928601676ff6 Michael Holzheu     2014-08-26  887  
c676aac66f5b2b Sven Schnelle       2023-01-29  888  DEFINE_GENERIC_LOADPARM(fcp);
c676aac66f5b2b Sven Schnelle       2023-01-29  889  DEFINE_GENERIC_LOADPARM(nvme);
c676aac66f5b2b Sven Schnelle       2023-01-29  890  DEFINE_GENERIC_LOADPARM(ccw);
c676aac66f5b2b Sven Schnelle       2023-01-29  891  DEFINE_GENERIC_LOADPARM(nss);
6bb361d5d8eb1d Sven Schnelle       2023-01-29  892  DEFINE_GENERIC_LOADPARM(eckd);
69928601676ff6 Michael Holzheu     2014-08-26  893  
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  894  static ssize_t reipl_fcp_clear_show(struct kobject *kobj,
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  895  				    struct kobj_attribute *attr, char *page)
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  896  {
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  897  	return sprintf(page, "%u\n", reipl_fcp_clear);
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  898  }
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  899  
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  900  static ssize_t reipl_fcp_clear_store(struct kobject *kobj,
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  901  				     struct kobj_attribute *attr,
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  902  				     const char *buf, size_t len)
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  903  {
d9b25bdf57e4ab Christophe JAILLET  2022-11-01  904  	if (kstrtobool(buf, &reipl_fcp_clear) < 0)
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  905  		return -EINVAL;
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  906  	return len;
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  907  }
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  908  
69928601676ff6 Michael Holzheu     2014-08-26  909  static struct attribute *reipl_fcp_attrs[] = {
69928601676ff6 Michael Holzheu     2014-08-26  910  	&sys_reipl_fcp_device_attr.attr,
69928601676ff6 Michael Holzheu     2014-08-26  911  	&sys_reipl_fcp_wwpn_attr.attr,
69928601676ff6 Michael Holzheu     2014-08-26  912  	&sys_reipl_fcp_lun_attr.attr,
69928601676ff6 Michael Holzheu     2014-08-26  913  	&sys_reipl_fcp_bootprog_attr.attr,
69928601676ff6 Michael Holzheu     2014-08-26  914  	&sys_reipl_fcp_br_lba_attr.attr,
69928601676ff6 Michael Holzheu     2014-08-26  915  	&sys_reipl_fcp_loadparm_attr.attr,
69928601676ff6 Michael Holzheu     2014-08-26  916  	NULL,
69928601676ff6 Michael Holzheu     2014-08-26  917  };
69928601676ff6 Michael Holzheu     2014-08-26  918  
69928601676ff6 Michael Holzheu     2014-08-26  919  static struct attribute_group reipl_fcp_attr_group = {
69928601676ff6 Michael Holzheu     2014-08-26  920  	.attrs = reipl_fcp_attrs,
22d557abf75ce3 Sebastian Ott       2015-03-17  921  	.bin_attrs = reipl_fcp_bin_attrs,
69928601676ff6 Michael Holzheu     2014-08-26  922  };
69928601676ff6 Michael Holzheu     2014-08-26  923  
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  924  static struct kobj_attribute sys_reipl_fcp_clear_attr =
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  925  	__ATTR(clear, 0644, reipl_fcp_clear_show, reipl_fcp_clear_store);
1a2ae03b1938b0 Gerald Schaefer     2020-02-20  926  
23a457b8d57dc8 Jason J. Herne      2020-03-03  927  /* NVME reipl device attributes */
23a457b8d57dc8 Jason J. Herne      2020-03-03  928  
005ca0133375a6 Alexander Egorenkov 2024-05-10 @929  DEFINE_IPL_ATTR_SCP_DATA_RW(reipl_nvme, reipl_block_nvme->hdr,
005ca0133375a6 Alexander Egorenkov 2024-05-10  930  			    reipl_block_nvme->nvme,
005ca0133375a6 Alexander Egorenkov 2024-05-10  931  			    IPL_BP_NVME_LEN, IPL_BP0_NVME_LEN,
005ca0133375a6 Alexander Egorenkov 2024-05-10  932  			    DIAG308_SCPDATA_SIZE);
23a457b8d57dc8 Jason J. Herne      2020-03-03  933  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
