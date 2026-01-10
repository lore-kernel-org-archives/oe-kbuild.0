Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971AB21767D
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 19:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768074741; cv=none; b=PKR4oUNKIejiATmVGhlKJSa/WaMj7Iar4cLPba5RAh3bX+hCHKEBeMgxfWbLxy6jfllIvrPy8xVE5tsbbwpbQmNCF1giZ9PcnsEomkKpuXJih/nkd+9GJKqVzCLn17F5lhfRvj0XvrD2pwXjWm/WjdLJI4TD03bQsRvPm19KpOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768074741; c=relaxed/simple;
	bh=Wkg2zC/81XLpyJKoU0xVNvUWer3Yj0tcAShpC+9ny3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tnIiFPD61kWHHfj3uZE27GO81nTs8JM0/gixhWnB97TN08ZKKGiSylvA/C2HRrMk8Hue1Im/w5h6ZHhWKhyTgZPoXn3y/jp0mcFYziyMydq+OcXDVphhgbIB/joZS/bYligHqldWh6eY91tjdUQl7lbjH7azxKtgCCXA+YplNVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJ4A9kGk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJ4A9kGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768074740; x=1799610740;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Wkg2zC/81XLpyJKoU0xVNvUWer3Yj0tcAShpC+9ny3I=;
  b=aJ4A9kGknRJM9sdMKG01oylBFqJVYy0RY7rQSCzwWLAnDj9I7MufGffg
   e9mtXNpm4g1NskyR4iEmSOOe4+Gi3DhRX3PlTsBpzZT/2LG8qV3DsXFQ8
   w4I5ZP5v/8wjS0igEimeJGbrvOWlRU0/vjF/6Q1l7e4fR+iKCqZdpKtfg
   pVfh4DclJAtsjDPz6lu+gB0ZdoUk6XLKZ++rl8Vjk7q53PRiiWbbahit1
   9XMIFSImhmDlBkAqZxWWYaJkw+qcF6GwrCyvnaQn+gjTGRMMVHxQdT3me
   0FyUKseZ//vIRgafXkD6MCW2YSYxJWDHf0Qno+6+oBVshv39WIKVQwIj8
   A==;
X-CSE-ConnectionGUID: mV+pcLMIQxmbxIDtvnN0zQ==
X-CSE-MsgGUID: D1MC2MopTwyKv4eSdY2EGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69465161"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="69465161"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 11:52:19 -0800
X-CSE-ConnectionGUID: Sejb0LxmQviQ5kxJwt+vHA==
X-CSE-MsgGUID: oEZWFwiHQVm+MkzVCpSYgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="204167197"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jan 2026 11:52:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vef0R-00000000964-3iKy;
	Sat, 10 Jan 2026 19:52:15 +0000
Date: Sun, 11 Jan 2026 03:51:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1249/5095]
 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c:177:1: sparse: sparse: bad
 integer constant expression
Message-ID: <202601110310.gPvRCKJy-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/panel/panel-samsung-ltl106hl02.c:177:1: sparse: sparse: bad integer =
constant expression"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Anton Bambura <jenneron@protonmail.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: "Jonas Schw=C3=B6bel" <jonasschwoebel@yahoo.de>
CC: Svyatoslav Ryhel <clamor95@gmail.com>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
commit: ac488854890165b55a973dab7247aa2deea9cc02 [1249/5095] gpu/drm: panel=
: add Samsung LTL106HL02 MIPI DSI panel driver
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: openrisc-randconfig-r133-20260110 (https://download.01.org/0day-ci/=
archive/20260111/202601110310.gPvRCKJy-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260111/202601110310.gPvRCKJy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601110310.gPvRCKJy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c:177:1: sparse: sparse: =
bad integer constant expression
   drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c:177:1: sparse: sparse: =
static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL by=
te"
   drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c:178:1: sparse: sparse: =
bad integer constant expression
   drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c:178:1: sparse: sparse: =
static assertion failed: "MODULE_INFO(description, ...) contains embedded N=
UL byte"
   drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c:179:1: sparse: sparse: =
bad integer constant expression
   drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c:179:1: sparse: sparse: =
static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c:179:1: sparse: sparse: =
bad integer constant expression
   drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c:179:1: sparse: sparse: =
static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL b=
yte"

vim +177 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c

ac488854890165 Anton Bambura 2025-11-10  176 =20
ac488854890165 Anton Bambura 2025-11-10 @177  MODULE_AUTHOR("Anton Bambura =
<jenneron@protonmail.com>");

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
