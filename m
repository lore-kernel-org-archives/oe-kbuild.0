Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C9426FDBF
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 04:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787287546; cv=none; b=jzME7RVpX6+4rIPthpJJwh+tqaGeQY3PI7Wwfn+tFcqbpfdzs9FhulsdELVQLjkmklJZNnwcMI38/9GfRUs6bLIj16jQCA+anD3FPhb7lgrZgbYYKGtBQbtZ3DVOM1B0p4UiVh3GNV1Ovsd/15HfhzpaVyCOsucGQQAxXN3WWX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787287546; c=relaxed/simple;
	bh=rT4/2yBEiEIkMtGAQBX5PBCgc7+s4MOzAjEPOmYo5EE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NytJ39X5BePlrKIYZdf5K3NR+eP5qCJG3sERIa+4efpmqY3HsjO5Zqqcs7Btcd8FvPrSV6gYY6dmmnqs+3lO9s04mDoKtn7m/Vf0yviM67g1Jw1+kfYm1h+MvxlijugV40H54HnuE0njAuwqQK0SAN8eY0T+EfnDQOJK0HXUKfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkrbAjFu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkrbAjFu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787287545; x=1818823545;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rT4/2yBEiEIkMtGAQBX5PBCgc7+s4MOzAjEPOmYo5EE=;
  b=jkrbAjFu0OoK2LeOcPuy7RLUUuYnGYndtarMR4g0SALB4CrFWzi865Zc
   MkK7sFdewoQ5+jN1MlczAvyVm2b/aQ8eEtrbyqA5Q7irYwv5iQ5Z6pli3
   axCgDF/QFqelv/b8lKguqxgzhU9ao52qILJLthwRVYr6dmoFXiOw9HtLZ
   3lTGvk0ZfXmGqNhqsXwny6xQIC2C4mnsA/nUEebgL7mtaB9GujotmNMnD
   DbwQ00ljtqA0VszfjSMAiv15a7L44vXGvTZ8u+7FJNEb8FiybndX6GNcS
   GdVSAwGfXI6nYuN93bPMGDrVRoY6x4vjLfKKDllHdnyve7mLyla+LEjoq
   w==;
X-CSE-ConnectionGUID: 0tDC9SHGSK+qK/9WMNMXBQ==
X-CSE-MsgGUID: teZa6YsLS1mu8j5qGjgySQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="75365674"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="75365674"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 21:45:44 -0700
X-CSE-ConnectionGUID: T83xFkmRQwyLy1f9rn2/Mw==
X-CSE-MsgGUID: E8jbMDqbT1aBZgu1icEqHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="270460944"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Aug 2026 21:45:43 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxH8O-00000000pMP-3yIA;
	Fri, 21 Aug 2026 04:45:40 +0000
Date: Fri, 21 Aug 2026 12:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] mtd: block2mtd: Fix divide error when erase_size is
 zero
Message-ID: <202608211251.8RIgwpgB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <48230456575d27aa83ce8640de8fc07cc62e8efb.1786499433.git.xiaopei01@kylinos.cn>
References: <48230456575d27aa83ce8640de8fc07cc62e8efb.1786499433.git.xiaopei01@kylinos.cn>
TO: Pei Xiao <xiaopei01@kylinos.cn>
TO: joern@lazybastard.org
TO: miquel.raynal@bootlin.com
TO: richard@nod.at
TO: vigneshr@ti.com
TO: linux-mtd@lists.infradead.org
TO: linux-kernel@vger.kernel.org
CC: Pei Xiao <xiaopei01@kylinos.cn>
CC: syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com
CC: "Jörn Engel" <joern@barelysecure.org>
CC: stable@vger.kernel.org

Hi Pei,

kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/mtd/next]
[also build test ERROR on mtd/mtd/fixes linus/master v7.2 next-20260819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pei-Xiao/mtd-block2mtd-Fix-divide-error-when-erase_size-is-zero/20260812-095242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
patch link:    https://lore.kernel.org/r/48230456575d27aa83ce8640de8fc07cc62e8efb.1786499433.git.xiaopei01%40kylinos.cn
patch subject: [PATCH v2] mtd: block2mtd: Fix divide error when erase_size is zero
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: sh-randconfig-002-20260821 (https://download.01.org/0day-ci/archive/20260821/202608211251.8RIgwpgB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211251.8RIgwpgB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608211251.8RIgwpgB-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/mtd/devices/block2mtd.o: in function `block2mtd_free_device':
>> drivers/mtd/devices/block2mtd.c:215:(.text+0x670): undefined reference to `__moddi3'


vim +215 drivers/mtd/devices/block2mtd.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  201  
^1da177e4c3f41 Linus Torvalds    2005-04-16  202  
^1da177e4c3f41 Linus Torvalds    2005-04-16  203  static void block2mtd_free_device(struct block2mtd_dev *dev)
^1da177e4c3f41 Linus Torvalds    2005-04-16  204  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  205  	if (!dev)
^1da177e4c3f41 Linus Torvalds    2005-04-16  206  		return;
^1da177e4c3f41 Linus Torvalds    2005-04-16  207  
^1da177e4c3f41 Linus Torvalds    2005-04-16  208  	kfree(dev->mtd.name);
^1da177e4c3f41 Linus Torvalds    2005-04-16  209  
f9d8c3c4236ef2 Christian Brauner 2024-01-23  210  	if (dev->bdev_file) {
f9d8c3c4236ef2 Christian Brauner 2024-01-23  211  		invalidate_mapping_pages(dev->bdev_file->f_mapping, 0, -1);
22650a99821dda Christian Brauner 2024-03-26  212  		bdev_fput(dev->bdev_file);
^1da177e4c3f41 Linus Torvalds    2005-04-16  213  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  214  
^1da177e4c3f41 Linus Torvalds    2005-04-16 @215  	kfree(dev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  216  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  217  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
