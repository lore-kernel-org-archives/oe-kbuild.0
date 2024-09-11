Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD3D1AD9CB
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Sep 2024 15:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726070047; cv=none; b=hEg4rnVE3uOkR0JrD7HNKGxKkGyOvpIuIKSWmQwE88FXd6q5p8QeOjo3U7iPdRRwsKjRhE+64/zDiQ5YQetdxhHEqB3VGdUsRPpsDmetthVvz5020RamexN8eWMjHJYQebE0Lcv6/R+Rw+0xfS6rdY67DQPIPQmCx+awrZgfwfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726070047; c=relaxed/simple;
	bh=FuZtUZ7JHhXE1nBssc715m0mDWuTYrDCjcWZPKwI1wA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aq/OuroDGz7bRzIBAWvbN4WLVB8r2sFZbWMKe7iVEacAZDfpcXl+eh2PksNpnM3+wiQJ8M9f68hFQn992GEVUll4arL2AgXUnvAfqL4SQ+o0kFcgOXeUWUxDrkgEb1ucaaxN+COEMkykD4xNjGjFuUA/jde677FiIuCI4ek/wQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0ErvY+e; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0ErvY+e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726070045; x=1757606045;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FuZtUZ7JHhXE1nBssc715m0mDWuTYrDCjcWZPKwI1wA=;
  b=c0ErvY+ebXfaDO2NXFnTkNy/EbZoZtxX6Dh0C1xf+knyPs8TRq0SgtmP
   FUqTCPMwJLcVi7XD3l+GDeNb/Yv5DZe5Lx9KE+28mr8EfsUPSCdPWDzMQ
   LYEcjIbvsZ9iHtXkJhMIldhKwWnDyAx+2hoXO6++nINN4CsMhHW9Cwv5Y
   xz6DIGwu5aTs6icZqMJgP1t2Mu1/PK5PBDOGcSpSfO3DIuYYgnXmlreBG
   9QQhpxopJkg1n1/AjgA3X9Z8Q2kWCiSsN9WDu/OyAy7mVuamP6JL7F1ZG
   gFzly4sQlX/dXT338dmecS69smeohcrIYcKgaTWD0hpjXCEmDo9zpsxgE
   Q==;
X-CSE-ConnectionGUID: q6DyEpK7TRu9Hd6JTb1pZA==
X-CSE-MsgGUID: YZXVZeEDTC6G3LElrF93tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="50295888"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="50295888"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:54:03 -0700
X-CSE-ConnectionGUID: 5v55nozcQKu9i4EM2cjQjw==
X-CSE-MsgGUID: ZPLrrD3dR16J9pZAdFN0qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="72197180"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Sep 2024 08:54:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soPfL-0003mq-07;
	Wed, 11 Sep 2024 15:53:59 +0000
Date: Wed, 11 Sep 2024 23:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 24/24] x86/resctrl: Introduce interface to modify
 assignment states of the groups
Message-ID: <202409112351.fbIMtRVP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <68c8ef0592c653c5b99cd26d982966cd4a41cb31.1725488488.git.babu.moger@amd.com>
References: <68c8ef0592c653c5b99cd26d982966cd4a41cb31.1725488488.git.babu.moger@amd.com>
TO: Babu Moger <babu.moger@amd.com>

Hi Babu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.11-rc7 next-20240911]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-cpufeatures-Add-support-for-Assignable-Bandwidth-Monitoring-Counters-ABMC/20240905-062937
base:   linus/master
patch link:    https://lore.kernel.org/r/68c8ef0592c653c5b99cd26d982966cd4a41cb31.1725488488.git.babu.moger%40amd.com
patch subject: [PATCH v7 24/24] x86/resctrl: Introduce interface to modify assignment states of the groups
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: i386-randconfig-141-20240911 (https://download.01.org/0day-ci/archive/20240911/202409112351.fbIMtRVP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409112351.fbIMtRVP-lkp@intel.com/

smatch warnings:
arch/x86/kernel/cpu/resctrl/rdtgroup.c:1278 rdtgroup_mbm_assign_control_write() error: uninitialized symbol 'ret'.

vim +/ret +1278 arch/x86/kernel/cpu/resctrl/rdtgroup.c

d9001030c01eb5 Babu Moger 2024-09-04  1221  
d9001030c01eb5 Babu Moger 2024-09-04  1222  static ssize_t rdtgroup_mbm_assign_control_write(struct kernfs_open_file *of,
d9001030c01eb5 Babu Moger 2024-09-04  1223  						 char *buf, size_t nbytes, loff_t off)
d9001030c01eb5 Babu Moger 2024-09-04  1224  {
d9001030c01eb5 Babu Moger 2024-09-04  1225  	struct rdt_resource *r = of->kn->parent->priv;
d9001030c01eb5 Babu Moger 2024-09-04  1226  	char *token, *cmon_grp, *mon_grp;
d9001030c01eb5 Babu Moger 2024-09-04  1227  	enum rdt_group_type rtype;
d9001030c01eb5 Babu Moger 2024-09-04  1228  	int ret;
d9001030c01eb5 Babu Moger 2024-09-04  1229  
d9001030c01eb5 Babu Moger 2024-09-04  1230  	/* Valid input requires a trailing newline */
d9001030c01eb5 Babu Moger 2024-09-04  1231  	if (nbytes == 0 || buf[nbytes - 1] != '\n')
d9001030c01eb5 Babu Moger 2024-09-04  1232  		return -EINVAL;
d9001030c01eb5 Babu Moger 2024-09-04  1233  
d9001030c01eb5 Babu Moger 2024-09-04  1234  	buf[nbytes - 1] = '\0';
d9001030c01eb5 Babu Moger 2024-09-04  1235  
d9001030c01eb5 Babu Moger 2024-09-04  1236  	cpus_read_lock();
d9001030c01eb5 Babu Moger 2024-09-04  1237  	mutex_lock(&rdtgroup_mutex);
d9001030c01eb5 Babu Moger 2024-09-04  1238  
d9001030c01eb5 Babu Moger 2024-09-04  1239  	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
d9001030c01eb5 Babu Moger 2024-09-04  1240  		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
d9001030c01eb5 Babu Moger 2024-09-04  1241  		mutex_unlock(&rdtgroup_mutex);
d9001030c01eb5 Babu Moger 2024-09-04  1242  		cpus_read_unlock();
d9001030c01eb5 Babu Moger 2024-09-04  1243  		return -EINVAL;
d9001030c01eb5 Babu Moger 2024-09-04  1244  	}
d9001030c01eb5 Babu Moger 2024-09-04  1245  
d9001030c01eb5 Babu Moger 2024-09-04  1246  	rdt_last_cmd_clear();
d9001030c01eb5 Babu Moger 2024-09-04  1247  
d9001030c01eb5 Babu Moger 2024-09-04  1248  	while ((token = strsep(&buf, "\n")) != NULL) {
d9001030c01eb5 Babu Moger 2024-09-04  1249  		if (strstr(token, "/")) {
d9001030c01eb5 Babu Moger 2024-09-04  1250  			/*
d9001030c01eb5 Babu Moger 2024-09-04  1251  			 * The write command follows the following format:
d9001030c01eb5 Babu Moger 2024-09-04  1252  			 * “<CTRL_MON group>/<MON group>/<domain_id><opcode><flags>”
d9001030c01eb5 Babu Moger 2024-09-04  1253  			 * Extract the CTRL_MON group.
d9001030c01eb5 Babu Moger 2024-09-04  1254  			 */
d9001030c01eb5 Babu Moger 2024-09-04  1255  			cmon_grp = strsep(&token, "/");
d9001030c01eb5 Babu Moger 2024-09-04  1256  
d9001030c01eb5 Babu Moger 2024-09-04  1257  			/*
d9001030c01eb5 Babu Moger 2024-09-04  1258  			 * Extract the MON_GROUP.
d9001030c01eb5 Babu Moger 2024-09-04  1259  			 * strsep returns empty string for contiguous delimiters.
d9001030c01eb5 Babu Moger 2024-09-04  1260  			 * Empty mon_grp here means it is a RDTCTRL_GROUP.
d9001030c01eb5 Babu Moger 2024-09-04  1261  			 */
d9001030c01eb5 Babu Moger 2024-09-04  1262  			mon_grp = strsep(&token, "/");
d9001030c01eb5 Babu Moger 2024-09-04  1263  
d9001030c01eb5 Babu Moger 2024-09-04  1264  			if (*mon_grp == '\0')
d9001030c01eb5 Babu Moger 2024-09-04  1265  				rtype = RDTCTRL_GROUP;
d9001030c01eb5 Babu Moger 2024-09-04  1266  			else
d9001030c01eb5 Babu Moger 2024-09-04  1267  				rtype = RDTMON_GROUP;
d9001030c01eb5 Babu Moger 2024-09-04  1268  
d9001030c01eb5 Babu Moger 2024-09-04  1269  			ret = rdtgroup_process_flags(r, rtype, cmon_grp, mon_grp, token);
d9001030c01eb5 Babu Moger 2024-09-04  1270  			if (ret)
d9001030c01eb5 Babu Moger 2024-09-04  1271  				break;
d9001030c01eb5 Babu Moger 2024-09-04  1272  		}
d9001030c01eb5 Babu Moger 2024-09-04  1273  	}
d9001030c01eb5 Babu Moger 2024-09-04  1274  
d9001030c01eb5 Babu Moger 2024-09-04  1275  	mutex_unlock(&rdtgroup_mutex);
d9001030c01eb5 Babu Moger 2024-09-04  1276  	cpus_read_unlock();
d9001030c01eb5 Babu Moger 2024-09-04  1277  
d9001030c01eb5 Babu Moger 2024-09-04 @1278  	return ret ?: nbytes;
d9001030c01eb5 Babu Moger 2024-09-04  1279  }
d9001030c01eb5 Babu Moger 2024-09-04  1280  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
