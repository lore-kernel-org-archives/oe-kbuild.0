Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06505FBEA
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jan 2024 06:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705905884; cv=none; b=OQKzGIDjHr4Qw3dRUbRWS3DiJesUUIrNjPbDgiqroFvHxAwkSjjgV1vNkbFhxTYU1a/Tzp/SpcqFOAj22YUStqIv7V8xueoOSJoLCaLQepUOdYScFESV86s54z+mU2BL51LVWF30lBlhCiD1w7/p2JseXt8SsJe7SVf+8uy5V9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705905884; c=relaxed/simple;
	bh=rqfbJaTavukHqNcWA/aI44nUtPbzn4mQR4BhbHCOIpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SxHhm7MR4omD2ooXE98vbnCdk1T1CM+pKJ4MJjAH4rGfiiEgA9p7N4oBYKY+8JmX5R0ofd2YQlYgnyA55W/I9o3amsRepa+gRgu+2TokHLHXu4AFm/frPS+SMOn3tBifT8HmOUg0SwLI+pY8fBtedevhTK6pvPv1fe8vOpgDBrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hYqS3nLX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hYqS3nLX"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-337b8da1f49so2575565f8f.0
        for <oe-kbuild@lists.linux.dev>; Sun, 21 Jan 2024 22:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705905881; x=1706510681; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G5xHkIHav/DyHDr3s4AUIxAaw4nqa+rIE0HQuqV2AoY=;
        b=hYqS3nLX6zsfvTmuMRe1X0n/flxpcbMa2JG2kJ0EZi1ogWFx6xGBrvB/4hrAGfG8sp
         tj3S9IGjql7p5Vjh18SxFK6qrQcd5RvALGBsraatLVEQPLdYMgaZu68doho6irBx0pJC
         nUpHEx+UfaOGgKyYhvJ0CzEtZUn4O7K1laxcwyi+g+ZftemA2AOpRwSSaCKe59iEx/aq
         kPW3zIsBl3BeQzpFsp+cr/ltHZ1R29K/MmIzwk59NUyG+bTp6TC4weGdk4oAncOXHvqQ
         Fzs4gchi9wi14wEz/VYMBajU6vnPhktMLQV6RspXbCabqEBl4JRtyDVERaP7l6GwV3sm
         nLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705905881; x=1706510681;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5xHkIHav/DyHDr3s4AUIxAaw4nqa+rIE0HQuqV2AoY=;
        b=ZuXzO9rW+9PKjluswIMBuaUoVxpzOF9oB2KpAkYetSD5ySzzL1qJAmy0njFWDDVrLy
         B056YnpisE7X9mIQvNvMo+f045whTMR5R44RoYuKD1/5XZ8ZU/oSKs7+qqae8GsLkFwd
         Ur4DpYjMAzpWXuG61RD7witm9CzKqoyen1h4c0GCAD3iNCh0C4yOcqRcm+6dShZ6Mhz9
         l42njzu2hgBY8gXUC6DFoYu5BiEwjA9g+MPLSVvuNdhhtObH2xVbHwq6AnebMmK0xRqO
         HxS18ononxFL+FtmM+7C7+xJtMi1vCGfQFPeOuA8ep4ANQRVTA8Xkf/3F1+lNmzf01pc
         +Qhw==
X-Gm-Message-State: AOJu0YxfOBOKAZ3uQsOuoka5EvMruEhsBmme/aBltnuAQyuEYyqTje0f
	mHHGZ/LKzPr9nxWiVUp8jJMjqeonNFDOHwrf3ENtOXB8iXJVdu2hTYy4it1NcVOCCEgHMCkmX/g
	MdVw=
X-Google-Smtp-Source: AGHT+IG67cw43mThfXEsC9o9+iXpXAmakGy90SkFFf1P6ebKwfwMmhLzILumIpwFFYr7EL1DHjc5bA==
X-Received: by 2002:a05:6000:18a2:b0:339:3814:c7ce with SMTP id b2-20020a05600018a200b003393814c7cemr334880wri.178.1705905880957;
        Sun, 21 Jan 2024 22:44:40 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id p17-20020adfcc91000000b003377680c55bsm8302984wrj.16.2024.01.21.22.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 22:44:40 -0800 (PST)
Date: Mon, 22 Jan 2024 09:44:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Wenjie Qi <qwjhust@gmail.com>,
	jaegeuk@kernel.org, chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, hustqwj@hust.edu.cn,
	Wenjie Qi <qwjhust@gmail.com>
Subject: Re: [PATCH v2] f2fs: fix zoned block device information
 initialization
Message-ID: <397e7ad5-5c49-474a-b32e-ac1d24289862@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240116140513.1222-1-qwjhust@gmail.com>

Hi Wenjie,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenjie-Qi/f2fs-fix-zoned-block-device-information-initialization/20240116-220824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20240116140513.1222-1-qwjhust%40gmail.com
patch subject: [PATCH v2] f2fs: fix zoned block device information initialization
config: x86_64-randconfig-161-20240119 (https://download.01.org/0day-ci/archive/20240120/202401201237.ovVyEKvs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202401201237.ovVyEKvs-lkp@intel.com/

New smatch warnings:
fs/f2fs/super.c:2393 f2fs_remount() warn: missing error code 'err'

Old smatch warnings:
fs/f2fs/super.c:4040 read_raw_super_block() warn: possible memory leak of 'super'

vim +/err +2393 fs/f2fs/super.c

4b2414d04e9912 Chao Yu        2017-08-08  2371  
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2372  	/* recover superblocks we couldn't write due to previous RO mount */
1751e8a6cb935e Linus Torvalds 2017-11-27  2373  	if (!(*flags & SB_RDONLY) && is_sbi_flag_set(sbi, SBI_NEED_SB_WRITE)) {
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2374  		err = f2fs_commit_super(sbi, false);
dcbb4c10e6d969 Joe Perches    2019-06-18  2375  		f2fs_info(sbi, "Try to recover all the superblocks, ret: %d",
dcbb4c10e6d969 Joe Perches    2019-06-18  2376  			  err);
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2377  		if (!err)
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2378  			clear_sbi_flag(sbi, SBI_NEED_SB_WRITE);
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2379  	}
df728b0f6954c3 Jaegeuk Kim    2016-03-23  2380  
458c15dfbce62c Chao Yu        2023-05-23  2381  	default_options(sbi, true);
26666c8a4366de Chao Yu        2014-09-15  2382  
696c018c7718f5 Namjae Jeon    2013-06-16  2383  	/* parse mount options */
ed318a6cc0b620 Eric Biggers   2020-05-12  2384  	err = parse_options(sb, data, true);
696c018c7718f5 Namjae Jeon    2013-06-16  2385  	if (err)
696c018c7718f5 Namjae Jeon    2013-06-16  2386  		goto restore_opts;
696c018c7718f5 Namjae Jeon    2013-06-16  2387  
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2388  #ifdef CONFIG_BLK_DEV_ZONED
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2389  	if (sbi->max_active_zones && sbi->max_active_zones < F2FS_OPTION(sbi).active_logs) {
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2390  		f2fs_err(sbi,
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2391  			"zoned: max active zones %u is too small, need at least %u active zones",
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2392  				 sbi->max_active_zones, F2FS_OPTION(sbi).active_logs);
ed7a1efe8afd55 Wenjie Qi      2024-01-16 @2393  		goto restore_opts;

err = -EINVAL?

ed7a1efe8afd55 Wenjie Qi      2024-01-16  2394  	}
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2395  #endif
ed7a1efe8afd55 Wenjie Qi      2024-01-16  2396  
b62e71be2110d8 Chao Yu        2023-04-23  2397  	/* flush outstanding errors before changing fs state */
b62e71be2110d8 Chao Yu        2023-04-23  2398  	flush_work(&sbi->s_error_work);
b62e71be2110d8 Chao Yu        2023-04-23  2399  
696c018c7718f5 Namjae Jeon    2013-06-16  2400  	/*
696c018c7718f5 Namjae Jeon    2013-06-16  2401  	 * Previous and new state of filesystem is RO,
876dc59eb1f013 Gu Zheng       2014-04-11  2402  	 * so skip checking GC and FLUSH_MERGE conditions.
696c018c7718f5 Namjae Jeon    2013-06-16  2403  	 */
1751e8a6cb935e Linus Torvalds 2017-11-27  2404  	if (f2fs_readonly(sb) && (*flags & SB_RDONLY))
696c018c7718f5 Namjae Jeon    2013-06-16  2405  		goto skip;
696c018c7718f5 Namjae Jeon    2013-06-16  2406  
d78dfefcde9d31 Chao Yu        2023-04-04  2407  	if (f2fs_dev_is_readonly(sbi) && !(*flags & SB_RDONLY)) {
a7d9fe3c338870 Jaegeuk Kim    2021-05-21  2408  		err = -EROFS;
a7d9fe3c338870 Jaegeuk Kim    2021-05-21  2409  		goto restore_opts;
a7d9fe3c338870 Jaegeuk Kim    2021-05-21  2410  	}
a7d9fe3c338870 Jaegeuk Kim    2021-05-21  2411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

