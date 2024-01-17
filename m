Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FBB4683
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Jan 2024 00:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705452402; cv=none; b=QjosGdFr5NuPizEFFOE+I3dLrEjMeIgxs2V2huZbH9tz1E1eQL3zIRhtR3HTv5xpMp6JqLgTZpvjL42G7nB2G9IVE+VZmxCYubOiEdOZlPpV1NNTYRt2k+d7nKtAvAg04wj0tUHeBPyLe5yVneSZw+Zq0BXjkNqstDl4TGgclu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705452402; c=relaxed/simple;
	bh=LQIrRAl87iQCL5MVepxI+WLx2I4PmRYgMFJRH8f3KFM=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=WQVzmUkRB2biaRo9PiEZIqc9c8abn7dvVz2RpRYi4Jv6Nj9G2cokkrrT/usKvf+HoJVZUh5tyucvb9bZhhZ9398QIFSEO4+/XpN8xVA7jkOzqpjCSZ2vWe6tGj7SRAPqOjsohUc2xxluxw++ap3pOX0NfIYOzmzbz54z0mnjWJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NT7MXmgO; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NT7MXmgO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705452400; x=1736988400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LQIrRAl87iQCL5MVepxI+WLx2I4PmRYgMFJRH8f3KFM=;
  b=NT7MXmgOLe0mG7JAOtkALHLZW3QEzUyUdfWUHyorRs4v0SgcdLsSgftb
   uGrmfS9H1w0pqxDl7JHP1xu523gZ2WCiZEWxFPDCk/jEPNBLrnEhm9gkA
   /5lBl/fCjk3rpJ0N9Ox08ObIIu3Vd258sqpF2AMcPVmP575pPtMNF582m
   xa03yeD2coxReZbt6z10uBCP1+PSVc/tf590nhjzrmITplDeKBtXpUHOh
   BySRmccuQUmqi97/3Ax44dHK2l3yARKJVgysMzREE6Iz9PHtS2arNSOJn
   xPPjHWlxvRIvUDWm2PpTvFlc+t/l4OHFJBEWd0sfQ8TrEFz9CpmrMkOFK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="399701061"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="399701061"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 16:46:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="760373662"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="760373662"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 16 Jan 2024 16:46:37 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPu4h-0001Pe-0c;
	Wed, 17 Jan 2024 00:46:35 +0000
Date: Wed, 17 Jan 2024 08:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-5.15 1705/27545] aarch64-linux-ld:
 v4l2-mem2mem.c:undefined reference to `v4l2_event_pending'
Message-ID: <202401170835.Q3zpvP0y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Maheshwar,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   57ddb1ecd70e0e064b8dc36d00140b131702f0ed
commit: 1d74cced13c8a1bc8c2808697d4ffe73bdab9b19 [1705/27545] ANDROID: Kconfig.gki: Enable media controller configs
:::::: branch date: 34 hours ago
:::::: commit date: 3 years, 3 months ago
config: arm64-randconfig-004-20240117 (https://download.01.org/0day-ci/archive/20240117/202401170835.Q3zpvP0y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401170835.Q3zpvP0y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401170835.Q3zpvP0y-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: -z norelro ignored
   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_poll':
   v4l2-mem2mem.c:(.text+0xe58): undefined reference to `video_devdata'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0xeb0): undefined reference to `v4l2_event_pending'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0xfec): undefined reference to `v4l2_event_pending'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ctx_release':
   v4l2-mem2mem.c:(.text+0x1374): undefined reference to `vb2_queue_release'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x137c): undefined reference to `vb2_queue_release'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_create_bufs':
   v4l2-mem2mem.c:(.text+0x1884): undefined reference to `vb2_create_bufs'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1894): undefined reference to `vb2_create_bufs'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_expbuf':
   v4l2-mem2mem.c:(.text+0x18d4): undefined reference to `vb2_expbuf'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x18e4): undefined reference to `vb2_expbuf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_expbuf':
   v4l2-mem2mem.c:(.text+0x1928): undefined reference to `vb2_expbuf'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1938): undefined reference to `vb2_expbuf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_create_bufs':
   v4l2-mem2mem.c:(.text+0x197c): undefined reference to `vb2_create_bufs'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x198c): undefined reference to `vb2_create_bufs'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_dqbuf':
   v4l2-mem2mem.c:(.text+0x19dc): undefined reference to `vb2_dqbuf'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x19f8): undefined reference to `vb2_dqbuf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_dqbuf':
   v4l2-mem2mem.c:(.text+0x1a48): undefined reference to `vb2_dqbuf'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1a60): undefined reference to `vb2_dqbuf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_prepare_buf':
   v4l2-mem2mem.c:(.text+0x1a8c): undefined reference to `video_devdata'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1abc): undefined reference to `vb2_prepare_buf'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1adc): undefined reference to `vb2_prepare_buf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_reqbufs':
   v4l2-mem2mem.c:(.text+0x1b34): undefined reference to `vb2_reqbufs'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_reqbufs':
   v4l2-mem2mem.c:(.text+0x1bbc): undefined reference to `vb2_reqbufs'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_prepare_buf':
   v4l2-mem2mem.c:(.text+0x1c14): undefined reference to `video_devdata'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1c44): undefined reference to `vb2_prepare_buf'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1c64): undefined reference to `vb2_prepare_buf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_querybuf':
   v4l2-mem2mem.c:(.text+0x1d70): undefined reference to `vb2_querybuf'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1d98): undefined reference to `vb2_querybuf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamoff':
   v4l2-mem2mem.c:(.text+0x1e98): undefined reference to `vb2_streamoff'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1ec4): undefined reference to `vb2_streamoff'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamon':
   v4l2-mem2mem.c:(.text+0x26a8): undefined reference to `vb2_streamon'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x26cc): undefined reference to `vb2_streamon'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_streamon':
   v4l2-mem2mem.c:(.text+0x2748): undefined reference to `vb2_streamon'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x2768): undefined reference to `vb2_streamon'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_qbuf':
   v4l2-mem2mem.c:(.text+0x28f0): undefined reference to `video_devdata'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x2944): undefined reference to `vb2_qbuf'
   aarch64-linux-ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   videobuf2-core.c:(.text+0x4d08): undefined reference to `v4l_vb2q_enable_media_source'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
