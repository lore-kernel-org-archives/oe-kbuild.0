Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B6628504D
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 15:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155597; cv=none; b=IaQ8q+CMN1N9RSng3W8E+RgBnJ8j14Pi82vC/ovI3U+kUpXVYb8m3ot7uV5l3qXlRAoRmFS9/2eZr1PJrnvxDx84ouQlSd9JWqf1sTlEfG0tq0s1SycAApDCiz56sdD7e4pdozgvVFOwazfj27J2yDkKiway7lmAg5S0t9uXwf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155597; c=relaxed/simple;
	bh=LqmJ9LxetF4pLY/mA5jWzsTPIY84DyWqS488m9DRXiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oSlP5j5UVK/0YOKsPhyscRPp65Gsmwut1LVFDynlIjVeK192r8QoS/efGMDsgkTpaOM2ZVZ3e54jKtyifGqswOxICDeh9Hgp8oVjp9LM2ndGWGNvcjREQEIMv0HhVgPvT7qMA5Qan97/DATwOXMNBq2SgWmwjvzVDYEDW6RcISo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+qpKS/X; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+qpKS/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773155595; x=1804691595;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LqmJ9LxetF4pLY/mA5jWzsTPIY84DyWqS488m9DRXiY=;
  b=U+qpKS/XEfdmsILcghl3Dkv4Tf5VLgD9YIWYoiAACbf9auq74DS+OOnC
   aK/9onaMlzsQ2JP8f2zvB+3uUBHr9IpUNnm2LjGf52wsUmx0gafjA2wfI
   yzjtz8/Ds4eNe4Pm/VnclG4gNQA7jzRLtDvkLtutj2rU/3/NZixQXh3XJ
   iGz0r0IWbTWU3q73yn1n+ZSkMaLuYpiWeJcMMcnqcjQSDGdQ9MHgzSaDP
   /dztUjc/JFRQtvOg0rzczyd+HlrOXD6I+8fz4POHh8fKBPv5s3GRlD1Xb
   jLiuEQ1Dje3CU6pxhYnSINDMe1aqoa+QcuObN+S9B8U2Hp5sOfYDZjIyV
   A==;
X-CSE-ConnectionGUID: WtfdhLUpT0GLV8ykifWLXw==
X-CSE-MsgGUID: lGvwikTiRGKBsJAa15KeLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="73905988"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="73905988"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 08:13:14 -0700
X-CSE-ConnectionGUID: ndx3t8FIRrWOMUN0PU8KqA==
X-CSE-MsgGUID: SCqDnnAQQ9GmumUzEMDxlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="220327055"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Mar 2026 08:13:13 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzyli-0000000027N-0fDx;
	Tue, 10 Mar 2026 15:13:10 +0000
Date: Tue, 10 Mar 2026 23:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpib/common/gpib_os.c:816 ibioctl() warn:
 inconsistent returns '&board->big_gpib_mutex'.
Message-ID: <202603102301.bMzDY9Gk-lkp@intel.com>
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
TO: Dave Penkler <dpenkler@gmail.com>

Hi Dave,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
commit: e6ab504633e4c06e35377ecf3c8cbc304de79858 staging: gpib: Destage gpib
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20260310 (https://download.01.org/0day-ci/arc=
hive/20260310/202603102301.bMzDY9Gk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603102301.bMzDY9Gk-lkp@intel.com/

New smatch warnings:
drivers/gpib/common/gpib_os.c:816 ibioctl() warn: inconsistent returns '&bo=
ard->big_gpib_mutex'.

Old smatch warnings:
drivers/gpib/common/gpib_os.c:1291 close_dev_ioctl() warn: potential spectr=
e issue 'file_priv->descriptors' [r] (local cap)

vim +816 drivers/gpib/common/gpib_os.c

9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  610 =20
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  611  long ibioctl(struct file *filep, unsigned int cmd, unsigned long =
arg)
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  612  {
93c73ab1776fc06 drivers/staging/gpib/common/gpib_os.c Al Viro       2025-07=
-10  613  	unsigned int minor =3D iminor(file_inode(filep));
840459da1574dbf drivers/staging/gpib/common/gpib_os.c Michael Rubin 2025-03=
-19  614  	struct gpib_board *board;
c93577b9d4533af drivers/staging/gpib/common/gpib_os.c Michael Rubin 2025-04=
-08  615  	struct gpib_file_private *file_priv =3D filep->private_data;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  616  	long retval =3D -ENOTTY;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  617 =20
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  618  	if (minor >=3D GPIB_MAX_NUM_BOARDS) {
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  619  		pr_err("gpib: invalid minor number of device file\n");
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  620  		return -ENODEV;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  621  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  622  	board =3D &board_array[minor];
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  623 =20
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  624  	if (mutex_lock_interruptible(&board->big_gpib_mutex))
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  625  		return -ERESTARTSYS;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  626 =20
141765729ea7c83 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2025-02=
-14  627  	dev_dbg(board->gpib_dev, "ioctl %d, interface=3D%s, use=3D%d, on=
l=3D%d\n",
141765729ea7c83 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2025-02=
-14  628  		cmd & 0xff,
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  629  		board->interface ? board->interface->name : "",
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  630  		board->use_count,
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  631  		board->online);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  632 =20
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  633  	switch (cmd) {
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  634  	case CFCBOARDTYPE:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  635  		retval =3D board_type_ioctl(file_priv, board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  636  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  637  	case IBONL:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  638  		retval =3D online_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  639  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  640  	default:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  641  		break;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  642  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  643  	if (!board->interface) {
141765729ea7c83 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2025-02=
-14  644  		dev_err(board->gpib_dev, "no gpib board configured\n");
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  645  		retval =3D -ENODEV;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  646  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  647  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  648  	if (file_priv->got_module =3D=3D 0)	{
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  649  		if (!try_module_get(board->provider_module)) {
141765729ea7c83 drivers/staging/gpib/common/gpib_os.c Dave Penkler  2025-02=
-14  650  			dev_err(board->gpib_dev, "try_module_get() failed\n");
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  651  			retval =3D -EIO;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  652  			goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  653  		}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  654  		file_priv->got_module =3D 1;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  655  		board->use_count++;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  656  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  657  	switch (cmd) {
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  658  	case CFCBASE:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  659  		retval =3D iobase_ioctl(&board->config, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  660  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  661  	case CFCIRQ:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  662  		retval =3D irq_ioctl(&board->config, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  663  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  664  	case CFCDMA:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  665  		retval =3D dma_ioctl(&board->config, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  666  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  667  	case IBAUTOSPOLL:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  668  		retval =3D autospoll_ioctl(board, file_priv, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  669  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  670  	case IBBOARD_INFO:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  671  		retval =3D board_info_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  672  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  673  	case IBMUTEX:
79d1aa8cb769594 drivers/staging/gpib/common/gpib_os.c Paul Retourn=C3=A9 20=
25-04-11  674  		/*
79d1aa8cb769594 drivers/staging/gpib/common/gpib_os.c Paul Retourn=C3=A9 20=
25-04-11  675  		 * Need to unlock board->big_gpib_mutex before potentially=
 locking board->user_mutex
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  676  		 * to maintain consistent locking order
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  677  		 */
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  678  		mutex_unlock(&board->big_gpib_mutex);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  679  		return mutex_ioctl(board, file_priv, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  680  	case IBPAD:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  681  		retval =3D pad_ioctl(board, file_priv, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  682  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  683  	case IBSAD:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  684  		retval =3D sad_ioctl(board, file_priv, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  685  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  686  	case IBSELECT_PCI:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  687  		retval =3D select_pci_ioctl(&board->config, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  688  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  689  	case IBSELECT_DEVICE_PATH:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  690  		retval =3D select_device_path_ioctl(&board->config, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  691  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  692  	default:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  693  		break;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  694  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  695 =20
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  696  	if (!board->online) {
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  697  		retval =3D -EINVAL;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  698  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  699  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  700 =20
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  701  	switch (cmd) {
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  702  	case IBEVENT:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  703  		retval =3D event_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  704  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  705  	case IBCLOSEDEV:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  706  		retval =3D close_dev_ioctl(filep, board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  707  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  708  	case IBOPENDEV:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  709  		retval =3D open_dev_ioctl(filep, board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  710  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  711  	case IBSPOLL_BYTES:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  712  		retval =3D status_bytes_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  713  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  714  	case IBWAIT:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  715  		retval =3D wait_ioctl(file_priv, board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  716  		if (retval =3D=3D -ERESTARTSYS)
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  717  			return retval;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  718  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  719  	case IBLINES:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  720  		retval =3D line_status_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  721  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  722  	case IBLOC:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  723  		board->interface->return_to_local(board);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  724  		retval =3D 0;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  725  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  726  	default:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  727  		break;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  728  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  729 =20
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  730  	spin_lock(&board->locking_pid_spinlock);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  731  	if (current->pid !=3D board->locking_pid)	{
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  732  		spin_unlock(&board->locking_pid_spinlock);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  733  		retval =3D -EPERM;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  734  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  735  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  736  	spin_unlock(&board->locking_pid_spinlock);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  737 =20
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  738  	switch (cmd) {
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  739  	case IB_T1_DELAY:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  740  		retval =3D t1_delay_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  741  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  742  	case IBCAC:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  743  		retval =3D take_control_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  744  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  745  	case IBCMD:
79d1aa8cb769594 drivers/staging/gpib/common/gpib_os.c Paul Retourn=C3=A9 20=
25-04-11  746  		/*
79d1aa8cb769594 drivers/staging/gpib/common/gpib_os.c Paul Retourn=C3=A9 20=
25-04-11  747  		 * IO ioctls can take a long time, we need to unlock board=
->big_gpib_mutex
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  748  		 * before we call them.
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  749  		 */
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  750  		mutex_unlock(&board->big_gpib_mutex);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  751  		return command_ioctl(file_priv, board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  752  	case IBEOS:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  753  		retval =3D eos_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  754  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  755  	case IBGTS:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  756  		retval =3D ibgts(board);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  757  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  758  	case IBPPC:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  759  		retval =3D ppc_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  760  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  761  	case IBPP2_SET:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  762  		retval =3D set_local_ppoll_mode_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  763  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  764  	case IBPP2_GET:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  765  		retval =3D get_local_ppoll_mode_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  766  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  767  	case IBQUERY_BOARD_RSV:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  768  		retval =3D query_board_rsv_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  769  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  770  	case IBRD:
79d1aa8cb769594 drivers/staging/gpib/common/gpib_os.c Paul Retourn=C3=A9 20=
25-04-11  771  		/*
79d1aa8cb769594 drivers/staging/gpib/common/gpib_os.c Paul Retourn=C3=A9 20=
25-04-11  772  		 * IO ioctls can take a long time, we need to unlock board=
->big_gpib_mutex
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  773  		 * before we call them.
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  774  		 */
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  775  		mutex_unlock(&board->big_gpib_mutex);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  776  		return read_ioctl(file_priv, board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  777  	case IBRPP:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  778  		retval =3D parallel_poll_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  779  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  780  	case IBRSC:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  781  		retval =3D request_system_control_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  782  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  783  	case IBRSP:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  784  		retval =3D serial_poll_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  785  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  786  	case IBRSV:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  787  		retval =3D request_service_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  788  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  789  	case IBRSV2:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  790  		retval =3D request_service2_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  791  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  792  	case IBSIC:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  793  		retval =3D interface_clear_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  794  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  795  	case IBSRE:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  796  		retval =3D remote_enable_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  797  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  798  	case IBTMO:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  799  		retval =3D timeout_ioctl(board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  800  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  801  	case IBWRT:
79d1aa8cb769594 drivers/staging/gpib/common/gpib_os.c Paul Retourn=C3=A9 20=
25-04-11  802  		/*
79d1aa8cb769594 drivers/staging/gpib/common/gpib_os.c Paul Retourn=C3=A9 20=
25-04-11  803  		 * IO ioctls can take a long time, we need to unlock board=
->big_gpib_mutex
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  804  		 * before we call them.
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  805  		 */
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  806  		mutex_unlock(&board->big_gpib_mutex);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  807  		return write_ioctl(file_priv, board, arg);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  808  	default:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  809  		retval =3D -ENOTTY;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  810  		goto done;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  811  	}
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  812 =20
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  813  done:
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  814  	mutex_unlock(&board->big_gpib_mutex);
a836d4ec8f83bbb drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-11=
-04  815  	dev_dbg(board->gpib_dev, "ioctl done status =3D 0x%lx\n", board-=
>status);
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18 @816  	return retval;
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  817  }
9dde4559e93955c drivers/staging/gpib/common/gpib_os.c Dave Penkler  2024-09=
-18  818 =20

:::::: The code at line 816 was first introduced by commit
:::::: 9dde4559e93955ccc47d588f7fd051684d55c4e7 staging: gpib: Add GPIB com=
mon core driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
