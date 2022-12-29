Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFA233F0;
	Thu, 29 Dec 2022 13:51:56 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id d4so9437403wrw.6;
        Thu, 29 Dec 2022 05:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zm1bDobgQ6pSygeM5xND4kJhHGlT6DofkyFQfGt783I=;
        b=ebyv8dR6NjEqXCxT6IOlhcLHXUp8IXlMN5UxhjqQjoo2WdZPXKdncfCJXZ7/nJilSf
         iknxXehJ0bmCibu4XomXgfzlgaGShlrLSGtTP8l7R0+SbNjuXVp7YX1AfpZPsX5hR2RH
         GBc6ER0dziccAo57D9bmapVWmX6WWbYH03tv5Rs41ZBFFYzBhCXV4Ft04SlHiy7bTMxX
         CfGHfbeUNTsAPApgDkFcMS1M2PAOt9q2eDvl8aJ/zE1FSzZ/Rt+h95X2xOEZInUd/noh
         HqPdwalRJ9U3QQURPgH8mnMsn02Pf30ith2s1CSeT51aTvHcDvWnpSjh3SXxt26470YC
         tXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zm1bDobgQ6pSygeM5xND4kJhHGlT6DofkyFQfGt783I=;
        b=uMUWkCbetSc52dyCjhhH197/5RGSuxiQbq8fYEGaPA9OPiKAQJy/N0SbnkJ3oNBjgg
         urttqt+02qD0mz1xf24Wmr2OWgfjuaLeWgUmevxtIoI2TkHWVp8UB+AabrGX10hJSCla
         IuazVpfM3xB5W1mcsGk063uzqkwIVjZl+lz0fgIhiFhN13QGZvFhy4aC+SRL3R4CG+I+
         z/32/ZtOZW7lbOAPSiPoeBApMt812gscygWfoO9TB38uFcXarK0DEj46GScIvgc8chnB
         TiXOG1sKt9Z2bQap5GunfXGKVM1KPmrjLqzVOebTjX1qnRnWMJhs1TDb/RgrWO2MSoyb
         cvNw==
X-Gm-Message-State: AFqh2koMXTy4ZF6QoPWMMco81VeOOt1UYO1sB8mKPlRc8vVh63uuxOqG
	luiLK2mgyXyXYTmAYDsi/+8bQDHpNy6fr8xQ
X-Google-Smtp-Source: AMrXdXtLRvlEt+jd72HMXlQo7iX6ufjl37B1CT3ePpVUkFgVOQvjeCTsYYPmCCcIkJbhUp0GzkFGgw==
X-Received: by 2002:adf:e94a:0:b0:242:154e:5f14 with SMTP id m10-20020adfe94a000000b00242154e5f14mr17800498wrn.17.1672321914423;
        Thu, 29 Dec 2022 05:51:54 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t13-20020adfe44d000000b002365b759b65sm17934596wrm.86.2022.12.29.05.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 05:51:54 -0800 (PST)
Date: Thu, 29 Dec 2022 16:51:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Xiaojian Du <Xiaojian.Du@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Huang Rui <ray.huang@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c:928 gmc_v6_0_hw_init() warn:
 missing error code? 'r'
Message-ID: <202212291937.KPkOnXbQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221229135150.hDvcitoFN2VgfNoGSa_Tq-kYLfNyu66eySOPJJ3H3hw@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b929c02afd37871d5afb9d498426f83432e71c2
commit: 479e3b02b73a2de2b19df2950863149c59d57bfe drm/amdgpu: add vram check function for GMC
config: ia64-randconfig-m041-20221229
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c:928 gmc_v6_0_hw_init() warn: missing error code? 'r'

vim +/r +928 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c

df70502eef80be Ken Wang     2016-01-19  906  static int gmc_v6_0_hw_init(void *handle)
df70502eef80be Ken Wang     2016-01-19  907  {
df70502eef80be Ken Wang     2016-01-19  908  	int r;
df70502eef80be Ken Wang     2016-01-19  909  	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
df70502eef80be Ken Wang     2016-01-19  910  
df70502eef80be Ken Wang     2016-01-19  911  	gmc_v6_0_mc_program(adev);
df70502eef80be Ken Wang     2016-01-19  912  
df70502eef80be Ken Wang     2016-01-19  913  	if (!(adev->flags & AMD_IS_APU)) {
df70502eef80be Ken Wang     2016-01-19  914  		r = gmc_v6_0_mc_load_microcode(adev);
df70502eef80be Ken Wang     2016-01-19  915  		if (r) {
075719c3cb79f3 Tom St Denis 2016-09-06  916  			dev_err(adev->dev, "Failed to load MC firmware!\n");
df70502eef80be Ken Wang     2016-01-19  917  			return r;
df70502eef80be Ken Wang     2016-01-19  918  		}
df70502eef80be Ken Wang     2016-01-19  919  	}
df70502eef80be Ken Wang     2016-01-19  920  
df70502eef80be Ken Wang     2016-01-19  921  	r = gmc_v6_0_gart_enable(adev);
df70502eef80be Ken Wang     2016-01-19  922  	if (r)
df70502eef80be Ken Wang     2016-01-19  923  		return r;
df70502eef80be Ken Wang     2016-01-19  924  
479e3b02b73a2d Xiaojian Du  2022-01-17  925  	if (amdgpu_emu_mode == 1)
479e3b02b73a2d Xiaojian Du  2022-01-17  926  		return amdgpu_gmc_vram_checking(adev);
479e3b02b73a2d Xiaojian Du  2022-01-17  927  	else
df70502eef80be Ken Wang     2016-01-19 @928  		return r;

"r" is zero.  Just return a literal "return 0;" or "return EINVAL;"

df70502eef80be Ken Wang     2016-01-19  929  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

