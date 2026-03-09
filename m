Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7C72D592F
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Mar 2026 18:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773082627; cv=none; b=t2c+Nfe4hMGh/qvbwmbj90qH22KDYV7BDo6ZITnhuw504laDjSUiTN7BAyR/h5xdKSVlX1+a0B6aTrNz3v/ve9aubXm0tCfY0K9T601Z8ylsBFCzXjhkzt4t6bVCJnVGtzCgR5wSw/+DCn7DiTkOTgabBZRflgDsKBMaPXLzL0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773082627; c=relaxed/simple;
	bh=o+UZPr2RlxrZsvTFqNOWMynxQjwbyIvkcuI1f+xNJP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cfIEdFNamcIjmPZQf1Z2TLsvf/wnJxa1zAxJCy5nnjw+ejyptn5QHm/qJ7uQ2dNPsmqDN2S5ZsRw6aKo9D8Cu5AposceZSHLQW8KAqCnR52kx51+2u6EfVbTJcc31I4rg3hHSDus0RLbbnQZrmc85buXSUzZdygzSvCKZZR+Iq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k22OltQZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k22OltQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773082625; x=1804618625;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=o+UZPr2RlxrZsvTFqNOWMynxQjwbyIvkcuI1f+xNJP8=;
  b=k22OltQZoJidKYKkRSdpJH1g87LWMwNLwYrXoqNwxGZ2cJWji9YFzJT0
   5swsrpahqnQ5GV7A4z0iSujNViAcky7kpWpuU0n6DabL5lLjtlx82Hl3v
   /t08FU2rnyCL+woXmhck5Hx0uCZSmUsmtkzWcjkyw4g6CCu51ANNVuZLj
   z6EcJvUwjB3vRxzMwvk6WqvvzDl1cdr+biPpiHQi4YlX9XwygPtOHkh+y
   eiD5xSCArNjlWjC55HpwE5d2z51TaF+RE/e+Ny8bLtbR690I/3fD3OZrb
   zrszedtlS16mWSwlLDtxLvb6SGd9dyBTYIAbzSYSSdP6F5RPvwp+qu/QG
   A==;
X-CSE-ConnectionGUID: wJmaM/P5TbGtqSsTBxlqeg==
X-CSE-MsgGUID: Jxxoc2cqTCyVmiNicyNy3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="91501255"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="91501255"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 11:57:04 -0700
X-CSE-ConnectionGUID: wkiWU7RoSDmAy5JF+OYVRQ==
X-CSE-MsgGUID: 9huvMveHT3SMXvBjihcmmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="224294152"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Mar 2026 11:57:04 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzfmn-000000000iq-0MCk;
	Mon, 09 Mar 2026 18:57:01 +0000
Date: Tue, 10 Mar 2026 02:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 115/471] drivers/hid/hid-picolcd_debugfs.c:50
 picolcd_debug_reset_write() warn: potential spectre issue 'buf' [w] (local
 cap)
Message-ID: <202603100207.LotLQ2MK-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/=
archive/20260310/202603100207.LotLQ2MK-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603100207.LotLQ2MK-lkp@intel.com/

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
