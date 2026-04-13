Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A510E397E81
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 07:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066306; cv=none; b=VYOayAcNT28q1TYDRIOkxNWsqoXPj8IjhbchUl21dC6Vl1pWIys99P8PUdK/3lWfp2JbOBUybzxsxcRIuZ5EV9OszjPTe/EZ1Cmgxx5DWky7GBERbsv9Y8p3+r7HiC6l51/BGVpaxfcocboaZaCyegj1+Cufs/pAYlhLZdAfoBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066306; c=relaxed/simple;
	bh=EhoLnscEdSif09V3BiZD5njhQLHP3bClGuHIqwupXKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bK9t4Euw08jjCZYx4AAJdl9KRADdg/MIRASyLtIg+k8DD6BTuKnGbbGfSezTsT/IHOf/5w3DUeeMUoXDWMs/vI5XknsnEYtL+hpuI1uQCX29dNOhItel/vv7NtTTmtr1VJ1XH0Jo3YK/8LBSsPM6dY667JD3FH9Hy//6jfX8V38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pnYCDMFO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pnYCDMFO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso42979455e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 00:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066303; x=1776671103; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IFBTnsUYXqhDI5NnHFE73UwnXCIbelAw1exwYRkRb5Q=;
        b=pnYCDMFORNwhSHv1keUEfipkMRt7SDdLE5z1fW5Vx0hsbzzHkV5vE3YVs9X1N4Rtq7
         3KmmF9g8BNnMEsb0c9exi7T0P9DjOqzrjwaDDJEpFUeCckywdZ6x8izzNVS2/+ZTSRLb
         NKzRJZjwajQQ2eW0+cmVYKptVCGIg9dRZ0WPbNL335uiFQekhkNegpw543uOI/QVkfqk
         DNG0N1kjgJZKRgduh0RrYiPNOwTeF3sXpATogWy3TiQNikAM58XgMALRrKRR9YFzedcb
         3odI0hKQ1q8JhW/U361dYkcH47TR9Do8/ihbjYvJ+SE4dRK1+I4NzCCWTVfzcrEAFQMk
         s6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066303; x=1776671103;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFBTnsUYXqhDI5NnHFE73UwnXCIbelAw1exwYRkRb5Q=;
        b=mhYnZ28jFAIqEUmsGH/kkOY1NjDPje/9aOwV5MqjQPWQtYLo4k/NYJZC64M0XeEtN/
         BJH+DHr31qMDHmRlnS/yEiQPo1JAobjFYYi35QoF3oA9pxcw3WsUzZVc/IXW1Vj8pafc
         BeP9SDkyzRP1FcEFSuuyQlX5MTn4E1cJ4JMKIXYnwi2110U8Ayyxw1SKs2ZU8dg4HNyv
         ibYwnqzi3cKSwgdWLt9yKvaq1nOHFZpTPpW9rfGtWsrk6IfX8EiLIth5M6AhthCxlQ8j
         MtcAXp0tA5i2jc7OlNuT2qkENfk9wqEghVgZCeFgF+aQ+x+XuZX7oTASj+Cm6+9/1h6D
         Wozw==
X-Gm-Message-State: AOJu0Yzp+/inig2EsbhiA+oLZ6A4hE1v2a728QT60sf9+GAk7V/6adPI
	2lwZa/3+kbXlpcyByLnHoyOQdjodKE+3XXNHz+a9+2iCskK+DhDWXFxBlWAWYSgw
X-Gm-Gg: AeBDiev3X5pKfu5ng3Vmi3mEKNWJ3jJQNv1KmthGhxbN5MpkBZKr83qHmvoORWAoWj8
	tehJVjC1ypPmA0Mg0SwZWkXEtGfOpLdopOgMU+klT7ELZg6R/hcA86z8X/37UHDU2q2/wY4OtRi
	HzPGJyQaJquL88iVbMJhO/uspeQQIdCqpiK7GD5aaLQxPkAzy59FkeusT4hVtlaV7GJdvMhNTI+
	Rk32IlImtvyDb/odg7zLg/HBJtv/Hfveqa+zFv9g+dQLl67ljZB4wzgtPiPtlfOlNlKOZVf/Em8
	QZ4C3X6PSjQ0fIVf4ulzZlX6MdB5euOOJ/7RmEQSVd/1dPikhPWMX59oQiIG7OHoynMu0EWQpDZ
	tQx8uVfBa7fp6R+PnZGJLdZmhBwSYJFx9j51QLIihCYmcCRjK/3iiAl4Pqzj6iuCZCMmmfWCUHH
	x2/MRxRa2p7kcEO2NpI08=
X-Received: by 2002:a05:600d:d:b0:488:ba5f:984f with SMTP id 5b1f17b1804b1-488d67b8dadmr129963085e9.6.1776066302392;
        Mon, 13 Apr 2026 00:45:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67b4903sm114545315e9.5.2026.04.13.00.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:45:01 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:44:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Haren Myneni <haren@linux.ibm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: arch/powerpc/platforms/pseries/papr-hvpipe.c:214
 hvpipe_rtas_recv_msg() warn: maybe return -EFAULT instead of the bytes
 remaining?
Message-ID: <202604121903.MkgWjl8q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260413074458.E7Mu7uqG6-7c2V-9ksIebJzutk1ktNAyIvVDcqV5-PQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f5459048c38a00fc583658d6dcd0f894aff6df8f
commit: cebdb522fd3edd1fe05f7b4a74a27da7dd0f8d86 powerpc/pseries: Receive payload with ibm,receive-hvpipe-msg RTAS
config: powerpc64-randconfig-r071-20260412 (https://download.01.org/0day-ci/archive/20260412/202604121903.MkgWjl8q-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cebdb522fd3e ("powerpc/pseries: Receive payload with ibm,receive-hvpipe-msg RTAS")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604121903.MkgWjl8q-lkp@intel.com/

New smatch warnings:
arch/powerpc/platforms/pseries/papr-hvpipe.c:214 hvpipe_rtas_recv_msg() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
arch/powerpc/platforms/pseries/papr-hvpipe.c:360 papr_hvpipe_handle_read() warn: maybe return -EFAULT instead of the bytes remaining?

vim +214 arch/powerpc/platforms/pseries/papr-hvpipe.c

cebdb522fd3edd Haren Myneni 2025-09-09  174  static int hvpipe_rtas_recv_msg(char __user *buf, int size)
cebdb522fd3edd Haren Myneni 2025-09-09  175  {
cebdb522fd3edd Haren Myneni 2025-09-09  176  	struct rtas_work_area *work_area;
cebdb522fd3edd Haren Myneni 2025-09-09  177  	u32 srcID, bytes_written;
cebdb522fd3edd Haren Myneni 2025-09-09  178  	int ret;
cebdb522fd3edd Haren Myneni 2025-09-09  179  
cebdb522fd3edd Haren Myneni 2025-09-09  180  	work_area = rtas_work_area_alloc(SZ_4K);
cebdb522fd3edd Haren Myneni 2025-09-09  181  	if (!work_area) {
cebdb522fd3edd Haren Myneni 2025-09-09  182  		pr_err("Could not allocate RTAS buffer for recv pipe\n");
cebdb522fd3edd Haren Myneni 2025-09-09  183  		return -ENOMEM;
cebdb522fd3edd Haren Myneni 2025-09-09  184  	}
cebdb522fd3edd Haren Myneni 2025-09-09  185  
cebdb522fd3edd Haren Myneni 2025-09-09  186  	ret = rtas_ibm_receive_hvpipe_msg(work_area, &srcID,
cebdb522fd3edd Haren Myneni 2025-09-09  187  					&bytes_written);
cebdb522fd3edd Haren Myneni 2025-09-09  188  	if (!ret) {

Flip this around.  Always do error handling, not success handling.
Otherwise imagine if we have 9 successful calls in a row, that would be
10 tabs so we would be beyond the end of the 80 character limit.

	if (ret) {
		pr_err("ibm,receive-hvpipe-msg failed with %d\n", ret);
		goto free_work_area;
	}

cebdb522fd3edd Haren Myneni 2025-09-09  189  		/*
cebdb522fd3edd Haren Myneni 2025-09-09  190  		 * Recv HVPIPE RTAS is successful.
cebdb522fd3edd Haren Myneni 2025-09-09  191  		 * When releasing FD or no one is waiting on the
cebdb522fd3edd Haren Myneni 2025-09-09  192  		 * specific source, issue recv HVPIPE RTAS call
cebdb522fd3edd Haren Myneni 2025-09-09  193  		 * so that pipe is not blocked - this func is called
cebdb522fd3edd Haren Myneni 2025-09-09  194  		 * with NULL buf.
cebdb522fd3edd Haren Myneni 2025-09-09  195  		 */
cebdb522fd3edd Haren Myneni 2025-09-09  196  		if (buf) {

	if (!buf) {
		/* blah blah blah explanation */
		ret = 0;
		goto free_work_area;
	}

cebdb522fd3edd Haren Myneni 2025-09-09  197  			if (size < bytes_written) {
cebdb522fd3edd Haren Myneni 2025-09-09  198  				pr_err("Received the payload size = %d, but the buffer size = %d\n",
cebdb522fd3edd Haren Myneni 2025-09-09  199  					bytes_written, size);
cebdb522fd3edd Haren Myneni 2025-09-09  200  				bytes_written = size;
cebdb522fd3edd Haren Myneni 2025-09-09  201  			}
cebdb522fd3edd Haren Myneni 2025-09-09  202  			ret = copy_to_user(buf,
cebdb522fd3edd Haren Myneni 2025-09-09  203  					rtas_work_area_raw_buf(work_area),
cebdb522fd3edd Haren Myneni 2025-09-09  204  					bytes_written);
cebdb522fd3edd Haren Myneni 2025-09-09  205  			if (!ret)
cebdb522fd3edd Haren Myneni 2025-09-09  206  				ret = bytes_written;

Heh.  Now ret either holds the number of bytes_written or the number of
bytes not written and we have no idea which it is.

	if (copy_to_user(buf, rtas_work_area_raw_buf(work_area),
			 bytes_written))
		ret = -EFAULT;
	else
		ret = bytes_written;

cebdb522fd3edd Haren Myneni 2025-09-09  207  		}
cebdb522fd3edd Haren Myneni 2025-09-09  208  	} else {
cebdb522fd3edd Haren Myneni 2025-09-09  209  		pr_err("ibm,receive-hvpipe-msg failed with %d\n",
cebdb522fd3edd Haren Myneni 2025-09-09  210  				ret);
cebdb522fd3edd Haren Myneni 2025-09-09  211  	}
cebdb522fd3edd Haren Myneni 2025-09-09  212  
cebdb522fd3edd Haren Myneni 2025-09-09  213  	rtas_work_area_free(work_area);
cebdb522fd3edd Haren Myneni 2025-09-09 @214  	return ret;
cebdb522fd3edd Haren Myneni 2025-09-09  215  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

