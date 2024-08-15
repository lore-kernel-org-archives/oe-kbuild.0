Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50B41474C5
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Aug 2024 05:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723699453; cv=none; b=IXCxElEGW45nrcD+ePMhwkpw+BRgGrdAZxxZBUKwBOslrSovmnAUIVukaZ0vxi7rfD+MbHbSLIjItFsbcDj3GhEn3ocMfzhdDvKcIIxTfz3pJT28oQQuzLlIzGJc/wYflTYqbz2L9jzbT7yeZrBL6tvgkgnYZzjCec+p9f9QZNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723699453; c=relaxed/simple;
	bh=5cFk+IQeKRFkZgLbXaJvzhDjpUxvC+vkysp+Yw19xYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gGiNO5L4UH2BnFQVThrXVJK/SfK0u9wqEXhaqXNieIEde6XDpvXti7aaKBVRe/PgYZ/Lolbmdn27N26Q5rRN5ZreREjMXaXIp04jY4y8B57HxWxF6Kgq3jr7HNHR0m2nG8D6RnjWXz4uu0b1eqUNOPNbR1tQrPsg0jnWz3K6WHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=we9qE1fc; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="we9qE1fc"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ef2cb7d562so7550341fa.3
        for <oe-kbuild@lists.linux.dev>; Wed, 14 Aug 2024 22:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723699449; x=1724304249; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EVkeENDC3n0M7WYlixjs2XMWugZmrAJQXbx1umwOZSY=;
        b=we9qE1fcvfZ5EQRIBZeOozqho6/ToiqtU6TuExxElH768pthodUoKKtfgBoxKH1mJT
         8MvXtIAWUkt6+NSmfGltx+amnNVvZ4h7ipxqXV7xQtxerwoYrfTy/153zRlwQtMjf9IE
         0is1LNS866CR6Kn907wO9gsfDDDJwWdDbNGGmjWfBXHCZC2ND50oC+RpIvWTV2VZnRhV
         7df54jZPQgZsqkLiDjFEKWb6/LNKkXdXA+9hOFOmCDgmB1S3Hm9QtP2ChNdPVMSvl4uy
         AtNtbdGM6OrpVK1Jh8H2P99lEMrtpc0AWi9Yi4bxD7TSiahkyUf/pabLPBm5+enItDjn
         i6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723699449; x=1724304249;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVkeENDC3n0M7WYlixjs2XMWugZmrAJQXbx1umwOZSY=;
        b=XEc8BD/dWvGG9vxrQ/WpQhOLTEUc2eQ9chfzuoVaZ1G1binShvqqaDewRuQOeTiscK
         OmnanMSfxx3ngvI+3sqijbw6bM3oo6rVoyQgbNjIOv3fIzZYTtlCEXHVKRrMPqqN/ltw
         8YMcnHnZZ85rfOX6xzZYFoYFKALMWBmULifM6SBVhrGNFHFC2McNQu4peh9fm5FWT5aU
         vw7BDjayyRvYoRhkoWrgHAxEM943DCRCqNVtt6V7NYCCIzwpK4idS5QnAt5ooNlwAwWh
         TWy4l3jSxC7WFXUcIA3lNo5ACzc7Nx15SDbXMey6It/cR4yluPMD/sFn2aQkAfG7Nd0W
         /A5w==
X-Gm-Message-State: AOJu0YxqIxlx1U+zjr1DbOX6JUea4r/oMvOaAJlXXmyl3xQ4XFBCN31/
	oWO1ehtAXipZTl/yNgH16me3FOpC0g19G6kSRdDal+DsafmZe9SosMYuFRbYWNOY2LnduMIer92
	b
X-Google-Smtp-Source: AGHT+IFK4FuJmocBnEt+LcScehPqpiHguHo37SGY6SPbTiK0jAA26KjitWp89+LSgktWCw8zi9/Gug==
X-Received: by 2002:a2e:6111:0:b0:2ef:284e:1d07 with SMTP id 38308e7fff4ca-2f3aa1a3b2bmr30451531fa.13.1723699448791;
        Wed, 14 Aug 2024 22:24:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded36a95sm37415885e9.28.2024.08.14.22.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 22:24:08 -0700 (PDT)
Date: Thu, 15 Aug 2024 08:24:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 22/30] mm/vmscan.c:4259
 try_to_inc_max_seq() error: uninitialized symbol 'walk'.
Message-ID: <d491502b-0759-43ca-9c74-8f8a285b419c@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   ca3d4c5eb0a6ed652cd1a345584483d564a1fd38
commit: 1feb0f684d7748b40305c514dda26dac13853d7f [22/30] CHROMIUM: mm/mglru: Split scan seqno from gen seqno
config: i386-randconfig-141-20240815 (https://download.01.org/0day-ci/archive/20240815/202408151126.WX90QAHA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408151126.WX90QAHA-lkp@intel.com/

smatch warnings:
mm/vmscan.c:4259 try_to_inc_max_seq() error: uninitialized symbol 'walk'.
mm/vmscan.c:4259 try_to_inc_max_seq() error: we previously assumed 'walk' could be null (see line 4238)

vim +/walk +4259 mm/vmscan.c

43d015dfbf4c2e Yu Zhao       2022-09-18  4208  static bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long max_seq,
1feb0f684d7748 David Stevens 2024-06-05  4209  			       unsigned long scan_seq, struct scan_control *sc,
1feb0f684d7748 David Stevens 2024-06-05  4210  			       bool can_swap, bool force_scan)
43d015dfbf4c2e Yu Zhao       2022-09-18  4211  {
43d015dfbf4c2e Yu Zhao       2022-09-18  4212  	bool success;
43d015dfbf4c2e Yu Zhao       2022-09-18  4213  	struct lru_gen_mm_walk *walk;
43d015dfbf4c2e Yu Zhao       2022-09-18  4214  	struct mm_struct *mm = NULL;
a2abc441807f51 Yu Zhao       2022-12-21  4215  	struct lru_gen_page *lrugen = &lruvec->lrugen;
43d015dfbf4c2e Yu Zhao       2022-09-18  4216  
43d015dfbf4c2e Yu Zhao       2022-09-18  4217  	VM_WARN_ON_ONCE(max_seq > READ_ONCE(lrugen->max_seq));
43d015dfbf4c2e Yu Zhao       2022-09-18  4218  
1feb0f684d7748 David Stevens 2024-06-05  4219  	/* see the comment on SCAN_ITER_FINISHING and in iterate_mm_list() */
1feb0f684d7748 David Stevens 2024-06-05  4220  	if (scan_seq == SCAN_ITER_FINISHING ||
1feb0f684d7748 David Stevens 2024-06-05  4221  	    scan_seq < READ_ONCE(lruvec->mm_state.scan_seq)) {
43d015dfbf4c2e Yu Zhao       2022-09-18  4222  		success = false;
43d015dfbf4c2e Yu Zhao       2022-09-18  4223  		goto done;
43d015dfbf4c2e Yu Zhao       2022-09-18  4224  	}
43d015dfbf4c2e Yu Zhao       2022-09-18  4225  
43d015dfbf4c2e Yu Zhao       2022-09-18  4226  	/*
43d015dfbf4c2e Yu Zhao       2022-09-18  4227  	 * If the hardware doesn't automatically set the accessed bit, fallback
43d015dfbf4c2e Yu Zhao       2022-09-18  4228  	 * to lru_gen_look_around(), which only clears the accessed bit in a
43d015dfbf4c2e Yu Zhao       2022-09-18  4229  	 * handful of PTEs. Spreading the work out over a period of time usually
43d015dfbf4c2e Yu Zhao       2022-09-18  4230  	 * is less efficient, but it avoids bursty page faults.
43d015dfbf4c2e Yu Zhao       2022-09-18  4231  	 */
6579994789d90e Yu Zhao       2022-09-18  4232  	if (!force_scan && !(arch_has_hw_pte_young() && get_cap(LRU_GEN_MM_WALK))) {
1feb0f684d7748 David Stevens 2024-06-05  4233  		success = iterate_mm_list_nowalk(lruvec, scan_seq);
43d015dfbf4c2e Yu Zhao       2022-09-18  4234  		goto done;

success is set, walk is not

43d015dfbf4c2e Yu Zhao       2022-09-18  4235  	}
43d015dfbf4c2e Yu Zhao       2022-09-18  4236  
784bac21e098dd Yu Zhao       2022-12-21  4237  	walk = set_mm_walk(NULL, true);
43d015dfbf4c2e Yu Zhao       2022-09-18 @4238  	if (!walk) {
1feb0f684d7748 David Stevens 2024-06-05  4239  		success = iterate_mm_list_nowalk(lruvec, scan_seq);
43d015dfbf4c2e Yu Zhao       2022-09-18  4240  		goto done;

success is set, walk is NULL

43d015dfbf4c2e Yu Zhao       2022-09-18  4241  	}
43d015dfbf4c2e Yu Zhao       2022-09-18  4242  
43d015dfbf4c2e Yu Zhao       2022-09-18  4243  	walk->lruvec = lruvec;
43d015dfbf4c2e Yu Zhao       2022-09-18  4244  	walk->max_seq = max_seq;
1feb0f684d7748 David Stevens 2024-06-05  4245  	walk->scan_seq = scan_seq;
43d015dfbf4c2e Yu Zhao       2022-09-18  4246  	walk->can_swap = can_swap;
6579994789d90e Yu Zhao       2022-09-18  4247  	walk->force_scan = force_scan;
43d015dfbf4c2e Yu Zhao       2022-09-18  4248  
43d015dfbf4c2e Yu Zhao       2022-09-18  4249  	do {
43d015dfbf4c2e Yu Zhao       2022-09-18  4250  		success = iterate_mm_list(lruvec, walk, &mm);
43d015dfbf4c2e Yu Zhao       2022-09-18  4251  		if (mm)
43d015dfbf4c2e Yu Zhao       2022-09-18  4252  			walk_mm(lruvec, mm, walk);
43d015dfbf4c2e Yu Zhao       2022-09-18  4253  	} while (mm);
43d015dfbf4c2e Yu Zhao       2022-09-18  4254  done:
3fca93bfccc1c3 Kalesh Singh  2023-04-13  4255  	if (success) {
6579994789d90e Yu Zhao       2022-09-18  4256  		inc_max_seq(lruvec, can_swap, force_scan);
1feb0f684d7748 David Stevens 2024-06-05  4257  
1feb0f684d7748 David Stevens 2024-06-05  4258  		VM_WARN_ON_ONCE(lruvec->mm_state.scan_seq != SCAN_ITER_FINISHING);
1feb0f684d7748 David Stevens 2024-06-05 @4259  		WRITE_ONCE(lruvec->mm_state.scan_seq, walk->scan_seq + 1);
                                                                                              ^^^^^^^^^^^^^^
Dereference

1feb0f684d7748 David Stevens 2024-06-05  4260  
ba7bdcf40461dd Koki Ryu      2022-12-22  4261  		kernfs_notify(lru_gen_admin_node);
3fca93bfccc1c3 Kalesh Singh  2023-04-13  4262  	}
43d015dfbf4c2e Yu Zhao       2022-09-18  4263  
3fca93bfccc1c3 Kalesh Singh  2023-04-13  4264  	return success;
43d015dfbf4c2e Yu Zhao       2022-09-18  4265  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

