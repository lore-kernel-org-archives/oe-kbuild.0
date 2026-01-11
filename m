Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7A834B438
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 16:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768148808; cv=none; b=okAcJCva15uIySvR0RGIScq65XkflQez72KRd5eqc5X37RALMtUrOkKuXkEFomjZa51EgiVO8mAY/QJ9hm9TwQpqVdm/x6P1cgvbXf4uo8/GQpk0GqJ8S2KidprQE4ZFc0Dr+E6X7KoMqTB7QjYB4WN14ntEiIcgZ2pRdWDO3/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768148808; c=relaxed/simple;
	bh=jn9qVxXUsk02pF9Ktmn9CwQRjlddWDWjHexNH45+wO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EXFmqFhZkz3IRJjV3MpRxcmW1JYPHFwZYhZJJnRN+S6p1MF0hCd5zTEX2Bb+FTmOf/gUvH3HbqHUyDbY2kFne0wUK9IStpqyhmYH+j/vdB3/bMRldcsvSJ40XUdDIRxlU2E1QQef/Zaqyy/OzQoHND6aIf16gyM9cix/3EaOU6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXJcGOe0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXJcGOe0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768148805; x=1799684805;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jn9qVxXUsk02pF9Ktmn9CwQRjlddWDWjHexNH45+wO0=;
  b=YXJcGOe0YdVTsPmA97cfgZnPfu8ObDGizUWtGgbz/oRXXYQBnpZ/gBr4
   nESYMoHi5RxKVGkQWceDmUtG3qnV15Et/MOcPAYzqqg+PdSVFuRJR5jX4
   YOuiabWvs9OvNPTYmzBysk9x3uE7d3EE1SkQWLKtROmHwToLKqnM5eSTz
   yseW/Mvo0fQD3/D8rPZXIIRTzDNMUTC8x6RiznciHnT0a4djQFl1A101e
   w2UWORNfz3RaWunP5pi5sZ/GxRTm+Z0rJkZiBxCaW1mYPss9LwBcr9iOQ
   9YGTDHLySthRhc4kpNY3or7LL22lUkWu+nw5v4lc6N68N2V1zK/GjfsjZ
   A==;
X-CSE-ConnectionGUID: Q9i2iwi0T7qfIyQgOyBMrg==
X-CSE-MsgGUID: 0nq5vOUsTkOYs4GDamZDfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69342375"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69342375"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 08:26:44 -0800
X-CSE-ConnectionGUID: p3nX1PlxTcay+J1iEY7CQA==
X-CSE-MsgGUID: GB6jXAMvQgGvvTNjLQsO9g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jan 2026 08:26:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veyH4-00000000CVm-2ZKT;
	Sun, 11 Jan 2026 16:26:42 +0000
Date: Mon, 12 Jan 2026 00:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-cc-option 2/2] cc1: warning:
 unrecognized command line option '-Wno-address-of-packed-member'
Message-ID: <202601120059.HG0D4Bqh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/kbuild-cc-option
head:   062fdec41bacd52271d07cba6296b439340ac22a
commit: 062fdec41bacd52271d07cba6296b439340ac22a [2/2] kbuild: Drop superfl=
uous compiler option checks
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: arc-randconfig-001-20260111 (https://download.01.org/0day-ci/archiv=
e/20260112/202601120059.HG0D4Bqh-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260112/202601120059.HG0D4Bqh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601120059.HG0D4Bqh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/stream.c: In function 'bpf_stream_vprintk_impl':
   kernel/bpf/stream.c:241:2: warning: function 'bpf_stream_vprintk_impl' m=
ight be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=
=3Dformat]
     ret =3D bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt__str, data.bin_args=
);
     ^~~
   kernel/bpf/stream.c: At top level:
>> cc1: warning: unrecognized command line option '-Wno-address-of-packed-m=
ember'
--
   kernel/bpf/helpers.c: In function '____bpf_snprintf':
   kernel/bpf/helpers.c:1069:2: warning: function '____bpf_snprintf' might =
be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=3Dfor=
mat]
     err =3D bstr_printf(str, str_size, fmt, data.bin_args);
     ^~~
   kernel/bpf/helpers.c: At top level:
>> cc1: warning: unrecognized command line option '-Wno-address-of-packed-m=
ember'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
