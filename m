Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C046B1DE885
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Jul 2025 14:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762750; cv=none; b=lQ1qolk1NrSNnPwETtv4pqFMZA5t8gTYLnaa/o5adC27gPYexfPEMfaE+8my4cZKaOcrRbwtMG9iwlIcyJDc6ftfrLqUNlxqyefi9nmhBIKV7Zu7LqcLpio3d1rcT31tbESfuzKPFNi9xI4BOWmjCC9+6hx78NAEmqxExyyLoQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762750; c=relaxed/simple;
	bh=wEbP6qi+nZF7TDGpD2NX8D4wdG17ufmilIB2hmeWXis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uWRAHTepl/HICwBo2Pq7RBHDbpTr4Zvov5Arwl9sWd5i8Xleb2PI0qBUKRGlg6od/AfuVCvf23Whuwp1sdRvsh4n3DHaAosqGVFdhS6NWeed6/YbecIxOR4TiH5pGcl6rTpBmDmzy/g+tTeXFpfEyLE52PtLV0itxwdH5QnEwBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UPfoqLjd; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UPfoqLjd"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2c6ed7efb1dso709770fac.2
        for <oe-kbuild@lists.linux.dev>; Thu, 17 Jul 2025 07:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752762747; x=1753367547; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tAGitSQnYjvE5arKuWyAVScrSmXNN9wG97tPTtqz150=;
        b=UPfoqLjd4h5aQKaS1qMxkWIm0UqhM/FFklFQ0FQp53duJcdSDe6wJt3rWiAXR5DOCo
         DZ4CgbqsN7jgmBC/t8j5zw3+Fqnzdx3afqYUmhniXWtwi1de3EviXsj9+Cb6x0tQbyeH
         WHxavY3m2UiDzi4qo5494kDDAoAP/XBubBw0ZBXDUSKaKRehMjiFZL/UkPhCZ+yyR+BC
         UD9vDFT58/dKFiP6x2y03+uebyFFt6Tjqb8NBXKdO94xFk8p2qENIdicZNY+qRqqXuUP
         +F/kRy986+20dzrDhJZMvpc1bl/nYCVo8r6bBARrqSAcl54JBv8HKcJ0uydHjrdUHCHg
         rBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762747; x=1753367547;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAGitSQnYjvE5arKuWyAVScrSmXNN9wG97tPTtqz150=;
        b=T6u/YDFWnXew25tDLsbo/H1kycKVB8uV0WGJJGYWmpz674asvBdRXkqp8VCRpOj4b0
         fKYQLTpH/E8hO0zQmujlfAMjZI2LEYsYGgRJiDcxKKvopqBehqWNKB1q6YsXvhSzaKFE
         tSABNbZDBUQgwyl6NaEnDLmRmBaIPMaOapzmM+Z+5WLRNmCAOs4k0IL+aqCQgg2FcmbX
         IKKLk9tNqQ8GGTnqhhzxWsQOQ3CFQUf2TniAtMz46ZxkUDoA1a6gfOgSKGRlXHhU+Xqp
         7DjfYfIXH8BDJXV9JJvOaRI7nJ7mYf4Irl5nzfQvC/Y4PNoolm5VvqvsV2hTb3//j162
         1o8g==
X-Gm-Message-State: AOJu0YyW8dYzhqY2BnBk6YK88tNFFXhqxVWG/03zpGhKNA6LbUP2kQEp
	fZwk4DzBc9u6xDOKZzacsUvzapdnEeZ7cwEYVjOnEU77yqrQ2jyQxMKXUyUkuhCgQultAbf8I9Z
	gi6Km
X-Gm-Gg: ASbGncuO2KEFs6wZydgQ/fAbatz2luR/rTQzFTJmyd8hn4SQTzqXy28I+XqanFYx50X
	IT4SBh4U0SYKa/2WNGq218ldjRQWfzv+JzjcVDmMEDFYqnAVKYWgsQLyeNPio3Z1dKfutqIWUsI
	pxlogNmMM8ZRNtIUsmG/8GWCWJo3Z04yvzoggOV/krnZt79nJcw1hx5q/jTmJayHhPsf0rzMjTw
	rJ4YHUpxuNLoCZAmKucFNMBn1m6yXEQ8P6ONv8CLZzW2I7p5G5R6kYy83f4a0E54VWGRIx6u5nG
	EaisPHVPjzJ1GqxWadhcs0V+4WP5uHu/XchBbHOAFubbCLRQZFDXHqnvp0MdbIFK6yQRWVkTwop
	SxvBMBtlg3qNocdngrLw0of5xFYKs
X-Google-Smtp-Source: AGHT+IFi8qE3e3cHISEmGBhR/Op6SFiLyBeT3vOrIA/qwrfgnDtLiRdX2GVrb5LrLNQyWwd0Ggy3Zg==
X-Received: by 2002:a05:6870:b24f:b0:2bc:716c:4622 with SMTP id 586e51a60fabf-2ffb24e6b25mr5595540fac.38.1752762742352;
        Thu, 17 Jul 2025 07:32:22 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2c38:70d4:43e:b901])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff111c35bfsm4432316fac.1.2025.07.17.07.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:32:21 -0700 (PDT)
Date: Thu, 17 Jul 2025 17:32:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 10097/10441] fs/bcachefs/journal_reclaim.c:877
 journal_flush_done() warn: missing error code? 'ret'
Message-ID: <3008994f-e84d-4763-a4db-9666555ce33f@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e8352908bdcd2d0bcf0aca8c69fae85fd5ea5edb
commit: 0e1d28c378988f28b773807c00e7f3be40f49bf3 [10097/10441] bcachefs: convert journal_reclaim.c to CLASS/guards
config: i386-randconfig-141-20250716 (https://download.01.org/0day-ci/archive/20250717/202507171850.10rxb3uq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507171850.10rxb3uq-lkp@intel.com/

smatch warnings:
fs/bcachefs/journal_reclaim.c:877 journal_flush_done() warn: missing error code? 'ret'

vim +/ret +877 fs/bcachefs/journal_reclaim.c

039fc4c5221f74 Kent Overstreet 2020-05-28  861  static int journal_flush_done(struct journal *j, u64 seq_to_flush,
039fc4c5221f74 Kent Overstreet 2020-05-28  862  			      bool *did_work)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  863  {
35f5197009cae2 Kent Overstreet 2025-01-25  864  	int ret = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  865  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  866  	ret = bch2_journal_error(j);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  867  	if (ret)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  868  		return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  869  
0e1d28c378988f Kent Overstreet 2025-07-14  870  	guard(mutex)(&j->reclaim_lock);
000de45996c4b0 Kent Overstreet 2019-01-14  871  
1e690efa72596a Kent Overstreet 2025-02-10  872  	for (int type = JOURNAL_PIN_TYPE_NR - 1;
1e690efa72596a Kent Overstreet 2025-02-10  873  	     type >= 0;
1e690efa72596a Kent Overstreet 2025-02-10  874  	     --type)
1e690efa72596a Kent Overstreet 2025-02-10  875  		if (journal_flush_pins_or_still_flushing(j, seq_to_flush, BIT(type))) {
35f5197009cae2 Kent Overstreet 2025-01-25  876  			*did_work = true;
0e1d28c378988f Kent Overstreet 2025-07-14 @877  			return ret;

I think ret was intended to be the return value from
journal_flush_pins_or_still_flushing()?

35f5197009cae2 Kent Overstreet 2025-01-25  878  		}
000de45996c4b0 Kent Overstreet 2019-01-14  879  
a66ff26b0f3118 Kent Overstreet 2023-12-10  880  	if (seq_to_flush > journal_cur_seq(j))
a66ff26b0f3118 Kent Overstreet 2023-12-10  881  		bch2_journal_entry_close(j);
a66ff26b0f3118 Kent Overstreet 2023-12-10  882  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  883  	/*
1c6fdbd8f2465d Kent Overstreet 2017-03-16  884  	 * If journal replay hasn't completed, the unreplayed journal entries
1c6fdbd8f2465d Kent Overstreet 2017-03-16  885  	 * hold refs on their corresponding sequence numbers
1c6fdbd8f2465d Kent Overstreet 2017-03-16  886  	 */
0e1d28c378988f Kent Overstreet 2025-07-14  887  	guard(spinlock)(&j->lock);
b895c70326aa43 Kent Overstreet 2024-04-30  888  	ret = !test_bit(JOURNAL_replay_done, &j->flags) ||
1c6fdbd8f2465d Kent Overstreet 2017-03-16  889  		journal_last_seq(j) > seq_to_flush ||
f0a3a2ccabc5ae Kent Overstreet 2022-02-28  890  		!fifo_used(&j->pin);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  891  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  892  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

