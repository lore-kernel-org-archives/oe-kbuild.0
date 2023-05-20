Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ECD658
	for <oe-kbuild@lists.linux.dev>; Sat, 20 May 2023 07:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684568859; x=1716104859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cFUlgKulMc1lEgCKPqcum81rsKtAfsXB9wlmzQOyOeE=;
  b=XpGCDrP1Myfb2fcq23be4Y5Vv59e9lWvkWxQqQfqlOHS1EHwprVCUMMW
   A6NZF9UrOam9RsG4uerCDwmKtfFOGri49UMbV/gj2C+mYPevvKhSa/DsJ
   ZokGfPgQ7Ln19e/Da2ESujPD2FzI9zbx/1Yk0Lc9J0Ik/4f2LB0XTk2rB
   S3HyZDejAJOG/NeX+IkisS0574b+nPKeUzcy3WOQJQLGg0eAMYnKY5deU
   KEv2SWP61AW1MxRlPYQqsfUW8DlqlQn+YV69xSFxRR7TX7f663sATG0dy
   1cwheSdOE3qcDraJLgw1Wp/w8HG7Ac1oiroN8fwojYSDY4HMY9hHyuKvy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="380782757"
X-IronPort-AV: E=Sophos;i="6.00,179,1681196400"; 
   d="scan'208";a="380782757"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2023 00:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="847165417"
X-IronPort-AV: E=Sophos;i="6.00,179,1681196400"; 
   d="scan'208";a="847165417"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 May 2023 00:47:37 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q0HJR-000BP8-0k;
	Sat, 20 May 2023 07:47:37 +0000
Date: Sat, 20 May 2023 15:46:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.15 1/3] spdxcheck:
 include/uapi/linux/android_fuse.h: 1:57 Exception not valid for license
 BSD-3-CLAUSE: Linux-syscall-note
Message-ID: <202305201525.nLUKEx2f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/uapi/linux/android_fuse.h: 1:57 Exception not valid for license BSD-3-CLAUSE: Linux-syscall-note"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   9e92bfe8fd6f9b0fce7a9712c8e04013bb5ba7c4
commit: f5f4199c102aa676998b42abff60d071385c1c0c [1/3] ANDROID: fuse-bpf v1.1
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202305201525.nLUKEx2f-lkp@intel.com/

spdxcheck warnings: (new ones prefixed by >>)
>> include/uapi/linux/android_fuse.h: 1:57 Exception not valid for license BSD-3-CLAUSE: Linux-syscall-note
   tools/testing/selftests/rseq/compiler.h: 1:28 Invalid License ID: LGPL-2.1-only
   tools/testing/selftests/rseq/rseq-generic-thread-pointer.h: 1:28 Invalid License ID: LGPL-2.1-only
   tools/testing/selftests/rseq/rseq-ppc-thread-pointer.h: 1:28 Invalid License ID: LGPL-2.1-only
   tools/testing/selftests/rseq/rseq-thread-pointer.h: 1:28 Invalid License ID: LGPL-2.1-only
   tools/testing/selftests/rseq/rseq-x86-thread-pointer.h: 1:28 Invalid License ID: LGPL-2.1-only

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
