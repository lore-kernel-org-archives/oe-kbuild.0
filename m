Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E262882A2
	for <oe-kbuild@lists.linux.dev>; Fri, 23 May 2025 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987984; cv=none; b=Q/MBnNK/+bYmDuSfTYG9Ny42ou9F022oFMP5hQc2gHIliOiU9L27k5pT6UulFA3rW0S4BRojdPWdFgaflDkq00PsVBCQV0OnElJRn1unoLZlyJJQPoufpUHv004giVrYW8R5kV8NDDmgxx6T0lvX1yF3FXTIZ/IDjwpbLcYQ6/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987984; c=relaxed/simple;
	bh=aMlex74IyOMR1qirqxGs7gic+8F3yx2rJr4KfbBTDBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NtnyBR9LqBZJVGi+UWOiuAYmlLN0Gmfhxgr0tlMpMzNgyjWmznvXtm7XXJC4TcIEdqTisjRntkdcHlozieRs/ySTmEziTJe2bLe0cHr+Gv4e3MNudPUv4zzYC+BNZZxcKF9ed7EbAQnbBghXkLtzhxzIs0VDH0zAnZM8ckcMyvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N9ujN+Sn; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N9ujN+Sn"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0ac853894so7860196f8f.3
        for <oe-kbuild@lists.linux.dev>; Fri, 23 May 2025 01:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747987979; x=1748592779; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xSdRboFiYEYYT3CZ0igSixqUd+xu0dWeJ9sxgLML8B4=;
        b=N9ujN+SnXZ18Duv9fyOL2pkpi36/orKn4x59zzYBzCoiCUyAKe69pKtrCTb1rZ4iLJ
         ajx8bJrLb5ktm98OjJQDbVoCxJvrCeREgwf4X1APgVt6Yc3wNnL7c6QTMGL/LZaqd/LU
         VbtssqWbjyGIwvjB4MDXcCOLzwlD9/3+PN8ZKu6f9mdAfMSeLZqSmpHUfNIyQ1k6rVjy
         HfOiGTlfSr0O0sYSqaiV3euldreLZtu91m28kV6TrO6OayFMpD7X283SgaA4wJfVCKLV
         YqsP4dH2DonUtgCh27wJ+0Se++S+Dtaj0fhdDahnTmZkDBCtxCh4INX5S4O/RoGmwEm4
         vLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747987979; x=1748592779;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xSdRboFiYEYYT3CZ0igSixqUd+xu0dWeJ9sxgLML8B4=;
        b=bvhqs5JU/TDlhkKNZc3hSZ1Kgy9ZzJuDhPSkDiJC1q8v27toP9u2WQD6e1w4swNTyg
         KI26StyvbRmjwZqwhaoXMe6+fy1Ag2tD9YapG695szO+Tq7sQw9TgL4OIXZBuOc6rJbQ
         xRbShXFc6qVvI1cUdIf+K2+w6URdQEPHD/ik2POowtNEJDX7HAA3BwjVa+Cv7wWj4Rs6
         O39pSzPpSj9q6MYe/VvUpDCOTCPFXAgYeHoqvZEPIKO3+uaDGHlr3cK3XZjvLsN+NJlM
         tzCAfyyNnW8ADWzu8STKL2q9jNuCA2Hv5f73+HRD27yC+0B15jAVjW1C0vQqjNygd3nU
         /IAA==
X-Gm-Message-State: AOJu0YyNBOaGJA+QrVEk+7Wc0ps6oyYfSb7RBJ4bAfWlFKH99NxYwttI
	WOjiQeQ3azJhxDbIayaqIj84S15RgGhPTAZwRW2TQZdeyPS6GnFwTSdWXTSjdLI0BeAeGTWgxyM
	lmwJo
X-Gm-Gg: ASbGncvFZbeA1J4C0JX1mj0rCO5z2PFukkSQO8+avN/fftymwldZJXx2uHUdTM7fAnl
	pvEsp2m6FIpwGhRsm3Zegi23YAd2vwGuYky+o+fyr7DlmFwpWSQ9hwu49JXL2+dM2pdeoQkTF2m
	hGQIg8AWqn/a+WLJVVhvvweiq3ital4rUc1NnVy6Zfd0a1uGQcFdBK1tzR8DB4PxqMQsU8d+YpE
	hM/mQYZatafE7/7wz/jRDNJfLEYjHRMzK1LIvSjymsSJIklQ+gyRfqi6U0+wh3/kMCFTHqgTLFu
	xHzWK5Xkqqj/mb3EvUWG1R5THWlT4SjezgEVxcjFHa+XUQl18H01PziN
X-Google-Smtp-Source: AGHT+IFjTZcfmvfed0hjVta3v+ReMWyTvmS2NU57Vb0uEbSmQjvUK3ePUpilpcC8nhmpE5pK/SXCUQ==
X-Received: by 2002:a05:6000:1844:b0:3a0:ad5e:2ee1 with SMTP id ffacd0b85a97d-3a4c2344d26mr1598944f8f.50.1747987979526;
        Fri, 23 May 2025 01:12:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a368250dbbsm21043942f8f.47.2025.05.23.01.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:12:59 -0700 (PDT)
Date: Fri, 23 May 2025 11:12:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>
Subject: [cel:nfsd-testing 3/93] fs/nfsd/nfs4callback.c:1412
 nfsd41_cb_referring_call() warn: '&rcl->__list' not removed from list
Message-ID: <202505171002.cE46sdj5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250523081255.zhEPOxhU67ibZFylT_yuphZGVvQxa0O33ARdqROFyL4@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   d868e4920c3f4feefcbc17c5812bbe1a48af8c6f
commit: 4f3c8d8c9e109655311bbb4c6c46a54a9ef90d99 [3/93] NFSD: Implement CB_SEQUENCE referring call lists
config: i386-randconfig-141-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171002.cE46sdj5-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505171002.cE46sdj5-lkp@intel.com/

New smatch warnings:
fs/nfsd/nfs4callback.c:1412 nfsd41_cb_referring_call() warn: '&rcl->__list' not removed from list

vim +1412 fs/nfsd/nfs4callback.c

4f3c8d8c9e1096 Chuck Lever     2025-03-01  1362  void nfsd41_cb_referring_call(struct nfsd4_callback *cb,
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1363  			      struct nfs4_sessionid *sessionid,
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1364  			      u32 slotid, u32 seqno)
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1365  {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1366  	struct nfsd4_referring_call_list *rcl;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1367  	struct nfsd4_referring_call *rc;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1368  	bool found;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1369  
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1370  	might_sleep();
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1371  
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1372  	found = false;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1373  	list_for_each_entry(rcl, &cb->cb_referring_call_list, __list) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1374  		if (!memcmp(rcl->rcl_sessionid.data, sessionid->data,
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1375  			   NFS4_MAX_SESSIONID_LEN)) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1376  			found = true;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1377  			break;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1378  		}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1379  	}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1380  	if (!found) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1381  		rcl = kmalloc(sizeof(*rcl), GFP_KERNEL);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1382  		if (!rcl)
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1383  			return;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1384  		memcpy(rcl->rcl_sessionid.data, sessionid->data,
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1385  		       NFS4_MAX_SESSIONID_LEN);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1386  		rcl->__nr_referring_calls = 0;
                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is zero.

4f3c8d8c9e1096 Chuck Lever     2025-03-01  1387  		INIT_LIST_HEAD(&rcl->rcl_referring_calls);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1388  		list_add(&rcl->__list, &cb->cb_referring_call_list);

We add "rcl" to the list.

4f3c8d8c9e1096 Chuck Lever     2025-03-01  1389  		cb->cb_nr_referring_call_list++;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1390  	}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1391  
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1392  	found = false;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1393  	list_for_each_entry(rc, &rcl->rcl_referring_calls, __list) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1394  		if (rc->rc_sequenceid == seqno && rc->rc_slotid == slotid) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1395  			found = true;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1396  			break;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1397  		}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1398  	}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1399  	if (!found) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1400  		rc = kmalloc(sizeof(*rc), GFP_KERNEL);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1401  		if (!rc)
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1402  			goto out;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1403  		rc->rc_sequenceid = seqno;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1404  		rc->rc_slotid = slotid;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1405  		rcl->__nr_referring_calls++;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1406  		list_add(&rc->__list, &rcl->rcl_referring_calls);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1407  	}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1408  
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1409  out:
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1410  	if (!rcl->__nr_referring_calls) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1411  		cb->cb_nr_referring_call_list--;
4f3c8d8c9e1096 Chuck Lever     2025-03-01 @1412  		kfree(rcl);

This frees rcl but it's still on the list.

4f3c8d8c9e1096 Chuck Lever     2025-03-01  1413  	}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1414  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

