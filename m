Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D4D73477
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 09:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782024; cv=none; b=JS4fCiTmacXTkBsBGdHDwpglIGUaMIe/C6emA4cFD2aZAzMJhbFQo4YqnQb/yjzh6eU+S2Mi0K6D3ghZmRmv1Ra3fM6eDoeaCgrhpAoz8GbtdBp3cn2fpt7evHS/TOKpIR8rTsbEPzJwHqUCOVZK02VQR9iQc1DbJGdeoazEx0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782024; c=relaxed/simple;
	bh=RSC0Sgyw8HT/RCfrByLtIWId5ZOUmzu8FkI+S3Ou5IU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jdDzqFCWdKHFvDonU2Yw0wGXU8DnvJJDucQazj6bypXQy0HeC2BSNL9jxEDjKJGcfMOND0O0jIQ66DZQrHc1JkgxZJneJpGRMGKFHFsoiDqf+5dxgF6uYLkUEkON4zTyyKvEZXCG+wE12jQM/60k4RreQHeNf5XVKF+ncs2Zf8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YkpSoHMc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YkpSoHMc"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0be321968so984194f8f.2
        for <oe-kbuild@lists.linux.dev>; Fri, 09 May 2025 02:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746782021; x=1747386821; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ipHg38+rk32+E6lqZLQugC6GWcXHbQnwtyP7WMR9wk=;
        b=YkpSoHMcDqFfxmgh2WIm8eKVYBX8xde8EdQbX4VKbNFf0EjnD5sEwXhBP5JuqJPf8k
         VSk3S2v7zdNYHYjfZAHuwVUSjmMCpEME26khYbPhuRozdz1XTeObibpWfir9oOCGPNsu
         TtxVPD+z/aj/Sl6u7JTILxnZsynuJNTtFbYdNPgQhSKfbBKUektKOf3GZ8ZHDM3+ZpD8
         uDHV317wHqahnh4aSel0ldw+yhT8/jDOQ9WpucGZzMrKnKKoWdDPzxAaqlFIRz804U9c
         afb1HfLRCKLamoVSA+3gh/yQbrSQePXXgaL8DijIkZVZT+TZHvQ2YuoPIW4Tx5Orc8ph
         w49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746782021; x=1747386821;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ipHg38+rk32+E6lqZLQugC6GWcXHbQnwtyP7WMR9wk=;
        b=iibXT8UvkRe70bThS/MgLejSns8nORj7zru3MXD0F1cUMulNuIZ8PDz3Tdn9EHoYou
         cdVQRb51ELYGKkQoGTeEIUk9mr5QzTXFLRXuxHnWuVbokLEJv8zRXgJZQ/yIdVUZ2oc6
         75cnLCwi+3gObmNmaJKMyy59CIi7Z8y374E5cd672lNMKBXY1SOa7wzwrtUqHVIYlgI6
         rzIVfyZLH8mvKRpPB7/HkxONXRPGGybXIsq5VNvHyLN3xCDAqeU5ormEdYom0wcrE2dG
         ej5yIHUjOQVmxvybkLwaUMTI4nWRtqm3nImQvEc66UrKCZAgpWWLeUoRWPsL97MMUymS
         Zlpw==
X-Gm-Message-State: AOJu0Yy52Z8NUlR40XdDhGW0k2ZSv93a/BUvtnkmeaFwulkmLpEhX4Qu
	ojkLIOAqe8lpEYyLGXt627LQLsT8N/g01AGoNJQkvAWSoaOV9MpGJEHBRRfpHAYlreBz+qXQZmb
	t
X-Gm-Gg: ASbGncvJDuR7usyscFo0Sx5kIkXJl0QbeVFylr5x75hUkThY+3UHwlORS8q7siDrfOz
	ih1A8lSoqfRSue+bJlVlOgriGcgt896C8brbn71lv87i1hFNlGMm86Ziboi4Eg8J2cC1C10xBxa
	f4II7gd/qG2TwusN4JDEE048chZvq/as0zAsiRBqEbb4VOdNYNoZGZeSYElSI4Z1EyGhrJaD0Og
	MZSJs890RYUtoYfOHxnkLP5nfDc9HEAel2rV2OjH7DYCOm0ryvO5H4ssYWrTNBvaoIyusOvhV1S
	f7Q7QaoproS7ZCoZwZuzk6SAnwftleYCeYJvgPd5IxF54g==
X-Google-Smtp-Source: AGHT+IEmqGQ0WFYRqxg6Zi5BhZ8msqNSALFUkIH4riLC21Mc+W5RHQBxiyuvRG/VuegHsphKn00xZQ==
X-Received: by 2002:a05:6000:18ae:b0:3a1:fac3:158c with SMTP id ffacd0b85a97d-3a1fac31619mr664746f8f.59.1746782020857;
        Fri, 09 May 2025 02:13:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a4c7b2sm2642318f8f.93.2025.05.09.02.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:13:40 -0700 (PDT)
Date: Fri, 9 May 2025 12:13:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dillon Varone <dillon.varone@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Alvin Lee <alvin.lee2@amd.com>,
	Zaeem Mohamed <zaeem.mohamed@amd.com>
Subject: [agd5f:drm-next 379/514]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:336
 dc_stream_program_cursor_attributes() error: we previously assumed 'stream'
 could be null (see line 334)
Message-ID: <202505091637.9zSZ2WDD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250509091337.E8K5RNK3CJFw20Axx8mYM3QvsW0axlccGqDqGmTmQ7A@z>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   afc6053d4c4b0a6be500b9e643aa17221e93a57b
commit: 19e743f0fb730e4dac43e37bb71d1ebdb622b3cf [379/514] drm/amd/display: Refactor SubVP cursor limiting logic
config: x86_64-randconfig-161-20250430 (https://download.01.org/0day-ci/archive/20250509/202505091637.9zSZ2WDD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505091637.9zSZ2WDD-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:336 dc_stream_program_cursor_attributes() error: we previously assumed 'stream' could be null (see line 334)

vim +/stream +336 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c

f63f86b5affcc2a Harry Wentland      2024-03-15  327  bool dc_stream_program_cursor_attributes(
f63f86b5affcc2a Harry Wentland      2024-03-15  328  	struct dc_stream_state *stream,
f63f86b5affcc2a Harry Wentland      2024-03-15  329  	const struct dc_cursor_attributes *attributes)
f63f86b5affcc2a Harry Wentland      2024-03-15  330  {
f63f86b5affcc2a Harry Wentland      2024-03-15  331  	struct dc  *dc;
f63f86b5affcc2a Harry Wentland      2024-03-15  332  	bool reset_idle_optimizations = false;
f63f86b5affcc2a Harry Wentland      2024-03-15  333  
f63f86b5affcc2a Harry Wentland      2024-03-15 @334  	dc = stream ? stream->ctx->dc : NULL;
                                                             ^^^^^^^^
If stream is NULL

f63f86b5affcc2a Harry Wentland      2024-03-15  335  
f63f86b5affcc2a Harry Wentland      2024-03-15 @336  	if (dc_stream_set_cursor_attributes(stream, attributes)) {
                                                                                            ^^^^^^
Then this will crash.

8457bddc266c754 Charlene Liu        2024-01-11  337  		dc_z10_restore(dc);
4d55b0dd1cdd853 Bhawanpreet Lakha   2020-05-21  338  		/* disable idle optimizations while updating cursor */
4d55b0dd1cdd853 Bhawanpreet Lakha   2020-05-21  339  		if (dc->idle_optimizations_allowed) {
4b675aad9695070 Joshua Aberback     2020-08-31  340  			dc_allow_idle_optimizations(dc, false);
4d55b0dd1cdd853 Bhawanpreet Lakha   2020-05-21  341  			reset_idle_optimizations = true;
4d55b0dd1cdd853 Bhawanpreet Lakha   2020-05-21  342  		}
4d55b0dd1cdd853 Bhawanpreet Lakha   2020-05-21  343  
66eba12a5482b79 Harry Wentland      2024-03-15  344  		program_cursor_attributes(dc, stream);
4fd771ea441ed98 Roy Chan            2021-07-19  345  
4fd771ea441ed98 Roy Chan            2021-07-19  346  		/* re-enable idle optimizations if necessary */
27f03bc680ef7e0 Nicholas Kazlauskas 2024-02-21  347  		if (reset_idle_optimizations && !dc->debug.disable_dmub_reallow_idle)
4fd771ea441ed98 Roy Chan            2021-07-19  348  			dc_allow_idle_optimizations(dc, true);
4fd771ea441ed98 Roy Chan            2021-07-19  349  
4fd771ea441ed98 Roy Chan            2021-07-19  350  		return true;
4fd771ea441ed98 Roy Chan            2021-07-19  351  	}
4fd771ea441ed98 Roy Chan            2021-07-19  352  
f63f86b5affcc2a Harry Wentland      2024-03-15  353  	return false;
f63f86b5affcc2a Harry Wentland      2024-03-15  354  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

