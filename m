Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBFE29E0ED
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Aug 2025 06:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754894694; cv=none; b=JU7G7JHexEZbQmnWR70696fB5KkGkofrDLf4uAmIEEIZrG58p0BQpMwzOP6ZyhPmvBFybkkiEC1ofVddjcMNGFPq3zke7Ffd4RfGXPP7T1zRYyxOFdFmMFtwD591/kmTgowtEN2TzXohB7EFlpsfljO4kG32wGO3OoT5wWqNTdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754894694; c=relaxed/simple;
	bh=7kIyHm3ycPuG2bNrjYRzZ1oN8R/OB4JGUGBpwgvDkA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Wjll1alQmNAWxYIAaRXInr/nLC0CTwigHq+hA0tRoGzRvlxHJFN1MHYVYB+wexa4kWRW9DHW0BLO7IGq9Lt5Z7mMlLUJDtkZrPoPHWy0eiuYuSjiDINyqhboxdsBwyi3nzw8LpyNCyQex/DM9FBySe7/lb7a9oQYMgZxz+fsOXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V1BXWpBs; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V1BXWpBs"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b783ea5014so2070591f8f.0
        for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 23:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754894690; x=1755499490; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fZcBQa+R8YkEhAHCj4vRCxBH8Jc3hxrLrNZ+LWWKYcs=;
        b=V1BXWpBsiv9XQsazi1QkOkzBGk04Wbg/u7beBYArhNYZgAMQcc3np5oeKB7UQqGfw2
         29EtLfktpFOLF50HW3jLvxrzaWQSbsZKy2385FTelaaCutXGtMPTWj5QZUx11fIUzTUq
         WEvyl1vgLB1WPr4YQdf8hsuOK5yF2uiev+wc5LgFu+itA9aRw3ntWp48F9K4Cuc26vNQ
         DQ5wLqbpO1Fv2VxGdj4Zg03uxMXJ9lbDReaMXD3tPZjzeSSrPsnFYJ1kgU+zk6XKCSG4
         /VUNteHz78IAMV3AJ4I46ZUxGpu0mhTy7enUA2jEJd/qJHEFtc+/uAF4Bqb2kQLQL/gF
         8gkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754894690; x=1755499490;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZcBQa+R8YkEhAHCj4vRCxBH8Jc3hxrLrNZ+LWWKYcs=;
        b=aI/Xe18MjPnXCUIwamIAb3CspVcGRuih+0g/16S2hGfQIF+loKX8XHJg/A6nJn7itK
         HNPfDkU7L/E1BMSQfyJigis/l8lKfI7Cx8pkepsY1474f7ThPIsk85fn1bVXl5+/P+D2
         eMQZXl6H19sUzwd4CMLfyXcsrwliWHXRLeUVJmRwaho61ZwszqlCnofwRqfK1mF23aSM
         FFCM11HYGtTG0LhT1ca2kE4Q3gu5KhZ/hVqrNEmL8mebPqDBUCTZvdb36mQsn8Ysr4A9
         hsGMwlWLafHA/Ffji0OOm2GsHf4cVQTMyM/NdULzhIJKfv37noB4vGcbStX6Q8txty+l
         R6vQ==
X-Gm-Message-State: AOJu0Yw3QIq691zXT84RyMqf/7wiOA5kQDCoQQGgk6VHKiMMZbaRYri3
	8+L3sne4KmKK499xxXYHqL/DSt8r/dEII1MnDCl3TKjQMPt/v1UMHBESObnIeF2tQ/4xOGX+dEc
	V6Poe
X-Gm-Gg: ASbGncvQ5rP3Pvan/UAs0X6F1GTnHtEjkpe2miVRm771s/kN2voQTC/Btffz1qiGzC6
	XN5S1ie8F4GH09+ECxFvTQqpuK+FZC5s8BPt1nHfRCOqzpnhah5H6Rzdaeh+obMP5Gp/g4jnydh
	doBOW8hkUUHrjJFGQ4VouNf/bQTsivcbNPnbHeZGFkzUXI6L1Gq2L7lpxwnaQDX8IfixSvZKDIP
	xB2azedrHgYUfTqYPpocfA+hM5Zhbv7GNPVvWVuxSS4uEKMsyCGWIvWZIqm4s6tRDNDjNoZ1qok
	SxxEq6zUrI4D8TT4ELz/VTAcM2avxW37acT4N3yCcRt9KCyXSoxG6DzjIXLllsgh8KSVzKWMfj2
	CGCF+j4sqcnNX/3Qm/kpw27fgrW09+F21
X-Google-Smtp-Source: AGHT+IGQ97PWWN8i6rks22T0ROMqYjiWyzFQh1ABqQuYfuq3vlH80S/7fcfwj183qBQeOoLh/RfHWw==
X-Received: by 2002:a05:6000:22c8:b0:3b7:8154:aa36 with SMTP id ffacd0b85a97d-3b90092ba41mr9504145f8f.7.1754894690121;
        Sun, 10 Aug 2025 23:44:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b8e0846777sm29635596f8f.48.2025.08.10.23.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 23:44:49 -0700 (PDT)
Date: Mon, 11 Aug 2025 09:44:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dmitry Antipov <dmantipov@yandex.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Chi Zhiling <chizhiling@kylinos.cn>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+db4326df1b9af04f68fc@syzkaller.appspotmail.com
Subject: Re: [PATCH 2/2] media: xc2028: hold the device if firmware loading
 is in progress
Message-ID: <202508090831.5eRXcWv2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806075409.210489-2-dmantipov@yandex.ru>
Message-ID: <20250811064416.Fwnj2SC4dNLqz245cFKvVVCGlU4tDJ7nsxcvi56QiaM@z>

Hi Dmitry,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Antipov/media-xc2028-hold-the-device-if-firmware-loading-is-in-progress/20250806-160542
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250806075409.210489-2-dmantipov%40yandex.ru
patch subject: [PATCH 2/2] media: xc2028: hold the device if firmware loading is in progress
config: sparc-randconfig-r073-20250809 (https://download.01.org/0day-ci/archive/20250809/202508090831.5eRXcWv2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508090831.5eRXcWv2-lkp@intel.com/

smatch warnings:
drivers/media/tuners/xc2028.c:1342 xc2028_dvb_release() warn: variable dereferenced before check 'priv' (see line 1335)

vim +/priv +1342 drivers/media/tuners/xc2028.c

194ced7a5a99b30 drivers/media/tuners/tuner-xc2028.c        Max Kellermann        2016-08-09  1326  static void xc2028_dvb_release(struct dvb_frontend *fe)
701672eb7387390 drivers/media/video/tuner-xc2028.c         Michel Ludwig         2007-07-18  1327  {
215b95baf969c6f drivers/media/video/tuner-xc2028.c         Mauro Carvalho Chehab 2007-10-23  1328  	struct xc2028_data *priv = fe->tuner_priv;
701672eb7387390 drivers/media/video/tuner-xc2028.c         Michel Ludwig         2007-07-18  1329  
7e28adb2497f6b8 drivers/media/video/tuner-xc2028.c         Harvey Harrison       2008-04-08  1330  	tuner_dbg("%s called\n", __func__);
701672eb7387390 drivers/media/video/tuner-xc2028.c         Michel Ludwig         2007-07-18  1331  
aa501be989f5df5 drivers/media/video/tuner-xc2028.c         Chris Pascoe          2007-11-19  1332  	mutex_lock(&xc2028_list_mutex);
aa501be989f5df5 drivers/media/video/tuner-xc2028.c         Chris Pascoe          2007-11-19  1333  
01c647c99112a50 drivers/media/tuners/xc2028.c              Dmitry Antipov        2025-08-06  1334  	/* wait for request_firmware_nowait() if scheduled */
01c647c99112a50 drivers/media/tuners/xc2028.c              Dmitry Antipov        2025-08-06 @1335  	if (priv->state == XC2028_WAITING_FIRMWARE)
                                                                                                            ^^^^^^^^^^^
priv can be NULL when this is called from xc2028_attach().


01c647c99112a50 drivers/media/tuners/xc2028.c              Dmitry Antipov        2025-08-06  1336  		wait_for_completion(&priv->fwload);
01c647c99112a50 drivers/media/tuners/xc2028.c              Dmitry Antipov        2025-08-06  1337  
c663d03590a882f drivers/media/common/tuners/tuner-xc2028.c Michael Krufky        2008-04-18  1338  	/* only perform final cleanup if this is the last instance */
22a1e7783e173ab drivers/media/tuners/tuner-xc2028.c        Takashi Iwai          2016-11-17  1339  	if (hybrid_tuner_report_instance_count(priv) == 1)
de3fe21ba2fdc07 drivers/media/video/tuner-xc2028.c         Mauro Carvalho Chehab 2007-10-24  1340  		free_firmware(priv);
701672eb7387390 drivers/media/video/tuner-xc2028.c         Michel Ludwig         2007-07-18  1341  
c663d03590a882f drivers/media/common/tuners/tuner-xc2028.c Michael Krufky        2008-04-18 @1342  	if (priv)
                                                                                                            ^^^^
Checked too late.

c663d03590a882f drivers/media/common/tuners/tuner-xc2028.c Michael Krufky        2008-04-18  1343  		hybrid_tuner_release_state(priv);
c663d03590a882f drivers/media/common/tuners/tuner-xc2028.c Michael Krufky        2008-04-18  1344  
aa501be989f5df5 drivers/media/video/tuner-xc2028.c         Chris Pascoe          2007-11-19  1345  	mutex_unlock(&xc2028_list_mutex);
aa501be989f5df5 drivers/media/video/tuner-xc2028.c         Chris Pascoe          2007-11-19  1346  
c663d03590a882f drivers/media/common/tuners/tuner-xc2028.c Michael Krufky        2008-04-18  1347  	fe->tuner_priv = NULL;
701672eb7387390 drivers/media/video/tuner-xc2028.c         Michel Ludwig         2007-07-18  1348  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

