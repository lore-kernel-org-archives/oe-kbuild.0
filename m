Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A527B;
	Mon, 12 Dec 2022 07:15:32 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id h10so11095767wrx.3;
        Sun, 11 Dec 2022 23:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YgC2jmdaW/0i3+a/1q2dEYZAEgeFSTwAr6BPOdB+MaQ=;
        b=ocj2A8akWE2sq5A4cCUjPe+oVhIkSoqJ7A0BHMbhxgPPgavlNOWvhhxb1oOUamC0/t
         Jhbf4nMOKmADRZFicwXgUrQvUinpos9rvUXpo5Z3g+YHu9ewIbw31V7WHxwZcKBEMoKP
         K1kmIhbxDOCZ7OHJ12gPS5wHmZ2qD1QIHiVNy757hh31buK4+L3CECVzi+338ntRlxO0
         oCeuoOGBdmo9o0Ebyaq0cHI5ZPSNGLT1ouvxJyBT8D/YMnmNDJammzuwsi9KU8OyizlK
         B1qmZd+/bo/lHkFGgxf7Z0VoQi5ntDBOZS51uj31up3XNESbeohTyteKZXUXNTCr2wK1
         snRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgC2jmdaW/0i3+a/1q2dEYZAEgeFSTwAr6BPOdB+MaQ=;
        b=n8JrBO6HfWyCrvZoKPftTpahD3xmbuSeOoc32uTK+eBR2UwzoiEdb2+rnyuSlLgApR
         WVwD6LA2N3lzHSDBsaoHPRoN/8owLbVA0+GFIF+Uipz6rjQs3mkcUNhjlAzrYbHIzPk2
         Bs14ayu1YdJgHdS3KxvcR7W7kTMYa2X0uzRE6jSPHAcQ94ziT0IfTAh85Y34sBKnFSEt
         SzFmU3FTangHuGM9GjGfBAhdC1DbCMxUPhJKJgkgynNO0hdOtOcxTfdJiTVpbO+c17/d
         L5ix6rRPn45HFxrZjv7CSux8wxpeJFB3BHP9RAH3bSG71nXiozZWgN/2lw185BYjn29J
         vUew==
X-Gm-Message-State: ANoB5plc9GWmiZmSMgn+DyOj5aNzoVIE0q0Smu1gTicDo4sQ9zLlIoc7
	mZFwhZmNzSSvxwvzb1ej8+dDbhSS/htMSA==
X-Google-Smtp-Source: AA0mqf4XSdDEcnoOckDdOtQHNwUO575C2OX/asksEhrRhX6cSRiMn5WoblYu2dyDVCkxxLA8DR+uow==
X-Received: by 2002:adf:f30a:0:b0:242:144:90c4 with SMTP id i10-20020adff30a000000b00242014490c4mr8987742wro.28.1670829330271;
        Sun, 11 Dec 2022 23:15:30 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m5-20020adffe45000000b002302dc43d77sm7956169wrs.115.2022.12.11.23.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:15:29 -0800 (PST)
Date: Mon, 12 Dec 2022 10:15:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Luben Tuikov <luben.tuikov@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Kent Russell <kent.russell@amd.com>
Subject: [linux-next:master 7444/14039]
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c:67 is_fru_eeprom_supported()
 error: we previously assumed 'fru_addr' could be null (see line 51)
Message-ID: <202212102141.Lq9OyJzg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221212071526.2WUqIpYiWndEtcPFHQAQCqD4nuQCfCiYKYu6a6BSLGI@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f925116b24c0c42dc6d5ab5111c55fd7f74e8dc7
commit: afbe5d1e4bd7c798bf5ea53f79ce7f9e59f60301 [7444/14039] drm/amdgpu: Bug-fix: Reading I2C FRU data on newer ASICs
config: ia64-randconfig-m041-20221207
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c:67 is_fru_eeprom_supported() error: we previously assumed 'fru_addr' could be null (see line 51)

vim +/fru_addr +67 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c

afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  35  static bool is_fru_eeprom_supported(struct amdgpu_device *adev, u32 *fru_addr)
fabe01d7bbda15 John Clements 2020-03-23  36  {
f94582e4bc4f73 Kent Russell  2020-09-28  37  	/* Only server cards have the FRU EEPROM
f94582e4bc4f73 Kent Russell  2020-09-28  38  	 * TODO: See if we can figure this out dynamically instead of
f94582e4bc4f73 Kent Russell  2020-09-28  39  	 * having to parse VBIOS versions.
f94582e4bc4f73 Kent Russell  2020-09-28  40  	 */
f94582e4bc4f73 Kent Russell  2020-09-28  41  	struct atom_context *atom_ctx = adev->mode_info.atom_context;
f94582e4bc4f73 Kent Russell  2020-09-28  42  
901abf367d3eec shaoyunl      2022-01-20  43  	/* The i2c access is blocked on VF
901abf367d3eec shaoyunl      2022-01-20  44  	 * TODO: Need other way to get the info
901abf367d3eec shaoyunl      2022-01-20  45  	 */
901abf367d3eec shaoyunl      2022-01-20  46  	if (amdgpu_sriov_vf(adev))
901abf367d3eec shaoyunl      2022-01-20  47  		return false;
901abf367d3eec shaoyunl      2022-01-20  48  
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  49  	/* The default I2C EEPROM address of the FRU.
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  50  	 */
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14 @51  	if (fru_addr)
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  52  		*fru_addr = FRU_EEPROM_MADDR_8;

fru_addr checked for NULL here.

afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  53  
3ed893396b0132 Luben Tuikov  2022-01-27  54  	/* VBIOS is of the format ###-DXXXYYYY-##. For SKU identification,
f94582e4bc4f73 Kent Russell  2020-09-28  55  	 * we can use just the "DXXX" portion. If there were more models, we
f94582e4bc4f73 Kent Russell  2020-09-28  56  	 * could convert the 3 characters to a hex integer and use a switch
f94582e4bc4f73 Kent Russell  2020-09-28  57  	 * for ease/speed/readability. For now, 2 string comparisons are
f94582e4bc4f73 Kent Russell  2020-09-28  58  	 * reasonable and not too expensive
1ea2b260eb6306 Kent Russell  2020-04-03  59  	 */
f94582e4bc4f73 Kent Russell  2020-09-28  60  	switch (adev->asic_type) {
f94582e4bc4f73 Kent Russell  2020-09-28  61  	case CHIP_VEGA20:
f94582e4bc4f73 Kent Russell  2020-09-28  62  		/* D161 and D163 are the VG20 server SKUs */
f94582e4bc4f73 Kent Russell  2020-09-28  63  		if (strnstr(atom_ctx->vbios_version, "D161",
f94582e4bc4f73 Kent Russell  2020-09-28  64  			    sizeof(atom_ctx->vbios_version)) ||
f94582e4bc4f73 Kent Russell  2020-09-28  65  		    strnstr(atom_ctx->vbios_version, "D163",
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  66  			    sizeof(atom_ctx->vbios_version))) {
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14 @67  			*fru_addr = FRU_EEPROM_MADDR_6;

Unchecked here.

1ea2b260eb6306 Kent Russell  2020-04-03  68  			return true;
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  69  		} else {
fabe01d7bbda15 John Clements 2020-03-23  70  			return false;
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  71  		}
67416bf85345b6 Kent Russell  2021-12-13  72  	case CHIP_ALDEBARAN:
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  73  		/* All Aldebaran SKUs have an FRU */
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  74  		if (!strnstr(atom_ctx->vbios_version, "D673",
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  75  			     sizeof(atom_ctx->vbios_version)))
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  76  			if (fru_addr)
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  77  				*fru_addr = FRU_EEPROM_MADDR_6;

Checked here.

67416bf85345b6 Kent Russell  2021-12-13  78  		return true;
3ed893396b0132 Luben Tuikov  2022-01-27  79  	case CHIP_SIENNA_CICHLID:
3ed893396b0132 Luben Tuikov  2022-01-27  80  		if (strnstr(atom_ctx->vbios_version, "D603",
c8fea9273fd1be Guchun Chen   2022-08-24  81  			    sizeof(atom_ctx->vbios_version))) {
c8fea9273fd1be Guchun Chen   2022-08-24  82  			if (strnstr(atom_ctx->vbios_version, "D603GLXE",
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  83  				    sizeof(atom_ctx->vbios_version))) {
c8fea9273fd1be Guchun Chen   2022-08-24  84  				return false;
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  85  			} else {
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  86  				*fru_addr = FRU_EEPROM_MADDR_6;

Unchecked here.

c8fea9273fd1be Guchun Chen   2022-08-24  87  				return true;
afbe5d1e4bd7c7 Luben Tuikov  2022-11-14  88  			}
c8fea9273fd1be Guchun Chen   2022-08-24  89  		} else {
3ed893396b0132 Luben Tuikov  2022-01-27  90  			return false;
c8fea9273fd1be Guchun Chen   2022-08-24  91  		}
f94582e4bc4f73 Kent Russell  2020-09-28  92  	default:
f94582e4bc4f73 Kent Russell  2020-09-28  93  		return false;
f94582e4bc4f73 Kent Russell  2020-09-28  94  	}
fabe01d7bbda15 John Clements 2020-03-23  95  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

