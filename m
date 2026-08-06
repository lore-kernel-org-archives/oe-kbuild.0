Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E908636A370
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Aug 2026 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786034460; cv=none; b=MdSz8H5wTZha9jwTd4J4Si26QJQFSdZrPIoyuJa7XHn1MpKRhpAAkf7j31pqL9qqmQPeLBmuK4liN13Eb2zYNlxYyoKnvW4+ittYr4tceXyXsMoTJKWCsGBHVn1A82cFCCb9pOJ7iKO874Xg6XiKGH8al0upXPTu9drZQ6W7mw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786034460; c=relaxed/simple;
	bh=rbmEBzPhzwmBEh7Ga4C3+3pmVbAqjyvADmcgzroLgi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WQbII4r8To3qRnkN1RMZV419t14idC02X/tihYpud/g9FNmuZE/g1FxIPhS00EhjvuPlPw8PzME+pDSDa4uxQdyMAR17jPkEDT3br+LpTWS3LPQ3s0zZY7DIOagu8LxThnFppeq5Tg5YyhX7bqvAGWahKnt/rV7s2e8TCyW0pxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvUNePBf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvUNePBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786034458; x=1817570458;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rbmEBzPhzwmBEh7Ga4C3+3pmVbAqjyvADmcgzroLgi0=;
  b=EvUNePBfOCh+HhR8g0qyGjag860nLIurC9r5+lm0q1dAKrArzDyVW6kk
   eK/TeWfTufDff0A6eVyXTGMiDVyRJ3e6vTotfJRM33G4S9/e+6ybcjxdS
   c6cGLs+wlkZBO16XqeixItWFAbNfXy6faWU/18vCkQ0O6rSq4/hkXBoKP
   hg8HXoXE3VKAGl+d0BOjtlSeNkjUdDFhMo/BHt5M/f+tIywqz4RIGFWL3
   LPrSJdeiSHEEc2+ChZYOHf8l8618Awx9r+xpDQ7YJGA++XKl2I8fXYLhH
   bs+Y7XqVTMYf/X2PmOutdY7nb2HrymEydQZ54npAJ78Uymuf2GOwH0T8p
   A==;
X-CSE-ConnectionGUID: qTqewIpdRVizf6abhRgFbg==
X-CSE-MsgGUID: 0gURwYw8Q+av3+0pZvWlmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86749259"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86749259"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 09:40:57 -0700
X-CSE-ConnectionGUID: 5e1ZoJGbSoOozOjnDEsY6g==
X-CSE-MsgGUID: iC0vCAc7S0OuxXBjvpNVOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="262781540"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Aug 2026 09:40:55 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws19J-00000000Ffl-3MaH;
	Thu, 06 Aug 2026 16:40:53 +0000
Date: Fri, 07 Aug 2026 00:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/auxdisplay/line-display.c:89 delete_attachment()
 warn: iterator used outside loop: 'attachment'
Message-ID: <202608070025.KNx97V16-lkp@intel.com>
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
TO: "Jean-Fran=C3=A7ois Lessard" <jefflessard3@gmail.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0d839570765118029aa8bf4a95444c6a11aacf85
commit: 3ba5c78fe7c5d60edae0c47361f191d40c5c1cf0 auxdisplay: linedisp: supp=
ort attribute attachment to auxdisplay devices
date:   10 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/2026=
0807/202608070025.KNx97V16-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 3ba5c78fe7c5 ("auxdisplay: linedisp: support attribute attachment =
to auxdisplay devices")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608070025.KNx97V16-lkp@intel.com/

New smatch warnings:
drivers/auxdisplay/line-display.c:89 delete_attachment() warn: iterator use=
d outside loop: 'attachment'

Old smatch warnings:
drivers/auxdisplay/line-display.c:110 to_linedisp() warn: iterator used out=
side loop: 'attachment'

vim +/attachment +89 drivers/auxdisplay/line-display.c

3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  72 =20
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  73  static struct lin=
edisp *delete_attachment(struct device *dev, bool direct)
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  74  {
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  75  	struct linedisp_=
attachment *attachment;
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  76  	struct linedisp =
*linedisp;
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  77 =20
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  78  	guard(spinlock)(=
&linedisp_attachments_lock);
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  79 =20
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  80  	list_for_each_en=
try(attachment, &linedisp_attachments, list) {
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  81  		if (attachment-=
>device =3D=3D dev &&
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  82  		    attachment-=
>direct =3D=3D direct)
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  83  			break;
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  84  	}
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  85 =20
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  86  	if (list_entry_i=
s_head(attachment, &linedisp_attachments, list))
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  87  		return NULL;
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  88 =20
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18 @89  	linedisp =3D att=
achment->linedisp;
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  90  	list_del(&attach=
ment->list);
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  91  	kfree(attachment=
);
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  92 =20
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  93  	return linedisp;
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  94  }
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  95 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
