Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22164346E4D
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 16:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761065379; cv=none; b=OqaNWd7FuXKCvV7kG5lzePkYiJSK/1PoCO1Gkg1S5Z77FtpvKd7cDeVoufDICOu9Bg1gvig61azwK5ADXkBPQAEwufSwGiDxdVWo8F8z70GThgCADb+aTEfBmh31zJDq0Dudei8z/UXNsSRufE4WMss1pbV18dyxo/nWayjM5bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761065379; c=relaxed/simple;
	bh=g+liIPmZ1gBidqtvkpuZFdmef5DeH8f0dbiQ+jR83zY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tz4cGN5Vh5l2Jnhi9IqFKl34mUom3x1b1e/BoTskLJIKgukJ7ezTJ5P3GnBUqYr0TCRhUuI4OLR17qEAAGDXtwLmZ4w+/U0V8t5sbgmGeZpAUtrsVEkurVC17N7HDM3nKHC4CDvQpdjV9xj5NOJZNEjxuM6ARa+P34M7QdR7R4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCpeLZ1S; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCpeLZ1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761065379; x=1792601379;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=g+liIPmZ1gBidqtvkpuZFdmef5DeH8f0dbiQ+jR83zY=;
  b=YCpeLZ1SYGVOukrL3oRYL2Xj+VY4h4GWl25QjVBVlHRgFm9wdDoKD7hU
   qubrr0ebNWovdOiv+z4OSd4coEZa+gTBf6oC01ExX6Kpi8M/GbCsT4Jb8
   zZy3EUOLPCchYLJeFqZ9gzcrk3XdO4dM+9pK6ySHFlWw5EYX2xX+1xE44
   dn0REkI+4t0SDGWZ84wQiNiY7s5NVKLis6Q0h1h86yWPENpzbPYbamI+L
   85LjCRK3AYZBBXHmt75eT7fVLJ3xPlYrPFpdmtKJ+EdLVdj+3KkQkTFXH
   fvL1XXGX+gHbKByNZG9bVuZsk1gn3Pr2qLyy1T0vD1Ku3AGszT2vGw4lo
   Q==;
X-CSE-ConnectionGUID: xLpcYyxDTMOgrEx7lY5Agg==
X-CSE-MsgGUID: omtPgV4XTliUmpupC8kqBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63095784"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="63095784"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 09:49:38 -0700
X-CSE-ConnectionGUID: WrNHghzISPWjPO/2EZPfww==
X-CSE-MsgGUID: 9p/aqx5vRHe25W4yC2fmrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="207310071"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Oct 2025 09:49:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBFYD-000B29-18;
	Tue, 21 Oct 2025 16:49:33 +0000
Date: Wed, 22 Oct 2025 00:49:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 5/7] drm/client: Remove drm_client_framebuffer_delete()
Message-ID: <202510220056.J4uIVWxn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251020151402.53013-6-tzimmermann@suse.de>
References: <20251020151402.53013-6-tzimmermann@suse.de>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: jfalempe@redhat.com
TO: javierm@redhat.com
TO: rrameshbabu@nvidia.com
TO: maarten.lankhorst@linux.intel.com
TO: mripard@kernel.org
TO: airlied@gmail.com
TO: simona@ffwll.ch
CC: dri-devel@lists.freedesktop.org
CC: Thomas Zimmermann <tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.18-rc2 next-20251021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-client-Remove-pitch-from-struct-drm_client_buffer/20251020-231709
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20251020151402.53013-6-tzimmermann%40suse.de
patch subject: [PATCH 5/7] drm/client: Remove drm_client_framebuffer_delete()
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: openrisc-randconfig-r072-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220056.J4uIVWxn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510220056.J4uIVWxn-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_client.c:185 drm_client_buffer_delete() warn: variable dereferenced before check 'buffer' (see line 182)

vim +/buffer +185 drivers/gpu/drm/drm_client.c

c76f0f7cb546b6 Noralf Trønnes    2018-07-03  175  
449148a7300b8b Thomas Zimmermann 2025-10-20  176  /**
449148a7300b8b Thomas Zimmermann 2025-10-20  177   * drm_client_buffer_delete - Delete a client buffer
449148a7300b8b Thomas Zimmermann 2025-10-20  178   * @buffer: DRM client buffer
449148a7300b8b Thomas Zimmermann 2025-10-20  179   */
449148a7300b8b Thomas Zimmermann 2025-10-20  180  void drm_client_buffer_delete(struct drm_client_buffer *buffer)
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  181  {
95d6cf3a3cf1a1 Thomas Zimmermann 2025-10-20 @182  	struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
82e2a75e5a640c Thomas Zimmermann 2025-10-20  183  	int ret;
82e2a75e5a640c Thomas Zimmermann 2025-10-20  184  
449148a7300b8b Thomas Zimmermann 2025-10-20 @185  	if (!buffer)
449148a7300b8b Thomas Zimmermann 2025-10-20  186  		return;
449148a7300b8b Thomas Zimmermann 2025-10-20  187  
95d6cf3a3cf1a1 Thomas Zimmermann 2025-10-20  188  	drm_gem_vunmap(gem, &buffer->map);
95d6cf3a3cf1a1 Thomas Zimmermann 2025-10-20  189  
82e2a75e5a640c Thomas Zimmermann 2025-10-20  190  	ret = drm_mode_rmfb(buffer->client->dev, buffer->fb->base.id, buffer->client->file);
82e2a75e5a640c Thomas Zimmermann 2025-10-20  191  	if (ret)
82e2a75e5a640c Thomas Zimmermann 2025-10-20  192  		drm_err(buffer->client->dev,
82e2a75e5a640c Thomas Zimmermann 2025-10-20  193  			"Error removing FB:%u (%d)\n", buffer->fb->base.id, ret);
82e2a75e5a640c Thomas Zimmermann 2025-10-20  194  
be6ee102341bc4 Emil Velikov      2020-05-15  195  	drm_gem_object_put(buffer->gem);
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  196  
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  197  	kfree(buffer);
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  198  }
449148a7300b8b Thomas Zimmermann 2025-10-20  199  EXPORT_SYMBOL(drm_client_buffer_delete);
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  200  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
