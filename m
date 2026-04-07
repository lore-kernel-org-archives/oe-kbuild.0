Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335921CBEB9
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 03:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533763; cv=none; b=TY4lbp1tpFVTLz7FAUK6dzKRYlsnjb8rik9KZf5RSp90VpnXNffGjUTevQbTggAhnjlO1qvtkEGLhJrakqCahisghchondVC+HJGwlZamsuuxXEF658wLtU5WNdpdZRjV+S62QQDhxSUeAE8Q/VMbT55b8LAGs7nKR5sV7F4n1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533763; c=relaxed/simple;
	bh=VgUpraOW7NvjceehROcTQTo1I3bcbr+FuGw7DvTzJk4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sAShl55Wc0rJOjeEWe+UpBz5wh1UXMHK5wF7/KSHZolQe2m9gPSHba2FoEqVV6/ekGzNXOgwEjB3Gm2AWbpuOXU9b3Xgx2v/NzKYjXXUzgwxlux0sZMn61YFzcELn/uDz+76V1CeVbgi56/3WjU05mrpxCqYJOfxZzemgeP0Y6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETCP1OWd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETCP1OWd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533762; x=1807069762;
  h=date:from:to:cc:subject:message-id;
  bh=VgUpraOW7NvjceehROcTQTo1I3bcbr+FuGw7DvTzJk4=;
  b=ETCP1OWd5JTEnl1lPyvlwSZuSPuHC2dAgbEz72CHOYv7qRwTAQ8k+HVR
   M2vsEctLTJ/qnxzvXDjGw4Tf+ZdE9fh9aHc4pOI/SFnkmRP7KRTDM20XQ
   RXFo6UxBt5XP2lIJLnHFymOZ7olSxdg3+89pCA0bntPEs1QP8FO4sFYSU
   /5DHJ+oEMPkrAdlru2uResxT5Qjv4zyT5w3/z13UIiGTmfzU3ebQ2EXwu
   HOyxifsCsDVi4hL6YS/ljwb056c78alRyKmLo1nxZ7yb9ARwtETbdDrWN
   yGGjyrtE/PFupzyBug5oX09a+X7YXZBpjbXO3XYHWvodLfCpICY4U85FZ
   w==;
X-CSE-ConnectionGUID: SbuYHHKZRnOXPOfW/8vEVQ==
X-CSE-MsgGUID: T7trGw94SWmgefy3JQv7tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76385857"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76385857"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:49:21 -0700
X-CSE-ConnectionGUID: N6JuQD5SSpeo3mHPL7RbYA==
X-CSE-MsgGUID: TQHr7ti0QaSgHoGr+krxPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251191876"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2026 20:49:20 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xRG-0000000001H-0dSa;
	Tue, 07 Apr 2026 03:49:18 +0000
Date: Tue, 07 Apr 2026 11:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [char-misc:char-misc-linus 12/23]
 drivers/gpib/common/gpib_os.c:1318 close_dev_ioctl() warn: possible spectre
 second half.  'desc'
Message-ID: <202604031743.Pk6AgFj7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Adam Crosser <adam.crosser@praetorian.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Dave Penkler <dpenkler@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-linus
head:   d78ceee1e6205ffcd84ff581ccb40a008d39136f
commit: d1857f8296dceb75d00ab857fc3c61bc00c7f5c6 [12/23] gpib: fix use-after-free in IO ioctl handlers
:::::: branch date: 19 hours ago
:::::: commit date: 21 hours ago
config: microblaze-randconfig-r073-20260403 (https://download.01.org/0day-ci/archive/20260403/202604031743.Pk6AgFj7-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604031743.Pk6AgFj7-lkp@intel.com/

New smatch warnings:
drivers/gpib/common/gpib_os.c:1318 close_dev_ioctl() warn: possible spectre second half.  'desc'

Old smatch warnings:
drivers/gpib/common/gpib_os.c:1317 close_dev_ioctl() warn: potential spectre issue 'file_priv->descriptors' [r] (local cap)

vim +/desc +1318 drivers/gpib/common/gpib_os.c

9dde4559e93955 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  1299  
840459da1574db drivers/staging/gpib/common/gpib_os.c Michael Rubin 2025-03-19  1300  static int close_dev_ioctl(struct file *filep, struct gpib_board *board, unsigned long arg)
9dde4559e93955 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  1301  {
2e9a95ddffc60c drivers/staging/gpib/common/gpib_os.c Michael Rubin 2025-04-09  1302  	struct gpib_close_dev_ioctl cmd;
c93577b9d4533a drivers/staging/gpib/common/gpib_os.c Michael Rubin 2025-04-08  1303  	struct gpib_file_private *file_priv = filep->private_data;
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1304  	struct gpib_descriptor *desc;
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1305  	unsigned int pad;
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1306  	int sad;
9dde4559e93955 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  1307  	int retval;
9dde4559e93955 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  1308  
8e7ff4e7a2358f drivers/staging/gpib/common/gpib_os.c Dave Penkler  2025-01-14  1309  	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
9dde4559e93955 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  1310  	if (retval)
9dde4559e93955 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  1311  		return -EFAULT;
9dde4559e93955 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  1312  
9dde4559e93955 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  1313  	if (cmd.handle >= GPIB_MAX_NUM_DESCRIPTORS)
9dde4559e93955 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  1314  		return -EINVAL;
9dde4559e93955 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  1315  
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1316  	mutex_lock(&file_priv->descriptors_mutex);
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1317  	desc = file_priv->descriptors[cmd.handle];
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17 @1318  	if (!desc) {
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1319  		mutex_unlock(&file_priv->descriptors_mutex);
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1320  		return -EINVAL;
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1321  	}
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1322  	if (atomic_read(&desc->descriptor_busy)) {
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1323  		mutex_unlock(&file_priv->descriptors_mutex);
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1324  		return -EBUSY;
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1325  	}
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1326  	/* Remove from table while holding lock to prevent new IO from starting */
9dde4559e93955 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  1327  	file_priv->descriptors[cmd.handle] = NULL;
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1328  	pad = desc->pad;
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1329  	sad = desc->sad;
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1330  	mutex_unlock(&file_priv->descriptors_mutex);
9dde4559e93955 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  1331  
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1332  	retval = decrement_open_device_count(board, &board->device_list, pad, sad);
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1333  
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1334  	kfree(desc);
d1857f8296dceb drivers/gpib/common/gpib_os.c         Adam Crosser  2026-03-17  1335  	return retval;
9dde4559e93955 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  1336  }
9dde4559e93955 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09-18  1337  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
