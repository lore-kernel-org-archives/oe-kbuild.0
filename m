Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FCE13D8A6
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jul 2024 19:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721761574; cv=none; b=Lhk5DVT3m6/xzjvJHqNRH9KO0esLOOWwaxr/B8fzyD6g0z9yVIw603Dy4p1VYB2xjHExWvtEhcgDRvuBkZCAqEF0fqUOh1zDfM48+KU2lgGS4dl35sGWdD8hvvknUcNLfxSjWcyodaGVYiCbeODydHy/S1DMJ/YS43b/1c7zn8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721761574; c=relaxed/simple;
	bh=NDNM6wT1Qb0x90f56VW7IWqTeqw8LjOyDvIsTtRuuj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SL1fgfdDz2TyjLNQf+gN34En5xKejH7OHKd3A0heaeF0C1Hfc7Lvldg3WmLLs2gq346xwqY0tXCz4MqTTdCVbFfq+u2B2chKEdGdxeMU670rBsmiPc01gHjXcw5vbyeEFRKcdqvg3o63iy1gpr64hm39mkhYPhXAHzh0knFRUVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ppiNZYTf; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ppiNZYTf"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5ce739c2650so3197783eaf.1
        for <oe-kbuild@lists.linux.dev>; Tue, 23 Jul 2024 12:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721761571; x=1722366371; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+86VtlUVCmljtpKp+rPOXez6QpSLolX4c53iPAG0Nw=;
        b=ppiNZYTf9w63TFtbwnLZ/WEM2Y2tW6LjUGyqI1+HCE/jzPSanozX14vEcNMd5+AwZL
         s2vrRpDBlXlfzXgZz5TJvEOusbb4Hgjd5xCnIhTKe4S9YKFuvVejDH/YuRYmJKW28eRv
         vDYSmMHVa/u/hfH0pjVd20+gStfkZ3gSEJfwLRv4+i2zgt0Z+wckxcVmxTHeK5d4CdEp
         tGI4ZvpKrCWROtrAqGnMlcx1DuAOhzP4/Ju2aM2pISH0G8kZXoYnpNM0j90d9i8NQh9R
         UaMLgaY2r5dlJ8Ywzn98peG9u54dP16MZdysh1X/AenncmWIKF6K4RgEOzrXLXQMN+WY
         C4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721761571; x=1722366371;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+86VtlUVCmljtpKp+rPOXez6QpSLolX4c53iPAG0Nw=;
        b=puGhhwhSb7nf5yZg9sjzY8VdB0AoTMUl2ww/2dcKwvM5Z+wsyIPEe11LYHj3AFors/
         VvNE9/tCxqYJLcfU4e5lxom2CZ2jarCvmrd7Ev0v/YyTk4e9JI8aGh05C5m3jOiY3D7V
         HStauff92DJRI5X0D91gBj/NsdumUywmqHLEYDpxJH8/DW5nSzDI9S6RLKox77/8i7lh
         jW81UwyAbHraRKCWLCyX3u4jI3G1A4PM5eYThLj6d4SiLn+aU9D6gbYknTI0FMRd1dEw
         cZl061Am7oVo/7Jrd0LjKB/Sna1ahWwPvpxXipqZC/4//f+sOFvWW8uBnraj0GPRwu6R
         hQWg==
X-Gm-Message-State: AOJu0Ywhr4ydvBFksB/dwL8wqftfw2GX/L6r/u3RuXslg5w810+WOjXI
	vCbTitFCCeF13007zkNp5SaQItBhfVfJM39t4rDtsS1RMFN932Fs0M4h3Cip2cJtNXiaYGYwI1U
	VDKU=
X-Google-Smtp-Source: AGHT+IF03pQG1mVlnnnHQg7+hLEYB9j0xbyR2EwRX7P/CoLSoX+EX/woiQBVwE12L38j+u7NWqKs4w==
X-Received: by 2002:a4a:ee83:0:b0:5c4:5cbc:b1b5 with SMTP id 006d021491bc7-5d564cfc26dmr14110778eaf.0.1721761571397;
        Tue, 23 Jul 2024 12:06:11 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:eca3:bb93:d28d:1005])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5d59ee0e903sm25950eaf.8.2024.07.23.12.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 12:06:10 -0700 (PDT)
Date: Tue, 23 Jul 2024 14:06:08 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Matthew Brost <matthew.brost@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Matthew Auld <matthew.auld@intel.com>,
	Nirmoy Das <nirmoy.das@intel.com>
Subject: [linux-next:master 13299/13550]
 drivers/gpu/drm/xe/xe_guc_submit.c:1417 guc_exec_queue_process_msg() error:
 dereferencing freed memory 'msg'
Message-ID: <69198958-f351-48f5-8b94-2f0098c1c7b8@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2347b4c79f5e6cd3f4996e80c2d3c15f53006bf5
commit: d930c19fdff3109e97b610fa10943b7602efcabd [13299/13550] drm/xe: Build PM into GuC CT layer
config: i386-randconfig-141-20240722 (https://download.01.org/0day-ci/archive/20240723/202407231445.rpisd1vA-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407231445.rpisd1vA-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_guc_submit.c:1417 guc_exec_queue_process_msg() error: dereferencing freed memory 'msg'

vim +/msg +1417 drivers/gpu/drm/xe/xe_guc_submit.c

9b9529ce379a08 Francois Dugast 2023-07-31  1396  static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
dd08ebf6c3525a Matthew Brost   2023-03-30  1397  {
dd08ebf6c3525a Matthew Brost   2023-03-30  1398  	trace_xe_sched_msg_recv(msg);
dd08ebf6c3525a Matthew Brost   2023-03-30  1399  
dd08ebf6c3525a Matthew Brost   2023-03-30  1400  	switch (msg->opcode) {
dd08ebf6c3525a Matthew Brost   2023-03-30  1401  	case CLEANUP:
9b9529ce379a08 Francois Dugast 2023-07-31  1402  		__guc_exec_queue_process_msg_cleanup(msg);
dd08ebf6c3525a Matthew Brost   2023-03-30  1403  		break;
dd08ebf6c3525a Matthew Brost   2023-03-30  1404  	case SET_SCHED_PROPS:
9b9529ce379a08 Francois Dugast 2023-07-31  1405  		__guc_exec_queue_process_msg_set_sched_props(msg);
                                                                                                             ^^^
Freed

dd08ebf6c3525a Matthew Brost   2023-03-30  1406  		break;
dd08ebf6c3525a Matthew Brost   2023-03-30  1407  	case SUSPEND:
9b9529ce379a08 Francois Dugast 2023-07-31  1408  		__guc_exec_queue_process_msg_suspend(msg);
dd08ebf6c3525a Matthew Brost   2023-03-30  1409  		break;
dd08ebf6c3525a Matthew Brost   2023-03-30  1410  	case RESUME:
9b9529ce379a08 Francois Dugast 2023-07-31  1411  		__guc_exec_queue_process_msg_resume(msg);
dd08ebf6c3525a Matthew Brost   2023-03-30  1412  		break;
dd08ebf6c3525a Matthew Brost   2023-03-30  1413  	default:
99fea682887938 Francois Dugast 2023-07-27  1414  		XE_WARN_ON("Unknown message type");
dd08ebf6c3525a Matthew Brost   2023-03-30  1415  	}
d930c19fdff310 Matthew Brost   2024-07-19  1416  
d930c19fdff310 Matthew Brost   2024-07-19 @1417  	xe_pm_runtime_put(guc_to_xe(exec_queue_to_guc(msg->private_data)));
                                                                                                      ^^^
Use after free

dd08ebf6c3525a Matthew Brost   2023-03-30  1418  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

