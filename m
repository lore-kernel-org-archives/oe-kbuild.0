Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03F7320CCD
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 13:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769089686; cv=none; b=o6iyvOoGVmjKy04O+iPdqvw3+5jiJRrcaOvCRn6C0V8IGzDNp0w2PhtCzujU07DuIL7bH1ptLotBvp5wz1mcaOtuCgvmvt3GprJawIy7jcvbFb6hFj8pSUrBTZtBogeLyHf9FgV9UwUGbBJYghUk7Sl8Mcg6wzqBhw6W5rFDjdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769089686; c=relaxed/simple;
	bh=ML+p3DraA/ChmGN7ydpK9C0VPp/Iyw1R0qlR3MvWBbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kOfgBbDTfa0e97qGyTMlvWpJHO8SFb/zaK3y0dM+1+6+C8msBppRia2ZIo0ZXd06zK4tGK2950wJSuijODTdeE8kH2owVXjw8//czUhcugjdYchdXFlXJtWo7fjQC5PDSzQSoe7JlmK0W+vkdhNTP943xe4mi21jL0QNkLxes38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUm9pn4F; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUm9pn4F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769089684; x=1800625684;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ML+p3DraA/ChmGN7ydpK9C0VPp/Iyw1R0qlR3MvWBbw=;
  b=bUm9pn4FxDcNBmzpCDuG8aZ2fQ+ylc+H9OgX5M7A4kl08kyHM9rSrfeQ
   Kd1X/ShrUCYhEg8hxtPEX+XfNs8sfo+MWqBgDJbCCYCme0te8W7+XYioX
   2Gr/V5Hu9WDohxbRBbEHEG7cV/ectCoNWNWFiifx5B4b5akT/KTCVUZJ5
   hrdkHfxZacpG36W/3zUUY05lyaUsVKgXmypIQ4w1cMrfhWEjv2BisEX4y
   d1GK8IhyjW2cPRZVbCKz1Me/CExEU8pF7B/ITv0VPEPAVQOzKLK+drBak
   O81t5PU5prOXgc/8MVLN61nW2o+Qm3GEO4+YerlSdbwPGzny9M9a6VXCD
   A==;
X-CSE-ConnectionGUID: FhztOyloSQW6rPP9736eEA==
X-CSE-MsgGUID: HRsKg37BRc6lP03HC40PEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="80633695"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="80633695"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 05:48:04 -0800
X-CSE-ConnectionGUID: uoZk6M0PTyCTRrGscjPXng==
X-CSE-MsgGUID: yCs3GsmDRK+CrYxns+hY5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="211190069"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jan 2026 05:48:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viv2W-00000000Ssj-2AyO;
	Thu, 22 Jan 2026 13:48:00 +0000
Date: Thu, 22 Jan 2026 21:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jimc:dd-drm-fix 45/75] lib/dynamic_debug.c:1844
 ddebug_drop_cached_prefix() warn: passing freed memory 'prefix' (line 1843)
Message-ID: <202601222139.VGTZ3L94-lkp@intel.com>
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
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "=C5=81ukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git dd-drm-fix
head:   354f9423ffa1fb2a31f8410ddeea96a7a8471ec1
commit: 37e1c3e5c714f09a36daac2b5c3c55b3b7f9fae4 [45/75] dyndbg: cache the =
dynamic prefixes per callsite.
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arc-randconfig-r072-20260122 (https://download.01.org/0day-ci/archi=
ve/20260122/202601222139.VGTZ3L94-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601222139.VGTZ3L94-lkp@intel.com/

smatch warnings:
lib/dynamic_debug.c:1844 ddebug_drop_cached_prefix() warn: passing freed me=
mory 'prefix' (line 1843)

vim +/prefix +1844 lib/dynamic_debug.c

37e1c3e5c714f0 Jim Cromie 2023-10-02  1832 =20
37e1c3e5c714f0 Jim Cromie 2023-10-02  1833  static void ddebug_drop_cached_=
prefix(const struct _ddebug *dp)
37e1c3e5c714f0 Jim Cromie 2023-10-02  1834  {
37e1c3e5c714f0 Jim Cromie 2023-10-02  1835  	char *prefix;
37e1c3e5c714f0 Jim Cromie 2023-10-02  1836  	unsigned long key =3D ddebug_p=
refix_key(dp);
37e1c3e5c714f0 Jim Cromie 2023-10-02  1837  	unsigned long lock_flags;
37e1c3e5c714f0 Jim Cromie 2023-10-02  1838 =20
37e1c3e5c714f0 Jim Cromie 2023-10-02  1839  	spin_lock_irqsave(&pr_prefixes=
_lock, lock_flags);
37e1c3e5c714f0 Jim Cromie 2023-10-02  1840  	prefix =3D mtree_erase(&pr_pre=
fixes, key);
37e1c3e5c714f0 Jim Cromie 2023-10-02  1841  	spin_unlock_irqrestore(&pr_pre=
fixes_lock, lock_flags);
37e1c3e5c714f0 Jim Cromie 2023-10-02  1842  	if (prefix) {
37e1c3e5c714f0 Jim Cromie 2023-10-02 @1843  		kfree(prefix);
37e1c3e5c714f0 Jim Cromie 2023-10-02 @1844  		v3pr_info("drop cached prefix=
: %s\n", prefix);
37e1c3e5c714f0 Jim Cromie 2023-10-02  1845  	}
37e1c3e5c714f0 Jim Cromie 2023-10-02  1846  }
37e1c3e5c714f0 Jim Cromie 2023-10-02  1847 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
