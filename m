Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0D9218EBF
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Jun 2025 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485661; cv=none; b=agcSGOGrqAlvXaML4bMruDpsCSIQ9uyMG23CXAHmuMiT2/RG5bUy/3n1EIxPEt9b1IyUniVtOPRIuoBfE3FGobVyNbG2qsLTLE2q5azA3pcxp8ISAl41hwvX6zH4jHm0+AY/RsVr+FH4zYtf5/RFDO8jz+pLqsNmINdGRnr7fiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485661; c=relaxed/simple;
	bh=54XOD8PuQVj//v8Z+dWHg15tHghkCtpwD3e34n1v/Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ldXQHIN+Swa2iW4SIlbNIDCioe/OPwSb5L8Aoaj6E1TzULozfhljJYw+M9swa9KAwt24Ytv3Jx0f17q8uo/qBB6kPBeoL8LLQkSBmOXBp5J731tRkj0w0LAzGPqn0N6KiWqQeBd4bA9Gnz+wnXnHBZpskumUxay6x5zpfb6l1Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZShQutop; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZShQutop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749485660; x=1781021660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=54XOD8PuQVj//v8Z+dWHg15tHghkCtpwD3e34n1v/Qs=;
  b=ZShQutops9hqlR9nfGcBAtOfE6uAtfoYqtPDVpVuf77pKS1Vhtdc+YBg
   sEUlCWP08x0Pw4JtnsnCVXnoxva2PJdqZ2BuSFr/fxfPPgwX0kLt5sLKl
   cUkW1Yb0j7RawPQHDFGDgR7XHaT4x2HuKQEBwjVO5IY8v9wKToiZwM/Ql
   3pbPBeqg8vZvtAPKWVJoIJJMH3Fvg0M3jZU+myin6JSYJ7eYnMPamrGLE
   +oWpaU9SpZKTDaZY8iNqV06leKKQnYnCSM+ajcBCFub4YnrY9A0VcxAUY
   HV8JAfMYLo30Yj1/hZJaeNtEEOMvDuR8Fd658dvwHlhpzFdwMUw/46vBa
   g==;
X-CSE-ConnectionGUID: IoVunKTqQi2UJ6tEnFVC1w==
X-CSE-MsgGUID: 5WhrcYalSxqMolWRQ6zDyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51275778"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="51275778"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 09:14:19 -0700
X-CSE-ConnectionGUID: pWeGmxuDRGKiCxz09R6LsQ==
X-CSE-MsgGUID: DSYqaNgLTMyWCvCtYNQuhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="147077723"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jun 2025 09:14:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOf8Z-0007Bd-39;
	Mon, 09 Jun 2025 16:14:15 +0000
Date: Tue, 10 Jun 2025 00:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v8 5/7] ACPI: APEI: EINJ: Create debugfs files to enter
 device id and syndrome
Message-ID: <202506100008.WCNjNbsv-lkp@intel.com>
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
In-Reply-To: <20250604223804.842501-6-zaidal@os.amperecomputing.com>
References: <20250604223804.842501-6-zaidal@os.amperecomputing.com>
TO: Zaid Alali <zaidal@os.amperecomputing.com>

Hi Zaid,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v6.16-rc1 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zaid-Alali/ACPI-APEI-EINJ-Fix-kernel-test-sparse-warnings/20250605-064102
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250604223804.842501-6-zaidal%40os.amperecomputing.com
patch subject: [PATCH v8 5/7] ACPI: APEI: EINJ: Create debugfs files to enter device id and syndrome
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-054-20250609 (https://download.01.org/0day-ci/archive/20250610/202506100008.WCNjNbsv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506100008.WCNjNbsv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/acpi/apei/einj-core.c:884:5-6: WARNING: Unsigned expression compared with zero: c < 0

vim +884 drivers/acpi/apei/einj-core.c

fe9ef21f215600 Tony Luck 2025-06-04  867  
fe9ef21f215600 Tony Luck 2025-06-04  868  static ssize_t u128_write(struct file *f, const char __user *buf, size_t count, loff_t *off)
fe9ef21f215600 Tony Luck 2025-06-04  869  {
fe9ef21f215600 Tony Luck 2025-06-04  870  	char input[2 + 2 * COMPONENT_LEN + 2];
fe9ef21f215600 Tony Luck 2025-06-04  871  	u8 *save = f->f_inode->i_private;
fe9ef21f215600 Tony Luck 2025-06-04  872  	u8 tmp[COMPONENT_LEN];
fe9ef21f215600 Tony Luck 2025-06-04  873  	char byte[3] = {};
fe9ef21f215600 Tony Luck 2025-06-04  874  	char *s, *e;
fe9ef21f215600 Tony Luck 2025-06-04  875  	size_t c;
fe9ef21f215600 Tony Luck 2025-06-04  876  	long val;
fe9ef21f215600 Tony Luck 2025-06-04  877  	int i;
fe9ef21f215600 Tony Luck 2025-06-04  878  
fe9ef21f215600 Tony Luck 2025-06-04  879  	/* Require that user supply whole input line in one write(2) syscall */
fe9ef21f215600 Tony Luck 2025-06-04  880  	if (*off)
fe9ef21f215600 Tony Luck 2025-06-04  881  		return -EINVAL;
fe9ef21f215600 Tony Luck 2025-06-04  882  
fe9ef21f215600 Tony Luck 2025-06-04  883  	c = simple_write_to_buffer(input, sizeof(input), off, buf, count);
fe9ef21f215600 Tony Luck 2025-06-04 @884  	if (c < 0)
fe9ef21f215600 Tony Luck 2025-06-04  885  		return c;
fe9ef21f215600 Tony Luck 2025-06-04  886  
fe9ef21f215600 Tony Luck 2025-06-04  887  	if (c < 1 || input[c - 1] != '\n')
fe9ef21f215600 Tony Luck 2025-06-04  888  		return -EINVAL;
fe9ef21f215600 Tony Luck 2025-06-04  889  
fe9ef21f215600 Tony Luck 2025-06-04  890  	/* Empty line means invalidate this entry */
fe9ef21f215600 Tony Luck 2025-06-04  891  	if (c == 1) {
fe9ef21f215600 Tony Luck 2025-06-04  892  		memset(save, 0xff, COMPONENT_LEN);
fe9ef21f215600 Tony Luck 2025-06-04  893  		return c;
fe9ef21f215600 Tony Luck 2025-06-04  894  	}
fe9ef21f215600 Tony Luck 2025-06-04  895  
fe9ef21f215600 Tony Luck 2025-06-04  896  	if (input[0] == '0' && (input[1] == 'x' || input[1] == 'X'))
fe9ef21f215600 Tony Luck 2025-06-04  897  		s = input + 2;
fe9ef21f215600 Tony Luck 2025-06-04  898  	else
fe9ef21f215600 Tony Luck 2025-06-04  899  		s = input;
fe9ef21f215600 Tony Luck 2025-06-04  900  	e = input + c - 1;
fe9ef21f215600 Tony Luck 2025-06-04  901  
fe9ef21f215600 Tony Luck 2025-06-04  902  	for (i = 0; i < COMPONENT_LEN; i++) {
fe9ef21f215600 Tony Luck 2025-06-04  903  		byte[1] = *--e;
fe9ef21f215600 Tony Luck 2025-06-04  904  		byte[0] = e > s ? *--e : '0';
fe9ef21f215600 Tony Luck 2025-06-04  905  		if (kstrtol(byte, 16, &val))
fe9ef21f215600 Tony Luck 2025-06-04  906  			return -EINVAL;
fe9ef21f215600 Tony Luck 2025-06-04  907  		tmp[i] = val;
fe9ef21f215600 Tony Luck 2025-06-04  908  		if (e <= s)
fe9ef21f215600 Tony Luck 2025-06-04  909  			break;
fe9ef21f215600 Tony Luck 2025-06-04  910  	}
fe9ef21f215600 Tony Luck 2025-06-04  911  	while (++i < COMPONENT_LEN)
fe9ef21f215600 Tony Luck 2025-06-04  912  		tmp[i] = 0;
fe9ef21f215600 Tony Luck 2025-06-04  913  
fe9ef21f215600 Tony Luck 2025-06-04  914  	memcpy(save, tmp, COMPONENT_LEN);
fe9ef21f215600 Tony Luck 2025-06-04  915  
fe9ef21f215600 Tony Luck 2025-06-04  916  	return c;
fe9ef21f215600 Tony Luck 2025-06-04  917  }
fe9ef21f215600 Tony Luck 2025-06-04  918  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
