Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8025F26A1B5
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 08:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764404818; cv=none; b=nMsOrv0ibQk73EQNxm1zEzMv0ZaQdtpK2D4lSubZHcTt4w6QpuSvlWbmpqg5+oCg20vdiggIFKp/RXl7mk4RbQSkimjBQnoSuihYXe9EQ4g6u1IpEyizJfFwPEBGDmkDI10jPDVTHC1uVLFLwqUsxTxX+1urYf7c/skK7/DOE2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764404818; c=relaxed/simple;
	bh=HuBHFNbWPehV2Bqu9+xeBpGx6fVKxF2CinAvoj14724=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n/ZxY1+GPPnKW3eOOp+nyRxb8nx+txFqHw29dFwi24jLUtI3vE4f0FowJpeNtkbz/1fNQPijx3ADLIsgWKwgwIMQe7Oue3kKyEwC6g5l4lkkhGyL9Nr41MU7Xzlvx4kyDb805mdcjoGJWW+s1AHn/wJikBOqJL9dQpKLezxN2IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hh2Nj4s7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hh2Nj4s7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764404816; x=1795940816;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HuBHFNbWPehV2Bqu9+xeBpGx6fVKxF2CinAvoj14724=;
  b=hh2Nj4s7aMXXl1yoKUSPUjCUc/8Ie+bDrXCA4qz5lYg2GOeLFUvHs3gu
   jIIlzs6Mepc/hxXUpauoOFop4ZNoFBsxDqbXP9yn4WBFbFDkZUZNaVbTZ
   boLysH5SW1LSq4EjqBR/2+j77S3fiSbAwQGkVqG/auWH32cETqz8MDEj2
   zxkxJDb0A7oV1TirKWrHVPPAVuY8CXEBDLd/1TDGYB58dMuL9aMIw+ap5
   ImwJu3eqAUl6tm2XxcZ/WDw52ZJzW6wTRAksObZbJp7Y8fFn7R+fAG5ku
   9hNLHK5WBALxam8VSlALmCqsOQlnYYJwNWyG3olcbSyQLEvAonCklfnIU
   w==;
X-CSE-ConnectionGUID: ZTNcBLXJSSmM/peqNSVZ0A==
X-CSE-MsgGUID: tbLuwe5ZQ/iOjUH+c/O9WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="84018244"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="84018244"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 00:26:55 -0800
X-CSE-ConnectionGUID: vpZ2lgvlSbCDaKhq73HWig==
X-CSE-MsgGUID: WkEQVrN6QIi3XfKTsFj0Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="192883883"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Nov 2025 00:26:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPGI7-00000000749-3424;
	Sat, 29 Nov 2025 08:26:51 +0000
Date: Sat, 29 Nov 2025 16:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
Message-ID: <202511291652.EupyTDzf-lkp@intel.com>
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
In-Reply-To: <20251126-vram-carveout-tuning-for-upstream-v3-4-cf1729c4cb3c@amd.com>
References: <20251126-vram-carveout-tuning-for-upstream-v3-4-cf1729c4cb3c@amd.com>
TO: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
TO: Alex Deucher <alexander.deucher@amd.com>
TO: "Christian König" <christian.koenig@amd.com>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Jonathan Corbet <corbet@lwn.net>
CC: amd-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: "Tsao, Anson" <anson.tsao@amd.com>
CC: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
CC: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>

Hi Yo-Jung,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5de8ce0f3709ad93ca5a579aa45cf1b52d72bc90]

url:    https://github.com/intel-lab-lkp/linux/commits/Yo-Jung-Leo-Lin-AMD/drm-amdgpu-parse-UMA-size-getting-setting-bits-in-ATCS-mask/20251126-171047
base:   5de8ce0f3709ad93ca5a579aa45cf1b52d72bc90
patch link:    https://lore.kernel.org/r/20251126-vram-carveout-tuning-for-upstream-v3-4-cf1729c4cb3c%40amd.com
patch subject: [PATCH v3 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20251128 (https://download.01.org/0day-ci/archive/20251129/202511291652.EupyTDzf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511291652.EupyTDzf-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:1306 carveout_store() warn: potential spectre issue 'uma_info->entries' [r] (local cap)

vim +1306 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c

5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1286) 
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1287) static ssize_t carveout_store(struct device *dev,
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1288) 			      struct device_attribute *attr,
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1289) 			      const char *buf, size_t count)
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1290) {
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1291) 	struct amdgpu_uma_carveout_info *uma_info = &amdgpu_acpi_priv.atcs.uma_info;
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1292) 	struct drm_device *ddev = dev_get_drvdata(dev);
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1293) 	struct amdgpu_device *adev = drm_to_adev(ddev);
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1294) 	struct amdgpu_uma_carveout_option *opt;
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1295) 	unsigned long val;
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1296) 	uint8_t flags;
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1297) 	int r;
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1298) 
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1299) 	r = kstrtoul(buf, 10, &val);
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1300) 	if (r)
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1301) 		return r;
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1302) 
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1303) 	if (val >= uma_info->num_entries)
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1304) 		return -EINVAL;
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1305) 
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26 @1306) 	opt = &uma_info->entries[val];
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1307) 
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1308) 	if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1309) 	    !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1310) 		drm_err_once(ddev, "Option %ul not supported due to lack of Custom/Auto flag", r);
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1311) 		return -EINVAL;
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1312) 	}
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1313) 
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1314) 	flags = opt->flags;
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1315) 	flags &= ~((flags & AMDGPU_UMA_FLAG_AUTO) >> 1);
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1316) 
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1317) 	guard(mutex)(&uma_info->update_lock);
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1318) 
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1319) 	r = amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1320) 	if (r)
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1321) 		return r;
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1322) 
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1323) 	uma_info->uma_option_index = val;
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1324) 
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1325) 	return count;
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1326) }
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1327) static DEVICE_ATTR_RW(carveout);
5b31d3313d99634 Yo-Jung Leo Lin (AMD  2025-11-26  1328) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
