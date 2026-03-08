Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6020301474
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Mar 2026 11:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772967848; cv=none; b=boPWPAQIuyvvt4UdFw6R8s56fHbFg1IZyt625k1CjoxvkUOQ4sSqyPKfULdbdDyV+rOcrT6Ss81AkG5l2w/sKf21ATi111ANjNh7yeQavH/F+OAyPGvMtLgco1RntXGfDNY46qpHKahxqEFnE9A3zPbkuG8I7ND1sbE8p8r2OzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772967848; c=relaxed/simple;
	bh=XoAhe08HZ4+jioab9dQcc4WwiHGc23vIBx5kxXM0FhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cpGptijo+6lLaWRTQZM4sU2e+tpy/JwxF4bp8ZsYY1HlLtlxtLLXZdDBdDN4HwWcKUMkq7DFHbGhswKgpj6fRoVfRodcByr9K4K8Uv8BKDo64m6PQsBUExb84DoPPrRo8skjhHzNsTRh1+bK28xZaNjNIy2kSW2Rh7UV7xQlzLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwvEDRtc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwvEDRtc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772967845; x=1804503845;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XoAhe08HZ4+jioab9dQcc4WwiHGc23vIBx5kxXM0FhE=;
  b=jwvEDRtcsxLYy9HG53ot+i9J/T7WWRtG+1hQMSaehWuftFESVVYjBWU3
   nRHmCmi2nkkAk9hVNvTcub+d8UbVk9j6KrGEdyKM/xmCfTaZZki9EGRkl
   VNhO14ctLoZJ3fiFEQWCeTdaNyB9XASlyrP5NiSxsp8Fk7Kf5xTyJm0av
   n7Cq8U592pKw+WHPf50fynlcsPKpEEjzcsVKRS81KZVzJOyaq1Posj3SE
   FNrEb2UtZvR64ebSvkOa0xQnjOG3m4KIfaS0wIkwCqrlD5cYi/j77nVEd
   JTD3Gub+B0WXscJrph4EEmexeXXDcqxzjhT0d09IL0jzbwjMwXGk6+FT2
   w==;
X-CSE-ConnectionGUID: iPVrrhAaRCmvQjV/8uE4XQ==
X-CSE-MsgGUID: Jrh1D+R6Rne5mmfRmhn92w==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="76617346"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="76617346"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 04:04:05 -0700
X-CSE-ConnectionGUID: 9bd/YrZbT8ObJJ1UzWWnjg==
X-CSE-MsgGUID: IARZndqaQyqYkB4nxCOY7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="219447181"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Mar 2026 04:04:03 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzBvU-00000000333-2vse;
	Sun, 08 Mar 2026 11:04:00 +0000
Date: Sun, 08 Mar 2026 19:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 115/471] drivers/hid/hid-picolcd_debugfs.c:50
 picolcd_debug_reset_write() warn: potential spectre issue 'buf' [w] (local
 cap)
Message-ID: <202603081820.Q5VbZL0G-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_=
iter
head:   0a49759be1c3b29207758e467fdc1a90d0716d06
commit: 7dfd9f363e6d79bc842bf6e7fa86541a21142fef [115/471] drivers/hid: con=
vert to read/write iterators
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/=
archive/20260308/202603081820.Q5VbZL0G-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603081820.Q5VbZL0G-lkp@intel.com/

smatch warnings:
drivers/hid/hid-picolcd_debugfs.c:50 picolcd_debug_reset_write() warn: pote=
ntial spectre issue 'buf' [w] (local cap)

vim +/buf +50 drivers/hid/hid-picolcd_debugfs.c

fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  37 =20
7dfd9f363e6d79 Jens Axboe    2024-04-05  38  static ssize_t picolcd_debug_r=
eset_write(struct kiocb *iocb,
7dfd9f363e6d79 Jens Axboe    2024-04-05  39  					 struct iov_iter *from)
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  40  {
7dfd9f363e6d79 Jens Axboe    2024-04-05  41  	struct picolcd_data *data =3D =
((struct seq_file *)iocb->ki_filp->private_data)->private;
7dfd9f363e6d79 Jens Axboe    2024-04-05  42  	size_t count =3D iov_iter_cou=
nt(from);
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  43  	char buf[32];
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  44  	size_t cnt =3D min(count=
, sizeof(buf)-1);
7dfd9f363e6d79 Jens Axboe    2024-04-05  45  	if (!copy_from_iter_full(buf,=
 cnt, from))
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  46  		return -EFAULT;
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  47 =20
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  48  	while (cnt > 0 && (buf[c=
nt-1] =3D=3D ' ' || buf[cnt-1] =3D=3D '\n'))
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  49  		cnt--;
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30 @50  	buf[cnt] =3D '\0';
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  51  	if (strcmp(buf, "all") =
=3D=3D 0) {
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  52  		picolcd_reset(data->hde=
v);
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  53  		picolcd_fb_reset(data, =
1);
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  54  	} else if (strcmp(buf, "=
fb") =3D=3D 0) {
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  55  		picolcd_fb_reset(data, =
1);
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  56  	} else {
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  57  		return -EINVAL;
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  58  	}
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  59  	return count;
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  60  }
fabdbf2fd22fa1 Bruno Pr=C3=A9mont 2012-07-30  61 =20

:::::: The code at line 50 was first introduced by commit
:::::: fabdbf2fd22fa170b4c5340dbdda5c8cd88fb205 HID: picoLCD: split driver =
code

:::::: TO: Bruno Pr=C3=A9mont <bonbons@linux-vserver.org>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
