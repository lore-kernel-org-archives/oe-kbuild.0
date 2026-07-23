Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BCA435534
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jul 2026 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801444; cv=none; b=RSXDrM6igxWt7EZzJKzzrP8+SeKZuU2pbp+mx98RSM0JvXYmzpTMsig4MXy21gpM47sd5D5MnKT+sE1eW+yjB0L9esW0gNg667mGeEyL3TGYJlGSB+0hJWK5/dk5iP47hOcCBSNETFyeN2W1WZPzqHogerFGsE9LbfYv0loTR+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801444; c=relaxed/simple;
	bh=Lrccgm+Sai81MWikEO1xuuoxujw1PcDuqCFTEx8Kci8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CDSu/iK8I+XESxTnayKmBrfFbx3qGg9Gvc1193Rr4RihzEnI+jgQH+1H3B7q575dXKClvw27wy6VZjq5xWqFqZyNpD1Tq4sNkGHwSwaKitnp7cbNGewE2e+hmG1+46/22z/7duCXid9l9b2//Fd76ZYu/LNtxPsb0Ty1o1+AnSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzgDIYFL; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzgDIYFL"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-476a130c138so450125f8f.0
        for <oe-kbuild@lists.linux.dev>; Thu, 23 Jul 2026 03:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784801441; x=1785406241; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAjHZU7KutdIcENZyCMKTZmcMUSGgjomFPIzWQXU0T4=;
        b=DzgDIYFL3VCWIpOhwxmd6aHW55qmJmMImAkboDSEwbuUztG2//T3YKa6RXYLr0LZmn
         l0W/1dy7fKvQwruNYAevtXABaVFE5Vh7C108OKUFcqoISbWAv9rRifS5UGlyNDmCq789
         U0edLqvmmWtpYQqxB+z9/NZXsr88oBngfEEJGFS2YrRZjU7K9KOuPjprypaaDTReJ5Ot
         3s/o295+PBzY9hQGVKupVtADz8pPfMVR31k+AXn+yDxn0LfmpfN71l6TDUn37jit80mf
         i7ZELkgO4QmSVhC+WCuIpxv/psN42uNeL9rBwQDOxC1L2hAuPKAV3CAcZ5vbpnY80P3F
         Ds6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801441; x=1785406241;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAjHZU7KutdIcENZyCMKTZmcMUSGgjomFPIzWQXU0T4=;
        b=b4fZM9k/gkVED83cXK177houNG2+Rcgtgl2uxlx+2Itjvt7fZOky3BfBQlIDUYgb9v
         a/+j95FdwY59YIAjC84PJWCKxXMsVLhhEViNXDlQV3WEOWBtLvbNCdK2ORQ93FOTIBSe
         USjiZUaES/5EO8ZiDSvRVoAXjnz18GiCm8xuAnqCBpcMrvObsLfr0qrKW91Ztr/pbbUn
         1ICjFK57BXwBg3PeCVYJAXLx3rj32e7BGb+ueLF+NBqq6A145Qfq8LU4tvdWTY2bewde
         oWtdujnDEDFGBZoiEsyCwRiggeGCnv9UJ5SoMgpV7CVB1Xja6hQIC8D8C/RDy5PDPkZN
         QHkg==
X-Gm-Message-State: AOJu0YwfqzSXORHmXbbfhmpG6rv1urwpW5Ms7+fOp748/iEaf6A1Q6xj
	X2BFLcQNWzaNHtJFgbagjwaWrz1M4KR1CNq+fB9T4xFpQbhoSXoDKHTJG47naUxzv+g=
X-Gm-Gg: AR+sD10MhVAoPHoZxXVWBTRZtUaHwzOOF9D+hgiNcwGnQdnESXOsJPIRfRYvesgrZMH
	j9/3MWHCb3RVkM6UGSEDPyRgKq7ubTnHJk+Hz4nSfv0sO/lJsv7oD8U0XkWUCnFFvzPFoOeLq6g
	mT3m+qGxIlvMEokpWUcXdJSyVGMCfoqlhBk2n4AQsIIbExT2hlnJRV6Lj0CXO5V8Tb6SoQ2XjuI
	3F/aQWpwOr/G25TQjGId5vDP63JvYXQsItKiflaDjeoiGJUkH4k6J4Ncf9tKT+WpbyabBnzEobr
	E9qoUoIn3f5O2aTGlG5/DPRUC9rOmLcfHh8vxKskoMGocmsY3X+DZApTPwn5LRttrpk7MAQ7g9W
	QZRd1lbLrs8qv7WTyMLObjLf1i5th1cxEouhSnwxccMyaVVIOrJbyte9pekYgaO8Hf+T/Dm5mwA
	==
X-Received: by 2002:a05:6000:18a2:b0:47f:7531:3e6d with SMTP id ffacd0b85a97d-47f8dc8cc77mr2890129f8f.38.1784801440784;
        Thu, 23 Jul 2026 03:10:40 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bc62basm14104470f8f.13.2026.07.23.03.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:10:40 -0700 (PDT)
Date: Thu, 23 Jul 2026 11:34:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Harry Wentland <harry.wentland@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Alex Hung <alex.hung@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3415
 dm_suspend() warn: inconsistent returns '&dm->dc_lock'.
Message-ID: <202607220433.GXC845n9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260723083400.3gke0wEN9mUQFKNAmSnJZxpOQIFU3psVFjxjuGy7UhQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b95f03f04d475aa6719d15a636ddf32222d55657
commit: af3f2f5db2659a13c256d2fb096c473eb50412ef drm/amdgpu: Remove UML build exclusion from Kconfig
config: um-randconfig-r071-20260721 (https://download.01.org/0day-ci/archive/20260722/202607220433.GXC845n9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: af3f2f5db265 ("drm/amdgpu: Remove UML build exclusion from Kconfig")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607220433.GXC845n9-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3415 dm_suspend() warn: inconsistent returns '&dm->dc_lock'.

vim +3415 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

982d7f9bfe4a503 Sunil Khatri      2024-09-30  3359  static int dm_suspend(struct amdgpu_ip_block *ip_block)
4562236b3bc0a28 Harry Wentland    2017-09-12  3360  {
982d7f9bfe4a503 Sunil Khatri      2024-09-30  3361  	struct amdgpu_device *adev = ip_block->adev;
4562236b3bc0a28 Harry Wentland    2017-09-12  3362  	struct amdgpu_display_manager *dm = &adev->dm;
4562236b3bc0a28 Harry Wentland    2017-09-12  3363  
53b3f8f40e6cff3 Dennis Li         2020-08-19  3364  	if (amdgpu_in_reset(adev)) {
3cf7a0bc87f028b Mario Limonciello 2025-02-17  3365  		enum dc_status res;
3cf7a0bc87f028b Mario Limonciello 2025-02-17  3366  
cdaae8371aa9d4e Bhawanpreet Lakha 2020-05-11  3367  		mutex_lock(&dm->dc_lock);

I guess this lock was supposed to be deleted when we converted to
scoped locks?  Bad merge???

98ab5f3513f90f1 Bhawanpreet Lakha 2021-01-11  3368  
754003486c3cc95 Ray Wu            2025-12-17  3369  		amdgpu_dm_ism_disable(dm);
98ab5f3513f90f1 Bhawanpreet Lakha 2021-01-11  3370  		dc_allow_idle_optimizations(adev->dm.dc, false);
98ab5f3513f90f1 Bhawanpreet Lakha 2021-01-11  3371  
09a4ec5da92c849 Dillon Varone     2023-11-17  3372  		dm->cached_dc_state = dc_state_create_copy(dm->dc->current_state);
cdaae8371aa9d4e Bhawanpreet Lakha 2020-05-11  3373  
8092aa3ab8f7b73 Alex Hung         2024-06-04  3374  		if (dm->cached_dc_state)
cdaae8371aa9d4e Bhawanpreet Lakha 2020-05-11  3375  			dm_gpureset_toggle_interrupts(adev, dm->cached_dc_state, false);
cdaae8371aa9d4e Bhawanpreet Lakha 2020-05-11  3376  
3cf7a0bc87f028b Mario Limonciello 2025-02-17  3377  		res = amdgpu_dm_commit_zero_streams(dm->dc);
3cf7a0bc87f028b Mario Limonciello 2025-02-17  3378  		if (res != DC_OK) {
3cf7a0bc87f028b Mario Limonciello 2025-02-17  3379  			drm_err(adev_to_drm(adev), "Failed to commit zero streams: %d\n", res);
3cf7a0bc87f028b Mario Limonciello 2025-02-17  3380  			return -EINVAL;

mutex_unlock(&dm->dc_lock); before returning.

3cf7a0bc87f028b Mario Limonciello 2025-02-17  3381  		}
cdaae8371aa9d4e Bhawanpreet Lakha 2020-05-11  3382  
cdaae8371aa9d4e Bhawanpreet Lakha 2020-05-11  3383  		amdgpu_dm_irq_suspend(adev);
cdaae8371aa9d4e Bhawanpreet Lakha 2020-05-11  3384  
8e794421bc98158 Wayne Lin         2021-07-23  3385  		hpd_rx_irq_work_suspend(dm);
8e794421bc98158 Wayne Lin         2021-07-23  3386  
65890cad2edb53b Mario Limonciello 2025-02-17  3387  		return 0;
cdaae8371aa9d4e Bhawanpreet Lakha 2020-05-11  3388  	}
4562236b3bc0a28 Harry Wentland    2017-09-12  3389  
50e0bae34fa6b8b Mario Limonciello 2025-02-13  3390  	if (!adev->dm.cached_state) {
709a37ab9c63297 Mario Limonciello 2025-06-01  3391  		int r = dm_cache_state(adev);
709a37ab9c63297 Mario Limonciello 2025-06-01  3392  
709a37ab9c63297 Mario Limonciello 2025-06-01  3393  		if (r)
709a37ab9c63297 Mario Limonciello 2025-06-01  3394  			return r;
50e0bae34fa6b8b Mario Limonciello 2025-02-13  3395  	}
d2f0b53bda31938 Leo (Hanghong  Ma 2019-01-24  3396) 
7594874227e1b04 Kun Liu           2025-01-08  3397  	s3_handle_hdmi_cec(adev_to_drm(adev), true);
7594874227e1b04 Kun Liu           2025-01-08  3398  
4a580877bdcb837 Luben Tuikov      2020-08-24  3399  	s3_handle_mst(adev_to_drm(adev), true);
4562236b3bc0a28 Harry Wentland    2017-09-12  3400  
4562236b3bc0a28 Harry Wentland    2017-09-12  3401  	amdgpu_dm_irq_suspend(adev);
4562236b3bc0a28 Harry Wentland    2017-09-12  3402  
754003486c3cc95 Ray Wu            2025-12-17  3403  	scoped_guard(mutex, &dm->dc_lock)
754003486c3cc95 Ray Wu            2025-12-17  3404  		amdgpu_dm_ism_disable(dm);

double lock.  What?

754003486c3cc95 Ray Wu            2025-12-17  3405  
8e794421bc98158 Wayne Lin         2021-07-23  3406  	hpd_rx_irq_work_suspend(dm);
8e794421bc98158 Wayne Lin         2021-07-23  3407  
32f5062d1c7dc2a Tom St Denis      2017-10-17  3408  	dc_set_power_state(dm->dc, DC_ACPI_CM_POWER_STATE_D3);
2fe79508d9c393b Hamza Mahfooz     2024-10-04  3409  
2fe79508d9c393b Hamza Mahfooz     2024-10-04  3410  	if (dm->dc->caps.ips_support && adev->in_s0ix)
2fe79508d9c393b Hamza Mahfooz     2024-10-04  3411  		dc_allow_idle_optimizations(dm->dc, true);
2fe79508d9c393b Hamza Mahfooz     2024-10-04  3412  
0f657938e4345a7 Samson Tam        2023-11-28  3413  	dc_dmub_srv_set_power_state(dm->dc->ctx->dmub_srv, DC_ACPI_CM_POWER_STATE_D3);
4562236b3bc0a28 Harry Wentland    2017-09-12  3414  
1c2075d401f06a2 Jason Yan         2020-05-04 @3415  	return 0;
4562236b3bc0a28 Harry Wentland    2017-09-12  3416  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

