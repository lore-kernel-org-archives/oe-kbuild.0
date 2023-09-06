Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06C17E
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Sep 2023 02:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693967426; x=1725503426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GhVXyN/BthzZS27UiUdiAs28KZnvEFlimGQUnMk1Y+g=;
  b=C5lFF30djmuZLaoM2hsNck8n+FPWJtmy/AH9sTQhRtg/pqQWWMUPjuii
   7Y7kQ+xOQNiFdTZ6FoMA8AyMCtqVW/rQUl7NrhYYaTtdLkwJiYhPDihjJ
   xd+6V16PTIjOG5bcoJVi4VBVHaJZKczAApPLf6NnZTCf/yBYCUsf78Mu7
   sxfa5FHkbdYViSdKqqPThq9tUuIRkNlc+D7kk+xjskkio/sG20rsLIKdc
   XArj82nNmVamUXCCARhnpaNVzfHZ39pytb33J7fw1jocCSnLPICMsmQsR
   fGEOH/4yMLeeHdT6Jr7qdiW/YKJftSumKLnai+EdcZvXMd5K8sihAuDiS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="376869441"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="376869441"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 19:30:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="811480888"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="811480888"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Sep 2023 19:30:24 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdiJC-0002N5-1B;
	Wed, 06 Sep 2023 02:30:22 +0000
Date: Wed, 6 Sep 2023 10:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/gpio/consumer.h: linux/err.h is included more than
 once.
Message-ID: <202309061013.msGjGr5T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   65d6e954e37872fd9afb5ef3fc0481bb3c2f20f4
commit: 380c7ba3923c6e471aff0f951a6cf42e8dec2c79 gpiolib: Clean up headers
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230906/202309061013.msGjGr5T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309061013.msGjGr5T-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/gpio/consumer.h: linux/err.h is included more than once.

vim +187 include/linux/gpio/consumer.h

   186	
 > 187	#include <linux/err.h>
   188	#include <linux/kernel.h>
   189	
   190	#include <asm/bug.h>
   191	
   192	static inline int gpiod_count(struct device *dev, const char *con_id)
   193	{
   194		return 0;
   195	}
   196	
   197	static inline struct gpio_desc *__must_check gpiod_get(struct device *dev,
   198							       const char *con_id,
   199							       enum gpiod_flags flags)
   200	{
   201		return ERR_PTR(-ENOSYS);
   202	}
   203	static inline struct gpio_desc *__must_check
   204	gpiod_get_index(struct device *dev,
   205			const char *con_id,
   206			unsigned int idx,
   207			enum gpiod_flags flags)
   208	{
   209		return ERR_PTR(-ENOSYS);
   210	}
   211	
   212	static inline struct gpio_desc *__must_check
   213	gpiod_get_optional(struct device *dev, const char *con_id,
   214			   enum gpiod_flags flags)
   215	{
   216		return NULL;
   217	}
   218	
   219	static inline struct gpio_desc *__must_check
   220	gpiod_get_index_optional(struct device *dev, const char *con_id,
   221				 unsigned int index, enum gpiod_flags flags)
   222	{
   223		return NULL;
   224	}
   225	
   226	static inline struct gpio_descs *__must_check
   227	gpiod_get_array(struct device *dev, const char *con_id,
   228			enum gpiod_flags flags)
   229	{
   230		return ERR_PTR(-ENOSYS);
   231	}
   232	
   233	static inline struct gpio_descs *__must_check
   234	gpiod_get_array_optional(struct device *dev, const char *con_id,
   235				 enum gpiod_flags flags)
   236	{
   237		return NULL;
   238	}
   239	
   240	static inline void gpiod_put(struct gpio_desc *desc)
   241	{
   242		might_sleep();
   243	
   244		/* GPIO can never have been requested */
   245		WARN_ON(desc);
   246	}
   247	
   248	static inline void devm_gpiod_unhinge(struct device *dev,
   249					      struct gpio_desc *desc)
   250	{
   251		might_sleep();
   252	
   253		/* GPIO can never have been requested */
   254		WARN_ON(desc);
   255	}
   256	
   257	static inline void gpiod_put_array(struct gpio_descs *descs)
   258	{
   259		might_sleep();
   260	
   261		/* GPIO can never have been requested */
   262		WARN_ON(descs);
   263	}
   264	
   265	static inline struct gpio_desc *__must_check
   266	devm_gpiod_get(struct device *dev,
   267			 const char *con_id,
   268			 enum gpiod_flags flags)
   269	{
   270		return ERR_PTR(-ENOSYS);
   271	}
   272	static inline
   273	struct gpio_desc *__must_check
   274	devm_gpiod_get_index(struct device *dev,
   275			       const char *con_id,
   276			       unsigned int idx,
   277			       enum gpiod_flags flags)
   278	{
   279		return ERR_PTR(-ENOSYS);
   280	}
   281	
   282	static inline struct gpio_desc *__must_check
   283	devm_gpiod_get_optional(struct device *dev, const char *con_id,
   284				  enum gpiod_flags flags)
   285	{
   286		return NULL;
   287	}
   288	
   289	static inline struct gpio_desc *__must_check
   290	devm_gpiod_get_index_optional(struct device *dev, const char *con_id,
   291					unsigned int index, enum gpiod_flags flags)
   292	{
   293		return NULL;
   294	}
   295	
   296	static inline struct gpio_descs *__must_check
   297	devm_gpiod_get_array(struct device *dev, const char *con_id,
   298			     enum gpiod_flags flags)
   299	{
   300		return ERR_PTR(-ENOSYS);
   301	}
   302	
   303	static inline struct gpio_descs *__must_check
   304	devm_gpiod_get_array_optional(struct device *dev, const char *con_id,
   305				      enum gpiod_flags flags)
   306	{
   307		return NULL;
   308	}
   309	
   310	static inline void devm_gpiod_put(struct device *dev, struct gpio_desc *desc)
   311	{
   312		might_sleep();
   313	
   314		/* GPIO can never have been requested */
   315		WARN_ON(desc);
   316	}
   317	
   318	static inline void devm_gpiod_put_array(struct device *dev,
   319						struct gpio_descs *descs)
   320	{
   321		might_sleep();
   322	
   323		/* GPIO can never have been requested */
   324		WARN_ON(descs);
   325	}
   326	
   327	
   328	static inline int gpiod_get_direction(const struct gpio_desc *desc)
   329	{
   330		/* GPIO can never have been requested */
   331		WARN_ON(desc);
   332		return -ENOSYS;
   333	}
   334	static inline int gpiod_direction_input(struct gpio_desc *desc)
   335	{
   336		/* GPIO can never have been requested */
   337		WARN_ON(desc);
   338		return -ENOSYS;
   339	}
   340	static inline int gpiod_direction_output(struct gpio_desc *desc, int value)
   341	{
   342		/* GPIO can never have been requested */
   343		WARN_ON(desc);
   344		return -ENOSYS;
   345	}
   346	static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
   347	{
   348		/* GPIO can never have been requested */
   349		WARN_ON(desc);
   350		return -ENOSYS;
   351	}
   352	static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
   353						       unsigned long flags)
   354	{
   355		WARN_ON(desc);
   356		return -ENOSYS;
   357	}
   358	static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
   359							unsigned long flags)
   360	{
   361		WARN_ON(desc);
   362		return -ENOSYS;
   363	}
   364	static inline int gpiod_get_value(const struct gpio_desc *desc)
   365	{
   366		/* GPIO can never have been requested */
   367		WARN_ON(desc);
   368		return 0;
   369	}
   370	static inline int gpiod_get_array_value(unsigned int array_size,
   371						struct gpio_desc **desc_array,
   372						struct gpio_array *array_info,
   373						unsigned long *value_bitmap)
   374	{
   375		/* GPIO can never have been requested */
   376		WARN_ON(desc_array);
   377		return 0;
   378	}
   379	static inline void gpiod_set_value(struct gpio_desc *desc, int value)
   380	{
   381		/* GPIO can never have been requested */
   382		WARN_ON(desc);
   383	}
   384	static inline int gpiod_set_array_value(unsigned int array_size,
   385						struct gpio_desc **desc_array,
   386						struct gpio_array *array_info,
   387						unsigned long *value_bitmap)
   388	{
   389		/* GPIO can never have been requested */
   390		WARN_ON(desc_array);
   391		return 0;
   392	}
   393	static inline int gpiod_get_raw_value(const struct gpio_desc *desc)
   394	{
   395		/* GPIO can never have been requested */
   396		WARN_ON(desc);
   397		return 0;
   398	}
   399	static inline int gpiod_get_raw_array_value(unsigned int array_size,
   400						    struct gpio_desc **desc_array,
   401						    struct gpio_array *array_info,
   402						    unsigned long *value_bitmap)
   403	{
   404		/* GPIO can never have been requested */
   405		WARN_ON(desc_array);
   406		return 0;
   407	}
   408	static inline void gpiod_set_raw_value(struct gpio_desc *desc, int value)
   409	{
   410		/* GPIO can never have been requested */
   411		WARN_ON(desc);
   412	}
   413	static inline int gpiod_set_raw_array_value(unsigned int array_size,
   414						    struct gpio_desc **desc_array,
   415						    struct gpio_array *array_info,
   416						    unsigned long *value_bitmap)
   417	{
   418		/* GPIO can never have been requested */
   419		WARN_ON(desc_array);
   420		return 0;
   421	}
   422	
   423	static inline int gpiod_get_value_cansleep(const struct gpio_desc *desc)
   424	{
   425		/* GPIO can never have been requested */
   426		WARN_ON(desc);
   427		return 0;
   428	}
   429	static inline int gpiod_get_array_value_cansleep(unsigned int array_size,
   430					     struct gpio_desc **desc_array,
   431					     struct gpio_array *array_info,
   432					     unsigned long *value_bitmap)
   433	{
   434		/* GPIO can never have been requested */
   435		WARN_ON(desc_array);
   436		return 0;
   437	}
   438	static inline void gpiod_set_value_cansleep(struct gpio_desc *desc, int value)
   439	{
   440		/* GPIO can never have been requested */
   441		WARN_ON(desc);
   442	}
   443	static inline int gpiod_set_array_value_cansleep(unsigned int array_size,
   444						    struct gpio_desc **desc_array,
   445						    struct gpio_array *array_info,
   446						    unsigned long *value_bitmap)
   447	{
   448		/* GPIO can never have been requested */
   449		WARN_ON(desc_array);
   450		return 0;
   451	}
   452	static inline int gpiod_get_raw_value_cansleep(const struct gpio_desc *desc)
   453	{
   454		/* GPIO can never have been requested */
   455		WARN_ON(desc);
   456		return 0;
   457	}
   458	static inline int gpiod_get_raw_array_value_cansleep(unsigned int array_size,
   459						       struct gpio_desc **desc_array,
   460						       struct gpio_array *array_info,
   461						       unsigned long *value_bitmap)
   462	{
   463		/* GPIO can never have been requested */
   464		WARN_ON(desc_array);
   465		return 0;
   466	}
   467	static inline void gpiod_set_raw_value_cansleep(struct gpio_desc *desc,
   468							int value)
   469	{
   470		/* GPIO can never have been requested */
   471		WARN_ON(desc);
   472	}
   473	static inline int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
   474							struct gpio_desc **desc_array,
   475							struct gpio_array *array_info,
   476							unsigned long *value_bitmap)
   477	{
   478		/* GPIO can never have been requested */
   479		WARN_ON(desc_array);
   480		return 0;
   481	}
   482	
   483	static inline int gpiod_set_config(struct gpio_desc *desc, unsigned long config)
   484	{
   485		/* GPIO can never have been requested */
   486		WARN_ON(desc);
   487		return -ENOSYS;
   488	}
   489	
   490	static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned int debounce)
   491	{
   492		/* GPIO can never have been requested */
   493		WARN_ON(desc);
   494		return -ENOSYS;
   495	}
   496	
   497	static inline int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
   498	{
   499		/* GPIO can never have been requested */
   500		WARN_ON(desc);
   501		return -ENOSYS;
   502	}
   503	
   504	static inline void gpiod_toggle_active_low(struct gpio_desc *desc)
   505	{
   506		/* GPIO can never have been requested */
   507		WARN_ON(desc);
   508	}
   509	
   510	static inline int gpiod_is_active_low(const struct gpio_desc *desc)
   511	{
   512		/* GPIO can never have been requested */
   513		WARN_ON(desc);
   514		return 0;
   515	}
   516	static inline int gpiod_cansleep(const struct gpio_desc *desc)
   517	{
   518		/* GPIO can never have been requested */
   519		WARN_ON(desc);
   520		return 0;
   521	}
   522	
   523	static inline int gpiod_to_irq(const struct gpio_desc *desc)
   524	{
   525		/* GPIO can never have been requested */
   526		WARN_ON(desc);
   527		return -EINVAL;
   528	}
   529	
   530	static inline int gpiod_set_consumer_name(struct gpio_desc *desc,
   531						  const char *name)
   532	{
   533		/* GPIO can never have been requested */
   534		WARN_ON(desc);
   535		return -EINVAL;
   536	}
   537	
   538	static inline struct gpio_desc *gpio_to_desc(unsigned gpio)
   539	{
   540		return NULL;
   541	}
   542	
   543	static inline int desc_to_gpio(const struct gpio_desc *desc)
   544	{
   545		/* GPIO can never have been requested */
   546		WARN_ON(desc);
   547		return -EINVAL;
   548	}
   549	
   550	static inline
   551	struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
   552						 const char *con_id, int index,
   553						 enum gpiod_flags flags,
   554						 const char *label)
   555	{
   556		return ERR_PTR(-ENOSYS);
   557	}
   558	
   559	static inline
   560	struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
   561						      struct fwnode_handle *fwnode,
   562						      const char *con_id, int index,
   563						      enum gpiod_flags flags,
   564						      const char *label)
   565	{
   566		return ERR_PTR(-ENOSYS);
   567	}
   568	
   569	#endif /* CONFIG_GPIOLIB */
   570	
   571	static inline
   572	struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
   573						struct fwnode_handle *fwnode,
   574						const char *con_id,
   575						enum gpiod_flags flags,
   576						const char *label)
   577	{
   578		return devm_fwnode_gpiod_get_index(dev, fwnode, con_id, 0,
   579						   flags, label);
   580	}
   581	
   582	struct acpi_gpio_params {
   583		unsigned int crs_entry_index;
   584		unsigned int line_index;
   585		bool active_low;
   586	};
   587	
   588	struct acpi_gpio_mapping {
   589		const char *name;
   590		const struct acpi_gpio_params *data;
   591		unsigned int size;
   592	
   593	/* Ignore IoRestriction field */
   594	#define ACPI_GPIO_QUIRK_NO_IO_RESTRICTION	BIT(0)
   595	/*
   596	 * When ACPI GPIO mapping table is in use the index parameter inside it
   597	 * refers to the GPIO resource in _CRS method. That index has no
   598	 * distinction of actual type of the resource. When consumer wants to
   599	 * get GpioIo type explicitly, this quirk may be used.
   600	 */
   601	#define ACPI_GPIO_QUIRK_ONLY_GPIOIO		BIT(1)
   602	/* Use given pin as an absolute GPIO number in the system */
   603	#define ACPI_GPIO_QUIRK_ABSOLUTE_NUMBER		BIT(2)
   604	
   605		unsigned int quirks;
   606	};
   607	
   608	#if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_ACPI)
   609	
   610	int acpi_dev_add_driver_gpios(struct acpi_device *adev,
   611				      const struct acpi_gpio_mapping *gpios);
   612	void acpi_dev_remove_driver_gpios(struct acpi_device *adev);
   613	
   614	int devm_acpi_dev_add_driver_gpios(struct device *dev,
   615					   const struct acpi_gpio_mapping *gpios);
   616	
   617	struct gpio_desc *acpi_get_and_request_gpiod(char *path, unsigned int pin, char *label);
   618	
   619	#else  /* CONFIG_GPIOLIB && CONFIG_ACPI */
   620	
 > 621	#include <linux/err.h>
   622	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
