Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC38629;
	Thu,  8 Dec 2022 06:25:44 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id f18so449645wrj.5;
        Wed, 07 Dec 2022 22:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lVqoTumIUaV6+VL26HGJasZO+Tnb32mc0SB9GPC1yuQ=;
        b=Qk/bnMPF4Zx2om8o/r3fAs+iHH5XU8LaFS+8wcBhD8CboQQWYDcd5eXxdrf60kYJ2t
         vXGOiltf0rErkL1Rcec392oTIfOy00NRLC0D3dGj9GAFs0dROjiLZAL71wlxI8NxAycN
         4sD4s4m460bHbncyB1vZUkIsir+rrzi3U3xK0NIYHgxm+6u9yzbcTwCboawncvA7KbKg
         IWZCV+cG8hvqRPQz8yxPrT35JrHrocuutCeRZnuYikTsK0c+hxZSr+t0fjjt0qzxqo4U
         nvKGHij7vttFL3EJHdrK9Nsh4XYa96DtPF4Dumt8PdnGJDzcC7kKVx+OdRQCQE0gR0JI
         2a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lVqoTumIUaV6+VL26HGJasZO+Tnb32mc0SB9GPC1yuQ=;
        b=4YnTIH+i9xCRHmnmKPvV+PgB7vimA36DYlYSiJo4VbWAQyLpm608VMCxFnueZlacki
         8fAYH2KHf8Rk/NvIAmc+zwWbgRPZ59fa/gXDJWc85QOKyEOWr70BK6/W3uewGIGeJfxG
         jz0vNFiA8mXgI2yJq86OBEcnQyMGpu87iGP1h5IdN2JNC5RKGC4wgXBCe9A/p/6CWEcO
         YrhATCDwP3yavUDx503QeTpjmDeywW1sgimh38m7K/hToBCLGJ1CvP0dodWtABPwD05k
         lrsEoGu5g+xL/9sIesNRP6FKUC2yGM4FyXNIKWb1X/WLEBWJci6RtHVajlnnUEPGc1of
         n9Pw==
X-Gm-Message-State: ANoB5pl5Z5bMFr822jy5MBNJp9czG49F061ZCDjIvVQn5GqzGEnk2j9g
	Xr0Pxii63HK/pXHvHwGupHhoE4DyiwBfYA==
X-Google-Smtp-Source: AA0mqf53fbuKtM66WgMuJ9T69Lw5atQisaUmRXtDIOWDp6cFvaisbOwrlZ+cj6I56SwFhcfj+WrOTQ==
X-Received: by 2002:a5d:5702:0:b0:242:569:3028 with SMTP id a2-20020a5d5702000000b0024205693028mr14797222wrv.435.1670480742037;
        Wed, 07 Dec 2022 22:25:42 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t16-20020a5d6910000000b0024217e7aaa7sm20834339wru.50.2022.12.07.22.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 22:25:41 -0800 (PST)
Date: Thu, 8 Dec 2022 09:25:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Xiaojian Du <Xiaojian.Du@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Huang Rui <ray.huang@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c:928 gmc_v6_0_hw_init() warn:
 missing error code? 'r'
Message-ID: <202212080729.ChsUgoMZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221208062538.ot0lCHYUrFe5jvxWlFDRP0mW9p9HKaAkXSZiAVzdl-U@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ed710da2873c2aeb3bb805864a699affaf1d03b
commit: 479e3b02b73a2de2b19df2950863149c59d57bfe drm/amdgpu: add vram check function for GMC
config: mips-randconfig-m031-20221207
compiler: mips-linux-gcc (GCC) 12.1.0

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

This seems like a false positive, but it would be more readable as
"return 0;" instead of "return r;"

df70502eef80be Ken Wang     2016-01-19  929  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

