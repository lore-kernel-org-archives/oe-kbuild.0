Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAA41BEE4
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jul 2023 23:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690412732; x=1721948732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ddr2bGlJLjpfA+uBSzABX6mFF9fQwLHmrVi6jD9TxvA=;
  b=FeXbvOZ+QA/4s+mZC2QxT+65ePOkDvVR22NJQDywRVWm5Gx7pe12dtw+
   BmjuNd9k4fkqlwawWl18wGM1Im5JKqXO5N6ES44bqJYyWeHXmVwoWVu/R
   UcPs+SxeeGPbaRHPUNr/aJOgWMTzOQjfWdmfqbLCxgqXYQSI6B6773UzK
   0PGz8YPuYcV4mus/nTpVH0yjaVMW8nPu539Nxz9t9ypmaA/wqSgaw6X3d
   ocun0kcRCLyJy4QQbumqBo+XOBRDmR/50QDdOTxdNc/wvYF6qkdCxM4PW
   n0+31Hglsdn7B8Gg3WV7FGxCWxeVf/TlONPKGlQyR5iAFw/jBCnhCwgbW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365613943"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="365613943"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 16:05:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="703925747"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="703925747"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 26 Jul 2023 16:05:29 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOnZJ-0001QZ-08;
	Wed, 26 Jul 2023 23:05:23 +0000
Date: Thu, 27 Jul 2023 07:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 4/9] kunit: Add ability to filter attributes
Message-ID: <202307270610.s0w4NKEn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230725212522.1622716-5-rmoar@google.com>
References: <20230725212522.1622716-5-rmoar@google.com>
TO: Rae Moar <rmoar@google.com>

Hi Rae,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 64bd4641310c41a1ecf07c13c67bc0ed61045dfd]

url:    https://github.com/intel-lab-lkp/linux/commits/Rae-Moar/kunit-Add-test-attributes-API-structure/20230726-052754
base:   64bd4641310c41a1ecf07c13c67bc0ed61045dfd
patch link:    https://lore.kernel.org/r/20230725212522.1622716-5-rmoar%40google.com
patch subject: [PATCH v3 4/9] kunit: Add ability to filter attributes
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: parisc-randconfig-m041-20230726 (https://download.01.org/0day-ci/archive/20230727/202307270610.s0w4NKEn-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270610.s0w4NKEn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
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

793862a3f94d2f Rae Moar 2023-07-25   96  
793862a3f94d2f Rae Moar 2023-07-25   97  /*
793862a3f94d2f Rae Moar 2023-07-25   98   * Returns whether the inputted enum value "attr" matches the filter given
793862a3f94d2f Rae Moar 2023-07-25   99   * by the input string. Note: the str_list includes the corresponding string
793862a3f94d2f Rae Moar 2023-07-25  100   * list to the enum values.
793862a3f94d2f Rae Moar 2023-07-25  101   */
793862a3f94d2f Rae Moar 2023-07-25  102  static int attr_enum_filter(void *attr, const char *input, int *err,
793862a3f94d2f Rae Moar 2023-07-25  103  		const char * const str_list[], int max)
793862a3f94d2f Rae Moar 2023-07-25  104  {
793862a3f94d2f Rae Moar 2023-07-25  105  	int i, j, input_int;
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
793862a3f94d2f Rae Moar 2023-07-25  128  		*err = -EINVAL;
793862a3f94d2f Rae Moar 2023-07-25  129  		pr_err("kunit executor: invalid filter input: %s\n", input);
793862a3f94d2f Rae Moar 2023-07-25  130  		return false;
793862a3f94d2f Rae Moar 2023-07-25  131  	}
793862a3f94d2f Rae Moar 2023-07-25  132  
793862a3f94d2f Rae Moar 2023-07-25  133  	return int_filter(test_val, input, input_int, err);
793862a3f94d2f Rae Moar 2023-07-25  134  }
793862a3f94d2f Rae Moar 2023-07-25  135  
793862a3f94d2f Rae Moar 2023-07-25  136  static int attr_speed_filter(void *attr, const char *input, int *err)
793862a3f94d2f Rae Moar 2023-07-25  137  {
793862a3f94d2f Rae Moar 2023-07-25  138  	return attr_enum_filter(attr, input, err, speed_str_list, KUNIT_SPEED_MAX);
793862a3f94d2f Rae Moar 2023-07-25  139  }
793862a3f94d2f Rae Moar 2023-07-25  140  
793862a3f94d2f Rae Moar 2023-07-25  141  /*
793862a3f94d2f Rae Moar 2023-07-25  142   * Returns whether the inputted string value (attr) matches the filter given
793862a3f94d2f Rae Moar 2023-07-25  143   * by the input string.
793862a3f94d2f Rae Moar 2023-07-25  144   */
793862a3f94d2f Rae Moar 2023-07-25  145  static int attr_string_filter(void *attr, const char *input, int *err)
793862a3f94d2f Rae Moar 2023-07-25  146  {
793862a3f94d2f Rae Moar 2023-07-25  147  	char *str = attr;
793862a3f94d2f Rae Moar 2023-07-25  148  
793862a3f94d2f Rae Moar 2023-07-25  149  	if (!strncmp(input, "<", 1)) {
793862a3f94d2f Rae Moar 2023-07-25  150  		*err = -EINVAL;
793862a3f94d2f Rae Moar 2023-07-25  151  		pr_err("kunit executor: invalid filter input: %s\n", input);
793862a3f94d2f Rae Moar 2023-07-25  152  		return false;
793862a3f94d2f Rae Moar 2023-07-25  153  	} else if (!strncmp(input, ">", 1)) {
793862a3f94d2f Rae Moar 2023-07-25  154  		*err = -EINVAL;
793862a3f94d2f Rae Moar 2023-07-25  155  		pr_err("kunit executor: invalid filter input: %s\n", input);
793862a3f94d2f Rae Moar 2023-07-25  156  		return false;
793862a3f94d2f Rae Moar 2023-07-25  157  	} else if (!strncmp(input, "!=", 2)) {
793862a3f94d2f Rae Moar 2023-07-25  158  		return (strcmp(input + 2, str) != 0);
793862a3f94d2f Rae Moar 2023-07-25  159  	} else if (!strncmp(input, "=", 1)) {
793862a3f94d2f Rae Moar 2023-07-25  160  		return (strcmp(input + 1, str) == 0);
793862a3f94d2f Rae Moar 2023-07-25  161  	}
793862a3f94d2f Rae Moar 2023-07-25  162  	*err = -EINVAL;
793862a3f94d2f Rae Moar 2023-07-25  163  	pr_err("kunit executor: invalid filter operation: %s\n", input);
793862a3f94d2f Rae Moar 2023-07-25  164  	return false;
793862a3f94d2f Rae Moar 2023-07-25  165  }
793862a3f94d2f Rae Moar 2023-07-25  166  
793862a3f94d2f Rae Moar 2023-07-25  167  
b0e11fa80d3401 Rae Moar 2023-07-25  168  /* Get Attribute Methods */
b0e11fa80d3401 Rae Moar 2023-07-25  169  
b0e11fa80d3401 Rae Moar 2023-07-25  170  static void *attr_speed_get(void *test_or_suite, bool is_test)
b0e11fa80d3401 Rae Moar 2023-07-25  171  {
b0e11fa80d3401 Rae Moar 2023-07-25  172  	struct kunit_suite *suite = is_test ? NULL : test_or_suite;
b0e11fa80d3401 Rae Moar 2023-07-25  173  	struct kunit_case *test = is_test ? test_or_suite : NULL;
b0e11fa80d3401 Rae Moar 2023-07-25  174  
b0e11fa80d3401 Rae Moar 2023-07-25  175  	if (test)
b0e11fa80d3401 Rae Moar 2023-07-25  176  		return ((void *) test->attr.speed);
b0e11fa80d3401 Rae Moar 2023-07-25  177  	else
b0e11fa80d3401 Rae Moar 2023-07-25  178  		return ((void *) suite->attr.speed);
b0e11fa80d3401 Rae Moar 2023-07-25  179  }
b0e11fa80d3401 Rae Moar 2023-07-25  180  
c27a49f2b28797 Rae Moar 2023-07-25  181  static void *attr_module_get(void *test_or_suite, bool is_test)
c27a49f2b28797 Rae Moar 2023-07-25  182  {
c27a49f2b28797 Rae Moar 2023-07-25  183  	struct kunit_suite *suite = is_test ? NULL : test_or_suite;
c27a49f2b28797 Rae Moar 2023-07-25  184  	struct kunit_case *test = is_test ? test_or_suite : NULL;
c27a49f2b28797 Rae Moar 2023-07-25  185  
c27a49f2b28797 Rae Moar 2023-07-25  186  	// Suites get their module attribute from their first test_case
c27a49f2b28797 Rae Moar 2023-07-25  187  	if (test)
c27a49f2b28797 Rae Moar 2023-07-25  188  		return ((void *) test->module_name);
c27a49f2b28797 Rae Moar 2023-07-25  189  	else
c27a49f2b28797 Rae Moar 2023-07-25  190  		return ((void *) suite->test_cases[0].module_name);
c27a49f2b28797 Rae Moar 2023-07-25  191  }
c27a49f2b28797 Rae Moar 2023-07-25  192  
3f94a25af8b122 Rae Moar 2023-07-25  193  /* List of all Test Attributes */
3f94a25af8b122 Rae Moar 2023-07-25  194  
b0e11fa80d3401 Rae Moar 2023-07-25  195  static struct kunit_attr kunit_attr_list[] = {
b0e11fa80d3401 Rae Moar 2023-07-25  196  	{
b0e11fa80d3401 Rae Moar 2023-07-25  197  		.name = "speed",
b0e11fa80d3401 Rae Moar 2023-07-25  198  		.get_attr = attr_speed_get,
b0e11fa80d3401 Rae Moar 2023-07-25  199  		.to_string = attr_speed_to_string,
793862a3f94d2f Rae Moar 2023-07-25  200  		.filter = attr_speed_filter,
b0e11fa80d3401 Rae Moar 2023-07-25  201  		.attr_default = (void *)KUNIT_SPEED_NORMAL,
b0e11fa80d3401 Rae Moar 2023-07-25  202  		.print = PRINT_ALWAYS,
b0e11fa80d3401 Rae Moar 2023-07-25  203  	},
c27a49f2b28797 Rae Moar 2023-07-25  204  	{
c27a49f2b28797 Rae Moar 2023-07-25  205  		.name = "module",
c27a49f2b28797 Rae Moar 2023-07-25  206  		.get_attr = attr_module_get,
c27a49f2b28797 Rae Moar 2023-07-25  207  		.to_string = attr_string_to_string,
793862a3f94d2f Rae Moar 2023-07-25  208  		.filter = attr_string_filter,
c27a49f2b28797 Rae Moar 2023-07-25  209  		.attr_default = (void *)"",
c27a49f2b28797 Rae Moar 2023-07-25  210  		.print = PRINT_SUITE,
c27a49f2b28797 Rae Moar 2023-07-25  211  	}
b0e11fa80d3401 Rae Moar 2023-07-25  212  };
3f94a25af8b122 Rae Moar 2023-07-25  213  
3f94a25af8b122 Rae Moar 2023-07-25  214  /* Helper Functions to Access Attributes */
3f94a25af8b122 Rae Moar 2023-07-25  215  
793862a3f94d2f Rae Moar 2023-07-25  216  const char *kunit_attr_filter_name(struct kunit_attr_filter filter)
793862a3f94d2f Rae Moar 2023-07-25  217  {
793862a3f94d2f Rae Moar 2023-07-25  218  	return filter.attr->name;
793862a3f94d2f Rae Moar 2023-07-25  219  }
793862a3f94d2f Rae Moar 2023-07-25  220  
3f94a25af8b122 Rae Moar 2023-07-25  221  void kunit_print_attr(void *test_or_suite, bool is_test, unsigned int test_level)
3f94a25af8b122 Rae Moar 2023-07-25  222  {
3f94a25af8b122 Rae Moar 2023-07-25  223  	int i;
3f94a25af8b122 Rae Moar 2023-07-25  224  	bool to_free;
3f94a25af8b122 Rae Moar 2023-07-25  225  	void *attr;
3f94a25af8b122 Rae Moar 2023-07-25  226  	const char *attr_name, *attr_str;
3f94a25af8b122 Rae Moar 2023-07-25  227  	struct kunit_suite *suite = is_test ? NULL : test_or_suite;
3f94a25af8b122 Rae Moar 2023-07-25  228  	struct kunit_case *test = is_test ? test_or_suite : NULL;
3f94a25af8b122 Rae Moar 2023-07-25  229  
3f94a25af8b122 Rae Moar 2023-07-25  230  	for (i = 0; i < ARRAY_SIZE(kunit_attr_list); i++) {
3f94a25af8b122 Rae Moar 2023-07-25  231  		if (kunit_attr_list[i].print == PRINT_NEVER ||
3f94a25af8b122 Rae Moar 2023-07-25  232  				(test && kunit_attr_list[i].print == PRINT_SUITE))
3f94a25af8b122 Rae Moar 2023-07-25  233  			continue;
3f94a25af8b122 Rae Moar 2023-07-25  234  		attr = kunit_attr_list[i].get_attr(test_or_suite, is_test);
3f94a25af8b122 Rae Moar 2023-07-25  235  		if (attr) {
3f94a25af8b122 Rae Moar 2023-07-25  236  			attr_name = kunit_attr_list[i].name;
3f94a25af8b122 Rae Moar 2023-07-25  237  			attr_str = kunit_attr_list[i].to_string(attr, &to_free);
3f94a25af8b122 Rae Moar 2023-07-25  238  			if (test) {
3f94a25af8b122 Rae Moar 2023-07-25  239  				kunit_log(KERN_INFO, test, "%*s# %s.%s: %s",
3f94a25af8b122 Rae Moar 2023-07-25  240  					KUNIT_INDENT_LEN * test_level, "", test->name,
3f94a25af8b122 Rae Moar 2023-07-25  241  					attr_name, attr_str);
3f94a25af8b122 Rae Moar 2023-07-25  242  			} else {
3f94a25af8b122 Rae Moar 2023-07-25  243  				kunit_log(KERN_INFO, suite, "%*s# %s: %s",
3f94a25af8b122 Rae Moar 2023-07-25  244  					KUNIT_INDENT_LEN * test_level, "", attr_name, attr_str);
3f94a25af8b122 Rae Moar 2023-07-25  245  			}
3f94a25af8b122 Rae Moar 2023-07-25  246  
3f94a25af8b122 Rae Moar 2023-07-25  247  			/* Free to_string of attribute if needed */
3f94a25af8b122 Rae Moar 2023-07-25  248  			if (to_free)
3f94a25af8b122 Rae Moar 2023-07-25  249  				kfree(attr_str);
3f94a25af8b122 Rae Moar 2023-07-25  250  		}
3f94a25af8b122 Rae Moar 2023-07-25  251  	}
3f94a25af8b122 Rae Moar 2023-07-25  252  }
793862a3f94d2f Rae Moar 2023-07-25  253  
793862a3f94d2f Rae Moar 2023-07-25  254  /* Helper Functions to Filter Attributes */
793862a3f94d2f Rae Moar 2023-07-25  255  
793862a3f94d2f Rae Moar 2023-07-25  256  int kunit_get_filter_count(char *input)
793862a3f94d2f Rae Moar 2023-07-25  257  {
793862a3f94d2f Rae Moar 2023-07-25  258  	int i, comma_index, count = 0;
793862a3f94d2f Rae Moar 2023-07-25  259  
793862a3f94d2f Rae Moar 2023-07-25  260  	for (i = 0; input[i]; i++) {
793862a3f94d2f Rae Moar 2023-07-25  261  		if (input[i] == ',') {
793862a3f94d2f Rae Moar 2023-07-25 @262  			if ((i - comma_index) > 1)
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
793862a3f94d2f Rae Moar 2023-07-25  285  			comma_index = i;
793862a3f94d2f Rae Moar 2023-07-25  286  		} else if (comma_index && input[i] != ' ') {
793862a3f94d2f Rae Moar 2023-07-25  287  			new_start_index = i;
793862a3f94d2f Rae Moar 2023-07-25  288  			break;
793862a3f94d2f Rae Moar 2023-07-25  289  		}
793862a3f94d2f Rae Moar 2023-07-25  290  	}
793862a3f94d2f Rae Moar 2023-07-25  291  
793862a3f94d2f Rae Moar 2023-07-25  292  	if (op_index <= 0) {
793862a3f94d2f Rae Moar 2023-07-25  293  		*err = -EINVAL;
793862a3f94d2f Rae Moar 2023-07-25  294  		pr_err("kunit executor: filter operation not found: %s\n", input);
793862a3f94d2f Rae Moar 2023-07-25  295  		return filter;
793862a3f94d2f Rae Moar 2023-07-25  296  	}
793862a3f94d2f Rae Moar 2023-07-25  297  
793862a3f94d2f Rae Moar 2023-07-25  298  	/* Temporarily set operator to \0 character. */
793862a3f94d2f Rae Moar 2023-07-25  299  	op = input[op_index];
793862a3f94d2f Rae Moar 2023-07-25  300  	input[op_index] = '\0';
793862a3f94d2f Rae Moar 2023-07-25  301  
793862a3f94d2f Rae Moar 2023-07-25  302  	/* Find associated kunit_attr object */
793862a3f94d2f Rae Moar 2023-07-25  303  	for (j = 0; j < ARRAY_SIZE(kunit_attr_list); j++) {
793862a3f94d2f Rae Moar 2023-07-25  304  		if (!strcmp(input, kunit_attr_list[j].name)) {
793862a3f94d2f Rae Moar 2023-07-25  305  			attr_index = j;
793862a3f94d2f Rae Moar 2023-07-25  306  			break;
793862a3f94d2f Rae Moar 2023-07-25  307  		}
793862a3f94d2f Rae Moar 2023-07-25  308  	}
793862a3f94d2f Rae Moar 2023-07-25  309  
793862a3f94d2f Rae Moar 2023-07-25  310  	input[op_index] = op;
793862a3f94d2f Rae Moar 2023-07-25  311  
793862a3f94d2f Rae Moar 2023-07-25  312  	if (attr_index < 0) {
793862a3f94d2f Rae Moar 2023-07-25  313  		*err = -EINVAL;
793862a3f94d2f Rae Moar 2023-07-25  314  		pr_err("kunit executor: attribute not found: %s\n", input);
793862a3f94d2f Rae Moar 2023-07-25  315  	} else {
793862a3f94d2f Rae Moar 2023-07-25  316  		filter.attr = &kunit_attr_list[attr_index];
793862a3f94d2f Rae Moar 2023-07-25  317  	}
793862a3f94d2f Rae Moar 2023-07-25  318  
793862a3f94d2f Rae Moar 2023-07-25  319  	if (comma_index) {
793862a3f94d2f Rae Moar 2023-07-25  320  		input[comma_index] = '\0';
793862a3f94d2f Rae Moar 2023-07-25  321  		filter.input = input + op_index;
793862a3f94d2f Rae Moar 2023-07-25  322  		input = input + new_start_index;
793862a3f94d2f Rae Moar 2023-07-25  323  	} else {
793862a3f94d2f Rae Moar 2023-07-25  324  		filter.input = input + op_index;
793862a3f94d2f Rae Moar 2023-07-25  325  		input = NULL;
793862a3f94d2f Rae Moar 2023-07-25  326  	}
793862a3f94d2f Rae Moar 2023-07-25  327  
793862a3f94d2f Rae Moar 2023-07-25  328  	*filters = input;
793862a3f94d2f Rae Moar 2023-07-25  329  
793862a3f94d2f Rae Moar 2023-07-25  330  	return filter;
793862a3f94d2f Rae Moar 2023-07-25  331  }
793862a3f94d2f Rae Moar 2023-07-25  332  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
