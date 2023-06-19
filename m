Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFDB3D82
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jun 2023 06:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hnndZNisgDH2kSLiRNcu2OHP+GA8fDv/VdekdNT6KRg=;
  b=LI49ehjZt9K6S/yH9IgojTMO/RU1bhRag7OnzOh77KhCF1Enod9RhiU8
   GjxS3OGl+9A3MC3AwkalccFBDPD8QmycYUzC4k7GSmEVy66avoa4b1rxp
   aTwhmZmpKJeKpaacsFuNMGVZpPu7/CeRzvD7KlrV3giTDO6z4MD8oGJLW
   0=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.00,254,1681164000"; 
   d="scan'208";a="59071543"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 08:27:46 +0200
Date: Mon, 19 Jun 2023 08:27:45 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: oe-kbuild@lists.linux.dev
cc: lkp@intel.com
Subject: [joelgranados:jag/sysctl-testing-for-0day 17/17]
 drivers/parport/procfs.c:267:18-28: WARNING use flexible-array member instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
 (fwd)
Message-ID: <3059ff7-7077-52e-e73b-5feaac6ac113@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

See line 267.

---------- Forwarded message ----------
Date: Mon, 19 Jun 2023 05:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [joelgranados:jag/sysctl-testing-for-0day 17/17]
    drivers/parport/procfs.c:267:18-28: WARNING use flexible-array member
    instead
    (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-
    and-one-element-arrays)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Joel Granados <j.granados@samsung.com>

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   cbba378db4b97256c72560da5762aaed778957c0
commit: cbba378db4b97256c72560da5762aaed778957c0 [17/17] sysctl: Remove the end element in sysctl table arrays
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: sparc64-randconfig-c034-20230618 (https://download.01.org/0day-ci/archive/20230619/202306190533.yZhS3sXC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306190533.yZhS3sXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306190533.yZhS3sXC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/parport/procfs.c:267:18-28: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
   drivers/parport/procfs.c:364:18-28: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +267 drivers/parport/procfs.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  257
^1da177e4c3f41 Linus Torvalds 2005-04-16  258
^1da177e4c3f41 Linus Torvalds 2005-04-16  259  struct parport_sysctl_table {
0f95d0ec20343b Joel Granados  2023-06-01  260  	struct ctl_table_header *port_header;
0f95d0ec20343b Joel Granados  2023-06-01  261  	struct ctl_table_header *devices_header;
cbba378db4b972 Joel Granados  2023-06-16  262  #ifdef CONFIG_PARPORT_1284
cbba378db4b972 Joel Granados  2023-06-16  263  	struct ctl_table vars[10];
cbba378db4b972 Joel Granados  2023-06-16  264  #else
cbba378db4b972 Joel Granados  2023-06-16  265  	struct ctl_table vars[5];
cbba378db4b972 Joel Granados  2023-06-16  266  #endif /* IEEE 1284 support */
cbba378db4b972 Joel Granados  2023-06-16 @267  	struct ctl_table device_dir[1];
^1da177e4c3f41 Linus Torvalds 2005-04-16  268  };
^1da177e4c3f41 Linus Torvalds 2005-04-16  269

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
