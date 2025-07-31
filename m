Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEE821E0BE
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Jul 2025 15:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753977516; cv=none; b=Cc0QR0GeRyJKJhgNB0SS2H/aYzgFm5fWbve+43XCbMGMsS//8p6J7QXK0hLK5zf9AczBmKrIVVFyn0ckQPdnMtP2PQaDh5D1nehSAoXwTsmw17qr6ft1utTgF9WVQEtxBJVTo5Uy9GdtsBhFvcAQL8B83rTIPJxOgakN9T1UAps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753977516; c=relaxed/simple;
	bh=gmzrttWeWDT3PGDpJ2II7NY3KHDvCISiDvnyW1TVYP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jzRcEllyE9G4j2MnuSHEXfMdaGBxK0pZndL2LvqR+rU6jtS1ZBHrjX74zjQkZGuxAcyTSZrUpPuLFqheq1mGujzKI80GCBLNc5a+tPEps61ZtQOWTTuEQ5KE0P6IWlMxg/sN6ytJnjP4+bN6hsn/f5B+2e0RPtwjXtbCaelNnZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G7XcZC0s; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G7XcZC0s"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-88baa491d52so555785241.1
        for <oe-kbuild@lists.linux.dev>; Thu, 31 Jul 2025 08:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753977513; x=1754582313; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jKKboCZbQOuMPhW93A7UzwoZX1h4N/abO1uaKk6KKOQ=;
        b=G7XcZC0sKnPC/a57WBHMzNOLdj5cGqanYHhae/Z80VclFLCG/zt2CtroOvmylKWvLf
         HiJw8Tr8/reAxKTN7qBod+NE11U3p5Ey93akPRqpr9Xd2EzqUpU9I29eJhfBuy20EPbN
         3aX9k5D6rGlzu9KuHnqRaohAIQ9yOKZs6Yd6RNitaPq7IwUzsATqDrXoafeHobxJazRn
         8tQzrCWi4/A8DbRuce30jxqfq4p9yD5CyjMAnSszfNN3nX/Nyhq8hzkBHjS9eXFO5CiA
         dBoiTagDtqVsCVihT3QPaL0Josgxa/E8fEict5Cap3HhNVGKMC1otHnyHx3g2egbwO/i
         OEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977513; x=1754582313;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKKboCZbQOuMPhW93A7UzwoZX1h4N/abO1uaKk6KKOQ=;
        b=Gdb6xvLZdHXHZxuiyKJYWfSPXSTnYQIQiVucyZHi7eFVxb7xcCndpp3TeMBcHg5HGc
         VIfxQ96URMGKB2/7powjB3WV5oV6jHC3t2W8nINsufcVJ5LDwDjx7Fu1NUtZj7+WgGPa
         qXM7SWoyO3u/KfV5curLlJgvjSWTFhF8/5aRfxNmp6B0wWgDaNV88naekeb92sytQJWO
         8EpTCwn1yCpE457ZLH7CLE+Dgtf1x65R2+EScWWYWk9AjTEgb7A70EPx/vpVC9AaEUlI
         Jdljzwpy7dJvBKAzzeNW/18Vyo3Qp/eiE6SuhXJyfwdP9s4eaVG+rpgiGJ3l8YW/AW+6
         ueUA==
X-Gm-Message-State: AOJu0YwfafFa512Tvz81f6A/c0ZFjE8T0Akq1W3oMQeJ5aVTKMuY9xmD
	fr1PgVzH8TMJ3ctTomo5IYc7nveexcfNt+eqrIJL0k6pArEuy1coD0T1uNAM3ZvwrHvpPkeTJ+7
	BXOdYR8u3ag==
X-Gm-Gg: ASbGnctorIGA1PjpdgP/pvvtVCwUvZcknnfIp1dkBIzM5fySuvj6stgXMWC8zETvl/3
	6YZYY3+1v3os6Vaj09xWmfb9gcUZlBJqbuRJF5IRbXq9DIDfervkCOSlvW8Mc/NIPlF8DQ/tnGW
	eH8Ur+OgpK8rRRQO+uJ9AvMRsV9qcj67/eS17MYNYR9QrxEg1CqZCOudAzovYSxJXfZefas78Y3
	v5ixoDb9gxUGgfKRiVL5bby4Kkr/9Q9fciMpsSjKrMalLerrsNkstXS1M3iTQI8vvihsiJyyNDS
	zk8pIitqDMeq8I91YafczQ/CfQsNSGOWl7B7+50gpB9wNoMcAFRNyujh7tiE/3LA4sOzMtDb7nu
	zWMaewyxLGJK/iCHzaA7QPtoIbgE=
X-Google-Smtp-Source: AGHT+IFlKXeAtHhTk1SLO+CqePwO/w0WEyRur6i2wT7kumlydhvgPfkl/quSflZO/twV73QrziIhPg==
X-Received: by 2002:a05:6102:5686:b0:4e7:3e76:cd21 with SMTP id ada2fe7eead31-4fbe7f376f5mr4909961137.9.1753977512820;
        Thu, 31 Jul 2025 08:58:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88d8f422459sm431284241.21.2025.07.31.08.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 08:58:32 -0700 (PDT)
Date: Thu, 31 Jul 2025 18:58:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Marie Zhussupova <marievic@google.com>,
	rmoar@google.com, davidgow@google.com, shuah@kernel.org,
	brendan.higgins@linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, elver@google.com,
	dvyukov@google.com, lucas.demarchi@intel.com,
	thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	kasan-dev@googlegroups.com, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Marie Zhussupova <marievic@google.com>
Subject: Re: [PATCH 6/9] kunit: Enable direct registration of parameter
 arrays to a KUnit test
Message-ID: <5683507a-dacc-4e46-893f-d1e775d2ef22@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729193647.3410634-7-marievic@google.com>

Hi Marie,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marie-Zhussupova/kunit-Add-parent-kunit-for-parameterized-test-context/20250730-033818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git kunit
patch link:    https://lore.kernel.org/r/20250729193647.3410634-7-marievic%40google.com
patch subject: [PATCH 6/9] kunit: Enable direct registration of parameter arrays to a KUnit test
config: nios2-randconfig-r072-20250731 (https://download.01.org/0day-ci/archive/20250731/202507310854.pZvIcswn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507310854.pZvIcswn-lkp@intel.com/

New smatch warnings:
lib/kunit/test.c:723 kunit_run_tests() error: we previously assumed 'test_case->generate_params' could be null (see line 714)

vim +723 lib/kunit/test.c

914cc63eea6fbe Brendan Higgins     2019-09-23  681  int kunit_run_tests(struct kunit_suite *suite)
914cc63eea6fbe Brendan Higgins     2019-09-23  682  {
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  683  	char param_desc[KUNIT_PARAM_DESC_SIZE];
914cc63eea6fbe Brendan Higgins     2019-09-23  684  	struct kunit_case *test_case;
acd8e8407b8fcc David Gow           2021-08-03  685  	struct kunit_result_stats suite_stats = { 0 };
acd8e8407b8fcc David Gow           2021-08-03  686  	struct kunit_result_stats total_stats = { 0 };
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  687  	const void *curr_param;
914cc63eea6fbe Brendan Higgins     2019-09-23  688  
c272612cb4a2f7 David Gow           2022-07-01  689  	/* Taint the kernel so we know we've run tests. */
c272612cb4a2f7 David Gow           2022-07-01  690  	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
c272612cb4a2f7 David Gow           2022-07-01  691  
1cdba21db2ca31 Daniel Latypov      2022-04-29  692  	if (suite->suite_init) {
1cdba21db2ca31 Daniel Latypov      2022-04-29  693  		suite->suite_init_err = suite->suite_init(suite);
1cdba21db2ca31 Daniel Latypov      2022-04-29  694  		if (suite->suite_init_err) {
1cdba21db2ca31 Daniel Latypov      2022-04-29  695  			kunit_err(suite, KUNIT_SUBTEST_INDENT
1cdba21db2ca31 Daniel Latypov      2022-04-29  696  				  "# failed to initialize (%d)", suite->suite_init_err);
1cdba21db2ca31 Daniel Latypov      2022-04-29  697  			goto suite_end;
1cdba21db2ca31 Daniel Latypov      2022-04-29  698  		}
1cdba21db2ca31 Daniel Latypov      2022-04-29  699  	}
1cdba21db2ca31 Daniel Latypov      2022-04-29  700  
cae56e1740f559 Daniel Latypov      2022-04-29  701  	kunit_print_suite_start(suite);
914cc63eea6fbe Brendan Higgins     2019-09-23  702  
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  703  	kunit_suite_for_each_test_case(suite, test_case) {
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  704  		struct kunit test = { .param_value = NULL, .param_index = 0 };
acd8e8407b8fcc David Gow           2021-08-03  705  		struct kunit_result_stats param_stats = { 0 };
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  706  
887d85a0736ff3 Rae Moar            2023-03-08  707  		kunit_init_test(&test, test_case->name, test_case->log);
03806177fa4cbb Marie Zhussupova    2025-07-29  708  		__kunit_init_parent_test(test_case, &test);
03806177fa4cbb Marie Zhussupova    2025-07-29  709  
529534e8cba3e6 Rae Moar            2023-07-25  710  		if (test_case->status == KUNIT_SKIPPED) {
529534e8cba3e6 Rae Moar            2023-07-25  711  			/* Test marked as skip */
529534e8cba3e6 Rae Moar            2023-07-25  712  			test.status = KUNIT_SKIPPED;
529534e8cba3e6 Rae Moar            2023-07-25  713  			kunit_update_stats(&param_stats, test.status);
44c50ed8e59936 Marie Zhussupova    2025-07-29 @714  		} else if (!test_case->generate_params && !test.params_data.params) {
                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^
Imagine ->generate_parms is NULL but test.params_data.params is
non-NULL.

37dbb4c7c7442d David Gow           2021-11-02  715  			/* Non-parameterised test. */
529534e8cba3e6 Rae Moar            2023-07-25  716  			test_case->status = KUNIT_SKIPPED;
37dbb4c7c7442d David Gow           2021-11-02  717  			kunit_run_case_catch_errors(suite, test_case, &test);
37dbb4c7c7442d David Gow           2021-11-02  718  			kunit_update_stats(&param_stats, test.status);
03806177fa4cbb Marie Zhussupova    2025-07-29  719  		} else if (test_case->status != KUNIT_FAILURE) {
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  720  			/* Get initial param. */
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  721  			param_desc[0] = '\0';
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  722  			/* TODO: Make generate_params try-catch */
13ee0c64bd88a3 Marie Zhussupova    2025-07-29 @723  			curr_param = test_case->generate_params(&test, NULL, param_desc);
                                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
Then this could crash.

I suspect that this is fine, but I bet that in the previous
condition, just testing one would probably have been sufficient
or maybe we could have change && to ||.

529534e8cba3e6 Rae Moar            2023-07-25  724  			test_case->status = KUNIT_SKIPPED;
6c738b52316c58 Rae Moar            2022-11-23  725  			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
6c738b52316c58 Rae Moar            2022-11-23  726  				  "KTAP version 1\n");
44b7da5fcd4c99 David Gow           2021-11-02  727  			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
44b7da5fcd4c99 David Gow           2021-11-02  728  				  "# Subtest: %s", test_case->name);
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  729  
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  730  			while (curr_param) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

