Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0C33D82
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 05:12:26 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so588689f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 26 Jul 2023 22:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690434745; x=1691039545;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9GgkNgIPZuWwBvKwcRHA3Icc55jLNUA5tTeNCdLIPG0=;
        b=fEWMl5pP7863Pd1nr9LkBeLbLC8LDD5JFDIUEnxXqXAPtiz377YGUXP7yyRqDYKx9e
         ymi2dPbJ/MJ/3SCq3eY4bzhVWRDpZV2dh8mWm/c5LgVRnzDyEwEQCbxGBIKlAGOeZAvP
         XVopwOW1tkF8Oopx07GU/MCQu6pS9p4/tMTbeuxhBGd7IxoqMHrP2RCFMoO58Oy78lVn
         zCIEPIeAZNP4UOFFmkZWI3otIzt/DmE2GEsbwcgdWYp/UwCQzABKeXn5oFXnaw0poxZF
         BmgwTz9jPOIDij4gCHQvht4au0DyLciLZqMi8/DtDWdGP3OB+3Tpj6pcET4Q6J98cgNp
         xeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690434745; x=1691039545;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GgkNgIPZuWwBvKwcRHA3Icc55jLNUA5tTeNCdLIPG0=;
        b=jy2FujnpjlwTyGbEJyQXOkBvVNseJzALZV2n9ygnkWr94UnQhCL90rysINLWHxbaI3
         6dnUi+WT0P1Ny6iuXRT8iKYBnsFwjPZyNoafwC9szfpfQFTCMB92/VY6+KVRSfswZ9R+
         Hco3a1Ojkn/xUVVla3NqhOut9fBKa4VVNvK15Y8sSTCKphM7VV6csToBVkATjRnjMoWS
         LXzvNsD/9dbqc9Q93eG4q4ATzWZPd3CBBApv9lBso8xZVwEeDTaSpnClbxZP3PlXKuIY
         ZeJfonfMrQPF5DLRrgY7ZNXd3vGita2LAqdjt26daqvddxA9w5nOgCj924wRrlUnqZiM
         xv0A==
X-Gm-Message-State: ABy/qLbRs5xotLii8ZoqZedjwYbPzJyqasunFI947V1peCsOGBYhFKeD
	7MWsx7v6KjgcV9J1xebdBVhVucXU+WKdRCkMW28=
X-Google-Smtp-Source: APBJJlGHOmqFNZTfikbTKjuaqkaOKlyR4CP+vno1vsD2MfiqiTZmC/lEQRIn2+U1mOWFKTaVX2mkRQ==
X-Received: by 2002:a05:6000:1807:b0:317:5e5e:60e0 with SMTP id m7-20020a056000180700b003175e5e60e0mr884675wrh.28.1690434744653;
        Wed, 26 Jul 2023 22:12:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m12-20020adff38c000000b00313f031876esm837187wro.43.2023.07.26.22.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:12:24 -0700 (PDT)
Date: Thu, 27 Jul 2023 08:12:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rae Moar <rmoar@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/9] kunit: Add ability to filter attributes
Message-ID: <3cfb0706-0873-4839-b6e1-e8f1c994d6a6@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725212522.1622716-5-rmoar@google.com>

Hi Rae,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Rae-Moar/kunit-Add-test-attributes-API-structure/20230726-052754
base:   64bd4641310c41a1ecf07c13c67bc0ed61045dfd
patch link:    https://lore.kernel.org/r/20230725212522.1622716-5-rmoar%40google.com
patch subject: [PATCH v3 4/9] kunit: Add ability to filter attributes
config: parisc-randconfig-m041-20230726 (https://download.01.org/0day-ci/archive/20230727/202307270610.s0w4NKEn-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270610.s0w4NKEn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307270610.s0w4NKEn-lkp@intel.com/

New smatch warnings:
lib/kunit/attributes.c:127 attr_enum_filter() error: uninitialized symbol 'input_int'.
lib/kunit/attributes.c:262 kunit_get_filter_count() error: uninitialized symbol 'comma_index'.
lib/kunit/attributes.c:284 kunit_next_attr_filter() error: uninitialized symbol 'comma_index'.
lib/kunit/executor.c:168 kunit_filter_suites() error: uninitialized symbol 'filter_count'.
lib/kunit/executor.c:171 kunit_filter_suites() error: uninitialized symbol 'parsed_filters'.

Old smatch warnings:
lib/kunit/attributes.c:267 kunit_get_filter_count() error: uninitialized symbol 'comma_index'.
lib/kunit/executor.c:201 kunit_filter_suites() error: uninitialized symbol 'filter_count'.
lib/kunit/executor.c:202 kunit_filter_suites() error: uninitialized symbol 'parsed_filters'.

vim +/input_int +127 lib/kunit/attributes.c

793862a3f94d2f Rae Moar 2023-07-25  102  static int attr_enum_filter(void *attr, const char *input, int *err,
793862a3f94d2f Rae Moar 2023-07-25  103  		const char * const str_list[], int max)
793862a3f94d2f Rae Moar 2023-07-25  104  {
793862a3f94d2f Rae Moar 2023-07-25  105  	int i, j, input_int;
                                                          ^^^^^^^^^

793862a3f94d2f Rae Moar 2023-07-25  106  	long test_val = (long)attr;
793862a3f94d2f Rae Moar 2023-07-25  107  	const char *input_val = NULL;
793862a3f94d2f Rae Moar 2023-07-25  108  
793862a3f94d2f Rae Moar 2023-07-25  109  	for (i = 0; input[i]; i++) {
793862a3f94d2f Rae Moar 2023-07-25  110  		if (!strchr(op_list, input[i])) {
793862a3f94d2f Rae Moar 2023-07-25  111  			input_val = input + i;
793862a3f94d2f Rae Moar 2023-07-25  112  			break;
793862a3f94d2f Rae Moar 2023-07-25  113  		}
793862a3f94d2f Rae Moar 2023-07-25  114  	}
793862a3f94d2f Rae Moar 2023-07-25  115  
793862a3f94d2f Rae Moar 2023-07-25  116  	if (!input_val) {
793862a3f94d2f Rae Moar 2023-07-25  117  		*err = -EINVAL;
793862a3f94d2f Rae Moar 2023-07-25  118  		pr_err("kunit executor: filter value not found: %s\n", input);
793862a3f94d2f Rae Moar 2023-07-25  119  		return false;
793862a3f94d2f Rae Moar 2023-07-25  120  	}
793862a3f94d2f Rae Moar 2023-07-25  121  
793862a3f94d2f Rae Moar 2023-07-25  122  	for (j = 0; j <= max; j++) {
793862a3f94d2f Rae Moar 2023-07-25  123  		if (!strcmp(input_val, str_list[j]))
793862a3f94d2f Rae Moar 2023-07-25  124  			input_int = j;
793862a3f94d2f Rae Moar 2023-07-25  125  	}
793862a3f94d2f Rae Moar 2023-07-25  126  
793862a3f94d2f Rae Moar 2023-07-25 @127  	if (!input_int) {

This is a bug, but wait, what?  Why is the first element invalid?  Maybe
do:
	int input_int = -1;

	for (j = 0; j <= max; j++) {
		if found
			input_int = j;
	}

	if (input_int == -1) {

793862a3f94d2f Rae Moar 2023-07-25  128  		*err = -EINVAL;
793862a3f94d2f Rae Moar 2023-07-25  129  		pr_err("kunit executor: invalid filter input: %s\n", input);
793862a3f94d2f Rae Moar 2023-07-25  130  		return false;
793862a3f94d2f Rae Moar 2023-07-25  131  	}
793862a3f94d2f Rae Moar 2023-07-25  132  
793862a3f94d2f Rae Moar 2023-07-25  133  	return int_filter(test_val, input, input_int, err);
793862a3f94d2f Rae Moar 2023-07-25  134  }

[ snip ]

793862a3f94d2f Rae Moar 2023-07-25  256  int kunit_get_filter_count(char *input)
793862a3f94d2f Rae Moar 2023-07-25  257  {
793862a3f94d2f Rae Moar 2023-07-25  258  	int i, comma_index, count = 0;
793862a3f94d2f Rae Moar 2023-07-25  259  
793862a3f94d2f Rae Moar 2023-07-25  260  	for (i = 0; input[i]; i++) {
793862a3f94d2f Rae Moar 2023-07-25  261  		if (input[i] == ',') {
793862a3f94d2f Rae Moar 2023-07-25 @262  			if ((i - comma_index) > 1)

initialize comma_index = 0

793862a3f94d2f Rae Moar 2023-07-25  263  				count++;
793862a3f94d2f Rae Moar 2023-07-25  264  			comma_index = i;
793862a3f94d2f Rae Moar 2023-07-25  265  		}
793862a3f94d2f Rae Moar 2023-07-25  266  	}
793862a3f94d2f Rae Moar 2023-07-25  267  	if ((i - comma_index) > 0)
793862a3f94d2f Rae Moar 2023-07-25  268  		count++;
793862a3f94d2f Rae Moar 2023-07-25  269  	return count;
793862a3f94d2f Rae Moar 2023-07-25  270  }
793862a3f94d2f Rae Moar 2023-07-25  271  
793862a3f94d2f Rae Moar 2023-07-25  272  struct kunit_attr_filter kunit_next_attr_filter(char **filters, int *err)
793862a3f94d2f Rae Moar 2023-07-25  273  {
793862a3f94d2f Rae Moar 2023-07-25  274  	struct kunit_attr_filter filter = {};
793862a3f94d2f Rae Moar 2023-07-25  275  	int i, j, comma_index, new_start_index;
793862a3f94d2f Rae Moar 2023-07-25  276  	int op_index = -1, attr_index = -1;
793862a3f94d2f Rae Moar 2023-07-25  277  	char op;
793862a3f94d2f Rae Moar 2023-07-25  278  	char *input = *filters;
793862a3f94d2f Rae Moar 2023-07-25  279  
793862a3f94d2f Rae Moar 2023-07-25  280  	/* Parse input until operation */
793862a3f94d2f Rae Moar 2023-07-25  281  	for (i = 0; input[i]; i++) {
793862a3f94d2f Rae Moar 2023-07-25  282  		if (op_index < 0 && strchr(op_list, input[i])) {
793862a3f94d2f Rae Moar 2023-07-25  283  			op_index = i;
793862a3f94d2f Rae Moar 2023-07-25 @284  		} else if (!comma_index && input[i] == ',') {

same

793862a3f94d2f Rae Moar 2023-07-25  285  			comma_index = i;
793862a3f94d2f Rae Moar 2023-07-25  286  		} else if (comma_index && input[i] != ' ') {
793862a3f94d2f Rae Moar 2023-07-25  287  			new_start_index = i;
793862a3f94d2f Rae Moar 2023-07-25  288  			break;
793862a3f94d2f Rae Moar 2023-07-25  289  		}
793862a3f94d2f Rae Moar 2023-07-25  290  	}
793862a3f94d2f Rae Moar 2023-07-25  291  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

