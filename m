Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E6141C92
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Jun 2024 06:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718866784; cv=none; b=i5OtmcAIR6aCRMJdozLX1uQfY4ggFm8DYEKiKSnjB5jD1NmStQCY9WGdS52/OX+NAekvF6vrdj61aRYTRLsjHHuabgRrTo4uUFiDlMx8ioVMHi6xVJ0v5DHetR/2kVIS3NULXy2oQxvkpADzRiawO45tIylcrG8kNGleYlUrstI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718866784; c=relaxed/simple;
	bh=klQFUZdeNSsd/u5ke4xU7Ehta3oS577AH7d1Q6I7r7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YevAB8N23ri7HvXR5gGrgdTTG6eoSCGeyoX7Nl02ANyyNz2RUB2k2LU8nAIa2Q/pVRHYaFwOVjBJeVOGvkSYQhdBRR71Ch2rm29IRTFKiRwB6+9lFvgId1AT9SaG58B8O5t77/LjY8M4pgG/Gn52irkNTUKbnPdgtO8Cb+YfuP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YuWIQOyh; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YuWIQOyh"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57d07f07a27so442203a12.3
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Jun 2024 23:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718866779; x=1719471579; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtJ+4uZ4ex28J7QDbOD0QW1xHtMVQdZ4DZULYABGcYk=;
        b=YuWIQOyhyE99gAHc5il3Pwr0k26++cevTwO8CwJlfiqUKLJBu/ZHwZGbLrLSDqkDqR
         tFDHPSqB5m/zHOfhMrGXzowBD812fxDRGpqBCWJTT2Rmx+eEDgN0RcvgPqDbIqVkblq0
         ykFfeA5A3+mUgx+HtxgBbTIoTzHklCIShotiEpYE9A6+PfMByFPw2kyVi3nd+kFcDdVT
         4IfumlqC418dWo7wQsrD1W48pO5NgwDPvb/b9vP1TyO1dDggLaPs7fYf4jnHai466Leu
         01tjpJ97GjzTngJAFgsw0Zb4ENItzjMrzxhBIXXjCWvy3S3aXV0lbowI+e+xlmpkwDKx
         oD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718866779; x=1719471579;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MtJ+4uZ4ex28J7QDbOD0QW1xHtMVQdZ4DZULYABGcYk=;
        b=hJ0KOlIAT4m8aO2R6VN01HL4eCEKTyK8VD36rb8FG5GRLbC/p3uC6ArQtHQ9wHqy/j
         IivurXwaFzDch8ftD/AOS3OStWp9MeSwpi7RpgWGYCVJ68+3ufJBefM8uTdTPz9t9hvL
         alfONZAS2T5UEezPl6E+0/mtFE3UNDrJcD6mYau0tZdDljQ8HXLXY1vraSyDFFcQQnjg
         BzV0jaNAmVMkWHXQ7UwRe3CgYQf/ms2ddND0L73CFRSMzqWJ2lJWfA4hK5QfCS01S0y2
         R0idZlfAyAbbmGLeRtVQQManPUvr7LtZ6KI/bHgrlDyG8qttsCvTx4a88E4fOI70mPX0
         SHUQ==
X-Gm-Message-State: AOJu0YwY2jN//jUC1LdWKUDcKdL4N9LTLSiNfXA+RZ6suecGJnjMoveA
	w/O9/Gsv9dZbCLmrSQY94ntq61ulc2ASUGhDLf2LA1BO4uZOAANAfaZ/ru57iMf+jnzhPDD8WCN
	D
X-Google-Smtp-Source: AGHT+IEkQfMdgFs4EyViq7lxUzgdDauft1xfkm2E5tn+NuLIIZcUS+h/rShjUs3nwktfPjSOIQCqKg==
X-Received: by 2002:a17:906:3b0a:b0:a6f:6150:3f5c with SMTP id a640c23a62f3a-a6fab7d6addmr249144166b.76.1718866779386;
        Wed, 19 Jun 2024 23:59:39 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56ecdd2asm747267766b.141.2024.06.19.23.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 23:59:38 -0700 (PDT)
Date: Thu, 20 Jun 2024 09:59:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org,
	Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [linux-next:master 6397/7105] drivers/gpu/drm/xe/xe_oa.c:293
 xe_oa_add_config_ioctl() error: we previously assumed 'oa->xe' could be null
 (see line 292)
Message-ID: <1275c783-1fc4-4706-add8-3bc5d27b09fc@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2102cb0d050d34d50b9642a3a50861787527e922
commit: cdf02fe1a94a768cbcd20f5c4e1a1d805f4a06c0 [6397/7105] drm/xe/oa/uapi: Add/remove OA config perf ops
config: x86_64-randconfig-161-20240620 (https://download.01.org/0day-ci/archive/20240620/202406200703.72WIWhEJ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406200703.72WIWhEJ-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_oa.c:293 xe_oa_add_config_ioctl() error: we previously assumed 'oa->xe' could be null (see line 292)
drivers/gpu/drm/xe/xe_oa.c:392 xe_oa_remove_config_ioctl() error: we previously assumed 'oa->xe' could be null (see line 391)

vim +293 drivers/gpu/drm/xe/xe_oa.c

cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  283  int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  284  {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  285  	struct xe_oa *oa = &to_xe_device(dev)->oa;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  286  	struct drm_xe_oa_config param;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  287  	struct drm_xe_oa_config *arg = &param;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  288  	struct xe_oa_config *oa_config, *tmp;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  289  	struct xe_oa_reg *regs;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  290  	int err, id;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  291  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17 @292  	if (!oa->xe) {
                                                     ^^^^^^
Pointer is NULL

cdf02fe1a94a76 Ashutosh Dixit 2024-06-17 @293  		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
                                                                ^^^^^^^^^^^^
Dereferenced.

"Real Fact": This is drm_dbg() but the dev_dbg() macro has magic sanity
checking where instead of checking for if the device is NULL, it checks
for if the (drm < (void *)PAGE_SIZE).  That catches this sort of bug.
Hyrum’s Law applies here where people have taken advantage of this to
deliberately pass garbage pointers to dev_dbg().

I feel like in a different life I could have had a career writing facts
for Snapple bottle caps.  My talents are wasted.

cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  294  		return -ENODEV;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  295  	}

[ snip ]

cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  384  int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  385  {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  386  	struct xe_oa *oa = &to_xe_device(dev)->oa;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  387  	struct xe_oa_config *oa_config;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  388  	u64 arg, *ptr = u64_to_user_ptr(data);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  389  	int ret;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  390  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17 @391  	if (!oa->xe) {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17 @392  		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
                                                                ^^^^^^^^^^^^
Same.

cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  393  		return -ENODEV;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  394  	}
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  395  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  396  	if (xe_perf_stream_paranoid && !perfmon_capable()) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

